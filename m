Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8A7C28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 19:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1M+rSUL9izvkcsZH10lwone6btc79s6AudkWlNWTKo=; b=EHHq0wcpfunJTx
	YKZEXxZAVaTYh1HSxwwzq0gVPDBqYn/Z1KGJFJMZvl6YAL9KsDsSji+9UTWAEYrJbKAC0UqmDZ7J8
	KmM7EBrRzzNFtGC/66qUSUSzYx4rSSnoQ60u+gAQdaE4tvQxV9ZCRpNDNArl/pgFakE/RrtIrchOT
	iiVbJm33SSyeUr++7nSOETSxZ/IwRV3mcaZUabBtufl/rKHh0DiFDxmfAR9Eb0VZ0hR+Zghqtiaks
	kEeCkHecbU+ns/VHQMF93ivDL7tSgqLMKSfyGAedsVrvObV7/yyvEpV9pZ0ogA7ISYAxjKMecq9tY
	hD6sfbwwR9o01A68+E+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvLpE-0000000D6TC-3QU8;
	Thu, 20 Mar 2025 19:45:08 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvLpB-0000000D6RC-22jb
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 19:45:06 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-851c4ee2a37so78484839f.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 12:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742499904; x=1743104704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nY3+cr8LwPrnwPUbr8ZQVdT4sW06Crewhjj4AmYBWuU=;
        b=3MEHeUCjKWtTo+isZaSm1JrkneZJi9NwD+mYlaxbR3U8ESQxkjeM8rFDuIsw2fcyc7
         JBQ4XewOFQtjtffC+LLbfr/sIvDRUiXOQxWThk5Vb9MKpZGjLTX30h0oh+V6iutfb28V
         guHlXH0+dgoUJutcqb1jMNkvDBbqUiW8G7kiyhfHBIMGVUDM48CNUl98zbNBIHwMLL9P
         bANpFbtEfBvRz93MiMQNP9TNMYbRW+7YOl6BakVg4nbA+IYb3qPHTLnFx+SNl3M/XUwm
         jeDRj3s19RQQhC5pXnmp47+8avoHl8ik1gJDw/sXVwukbYP4EUkf/MtMpC+vc6iYWg3l
         iSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499904; x=1743104704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nY3+cr8LwPrnwPUbr8ZQVdT4sW06Crewhjj4AmYBWuU=;
        b=Yz127hL6aGnlQtN3N5Ju1ZohM0x5vChr6ZbxN5wt5Kt+sU7aKJk0PDeqdh8oVixSjS
         1LbzMlIxooKgGILdXkDo+heQJoCC1eP2YlPr3LGpH7/i1500qrp2baF8F253TF+CWv3T
         iF7SW3KzWyDnA6I5WLaUz0SPMVOJ8vVOcd8jFssYfHmOdbFojOZcOjQ7qjWHIakqeAlA
         Uu1yYV7cbYaRvmQQz+c5XKbAHFyotEOSzOzK9r9JiHoJkWVwqFcNSZwxmtuaFc31AQLL
         QjD/kJ24/hmPM4n7MTFa1pDxzAw77jcc4i/QVk/otPxm6C8sQqvEo1mI2GHgzkxhNv3m
         37aw==
X-Forwarded-Encrypted: i=1; AJvYcCUtK9xmadVSxKt9sCTw/rWkTOZzQWTjx6T/gpNpbrI8rhbQMegy7FN9z90RVLrw31mVxVWAB/FRzOEYig==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfP4ZWmmht+0p5E9JC7dMkfNBpW6tsSvMsPoxSl3bcBB9Mboa0
	Zuxmh3mGwhdKrTPeEh9ruYF37r+QuMEaGXhwmowz9XAtGr+xxo0jpTGtXlRo3UU=
X-Gm-Gg: ASbGncsAv8t9XZCGyUWITrahwW3KW9Jnv/mNP8zUejrw3DvjpnV9WvXAetBeQAnKlj4
	fh7QvuISLD1KiUhS8YM1fWcP+17SDeg/9zDgpRdspNsUHy2apAOHXX4+pSF4xbJXUP1chGOzsWJ
	6Mi03HHDVdLnZWpICBuojKzugsgSH1vZs/TEeT0dVunOqM6RGeeMemV1n+sFRs0YJBBvzjZVFpn
	Ro0PJHx7UKK7eDVM1zUGQSmWRkJD1eEYuxarRqeEj0lqyd88k4G3mXrK1I2dKV0nd87cJ+BABeQ
	ST3Oumc+JZdmySr0/P8MOziRU3M/bOWRuub5vm7BOerl13OxwTAb8YevDQCIhYiq1U9LzaLTiXN
	n2DpXKy4oFIyaEH+Vk3o8IfS7
X-Google-Smtp-Source: AGHT+IHW4ltSCaG93SoWDansawq4DbhKwVMoGQNM/OgukHjVy68CtBuW9QNsRfgK8upO/XwMcw3t4w==
X-Received: by 2002:a05:6602:36c4:b0:85b:5494:5519 with SMTP id ca18e2360f4ac-85e2ca6fff3mr65533439f.5.1742499904534;
        Thu, 20 Mar 2025 12:45:04 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bd8c40fsm8341439f.32.2025.03.20.12.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 12:45:04 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Thu, 20 Mar 2025 14:44:48 -0500
Message-ID: <20250320194449.510569-8-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320194449.510569-1-elder@riscstar.com>
References: <20250320194449.510569-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_124505_526432_80ED2F47 
X-CRM114-Status: UNSURE (   8.60  )
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
index 09a9100986b19..f86d1b58c6d35 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -350,6 +350,18 @@ soc {
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
 		syscon_apbc: system-control@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -518,6 +530,12 @@ clint: timer@e4000000 {
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
