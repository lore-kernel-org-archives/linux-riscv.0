Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2F4C38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 17:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZxSN1rVcoJQJuY1043t/iIQNEoR3XIMLAKs6vBkJi8Q=; b=p24UJiYTISoggw
	DYV3xpU+WSNMaL7E3PTe+DaZvKY+MZndSFTakBoWS9SzzQb9dsipWkrnv86PL2uhyQK6IHoUAiIo7
	TYAw4rp+IlrTGR5twkTTcJatHrEvRZcw3it6/Cor7kO3S4gLlh7FcXOpyjWQMjtde7oG7UguaKGZY
	+sooAGNnWTtGzXR9tswnE9pDqIVQ0F9L4zsk4aUsRUKp2Zi4BdqQhvQwDcgNsgyX+qUeaUSXZuyWH
	XxsHUR1orvxHDM2JMmli+ldAmKqI4teAWu7CXkknzUSjoC2lLi7KmsIp6LRjegfor6iOqzxkKxaM1
	CHt+zV3ntwUBLH4rOH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooTBu-001Jmq-3L; Fri, 28 Oct 2022 17:30:46 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooShm-0015iM-1w
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 16:59:39 +0000
Received: by mail-wr1-x429.google.com with SMTP id l14so7436719wrw.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 09:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gju3CMb3jhkVvblFFI0iIit6dBsGsDogFez5dmlOa7U=;
        b=OFPb950AFFtYvGt/Xeg5Zj3YPvS1iejKr+MH4Tub3vjKCSB+W3jmJiZaiIVsugX4N4
         MHouyPzNFbTkC0h2d8jUOXDJcJ30gGywsjjQVkeaz2IDKk0LcqOs5d4uNIUR6kj6/ntN
         AglmIJHgnnrLcSkjJHel2OZX+KEMcsXmjNy17kj4CPRUuXGLzAyFxT3k4WKcURZc47c8
         EnY++FcbgmnXmI0m9LfgdwBcMi0HOXE4i9OUnn7alyALEzb3SCtvoZlGknxdH++FQ8qg
         X58wC2ZHrVNuON3menp5RQSWj6lwbfdgb+bsvwMU0J9JCNRo4lpGhYRxZJTpcEKkAr/w
         1GMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gju3CMb3jhkVvblFFI0iIit6dBsGsDogFez5dmlOa7U=;
        b=NS3uxlJY6Q95lNt00cPGhWpLy6rh6QMQIM3QcsB+oChQy28LUZPCSe/jFWQPbPbFQg
         ZkJCCq/yI5wSziNBc8VELjhNDw4JVFMFc/7YiDD9VeoA3IUqBnMWeGfbsBqQA8yPSnQp
         pkCBNkqyjRUDJFqX7uj1crzVvkDyji4FJp5lt/mgBIfod8XBypeHXICpgd7IlGoXjwJ5
         vkQFIZtDNUvljH6dHg36Yz59585WzznV0+V3HpLdRH7k40kYcnA/LBv3F09aIOfS3su4
         /Z2z54rJ8YBv8/ZtlRTFw68Yny0qxTem2yeR7nyPJDoDBb/Rrvt9Tc1obM2y28kI15Sg
         jFMw==
X-Gm-Message-State: ACrzQf34maEJKBdeHh0HeKqdbSOmZXXKL9JXQ6/wZPMgfa0HSJ/OsLVK
	12euHrT83RCuhtQYxi19jxE=
X-Google-Smtp-Source: AMsMyM5SuJPSrAK5aGpUvx8QERyDnfD43NSpIueqn6+EN0Tj+1UdHXdVOzY1GxPeC0XLrPbi51Xilw==
X-Received: by 2002:adf:ab1d:0:b0:236:6301:c77 with SMTP id q29-20020adfab1d000000b0023663010c77mr178897wrc.119.1666976374229;
        Fri, 28 Oct 2022 09:59:34 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d53b:eaf9:15f:6a8a])
        by smtp.gmail.com with ESMTPSA id h2-20020adfe982000000b002322bff5b3bsm4939689wrm.54.2022.10.28.09.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:59:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 3/7] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
Date: Fri, 28 Oct 2022 17:59:17 +0100
Message-Id: <20221028165921.94487-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_095938_146156_76804817 
X-CRM114-Status: GOOD (  10.00  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add ARCH_RENESAS config option to allow selecting the Renesas RISC-V SoCs.
We currently have the newly added RZ/Five (R9A07G043) RISC-V based SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v4 -> v5
* Sorted as per SoC name
* Included RB tag from Conor

v3 -> v4
* Dropped SOC_RENESAS_RZFIVE config option
* Dropped explicitly selecting SOC_BUS/GPIOLIB/PINCTRL configs
  under ARCH_RENESAS
* Updated commit message
* Dropped RB tag
* Used riscv instead of RISC-V in subject line

v2 -> v3
* Included RB tag from Geert

v1 -> v2
* No Change
---
 arch/riscv/Kconfig.socs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 69774bb362d6..75fb0390d6bd 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -7,6 +7,11 @@ config SOC_MICROCHIP_POLARFIRE
 	help
 	  This enables support for Microchip PolarFire SoC platforms.
 
+config ARCH_RENESAS
+	bool "Renesas RISC-V SoCs"
+	help
+	  This enables support for the RISC-V based Renesas SoCs.
+
 config SOC_SIFIVE
 	bool "SiFive SoCs"
 	select SERIAL_SIFIVE if TTY
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
