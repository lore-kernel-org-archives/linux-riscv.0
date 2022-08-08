Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27F8C00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 07:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=etL/UlHUFKoLTj1Pm+dsiSG9/+bXf4SRtnJpWUOuCXg=; b=k40vG5Dz9HugII
	eX38b1SW+LgdJkGAnTjcbKMQzCI+yfaSL4Pt0fXZdEHB7rR6P645JbTXLUG9o0RC0HW02fc58OJwb
	XiViVXW0iGC7ACG3V1oyF6NXZQFJu9KMjui/wtVeB+1sF+GBH60Y0EfQyUF1RsXOwyxJrI6DBeQoZ
	5DmmnQ3y5mdXbqcGzblrGMv4B8+l9IQZKb+6ZwONbaC2SlSqb9ORPsdOxgqugUkOZWEv88bl5luKL
	YAaJ/z1eZxjXRZAQlNIMzqnl7QOnqNApImsl8KhkX6ryrcIx7+z2LOynNed8OpaJE2OGPlHJl8HVc
	kbcE0WfQdMqApmNYtwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwyE-00C2KC-0f; Mon, 08 Aug 2022 07:14:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwy8-00C2Ck-Gy
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 07:14:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 32879B80E06;
	Mon,  8 Aug 2022 07:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94282C43142;
	Mon,  8 Aug 2022 07:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659942869;
	bh=Z7mQrOMBfQftmFccyZvRl/mCYOYttb58VnNpEpOX/Ik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UZXK0Xr6vkJIo3dV464xjp0HwZcmi1PThbmH7PHFH6q7X3tYqIu1myEg27d8pBHPi
	 +PHFnEhtgjnmwoJuotlDAKd/yY4WCeFompZXG3d9K+JHTDvzmqidhGOWIvLs0cevsC
	 ha2iH0lYAnOUvh/Nbyv4gdaRcmsOpJhmhgh3LHsV9WU3bKW06dLgfJBIqSONaw5vok
	 VJJOWpMqL3puK3rgUSQ/tR5GmaKJZC76oFyK8r+PvNVbUCWpNhcIPIRcclDlwprnlt
	 I3+gG85Dk5T+UffsNkrBPeadjwfQaX0DD1P2GMdbXT+ejYfRGpj7G+O/BYifz5zrH2
	 1bAPaRxxN1/jA==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	heiko@sntech.de,
	hch@infradead.org,
	arnd@arndb.de,
	peterz@infradead.org,
	will@kernel.org,
	boqun.feng@gmail.com,
	longman@redhat.com,
	shorne@gmail.com,
	conor.dooley@microchip.com
Cc: linux-csky@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V9 09/15] riscv: cmpxchg: Optimize cmpxchg64
Date: Mon,  8 Aug 2022 03:13:12 -0400
Message-Id: <20220808071318.3335746-10-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220808071318.3335746-1-guoren@kernel.org>
References: <20220808071318.3335746-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_001432_807268_BC3F4D94 
X-CRM114-Status: UNSURE (   7.36  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Optimize cmpxchg64 with relaxed, acquire, release implementation.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/cmpxchg.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 14c9280c7f7f..4b5fa25f4336 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -226,6 +226,24 @@
 	(__cmpxchg_relaxed((ptr), (o), (n), sizeof(*(ptr))))
 
 #ifdef CONFIG_64BIT
+#define arch_cmpxchg64_relaxed(ptr, o, n)				\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	arch_cmpxchg_relaxed((ptr), (o), (n));				\
+})
+
+#define arch_cmpxchg64_acquire(ptr, o, n)				\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	arch_cmpxchg_acquire((ptr), (o), (n));				\
+})
+
+#define arch_cmpxchg64_release(ptr, o, n)				\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	arch_cmpxchg_release((ptr), (o), (n));				\
+})
+
 #define arch_cmpxchg64(ptr, o, n)					\
 ({									\
 	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
