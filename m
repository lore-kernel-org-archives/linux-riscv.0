Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADCAC3DA64
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 02:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UV5KhyPhoWvFdVePE4SOg2dOZ8nItKNftBE/7AItFec=; b=0Y5So2N6Oyyc9p
	S9t//r45fRfjIpZomG/j3Ri1vWih8DB+gi1EIvuknrimjf1Lsp8RoAmZqaG9Xo6RSuybx1SyYXgFe
	/7OLJx7c0SCYQwzX/4LCO2RyYQf1+ZWV59pCEcCAK7HyLMJXkuW+xyZPzlcIR+U7P8xcN4KOzqLgA
	on0ExnDk1XBASSWGF41sZ/J8sZfpD4pjfa2iLHR+adtf0gvDBdE+8gwS8w03eTIgkjhAX3ODu4uvL
	lxn/3UIzwS+j3lmgAkjn90GVbqIrat2GDz0qCATVQB3iZ7Jgp2Ug9hui5iManeAenUAV8Lo8mQXN+
	4XvsDJhWo5pOPujYLtkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sanXT-0000000EOb4-1qr2;
	Mon, 05 Aug 2024 02:33:35 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sanXQ-0000000EOac-1jhr
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 02:33:33 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3db16a98d16so6448457b6e.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 Aug 2024 19:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722825211; x=1723430011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2YwzBkOvf49wpb5oldLY8LveiVGUoRl7flabXImH710=;
        b=blJkiC1vxQq6rZTnJh5mrFZ+V+kXo7uNRVVF/fLF8Jgf6U5XYeDe6AST0DfT03R28T
         ej0Os2zXGHI8BAUFS4n4byfx7MLlExkEpKyb4PYuefIMjGCgNVGQ+D5jDxYjuX/BNn3F
         0IwsrK9xH7XSRBQtzP1p0LG/9JdPt+qWiYQNuJNJMDdGT/aLuF3E5mWHPx7EF/izLyCb
         8Xw0qWuT88iD4SKmilJ8xJRcQOyX//Y9elQ5HGCpiDYw6rl9+2sy9qgGTb17kG9onp7R
         gNo2+vQtEiJ8kvN/P5P5XoWD8LncAZJTQuK2CLLl7M+1GskkQ3asrHMQwNzpVr78EeOK
         GW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722825211; x=1723430011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YwzBkOvf49wpb5oldLY8LveiVGUoRl7flabXImH710=;
        b=Ni/npVsuaGDSeuHiqAjwGm74cBjP/7chNLxRP5D2O3LuoCBVsvmngbchMuQK/3L4VW
         KrsudpZ0l7ugfIaHjwnAx+Rb40HcB9ruQw9KPQrb/Lp+jvQxGb+pnDoRa4rCLkHNoDaA
         vYzqgsv/tOBpbEywPJKTKC0PGZZ8RN+VN+PEWW9tkfW3prnquTcHi66mXrEhqRbZb5jj
         c7Ui4L59yW8VPZoKpeIPpl8pxDeoArIQUAeK9MPw7QpZg5UwiLf8x6LfHPGuMX1S97ZG
         ggw/xBYj1xpGtB2rg+wgdoP0QldwzflERHo6dsirSF7m3sWwbam08me8X8R96iOttGNc
         xfkA==
X-Forwarded-Encrypted: i=1; AJvYcCU4IP1ZVQXQ06PTQYmt3/si3e4nwxDvBFBoAyBMPvIu6JJRhKUK5ifK2997k2dmfdxRhCcNIMSpTL7zoOSbOYCZ4TX7zWnilcctjAIbuuy1
X-Gm-Message-State: AOJu0Yw87rwCFoGwUIzpM2BKeM6/LZVz47BvAU3Tl6uXk0SYMsg/whX/
	wmulFMhEoz88/5/zbwrH4BhIAY8XqHl7JO6uIOiIcC5ksoHj//df
X-Google-Smtp-Source: AGHT+IGuUR2vzGqkL/TzgPl8jaB8EOstVjkT+LTcv1PCIakTLYRMNPUMBC9mdDC1N1iRzB/jTi1B5A==
X-Received: by 2002:a05:6808:13c1:b0:3d9:245c:4209 with SMTP id 5614622812f47-3db55832717mr12079411b6e.40.1722825210642;
        Sun, 04 Aug 2024 19:33:30 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70a31ec82d6sm2752878a34.47.2024.08.04.19.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 19:33:30 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	inochiama@outlook.com,
	conor.dooley@microchip.com,
	guoren@kernel.org,
	emil.renner.berthing@canonical.com,
	apatel@ventanamicro.com,
	hal.feng@starfivetech.com,
	dfustini@baylibre.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH] riscv: defconfig: sophgo: enable clks for sg2042
Date: Mon,  5 Aug 2024 10:33:20 +0800
Message-Id: <20240805023320.1287061-1-unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_193332_477921_95E38B1B 
X-CRM114-Status: UNSURE (   7.28  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Enable clk generators for sg2042 due to many peripherals rely on
these clocks.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 0d678325444f..d43a028909e5 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -249,6 +249,9 @@ CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_CLK_SOPHGO_CV1800=y
+CONFIG_CLK_SOPHGO_SG2042_PLL=y
+CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
+CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
 CONFIG_SUN8I_DE2_CCU=m
 CONFIG_RENESAS_OSTM=y
 CONFIG_SUN50I_IOMMU=y

base-commit: de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
