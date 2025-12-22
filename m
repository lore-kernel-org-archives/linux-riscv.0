Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B465DE674AD
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 13:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Vf9Hnw0Xft/Pm743177Xg4amcGD+VlDAzipJ8Xqg6o=; b=WO1DPHHpWmnGZX
	SyoFW62Ev1o/tfxkk2cHTkaEuKyIlyzCllK567rQhgoDjMW4fVejhxD4d9xbiagreuM8eB1A6LC2/
	s7IxVVK+FcxTbM0c5lFRIzLX1aKnAETmf+EAmQm0dY4zsordUOHwxlvFR/Px3e88DsFBKl4MvTUYU
	/30oEtXCXJ2Z6cIVnii0yQjrpyUAQF2VY3r/K/5GUfkY7ZVA10waalepqOgElu1h6aBzuCv+7Mlu6
	4lULXVT0ERX28JnIWtHY6Deeo3iAaq43h8uyhDBXZTaTu9y6FVpsHdF0iTZ1nXOfNuDh6DSY0cJ6x
	baFhX55ww9sBFKuRVUGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfdA-0000000DmIR-3Zy6;
	Mon, 22 Dec 2025 13:07:20 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfd7-0000000DmHC-04b6
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 13:07:19 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-34c3259da34so3902044a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 05:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408836; x=1767013636; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmSKFLQJJOcL/UHZMWYDxU5qPoFtgd6eohGiohbnOX4=;
        b=KEwEEoe3UpL/UmvdQzQtR/nsgtEzAKH4Z36guBT8h1ZtCnlL3G5RBV5grmMW4h4Mpa
         FVrWM5KAX7mq+pgjRDbhUYvyG/u5xiELGkJT+P4pwO7bSlpYCvb3AwBidBYKmeSlsG3I
         erwNPYsA59c3MKz5w070cv5QiqbjJKjgnTihZ+eHbMsjV7sM8MArAY3AMSqJt1UE90GO
         Lg+5qVe1WL4iMcEBcGZniFii6AlzkflOYu6BnObq0xTzrlxK6UkZUn6aeqSk3bPyemyf
         HiWeWhvAFUHpsSSqyP+IVR/VmpG5Wwp5LhcUolskK/7H2IjBgkRCl4EOAmOpp28/ktCZ
         nLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408836; x=1767013636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YmSKFLQJJOcL/UHZMWYDxU5qPoFtgd6eohGiohbnOX4=;
        b=m5h2XtTmys87LI4Ng0kTQaT/R/yuGo8F7uKigJAd/AWXMQB9d/rvPzn7NrVfDunAXK
         hNfsuvd499VztwUPGXg7wNsTL9FZE7Aswfeq4ZxFhJKsVUHLmGHmqrNIzYtbwTgnl/fJ
         8tzfdS/MepKpE9AUKuULyx7dC5An/vYRyjo6cPj+RE6bDAVyChFh00ZtBzSemt+TZiuA
         uRyhme3VPi3eNKYJ04Qdc92LuaUVISOcsU4miH5TtctniTtzQjVMs0gE91yJQE8Frgp9
         VHk5Dof3G6GUIzpzcd06c0QQ34c8XmTFdBM1XsbW32kyZj3nOWgH2igB7gQKtHRBawdb
         Rs/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfzirQzIeSjInLhD1TVoXt9iCzj8AqqnNphvUeIS33hJryuF0EaZyakp6sHZy8x7xmVwzw++MT2sA21g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwO8E+t28PWSYWdgC2I0isfyBUY1PX5shATkUp9EhegsWdhNae2
	74/pOkp+AvXc10aA9sx8QBxx1nyKlBkFIPA1qZ5SjY6OlBGEBX9VG0VnjBvTLfdvQ28=
X-Gm-Gg: AY/fxX6sXL1jbqWVRZKDICkQhnralUfM8I+WoC/L7I7Z94DwxazMq/y1LKhrWae77sl
	4lUKwgQ6its9S759Rc+hkdVO0eXj/iHAxqtrrAez9vCiAKKEACxYqOg5b9nu662GQbBXFmfe0PI
	P++8ISzJ07rloTJ1FiI5oaTAnKHpIajo3wP/p3NyI3NushhQV0JzCgMoaJQ89Iyq0HndbnNCKKz
	UhRQRLHgg6M6vKBYc+wz/7yvjJ98uKaPpBoka6X1C5g5SzycXWRpZLRLo10i74eM2Lz7NsGx0U/
	ReGbuL04auA8vRcTnsMaNScNTihw2r9r5ncBUkuZrTjaQX7swP25Lw5fAepRGigpNSPSDgUDFbG
	pQACmAArd1mWQe/CUAIkwsM4GEGKhpF3hnpZLgc9wj7ZxYoXAbGA9q7snJ1oAoXq3x62EK7pSHd
	tSwMB3TIHCqdqMDOLOt3Tf0PBxpX10yOZlgMEdq3suBA==
X-Google-Smtp-Source: AGHT+IErkmtgUVNEtdp486aXALGkmaBg1W9XZAspgQDXTKlho7yIRKAUKoJehNC2P2iVciq0Y+zRRA==
X-Received: by 2002:a17:90b:4f41:b0:340:bde5:c9e3 with SMTP id 98e67ed59e1d1-34e921b73b5mr9241301a91.23.1766408836378;
        Mon, 22 Dec 2025 05:07:16 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:07:16 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:15 +0800
Subject: [PATCH v2 05/13] dt-bindings: serial: 8250: add SpacemiT K3 UART
 compatible
MIME-Version: 1.0
Message-Id: <20251222-k3-basic-dt-v2-5-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_050717_075631_F7771A44 
X-CRM114-Status: UNSURE (   8.44  )
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

The SpacemiT K3 UART controller is compatible with the Intel XScale UART.
Add K3 UART binding and allow describing it with a fixed clock-frequency
for now.

The clocks and clock-names properties will be made mandatory in a future
patch, once the K3 clock driver and device tree are merged.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Add Conor's Acked-by.
---
 Documentation/devicetree/bindings/serial/8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 167ddcbd880058b6dcea9ce33bd814ff8ba6b0f6..73851f19330d7f9fc254efcd32b5977feada0b07 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -160,6 +160,7 @@ properties:
           - enum:
               - mrvl,mmp-uart
               - spacemit,k1-uart
+              - spacemit,k3-uart
           - const: intel,xscale-uart
       - items:
           - enum:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
