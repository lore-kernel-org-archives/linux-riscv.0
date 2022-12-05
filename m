Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8D6C47088
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 14:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCv7igZ2/dd+GcJWZrDWAZ1OQJIJ2hccF0JEAIPkYwU=; b=Ue2oIkj1mv50Hp
	ucC5H3sN6714Vze3Bp1JtD69YD0FH6daaMh6bcv9pyO8j2Bj8rqYjavZ9hcld9KvUOXAoxO6Gq3dO
	VrVToQs4RHyey9bqjCM6REEsHhkDGXcVc8xGkacF+Qd/2b7fo80cLUBjxFv1yENHtrkruvfwnU5eI
	eTLwPgkG+qW7kLs7NznkIJGimvz7uXC9cbs8E3BLcI/4+P/AIYB8ZruDwS0RYUur55D6Se1piOXKM
	IAP/7SF2XGVjULYsdQcEwoeGG0af8kvNZ1aoHNEGQbGJP0uxOtX8C7fHKO0QP88d43LWSWLd090b0
	ZZEnaTEFDiZ4wZYRg6Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Cji-004C36-L8; Mon, 05 Dec 2022 14:46:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Cjc-004Bqf-W7
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 14:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1670251580; x=1701787580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/A732PXUzOa5QEDZseaW4QKYJ4f5uZaINwwbpO826ps=;
  b=chre1jnIITo7PhLcj4OZ2TN242L2dedL0BZRQaQSHt3fyTJRv5v8aDhe
   k2ccZBqGzscEd3MayzyyCs+ZTjcQsro7bdfrjmzhjLF3Jf+Qyy/LmecLi
   LCU6URRLu3CygGCVOkjlvgR+xzij/AauP0w/CSZF2zfhsqjg8LO4/xzEq
   rkImSiCIQtTWQmUNBvuvqPy9gJsZkjYtaeeBpVhxM78HyS+Lv9RdXDAvG
   KwVU4kQ4O+Ynn4aEboW+wQn0WCawJbfZpR9OrMdsYTmBMrsMt8eybZWyk
   QD5UietXi2S+872qeiVe4c8Q1bzaRYksHR8Ifwmr38XAEChByFG6bUadE
   w==;
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="202640917"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Dec 2022 07:46:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Dec 2022 07:46:14 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 5 Dec 2022 07:46:12 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>, <ajones@ventanamicro.com>,
	<aou@eecs.berkeley.edu>, <conor@kernel.org>, <corbet@lwn.net>,
	<guoren@kernel.org>, <heiko@sntech.de>, <paul.walmsley@sifive.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v2 1/3] RISC-V: clarify ISA string ordering rules in cpu.c
Date: Mon, 5 Dec 2022 14:45:24 +0000
Message-ID: <20221205144525.2148448-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205144525.2148448-1-conor.dooley@microchip.com>
References: <20221205144525.2148448-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_064621_072444_5747E0E3 
X-CRM114-Status: GOOD (  14.50  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpu.c | 49 ++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 1b9a5a66e55a..db8b16ad9342 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -144,22 +144,45 @@ arch_initcall(riscv_cpuinfo_init);
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
+ * ordering, so for our purposes the following rules apply:
+ *
+ * 1. All multi-letter extensions must be separated from other extensions by an
+ *    underscore.
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
+ *    If multiple 'Z' extensions are named, they must be ordered first by
+ *    category, then alphabetically within a category.
+ *
+ * 3. Standard supervisor-level extensions (starting with 'S') must be listed
+ *    after standard unprivileged extensions.  If multiple supervisor-level
+ *    extensions are listed, they must be ordered alphabetically.
+ *
+ * 4. Standard machine-level extensions (starting with 'Zxm') must be listed
+ *    after any lower-privileged, standard extensions.  If multiple
+ *    machine-level extensions are listed, they must be ordered
  *    alphabetically.
- * 4. Non-standard extensions (starts with 'X') must be listed after all
- *    standard extensions. They must be separated from other multi-letter
- *    extensions by an underscore.
+ *
+ * 5. Non-standard extensions (starting with 'X') must be listed after all
+ *    standard extensions. If multiple non-standard extensions are listed, they
+ *    must be ordered alphabetically.
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
