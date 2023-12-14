Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663BEC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 10:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+Y6+sAiuHqfzik0oIAj2MgtRzfiV4KB4SB+hSuQXIw=; b=4NfUa/NODHLx30
	iwg+OigVCUBUdA8lzu/qDXp9U5KHJBkayUHNFXvs0zB4H5QRJ9gHpYc3FnW0impsqIldUzAZhmwY/
	HLoJSZxWuzbDH7/RtIaV+EYquFKwrqAfkyir9vvWHWY7celE+HmTrnjWEZ1qN/w+JfG231gU+TTSC
	zovrk/Q7FPDC1Z38poQjBkGeba9nXVH6q5nZn3Vjuy/xa+8+OqZ8TCGbB7kPyk/DC3qD99Te5wC3n
	3Yykd9UkLsr7RvWb/DOnkddR09d7U+U3pfb0MKxbq9rrzctrRRE+DAn/CNjqz+NJMzRkJTqVOgJ9k
	HgkXR32Ld918wnFlokUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj3z-00HUcL-34;
	Thu, 14 Dec 2023 10:35:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj3y-00HUZY-05;
	Thu, 14 Dec 2023 10:35:31 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40c3ca9472dso58872035e9.2;
        Thu, 14 Dec 2023 02:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702550128; x=1703154928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrT4GQFgUc2NFNy8QfHDcUrSUYysbuxBIxCpg4THq6A=;
        b=eOHJzs/+jni3A6VC33hybWGcYJkEHt02QoTGCr+ygfe8HUhqUebPiXhIi70y4By4p3
         6c+159e+IurJFIhC5K/nUIfjV1ZoAtOkolz3wlTixuoxveaGs2z/ZZ5l7ct577IrY+32
         T6XH+0oc7L4aYgK11G7YjE4ylrs4o4S9tz3QhKslPjTIU/XFofYk3H8Zek8yMHGdjvgy
         zbPp6kuUK2/xVDqVEB80sE0y1hZJoULFnnPCQpt56COZVGwByOu06rK+S0lVsuIyqcHM
         v2REuzfpZy9IXFKTdlbYeVrJGcYAiTZCDAgN0XoFZtSZkrc1AIOXCO/Y7+EAxQPCKsq6
         54/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550128; x=1703154928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrT4GQFgUc2NFNy8QfHDcUrSUYysbuxBIxCpg4THq6A=;
        b=FuXO4iKjQxbcBpgQEpaX0gnZKicmb+aFpgzIjH1LBBFyKYncIjjeMqFCii9Ql3fv4L
         EACZ18Ahgm2FaXLU6jvL3A9ZU34XyDGtge0Ve58zas0Au+YzpGAEq8aTOBF5LPTb1cmZ
         7y5l8K78uzx/zLhkS/exfYEFz5cBn+pzTagVivIQywyE6kXUNPWoRpRwebfGlYmIAhTn
         x+uBeMQWOxwYEzpn7inVKnyqlB0PNCxsQ2S7PaeDP6IlbYke7snpR60v1cD9JyHhqCvB
         zGqCWDPEOh/+arLiSEO+DyI/jnQEBakLcKFBPWWkbxuilZ/ZIyRMNSqiieWkBtPDVs6C
         E1gA==
X-Gm-Message-State: AOJu0Ywp+6L47HgC3NonTeSrskjFSvOYhqCqrWqQwEpcqeI673I+xmPt
	YHGlRO1lCMUaphQv8fmdSyk=
X-Google-Smtp-Source: AGHT+IGCjmnMr0NRq+HC8R0lvRI/AD01AcPL7img9WmAVtzQAIwlJBk50oZM1JWLrtlKld0tmTb1iA==
X-Received: by 2002:a05:600c:2a41:b0:40c:32fa:4f45 with SMTP id x1-20020a05600c2a4100b0040c32fa4f45mr3510981wme.248.1702550128507;
        Thu, 14 Dec 2023 02:35:28 -0800 (PST)
Received: from localhost.localdomain ([129.0.226.240])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d65c4000000b003333ed23356sm15849623wrw.4.2023.12.14.02.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:35:27 -0800 (PST)
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
Subject: [PATCH 4/5] cpufreq: Add support for RISC-V CPU Frequency scaling drivers
Date: Thu, 14 Dec 2023 11:33:41 +0100
Message-Id: <20231214103342.30775-5-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231214103342.30775-1-fusibrandon13@gmail.com>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_023530_066290_438CB2E5 
X-CRM114-Status: GOOD (  15.17  )
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

Add Kconfig file for cpufreq scaling drivers that can handle RISC-V
CPUs. An entry is included for the Allwinner H6 cpufreq driver that
works with D1.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/Kconfig       |  4 ++++
 drivers/cpufreq/Kconfig.riscv | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 drivers/cpufreq/Kconfig.riscv

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index 35efb53d5..4bef39fed 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -239,6 +239,10 @@ if PPC32 || PPC64
 source "drivers/cpufreq/Kconfig.powerpc"
 endif
 
+if RISCV
+source "drivers/cpufreq/Kconfig.riscv"
+endif
+
 if MIPS
 config BMIPS_CPUFREQ
 	tristate "BMIPS CPUfreq Driver"
diff --git a/drivers/cpufreq/Kconfig.riscv b/drivers/cpufreq/Kconfig.riscv
new file mode 100644
index 000000000..025c7c439
--- /dev/null
+++ b/drivers/cpufreq/Kconfig.riscv
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# RISC-V CPU Frequency scaling drivers
+#
+
+config ALLWINNER_SUN50I_CPUFREQ_NVMEM
+	tristate "Allwinner nvmem based SUN50I CPUFreq driver"
+	depends on ARCH_SUNXI
+	depends on NVMEM_SUNXI_SID
+	select PM_OPP
+	help
+	  This adds the nvmem based CPUFreq driver for Allwinner
+	  H6/D1 SoCs.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called sun50i-cpufreq-nvmem.
\ No newline at end of file
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
