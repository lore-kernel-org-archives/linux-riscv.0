Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6BCC7113D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 16:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEGKJIVvsgOjd/JeXJtb4tDkKomPMHm1MzQB5reKQBY=; b=kepNBLJvF/VA8K
	P7dV64BHNnHxM9pbPcjq8dhAQmhsXG3wYTwJZOEH4UJeyBrKGU3foUpotLNV/NLfgB9kTemmpNXL3
	iOZGtPI1HgIUa7ET0/jOuiB/pdw/IFEGgoqhd31lI0qWxwyYcRkf3oIk2AtCN0UcaVKbtfDJXc2zd
	bQGbXKZz7HpYp+wx25e4B6CKSeai7n4Ck5lp1mqLHebS0aa/IbdPB0PfKDgoxFORLS/uUlwIXkB/x
	8eDdEgv59M6jJNbfxZIG3Sia6niBLiTG+xaY0wsEzO8tQJcsNW3cHettDtQLq4kzoS2eRKFLX5QId
	Fwsgg2+X/BfNbE3SVfpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5r-0000000AZIA-04on;
	Wed, 11 Jun 2025 16:14:27 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPL4F-00000009u4l-3b1h
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 13:00:36 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2349f096605so79112685ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646835; x=1750251635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QndPkvYOfHZnlmLnlurnlWYXTuNHVByXqbm2h3XNBdM=;
        b=yTY75jwwAjME1RjdrFkLT1jfD8DnuGWbJ3CpXZ9N1OTIC1L9U6klxx5AXtSbOEkBSL
         sXZWsIFR6Rq5ch34MXHcOfYFF7b3knjPy4+RGuVeKCwC+jdQbunGrUgiLRUZH/Q921cf
         PtcNYHHu8pdu1YHQIFdU13aFPgxZc+Ia87qhIH34uFXxNhaD8nCGkBp6NriwgsI/oMUi
         X7GCpqk0mgCX0lmYkoPtSUNv0nwDWWpUdGlJktzKr4yaV3HqQL+G/cC4u2MusSZH8NnZ
         3GEeCCNEWHPpVs5h2dtvErWOzsOY3U04t4vNuE5UTbTWp3p8IuVmMgEXXOD0PRwY5+8K
         PIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646835; x=1750251635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QndPkvYOfHZnlmLnlurnlWYXTuNHVByXqbm2h3XNBdM=;
        b=oLiFM9mcPG4Qs2P9QIJZQNQoV10psCbP9hbc6XHPSA9DwYKbwjJSSlW5H4cZSgYN2D
         t1FIpow/KJvS84g+Ukqmy/GC56XhK7GvMAOG9HAhAawSy1KM6mFRdzpH0N4tY+oNFLKB
         VRDMz3QtRV6QFnM1kspLYrciXhM2/2elvpV+BE2vHx6pw+XoJSHHkE5XfKLzNI/dsccU
         OQCBwZQk2GuH1WAIYR60GmEnsYvYMH3QOqId/p2Rk4dLfFQ1RL3s/c5NZ/UfBKTg5RnZ
         H0VCTk5mOiBWUugVs8blu8R+rvqabRnw0sVEuoTq5p+D6r4euwWB5w0o93mmVibLjDOH
         54kg==
X-Forwarded-Encrypted: i=1; AJvYcCW6JnlXRGnG+4zM7wzvLi7XU7ZRRzA7k1JoFyDIyCiuhnWnlUwLyG8xbP+IjGsvTHwAGDOvq5VZoE6j/w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+eZLDXh12Dj/8fG4eFNsDRDTOXDJbQyOdvN2KU/O91zUNdmJI
	VdiyGswpV8KREeOxsuIFTTaHqwsO7P1vqyPgaiR2DSpYRguORTHuJXdAV/7QcE/obwk=
X-Gm-Gg: ASbGncvkTbP9ojcCTnCWDVjyT/LMaaFxaJra6DzTbrfmZTEnqZiTwjQ/bjUvz9hxsoI
	w8KteD8aaNmkIdHb41G0nRz6jKBxbKkqLnvdwajg0QU1gn0RBFcMlU++o3io3agvN4FA5HDzrnJ
	BCoDWLji1H2UyRwUtOxm0xjHXSnZifTicgjLMBME8Sxdh6Sks++EWRWaNOD5M8A9vzy08x4aqSU
	Z4ZMPKr1kB6HklwJPjGdf1O3n5sBu4k9kalxKatWW8ARd+QZOjE8bKa28Wj3y7qxH0hVbUV36Be
	Fe0lmKeHntEAoAHyWaN97ztTWdxZ0BHBtzmNXzO81maNvrFrqPH4NgfI2o80xo6ONxqfUROls6P
	8FNkGn+Ji5Qijmv/Ou+wbJS+GEHmOGHlY
X-Google-Smtp-Source: AGHT+IE0KPlnWtgzReoKrdu9Pb1wUUDfgiReHhnIgJSTpMfI8WW3eLySP02w8+TUc5Yxq8BHiDxUbA==
X-Received: by 2002:a17:902:d547:b0:235:ea29:28e9 with SMTP id d9443c01a7336-23641b15570mr50780235ad.38.1749646835028;
        Wed, 11 Jun 2025 06:00:35 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.06.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:00:34 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 6/8] riscv: dts: spacemit: Enable PDMA0 controller on Banana Pi F3
Date: Wed, 11 Jun 2025 20:57:21 +0800
Message-ID: <20250611125723.181711-7-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_060035_894958_BA3579FB 
X-CRM114-Status: UNSURE (   9.22  )
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

Enable the Peripheral DMA controller (PDMA0) on the SpacemiT K1-based
Banana Pi F3 board by setting its status to "okay". This board-specific
configuration activates the PDMA controller defined in the SoC's base
device tree.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 2363f0e65724..115222c065ab 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -45,3 +45,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&pdma0 {
+	status = "okay";
+};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
