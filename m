Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2932CCF9E0
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/x9o++0I60pExkrwXNue3BMxtE2zmSPJv7Az6pFMSo=; b=g9YLPN8AUKeHLp
	4FsSet+fc66rkrF6CsBTl8sVEDDSNo0Mta9zxj3WXzS17+cL8r01T2ED1f1tqldtX7oQ0RIERKbMl
	jgme1AanZIl7Fm6gJ57iCJtGd+BONzoYk6F8/y8ZMeHqUROpHrhQQSpQMK7uDGNq0Oh4eG9ThK3Zp
	QMa5kll+paoe6qRc99jh/awDagQ1JHRaWCAPFaQV156VLpsSO9oRvuA79Mq7FfOs8AIyEn1dZ0Q/O
	t0Ss/IZ/EuCbPTH1c7RdSQWJ3SW2Xxy3D1YehzIozWuawJkMOmn3buKg1f2eudFLJ1eBV2O3My8I0
	Wx4/aQ7O2OnB5wxDTGKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGk-0000000ALF9-2OhC;
	Fri, 24 Oct 2025 19:16:10 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGg-0000000ALAB-2Y2V
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 19:16:07 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-92aee734585so104377139f.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 12:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333366; x=1761938166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqAg+X5UevD0Vc5aVJRCRg1w9Ar1312tYZnooFCReg4=;
        b=kXqv0a74X6ppH4PzcKICiVY+odFT9AbY6LjhT3gASH0xworp1xj6EIG4spR5X2knyL
         JvIdSvSBqYADARz3juNS+zNWVSmP7w+fUrHonLsab1otQxE1VqIaQzanpln1dLx4dMv5
         51Xw6AYsFCr6+V8b7WKnywLSBo7zrEwBj0iONVECSvSMx5LEzfKw8QopRXJuIlfJX0SG
         nbEzdOGxHUlxPbDMvEtwQa7U7GyBmY8o1Xi52Ft1K0xHnQDspLVLCjK+qWHJK7otxTP6
         qKf9fFVNOiz6m/J0i4/8psn9DE2O2VyUb9IfgIAW/7lg8z7aZUyQZDk6/yiLEPcY0HMI
         QHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333366; x=1761938166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqAg+X5UevD0Vc5aVJRCRg1w9Ar1312tYZnooFCReg4=;
        b=nliA2BWAkrzLeh8vzm39s+vi6Vr6k4gpt9x8tdqIh2jd3KHpykqObiq4GZVSFGCwhb
         xbI0wnopMBmoSD+Vm+nhbZVkbjsifSjKBth+ndukCoB+rAEGIvdwmvpieOA4R1yHsnzi
         mNhoEPaMMVCh7gZFHTnQmFlODbfQlZ6tcMxy3W47S3aSxEQXCU2fTijPfH7xvKhrfqhf
         sLlCctWJSD10ryNE2FeZ5YCsKJK6MVMhlvSMfK3IgrAGb3meVqdTyIcdmy7QX/wEdGGm
         VSfQZjmBTqUTsJLXtivHrtQHBRNtvA4gCGGa+zNg3npF07fCJ6L/x4yoG7KqzCraptCM
         oDVg==
X-Forwarded-Encrypted: i=1; AJvYcCVbHvpTBjcRcy7/ra7AqC3kU9HLKZY0Z3TWU/IE+2my4N3rZb05bercxTgIZWGPuH689XBGhoCnRW3q7A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7DxgRkX5OgsQ1fl2FA9Rd+wGlsD2vKpG61/Scq6shdGEEa2qr
	LdmL0bfFtWq0fX1B1PWwxh9wkqwa0vfe2YlfffT+Tv/l2iN6mIpidSYEVSQqEaGkDYk=
X-Gm-Gg: ASbGncuQDYAyqkiBXtl0V6B8AIe60B6p1wMEvOkf+ndlopdoyR0GYatk4bjTn5jdx/k
	/m7VHrPNz7XHaSw7DP0YTZmrDOjGfytRJOxIL7B14kqCdgyWdJmf5COIpZrWsKGobATZPX6LsdM
	c0QMBvzRskQVxO7PhnhGDsU2WFX+ASXaSpXyT8fsHUpGmYyAGNadi2qFvW63/ab+MDz9lQ+voma
	G+mXTUccmuLFAJHLrsmazEqUSRRCdLszU35uof2DG6pHo4RXdCQbRPs7o8I0nTP0qfXQ/sKFqV2
	sIXULBbwryCHth469xW+fbbUKzBCH6mTjocRZsQknx1D5DZHLJ07Z6ApzwoIK+tGurtyWZIE3o9
	64sx8Cs7lkhra+rBOhFgqIM7rUSFmAZho9xtbPe5gy+VJe8PepOWRoKjpg3v/3By0Jshyd8c8ll
	HlmWMWZB4rRP1VD5TRukujQ8upE8dgxvIawNIqamFGIEk=
X-Google-Smtp-Source: AGHT+IH0HEa/fKZomSiQ3WIIsMrU8mAuEWxrS7c1HtLkD8Jfco189Px8SbGm7/QbmcudIijpZWQVBA==
X-Received: by 2002:a05:6e02:3e06:b0:430:b147:3b70 with SMTP id e9e14a558f8ab-430c524ce8amr390406425ab.6.1761333365763;
        Fri, 24 Oct 2025 12:16:05 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:16:04 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	conor.dooley@microchip.com,
	dlan@gentoo.org
Cc: Frank.li@nxp.com,
	guodong@riscstar.com,
	fustini@kernel.org,
	geert+renesas@glider.be,
	cyy@cyyself.name,
	heylenay@4d2.org,
	apatel@ventanamicro.com,
	joel@jms.id.au,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 9/9] riscv: defconfig: enable SPI_FSL_QUADSPI as a module
Date: Fri, 24 Oct 2025 14:15:49 -0500
Message-ID: <20251024191550.194946-10-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_121606_646364_8EE24FA6 
X-CRM114-Status: UNSURE (   7.86  )
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

The SpacemiT K1 SoC QSPI IP uses the Freescale driver.  Enable it as a
module in the default kernel configuration for RISC-V.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fc2725cbca187..48afe30d42e88 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -158,6 +158,7 @@ CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_MV64XXX=m
 CONFIG_SPI=y
 CONFIG_SPI_CADENCE_QUADSPI=m
+CONFIG_SPI_FSL_QUADSPI=m
 CONFIG_SPI_PL022=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
