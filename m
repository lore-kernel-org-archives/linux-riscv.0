Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE94C0219A
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwZwE69TzK4bUS7MybKdSB8OOhDDaawc7lCtPJSxgyg=; b=wmrZ45yadvMMQd
	nYeseK+SYw5kKi8Gkz2XTprpx6glamP/J9Mi3JzZcVhohBdEJ+ehxi2gM2bZ/5bkzbrJ66IxR1oEI
	9E5RnN9btrqU+cW6qtvj5JpUTSPFZtsmInt8MGAyM0UlPE5oLrZwdveLTuVNSbfKfUHRc7tnk80QR
	0Cc4YT24a3JJh1JUA1SzHs6AkA0vnoh5xlBql4aWtoxzJQa56tb8Fq70wSAfEyY8KYarDR91QnCDj
	6yOkIqIhLr0ExsZIosIV29qVU1F2EUIrcC7iYZvMMAM3EvvpQLb6l82qitpzYJv17v6SqB3A2VjsL
	Rx6RI/EwJI09CMaw1xxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfj0W-000000043jG-3XQp;
	Wed, 05 Feb 2025 17:16:12 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhpP-00000003sx8-3pGM
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 16:00:41 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21f200014f1so9665145ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 08:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771239; x=1739376039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=;
        b=PopthXk4VsAXJfXDKGFYACxrpK0atlNg386cfypxV4QUhp/WLCgFiGiuXuSMViWK5n
         SR+8c+82WGZENM/aBDhIE2QqusuIgqdPHJH9el16gQyPdIxckP2BDAx+R1tHob5PGN7C
         d+dM0RcuzbwD2X7169332QV3AUSSZHoQaKuEDyc1LclWvLQRzvczcY95UHQ6fX9qjteK
         Qgh9lAfmhDuEq5sxyVoO81iXsCITD/xXjltWmADmwpwwuBOdbA3yDdXQE0eCTHy0dwzm
         /DKRPDHh7S/Mk36yoGLxmpDQrfxv18fnjEutxMeMUX5Y7fNvrtZjgEC665qhYsp8HCUT
         go/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771239; x=1739376039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=;
        b=bJxv8Umeiw8wzmRffU5EzUHXlPcZ579OH8EGSl9DSjXt1xjSpj8hHJda28lWuT8jGk
         uLLnq5+ycaKv+x09FIABWMxfgRisREYf8PmQBrDEfoZuExM3xvG+3peQLu0tRqkQQQUM
         LGGs8cImhPojARwfurQhhsgYn0h5viy8uuU22WmSqkML4RKON15oW5BX0K/waKHrzpDd
         xGfdHdihM+bn/j8nOd2OL4xwRXUz3SsvuWk+1Gka2EU9FDCVdXlDnUfPe5jiPHp/YTJQ
         jn3GmN+qpHo1GQ6yKjDAGuhp4uehEhVtZUpz7OU2D9nO1mrGQdW0yVD2vxS/HqUxCqcL
         s1TA==
X-Forwarded-Encrypted: i=1; AJvYcCUV5Z2P9duzS3xlVF1kH6Ke0v4QOnbKgg4dEiR+5OtQf+AHuM3qYBImsS0hNlwgeg7S2Uqbni44UPT3vg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9alCgmi/KrSZ9JvxNCyL28aJwx95FdWUHdHixlUpg8iNu5bF5
	gojv1KrdY6BVHlHx7aIxBIcw/8ETFBWIKBAgFcKKjjzHwV9Me4/0QnXOc8WXLs0=
X-Gm-Gg: ASbGncubQJp/Hub2a3VA7YgCTSIzVyVSl6W2GFuR709i8XDMHbQvUeTuQ35fGOhGG+W
	4ZJJIoPHVC9vi4M8mfEPIwcDhFIWkjr79EBQ2JUdC4E+4c5thFN4X8w0X2FXXvdyJJbZEdWZDfG
	JIDS4Z9j1c2wSdGNyQm8ZHpLPnRsuydlpSJ9DWqDPCgWm51EcozIrwe7nfNUwCTvJoi0ydaqCQa
	MxxAynjneiSbI+vRC33u4kkXvfjAsrpTxEL3IZ24AVH4vdfugdSckV5VCpWP1yRKmZc2ft9lh34
	OrBPOL5C3BfRnoYeImq+g5OZtTXd/jDJXU5hSFBj0pbGxCmlMWVDzJg=
X-Google-Smtp-Source: AGHT+IEJIosY/OKbXQSnforNF3833piSl8A3TJUvYoiwSYBBjf98+ctLM/SnWJ1Zo9+v0gmQgw/WRw==
X-Received: by 2002:a17:902:cf12:b0:215:8847:435c with SMTP id d9443c01a7336-21f17df09demr64343705ad.12.1738771239274;
        Wed, 05 Feb 2025 08:00:39 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:38 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4 06/11] genirq: Remove unused GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option
Date: Wed,  5 Feb 2025 21:29:42 +0530
Message-ID: <20250205155948.81385-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_080039_967520_48155CD4 
X-CRM114-Status: UNSURE (   8.42  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option is no used anywhere
hence remove it.

Fixes: f94a18249b7f ("genirq: Remove IRQ_MOVE_PCNTXT and related code")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 kernel/irq/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 5432418c0fea..875f25ed6f71 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -31,10 +31,6 @@ config GENERIC_IRQ_EFFECTIVE_AFF_MASK
 config GENERIC_PENDING_IRQ
 	bool
 
-# Deduce delayed migration from top-level interrupt chip flags
-config GENERIC_PENDING_IRQ_CHIPFLAGS
-	bool
-
 # Support for generic irq migrating off cpu before the cpu is offline.
 config GENERIC_IRQ_MIGRATION
 	bool
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
