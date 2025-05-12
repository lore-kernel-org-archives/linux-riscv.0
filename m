Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50378C3ABDC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 18:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4cAGJuuYSlQV4K+/iDgizlvhvwS4a5MZHaqD45ATfw=; b=Nsvbhufu5yQWTg
	dGvK349RcmSqznPzezqlXgIr9GF/+mEEnzqoay+DgHPz+5a+8oOUkFG30wR9LZajG+OLJvmliG3xW
	DGGW0z2fmEWN5Fctv0BisK4weylu9nNDjDIW1ueSEkaKSw1yKOAkUbMvFtd3YdhEG5M76FZONZz/z
	npCHZqD9nnHDXiNgNUy55nysEM0DWKDVJC++AeQgRJKkzYX8riFy7q6DTwboIZW1OlVajGg/5QVB2
	FvdI1TcggLD9vbU/uRdTmUKha/LY3zMQ7C564pbzSq8+U1LNiYQrm4lOc/hCrywU/LqHxM5dZRIlX
	3dYOj5onFroNjSTAeLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXx7-0000000AOug-0txn;
	Mon, 12 May 2025 18:32:37 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXwv-0000000AOnn-26Ec
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 18:32:26 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-8647e143f28so438988639f.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 11:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747074744; x=1747679544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyAsDOHX0TzSNx8TRSfIb8QCj6vETa2EWwj7A6u+8bU=;
        b=wthHNZ5OkihU8qyZanw5aXVUFe0i7h4VmP67wEygW6/rApBTsl7MpyhMTv13mEPrmq
         no7GG/0RohG+TlXky1zafUxEpwyMC92BiVc4prv3+ze8sBq6gR50MwPRFuqk7XwW5AOw
         f+qm1LHyhIfDH/rsicW4WdAJwcY8xDpl8wEA+h4qcKkAP1JOMbIRVu1pG7txkJRA5ndG
         WRjDkkTZGU6P8Cov0Jm5pOlwGkRDoKbNaQpX1eEwY21PE3hLO3b22yvg6gBUGsI4KFYp
         9ldKcNnrjeDy6wLZfPjXCYqcmW0rHacQ0g5W9JUaTBT+tl+t6FO47RXikrIfxg9NsZgp
         Gjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074744; x=1747679544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyAsDOHX0TzSNx8TRSfIb8QCj6vETa2EWwj7A6u+8bU=;
        b=qtdlLwKABUa6nEG+WxKSbIDa1VcyTgsL+1zATvyN1NK3g8W07LjuzcRA+oL5mTFLVK
         /0HzkWD3P8DyFQGsQkbvfF7YVSCbyAZCb3sHWlVA8P9XPu4mL4Zb/pZC1MAtZvlUf2Oj
         01xpQHKwS28bc8/Jjk9/Hu1qZaeB7/Aj6cpfZ0ITsNMmCCMBs32QmYwUvJn8Yh4L7ejI
         Xxj73d4Xr3v+4vbTUaNfXSSF10Wkqs6jMlHrmBwMjXYSO8qWac+sdy8mdpcZe+FnTSYP
         M7cVtgWr22yvbv8Sw0cNhmZEXTjWxbynWJ2Fe94isr3OvIUAu7RQPJkUyAPPuVC0GChV
         MquQ==
X-Forwarded-Encrypted: i=1; AJvYcCULCuQ/B8Rzh0JqElO9NFNVBtjlitcdWBi7H3+L85VQm5EX5MFJUT8xCod1MkPlIz9bFvlUZJbfoli4PA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTUNQJO5XaceW3ikyzZa/qyCyctzyggIj/Mbro+otBe66yrzBb
	92FtvN/H61+WaVKA2KBCM680zd4rPRPDAMPLcWKSi/SivxivpYjn8lNPMA3ekRk=
X-Gm-Gg: ASbGncuVsjVIIgJ+84Rhu3zjfZJR5pLrtY3i+WZvt6kjWV4CAAietvJ9ifLog+dJd1L
	DisZgQwnh/Lyd5UTWEMepdDR1s3kK51KtLPbiEnQwpj47zfIc0Yg2lwRGKAalltSPUwPhMfzlwo
	eTLHIZS+gp7g33pj9df0go28TTLH4ZOT/RgcYxiQ8xXmPDExyQF7n9N7noedRbpMWv1WA+aSZBI
	P/V6B9enEguYt8mSsDnWqxkFS5rU2wfR7K/vrWOGjvcAJgKTvMdgcF/DPIenr5pyeJ/61i0XRK5
	jOYRbRPNXbabbiNXKcyg38xnSYh+eLLEcPlQGulJ4E7quLVQdMmuSmINk3lfTUzrdaDrko9Jx1K
	u3ckOavvbE9TE1A2iwSCWDH6F
X-Google-Smtp-Source: AGHT+IFp8y0gq7FRiygtuXYQxumD0qfklzDcQqew2MqXSZ32JaN7tFBN5F+L1BBzUbVI3IjffHBXLA==
X-Received: by 2002:a05:6e02:3784:b0:3d8:1dc7:ca7a with SMTP id e9e14a558f8ab-3da7e1e1acbmr157948855ab.5.1747074744563;
        Mon, 12 May 2025 11:32:24 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22496e9fsm1740333173.11.2025.05.12.11.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:32:24 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Mon, 12 May 2025 13:32:11 -0500
Message-ID: <20250512183212.3465963-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512183212.3465963-1-elder@riscstar.com>
References: <20250512183212.3465963-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_113225_546519_2E605E09 
X-CRM114-Status: UNSURE (   8.92  )
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

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c0f8c5fca975d..de403bda2b878 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -553,6 +565,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
