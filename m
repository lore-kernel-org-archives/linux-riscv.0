Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3097E810A2
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 08:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMOihFn8QIsbZPzG5kRZRpKf9RopBxH9MJHHS9N/IDM=; b=pj7rHRI0ahpmri
	Fqv+mftNcfPuX5jpaSdkBnaay3AfFf/Ul7ZoRRU0B4HDLaGpyqfQDRPKGPD2levf8xGPGAV4PN+Gg
	QmmHfQPgJ+yS9FprWkDBb6BrtaJHvuj705EKF3NZv+Zgmy9WhVe49rfH1ulHpUlmkDipU+5mU0jMe
	nLaSs9oLjlJhvFuZLLZKHlGpxPIZ0e4aVRbaolo4oFN/i3rkcjxfjHWjPcliNjYxM1/Wq44JO8W6w
	RjdHQjjpz3vt8gjbxOGoq+sRfpV7v0of4nLFXYhtV7Ip1zy6xpSV0BdbJrvwjd6u9QxFlBosFmasZ
	wPzYYxRexgjJqW08uJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlPuK-000L3i-2q;
	Wed, 27 Sep 2023 08:28:32 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlPuI-000L2U-1Z
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 08:28:31 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3af5b5d7e9eso249799b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 01:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695803308; x=1696408108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZTi49m1tRqik4s4OIHpvu+DZ0pGT5ycjrh8hjwTA/U=;
        b=U30sbZRcM8Zwc82rF/wDt+7uX6sSwk4YM6/EA1QjUUyWUeBu1IJ2TGLTsEDNvJ1Ui6
         2cAU8FN75U6Ctol9X10BnOxmQQkf3iekZ1OYa52owA5HdlZuXSjC68r4pPVmp+3QCPde
         uxUd5dftN9yYKKqu2YHsI6WtX0o4q6VS3iaS+BwiiISiFE3/wOo7ZErFcoJW06Ptv7eB
         bCHM6lHOGLLSkYDGpMJALe4ZD7AgmYhbda4jzGKeKtZ/M5Wp+cqxaU3aHrepzwskO16h
         RwheK6PtjVRfWYaDDJE+Hi/rz3vqkhcMg9YeKwXxv7ZTvovfJAJNbiB3Bkhu93xAwHAm
         dwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695803308; x=1696408108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZTi49m1tRqik4s4OIHpvu+DZ0pGT5ycjrh8hjwTA/U=;
        b=kTfjlPVM/CbjyeyRP/nlnFMWfjOZOO0IIg13lpu3Hk2jtwzK/kW0pZyW5VT6sXTm3n
         9Cf8rfSNUlrgcdaMMYBqkj80pVdQqSkp/JW5TKkMrdxYZjMbQ7v07ooHKTvnIckn9QS2
         qiJF28HD0fP2bmttGkrkMsBt1dIhfssbfBGgTu0cdqXmQlwSzdbpjr8A3XumPp8aupJk
         arX6kcyHFPnr3qbEx9bDYDa3bSyzwg8RLDHe2RyaicZ2Vw6YqouBmlOYnPb3rHmdXQy8
         U86tBErXYah0spASQNhEKabzeLL7JtDW6NxYLpJbgvnTVm1Fl6CZ7a4rK1ZWCe4QpRjZ
         LuMA==
X-Gm-Message-State: AOJu0Yzy4F83QfP3EJ9V29XjKvG3YPbYr4PaLoxpjLzuYo7fca2+6eGj
	V/4NlkDbWyt9Ee9/30T7GVQ=
X-Google-Smtp-Source: AGHT+IFWJGplOWqOpM2IFjOdrFg6ThLvBAE2KJ+l0wbkxriQgN9+p9DSzrcWzlgqMBpiqFYn+mQEag==
X-Received: by 2002:a05:6871:549:b0:1d6:6083:63a3 with SMTP id t9-20020a056871054900b001d6608363a3mr1630424oal.37.1695803308124;
        Wed, 27 Sep 2023 01:28:28 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id eg46-20020a05687098ae00b001dd17c5356dsm1359148oab.11.2023.09.27.01.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:28:27 -0700 (PDT)
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
	apatel@ventanamicro.com,
	unicorn_wang@outlook.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v3 01/11] riscv: Add SOPHGO SOC family Kconfig support
Date: Wed, 27 Sep 2023 16:28:22 +0800
Message-Id: <bfa07dce9eb268b312bd64059773acf055727f17.1695800389.git.unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695800389.git.unicornxw@gmail.com>
References: <cover.1695800389.git.unicornxw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_012830_527656_0D8D07D4 
X-CRM114-Status: UNSURE (   9.45  )
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

The first SoC in the SOPHGO series is SG2042, which contains 64 RISC-V
cores.

Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Chao Wei <chao.wei@sophgo.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
Signed-off-by: Chen Wang <unicornxw@gmail.com>
---
 arch/riscv/Kconfig.socs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 6833d01e2e70..d4df7b5d0f16 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -22,6 +22,11 @@ config SOC_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	help
+	  This enables support for Sophgo SoC platform hardware.
+
 config ARCH_STARFIVE
 	def_bool SOC_STARFIVE
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
