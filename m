Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC57CD5BB4
	for <linux-riscv@archiver.kernel.org>; Sun, 24 May 2026 23:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHTyYsmdZjbAYPCkQYcl/XyF1m+xZqwC6x6xgBkp/pQ=; b=F6/zOOixKl/gda
	6Lg+8fxPFotBq+6Xx+9EtkQlKvLlkFV20Er6NxUhTD8pqPTU+dKoKWl9NITjnamhB9CRbnhKht47A
	EkdqKDmfClsKr5v465mrQmmjNHvm5bb9ZOc0p64jCdarY04m2atdN++Mehwz9NXAl+4s++LQBU4CD
	tELciC2RGO0JlXJywZle7OFDkPkv+rt4oAVV//7iamVIUH6UmY+10bnlcwBPyPZdMkHOHMOP9mKAq
	UqwgGuIsPghbhdigmquoPEPoPpbIcV3RDFqgyVUKgjlTCUOGPdsynxJ7c/yzPbW2A5BkwTCZ8hzMO
	j2dQdpm9M+8+3+bYiHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRIhY-0000000FsaS-38Ja;
	Sun, 24 May 2026 23:57:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRIhU-0000000FsXu-2ewV
	for linux-riscv@lists.infradead.org;
	Sun, 24 May 2026 23:57:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE6574365B;
	Sun, 24 May 2026 23:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A18A1F01568;
	Sun, 24 May 2026 23:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779667063;
	bh=6zw1YkJkBQFnyL3MGMXlh5Ks8e9UJTAJTqAov2MLs5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ye5sMmL9MvPLy4QfN7iXXEipJR2VhITZAPpXP06Z2vvZ3c7qP4KCh5TTwrjB3RYZZ
	 syHszdVVwc2HvZCoRdhhP2+L5acx8CYvrYmfc2tNqz1JpUg3L0ejflI+9+auQkvz60
	 R4AaainoxWsKoi0bSxeUi2+a+QI1lBRNXj1unpLtN5Is0gmClse40PAFukhf3NiVW9
	 IugmUW+jGdiL/TI6X3aRWd9Q54JODyqzujrLrp35eTKTamTfNeeJxILloeJ/9C7+xk
	 e4Xn4mIr/rp9ztLfCX6nQmSnq5vhjC3GtjPQXbodfzUODlpluRKPgA9Uo92tSn1aCC
	 3s9TOSQ8/QgFQ==
From: Drew Fustini <fustini@kernel.org>
Date: Sun, 24 May 2026 16:55:47 -0700
Subject: [PATCH RFC v5 17/18] ACPI: RISC-V: Add support for RISC-V Quality
 of Service Controller (RQSC)
MIME-Version: 1.0
Message-Id: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-17-78d3a7ba9dbe@kernel.org>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org>
In-Reply-To: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, Gong Shuai <gong.shuai@sanechips.com.cn>, 
 Gong Shuai <gsh517@gmail.com>, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Drew Fustini <fustini@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706; i=fustini@kernel.org;
 h=from:subject:message-id; bh=J9k+kdxn9VBh2gcTNNCv4EIpVuWkTdzFDdzbka+fNg8=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWQJT8ha1/b1f0v1xHCW0Mk11ZqaUh9/9sS67OIQVFo/N
 /f79n2CHaUsDGJcDLJiiiybPuRdWOIV+nXB/BfbYOawMoEMYeDiFICJ8N5hZFjM41590WlqqzH/
 H5/3POltdc0GcrN2dumIVPjMlGw61MjIsLPlglSu6ZGY+VeKnrVsdilbdPl9xL19ols7G25OfJh
 eyQQA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_165744_718190_C1407A4E 
X-CRM114-Status: GOOD (  13.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Call acpi_parse_rqsc() from acpi_arch_init() to discover CBQRI
controllers when an RQSC table is present.

Gate on CONFIG_RISCV_CBQRI_DRIVER rather than CONFIG_RISCV_ISA_SSQOSID
so a kernel built with the ISA extension but without the driver (e.g.
RESCTRL_FS=n) does not walk the table and print a misleading "found 0
CBQRI controllers" line on every boot.

Link: https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
Link: https://github.com/riscv-non-isa/riscv-rqsc/blob/main/src/
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 drivers/acpi/riscv/init.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/acpi/riscv/init.c b/drivers/acpi/riscv/init.c
index 7c00f7995e86..129ebfae28be 100644
--- a/drivers/acpi/riscv/init.c
+++ b/drivers/acpi/riscv/init.c
@@ -5,11 +5,32 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include "init.h"
+#include "rqsc.h"
 
 void __init acpi_arch_init(void)
 {
 	riscv_acpi_init_gsi_mapping();
+
 	if (IS_ENABLED(CONFIG_ACPI_RIMT))
 		riscv_acpi_rimt_init();
+
+	if (IS_ENABLED(CONFIG_RISCV_CBQRI_DRIVER)) {
+		struct acpi_table_header *rqsc __free(acpi_put_table) = NULL;
+		acpi_status status = acpi_get_table(ACPI_SIG_RQSC, 0, &rqsc);
+
+		if (status == AE_NOT_FOUND) {
+			/* RQSC is optional. Silence on systems without it. */
+		} else if (ACPI_FAILURE(status)) {
+			pr_err("RQSC: failed to get table: %s\n",
+			       acpi_format_exception(status));
+		} else {
+			int rc = acpi_parse_rqsc(rqsc);
+
+			if (rc < 0)
+				pr_err("RQSC: failed to parse table: %d\n",
+				       rc);
+		}
+	}
 }

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
