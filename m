Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA2FC71141
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BO9swpI6ixuPwei0RGrPchXJJyo+ArM7O8q/MGvi+1o=; b=3AWNeNXd6wKUPL
	EquU8518Hm/KkBfapHUbb2YzFwgs23NO5VK1uyC00PMyFdEwzh4NEDSK31J49bxZPoaDFliTqeyuw
	xVx97val3rec2xtOJ1Jc4sgDRRuG8jyx2haxVy9FQP1gq3leymnIcGi0neonMQV7iB2NpMgZOY/oE
	tVG4wUTBpLJFD2sr84EODsysYXfFRy2oIMzqa5ClBijFYVChlC8zoMYOVZcnYLFYA1DRNglytNNqW
	hdGBTvMSJrTtZ818wpBViwZYAN91i15vJOpfGSHuWDWL29mZcSZObXzpnRBbp1wkgphugrYRaaZ5M
	DHaVWZtnaxLHl96hcnUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5s-0000000AZJa-2H7A;
	Wed, 11 Jun 2025 16:14:28 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPL4i-00000009u9M-1dJc
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 13:01:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2363616a1a6so18970115ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 06:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646864; x=1750251664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSKx+jiwSQ8DJGzzvr3skZPVBhTTim+uSj665SiqoD0=;
        b=NnL00cHcdvA8QhG2EUFby4D/k4UekWRKDp/ygDLLGT6/E6Nv8vq+AnvvSs1LZPVrrt
         96imR/dTgql9MOkLLNvgb9bmSEBHkHY4KlKQ6kQdd16LZrWve090ESaDUuHDGLnMUU5w
         fvsiUXpK8tUSSbOAgJyDxXKmAjdyzdCgnPW/2Rk1noXbnAlon5/JFuiSUjQcLG4nmJ+H
         lPMJrTtl3GyRMfkEAJd3a8LswAIxtvn39+s/4eJ04fegFGZ8wnkIYxMZACRrr4ifMEcM
         Hz7a0O5nvPzbRConEMhE/xzgx7Y8QpVTihkFz2VKT78fxZB0MVeZ+SCMhfHaOv21gZ7S
         LEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646864; x=1750251664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSKx+jiwSQ8DJGzzvr3skZPVBhTTim+uSj665SiqoD0=;
        b=OU2tu2GGNaU4/maB46OTkrgI5vQNMU8H+YIZlAhxeyFZf07yAHmKSWLmQMcmm9+d33
         X4YLvFB4XGy4BLckx5R3jQQPSP/bj7bITc8LdGwDknJR0EQHPZAgcU7UGQQ3kQtAwzZU
         aZGn6M7AgoCuuPK/wEG86EfZwh4qYjSdWshj3JqeajPLLGs47FvePO/uC1aOoVWFlKTm
         ackIuBrcoTpWOGMKq1pAXx+WBV0d0JDmPiyy4JQ0J0rOeK1KLSvqBcLJ4jMWOGc1S3kG
         NH5y5iHY1e29nrD2l5AelWP+ek356RQJgx6PiMFnyHho/M1twLJZIZMXKIO9TaIdzLlw
         Lr6w==
X-Forwarded-Encrypted: i=1; AJvYcCXKOQuRhoUzmoOmX3Y2+Xj57B8i8JSYdBNhbjA/1hufA+vjaZ7pPGQNjNic9v4CuZRg6NsNxQYJGAUM+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxgP/DFG5WAE7ngsRU28REaDeMeAiC95LrKmFZM3FKkDFFMwTR
	aE17+UsVHXm6eQlcUsLiu08Cx8eb19ZVCsp2QDtqUUkeozW50CNi/sWJ8JLXYcf+TkI=
X-Gm-Gg: ASbGncsN20+FqMofJQHMVdGst8BYAcVCI+Jn8rNJhPdJx3khL1M9pAz9x29mnYrvh3d
	uOOwBFGIvH8byrQ/xW6QKSXJzMasML8MjvD6suOey6iAZrqzTYmEcZcWNrmyNpxqUDbk7yGuBHF
	KWmRrzmhZB/JfJWc0TuLA+ZEWrrBG5FoUWeACTE2gCZBBWNUVaB2eShyZoEchCpZKP+q6AM1BV3
	awkTyVE8SbECP90huZonqMfqUhAJEnGqCw36fHYDPPrgn8iECi4UtsA1HNA3S5nAz19TZvLCOw0
	09rrrUCQuWZsl8NvhltMSMsBHaRVtoaKw+OXzsHNmM3/e96WOhZo4J1J3Nyt9MU82ioC1PMew+k
	tujpIuw/gMwiF0pfRGc9kLl+PzQwUww3+
X-Google-Smtp-Source: AGHT+IHRhbcivXCxN135O16ueeb4/aUJWfnS89ixSiurI5FZ7uV83frEUoZkuyXDNWNmUKyh7r0P9A==
X-Received: by 2002:a17:902:c94d:b0:234:8c52:1f9b with SMTP id d9443c01a7336-23641b1553emr48488375ad.43.1749646862200;
        Wed, 11 Jun 2025 06:01:02 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.06.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:01:01 -0700 (PDT)
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
Subject: [PATCH 8/8] riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC
Date: Wed, 11 Jun 2025 20:57:23 +0800
Message-ID: <20250611125723.181711-9-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_060104_424840_5C023A8E 
X-CRM114-Status: UNSURE (   9.18  )
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

Enable CONFIG_MMP_PDMA in the riscv defconfig for SpacemiT K1 SoC boards
like the BananaPI-F3 (BPI-F3) and the Sipeed LicheePi 3A.

According to make savedefconfig, the position of CONFIG_DWMAC_THEAD=m
should be in another place. It was updated in this patch.

CONFIG_DWMAC_THEAD was initially introduced into riscv defconfig in
commit 0207244ea0e7 ("riscv: defconfig: enable pinctrl and dwmac support
for TH1520")

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/configs/defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 517cc4c99efc..83d0366194ba 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -134,6 +134,7 @@ CONFIG_MACB=y
 CONFIG_E1000E=y
 CONFIG_R8169=y
 CONFIG_STMMAC_ETH=m
+CONFIG_DWMAC_THEAD=m
 CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_MOTORCOMM_PHY=y
@@ -240,7 +241,7 @@ CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
-CONFIG_DWMAC_THEAD=m
+CONFIG_MMP_PDMA=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
