Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0CCCA9EDE
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 18:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PYT9pStClWnpYk3+0a4HCbegBQIrSBdSUZA3VILLXEo=; b=DIp+4ouEs+4bCC
	ulzCrqkW3EcnYYLCuA8NAoKpzDXtefXf1it9TYs0hHTWnKYaeEZANFY/Ww9luxvS+/dJ38mcIyuyP
	BBxkexzlnRPV5uNGYro5JzLAkCnVrLEKyV/Eij+bKCSgF49yn84H4Vxgu4jYIlGFC9M0AlhIP7aJl
	xTXQte8hL2TJ4+ea9uhVmFNXy4CpTFHZL+MZ/iPX6clSfHNZQ42K64m7rHwi29kUerqB8PkMAT7kR
	oBew8gdLfdHFHruYBYImBxmKzsl4z2QjGFfihaGoroRQDPdyh9eujoxbOFk5pm5jClk6CerRKzjms
	jMPAtrINKp5jwUa0ksyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKJi-0000000BAFp-2154;
	Mon, 12 Oct 2026 18:00:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKJh-0000000BAEm-1qKJ
	for linux-riscv@bombadil.infradead.org;
	Mon, 12 Oct 2026 18:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7efvOtPkVQs2r0jJvys2pZpGeATiCwhTrDVdy86Rwg8=; b=Sbqn6illfWvAq+uqTaMwr2sxfD
	cPVkXEbllZDm/iKNfAZS7OE53jHuo0t5ZybFrvSpkjgtHSQpT7cbj4QlPtg+BF/GlI/9WmKJNLS4+
	h/oDMxKR+gNAevc+uP1lXvzqAIuyPi/m/EGFKCy0hfA8U4eCsHcDhF0g+YQDyu1if23+KITTlVBQa
	ZOFyx1zKXXdJ2tfKgSSRqW86O9ImOtudr4kvWhf0icJh3psCMQZ331CQtlPRf663Hed06+AL41fIn
	xeuaYyuRgk+rUEcZM1Ptoc5n31YAsuOKYsimgxNAFTJuPq/3gex3fDAunAWX7062zad32+/+HzEor
	wH2yLydA==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGKJe-0000000Ej6M-27Ui
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 18:00:04 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso15005615e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 11:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791828000; x=1792432800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7efvOtPkVQs2r0jJvys2pZpGeATiCwhTrDVdy86Rwg8=;
        b=p46KUBmH1voUDn7tk/zYNTUmCJCLtlM+TA1drOwfvyJBZu/sDAGZxQyWuCNIwIA6TW
         77bx17NPHLaf32FEmqkG0AJOIXUBqJ5JV+Z6YVL5DA5DE1X3Z8TfknDX9CSUFd9mgu6U
         73u4vSNX8nQ3T7OwTOHFU1SuqkocobX92oYOWjl6c4oTgUwGMc8zAsBnRY1n3mv7NJat
         /Xh8IlaUKL7BOtjPtMHVhGGJJRdNIdvLA860E5CcKWJHQ0V+TH89yqCyMTRi1vTI5Ebx
         mc1igQEkI3fhfMykuOFCdJDLxi//5tnYwYwVarDsXyAES8aQmrL+vaXuhy2atiIyTbQY
         eZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828000; x=1792432800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7efvOtPkVQs2r0jJvys2pZpGeATiCwhTrDVdy86Rwg8=;
        b=VOhlnBjsMf+tFtVb+dyFebVPowfKwMQhowacmlw/qa8G2PpTWgpq2yDq+BTD1QJwrr
         StbR8bzSXA11k8R3acG0dygjWlYwlqDf8X9EwAGa7x7tgk/x2dRk896V/VzVKUfnLDTZ
         Z0J+FEq7Xs1smompfKK1pIE8htpG8ZPZMP2ct68ntAMSQgl70QWZzmwFUbCLEJTT1ysj
         ahBv0CxhH286xJ6lBZE7Hey6r5Oc43sluSlgEqYiXGZmYH7Idz8tMTXEGWcZ/MwDa2yc
         6ot8VzDPJohxiFN2FCdwsyLlnNyMHCmKKOR1ZXORZ+a3YOL0WMOZdyB8XNhiA8wpprQs
         sb8w==
X-Forwarded-Encrypted: i=1; AKwUvBzOB6MeM48PKmvXM3ca38VebUGJTyTFEMcuSFpK0YbxnSNLuRKWBy6fHYlUvN+5ua7+nnwergQkb1i2VQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ0HAO3JElntDNpn+yBTaZ8Guwii20tfBf/4VGfgy7e6Yy5VqXE
	r+jALGPjbduN0PuJxiXd6luBEoCm0wcg1D4ZxrT47Gl6j/bb+tNPgimJ
X-Gm-Gg: AYBFou2j3Miwya4tznnmO+hJHRFQ8K8zNieYgeuMbn+yWwstqMJkTZWPKxiE/Wm8w/Z
	go6ZQykLriMJPweAQVMEjfHNooHVLmUI4VbFaqsnGmFIRAqfmM4JzZWxbZuWf2QXfrToJvQ2X/d
	2vowliDbJG7ntAoJPD1yeRO9H0C8wYURbH2moNTbFSJMuS41EqPTORrGkH8X4T4CNDViOPd+owf
	eFNQdOx4c+YKx8i5NP8Ths+JDp65XXl2z0Z8boPFz+BeLiDasR9GCx3HU0on8SNsGBZ3zHU9k0Q
	XW4YOyDVff3nDARoz4gCmYxP1iK7SDgNETfTH1owcaURi/q875MeM2lifGO/VrBMnG/waONCwSn
	CI4tRcqqRkO5SgNmVg+wIYu9NM8u2/IEXKiAfsAmSbIc4H5F+uJ6282MthoNp8dgQ6gx6lxYpuZ
	FBUswKbZbmr1PpxNpQjYUPvsLlfg7ACIN/dicmrhN0fGUqQgMVa45VfweSPxT4uT9DfCdrrVC4v
	/MbPWsof4FUz7Of
X-Received: by 2002:a05:600c:83c9:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a18e4ce9cfmr193832545e9.24.1791827999830;
        Mon, 12 Oct 2026 10:59:59 -0700 (PDT)
Received: from hp-z640.fritz.box ([109.76.80.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm561705395e9.9.2026.10.12.10.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:59:59 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
X-Google-Original-From: OOHehir <electronicconsult1@gmail.com>
To: m.wilczynski@samsung.com
Cc: Laurent.pinchart@ideasonboard.com,
	alex@ghiti.fr,
	andrzej.hajda@intel.com,
	andy.yan@rock-chips.com,
	aou@eecs.berkeley.edu,
	bmasney+clk@redhat.com,
	chaoyi.chen@rock-chips.com,
	conor+dt@kernel.org,
	db@domibel.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	gandalf@winds.org,
	hal.feng@starfivetech.com,
	heiko@sntech.de,
	hello@big-grey.co.uk,
	jbrunet+clk@baylibre.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	jpeisach@ubuntu.com,
	kernel@esmil.dk,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	luca.ceresoli@bootlin.com,
	m.szyprowski@samsung.com,
	maarten.lankhorst@linux.intel.com,
	mani@kernel.org,
	maud_spierings@murena.io,
	mripard@kernel.org,
	mturquette@baylibre.com,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rfoss@kernel.org,
	robh@kernel.org,
	sboyd@kernel.org,
	tzimmermann@suse.de,
	u.kleine-koenig@baylibre.com,
	vkoul@kernel.org,
	zhengxingda@iscas.ac.cn
Subject: Re: [PATCH v5 00/21] drm: starfive: jh7110: Enable display subsystem
Date: Mon, 12 Oct 2026 18:59:41 +0100
Message-ID: <20261012175941.258219-1-electronicconsult1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_190002_630327_659DB0C6 
X-CRM114-Status: UNSURE (   7.89  )
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

Tested on a VisionFive 2 v1.3B with patches 1-17 & 19-21 of v5 on
Linux 7.2.8, plus the clk patch that was 14/20 in v4. Patch 18 was not
applied: it conflicts on 7.2 & there is no Rockchip hardware here. The
same kernel also carries the out-of-tree PowerVR BXE-4-32 enablement &
the SiFive XPbmtUC errata patches, so the GPU could render to the
display.

- The dc8200, the HDMI controller & PHY & the vout clock controller
  all probe, with nothing left in deferred probe; HDMI-A-1 reports
  connected.
- kmscube (GLES via zink on the PowerVR Vulkan driver) runs at the
  monitor's preferred mode: 1683 frames in 28.1 s, 59.93 fps with
  vsync, picture confirmed on the monitor, no GPU firmware resets.

Only that one mode was tested; the modetest sweep in the cover letter
was not repeated.

One error at boot:

  i2c i2c-7: of_i2c: modalias failure on /soc/display-subsystem@29400000/hdmi@29590000/controller/ports
  i2c i2c-7: Failed to create I2C device for /soc/display-subsystem@29400000/hdmi@29590000/controller/ports

inno_hdmi_i2c_adapter() sets adap->dev.of_node to the controller's
node, so the I2C core registers the controller's children as I2C
clients, & on the JH7110 that node has a 'ports' child. The display
still comes up. Should the adapter get no of_node, or a dedicated
child node?

For patches 1-17 & 19-21:

Tested-by: OOHehir <oo.hehir@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
