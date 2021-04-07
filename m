Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CFAC433B4
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 11:57:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B160F61139
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 11:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B160F61139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bpLjJdYXx2rKy9jiD6dF/PZC2ZWQTwC7ly155UUEch0=; b=cz1cvtNfm8az0Z87CGAuJG/yi
	6qU1UrSkNYUbQRnRUyF4iOQ76m7xveaGaOMSoEtbf+8l/5a9ljx91FiQKJyuwFSQlOQDvg8hbRO7i
	Iya5RiiNmwghC4tjJm20loznFVjQY1iB1tB3C3Yjd59VTMcIYxSFje1c6t3qURCQC3+vJH2vszTYM
	AsMgkVc4dMLdAhcLT9aXdsehSLZsQHxE+n9TayHsUDO5/AcAvD5o+nqJVuLkXKi4QmdOPaJ5PcuXw
	9nifzshQXrOiWiX0CmUUuiuZeCP8kCPkOHTBg3XQ63Opm8OtKyotn0Io2fL/P+Pc+PtBUDi8kDrOQ
	pJAJF13cA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU6o9-004vXy-MD; Wed, 07 Apr 2021 11:57:17 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU6o2-004vVq-UB
 for linux-riscv@lists.infradead.org; Wed, 07 Apr 2021 11:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617796631; x=1649332631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H5pI3ie5XSFSAQDc8gf+PA4Da275zUOynoSsfmXEaiQ=;
 b=HRy2g2EWyOLUP7cbqT24M29eaMUiqqMilqVEWpG5I7YMVlTr/4iLkhUb
 p69G0YZ8wLal9Qg1Emls0xWB/IwiJFIe++mlJ29iKrAkUGIhlK2GNuWda
 gfN2oh2X18qbeEnDtnl7yada8x7m/bnhYgZnTmFpN8EFGMxIHfjPQs90v
 ZRzpMYumsuCCG78HKdPqNMZFgsVFrkJ5b/+uY/BVVpQnXQ+s1a3RRKhAR
 r37aK+m5rv9i2m6a8LMD+fKSqvwdf20u4fZlOE5GJw9/B/w97ouRKw+36
 hpfaA2iXdTbFCep13skpmL70CbD6CaJuTIQqsBfvje8oXaO3FhbAahvGr w==;
IronPort-SDR: XVA6SwM44x27VdeecJQ2Hlhz2EXUA50iIA0241YfMy1z6x7Exhz2SLeT9r1ZMNZTrNTGD5cn86
 vnbFbgvwQ6Qeb5kvSka0LT2/xDUoQb62gNRiDC49L9yYHJ5LdmtnFFbOMK+lUvUpsEpUPogDQQ
 JrOY0LfNZNAslJOM1WMfBieiYTKiuUrE4RqHiCT1NUiojB6ljHh+ALO0GdtIthCnymUz21nOMI
 VE+ThaKl5Ks1uPNoSz0PeUtdPaSL2JiO7384sJfNP5FLdHqdnqcEWV4RVRyym77pjJJCt0/rZv
 Pkc=
X-IronPort-AV: E=Sophos;i="5.82,203,1613404800"; d="scan'208";a="164061578"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2021 19:56:48 +0800
IronPort-SDR: y8YH9uqkSdZOSv/JwLpq3CoCkUEOPwj0jDV6NXMNI2zVVIB7ZG9Y1xck3elU40rJ6tCsTp/aeJ
 +j7LfZeY6yZhAgnxloX5jGA3fMiRkAaJex2bjVzNkEjtveedfEqLT7yuWK8iyouFecBTxjAgt5
 skxRLJB4W3YqfBrdV/br+U4UVnXEGAMAInObZl2/y70+fHHyucVFSXE8Ve4rCtait+VuxFpqI+
 eYsz88zBChcQiFKqYKTpDk0awdq/jCb1mWLZsWjk+cyl51G/ygAgTKibSiurq7OPnqEGg0QYK5
 quSS4LVlLbU37LnsjAD0cYpO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 04:38:07 -0700
IronPort-SDR: 9e2jbEm8D1doKxEIYX3CmwvGDbWmBBGVjWx1JrOmMxjBeG/PY90cnZBcFhnunFZpyiXM6MnEQz
 KqCqa9m0k7FMtMK1KvCw60ICbcn3VdT/i0zly4dDsaf9LzZCWS7VgBaxoPSs9prS+ids7c73dX
 plYX4luXIOMQ0GC/jOhv3hvfqIkcaRIB9cpSi+WRaQauTFlfPE6e2oIOUVY5PKdVLl32TpPoiu
 i7Sp+CSG4Vnrp6OfXPrF7DC2pVZ+McGLU6uEC1dWRoBdrp3mgKuwvWzFmiPh6fxV6L2ZaASefK
 s0Y=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.90])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Apr 2021 04:56:47 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Anup Patel <anup.patel@wdc.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH 2/2] riscv: introduce asm/flat.h
Date: Wed,  7 Apr 2021 20:56:38 +0900
Message-Id: <20210407115638.1055824-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210407115638.1055824-1-damien.lemoal@wdc.com>
References: <20210407115638.1055824-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_125712_118431_18AB31A3 
X-CRM114-Status: GOOD (  14.90  )
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

uclibc/gcc combined with elf2flt riscv linker file fully resolve the
PC relative __global_pointer$ value at compile time and do not generate
a relocation entry to set a runtime gp value. As a result, if the
flatbin loader introduces a gap between the text and data sections, the
gp value becomes incorrect and prevent correct execution of a flatbin
executable. Avoid this problem by introducing the file asm/flat.h
and defining the macro FLAT_TEXT_DATA_NO_GAP to indicate that the text
and data sections must be loaded at contiguous addresses.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/include/asm/Kbuild |  1 -
 arch/riscv/include/asm/flat.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/flat.h

diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 445ccc97305a..a8b54a3f4c2b 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 generic-y += early_ioremap.h
 generic-y += extable.h
-generic-y += flat.h
 generic-y += kvm_para.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/riscv/include/asm/flat.h b/arch/riscv/include/asm/flat.h
new file mode 100644
index 000000000000..43bccf090fd1
--- /dev/null
+++ b/arch/riscv/include/asm/flat.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_FLAT_H
+#define _ASM_RISCV_FLAT_H
+
+#include <asm/unaligned.h>
+
+static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
+					u32 *addr)
+{
+	*addr = get_unaligned((__force u32 *)rp);
+	return 0;
+}
+
+static inline int flat_put_addr_at_rp(u32 __user *rp, u32 addr, u32 rel)
+{
+	put_unaligned(addr, (__force u32 *)rp);
+	return 0;
+}
+
+/*
+ * uclibc/gcc fully resolve the PC relative __global_pointer value
+ * at compile time and do not generate a relocation entry to set a
+ * runtime gp value. As a result, the flatbin loader must not introduce
+ * a gap between the text and data sections and keep them contiguous to
+ * avoid invalid address accesses.
+ */
+#define FLAT_TEXT_DATA_NO_GAP	(1)
+
+#endif /* _ASM_RISCV_FLAT_H */
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
