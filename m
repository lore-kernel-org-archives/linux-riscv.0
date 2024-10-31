Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D47E68957
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 06:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6vsZkeq46s4j+xbTOZsWQMwJJ3/0cvMlwXVa6Gtcqc=; b=gahbHTF/9DvHAw
	6lcyW+Quyv0PlJRlbXo2ZWCiwfvgQKoViS0a60D/y2mu9G7sfzmIM98UKH9wZP6UZumR2fYvyy8uY
	2ovJxm9d1euM8Axj1J1dK4FFp70KsYEnJTCanMSvOCS/cuhkqkk3sFPfS70BYy1Bugc/WnstPmaow
	zKJAGkj/3lVe+rvAZt+gNdVFXrAVIhCQlBDAGM/ZEvZrtOlS1v2Mv5rJr1wd8J5ZqH7QRbxppuHzk
	rW3hC+8ydg5S7w7ZIaYmiK9r7iBzR/96JINje4jJVKBd77P6iH19w+ULkmJNS9opVLKpBS/k0R2d/
	OooTjjtNsKCpQyZLp+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ONK-00000002ePw-0ij2;
	Thu, 31 Oct 2024 06:09:42 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ONF-00000002eNl-3N1l
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 06:09:39 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so514759a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Oct 2024 23:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730354977; x=1730959777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncgmlyGfcrqHCYKyqt0DRpGIqa2UXUmRq5v7oAb7ZpU=;
        b=TMAhgPnhafWyqg/7xIQD/5TpiNagaIUdyWnphuNa0AgnSkwrqLjmOJUTTHaR164TG5
         ba0PnP6trj27i6sNmqlRcnZqcJp0U0uSAkhCXzT/dismp5WVYxlG2p0NbkZlY6pYCGim
         zxiGilU/n2qxnbPV4kJc2B/VuOUorMajy25KcUjRNndi7C9ncfCzrTaP5E4GBeTMw/6R
         B+567dNn8JM+6rdtPrN/K/UyPv61lQO/3VSQDwj/XfLD2bdFioJ6Es6nHl1TsIt32vxu
         /GD0Zap4yBP+iAtXUyaVDekzC0fIwDMwQ3UC9GsJk66/3odh772B0+PDNFwvj2G/73Ov
         Tjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730354977; x=1730959777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncgmlyGfcrqHCYKyqt0DRpGIqa2UXUmRq5v7oAb7ZpU=;
        b=F8Wzc5Z25UxQnq9EZCA6XOtTgj6s8wt/hz+2oFLD8D//ojkXW8I0i+KF5GMuODvKlz
         za/aF6fY+TlYRPmPsRj62AN25xhUr/JAk4p2r2mLqj3TjpwP+tZkJASWAlQSuq5vIXkR
         3Fz2R9bRyGkIPI7uG4ip0m2AXvZVOD+x6j9hx2yOQLtmMRxHHLLg3WbsoWXSY6fT7XFe
         X2Pt84vIZ/qhPOYC+VkdsaB3qqbrfb9m00QgY7JTCA0zs8fTb+WosFRspFGvu6ldWsOa
         FKFl3pGYeXszqUY9HFMHoysuu66UH/RCbQ3FTwAZs3ZrVQoPObl+PlD67tJN21+bsyrI
         nmEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDqVBhGtN405TMDiKTtz5AOg33I/pJxUA7nnRWsxd5+4+O9AjgUviZB4JxhNHduujmupKtizM7ENI6aQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwC5RnSngzSLOYptLkehyZKnThvkhcnM4grspFIxkeeEW2slq/F
	0y+DEF6gVgrwfBjLHojIS9zjfmIk46jjl5uzuoYl9yRw7TdoCYu6
X-Google-Smtp-Source: AGHT+IGwIIjCJ9cra3CtW/n855IKa7eXRuLq3icr68WZ/L++36slplZBz+5pTu2cxLdjevaZWAGmAg==
X-Received: by 2002:a05:6a21:3990:b0:1d9:1f7a:a44f with SMTP id adf61e73a8af0-1db91d898fcmr2823576637.12.1730354976633;
        Wed, 30 Oct 2024 23:09:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1eb1a0sm557691b3a.67.2024.10.30.23.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 23:09:36 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Anup Patel <apatel@ventanamicro.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 3/3] riscv: defconfig: Enable T-HEAD C900 ACLINT SSWI drivers
Date: Thu, 31 Oct 2024 14:08:59 +0800
Message-ID: <20241031060859.722258-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031060859.722258-1-inochiama@gmail.com>
References: <20241031060859.722258-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_230937_864824_6376D131 
X-CRM114-Status: UNSURE (   8.10  )
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

Add support for T-HEAD C900 ACLINT SSWI irqchip.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 2341393cfac1..5b1d6325df85 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -256,6 +256,7 @@ CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
+CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
