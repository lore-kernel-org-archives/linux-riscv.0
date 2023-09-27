Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA60FE810B1
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eR8lAdq8MuO+kUrStj7xt+1oaUQCAJhfsWfQHWx7wKo=; b=2hfsOFkHkjybx5
	ZAhRqbwyBFFUmsLCE6LTItgG5BgQ01ImY2RTzoiK+GbotiA1UcEiKGSOCbli0xHvPp070JNIN58tE
	2pGHR+3ac/KZQbCjjLb++z/wjDCY/Hv8s0HQN/lnUTHlqjfvznJsl4HxkR9Zyor9oLEspSOAXxoj1
	2yL4gDy4QKqsPyqYnzbbgyOunPBxny0TGQpvfWXZlcpAbTpnh970WHtZb2DxIH16HvFoZAJpOXVAx
	OZF8SMgv12SzPyZZkxSDsZbpf/JhFtir9p4OQJLZ/tpk2qsS1wxFBtGwRWEaomgErWeBkEexAWmrR
	jD8WgBl5mhCBkJiBJR6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQRo-000Q7X-0c;
	Wed, 27 Sep 2023 09:03:08 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQRl-000Q5m-2y
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 09:03:07 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3ae5ce5beffso1129325b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 02:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695805385; x=1696410185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7RhJG0eb4h1rNL5PLmu2Fo83S0B+583tqhBhK3d4JI=;
        b=MgZYYLeVWMhJli4fsm0QXMf8pX30CJMFIKEfKC5fJnjSxtw7dxVMcteezczAKsM4c+
         bfl8yQfnZB37aGDPUukVn5rQVW5CSP0enCfG7oW5/dUYRERAcduhWVPpDr/ckfWAKKyL
         qscyxKDINnDsnQNDdy6NCr22UJomjdfGHeNkFdvTrBlHd6N5llIWYfXpXGxXZBqnGa1h
         +ADMVwIk0EI/QrTvm3L1NinXyOrmMaP8jTaJ+gKdp5jxa24eDYQ/CUz+a4bJeYj9YFCq
         N+A//kklLp0wi3TwpHDKOOUL4Js0F2ikl2QawVJjDv1G2eBKtK5flus2lSVgCYrhgDZC
         RTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805385; x=1696410185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7RhJG0eb4h1rNL5PLmu2Fo83S0B+583tqhBhK3d4JI=;
        b=OOA+joHeYtJxvYhENg4QCqQPFWFoWm8lX9Bsdqd13G6kNm7Ed2v/RX1LFlzJdcsbBj
         iVZ2AHusa173ISaFYpgCA/3Rk5ptxNrBRk/UFh/dUlq4tZxMxfH3yO8dWClMru5PaSGU
         DQr2YlbMjgnciQ0BEquyexbLuh57ODV4wPwJ9u2egqN+R0e9oLQDPuBcZX6Ls6kc5dK2
         I3asuZjzNtPI/z0l0Wmv1NtZBYW74wFpLpMHLO5AQfOcFfHASJQ1Whw0AOT8ip26Cwyg
         Ef5WKtuG0NfSm1vK8Aow1TKgOE/nptT729wsIM7oENGKhmP/PzJv7W/N8yKCnmPwjvv/
         wDkg==
X-Gm-Message-State: AOJu0YzFf71JjlktuuD97E07Ot/81pozogcUHsGBMyqGvk/l3DcUJG7P
	EJnCMmO/YFEuhUl0PMxyuoc=
X-Google-Smtp-Source: AGHT+IHVTwpCDD+CcCbU7lnn521yLbJzkneYegHXpDLGMd37HYDLDoN+QRnWByfeQG0DJMir+qdcVA==
X-Received: by 2002:a05:6808:315:b0:3ab:83fe:e182 with SMTP id i21-20020a056808031500b003ab83fee182mr1543690oie.1.1695805385207;
        Wed, 27 Sep 2023 02:03:05 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id i14-20020a54408e000000b003ae24b38f99sm1809096oii.2.2023.09.27.02.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:03:05 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com
Cc: Chen Wang <unicornxw@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v3 11/11] riscv: defconfig: enable SOPHGO SoC
Date: Wed, 27 Sep 2023 17:02:58 +0800
Message-Id: <f4789b3f9c963f0d8f2653d787abb73d58b91360.1695804418.git.unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695804418.git.unicornxw@gmail.com>
References: <cover.1695804418.git.unicornxw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_020305_960513_D66F771E 
X-CRM114-Status: UNSURE (   9.16  )
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

Enable SOPHGO SoC config in defconfig to allow the default
upstream kernel to boot on Milk-V Pioneer board.

Acked-by: Chao Wei <chao.wei@sophgo.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
Signed-off-by: Chen Wang <unicornxw@gmail.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ab86ec3b9eab..bf737cfa1d2c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -32,6 +32,7 @@ CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_SOC_VIRT=y
+CONFIG_ARCH_SOPHGO=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_PM=y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
