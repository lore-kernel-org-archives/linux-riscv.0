Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA07C3ABAD
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 08:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97TiNw/0bSgADNcGx2vGW8DhUlFFbWfuZ9Drv9vpD88=; b=Fh3kn5kcAWFrAO
	aW/FH5GyuPIbfMxY+UjP2BHu+Nb/DXsGEJVys0gaAWgnp0JdYd3RK84ysDqdSOcyafMkUV0WHceSs
	zXcIZQOpTXXqU1usvDxKdOdt5qFMoLFBBf6RyfchTSVY+FVUBerbs28bc9O8podhzNSgwG86dUCDt
	+dAEqpw3djDx3auAEasGZ+sZ+Wc2GYbjJfcU3pRdEUA5M4fveqsftJPTJEuJZQqBGM/L295HqRgBG
	d0CpYVcfJUcYvV+lmZitiH/Lmpvf09Bt4MHrKRqv48KXz878OR/mN5O2mVUt39+6Q90dT+rvaDApc
	x3z5jFegl7n02jMKMiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gma-000000091tf-2Agr;
	Tue, 29 Apr 2025 08:57:40 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ghk-000000090gx-3eym
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 08:52:42 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22da3b26532so49138625ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 01:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916760; x=1746521560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mEqVehBRCDyoxu9q2vBqacMHsZUXwyFpRPZVYhXUX8=;
        b=jhcw6imxqBrD7SvAWHgW8Ub152UlYuKSd5SVcu1vgDodthWmNDMjdECuRUV6oIR4Sc
         9CjT2Fg9pedUmBGumxAeWUV/+vfPCSCr+KgDVqApWg4/jfI12nIxYnb7IcoTyQ2nMhCt
         8TqTcRX6WU7q4jjtmTykZE5/bN6Vjx7ULycnq7Ac04a7H+QP4BjLVwzLR0VX/u1eq5JW
         deJTWJwYfBiTXBavTYf9K6/wA4w/mfnVXQji3k9ZMJ6BeNbZLjAD3+6c5h1BAv8d6nc5
         DKnpJxx0ppxq0hnrMkgnl6rAzkV5aFMo8oRcsesJOWSQ+zNTnW2/6NtHzQb5mbkRgCMg
         Qfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916760; x=1746521560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mEqVehBRCDyoxu9q2vBqacMHsZUXwyFpRPZVYhXUX8=;
        b=TgoqOkSYaRayS+Y00WkvkIlodo8njwk0HrdiN4LCzoPB7Y/m0V3XrlXeQffDe5bRqy
         qlEzF0ZihT1rOoI7lYyDXwz0OWKhENzYCBwUcFTHnlhZBchTdDgSn2ZTtKcxB32heltd
         GJeGcTxD0ZDO5DQJ/o/CXNdGgVTBoezmG4BVkiIq3TCkA6UM5i2Chu0j7E9Bcy/TO/+5
         edHFCKIsdj/icULC6L4E7HgKbOqd/f5VAVDbbwur0cp5qndEsjDWJPqphkt/2ilNhzwd
         U+BiOYRsJnYvOMg2h2aoIpxCUdjrivFjiRKoaRA+s0ba1JUmZD43FfEw83HSLTrQ7T0J
         3F9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0ld2pPAVuGgCGgfLmgw8RqGmcy0M55ssLDr+5KIpz2uevJ7cpUVa8mWRgveGT+aKMJuIkTGU+V0aG9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqHVgP4u0RHmilFJz1UUOmBdZehSgxPIVZUtu3Ip5tMUEyGQvY
	GLk2H6btPKHvo3y0sv/xDNmd7PUlh9Hov6aFae+Kej1dROhjuejpr8YtmZMrTqY=
X-Gm-Gg: ASbGnctH+3jLFUhuaJxl8ASi1uPOoBo4ZSyaQslyZ7/y+6HC+ddG22h/enbntnL4DW8
	qu3BQiOWUk9tICq1muwu6S/PsqZ7gvrqlUx1HVjORwZ0isIlG2D2SvqGA1HbT4fLapylRZWEsiD
	x5SMXIMicmOtq5Q+5Ikm68UN1id1TYYvAcb7HBZii+ZZdvxMCd1b3hqcG5yj9shUU3oY/GMyNdI
	V29u6Hl2lJ5l+Li/5L3oc+3+5WqyUXzHXdHaplHg7vDnlR4/UetEKEmSw5Nr50BBA5dSc7qGkDa
	YVFFKvNYXQRSh0k+ejcqZvAlzxGZLptjvYjAf+GuPzfrhe8yuTEZiG0BZrFihPjHYxCwu9LaT9t
	RJA3k7UfSyHAT8quO1b5AIvyh2w==
X-Google-Smtp-Source: AGHT+IGnvzbUWhLI/YOaGHPG2HlwGVUVLczRsChSXyhLNMaAX1vRU5+feyFIpxGpmIkb1IMqyytUCA==
X-Received: by 2002:a17:902:e5cd:b0:220:fe50:5b44 with SMTP id d9443c01a7336-22de7037cb5mr28009905ad.31.1745916760002;
        Tue, 29 Apr 2025 01:52:40 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:52:39 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v3 6/6] riscv: defconfig: Enable PWM support for SpacemiT K1 SoC
Date: Tue, 29 Apr 2025 16:50:48 +0800
Message-ID: <20250429085048.1310409-7-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
References: <20250429085048.1310409-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_015240_908552_67DA38A3 
X-CRM114-Status: UNSURE (   9.11  )
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

Enable CONFIG_PWM and CONFIG_PWM_PXA in the defconfig
to support the PWM controller used on the SpacemiT K1 SoC.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change
v2: Changed PWM_PXA from built-in to a loadable module (=m)

 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3c8e16d71e17..3c4d9bb8f01e 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -257,6 +257,8 @@ CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
+CONFIG_PWM=y
+CONFIG_PWM_PXA=m
 CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
