Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD55C07E9D
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Sep 2022 00:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UKOfPn1pbVZmcSbPPcw67s49Qt+AqJnv9m3Bj4zIypc=; b=YHy6aehYH4XGcj
	YAh8i7syph/4vq8FqWHMDel+muP36Vj0GFFi7XyW10klr6eBQE8iQwjZC2X3GC+470zbC9n5/7EMh
	7TP7uOaX0GNxP7TM9TWnvDBM1GoAMFMEHQC8KxNF1df1qWg2QyJW3N+3aWi68QznvYbRlewPrnR0t
	XeJL0qhAtu24RxkqxNgIoryzx4OLGgWJWbm1rnQLZ0vt8TM53J3/qNf8d6slGwCre1Mg2C2695yHV
	1qHK836S2SB2kcBkYmiHeiK+wF4ZFfcOnHgf7Fo1xUjlVtH1iKAXC5/fLGtW56o3ZNP74gphz/ODv
	KXThbavLFzSEdmDygtkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocFoj-00A0tZ-O3; Sun, 25 Sep 2022 00:48:21 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocFog-00A0rY-99
	for linux-riscv@lists.infradead.org; Sun, 25 Sep 2022 00:48:20 +0000
Received: from LT2ubnt.fritz.box (ip-084-118-157-002.um23.pools.vodafone-ip.de [84.118.157.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id F23273FD02;
	Sun, 25 Sep 2022 00:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1664066890;
	bh=olKkd4579n/2ZvwSQvhp6zSub7B8J6f3nomR6GM/prQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=E9ec9TfuZO3TwxFmPT44mTMyl7nJNLxppT7Z36cZaViQK+2oYgmTmdij9qqNRgbAz
	 Or00mxqSH0bETD9X0oxUnPuowGyV2MBkAjgulAOQTYEz0xUhCbVmKIepq9PvevdaQQ
	 z0meE5RHMC0n3rOoxPtxP8/ve093uSLm+qmUFZcj4KJeNvkoFO5Xpgj6Nh/SMVCQpf
	 T5ENuc+kdh/EXcCScoKPIQnuDL+PtC6kGG405kbRVNQZh/LMOiu5rzWgly9Hq4tkYk
	 vwPPOjDeeO+V78KrDKobERBRtEBmNRwYFHiwQEspOSsp5eQRFEjDCIvggpRMpPl/cL
	 Qwk32W5XU08qw==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] riscv/vdso: typo therefor
Date: Sun, 25 Sep 2022 02:47:57 +0200
Message-Id: <20220925004757.9089-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220924_174818_700504_BBE76EFB 
X-CRM114-Status: UNSURE (   9.74  )
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

The adverbs 'therefor' and 'therefore' have different meaning.
As the meaning here is 'consequently' the spelling should be 'therefore'.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/include/asm/vdso.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
index af981426fe0f..a7644f46d0e5 100644
--- a/arch/riscv/include/asm/vdso.h
+++ b/arch/riscv/include/asm/vdso.h
@@ -10,7 +10,7 @@
 
 /*
  * All systems with an MMU have a VDSO, but systems without an MMU don't
- * support shared libraries and therefor don't have one.
+ * support shared libraries and therefore don't have one.
  */
 #ifdef CONFIG_MMU
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
