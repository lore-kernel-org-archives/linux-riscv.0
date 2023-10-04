Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C88E7C4D4
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZA7GSTp3m6mcfLMB9Wla7o9eq+YUCITbFnTjzHXaww=; b=othkou359XYA+E
	Fzkv9UmSnuN8LANnr+22WhSAkeoC7mKeEqmTxf3a8X1tiJcw2eEqFtgFny7hm+tNH12tY5judz+iS
	DGll6ArkjgLn8M+/c0QGw9gg9/2uRCdVVI6q16HBmQ7n1FZNmhWgGfc9OgBlaFwQrTCIkw8rirOcy
	oQegO7LvA8olf08N59PUvAnU/+Wp7xfn6Z/wKlbOzegJjbW3aQfshbAOekwKIkq855TKbH+9hRmm2
	tvLQRr9bOQteltE7xN8JXANwdYRDWJ1uWh7DPObrr/pbg+gn4JHq7TKgP/aVvBjkvf8NcXEIatMmO
	HMNy9B2XEE3np32D6hjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo43X-000Odt-0P;
	Wed, 04 Oct 2023 15:44:59 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo43U-000OcX-0n
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:44:58 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6bc9c01e154so543445a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696434294; x=1697039094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwHNGoN1oEuVN/+gC7YBu4Zfb31gkQocRcnObhIezIA=;
        b=D2ukjwCALevFmINwLfQ1ygHxGnWJf6VxEK/iaMGfd+Yro6hUG0tc9Tno3G4mtbaPpf
         42BSG1Swf5fZX1mE30QmV4rTERW6ZAsja1HE2dNoMFrH/Lc0SooKwmeIyDJN+fLZphBk
         2DQG5tsEAXiKZGR52qwcEZbf6LKO+BLF9y7OAM0Z/n+pNozvkcajWCkhdl5Fi6qnFNZZ
         dB8UMNMJ003pxpm7GrPgMrHurYOxvr683jHP5yEvwap+mfw0LSR8D4bneGy1tL4t9fXb
         /rAn9zvIZz7CvhkjocTAEfXNZ4SoK/4lDrspY1PNGMy8Z9HU4Ev8hURCe5csTRk+cNd6
         wVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696434294; x=1697039094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwHNGoN1oEuVN/+gC7YBu4Zfb31gkQocRcnObhIezIA=;
        b=g7ifmW3SkK4hwWTBmdCArawEhA2OPF78aYixz8eh0vWNa+LLaAoHh76ZX/gvMGPoMu
         ZZPiso7rQ3cqgb4WdB3M97TA7VgfkeCjBXVMJbH4h8M3LdahqnbBCar3PW+yLSz9mqQ1
         6VQyDNsBGf9/uqp2zE3Nx2aH3zUShxC+BYIHu7spcQZfhLNBo0owRkI7IPUsO/6J61sl
         3rSn+eNZy6OgdNYRok8KYpH10JxvdCkKsJ2d8hXv8OLXZPJumQDzANSeBIQNo9MB82YF
         Dd0vbN4QFmnMaDA3iJhjF+ewz3D7rdvpLQxJTB5gHWfJK42BvpiGVy3bf5zolwu9Hsse
         mqDg==
X-Gm-Message-State: AOJu0Ywuou8APU0uG+QJQXEYC6uCz8U/mV8mP5CtRgYCylfI2OUjTr36
	gec9kqCRYO12dhC/+Z6H7sE=
X-Google-Smtp-Source: AGHT+IHGDDRxpV/qn3OPuFLyzArlhshBtITnJ27A864nZkqqFJtvwGuAVG0g+WparjujNcqwpJR9eg==
X-Received: by 2002:a9d:469e:0:b0:6c7:af2e:bf6d with SMTP id z30-20020a9d469e000000b006c7af2ebf6dmr1608528ote.19.1696434294052;
        Wed, 04 Oct 2023 08:44:54 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id m2-20020a9d6ac2000000b006b96a4287d4sm492050otq.5.2023.10.04.08.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:44:53 -0700 (PDT)
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
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 10/10] riscv: defconfig: enable SOPHGO SoC
Date: Wed,  4 Oct 2023 23:44:46 +0800
Message-Id: <f7dea860fcb0e69203fba9b084a6fb8d84cdef96.1696433229.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696433229.git.unicorn_wang@outlook.com>
References: <cover.1696433229.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_084456_283651_F1F0DB97 
X-CRM114-Status: UNSURE (   8.81  )
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

Enable SOPHGO SoC config in defconfig to allow the default
upstream kernel to boot on Milk-V Pioneer board.

Acked-by: Chao Wei <chao.wei@sophgo.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
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
