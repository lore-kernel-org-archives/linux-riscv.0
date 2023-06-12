Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62F2C7EE2E
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 09:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y8HHwJG2ydtXCu0+4CYzLE0UkBE2Xs2J354VsjKxspo=; b=W0SL9VAvlzWHYU
	m6rTyR6SjGLzgFoNJf2BJfXEy0JInwY/MLzigQYkysL4i2nLqJ1HdirnXVmdYIR6jEcUiWZoNTLgr
	Vdfb3XIaUS+coWJcEpDUZZcEpGIDHYlVnJsz9k1mY7bJkaXTvE42o09dPaYbOhomgbTFnyJm/kpyX
	1SMYcvOPBwFbwBGpL23wKtYBhTX4reOJ1HjSQc4eEXYlwpRQPbYIlFLHMK+sc26q+OtONyQ1EMhdK
	mUu04Zne78a276BTwikxRIhwJBruHqluGL/hSt9hmTbmAZOMXULAhB69xOb6w1OKtQq23c5PyNalF
	dpbFKin6kNkGEOPx3fog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8e0U-003Kv6-1m;
	Mon, 12 Jun 2023 09:38:38 +0000
Received: from out203-205-251-59.mail.qq.com ([203.205.251.59])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8e0P-003Krp-0S
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 09:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1686562703;
	bh=s6XBGJLFDIA4i1XdtLnkKdSXoeV5/zfMkKiTPC68IaU=;
	h=From:To:Cc:Subject:Date;
	b=w9rSdeO+0+OuZKRNeIbLPylsSfcSH5P7912AGFE0LV3Gw0ycPOTYZP9ELO3YTYmXY
	 hbSmIDV/RC+F0oTW8mgHH3KDTd9LIeOuxu3xpguRgREhcSDxEahCTdhMLpZv3cHaSG
	 LwxFAVRVQVxydChdwyEpBwJrzG1prupsCqJ90ojU=
Received: from localhost ([101.224.149.128])
	by newxmesmtplogicsvrszb1-0.qq.com (NewEsmtp) with SMTP
	id 981AAA17; Mon, 12 Jun 2023 17:38:01 +0800
X-QQ-mid: xmsmtpt1686562681tjmlmxqn2
Message-ID: <tencent_97F6C19BAF7C99B22BB1199FE16B266C2B07@qq.com>
X-QQ-XMAILINFO: NojR6Ao/DkEDhsybSq2JeQyE0+0bI18FwXwaK3SWz5OdqeG6o9vE1E6fMXzdAG
	 WtfYjUyEkGG2kZ14Ux4Ds+SAYYn3tA1jK2J2Th6oBcNFRMAYe4U3wKZthLKYN4TmIDxtoCUxCqFQ
	 obBnH5kBhUuuHfCwAuw7cMhcX4rPLEXMn+VIZ2RXvrkxQZjICrpFh+w7HDqGMZ/tRqC9JzPwZPla
	 bPTAva+duFdFKI6+aeYjyl/91pzeXkvo3zuORq1Dz2wHPACu2TNLL4G+bufjNTLMsSwApZa5DSwU
	 jexK2Di8dtTTX6dQKvQJfg0n3FYYTNbUrlwUFKQNfMDyQJo8STar2kXJbDxswORVqfVxbc2zqUv0
	 Hel+gqFlMPc7VrlHM0i2fdTBgECgMbi379AzR7eeQcZ5lk4R1mch4Fg5azoEHgnZiOK6TePQGOXX
	 +XEUDFThdMXNetyYVzMGkxu/wRUQU4zqwzwKn6Hag2U+DzgEsaF08jmRZ8jL1MdWgmXaOQaA6KU8
	 ANZwnHTQYrvCIb182YEHPbodDy1Yl0IDDXr4mkWZf1C7s4x8Z+0VMXLN3rmFWxoPPcf+iBchIVyi
	 KDYEHw/QUUwEKHdkXeWQORhD2mmPeNEE6vf/JYyPQYk95Xg+8kn+PuUAfMSXP2iXLCAEO5H1CihT
	 WJ0U8xRD1tQ3lTs12+8eFXaDZA2zjWBMCljsZ+XK/aqsNrWzN7evmi2IECGcTTSfIb86iTgwFun6
	 cJ3rGimBxn06eCA2mejs1gbp2w3XkyzrnBoT6shwjAXadEsxujsgkFHCXXYBGyIsFMwNEsViz7Yo
	 8kD9uf33+Xrdcf/E0yIka1HcJw8VGRrNho9wznheKJF6z4QPClH4jRuW9yUrCeaqabb5bbZtnPkR
	 mynX81zfGRW1MFKyjDwHPG31p/31+ogQxlLHmh4kZNz3OJyg8kbdsRwcEfgwqyAHUvmQcQ0ofEbV
	 SQsv7aKXwdzUKbu5ylek+vtn570fIo
X-QQ-XMAILREADINFO: ONta/cS8wke6NG0jKFLbKjU=
From: Woody Zhang <woodylab@foxmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Woody Zhang <woodylab@foxmail.com>
Subject: [PATCH v2] riscv: move memblock_allow_resize() after linear mapping is ready
Date: Mon, 12 Jun 2023 17:37:38 +0800
X-OQ-MSGID: <20230612093738.1793433-1-woodylab@foxmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_023834_626804_59F587D8 
X-CRM114-Status: GOOD (  11.19  )
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

The initial memblock metadata is accessed from kernel image mapping. The
regions arrays need to "reallocated" from memblock and accessed through
linear mapping to cover more memblock regions. So the resizing should
not be allowed until linear mapping is ready. Note that there are
memblock allocations when building linear mapping.

This patch is similar to 24cc61d8cb5a ("arm64: memblock: don't permit
memblock resizing until linear mapping is up").

Fixes: 671f9a3e2e24 ("RISC-V: Setup initial page tables in two stages")
Signed-off-by: Woody Zhang <woodylab@foxmail.com>
---
Changes in v2:
 - Refine commit log

---
 arch/riscv/mm/init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4fa420faa780..57874f89dce2 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -267,7 +267,6 @@ static void __init setup_bootmem(void)
 	dma_contiguous_reserve(dma32_phys_limit);
 	if (IS_ENABLED(CONFIG_64BIT))
 		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
-	memblock_allow_resize();
 }
 
 #ifdef CONFIG_MMU
@@ -1284,6 +1283,9 @@ static void __init setup_vm_final(void)
 	csr_write(CSR_SATP, PFN_DOWN(__pa_symbol(swapper_pg_dir)) | satp_mode);
 	local_flush_tlb_all();
 
+	/* Depend on that Linear Mapping is ready */
+	memblock_allow_resize();
+
 	pt_ops_set_late();
 }
 #else
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
