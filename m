Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FEFC54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 09:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S4X+P3WYbB17he7WIB5vcuI/RLyjqC+YdhaBlXEDaTs=; b=Zgfvdcz29o0M5B
	CjLDqv92GFiFF/ymQvnwGeayzlwEDKgKJx7QsW51ulocqzh+Rf1j4blpq7hkfuKas5BOqZLaJaUei
	MR4xXdVQgmZmQnVf8gft2a/OFewZySaTmPA1eV7f5aI7Vhq80wBBYGol+M/+weDM+W02uelDElqAn
	Wz6e6CkDCICrm1p8nHQ0IFrF8rJMkh5uZXzsRcIj0flGz2RmnQoRXPRhSpyTJJh2fuhe9sY/hNbtD
	+vs2S2cy3ryCl0dl6P6pQHkg0CP5X2POJ2sqVjcUTv+QFl/gEUeDOqw7da+oVNBCOrLMxXNVkKM+F
	4n6SlNPcui5g5QBNozOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKzU-00000009WGP-0aVU;
	Wed, 13 Mar 2024 09:33:40 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKzR-00000009WFx-19LF
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 09:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710322417; x=1741858417;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HNoTeqv9uJwisu7mHmCgim+mSM6YtYt4TVzSQfLCs3A=;
  b=gLBWw4/FlfpFBEEAd6drpWLmYr5uNaP0Ohn2JpOPfXae/ywkImR0xRRI
   fvKWu6bcq/0kPddJirUbfHP21qzgIZosbpSEKHCeKkLALaxQOKcLTh7FK
   fPV/KEuG926ODn6idDGKCvbR0EdL+28FB+yB50YLvYNmDdP0GscsV53+N
   4HpIo1c4FLevKRpMDvV4YKqHc6c9Ht/VbwYZVD/GvVIg97cASHJaCm8KF
   BSRJG9pnGoWpurI0gHxmi1DFsnna8pe8hg5IJtA2g6kZ10Bb7wfoPcgsD
   WfUZbR/OjtP8mu7HTfKVqJox1bzjRBFT3V/GnnkLNVrtFEVGL8NS3Q+Sh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4931197"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="4931197"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 02:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="12431369"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by orviesa008.jf.intel.com with ESMTP; 13 Mar 2024 02:16:00 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: jerry.shih@sifive.com,
	nick.knight@sifive.com,
	ajones@ventanamicro.com,
	bjorn@rivosinc.com,
	andy.chiu@sifive.com,
	viro@zeniv.linux.org.uk,
	cleger@rivosinc.com,
	alexghiti@rivosinc.com,
	haicheng.li@intel.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH] riscv: uaccess: Relax the threshold for fast path
Date: Wed, 13 Mar 2024 17:19:29 +0800
Message-Id: <20240313091929.4029960-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_023337_374584_920927DD 
X-CRM114-Status: UNSURE (   9.38  )
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

The bytes copy for unaligned head would cover at most SZREG-1 bytes, so
it's better to set the threshold as >= (SZREG-1 + word_copy stride size)
which equals to 9*SZREG-1.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
 arch/riscv/lib/uaccess.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index bc22c078aba8..2e665f8f8fcc 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -44,7 +44,7 @@ SYM_FUNC_START(fallback_scalar_usercopy)
 	 * Use byte copy only if too small.
 	 * SZREG holds 4 for RV32 and 8 for RV64
 	 */
-	li	a3, 9*SZREG /* size must be larger than size in word_copy */
+	li	a3, 9*SZREG-1 /* size must >= (word_copy stride + SZREG-1) */
 	bltu	a2, a3, .Lbyte_copy_tail
 
 	/*
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
