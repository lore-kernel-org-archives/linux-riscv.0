Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE68CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 04:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ly7p7if6v96GlpiQ+MkciON4/IzL3AOcOIbWcyVqn20=; b=CSvXYR7vJGWmN3
	R3CwwJhl8n3xCuYGm2V5V+se818HblcOIa5MRf4zE+HC+HWh5kbn7WeAm2pcvDvoz+uHumyi7YfRw
	Z4V8W+XxTxOJiwYrS4ISNPyVvcuUOLSr0/s2KyWyeRlnzuH2KlUTOLNi18wxb/fKofKXjg1ZmOGuh
	ShshrQImOCLzxbHlBUUwk241cUMsBiu6/c2CrNovbr+xBAKasAOAsWAD6WF6JJvXquuZo6t1DMXNH
	8fc+HTZ5s3y+SOQynZN5tpmP12XmanolwAAjLOJNg1onijhd7/kNW7MGLM61QKU9RFZMKPdyr1WBx
	B4acaPmsCAQCP8bF0pig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrFG-00000006Rtb-2XR7;
	Mon, 18 Aug 2025 04:13:18 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrFD-00000006Rs9-1DIr
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:13:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-24458194d83so24942015ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490394; x=1756095194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJN6/jwOx6PvAx5UtYwiYDtqnVqwfwWox4DCK7OERJ8=;
        b=SCJLX+SOTfolRAE1CO/b5DgskZS4i9USImOwHQWTjG+Kc7PHzezorGBhqPeDjgz1T+
         zDYKDlgrT3JQ3WwKLmSwSFXI921iv+3FTB78Ex5vXvfu8fUg15vAIjF4rVJNpqwqqIHD
         edHlOj9TlaOF1y+NsQhCm7KvyGmPyyEUH7wY3mzqFQq9Xw0s/6/A+hHlqwjxnKTqv7XI
         Na/onhtOiFD2iQ0X09mj/eMw6329Syn8ei1smqYx5gD0lwwCr6mQjgGdK0Z+bmyJ23Rx
         qWciqffltF8JIvyw+ddCU3Rw99PFJyxi60uWAx2SEWZCe10k8Xllf/Qukjo8p75qXQoM
         16IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490394; x=1756095194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJN6/jwOx6PvAx5UtYwiYDtqnVqwfwWox4DCK7OERJ8=;
        b=CCSk2jxxQ4h2h/s+1+D0Iw3BGqQW1D58UqETDt8v8u1hFYKUnaaLr6gGiSplySZQbg
         wqGU1njgex0rRbUHtISWOj753dYoCpPf8H3ZL/GSKWy+ydz1pdw6dmL0esQBl46eqpV+
         IueWiUjRuRL9I/kKnxEBr8jXjFAzE6bFJWtl696y8vGjTpPmqTbWX8SJQqJY+SqOZ//z
         4rU5xrxNnknDQYVFZX6MB35GbENzujykVD4+gfNIaQUqWNwOi8tZYHyRHLXLCVeEXn1E
         22pdcqt4gU+56QjbDeI+Z+4nbjPhlV4cnic59jv+hF//xGUKfCRTAgPI6WGCi11XOZTT
         +rOg==
X-Forwarded-Encrypted: i=1; AJvYcCX96ZjKrhwB7VeU+vy8MZ8mbajNLdybKg7KUFr+zOX1uJDiPBNjcrhK8w+A4nEnbuIFcx0A3EFi9Yo7SQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+pW0+CB7yIwa04TvN5UC2Z+9AbVHM1Nh+VdtXpwqWCsJfF0tV
	2pEuzy1vlYiOUZRJp8UV5QJl0lhE5Uizjt/VgeepdQT+6GFMLOeTMQApV1THpa/TsR0=
X-Gm-Gg: ASbGncsukc/9jap7O0C8BnidkQhz4Lbq/h7jR+CMHBR34IhtjJ7Tq7u7QCMZHHwpCDv
	dMrm8I3fZX43O/xdTC0RULbV98OibqHSUCCI96asDO6EWXFpSdqMm4NOWuyHbSrdohFDYUtIpbk
	KSenYTXl2HesjSaCu7F9N6kRy5rlF3IJYFRC0fRE9Y5OAXKNtNtjaYBTRikgWXDQHq8lP4oVP7e
	R48z2pbHa1it1+a4Lmz0HIy4ncE54bjMOC7A9nlrxum/jm9IsMM0jF6345oqJ5F5/CogpT5I1uM
	SEoa0s5shE4R2Rlm0ZxH3LTM4Etucqk+pz1i2b7Cm0ycoPEBHXXjayclE7wCK82qO5OkoARTqf8
	kzVoSrlWrX3f8JUpqyqdiAFmF17Sy4cQhqEuaVYFZmF2/GoiBWkXWIoXzOmFAhnVP
X-Google-Smtp-Source: AGHT+IGHAghuq2SQgJxlaChRoet/Tx7S9hCYmLUP2wntlwdg9I81uVIMsAQNgL7M5sl0qBnBN4yH/A==
X-Received: by 2002:a17:902:e948:b0:242:3855:c77a with SMTP id d9443c01a7336-2446d8c6388mr161787285ad.34.1755490394370;
        Sun, 17 Aug 2025 21:13:14 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:13:13 -0700 (PDT)
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
Subject: [PATCH v10 23/24] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Mon, 18 Aug 2025 09:39:19 +0530
Message-ID: <20250818040920.272664-24-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_211315_327619_A1BA2D7F 
X-CRM114-Status: UNSURE (   9.54  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
index 7b5eed17611a..021baecb253a 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -139,6 +139,8 @@ CONFIG_MICREL_PHY=y
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
