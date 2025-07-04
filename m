Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACE8C83030
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 08:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2v4ZEtXYUdLzZZb9w4M2eZgQPcYjIChIV9EAp9Z3Qk=; b=eOvI9v7bTfBRhz
	f/uEmlHOfjdqWErWH3Ef3tB4KRou+lG9NQ/9XVxlhF3pcx91UaSJ6cXrzAbUG2BwcAO6ZOtXcdGMG
	CMYRGIIgLMqqGvu74Y9t+A5ldrJQCRj7lFnyJuGWrImatm9nunVGJ5dolGDzVzE+cRdH3iWfTQ6Gy
	WWhkgDAmz3Ji+GFw2siKRMFE1ylH7Nl0KCW+cXpgFDYsmwhrquiadyPJhgHv+EkfM8giubHq6lnCC
	mzjvUEXQDFDbFX80+oZOFOhPa5DSfgWXCy3uT87pSwwZvu9s2FByME3IwCTBNVd9AN99K5dZCfC7+
	Cck9tIrP7FgqguSTYPpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbfn-0000000DiLy-46CI;
	Fri, 04 Jul 2025 08:21:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaXM-0000000DWhB-2Fo8
	for linux-riscv@bombadil.infradead.org;
	Fri, 04 Jul 2025 07:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=; b=cHEtoG7oMF90AHrCn7i0NulSGu
	4yoeMU/Z8oJBqvFyy46iv6Oo8Ov7UDRLW/F+vH60GwpY0IDwIQP4+EuPuHOj2Ij9wyGqn9O+Z90C6
	wCQF2ljxVzE4RBRufaaZlnQ7bVlZGk/lpdP+l0XIqfVxqMPRQIUb+u0R+UjqGBo7UT6+RisYPiimy
	7yFtUqLZJk8AZshKP2IVaZ0b4ZZemiLWUBDZOps4ah7jEvw66OlV4fYkOjQuEgImPB1cw7eSX8g/S
	4soFMlK/pr+E4+im2qFXqzOpFqYJd0Qpd1gjAdjMBeeG/BTrdpjf7OsbdkK5GDbx+rbL0JYA7C5kD
	hIYDNXig==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaXJ-00000007nez-1soN
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:08:43 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b2fd091f826so564010a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612919; x=1752217719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=LohpDIbnz+wthEi5lWTtODQU9L2JE1CeHAkdLDTU1BbvBKywHE8jJrgej3IEytwh4Y
         VWn5wsXioIPNa3KQJwV/ES4dd3QBe+ASIxqlFSpgaS2kWV1tSQrO/Qx+12GD4DrBZ9p9
         qtn4RRGvpeAAAJR/pN3RTrt1N6i8O+GgV6Vepnk16FKr7wM7Umq7HHbWITUtcGydgZo5
         l+LWxgjycVTq0brpWpKrwBlm+0WiNBwZ2kn1A9B4F/AqzhzhTcCcLRCF1w+E5GJVCBCy
         VVC3City7LlJdei78oLJPedz4Zs4Lm7kPYgkz1pq5AXaoI2juR9mZl7vtC5a2943TFLu
         qYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612919; x=1752217719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=sDWhyhS/acrUVSWZWK3j05KJlU+fJa0WfRioJZpN70OjNW9nNdSO1a44xBSL9h94ft
         FSD7+0F0F/zi3HDgV1gSA13h/mBeiQAHev0hp1SInhCn+HwQKjVDFFGz5xcwC8eeqVlU
         qrqgSsLe7nA9m9r6eH+kq/cGfIzm7Brl2H0SZy3eDsS6QKiWFHbPHxG5efnL8oQwaSeE
         mt5nErwsXYjfSc9M3TNG1o0+h6/CDLnPl5kV9w+UPSExE/Vpx68ukJx45L5qzF0EwcX8
         RzBx94GbHEtdb/RZLIIKpihhK5YwTuwj9ZaHTLU3CBcU7CkVV91HwYtdu7kfkI1gJkfm
         bEZg==
X-Forwarded-Encrypted: i=1; AJvYcCXiKR09/46XUxjQFvzr5IggcrH/J5qJECxRg4yxq82odEVtv1ouL1pPwKTprtdPoSwQpQxWdkUzxL5qvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyPFnNqE3UUmqKTsqra8cFgKtrYg4yf9zXj8dGmLa3LX7d2EGD
	9NFDdcxU4TKc4xgf89A7WD0B7/HP0Bj2PVt3YzqiiSepFfsvzvs0hpLHt19EKyEdM48=
X-Gm-Gg: ASbGnctY5Iz+Xvd+kpnkL3gFrb/w03jJWiBTqZrjEPvRJbTaSOt/jRdG7AEwW3chlh/
	MFgWfVcLAWc3BEO/8msjLYtA/O/PmO4hNJuDXELtHT5C8dpGCY8sKmPiPslNeN/TP7OwpgAXgz8
	7kPGnQg9nlSqfBB7jVCN2Tf3/YJKgKNiLeYfFEKWcuvKnZU7gy3g575VlxD5tuT3kif6c4oszvu
	svnIiHiyBB6+nITM/Fz6sJdKvEUITvhjPYH0giF+GwxR0J/s6tmjGMP0uO9ysAAUOK/A+A7IPMp
	SRU4QoH+voYknmksJ1fxpNEhwT0K4hY1Y0r9aBHDRz12a/WvyfrjlUNKp912k7Ns/Wmj2jjLM6Z
	UOy1lfXBFikS46Eo0W0aqC2vjsQ==
X-Google-Smtp-Source: AGHT+IFZBNddecKSRV25p51oDjtdR2ftq1DYNinGTFvu7tPEIDtFUw6AiYcQq2JjuNxEVU+rdRoXSg==
X-Received: by 2002:a17:90b:3a05:b0:311:b5ac:6f7d with SMTP id 98e67ed59e1d1-31aab854e04mr2651722a91.6.1751612919264;
        Fri, 04 Jul 2025 00:08:39 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:08:38 -0700 (PDT)
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
Subject: [PATCH v8 23/24] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Fri,  4 Jul 2025 12:33:55 +0530
Message-ID: <20250704070356.1683992-24-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_080841_942039_A9EDEDAD 
X-CRM114-Status: UNSURE (   9.61  )
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
