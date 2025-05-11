Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03817C3ABC3
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jm7lllvfi5nMG7bua4GK3cKOPgoh6tlRSuA/+Ap9pQ8=; b=ht1nTrEtA+Spwz
	1fG4YCpuvfgBi2Y+oZyoQg+1czLUM/qD3zbjDALC0iQfz/pQjhjI7ONpEe7Tsmbc0YobXaYPa+DKR
	G3NGb/fdvTTEERPEpPHuBABjrSgQdWBHoXK0qb+sq6CmhJg2807CoFIqdnhd/lMr6j5nye3j8RR3Q
	4/eoLHHi8P9S357BS8NgE3rvbK1tYBwFEp1As+CfH6kwRKu9UGgKbznwDUbcPxn/adxlS9ZdSJ6Ud
	nxo9y2bCJLcVHiIV0yJaCM8a8p2YWPDpqizGOhIhI9kJJPaMvSPyLTG9ylMyDyjbz229QMTYfv4U/
	R9rOmbIl+UTiqInU0oeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7z0-00000007Ov6-1S2r;
	Sun, 11 May 2025 14:48:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6wo-00000007IOZ-1elu
	for linux-riscv@bombadil.infradead.org;
	Sun, 11 May 2025 13:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=; b=dd2oPR1MwVAZnVDJ7xojILEw7D
	hNiwjBuQlPd78Sp1wlMF+lCe8tzdQl28xD/ufOjjJwD41br/+eZMbY2PGR0NWZ2nctG8N4O+8on18
	JAXwUHjYAow42TmljXhIzTYYRdOU17GTrwy3wNCWa8qOS7cjRrbCkuuOzX+zusEMBdrIAtLwZe+M9
	6lMejzbxoyX83nZ5PEzFfEaLeJdtbHxKx362xbbkLeknadZxfbCHrBaWKuaZLzPsNrimG8d3wC4WH
	F27FKygLouC3SfPu18cGrTH5EHtT+CCZ3dT5YVluL8dk8vIJMpwVgxy50Id9G69gDEv1bYc+guJVy
	5MnzIpEQ==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE6wk-0000000Gc0a-0ZMM
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:42:28 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7411f65811cso3002352b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970941; x=1747575741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=;
        b=A8AcMWwGtFyfzLGn7oMgOAh4dAudzeGn2+9/36+XTMEet2UY0h8qsLrrUnaunueu8v
         f+B0LE0Wky8/WS2Zx0wC1OANVYDhH8EaUGy3fOqIoKe7kGY7ESTJ3zeT4cyXYJcrjDj3
         osOPKkjAyUZENA86us9ScKhxIm42ig8Z3gGrtdeF00jM4Zg131rYwq5gUzsGCVHPXBNo
         NgaHUMGAY/8YLCfgBjLZ68W3/BnZ7Y68Nvj/hFBjO/J+Rt5hdNtTb8lyP1Dz1Wwd34It
         oJD2vZUnKa/aAZVYVTNzlaUCTy+fp0RNTkmDzNPUS31Vw/2AxQzCw1gugxXmxfdMaJmg
         uBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970941; x=1747575741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=;
        b=EFa/60fBUjLn/gjY103Uz2oA+9fExoqVsvz531bC5AXYVxSCZIFLzto6hkxjVfNCic
         t4qAD5bxEuiG8V9ocRFQFl0buUeyVoHAL1xb+A+1oWM01ul6S6mWbJnAvbL92Qvud96t
         5aalWUUYbnczry3VCPRlxApb/8Sja2u5lWLC9jPBiB12UupMJoMYwMlsI6c2uloCzy3d
         zRsJ9ZSp8+A4+Bqo+G0U7Bo6s2qkn0rq2hdVKminPWRYExvLTH0ptLtcC19j4bdbGa8I
         b1uSpLgVNQSqz2lXQ+GAhokcTsJgK+1oNPjynAFSdblz/rpVh3e/LB1t9NKbBOp2t5ml
         tcWw==
X-Forwarded-Encrypted: i=1; AJvYcCVb7f16LbqHxdbnkvy/aw0P8f3mHPpcvWXZje9aok+JB2UlAd2n2NN2Yv1dq+4y5cRhpD2YBzFbnKKKpw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvvg4k1AjD8JgK7f1hQAK1hPNdsmAJJ9KTwDpYDwWhe1Cr3xMy
	x3o4lM+YMcDuOW29hZcBpq8S3Ns3sjXqgVe4eon559+/7yz+x3Thx2Oz281BzZ8=
X-Gm-Gg: ASbGncvbsOZOv2WeMlUuZsIK17JIJXGftEu/hxC6PWscaipCqtamLz/PP7ZCH5iK/mq
	5vRMGalji/7YDT2RT8BBfdwXcNSJQfK5vOem4HjTapHvF6sQ8HJjut5sYW9s3QeTNrL8d/1tzgl
	+UT1rPpy0TGzrIfQOdlKkX0hyEX2ec3db0FhZzVQ4zsd7kHNj2LR7S4N1p/Sc4JY6AeMCfPGf5O
	VK1AWMm78xYpZKA69gV+y+uyYJplQ00Ix9DvrVytL7hIrTD2hQA1RidDGiWjFThENKH3tV1VF9W
	E5eGJRfj+sjxar4sVHaU6pVgDcZw9IOELaWO636Z8sdJ8xrOkuyezqGAQO6RN6ucP/Sl9MizWIr
	i9qU0pVyckpknLQ==
X-Google-Smtp-Source: AGHT+IExo0JFN6HOT+mbUBxTAOi/++2rhBZ3oW7UFgUXMGLrtCOMV0AdwEfD4kuAZAW5D079x04psw==
X-Received: by 2002:a17:903:228f:b0:223:4d5e:789d with SMTP id d9443c01a7336-22fc8b415e8mr147781135ad.19.1746970941076;
        Sun, 11 May 2025 06:42:21 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:20 -0700 (PDT)
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
Subject: [PATCH v3 16/23] ACPI: scan: Update honor list for RPMI System MSI
Date: Sun, 11 May 2025 19:09:32 +0530
Message-ID: <20250511133939.801777-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_144226_362133_3C2EF7F2 
X-CRM114-Status: GOOD (  10.05  )
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

From: Sunil V L <sunilvl@ventanamicro.com>

The RPMI System MSI interrupt controller (just like PLIC and APLIC)
needs to probed prior to devices like GED which use interrupts provided
by it. Also, it has dependency on the SBI MPXY mailbox device.

Add HIDs of RPMI System MSI and SBI MPXY mailbox devices to the honor
list so that those dependencies are handled.

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
