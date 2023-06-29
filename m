Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3192BC001DD
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 23:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4ZiGZVQF5mqLZ+Vy0s8XMfYihdmJkEItWoXKQ1X8rL0=; b=3kNFjSO4mq9qFpe8lVPENo78bf
	Dn/jUsoWRujpz4S8CVnqZAeB/7kgcSH1sIv0jpILg7KBy/3AXbid5Lm9d03TVuGl3quwIgQC17wTa
	rzN3sDPzUv5U40m083ALXxYB8pkRsdU6zxXyZsiEU7F3j2K/aHsISqh9AEJLYVEzY3S8Ks/Qj8F0/
	EWhBN8QQzFa96IpBQ4sBc1Q94GIGyyUGgBU6YNI5JZOX44HUG1zeVX6KFWu6LqAFcWZzZ7GlS4OGF
	d3U6WG/X5qBnj4t4oMmxv3ooD7YA1HPPXKS9H1bkemdb2xxJ09f1bhzOGHbHDrYLEqxsdUOEAdNwa
	uHTWv0gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF1I9-002U2A-2i;
	Thu, 29 Jun 2023 23:43:13 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF1Hx-002TxN-2m
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 23:43:03 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-57704a25be9so18842277b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 16:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688082180; x=1690674180;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hI1W3vZtR+9nkE20l1uechEUk7Tap/X/lCCO/vArtS0=;
        b=Q99ataBrVMMj1/30tDgNlRKyHCZSqEUzPhraQDs3af5FWGxtd2xiR791ZBqr2urUmj
         VziLScNBQ/wNWoPtUo1GAUxfiWBt9Z23+sb2cvAXrkc5X6S+q+YKXakjQkafV4+c0wMV
         mIem4WXC4+1cb9fZ9sMvLDHFBHfw3NE6HVnt4gkfrtdFFWcfUvvFGQSX5ZMSg58mbuEq
         uFN3qIf9GcgB+gPtV18WbJfCQ7HjodVRNQg0sLGufXuzlI7jOu5cBkVrjaC5a7vvLQmi
         PPaIQ1ztJBsIFlA4BHqNj+Clm1YzG7bFL2WSAqSMtwK6hgryaYoOO4zbuc+E7FsISDe8
         v99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688082180; x=1690674180;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hI1W3vZtR+9nkE20l1uechEUk7Tap/X/lCCO/vArtS0=;
        b=As5jZ/dP2nYVItVT/ZJvdCD7FCGLPFXtpSJ9kBAi3KUe0aWTb8odQOASMiHlgVPUWq
         m8C+1SNU4Ni7VtVYuZr3zAJfH7L6N+f3CUhwbEkXL/bN007njk4VpZB40KciUlBp2eJ5
         HjoPgAS/SeNy/4kPCJ10jeAFFj36qiE9+S8uGQn/FhCno/OGmQRaeFl28Lt+C2CYH5Uo
         DDrLqu2Brw/VQA1y6xL4H8VeuzWkRJKepeQrxkdRYu1bA3HCuvI5Kx79uKnk0G8pnDiN
         pXua/s46Tv+M8lqJyM01aim1VrgmnFl6L3GJ2nVmND7sSGkj4KJeXNewGkL2g+0h4Uun
         /8ZQ==
X-Gm-Message-State: ABy/qLY9F7e4z3sMfjWHYRCCLV3+zjoGMa2alSv1+QpRBbG0mJbRg5wk
	IE7v5wgH+Iic4u+Xr2ID/PBJSf2RnG2tGq/rjmI=
X-Google-Smtp-Source: APBJJlE4AEhOYTb7QMh6sXfCMc5LWtWpbgzK5p/x1CWtYt1uO+ltyY9NSG2IJzuCFHi/jJ3JABHe8OLe7NSpTPp8OvA=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a81:aa0b:0:b0:56c:ed45:442c with SMTP
 id i11-20020a81aa0b000000b0056ced45442cmr22810ywh.5.1688082180469; Thu, 29
 Jun 2023 16:43:00 -0700 (PDT)
Date: Thu, 29 Jun 2023 23:42:51 +0000
In-Reply-To: <20230629234244.1752366-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230629234244.1752366-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=689; i=samitolvanen@google.com;
 h=from:subject; bh=g8cSbJ3YqGqII3Es78fHzl0mN4OnPxVObPCoUIO2Cw0=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBknhb1jX6BLvnk0FKQHZsmyPKyvo4TJBI2RL/Fa
 sauJUMVL5yJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZJ4W9QAKCRBMtfaEi7xW
 7nuMC/wLrmKtkYfd+iRZVIIgu+Y5m2M9if9FoIpZHdzE1sPHuEoeRb71eU9RY0XTpDiHCGPiMNP
 YbjG6hBOYmthlFvkkZe34E7uxSmP2qlWDjGtIh0Z+psbI9KOhxLdNO6136VZOaifKjMNtqGQvlz
 rAgmqkVNLA6Q710CI5OrJ/lUad7tNT7cx5lRpvzeTrgaUXI9mcWBOP5vr0xb3P7K+bjMf6WOWLa
 w/RroR5VNlXhzLL3pamA1Y55QzNu7u8sbUvvaZgRSfOvpNWm1tfqGS+vci2Q5WBLkmGw2lawL43
 d3BruriP5Q3JTisr5jHg8Zysv4VFxW78GL7dTSAkv7nPLw21lFpZtWpyBU274NKrD4PeFzdqjaJ
 /8ZopxIQJG64TVeMX+Dwfx0bhZ6Pz5B7r5CxdwL0z+p15PaXWqhx6uTWtmMEKOFLB2AAprrNsZS 5mth9xbFP0G2ongMFbaDFjlNdXZ5tmF94r/B3WQ9UzapWOCids09pksdQ/AFipOMR1Dkw=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230629234244.1752366-14-samitolvanen@google.com>
Subject: [PATCH 6/6] riscv: Allow CONFIG_CFI_CLANG to be selected
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_164301_895650_F4D786AB 
X-CRM114-Status: UNSURE (   7.59  )
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

Select ARCH_SUPPORTS_CFI_CLANG to allow CFI_CLANG to be selected
on riscv.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 20a40927175e..2699e1f8fe33 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -44,6 +44,7 @@ config RISCV
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
+	select ARCH_SUPPORTS_CFI_CLANG
 	select ARCH_USES_CFI_TRAPS if CFI_CLANG
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
