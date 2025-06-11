Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519AEC71134
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 07:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTPoNQ787ldt01/IFmwEWwgCqQzTI7S1lHQSqOWavqQ=; b=vsNnjFSVmo0Of7
	fLQLKXYt+UfTjE4MhMVGUUevERfFmNjvGlRnt0MthhyYxsSgdz4UI35SYe1tFRNktbGsQq27uN6dv
	k0IQYTVkHUjsDlSEJo2DMmHutbRYW9UNmmLqMKLgzTB10ittimUZD1ytxd0aeBCLdY34rTC00q77j
	LRrvjcO+KEfBE0j7pjnVw3PyMgUj21jM1MFOJgCw8UP8sNnvJoXUZJ6LZ21FsDv7mxFy6xmyiEHg0
	CFlAuvZ1/a9/ZgAfgS4XJY4g94rUS5+wKA3KLSJIIyaAyPNHy19kKDm5y8i8jsQffmpFiefzNW9ca
	jXN3JX1H0/PiHahWl4sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFoc-000000095Tp-3w8T;
	Wed, 11 Jun 2025 07:24:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjd-00000008x0c-2ejE
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=; b=gPVWE8SouPWD1uXMMIhiPDb4Mk
	gCpOavbYJx1MWjJ0JjdLItCeeEBUmwpnBquL0NGJvVDfoiTZGc+JHYTHrb4jC938047JsW9rweZ4B
	t7bqBuxx/40+syrIX6pm76497o5EIW6kYO/ju3dB1k227wPHiuM/gYY1KF4rkjN+arSnJg/tT+wCx
	jL9j6UWfCzJHMmvpPU89NNAV1bj+9wpsOUSbu7zTdtKJ425C4RTbjMik3hmHuuRd8qthJXt/w1v+q
	7B2A4hlnTsUih0IeQvuzf8mSbQZVTqwoAzgyiby6Vf+C7XoWAZIZ9ZPJPBHUY4Fhn6lbvmZkxa6eY
	Ft72nYyA==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjb-000000027h0-33nY
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:14:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso4209f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622490; x=1750227290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
        b=Hw8s0emTJkcvWVSM9FKVAvE17hq6oPjd2HkP+9ZUju/O2lTRBQaPP/k6/CTJRhmarx
         Jhee0tHS7VwxpuLZsqJqprPNgydE7xi5fiP9XBJb3NejKqEJF5bQaBkvhczPktk/5wuN
         /jzSflKuRBUlAFPkUJAre6DLuniaVWijnkyzTei1RvD7HuA6dlGPqjJXBHhx5gdlPolu
         tEmXuT+aKxCUvkHY8ed3abgrN7bIU+8JAdB0v+3sIp8m14dPNHbwRKEgHJkI46cUcK6I
         t2AE6uzpOMZjwhMMgc69olB5PrCYqZ2e4oWJWC1CI2UcqdZ/2ft0LflkqVOqFDx5NVPI
         2NwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622490; x=1750227290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
        b=TeUB8INlPlGjQ3Pre9gUtzU2NaBY4rMS3vOMwoEN9GDIutTr0H4ffSFavkjHaqo0kP
         Zv667lAbaJ/dFOE1VNxVEemQ1hX7eptQ7E74xvpDfqK+L4BcnYjhcRIVfcK8HIXfEWnc
         MiLHt36VeFnMNHjGzQZHXNbQpqRdE3rwMk7ZEgncqs8N7744kWwRtE4IQcwqHU8tgSKX
         keiicd2WsWbIRU3pTSjBkeh1qC3YjT2d7Q2lURlaBn2c7JfS2Q5c70/J+c+BfVjL8X4K
         5xaWdYTiK12zrraRCqHqYnQWuBr2hp6zUaGuuEStWdtoaUNEsJnkRQ9MCpCikot5vX2d
         Nczw==
X-Forwarded-Encrypted: i=1; AJvYcCWEMI1VFRf1jlQYzKKSr/BOyXPfnSCkjLa5ope2KSZF++FREFgjrnMQJQkU/cZWVNj6TAiQrzbTdIDuYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdaU5kQb3eEXU3J92aLpur3uZZ1tZsZ2V9BNAOkipoolTipK2Q
	Xmva8AvAO+jCkpXHvsuz/Rw1WM+ZP3NAXUNMDqg6OoW92Wtte2LAVnFjherp1qxRcXQ=
X-Gm-Gg: ASbGncu4sDuczvKtLYAyPOHWvZvs2krhO4wU75p1VQme7f1TMVRaHniqGYu6EjqC+4G
	XFbJ+RHoKGYwYL8euADNgYE9WGVSpPEcHvTcOdrFOvlSrpSFgZ73yYzJIMsN6z+sOT1YvytCSOX
	Agx8Z3tG9FEJOHjTejOBvGJcjasMGwzzAuRvebGUx2YKjOLPBo7/sFL9IEQ4un+ajj/PvbuSrhg
	XlXc62DI8XkOPp2laAkfFNDOZcJ+z8IEuP6vz/pwV9oYNp7WHpUqCvBIC0YHXuXMuAt2LS8yYZ7
	ZfCPj/qrFsUDI8g1pjWTiOuFiro8lieSEMMeXKiZgSEYW7qMpmZJNQS2BL2HgZfQidzOOz1Mo6M
	S4HxzsLg=
X-Google-Smtp-Source: AGHT+IGAMOnxxwJh6k3dhRiX61q7MpOsBjEBq59fXcuOB6WHX3+BJjfe7T2i67oqLzVzIqJNLPxm7Q==
X-Received: by 2002:a05:6000:1788:b0:3a3:5c97:70c with SMTP id ffacd0b85a97d-3a558822cffmr480215f8f.14.1749622489659;
        Tue, 10 Jun 2025 23:14:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:43 +0200
Subject: [PATCH v2 11/17] pinctrl: as3722: Move fixed assignments to
 'pinctrl_desc' definition
MIME-Version: 1.0
Message-Id: <20250611-pinctrl-const-desc-v2-11-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qi1eWzTJCENFCt5JAU6Fe0rVNJeWQChdweXO2MJK0eI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6oRdItqT9sxon4qbZGkWGmSQh5LLhdyjslx
 Lrhu2XhwFqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeqAAKCRDBN2bmhouD
 1zqVD/9ltJexCdYC0zqX0/CADjrrprRtZoxnsBy1fZlMCSHM//l6RgsH+zTI3L4z8D6hoXjSN7+
 kCqzJiEtHxlNkIPRSofpxJdMN4X7bnalI2zDd6X/0XwoGaFls+DBLvGym8L/PCBsw2XF6cR3Y/r
 vpnXKGcuteokGneH3wAP8Wpef9N8QOEKtMiJgtAGa7mfmPf62QTORx1Zkeyh+u+BcEHykALKzL/
 Noyc7nXEB+ywMlt91FmmpwdT0bGGf9FjGJmjXa8Hri/2a11cypStJu8pW9p0HkP0MylQcHwxAGf
 jgwyFEj9f563zIfknjjRmB07L+vhdZjrMHYuRBDARPoDCUZ/wAtWSzS013IH8KTY605CHDkDDXg
 W7tSAeJ8dfweOfmy/LVBOJVtADslkpV4zDk6Ou7cBz3IT1L3JWzytd49gj2sQZFwH8ptj+6LG/f
 hsGg4yTdoyR4r/xZyN/skZHugzysRD1LuBvV/hx+QjJaSJHmmMw9cwX8jnWFkrFO+jtWYrWNehF
 DXTusW4HtBT4feez8bRSM2jUI5kSqnYHNa4Er2ZlPLiOyqdLWrMd0AQMTP4SRLBmhsJQCbfTvHt
 GEjwdyXAIiLXyaogHeIulwyIiEw52cJ/3DShLuesPqxk/vnnajXOS+ikRv6n+kyLnyNEybCOgxA
 x214zblWxgJp17A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_071451_855952_6A5DE5F8 
X-CRM114-Status: GOOD (  12.51  )
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

Assign 'struct pinctrl_desc' .pins and .npins members in definition to
make clear that number of pins is fixed and have less code in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-as3722.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 0d8c75ce20eda97627aef773342a0b63ff6114a1..ed7b2c482ff0bb6a546955c083ef7046701527b0 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -422,6 +422,8 @@ static struct pinctrl_desc as3722_pinctrl_desc = {
 	.pmxops = &as3722_pinmux_ops,
 	.confops = &as3722_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = as3722_pins_desc,
+	.npins = ARRAY_SIZE(as3722_pins_desc),
 };
 
 static int as3722_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -550,8 +552,6 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 	as_pci->pin_groups = as3722_pingroups;
 	as_pci->num_pin_groups = ARRAY_SIZE(as3722_pingroups);
 	as3722_pinctrl_desc.name = dev_name(&pdev->dev);
-	as3722_pinctrl_desc.pins = as3722_pins_desc;
-	as3722_pinctrl_desc.npins = ARRAY_SIZE(as3722_pins_desc);
 	as_pci->pctl = devm_pinctrl_register(&pdev->dev, &as3722_pinctrl_desc,
 					     as_pci);
 	if (IS_ERR(as_pci->pctl)) {

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
