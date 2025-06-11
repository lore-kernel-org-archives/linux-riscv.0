Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514A8C7113E
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7/vfo+OKjLqQ/sK7/QAlNqKxtw0D9mcHHBvjzi3b6o=; b=oBBufkfHNPrMn0
	OqqNZXG/BVdHrxTEFYFgA9M0vQMRSvkFk95wzZHg9nxRTQ1baZ0Kpr9l0f0SAjXlil+oEFyiv9R51
	3oG/f2/55LzFrTXLgQPHL/imoRAzJnsx1XFDR2i2WDHVM/X2qYbTRbp6qlfw8dm6zlinbDmafqBuj
	9l0fHX1NhVcli9X33Qak73sBlmTd8+SO+m4PRJdoNduNlNCuMKyIGQQznDDnUVXGG9MgPjpX/onMT
	AocDTn1EW2Z2RhTOmzht2qj8cepKKE4p2nqeG+u85SaafBD6f9JdQvXOZ9pQsqaWw5U9UtZRj/Gh9
	mNSHcZ45oIhBKlBhpxaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5r-0000000AZIh-35ki;
	Wed, 11 Jun 2025 16:14:27 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPL4T-00000009u5k-1Xqu
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 13:00:50 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-234f17910d8so64285725ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646849; x=1750251649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3Hj23NsfOD62jCqYZdTyo05Iy3n4LV0OoIjBt95NQs=;
        b=lO64ShVZpDvIFYF5Psl5hrIjqyiWlHX80mOIkZaq6D79MsoqPocqIFDlOJB6zMXq0n
         mUd6hYMI0TUvYDgdl3M3BBItMMUMciIKXvnSCuGjqWN9T5bVXdqhUm5lBQJMaWfyN9Df
         n3Lm3cDOyETf1U6htK/1O9BbsNFJhGw0kGbHFdYyF1QJVm0uOWDICjcys65focSLBsXU
         oLYNWAmemvArQwqcjfqs5SC9U7D0vaKbm0QHBGzoX0vZb258z4bWG+L+1/SMgHPEIpWy
         Zhmil2/EvbBfisOAuaG5UUzJt6kgo4LwaDSMPHVA08y7N6pULv6fHJeBMAQMxQCBTYVO
         Gd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646849; x=1750251649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3Hj23NsfOD62jCqYZdTyo05Iy3n4LV0OoIjBt95NQs=;
        b=KyKY2XLMxDZLwpwQIyYj+unYmsYD4ZEMhiG+ACUK0RTYFBK3jQ3dV+u96Mt9yZMmsi
         HTNSECDy8ee8Kb8xlArdggcYg9Rqc3IXCcasiYKyqMgXR3dkfNA3u2l0kKOfe36gd0SV
         H6/23upb1w1GezmilLXmPr03pYUNvmzK7DGS7TMcpwPNAXOy67uYw19Ptu9HlOBiHeEN
         8bEB/+iiKEJhrGDbelWPxB0NSJsWeqpbdvFP3DZT8jMaHg3MakZLV5Jg8nTilEG8flp9
         K5NfJOZl23OdkgSp/6dXQN5Qc1odi+QGw+/oi0CIQ3SIlkXkbk27ObCWBVcwiA8Tw+SF
         436Q==
X-Forwarded-Encrypted: i=1; AJvYcCVg69TnXyLyemYju9K7IX1/gFfysyR8ajV7BAXWiJO4/8ymDB6tO5oHm7MBeM7fkSX5WTOEUy8YNPoiWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxP8I9jkfNCLEgi2+rulzQttoYyTTdcMcE6I7voYIihp0TLfGfV
	VnuUy6YczlYGiP+FkK1M4jM29lHT7hKZtsRm2SsOkjxDyWjDxH4Oa7+gR7Ik/OlvLJI=
X-Gm-Gg: ASbGncs7KQTdv72ZRdZ92LaIAfXhMjnpv6ZCqsxpQRbJKXsZAs2Cp2prbhkaRNZRDWw
	+9/l5r2/p/hYx+erwWJ/DwXrQr+97JUMgtq/jxzncTOs3tfqQmxnjWxNJSaKQXVvrVL3sY4ClxT
	vg8JgTgI3cXSpJahqwK73IKSbsjX/LxHz6E4nWw9rM4wlNBt3s0s12xHYLwePlUgbfdLe2hAXrv
	dDnP09548aYd5AShu2LQM4kxJJGXUPGz8hD/iOP+h+Jvqe+TDeV4xMxjr/cQ9ACm1o8vMlKv3rW
	fcGM6NvLHT2/PZl4TcgVSRIRwWqG+7pmUjDxr3oiNbxd9W+e6pg3oUPpM0/JeWOazVqqoZXOp5e
	wHa9wpVK4hFbxKZHDHEsbtw==
X-Google-Smtp-Source: AGHT+IHVBo9LkzNee2JKYrKdwtZHZLkreGBOXP7vX/U81FjBHvUbwcdU17sovy3MyAgANjjIbprzmQ==
X-Received: by 2002:a17:902:fc85:b0:234:d1f2:da31 with SMTP id d9443c01a7336-2364260d38amr40073705ad.2.1749646848615;
        Wed, 11 Jun 2025 06:00:48 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.06.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:00:48 -0700 (PDT)
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
Subject: [PATCH 7/8] dma: Kconfig: MMP_PDMA: Add support for ARCH_SPACEMIT
Date: Wed, 11 Jun 2025 20:57:22 +0800
Message-ID: <20250611125723.181711-8-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_060049_403296_71FCBA32 
X-CRM114-Status: GOOD (  11.99  )
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

Extend the MMP_PDMA driver to support the SpacemiT architecture
by adding ARCH_SPACEMIT as a dependency in Kconfig.

This allows the driver to be built for SpacemiT-based platforms
alongside existing ARCH_MMP and ARCH_PXA architectures.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index db87dd2a07f7..fff70f66c773 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -451,7 +451,7 @@ config MILBEAUT_XDMAC
 
 config MMP_PDMA
 	tristate "MMP PDMA support"
-	depends on ARCH_MMP || ARCH_PXA || COMPILE_TEST
+	depends on ARCH_MMP || ARCH_PXA || ARCH_SPACEMIT || COMPILE_TEST
 	select DMA_ENGINE
 	help
 	  Support the MMP PDMA engine for PXA and MMP platform.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
