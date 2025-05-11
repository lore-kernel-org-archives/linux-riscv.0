Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408DAC3ABC3
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 13:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1ihPV7/T1q2WptGIpex4qBvh57a2Wyv1ks8/0yzgWw=; b=GTSrpyqqqg9D11
	Bydcmnr82S/TPbiah0ubJjgvMNnTqDdTWY3aQOeBZa//4lzu2FdA1Q/PT52eMIFwrZxOkdN4MMzeJ
	DBoBUBDNJTaeT7aesRepAGcvyZYT7w9swR4hV22P7hpNQqh3ED7wionfN7sjTGOv393ETcFzTty6J
	zO/zR3Nm46+pdZRk2ol0whBCEv84YGVdS8iTxuU1/VvaHVuwfENb/d+nfZIpUOfvBn6ji1/o43x71
	jTtLXpDGgXwEPzEyBIpwOdfwk+Nf648tYrwuswgz4pClUwgTYVO4k0jCVvucKvcDZhIFEKWgvm+2s
	kT06Gu27xmrw7PiXo/5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6xY-00000007IZX-3Epu;
	Sun, 11 May 2025 13:43:16 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6xV-00000007IYp-2kj4
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:43:14 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22e5df32197so36250745ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970993; x=1747575793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UQe3Qzwvf0SHdVaaWPmVtAnPTdnpZyqkw1bgNcAoZM=;
        b=Fl62v+E9rkTzhs+/Yj2uyszqvhAauABY6p94JUpdCfIx2Np2t2NLYlzwR8JNtUwGnL
         4RCZE/0c0M+0OQnTIl97nxcVZc8huZ/5X05KaEu6qdP2Dn5ksM2ZqUiT7QW91iecNg66
         fohsQYioDQN78dOYTjnLVuHgjFZuJJqjgRBwMxzDN/xT0JZ2OwevlNKPEncs1ERJ5XVj
         o4ZJpLtDow9B9pWpIGhoP92VIa67n6+pF0U3tc6WRRB/jhoNwizde/HEpD3Af+DVtOLg
         7I9hNc3GB/yU+MA8SBCQ1rXKT0hauR8xq7+Vr6H2BuxAWFqiimdw/nQXMI3esQJ77sIN
         qGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970993; x=1747575793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UQe3Qzwvf0SHdVaaWPmVtAnPTdnpZyqkw1bgNcAoZM=;
        b=lCAROADBVPRdpdL6R699gflMzb5rFSZ9xTRbOh5wjhdbnln5ffG2NCJQE8f+0fDVhf
         CmlYQuVB54xi8opxmnjulZ78kStdRkhjeMk+D5ZKJphHsSEuGgI+qNHG0yA6mQzi7/u+
         SfxxGK1B9c4Yd+qeaCVGSYx8T4jtx+w/eZjRK3LhaXWP9mjXXUcteQe3Ru83fqlJX8qz
         WWgrzXVs3I9MWSXMdqm9wnRP/sWJxhnAU1A4eabls9NUMp3Nw20XswstXUFG2US2ZYO5
         lR49OWYQvfgUiZwjvwRYOWdXpCGGcZJA7+uIFP1SFMG/YS3n/7wZIfcQGZTzHkl6Au9G
         rU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlzll1aWWS7yjqIo65e4+qJy5R0pKqN3UFmLcKQT0U2f0zTN28YDG/ctcvlXCX0CZc4xn9IuAuyN+2lA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHH8fO0VjbvIjSmH0Zlc/aFqSBNzRG7A4zwDexJFqmtglGo6L4
	jOn1/mRZ/DaWPyqVGAtguDw5QeBVby3HsOUY2LktFrLQCVdxnz9nwHU1peS6Pbc=
X-Gm-Gg: ASbGncvqRfigqWP/rn16mrE09bMD2jcQU5K/hf39eXcp0csM0sAma6hMJX8DrY4YY+/
	T45V2SZ0sZM6pP/VZ6PkULj+pIKR/IZ/WzWEXxkV/Pnr8dGRk/2CjV6bDUlLhA3OlbtzappBzWb
	q4QBI2dc3I/dTUaB72wh0KytXvythnIUKB6VP3WLefM35vicCOzD+CTzoDhyvijlUSXQRNb94TT
	JV5VTEl6ZYl0YNvriVbPRpE7vnRQxphplulWbmZAQMXsxDRJye3t5o/g/dfnbvIzExxrzDEcpup
	aHCpHp8SyT/47gblbXvBNczbMomIcSWn2J3zA43XnSkBAwFcFzh1ThmNaqefhtC33eMJjQxlP9Z
	FgVEHqt3WaC5FqQ==
X-Google-Smtp-Source: AGHT+IF+IkM7F7ey91kYHIIahlVI7rAiG07XaD6sENN6QxvafBbcmD4Potf6FZ1TEDxPieRGjIrvrw==
X-Received: by 2002:a17:902:cecb:b0:22f:a932:5374 with SMTP id d9443c01a7336-22fc918d1a7mr170483985ad.48.1746970992580;
        Sun, 11 May 2025 06:43:12 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:43:12 -0700 (PDT)
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
Subject: [PATCH v3 22/23] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Sun, 11 May 2025 19:09:38 +0530
Message-ID: <20250511133939.801777-23-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_064313_695923_7AB9A353 
X-CRM114-Status: UNSURE (   8.91  )
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
index 3c8e16d71e17..6aa330f4b67f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -141,6 +141,8 @@ CONFIG_MICREL_PHY=y
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
