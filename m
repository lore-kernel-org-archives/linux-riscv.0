Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63860C73C66
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 14:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2v4ZEtXYUdLzZZb9w4M2eZgQPcYjIChIV9EAp9Z3Qk=; b=Ddpnr+TIkvkcVX
	vzkVcvDsIayBUbF1N71peNmXzXELvaBag3CVH1p+BSOjDd8Mv9DJ28Os1FsmXy1Fi7mm8ru17UEVb
	J9nYsIA0ec5PHKye/yVSfdo08p+122EbI+4sSucu54QqF7qAgM/DBbAmg6JEoHh7+PagEgqQvlVvE
	tjtAfN+6tf7xq9SXtl4yzoAF2vZm3uGoJCKwit04HEUSm/rfzxJifs6qmg8uBgnu/OpX08mGjQfv/
	GYLFb3mcXlgs7p+Of+z9oqOLdL0D5yufQ13ZWb+T/VCaarqk+yoDFkPGsiHlOmANIH/H5evzIlmHG
	7IZbgTxLJsmfsHU9aNow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtpP-0000000ARJQ-0CDi;
	Wed, 18 Jun 2025 14:31:51 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrjK-0000000A5ij-0vWg
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:17:27 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b2c4476d381so548812a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750249045; x=1750853845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=eFioe0YQktB3Y8tnM3zxx/hib7+rWyGG5JH1lyw7eiQiTnLWKaLfQdMpTii5GrJy2Y
         QeXnCC0lPUpV6gSigLAMBZTXt7hb/sJKQo/W5R1zCzTONh233U5rJfUxrnS600Twdkfh
         3hWMzDyoPMW5ZZKfN+RJscJTF9+K1pWOtYvmyLwxQwzdIVZ4vlDgNsrMM/KiER5w8X2i
         G6Svzp/tEPAmW89y4LveKoYoRbMm/PkZ1X9QDyz0IpKopudU7pqMbtsM3i/VuYxCzwlY
         4mA1Omd4UNAikMH7g9W8I7K1oFptiWDsfPIBt/JDcMbl3K7e5c/mV7gVN/e24PBhYTuu
         DPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249045; x=1750853845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=AO6t9U4dQoYmWLubvgXkIvKcdLyC7gBhbwmLJquYtsmxlUauLV+ZB//V4OZYfsyHag
         2IF5VDy5knxR8JOvGy45NoEy6pm/F4LmRXffGowNP27CNF0Y9qQiBGNS4C7M/dczzUpz
         sIJ/iGGph6hHyA4xW8gCyfkW4nUfAYo6NLBMqFRco050+0lJLnCATkmdB7OyNvnHGfgB
         5FvAx2/AX5AlDwA04A6iwFZiLhc409Nn1rms9uXp1DxRusD7vggZDj1w2uLM3O8yb4JL
         0fq4d6fq115wer+VY+v7iPREQ/wA2yCm/N66VEZQ1/cxPnwocylMV2DkfuC5atIQofoC
         Kg3g==
X-Forwarded-Encrypted: i=1; AJvYcCUmAFgiPw693lmePe4FcmYaCXFWipjXUOutxf3+mehvepx0vMw5ubSbvr/0cyHSWFDIRd1TAc+ZS8GT4w==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgp4nlbLwgOIScHb9VNoTkZXSVTGjzFS9fgwYhVj8WoE2KGABi
	V2MQY8JZ78MDOsiqs3OmRrP0ODHNDg5g6zEccv7X5GrA7zl6qqL7m9id8P2qvNMG+Sg=
X-Gm-Gg: ASbGncsLWrvpEvCltxTkGbTiBy9Ybul5tKx3NZbLaF4TvAUsjYd6kprJru5r3rnZteN
	rR19szZ3m0z4S9jwnG6GbAEvfuNjvA2PAYjKmvVofc3q2Eb1zZoHPaz3DJ8K0miK4C6LMiYQ9dK
	UVmNlcrPvuaUFLDHJ5V22LPc7ji6E2GYuGCM7AxQ3a94GYXDbVZq5n0JSIYy+n6XqpJpFbtu4JG
	gxvgDp9ZXMR87Vzj9JSdCFP4gFe8oufV8NRPY/n5cwnFtIfiO66mUq2mUPSaHKpvfXOrYfCftuW
	zLFYVkAqBflTT94/y8rRv4KtAJ5DWuq7N8j2zjoAYKg5Ly1Y/wGfy8TtonAZQnERkB0Ci8IbFxi
	zenWzJdOOCq2z8qfLSg==
X-Google-Smtp-Source: AGHT+IH1xfeewtqn0zTX7kLVKrq4fVYOZXne0D7IDvJs8omDNN2bsZJTXVlzhVc2KfRNGR1IHYBc+A==
X-Received: by 2002:a05:6a21:3942:b0:21a:de8e:5c53 with SMTP id adf61e73a8af0-22003759d05mr4132869637.12.1750249045295;
        Wed, 18 Jun 2025 05:17:25 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:17:24 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v6 22/23] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Wed, 18 Jun 2025 17:43:57 +0530
Message-ID: <20250618121358.503781-23-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051726_256132_6BDC3484 
X-CRM114-Status: UNSURE (   9.68  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The GPIO keyboard and event device can be used to receive graceful
shutdown or reboot input keys so let us enable it by default for
RV64 (just like ARM64).

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fe8bd8afb418..bd5f97e1d1a0 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -138,6 +138,8 @@ CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_MOTORCOMM_PHY=y
 CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
