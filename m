Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D16C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 16:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VXajq6t60neUU9rMTpi4e1cYBZ5EDOWx8giU8SqC4w=; b=VppHIgFbzE3KII
	r/V/l3KsKfzNHqOY19D9W9wAyk4rZ+4eQTkgSdt7+PLbQ9vKo+HIBwHtCpU4h//OqfKiwz3/ZE3on
	j4+Ij5AoYPl6+P1uu+SzKs/Sr472UYPLOLmpoL1EIGEZrI9jQPYcOjZkjZ6T6uiWXwPfWVa9s4CMw
	cOzPnVg8iW2QS8cHRumq7wRcQNvCOP7DxzciMU7TDnGZclyxjHEqLsGzpxwsDexUNrlldCNLggoNc
	p2Dn4OVzz4rHJFS87J/iC1mwnj85vKx58OCwY1nS79q2QbnMKqS5cCjOVGhvO/6pHqYGTdSSLOSqi
	FRvSeT7bhldyj44nTzaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfi0c-00000003vRJ-2LCT;
	Wed, 05 Feb 2025 16:12:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhpa-00000003t09-44vT
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 16:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=; b=SI1+gnOISvhxghplSkG6/OYRLw
	URSirxtdwHQEGS6KnTMEn6coU1qNcJ9nZ3OSEZQHFqU0eytWg4w18i8aPkvgTxycuE1lPJOJ0vUug
	eZ2iRvJMl2LW7FqhYBezZWyCDeEq1Iu/HIOmcPhUQV8wdxtRx8oxT1aSg45K2VHJuWzhgJbCzednV
	bmfpSn6FVGr9M1lVIcXA38taDotRGWrxBUUufnQyked2Jaw/orO+0dPN1nbEYGVp0Zi9qu2d5GBHv
	0RoQfhxMgh0cq5B4qqS1bdk2VpQTpvh67LhwTFnege9aSecJ0/FQFRVkpgh3ZZm1oY7uFCZPA6JUD
	e++4Hzvg==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhpY-0000000GgOQ-0wfM
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 16:00:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21effc750d2so36411875ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 08:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771246; x=1739376046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=Yffj1+cm7XSs6dIq+ltL/1dg/LPVgHBTboLKIEe6NwnNoGz7IPLkwGCbF1dqfzWrs1
         HP3wZELgn1RRDk1m4HNj3VAVwY9OnbtXHdvdcXUmrrwAIoZjfDMT1wynoNau92QL7t7w
         GxiIexbRDahF2gD/u89ghWbGkc5TQfPmmWkxggt25NQ5A47EmFlHc/5l5mhydPE36G0X
         sVNRTRBGqbgsGhatVGXEbmsDjepcGIHKBc+h5tcywYk5c91P77B4/cwllitctlzKTYMi
         9sWhZlB4SkNQs8yXIBMkfo1EDYf1hkL5uffYNSWQTvOmOYkCSpbQwFR+CPrtdSPym73m
         /1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771246; x=1739376046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=dkDG4ECGupq0Gu2QBwFzp6R66YH4LPzus8p3QGgOsqPZPmRRsfwuBpzgRicS8qGdHC
         dGStJlObzt80UBfa/WuYsBuiZ7tSCS1CeHDZltPEISlsmJwCweDhhGySBduN1GR0NsQS
         eAvLhKCM9HsdWPNz/z38taYMP6/NiElcaq2TaM40LyeqstOfxppewwtoC62o3Yx8pYiH
         03LPvSKGJmUVNLXuLJ7Fdo2ikLe/K3Zxq2ZZqcHkusaYlKIuYf9el55L/5kQ/bFpJeh8
         PiPB2RQebBNmtmVID8HPWr9ta3Vzzodgnnd2WrYOihcRwaSeWFK/xZvlu4BTW83X1sXv
         nS2w==
X-Forwarded-Encrypted: i=1; AJvYcCWyhUnJXB0LzVEJlUqYA6AkuZW53JumVKSLAcnssDaFmJ+uYDHc9yDyGstaySMDZzPUtFVdXx+ti2XP1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbcIV+dLLuwHiBJ7DxkZLIjhj9/Z6BZ37AVVIIW5GH8R4gTe3e
	Mwa3jxnh3Rhx/NWaJvhrepR3hFQ5BsqnP4/7MO1t+SA18t7aIrJhdTJ4QVp2o2A=
X-Gm-Gg: ASbGncslW3JjyYCXvSaOKrAm14j7y+P6ptWxz59tSEvZLj3NkYSb0NbM4mHyAk4E83d
	9eOVbhIfwWaVlOeyIjSaYvwpoDLeNwEi1veWTIU064MJJT91VwyErnvWD83jCMrRbcWmthkZkIW
	4pO1mqH85Ebu7l62SVW8tr2SQO85seCzoiE1vheEEPLeanD/cdPaYxicapkRcWDPVtT7/sgn6KJ
	6ckdcerIJWABcqGOIduh7RBU4kYEY1sZT/GeIMvAIz+w8p0SXTkN+5ElUbP5YxLGpPUAkEWgkX6
	tCrcVsx6eDnwD5de5y/L+vzlzHNMFA3jfKFTTgzlavpOIe/pjdk7OZc=
X-Google-Smtp-Source: AGHT+IG20/n0MlzHXXlDX+eid7Zzs/iscNjRXbzQaZokFNcd/sGA49bK8WlZsq67OCE4wBBbq10xxQ==
X-Received: by 2002:a17:902:d2d1:b0:21d:3bd7:afe8 with SMTP id d9443c01a7336-21f17ed0ee5mr59541815ad.49.1738771245657;
        Wed, 05 Feb 2025 08:00:45 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:45 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4 07/11] RISC-V: Select GENERIC_PENDING_IRQ
Date: Wed,  5 Feb 2025 21:29:43 +0530
Message-ID: <20250205155948.81385-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_160048_394592_8DAA268F 
X-CRM114-Status: UNSURE (   7.51  )
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

Enable GENERIC_PENDING_IRQ for RISC-V so that RISC-V irqchips can
support delayed irq mirgration in the interrupt context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..a32f39748775 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -111,6 +111,7 @@ config RISCV
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_PENDING_IRQ if SMP
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
