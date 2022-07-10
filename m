Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA58AC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Jul 2022 07:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+MI3UuEGHaOIWPFCiF7uRCouv08+rJbLPTCh8JQkACk=; b=JI+HzgovEf1njQ
	nMle+FNdZOGyHxaYrV6oeCdoopG4kaY9iQVYcDCE9BiLJb6k1hNExseJJHDXqbXTKHvA1rXhKb0MK
	ZVPBwcDrJWNdpsmJ4ulAcAiYmk6fNu+OWr3p4QFiNMD/h/185YDe8h2Ymk6jZpY3EKKEU+1dTTdSh
	SyiEkEztphqyR4RabaBDjWXznxZF3R8DgyN0J3Qq4OOrDWoqBI0zdnPzxwDWLejqp6BSiiLBQ+TWA
	1FuxA+mNd05GD8cYW1CYZLy/DUJQvixSUiB7Hvh7GRos9iUtSnArgCMsqPsb/q1rErG8fb0OgVJQS
	u/lSW1XGbilJranMllPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oARoR-00B41b-3c; Sun, 10 Jul 2022 07:57:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oARoM-00B3sW-4u
	for linux-riscv@lists.infradead.org; Sun, 10 Jul 2022 07:57:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5733BB80685;
	Sun, 10 Jul 2022 07:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2618C341C8;
	Sun, 10 Jul 2022 07:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657439816;
	bh=vYIMP/UHTV9+lv+QNCKrStmjOQ/KqDd3GP8Wu6Edlww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nRtvx9Wtmz8rulTZZ4k6pTn0QlhO56cnKpTQJF3+CauC4Tmiv0Gok1uSNccE5Jskd
	 0LK27DjaLdHL+wfvyTMiQk/ZF8RruAx3YnEIZrG6lf98+0JknIQq2sQTgD54yurryz
	 PCam3FQDtHBevXXq1tfhuoflK/s8xAGHQrGxJ2QHDdLc0MjlFM5CKN76zbARy762vc
	 2yetMnCfo4YM/jG9WoJMlQYg086yHi8jWTPOO+PuL29R/9QCbgqEa56yATu8OXNXZj
	 Fo8mFegI8pk0AgLff+k1PHgbYF+YniV0tBGoS38+KcqkvRnQ2sltMJ5QM1tx6Bs+wp
	 F43azl07LtYnQ==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	heiko@sntech.de,
	hch@infradead.org
Cc: linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [RFC PATCH V2 1/4] riscv: Optimize satp_mode data type
Date: Sun, 10 Jul 2022 03:56:41 -0400
Message-Id: <20220710075644.738455-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220710075644.738455-1-guoren@kernel.org>
References: <20220710075644.738455-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_005702_360062_F576A55E 
X-CRM114-Status: GOOD (  10.51  )
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

Fixup satp_mode data type. Use ulong instead of u64 for rv32
compatibility.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/pgtable.h | 2 +-
 arch/riscv/mm/init.c             | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 1d1be9d9419c..edc68759b69d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -833,7 +833,7 @@ extern uintptr_t _dtb_early_pa;
 #define dtb_early_va	_dtb_early_va
 #define dtb_early_pa	_dtb_early_pa
 #endif /* CONFIG_XIP_KERNEL */
-extern u64 satp_mode;
+extern ulong satp_mode;
 extern bool pgtable_l4_enabled;
 
 void paging_init(void);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index d466ec670e1f..eea147b1a617 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -38,9 +38,9 @@ EXPORT_SYMBOL(kernel_map);
 #endif
 
 #ifdef CONFIG_64BIT
-u64 satp_mode __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL) ? SATP_MODE_57 : SATP_MODE_39;
+ulong satp_mode __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL) ? SATP_MODE_57 : SATP_MODE_39;
 #else
-u64 satp_mode __ro_after_init = SATP_MODE_32;
+ulong satp_mode __ro_after_init = SATP_MODE_32;
 #endif
 EXPORT_SYMBOL(satp_mode);
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
