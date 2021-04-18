Return-Path: <SRS0=IH7i=JP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CDEC433ED
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Apr 2021 11:29:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7ED861207
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Apr 2021 11:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7ED861207
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+HqszM2fv4SG1HsQ629SYxGBqmz+zNJwQjdKDEFl1Ig=; b=PZ1gbsTcU8mjEJrHCFO7KaMVvc
	W2U8Sul46MZrRKiK47h2y6/KNmblYOo0ZJrfbPXWwEJeJXYv/sW8eNuJBm8ovoyGJC2XUPRvWJ5RW
	H7TCMMZQeA5GSzDf1AMeVGN94RK8ufNlwyC5OtREHvZGnzud/Q2FlCa6r/PW4K3WjMwRFxOyTjZbT
	naCq8lPM1JFby/nLn5sZP0heQIgNIgLoKsQwcRyJ8QfMW+6Yr6MabCiTKxRYHAp186/ylEmEa/Tbw
	em8+JistHYnF0tr3iZ06FhLXAnWXith4Y+FRMYmV4Cfjq7eucXCX/8Fj9FXUMSc/3XRoRB8uvf+Gh
	ZQ93NaEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lY5bz-007oyl-49; Sun, 18 Apr 2021 11:29:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lY5bw-007oyc-I2
 for linux-riscv@desiato.infradead.org; Sun, 18 Apr 2021 11:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=9e0Dh+gsBlpwN6nZZnwDrLbnEg5H80vgwABnfJ7+VYw=; b=tIplrse+DQEVDKQ4o+kPIIWnVi
 htnZeTLVUzVLvnrBDiFh99l0Fp+P5Nt0ci6Tu6iNIuBPyX0FcKXhP2dcbP31Un3OeZqIntIYQkwuB
 m50AxteNj1D78aluAosM/eq31CPrDNN4KAWOc6R8AllocLGXfaD42+yaq0DeZKw43gSRR0mwwdQTy
 dhoHZh/K7uH8deW7r9QZ0dLhM6jGLNZ6UP1aBn5JdDbOyLJlVObjCzNrHvI5ClWf95GAAx6OncvT8
 XCnbE3NEp77OhXxLBuOSV9820CtFiEXgYG24Jmi02goxNUKclYKZWn4VkLmiBTQLSwq2+/oV8nrha
 Tw27zrJw==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lY5bs-00APFA-II
 for linux-riscv@lists.infradead.org; Sun, 18 Apr 2021 11:29:07 +0000
X-Originating-IP: 2.7.49.219
Received: from debian.home (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 782E0240002;
 Sun, 18 Apr 2021 11:28:57 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, linux-mm@kvack.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH] riscv: Remove 32b kernel mapping from page table dump
Date: Sun, 18 Apr 2021 07:28:56 -0400
Message-Id: <20210418112856.15078-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_042904_762416_A64258E6 
X-CRM114-Status: UNSURE (   9.55  )
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

The 32b kernel mapping lies in the linear mapping, there is no point in
printing its address in page table dump, so remove this leftover that
comes from moving the kernel mapping outside the linear mapping for 64b
kernel.

Fixes: e9efb21fe352 ("riscv: Prepare ptdump for vm layout dynamic addresses")
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/ptdump.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 0aba4421115c..a4ed4bdbbfde 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -76,8 +76,8 @@ enum address_markers_idx {
 	PAGE_OFFSET_NR,
 #ifdef CONFIG_64BIT
 	MODULES_MAPPING_NR,
-#endif
 	KERNEL_MAPPING_NR,
+#endif
 	END_OF_SPACE_NR
 };
 
@@ -99,8 +99,8 @@ static struct addr_marker address_markers[] = {
 	{0, "Linear mapping"},
 #ifdef CONFIG_64BIT
 	{0, "Modules mapping"},
-#endif
 	{0, "Kernel mapping (kernel, BPF)"},
+#endif
 	{-1, NULL},
 };
 
@@ -379,8 +379,8 @@ static int ptdump_init(void)
 	address_markers[PAGE_OFFSET_NR].start_address = PAGE_OFFSET;
 #ifdef CONFIG_64BIT
 	address_markers[MODULES_MAPPING_NR].start_address = MODULES_VADDR;
-#endif
 	address_markers[KERNEL_MAPPING_NR].start_address = kernel_virt_addr;
+#endif
 
 	kernel_ptd_info.base_addr = KERN_VIRT_START;
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
