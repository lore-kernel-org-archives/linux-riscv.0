Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F9DC3ABDA
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 19:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=brWIXpBhxJ7XQYNCg1guISWEy25jrFWFrBTTMMFQmT4=; b=c85lB5daB5JQyo
	wceQu2rDWfZCGjSdAQQoZVIu1ioM2HWYEuWQ4Px0Id3+k3uN07qe3Gdux7AYyWKsx8kbwnPjBro70
	WhnaBpGjyb5zHOQB5dzbHMUp67nVTyUpDb5WcXdTVZABJ2U4Yh8r5u69BMQtscUwU01lXoJm0tFJE
	HVnqIf/bLaWQ9EMBOR2nJJkqTnJ/iR58QOgk3K3eBe/DLE94/bzkIg68Y5xwx3QZpgqik9qBZyev5
	9pJa8qah5joSv6VL8xl5HG5nVzDaXhyVj1sUcMM+MtwCE6EL5Yz1LyH6MrFu3b1VYfRWK/TgQ+xtH
	K/1mgWYpz64pYfHfPK5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHOp-0000000G7h0-3YYa;
	Wed, 14 May 2025 19:04:15 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFFfe-0000000FqIY-38B2
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 17:13:32 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-30a93117e1bso130724a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 10:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747242809; x=1747847609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DFmrqNw23zFWte6KPawqZJqj+5gefj3fndfHRw4esMo=;
        b=WQvKcj+IOw3Y4887zN9gI88MVPNSQUhiz1HR6dcOft+i+zc1gktoEUA5ygUMXe0W2+
         1HxOeOQHWtm1CVhx/wBBHOOMvwZzXI8Fbxf9A1X7r3LpSCZc4quoK5PbozQ1Vao3DFfk
         OyytCvD3RA42w3J/QBvW5Gt5vnPbLjpvKxacAuEaKf4ThZl/oQoQlFz4eQnYpUTXjce6
         wYSEVmRTETA030Z7sjn8NSKaXW+lD299du2cbU34l5UgcZYAGc3ke7U1EU0JPUPGwvS4
         nvi+EZ/ddvPNUk7Tq0coDdD2DYE9EBmocghb+AWvcf216YyoFhSWfo/hp4MV1J0UjKLz
         2EzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747242809; x=1747847609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFmrqNw23zFWte6KPawqZJqj+5gefj3fndfHRw4esMo=;
        b=ro2yzGScS5mgU00Q30Gm3CYU0GTWSxJUNmwHOB3QQh1/VLyQNiXt++eMipt5FI0Lu4
         csUyL4mNfZ0vFo8lILBDeEFiN+R1pcVXxVkXgGFkFVUE5Sg3fVQSmHdU3z5W8aAiCr9V
         WT4Sfp3Dqa7c8leo18VApsgM9c5sSS40qXPBYWGrbrgl39lDnd3gph2vtnLTWu+85r69
         8coBAb2lMAC27C48heXnoPL2Yf0B25Q+SB93wmAscjdk/2tv3A52HCNbAW848o7XtPuh
         bIQYCxFDNuOr7R/QjZJnDgbOdgB39OhkQK9/srIFhXZ5rpbusMzZeVVrexjZA054zREB
         AN9Q==
X-Gm-Message-State: AOJu0Yxr30tQddmXL3Lsx7caly9ssfFiqBx/gAR4MW/GzpneQuNXfm7i
	yRTuWU7EzLqbgDdDmiv/RcQRnWOiQNKJkdUETACbVD8vxxFVY0mRyYs5Stzl98g=
X-Gm-Gg: ASbGncuf3yGBj+Xy4SVLzcNJLpO9A27jN8PRUJpegKJjDNf20z9aunZ0hn/HsNE3JHJ
	oTNP8DytsLpDl/zRWZns73laOVv6mbzHq4iGNwy5qHG/h7pYuYu4s+FXCNUTzfduHOcQY43cNSI
	sCQ+lp1/oYSypkNQP3SHDI6krQwKJ/G6wXHjGm3c6EjkI28eHOL1ICvt1GTyHQG2ym8MDAkSwUI
	sHht2WMfGc5aS9skt3sFOPWYQBKI6/shm+gwcYTkkzYoDE5H0j5nCpmyNwjUG2cxd/h34vkM9r3
	ur3vHAJbRx/XzmG50nGXy2X+F2WSi8ZeQmgnUkammpiEmskjcqAqMzWpQL1APLyx7XOfag==
X-Google-Smtp-Source: AGHT+IHEz09rrp9A5xMq+F70RrKD5NQcRcTQkwXPv03ntDr7BNJbuVIz4Tc+xYk2wF0okCEF9ptrSA==
X-Received: by 2002:a17:90b:520f:b0:306:b65e:13a8 with SMTP id 98e67ed59e1d1-30e2e5ba382mr6771219a91.8.1747242809252;
        Wed, 14 May 2025 10:13:29 -0700 (PDT)
Received: from abrestic.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e334018e0sm1953256a91.2.2025.05.14.10.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:13:28 -0700 (PDT)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH] irqchip/riscv-imsic: Start local sync timer on correct CPU
Date: Wed, 14 May 2025 10:13:20 -0700
Message-ID: <20250514171320.3494917-1-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_101331_046156_9595A552 
X-CRM114-Status: GOOD (  12.38  )
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

When starting the local sync timer to synchronize the state of a remote
CPU it should be added on the CPU to be synchronized, not the initiating
CPU. This results in interrupt delivery being delayed until the timer
eventually runs (due to another mask/unmask/migrate operation) on the
target CPU.

Fixes: 0f67911e821c ("irqchip/riscv-imsic: Separate next and previous pointers in IMSIC vector")
Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index bdf5cd2037f2..62f76950a113 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -208,17 +208,17 @@ static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 }
 
 #ifdef CONFIG_SMP
-static void __imsic_local_timer_start(struct imsic_local_priv *lpriv)
+static void __imsic_local_timer_start(struct imsic_local_priv *lpriv, unsigned int cpu)
 {
 	lockdep_assert_held(&lpriv->lock);
 
 	if (!timer_pending(&lpriv->timer)) {
 		lpriv->timer.expires = jiffies + 1;
-		add_timer_on(&lpriv->timer, smp_processor_id());
+		add_timer_on(&lpriv->timer, cpu);
 	}
 }
 #else
-static inline void __imsic_local_timer_start(struct imsic_local_priv *lpriv)
+static inline void __imsic_local_timer_start(struct imsic_local_priv *lpriv, unsigned int cpu)
 {
 }
 #endif
@@ -233,7 +233,7 @@ void imsic_local_sync_all(bool force_all)
 	if (force_all)
 		bitmap_fill(lpriv->dirty_bitmap, imsic->global.nr_ids + 1);
 	if (!__imsic_local_sync(lpriv))
-		__imsic_local_timer_start(lpriv);
+		__imsic_local_timer_start(lpriv, smp_processor_id());
 
 	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
 }
@@ -278,7 +278,7 @@ static void __imsic_remote_sync(struct imsic_local_priv *lpriv, unsigned int cpu
 				return;
 		}
 
-		__imsic_local_timer_start(lpriv);
+		__imsic_local_timer_start(lpriv, cpu);
 	}
 }
 #else
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
