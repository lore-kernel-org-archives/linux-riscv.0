Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B579C25B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wQefLizk3bSzVl+6jsKRRByzGl/209oLANadOq8S1lA=; b=Ewn2JZmhejqHug
	BDTsP8EKdzrGwaRYCW3zCle+soIlTkMH+Ge+HOe4KBK+BbnxdZh2+B4gg06VsMx6q/rVyT0DbgUgT
	iW4NPu1Zu+CmaVpI09zc7UpatFbZMe7VOntevf6jZBxxFomgXUO7MsUfvyduJUmjMPdpm4gBsSXKg
	W7KgKETUeSdgf3OL3VlsCcHvng8dqGlJKN1yrIPrDulRHmixD/isSlh3q4HBrwRysFaC7NaONYdMP
	ExzJwpz+valhdPpbz2Iyq3BAgrjlPuGlcqTa+G1hAmA8XU8E+iM5B55RTwp7asUo9AHRxHRdpdIZg
	ebq2MNbjpY0orJxAtNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9r8D-00000003rJN-2x79;
	Wed, 22 May 2024 18:56:09 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9r8A-00000003rIw-3M7L
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 18:56:08 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ac9b225a91so2335405a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 11:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716404165; x=1717008965; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=dnzy+P27CG9g1SjT29AHyztBT8s8Vr6GnIB5bhcdo10=;
        b=b7bxoKVXl1bF6/vsgCAJLNv01zBXt90lzUnBLVFoaU904oJpv/16j1n2BScFavDEUb
         QeZ7aJH1VZLQjYGmupT/ypH+9eHHkV183E85wXC8vMzGvkDSqznesQXkJadzCwrYaNjg
         zmDkrGMN1JSmOti07Gg2vb+mw2B0iSCu3p+xu4XFpxwPoXuf14ZshW1bVdLYkmdFUuOl
         qAIn6bAYHRpWTACPMxVIbEM0lng0DPYCqgfdXEnqhNeYyhN16XaqGu4jPNvZE/LcprzK
         JkGhiySYcvoGWN5lWSc05M4S3WCIlQ+9xDnpfBgw6bgbXl6z6MbVw0FRIMU1r/Gal6lA
         PG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716404165; x=1717008965;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dnzy+P27CG9g1SjT29AHyztBT8s8Vr6GnIB5bhcdo10=;
        b=PiZn54R6nMd7drgFxC/KXmU6cSbtsFpmmX7ygIii9h3fNAEs938KJ0lzmYiO+vU5KZ
         B1fYCdWjTJNIKX5LE8Uj+J6ibY5lI3YRL8CcThw35btsyYwgsFjIrSg11sVrYamm5Fcm
         lHwJy1vicyXyiueT9WuOKKV8yoi4sPZIMoIHjTERm1S2AKiG/lnvj3e05iw4PmPgiCsZ
         9sWv/yjN4z3VCcxLVwdTojZbayWlBNVjr6QUoqQh2mbFCE1f5cxQ8fVR1rKHxUNuAdfA
         wYU/VDuCAeTHoslDc4cdz1DbNwIvnKwsESVBb794khlc5ROJCBuWRkxIytQC4yAF6fYp
         nfYA==
X-Forwarded-Encrypted: i=1; AJvYcCUD3zeefgKUZtoehzrYao5VuA2YdpGOhSwgQTBbunOev5mg9P2IlhC0kiBIIeYe0g1C2CmDHsaBHxg3WKOmUJMcGlBNOePoKnZjSQ6e4yHD
X-Gm-Message-State: AOJu0YyxbgVgKeQJ/tme0aqI6pWqET/kkL8bdMdaadGAOSTcGthSa/Yo
	l73jlwc16g7lk/PZcLYVswvfbtWFuJqiQkeuZ5JNX5l9PPIJab4koMSJNhY0JMtd7gU3pYTCHWR
	G
X-Google-Smtp-Source: AGHT+IGu2YOuF8nlRehcHho+rj9d+wag8HDJWVH5TjU1gb3maLVKxYpE3+bvJ1t/Oj/1dk5a004niQ==
X-Received: by 2002:a17:90a:4315:b0:2bd:4759:46dd with SMTP id 98e67ed59e1d1-2bd9f59ec18mr3032141a91.37.1716404165448;
        Wed, 22 May 2024 11:56:05 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bdd9ed3812sm115120a91.11.2024.05.22.11.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 11:56:04 -0700 (PDT)
Subject: [PATCH] irqchip: riscv-imsic: Fixup riscv_ipi_set_virq_range() conflict
Date: Wed, 22 May 2024 11:49:55 -0700
Message-ID: <20240522184953.28531-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Cc: anup@brainfault.org, tglx@linutronix.de,
  Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
  Tomasz Jeznach <tjeznach@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: tglx@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_115606_945781_D967EAAC 
X-CRM114-Status: GOOD (  12.64  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

There was a semantic conflict between 21a8f8a0eb35 ("irqchip: Add RISC-V
incoming MSI controller early driver") and dc892fb44322 ("riscv: Use
IPIs for remote cache/TLB flushes by default") due to an API change.
This manifests as a build failure post-merge.

Reported-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Link: https://lore.kernel.org/all/mhng-10b71228-cf3e-42ca-9abf-5464b15093f1@palmer-ri-x1c9/
Fixes: 0bfbc914d943 ("Merge tag 'riscv-for-linus-6.10-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Sorry I wasn't clear about this one, but looks like it got dropped as
part of the merge.  I'm happy to pick this up via the RISC-V tree if
folks want, but I'll keep it stashed off to the side for now as it's
just touching irqchip.  I'm planning on sending some more stuff on
Friday morning, so just LMK.
---
 drivers/irqchip/irq-riscv-imsic-early.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 886418ec06cb..4fbb37074d29 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -49,7 +49,7 @@ static int __init imsic_ipi_domain_init(void)
 		return virq < 0 ? virq : -ENOMEM;
 
 	/* Set vIRQ range */
-	riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
+	riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI);
 
 	/* Announce that IMSIC is providing IPIs */
 	pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwnode, IMSIC_IPI_ID);
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
