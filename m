Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30D6D46BFB
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bk5P7z3ThzBpvxOmv/BGoD5VVkEmbZk3DWDracP3XWQ=; b=0CyrYMwKoeMUxv
	7Sy6IrQhpY2jC5nsIPwe0vvsVeOvGjePOWjDokNhzf51a6fV5hTmQBH1aJ5/dL06OlGtCRKYE3zc5
	/RISkYvNyoJP16pBerb8YzfsDqmfqSxtoqsdgxNhoIQKy/c3OTA/Gd+zf1alYNTzKDaXXahrS8ZjX
	2uWjCkuAX0fFGoJFSL46KByH4xBycKGBgjlcYjxGg7im1WAkXmUVavbMc3uewgA1Q0RPu1tvivXot
	nOa6p6qRjk1L9zcieJhEb1RtXYiaiHrrIHrzBTA/tnCFvr0ta0WOiTf093KC1FOldCt0ai85lSKCd
	YDEayuvWjemHkRLjOb2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC9O-0000000GkLC-30Kd;
	Wed, 28 Jan 2026 20:28:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC97-0000000Gk7n-1HyI
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:28:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EAAFE44530;
	Wed, 28 Jan 2026 20:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1B4C19421;
	Wed, 28 Jan 2026 20:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632092;
	bh=2p876OLLX8prfj4iRVt0MftQApA/Ndfp5I0kmihgDv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nvNmYpXNTrs2Gd+j6e50jmN2l9Z23bYLF6ssVdaiXzTPbUxc1qT0mjM+DcxcHugJA
	 J/87PsgTsnafBZfhqlt4m2QgOzifGKJFseryVtiSaY/M0PZYJrWd3Zv+x6wuWpMVbc
	 a1FuXbEM4c1p717fgARM4pWgqSQ/6nuzP/cOqvACY6mrFevw2R7SPPJXKH407qNmfj
	 p0xLmcEpdgDon99ai9bazDER0LJA7+06Vrm4HlSAQdMY5mHWpeFfHtKjcFyPq/YjCS
	 TdH8SRbUVexwp+kUyzm/u5LFPIRobL4hdKcn85jEL3DIxztlARfclD0EkOvOxPxA7G
	 eqS2ZdeZ/bEiw==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 28 Jan 2026 12:27:38 -0800
Subject: [PATCH RFC v2 17/17] acpi: riscv: Add support for RISC-V Quality
 of Service Controller (RQSC)
MIME-Version: 1.0
Message-Id: <20260128-ssqosid-cbqri-v2-17-dca586b091b9@kernel.org>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
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
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, Rob Herring <robh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1324; i=fustini@kernel.org;
 h=from:subject:message-id; bh=2p876OLLX8prfj4iRVt0MftQApA/Ndfp5I0kmihgDv8=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWRWFQbtj1tz8omO0oPqJVoaSzVyZ5XOXdDCNGlde9i+1
 cb+1ue5O0pZGMS4GGTFFFk2fci7sMQr9OuC+S+2wcxhZQIZwsDFKQATSbnM8FfULF18ztyD7n2W
 pqyZ+yauDr77hnXnoYku5rIKxUJ/WFcyMhy7rmJWJHzzwKmlUrNj/W1SknNrz7VFH7jXoNB0Qjb
 wEgcA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_122813_422954_F5EE5310 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

Enable support for the RQSC table which describes the capacity and
bandwidth QoS (CBQRI) controllers in a system.

Link: https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
Link: https://github.com/riscv-non-isa/riscv-rqsc/blob/main/src/
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 drivers/acpi/riscv/init.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/acpi/riscv/init.c b/drivers/acpi/riscv/init.c
index 7c00f7995e86..784fa0c56516 100644
--- a/drivers/acpi/riscv/init.c
+++ b/drivers/acpi/riscv/init.c
@@ -6,10 +6,29 @@
 
 #include <linux/acpi.h>
 #include "init.h"
+#include <linux/riscv_qos.h>
 
 void __init acpi_arch_init(void)
 {
+	struct acpi_table_header *rqsc;
+	acpi_status status;
+	int rc;
+
 	riscv_acpi_init_gsi_mapping();
+
 	if (IS_ENABLED(CONFIG_ACPI_RIMT))
 		riscv_acpi_rimt_init();
+
+	if (!acpi_disabled) {
+		status = acpi_get_table(ACPI_SIG_RQSC, 0, &rqsc);
+		if (ACPI_FAILURE(status)) {
+			pr_err("%s(): failed to find ACPI RQSC table: %d", __func__,
+			       ACPI_FAILURE(status));
+		} else {
+			rc = acpi_parse_rqsc(rqsc);
+			if (rc < 0)
+				pr_err("%s(): failed to parse ACPI RQSC table: %d", __func__, rc);
+		}
+		acpi_put_table((struct acpi_table_header *)rqsc);
+	}
 }

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
