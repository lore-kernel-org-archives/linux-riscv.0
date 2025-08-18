Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EA2CA0EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 05:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RmAfkcbvg0r8siLFTk1w+6hBR/Oziq77yFiLtHXeaUc=; b=FS+Xq2oXr2z+Yi
	HGTA8Qmb3JaAsNm95e9Qqq2vp2liNtwocLW/HKgHyFvwmmyXR7HASfeA8InCIhoBR/16Dvx4W1WBW
	qlEFPINexHYiF5BFX0+k+KceGD/FRnHmgf69qphHzzM7QNlkRfHeEcGC3xWQtfqtycX4MVauJh/TK
	pSwjKwhF5ZXvamDgoKCyewE748A0yPRkgRudLwP4IfAehSbWdjUyDUqRBsJKhWmPUVSLRh4uk6t8H
	h7rehFo5nREBDTbEtJacZP98hvrbD93y8EGqyGGqEJeHuTwG96hOgaJLWlH8QZzCxY9JtJIF8Zsq7
	oF516ALZU9CJSV6z1IyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsGL-00000006XBn-1TgN;
	Mon, 18 Aug 2025 05:18:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEZ-00000006ReY-35dd
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RQx4DIh4Piuq7HhjaN41eXcQRyGY2O2ucSjN2pwnllI=; b=DlnOh47cGTkv+MIg9FLcle4/8y
	3GV9cnfcX96FTDk7f+cW0xAa19DplGN3kNc4Bi9J9/LkYo0aYAv4lcmCJGOe9nYYYgFFtv6L38DNK
	l+ixXKJFvdtHOUQJPJ/1TQHfZuPhZXMO4TJIfWLG1jlhVG+9HnWhSMOnLa/9wAXFhUrliztTtnMMI
	eZXn8x3EFOX5u0F1abBHpbO19j+G01WeMoIvhGNroNFIECPeftPupANTYvCOYtNDDsNFXFukkEIv4
	Mr+SiXrjgDQBfn0D1Mus5OZK4p+Rwi0rBMCq7dFcP1MIbAELVSL+iOWTisXkqKy/sD8B8Xthkt0Fp
	F5g7rl1w==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEV-00000000Exy-2ClP
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:12:34 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-32372c05b79so284453a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490339; x=1756095139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQx4DIh4Piuq7HhjaN41eXcQRyGY2O2ucSjN2pwnllI=;
        b=fP/SKO95W3YWtL+zFwzVAW0CyPDeB2FyxHCmtnIdLr5d61PEwmqBaN6ezbEkq0tRvz
         jPs1b3oUKDSqiNUiEn6NmBQvjjENSvIoGUNzDxabrdRCdmeAwKXHphV9B82eyQkJCmtd
         SPd/1wPf4z/IFBX/PhfCX6ncGsU8IlQ7IPpbJqDDvhOqhMkxqbjMP62Kaiefopxk4n8J
         0GLOYM2bHMKtHOT2U+ygKOuYdrzWM/7rrkI3Cyju9k2zTcJc1xL5CL4BVjwipUTh2Ffq
         o9QbTb14EoOWn6V1vVFa7ljUG/JRFiTneHT47EOV6Khm5CiuIBraqwz9lgLliyQ8aTXC
         IOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490339; x=1756095139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQx4DIh4Piuq7HhjaN41eXcQRyGY2O2ucSjN2pwnllI=;
        b=VrU7n07HkAeTEzO5teUmKtpZrEBV+4eoIuy/w2PCRyARcoTUW1sCuYo7wHkskUB6zB
         acVfSQ8Qk38mjLu+UzumopM7Sczt30CQUvXJRPLcopsRiYiYQf/8hAqe0r3AMHrzvSca
         E4KuJJUSBLc6L/L9g98Ie+tOadSDtJbNCg7kPsC8qJYE+hczhzEtttSUtNr18ACeJ9we
         r4HRiQCGOw6/ChvLdKnh2a7/YQ0X9QpriuwryHKdch/HiHS+aPp301uHUvHgg2OpqzXD
         1hGE3X3hZalOGKXnqDnoDsuj6/EnO7yLSYSPGoATcCBcR9hxDqSB/NcB/8TUlUWiLEBk
         7cQw==
X-Forwarded-Encrypted: i=1; AJvYcCVhFSJBscYBrEnpRB/pFkd5TAuBEywqYIhAKj9hd+DXnsO7zjbk8p2hW6e9Xec/mAoVjF0NBJy6nIOA3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwesJr8I1PTb4rbzWxP3mrFdIsv2pPlJCAPr8VtpMRiBI1mz8QA
	ng/QkOcxUi+1KHkHtMDpjTXi1WAUK++nlfcvD2SOYD0pdnfsvlhg33Vc7L5vhUHzsbQ=
X-Gm-Gg: ASbGncuJZNEtGLcff5VndSJRSyvB2USXNCEiwcVf+zGYy7jxMzgKy1fxO4J/wxxHmqv
	Qw8VSDP64tuANZWQpz1u9ex6EQFhRc9j6W1dkip9957yKXCcqKJXEK53Y3wDcKydUXXIF3Jyscj
	f34/ot7uw4MbkSvcHTHgr+xvhyqxx9HYy5xIz4buwVoyZr1hFdMRuGEI/9TJnSzJ9gf5+SiWRLV
	UfaSGEwpzHC5e+HSlBwd2+NBCltLsSUACIKnNidVWykh9/y2Vi5rWHj4oXv1g9JSUmVmOQArTpf
	XMto5WxhVHA99VEXJ8jgWej9kRXnHAs+aFTBJ+LjbHfgaWORJenVul4HMLyn3bcIozt8MWwJnPZ
	kMkNp+yS1a3WiGneuq+58E+yMndwo6S71ilwfcGBFH4fgaiFtIdZLBC5a+3xYF1YQ
X-Google-Smtp-Source: AGHT+IEPxSb/NsG9Zm6Sde3dy+9vjl78ugsOjUnfoDwFeFFug3ocplCGnN7dY2ngRx9phRfT5mXqyQ==
X-Received: by 2002:a17:90b:268c:b0:321:87fa:e1e4 with SMTP id 98e67ed59e1d1-32341df8cfbmr15719154a91.6.1755490338939;
        Sun, 17 Aug 2025 21:12:18 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:12:18 -0700 (PDT)
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
Subject: [PATCH v10 16/24] ACPI: scan: Update honor list for RPMI System MSI
Date: Mon, 18 Aug 2025 09:39:12 +0530
Message-ID: <20250818040920.272664-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_051232_377869_131DB4D2 
X-CRM114-Status: GOOD (  11.10  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

The RPMI System MSI interrupt controller (just like PLIC and APLIC)
needs to probed prior to devices like GED which use interrupts provided
by it. Also, it has dependency on the SBI MPXY mailbox device.

Add HIDs of RPMI System MSI and SBI MPXY mailbox devices to the honor
list so that those dependencies are handled.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a3..54181b03b345 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -858,6 +858,8 @@ static const char * const acpi_honor_dep_ids[] = {
 	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
 	"RSCV0001", /* RISC-V PLIC */
 	"RSCV0002", /* RISC-V APLIC */
+	"RSCV0005", /* RISC-V SBI MPXY MBOX */
+	"RSCV0006", /* RISC-V RPMI SYSMSI */
 	"PNP0C0F",  /* PCI Link Device */
 	NULL
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
