Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE32C54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 10:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P0JL6ohjtnDlEe2WNRtUBsXZZ1W8M97yYoS8kN4+eEU=; b=B5Wqh7uB4Ah45H
	m/eHLyoWpd04BZvV/selRWOytcX9AJ2MgXKHKmsSPsUvaFCPMmh/+0Fs+XHkm3vhLvFrbxjaMUMQ9
	qXFxPJNO856O7U9SjsHAZSoBkepuHMyyUYD/riNmMLKRjOw0hk9FvDS1RYgMx1p8AjvMlog/LwwmO
	h5veEKvfAov0wVp4FHIkrOcVev5kyf0DXG4o+Dl9B7d3D1bfR3gxZ1+BsuQOdooc6wXjK87LiSNse
	+odntp3UIS422Jl5+Y+UBalPQQlx5AH3m9xICPlnmohs2KoKs+ji5BL5ZxEYRGbSB+q4aGWdlLbmx
	GjJDbNhhlpCOMlxqCEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkLry-00000009gM5-2voV;
	Wed, 13 Mar 2024 10:29:58 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkLru-00000009gKm-2fGO
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 10:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710325795; x=1741861795;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ezE2f0FsYk3tRVBf2Lqw/FnuOLfDSFbhqIpCHKJemDA=;
  b=RLz3oKo9L3by0ZaFyx+sz+jnnEFJ3a8e9GDPzjiwcnjQ4EkHpVL+ITcZ
   HowCeAGLbzouIVqJM0Lo42l3pZqO6k0l3nRGpv8B/0IANWCWGdoNbGdbv
   r+kkwpKpeQoBimPbyExPJ1D4S8XRJIctbdBDwzjBFeTXRQXcgKyo/gAni
   ZGvmFbxwBHKf9hF7RrrQ3T/WdaKOxZJxtdGLHjTE/s7/hNO5kTD+WbpJI
   6hvqaL9zHCjSd/ySPAs1zoUwc29TucwrLqIBzvqh8A/yWANbCeLUt2+m9
   5xFCEo83dmak1sahGoE6rWUVNgEog5dRcXE0JoKkZsMKaZN/VD348xJCo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="15805167"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="15805167"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 03:29:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="11937824"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmviesa006.fm.intel.com with ESMTP; 13 Mar 2024 03:29:29 -0700
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
	akira.tsukamoto@gmail.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH] riscv: uaccess: Allow the last potential unrolled copy
Date: Wed, 13 Mar 2024 18:33:34 +0800
Message-Id: <20240313103334.4036554-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_032954_704165_BD1C46C7 
X-CRM114-Status: UNSURE (   8.35  )
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

When the dst buffer pointer points to the last accessible aligned addr, we
could still run another iteration of unrolled copy.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
 arch/riscv/lib/uaccess.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 2e665f8f8fcc..1399d797d81b 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -103,7 +103,7 @@ SYM_FUNC_START(fallback_scalar_usercopy)
 	fixup REG_S   t4,  7*SZREG(a0), 10f
 	addi	a0, a0, 8*SZREG
 	addi	a1, a1, 8*SZREG
-	bltu	a0, t0, 2b
+	bleu	a0, t0, 2b
 
 	addi	t0, t0, 8*SZREG /* revert to original value */
 	j	.Lbyte_copy_tail
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
