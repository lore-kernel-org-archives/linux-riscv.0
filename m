Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B973DC4167D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 10:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fD2rzgFFzyEkzpBzaNYFk995rEc/Wv+Wpn3AlIEcbFI=; b=wJfXbQcV5FArPJ
	zAM2TlqZw0v/mv1hLl/gLS4uqWsyq5tsftFK5X8fanT41dlhTobVLgn7x+4e52CVf3NMTDVjSQbww
	jhXXJnqXydOmqkYqawoaBGUfic5U43LZHBNMJ3SclX8genzpJbm1nFFpLmOKOZdIzFBZgbDsUeydq
	H8C4mz06VnqURwgPKIV+54DFeMd2oGoPIb+Cf7wIQ+E/9XRtk04z3UESTf5dbt33fEviW3egSBgmd
	SEATHa9yYEAJQ+UufvLTjV0s5qypVUVGsAk2r4U62U2j2CikzGnAqoDK6S+Vy0HjVM+Oir/WvDlIE
	WghMYAH7Oou16wYNCAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj4O-00HUqV-2A;
	Thu, 14 Dec 2023 10:35:56 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj4L-00HUoF-2w;
	Thu, 14 Dec 2023 10:35:55 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3364a657564so224476f8f.0;
        Thu, 14 Dec 2023 02:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702550152; x=1703154952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bSH5LSThTrH8jKZ5V0W7uU2b3lxsQ8a/FvDmGfwzlA=;
        b=MKGoZNtsDPQ1jYsK+xCu+anxbnqCvK0U47jFkTbeIoMbm7XUsihf1BeNh2i7nbI6qP
         6zKB7Wez8Mx2385x5b+FcqyKBzAXju/CMsyf/YMgQw+FSMCe9bwZFbxC/zPDS9Ww7OIG
         dsdgjZUUJMQutAUmgwBsyth5lY3mV7PcJQAlh5MSwSStm0TTb9A07Blagciggx1K9hSc
         GSt792u9QmtArLuXEzipRlY/InYVzQZLv3kGnkud4S4bpPxmQ3qep4vTcLOJJKFAc6hH
         CpdnDh+zj85lo8Y1XvdNEjtj2GgwZtJGKL7hFJ+SFBmdZOsHaM1yR0kaIY9XP/1Y0UT4
         VCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550152; x=1703154952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bSH5LSThTrH8jKZ5V0W7uU2b3lxsQ8a/FvDmGfwzlA=;
        b=EaVHXHjI21nxxaJ8tlo3Lb5XWP+D6U6yHRQTr40laUGl5+w3hQprizIn446WXEQI/r
         XBOu5AFxh+723Lps+PqVsXCKJL6nfsihYOxAazYE4O3mNmBZWywQ4sWQdzsQ3pFbQBkW
         rFcNaH5AU+/BHoM3d7vNl0pOas8T6C8NeVbIkm7g9XG1X6jBGbk4z8gk3UX2goot56Dd
         Zt+J7rhGuKbWvZT837ja1/phxHVH2zb6akQImbo7p2Gk0p/2rN+8h5a9KeUL6ps3HwiC
         Hp7qTWWspHSR7xOIZBuLrGsLLabS21kUq3/sXrhaG6giRLd+bJQXhgiUQ6ods7MFiAUC
         G3Iw==
X-Gm-Message-State: AOJu0YwEENGzOAHxvUp4swAUKOHkGGKud6JQYfgEkqmFz3XSaeVQKeFZ
	MIhk+C4yylotpWefsU95p/Y=
X-Google-Smtp-Source: AGHT+IEbki3k5FnEaNVZtWRBuhOkVOwOnKsRmJW5T9tQx+eZlX6USeTgoCxh9UtIGcxFBYXudVg1vw==
X-Received: by 2002:a5d:4bd2:0:b0:333:4940:dd1a with SMTP id l18-20020a5d4bd2000000b003334940dd1amr4977407wrt.23.1702550152438;
        Thu, 14 Dec 2023 02:35:52 -0800 (PST)
Received: from localhost.localdomain ([129.0.226.240])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d65c4000000b003333ed23356sm15849623wrw.4.2023.12.14.02.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:35:51 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH 5/5] cpufreq: Make sun50i h6 cpufreq Kconfig option generic
Date: Thu, 14 Dec 2023 11:33:42 +0100
Message-Id: <20231214103342.30775-6-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231214103342.30775-1-fusibrandon13@gmail.com>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_023553_963591_AECAC1FF 
X-CRM114-Status: GOOD (  11.73  )
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

Remove the 'ARM_' prefix from the Allwinner SUN50I cpufreq driver
Kconfig.arm option as that driver can support the D1, a RISC-V
chip.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/Kconfig.arm | 4 ++--
 drivers/cpufreq/Makefile    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index f91160689..510604781 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -29,14 +29,14 @@ config ACPI_CPPC_CPUFREQ_FIE
 
 	  If in doubt, say N.
 
-config ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM
+config ALLWINNER_SUN50I_CPUFREQ_NVMEM
 	tristate "Allwinner nvmem based SUN50I CPUFreq driver"
 	depends on ARCH_SUNXI
 	depends on NVMEM_SUNXI_SID
 	select PM_OPP
 	help
 	  This adds the nvmem based CPUFreq driver for Allwinner
-	  h6 SoC.
+	  H6/D1 SoCs.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called sun50i-cpufreq-nvmem.
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index 8d141c71b..110b676d2 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -78,7 +78,7 @@ obj-$(CONFIG_ARM_SCMI_CPUFREQ)		+= scmi-cpufreq.o
 obj-$(CONFIG_ARM_SCPI_CPUFREQ)		+= scpi-cpufreq.o
 obj-$(CONFIG_ARM_SPEAR_CPUFREQ)		+= spear-cpufreq.o
 obj-$(CONFIG_ARM_STI_CPUFREQ)		+= sti-cpufreq.o
-obj-$(CONFIG_ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM) += sun50i-cpufreq-nvmem.o
+obj-$(CONFIG_ALLWINNER_SUN50I_CPUFREQ_NVMEM) += sun50i-cpufreq-nvmem.o
 obj-$(CONFIG_ARM_TEGRA20_CPUFREQ)	+= tegra20-cpufreq.o
 obj-$(CONFIG_ARM_TEGRA124_CPUFREQ)	+= tegra124-cpufreq.o
 obj-$(CONFIG_ARM_TEGRA186_CPUFREQ)	+= tegra186-cpufreq.o
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
