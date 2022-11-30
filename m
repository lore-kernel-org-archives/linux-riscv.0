Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB927C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 00:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmXVEMSYIQpYfVPgw5q9xF6vaA/q0nVzd9AtJo/6zFU=; b=DYqZQ8vMv/8+Rl
	Hx5Lkd6jTCXzIECfNyyefTco+kZz13jxGqVHU2Ns80ovvNFfHuR24zh7vSnQXk/15kcjDHdZS6M5v
	1ZL2nQDzmtOi2REu0q01IT1qnTK+KhRuiuVDMZ21RlNwhqel5+1+cNaNdUVQ+LDL3DhQVrDVM/ZGF
	plDlZI1Jx5NlvxnRiekG1DoSPy+EQryGbJjarEiXbuAzumfpozC5asjlqEaQB950TK3WjaQ7eH8FK
	48UDYoUUDWu2fvc/1s2xZNaj4a74G0UOsi3wJNPI6nAjO0xKf04pfreL9FKyx6ZO+nCrM6DLdfsiu
	kW+E2Ob9DtX9v5YyZNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0XB9-003WzE-FN; Thu, 01 Dec 2022 00:11:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WiH-003JmS-3W
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:42:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E70661E58;
	Wed, 30 Nov 2022 23:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF770C43140;
	Wed, 30 Nov 2022 23:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669851719;
	bh=pFJPFr1bYR15HN/6Ql3O3Nqt1/yhoHZv7oRl5CFhYeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BfN7AZujL3v4Pw7dJ191/MllgmRUWFI98V/rTAYbF3N3CbKhzBPc25dHL5sTJYdMw
	 w2JWddwtc/WP32pzOSYOmX3NV4bz4Cr+0bglMeVKBJa93VxHHHvqYk4rCtYGDWGpbR
	 UvMzijLaqrKCYQkFw889UBx2mgpEp47UixWb34+2J5axA4ua6hBirhQh4HQ6qASDjz
	 j62GI9CVGXcUI6xJtjy5Pjbs12QjnAZF5NLgtoKLNpef2ixQ1PRVovvGBRFWRQJEEU
	 Cmk/1eAeufueb8lVEX72VFfRPApG0msXg1CFc+gfipCCUvhwNYib4YWqADLkCJ27g7
	 Lc/za5OEOtYDg==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	conor@kernel.org,
	corbet@lwn.net,
	guoren@kernel.org,
	heiko@sntech.de,
	paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v1 1/3] RISC-V: clarify ISA string ordering rules in cpu.c
Date: Wed, 30 Nov 2022 23:41:24 +0000
Message-Id: <20221130234125.2722364-2-conor@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130234125.2722364-1-conor@kernel.org>
References: <20221130234125.2722364-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_154201_300050_391ADF8C 
X-CRM114-Status: GOOD (  18.17  )
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

From: Conor Dooley <conor.dooley@microchip.com>

While the current list of rules may have been accurate when created
it now lacks some clarity in the face of isa-manual updates. Instead of
trying to continuously align this rule-set with the one in the
specifications, change the role of this comment.

This particular comment is important, as the array it "decorates"
defines the order in which the ISA string appears to userspace in
/proc/cpuinfo.

Re-jig and strengthen the wording to provide contributors with a set
order in which to add entries & note why this particular struct needs
more attention than others.

While in the area, add some whitespace and tweak some wording for
readability's sake.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpu.c | 49 ++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 852ecccd8920..68b2bd0cc3bc 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -120,22 +120,45 @@ device_initcall(riscv_cpuinfo_init);
 		.uprop = #UPROP,				\
 		.isa_ext_id = EXTID,				\
 	}
+
 /*
- * Here are the ordering rules of extension naming defined by RISC-V
- * specification :
- * 1. All extensions should be separated from other multi-letter extensions
- *    by an underscore.
- * 2. The first letter following the 'Z' conventionally indicates the most
+ * The canonical order of ISA extension names in the ISA string is defined in
+ * chapter 27 of the unprivileged specification.
+ *
+ * Ordinarily, for in-kernel data structures, this order is unimportant but
+ * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.
+ *
+ * The specification uses vague wording, such as should, when it comes to
+ * ordering so for our purposes the following rules apply:
+ *
+ * 1. All multi-letter extensions must be separated from other multi-letter
+ *    extensions by an underscore.
+ *
+ * 2. Additional standard extensions (starting with 'Z') must be sorted after
+ *    single-letter extensions and before any higher-privileged extensions.
+
+ * 3. The first letter following the 'Z' conventionally indicates the most
  *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
- *    If multiple 'Z' extensions are named, they should be ordered first
- *    by category, then alphabetically within a category.
- * 3. Standard supervisor-level extensions (starts with 'S') should be
- *    listed after standard unprivileged extensions.  If multiple
- *    supervisor-level extensions are listed, they should be ordered
+ *    If multiple 'Z' extensions are named, they should be ordered first by
+ *    category, then alphabetically within a category.
+ *
+ * 3. Standard supervisor-level extensions (starting with 'S') must be listed
+ *    after standard unprivileged extensions.  If multiple
+ *    supervisor-level extensions are listed, they must be ordered
  *    alphabetically.
- * 4. Non-standard extensions (starts with 'X') must be listed after all
- *    standard extensions. They must be separated from other multi-letter
- *    extensions by an underscore.
+ *
+ * 4. Standard machine-level extensions (starting with 'Zxm') must be listed
+ *    after any lower-privileged, standard extensions.  If multiple
+ *    machine-level extensions are listed, they must be ordered
+ *    alphabetically.
+ *
+ * 5. Non-standard extensions (starts with 'X') must be listed after all
+ *    standard extensions.
+ *
+ * An example string following the order is:
+ *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
+ *
+ * New entries to this struct should follow the ordering rules described above.
  */
 static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
