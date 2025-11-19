Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723CECF31B4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 11:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vzv5iKD0srD+EwDJIsW1qTUTP5zxLzNHCC9N06OjrjU=; b=bGwj6OZ3aDNfvW
	5rsLSwF4um70YtNc6En27aVcsZ60BkQ5EPT6weSPxgSofinvjtVZy+Jxcvf68fiBK5hqPdDi5Cx7M
	Y1VyGk8/HDiVTrsQSIzEHh5Bc2DrT96Pgo5rTXgEdco5XBXtCBRQUAyt0EAaa6XHnmYyejrTKSexn
	NXD8wJsECknbY08WOJMdqqek/528PKgz/yDQ+q9D5sZTx46evLsusHhFczQBLk3upgqS6JorE2WbT
	2LDowDD8QreNoTmaCyBpLivUKk8c7w3yANFpkNU1ln6vbNp7cKmXaavxCIDr3ssKzUdw02j9xY6KK
	2c8N40S+4ZNpuGMqXC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgkR-000000034Fv-3OiC;
	Wed, 19 Nov 2025 11:53:19 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgkP-000000034Fa-2CvG
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 11:53:18 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so5408294b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 03:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763553196; x=1764157996; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/dJIwW/N0kWg8cOXmaaT2vRpR7NNxpQwJA/W7KyM2QY=;
        b=L8nBiXnU0cZiqvSmxAAyFiOPe7JHQAfuvnK09+cXC/zL/fI6STUUTYSOUH/fPEse3a
         KrnVjhO5Skc0zUTaR0Si/ZS2govyj37aCOQr8qp8evqtHf4cVhwqjqTCb1+vgS2fRv3L
         gecJa6xj7rh7HQ1i+KVFgzuxGjYK+q+SGxoRyBxDTAQhHp8DDB+wbImdWtpFQNo45rAf
         89GVpkX7ym+WS1ruhBgS6kWq2E9Jh00eGgOjiyL2PGzGz1RRXfIHEWntZ62YDcwcRPyf
         Z62mZVJhzdoJEVHdSvjo7srIPps8tnPusl3ho/c3JrwJT1/0FgTCykjge5y5yR/it3yN
         wqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553196; x=1764157996;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dJIwW/N0kWg8cOXmaaT2vRpR7NNxpQwJA/W7KyM2QY=;
        b=QGrkF6kqHacGAeSySxqgoBufDftgse6t0ss5Jidfacj+vwAlg/88AmYH/epidmlh1s
         MCw6+w5TqVZFbNKxGWjF1KIYsvtRzXTZYCALgfBX5tviggcaQk31yx5SeLyg8Rv7P41H
         mODuqZk8cvd72TtXHCcqTXEU7888qWM+RN7xHJ5cPXFwR2QGjJKb/H/vOvwaL5ur5A71
         dxAi8i+YvyEj6UdDl+r2RIKB4QsuRHTeTSDHCXZUAv9JzcDUMuAAWweaNEkME/+Y5h6a
         cJqBuVQ7tX/9uitnurunT5zLEAMjuEyzu9bdQ/LMGBU05Iy4cxHFtda6bt7cjAQpU24i
         ejpA==
X-Forwarded-Encrypted: i=1; AJvYcCVYtKQPRz+CIMbTZ9e+X0ZEVFg2ckHspQ8WYiFvOHBt0zsbqLxLapD5x1iwfxckUWQFDqad8qVo4scqjg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz09qx8Y17Ay9NMP1CyHeiFxECBMr7koFyWRNUMw1m4f2HrCVvQ
	1V+24FIUz7bxHyDwDSYKprcU16EmGZSX2wrqPhI9mHri2Pjqh+J3y/TY
X-Gm-Gg: ASbGncsRpxUMk2jYBdRs9lDw9sVBR8RdOlQn4rXftbJVSLAUb7zAuMBKhNBfx1Ghab6
	pcsxgwjp6pjUUnxVoE5qNPWd8mmB7bPLDziu6uOnyrdA3oLJs3uLZSWd9mTTgm1vwMSoSh202vN
	VhoE2mJ0R3VnH5zB3z8zR7nel0f6r/51stJPuTCZogPZkq02kNVqAeLU3gXT4ixjeLUAZyc3oo2
	Lap616SSJS2zDoC/s/dYosLC7hfm94ogpa/nyMqejw83fVgIZ/i1EPwYcOab05RHLLGwZ5zVni/
	TEyga+ZSwboGcuooMrGeaOcUrXNUn/4reZkHlf0a2F8N6lnqjfIFJRw6GiTPyFGEx6nbMOJnpho
	CFzHdfDRlfpfP5qDOe2pOws7yNJdnC2mZqvcn7Vh15OaKf4DUzWN6tbvgv8EIO+kctNGPtN7XT5
	UKiXP0w+H+bKGF61lxXA==
X-Google-Smtp-Source: AGHT+IEJfBQbQgtvUYdmvQBm2UrCj4dLEyRvU/IrmcWNvI430xMQUCHPm5Ptcge8YsrdP9W2nWxZkA==
X-Received: by 2002:a05:6a20:6a1e:b0:350:b8e:f99b with SMTP id adf61e73a8af0-35ba2195757mr20706141637.45.1763553196212;
        Wed, 19 Nov 2025 03:53:16 -0800 (PST)
Received: from localhost ([2408:8410:7820:651c:873:1d7e:7195:d122])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc377dadbc8sm17903908a12.36.2025.11.19.03.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:53:15 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Subject: [PATCH 0/3] i2c: spacemit: add reset support
Date: Wed, 19 Nov 2025 19:46:42 +0800
Message-Id: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACOuHWkC/x3MXQpAUBBA4a1onk2Zi8hWJPkZTIrbDFKydzeP3
 8M5DxirsEEVPaB8icm+BVAcwbB028woYzC4xOVESYbiBlypVTY+0E7vdz2QXFFmTEU/lSmE1Ct
 Pcv/bunnfD1r01blmAAAA
X-Change-ID: 20251104-i2c-k1_reset-support-12784e17bf83
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763553189; l=680;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=sYgOih9xbGs3F3XHTRJ7fvFo+edeOEgNokHpkprwd2A=;
 b=IU3xRJcKwpUMoWT+rUcpgurcIY0Jzk1f2odi1WOayQ+0gfEARL+PNmM6B8g65taYKt+zhWcGC
 fjXVZc7Ex+oBBt1B5JeclzBIvBPoPI9A4W3sEEPVkZ6EWs87z8jBBGI
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_035317_596023_A4D54E75 
X-CRM114-Status: UNSURE (   6.03  )
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

Add reset control to SpacemiT K1 I2C.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
Encrow Thorne (3):
      dt-bindings: i2c: spacemit: add optional resets
      i2c: k1: add reset support
      riscv: dts: spacemit: add reset property

 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml |  3 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi                       |  2 ++
 drivers/i2c/busses/i2c-k1.c                                | 11 +++++++++++
 3 files changed, 16 insertions(+)
---
base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
change-id: 20251104-i2c-k1_reset-support-12784e17bf83

Best regards,
-- 
Encrow Thorne <jyc0019@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
