Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B910CA9EBB
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 00:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ap1sReFvaf8bMvfxmiUSc7gSTQefuTUqP9V5UHntzuE=; b=sjdTvZhbKiRKkA
	BF4DeBfVhAxA1dFJfvZmf5bNDgun4dIkS9D1lhKuWsuXnYRp2TXCkKkE2QcDLU8B7M0RcAk7MXGZV
	jxlSxYWI2llnCFiTlNX0y2e2ATxD4Lx9ZeUuyRz2itpBiZIuDvIQnDtIR53c7BW91Fmz5iNdFVLnf
	sfWNv5co3wtIlMsVOWKi0Yj9NggmPVHdYityVujgGklzKOnUybK6AORNOVzw1eHy36jxWU4Qz2csU
	T0CTGjgiXStKwGAv0r0M7BiuCNeqXRp8N9uOPVn71TGOY+hMn3igmq9KpaZDs/8zDTbuEhUV/CVXx
	Jm3xcDBtaVydmBa56W1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFKZd-00000007Lsp-1fFH;
	Sat, 10 Oct 2026 00:04:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFKZb-00000007Ls6-2POw
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 00:04:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8916E44540;
	Sat, 10 Oct 2026 00:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6CC1F000FF;
	Sat, 10 Oct 2026 00:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791590662;
	bh=lN6MEVTLqxQZaRhIMVGcckvM4AhB2Yd9HdbNbDtVrlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YT1Ce0cWB//Jfkf9IH2b3pr9frpNgdh1jBZMTuzO7uvoNyVQw0UCHL9BWZmTF8x6C
	 xesiD9ilMLB62n/7rvClDXdvRrJh3PT7Nuv0lac3LNDTSJU5k/G3MzV09tk/dvdR17
	 vy0coNf2cjGELhccyD1xavkOkzKtciNPKF+p9vrBi1Mj90sjJcEMLDGeVGWhHBgwBm
	 anQCqDRkKmGEP2p1cCtM7yRhCzbNtfGS1wqBN9Cz0kwNil7LiDNLd/3LDTqfwHkEC7
	 tXUxEqwIs1X1bJSbQYJD7I0zSR2YoDkfJTBACcnGyih9ZNKvZNPpBH/ODV2qk/PxAE
	 oXmPicvMTLTsw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>
Subject: [PATCH v5 2/3] riscv: word-at-a-time: improve find_zero() for RV32
Date: Sat, 10 Oct 2026 07:44:19 +0800
Message-ID: <20261009234420.29425-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261009234420.29425-1-jszhang@kernel.org>
References: <20261009234420.29425-1-jszhang@kernel.org>
MIME-Version: 1.0
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

To remove non-necessary zero bits couting on RV32, replace the
'fls64(mask) >> 3' with '!mask ? 0 : ((__fls(mask) + 1) >> 3);'

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/word-at-a-time.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index ce04d6a088f6..f2d16c1eea8d 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -67,7 +67,7 @@ static inline unsigned long find_zero(unsigned long mask)
 {
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
 	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
-		return fls64(mask) >> 3;
+		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
 
 	return count_masked_bytes(mask);
 }
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
