Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD99C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 06:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2v4ZEtXYUdLzZZb9w4M2eZgQPcYjIChIV9EAp9Z3Qk=; b=XOjoGXV9TKxKqH
	RErr1GYjFKKHIlWdL979TlpEyT/0CueaWzCfSreGIwC6Omb84XZw8o6MMlD9ZtS6rqAnQDjCb7395
	qlUgGhBNvE5EDhqWTAUYpFWZ+rU9hVbZXxoXxjgKEcon4UjAhSB1eMbz+XhdyUSSXgnskkXJA5A8B
	FGpcyYiXOQGHcN0Sm2FtvzVFBPrgVFowL9BzFUTrwc1CJJ9vZL733ixQyxHJBvnqjw/b28Mf0EZqj
	TRMK3DRfFjRnBQbHTmI9ULlVE2s2vNi4ifPZ3/CnNH3esT1GhMyd3hdbz5x2xPuYCujHavdvpLI++
	XgZFDhP4yHAaa+E65mSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEuZ-00000008zyI-37FW;
	Wed, 11 Jun 2025 06:26:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEuX-00000008zwg-2YlF
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:26:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-23636167b30so17453535ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623169; x=1750227969; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=parf4yo5FUYGCDKVqQCk6YzQcZCLsVb1V3WNKjI2ag2Lfx7kC6Ko529NBpdqpXLOXN
         Us9j0nEsVy1gjNZ2tmr9AVRtcbSHUHFbUE1PDfuQydhgbieJbcbr/Emc8bWR7uymuSUN
         ktZ8tXWMmOQRlPVm6aAN6p9BkFvgVZsM7TZNL0BtJzthH0MHFDAmZDbJTs/jmhtCaiLc
         VxgypOK0+a3k6NjsSBUP9VpA9ya333qYSRUz3V+peTyTxImJHTLSkT31GL7Wj9EaPrru
         lvzPq9tll9B66DQqjJ6n0eMiDK0dLw3jXfR+GPRtWINAmSu/yn35svPo8HTrh18R8dj2
         t2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623169; x=1750227969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=suwle9/AULpFUkp74lYZvQbnhXIxvPAlq2g+b+VR387Qrz2s2Fc0Fd8w43i3GIEa/z
         xO70MX+p5T0FkGut/KEL8R/24Vo2NwMbB0V6KS7GLYIDufP8JVXb1PBaGBHPCJQiiDpd
         G/wQbQELxtAeomdXKPhTZ8/as+AoRZvZ3AQ6R7rJ4/knT9bC7uVm4vOCCKWcjVgGa9T8
         PZ/W5ybrF7AS6XPLf8Nk5AoC7BbD/oYLe2KJoJQgMlz4+vuDbVXFUYIBZBuD/vHi5o/q
         pT0aIeHtuRtE16j3Qbj1W7dch1b+l8bymMGWEQ2VaX/MCxH4ymj6jdXG+m3bl437xGVu
         GkuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV98G+J/grlWAEx1ODO/xLk1TPI3M//CgQahQas1zfgX8LfAP3fIGnYlIDxW7Qhm0FA9qbW1SBr76aI1w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv7YuWXGiGKSFJLSfxyufBl1LpQywyGO1QafFTEAm/g/6MMxni
	bQoU3ixd6W8MV7zMeVILXSNsZO5x5oz8BBOPKaoBQOgTx8sU8XNE3LrQS4zAx6uAfNo=
X-Gm-Gg: ASbGnctp/mn/2q1jka+FvY6y2dXHC5Meq2zfZfAC8byxFW0PwKknA09ZFG/vjAyFWSU
	gzp80tFCs89cg6cTnZQ1vs8cVYkY1X9+KAWSbojbd3MbkIVQ0Vq8sH325sl7O4JgRON+oINVh7A
	zCDegSrAd7URFzr7+pVK+REU6pkL/wwpuzS0JhD/bFUJAFeNeXNa+0JAIxNOvzmCXtS8Z85sLZU
	vep2sjHvZlYR27mRFEVGB/sFZR3RaSkBCceTzlhMjZz4pJfjOdAWlI+zxovIeMQWUBfxkig5ARe
	R2ZKe+nJaVQvzABoRc/cmLuAGO7PlvU6+7E4xcMcZ/8EidZASrShN7fxAVN1QahFrHQhK+bxhy0
	r2atCF9lo6u5pWQkOo1G7vPCfLCsymmFtdMYR
X-Google-Smtp-Source: AGHT+IHxgzd+8XFQeH6I+CnI3pJzaPr1EGnWCnVsqBSz05ercFVxc937r04XmAc5WZ/WtZq89w951A==
X-Received: by 2002:a17:902:ebc4:b0:235:2403:77c7 with SMTP id d9443c01a7336-236426a80b7mr21936585ad.37.1749623168893;
        Tue, 10 Jun 2025 23:26:08 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:26:08 -0700 (PDT)
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
Subject: [PATCH v5 22/23] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Wed, 11 Jun 2025 11:52:37 +0530
Message-ID: <20250611062238.636753-23-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_232609_648259_6E5B4FFE 
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
