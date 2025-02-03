Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28101C0219C
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 10:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlPZT3/nwFa6O9Qw84GV3kTrGIpE7oTjsk9v7DTnRq4=; b=ER25fl8REi10Ml
	EqsdcZkTYhwGEfahXlYb7Sw9TS0A9b20XLdWWE6SImepO27S4sNLbE04WyTXMqFPwNWjKJDILnb5L
	+CKW72e18ebw2SvTB+/5wgxKyxT4w79TTbnwE2AyBq6KvwxblE0qiTBD5jDpbfL05gbr+de4Vcg0z
	elxmgvDH/H/aykjVi3K8CN5OgCimegSDIFCPqHwTmiqeE32XrEyHIJ8ypPgd5dxp+B4e+7TeIVkUs
	nx+/+tFu13KdMsX+4gEKZXlzNb5a8bh3j/G1DDloJ2qoyOOGLZAe7MfM8LFDqpgbB8KwRB3/t+e0U
	Vc//PSqfQLSrnxHvI9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetG9-0000000F3zr-3V7l;
	Mon, 03 Feb 2025 10:00:53 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesCK-0000000Eurp-2lLR
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:52:53 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-46783d44db0so38916961cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 00:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572771; x=1739177571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrS6UZq8voK5d6I6M8hMOQP+PQdCTVat6aZNVhGKd/U=;
        b=FhA53F0TznAV1o3hcHosWIm3wBFSwaU2GNPbZRB8gfZ0lc3mMUKa0Nla+H3GM3zXSy
         XE1yHpgbJ5UItHqGW5sFFqdEC+MBwmI13tDSKe10v3YykaR/JSiO8I4PeES29J8uOUcU
         xaEcJ9qfGDL2q5LiYnZ8TyAdRvts8qKdnFZqfKnGu3DEhPJNZOb3sSoqiv0OGyazcKvq
         WRFAHLZx0ybkzej8XVhZFUT3nQm28FeBHyrkGtPr3CRpwWKNkvmAgHRs07SaVLiGKbvl
         aR1PPB2S3wZ2cDrLhI/u5Hi08+ABMi6ytquiRG+UEjAjFguSoxIg1EnXp5vBLyUK9rNu
         s9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572771; x=1739177571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrS6UZq8voK5d6I6M8hMOQP+PQdCTVat6aZNVhGKd/U=;
        b=nKdjRms8ftscVCxOa0m3jIjI7pIoUNJiJfxzWEDbG38ZlE/M5fixvnNAjNuluaBPZv
         HVx/GlzcOuXgmFePpfm1pmVS4shl0L5vHUM4X04rAvWWi6NYaiq/37Y7xtaWpVqZWGHO
         HtYroioZGm0ajXeiFK49MWKoUWNwCDqEvHaBEnV6c1kYRb4GCnRe0AjmGW100T/Nqzku
         F0+mLHEDnst5/FgBZ8UJ4KgX4Cu9OuiNwRNZcSrhtusxfx8yHKeMkUDILal5lazVRITI
         GoFxoR6ULTKEtFhdQtURaglmVCfbNQV5ZJm8RosEi8C3EUO528XLJvngf9Ey4vIPSNy7
         N6UA==
X-Forwarded-Encrypted: i=1; AJvYcCXJf3n17NljMwNh7uW80MjkVdcba/sqS7Umo1n0MRG8eouTxRJZ6qkRrwmYBa8AHD1JQU92rUEYVWMNJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEwfPX6F8QFkTsegVyBdAXPTyzmkx6yFsA5CIjKSuRU96gsUXL
	A5LKqxEAkjW6sseCi9UUivDLOyNj+/vVjpSHrzZEYIeEmnuPw2G+I0q92WXNIeE=
X-Gm-Gg: ASbGncvGE1OIpfcXID18n+dbv6jUuaxA/pTNJvn8YmhAwgnNKGn1CJQkFRTnlOLE0TK
	NPrs8/ar+6ue/E63sP3ro5SY6snlnRsZz5frZ5Lm3dP4YAon8iO6HJ9ED4ckfzy9ww0EKvj70VE
	3SdnbeOjAabSOpTe0DmmpRKwsuGvKdTZT5X0DoZo3RrcDMlQlJkZ2sNCUSucDZKAUr9VoPwueYe
	Vb71JULXZ8M+ObWdmDGVYPXzSzz0hOUuJFLUJh8Wcaq9jijvqH/f51c2dWyyKIaHu1p/okxmfZU
	+O1/cg7/e1/aN3xttgohARoVmwj3Bb/giu8DqijS0k5owa9NQiwnFs0=
X-Google-Smtp-Source: AGHT+IHCJxve5T10aPiQPDTrvWu69tjDV21FWaMmTfndSVMbeYY2fptctuonpJUVJro58XKkYYFZeQ==
X-Received: by 2002:ac8:5f8f:0:b0:467:672a:abb6 with SMTP id d75a77b69052e-46fd0acbcebmr285604751cf.23.1738572771412;
        Mon, 03 Feb 2025 00:52:51 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:52:50 -0800 (PST)
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
Subject: [RFC PATCH v2 17/17] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Mon,  3 Feb 2025 14:19:06 +0530
Message-ID: <20250203084906.681418-18-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_005252_695868_4A71F63C 
X-CRM114-Status: UNSURE (   9.39  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
index 0f7dcbe3c45b..06265b6febba 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -142,6 +142,8 @@ CONFIG_MICREL_PHY=y
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
