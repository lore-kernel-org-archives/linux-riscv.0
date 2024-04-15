Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F40C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WwtrQPnQNovG1Gs2RgbTw9bAyKNv8kLxFimRYPZi4Us=; b=Bcbt5kyzt70EFK
	VSLc8xNWXH5vN2DPNbtnPyZ/zHszzw5U2x+I01PPXW089l0HCDY5OcIt2UY1xkizkUFjQ8XD8qvzR
	5Mf9Dm8gJrBSVsGxIWA8skcSdDMibxBJdY7VU98HB6DDifGNrnKjn0qhi15KcoXO1+/5ThijuCUo5
	8w26XQo8mgZVdslgo7fCWzAZfG9Xh8NsrOjDDoLvoU9Cj8zLs4ii7x9ngUv0TKHJk+sHqF+ZlMPR7
	in7LqT1gphw5Bm/RAQP8rEgNgFTjge9I0Z2DXIjYnkvUWivRr9I9V/MguYsVC1+/aRMo+d6ar2j8M
	2U45QLKGGieEXnYt1D8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPm8-00000009EPH-1W9H;
	Mon, 15 Apr 2024 17:05:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPk3-00000009CgY-0CnU
	for linux-riscv@bombadil.infradead.org;
	Mon, 15 Apr 2024 17:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BiK7floMzb7J5dAtjxG557Fp/B2Bd1rBgLoGJEgu0Mc=; b=c2AsBKpYQziIE0CBSeErSQpLrq
	DqxXAisXTmbCEcUfoN49OJ5eigWCMgdRUH12Vm+vatiLBOrcimmGV48rTkO1Fm0i/8tZn/lTmaBsJ
	pEw0BYQMqjqo5BxUSIB0+x8mvST8BKo+SADX+HaHqpIt/I7JWHA+bsb0zYpGXGb/XOEAxcwqdmLum
	nb0tYGhzEnKCV7Qr2YxFcQRl9dETv5OBr+G0eIwFZKqZJzX5FCMcBTBulFWYGDmhNVcXL/XPpsiMS
	Qh8TMXs6Tm3Yl7iK8UkY4y4DInYK8kljRnUrOxsVuI/tuSNIGWhcFwSlLP67/teTceJ8RvDSzOAF4
	5P32fcHw==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPjw-0000000Afcj-3zlH
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:03:37 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6f00f24f761so661019b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200611; x=1713805411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiK7floMzb7J5dAtjxG557Fp/B2Bd1rBgLoGJEgu0Mc=;
        b=SWWomIuL6iqnnztOk81Beaa1Ega/Jh4+hJBk6npDP5iyz7tPhDRsJLAGQ/U/CHkTH8
         9TYD09lLDu66/FZujzLwtBnezOFBDWjXZHmCdA38lUyhI15sM4072WgrpoLCMww+xDh+
         BfcmLEcdT5FXIhSrzKmGQqlDP0K6COVTQ2BXw4vzASSHOSoS7tKNiPsJE+I1PRYdjsAO
         DByoPiWQh8Ldqk4y9V0IIob735sONpjtMXaMZzFsPyOKwRibbVJrmSdrMm2FTU2RSLrd
         z7QGpr79A5shfwwhL1GIF8vznvnVfqE8r2rO9F2uMCTtz70wU53s8iVCJFy88nWbN2kB
         dLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200611; x=1713805411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiK7floMzb7J5dAtjxG557Fp/B2Bd1rBgLoGJEgu0Mc=;
        b=YRYaYRLhSa0ottYpomjt1eypcZCgoz7gAyFdYvCOxDnd7kTgPvldjUckfjpIn0//Ns
         6COJ7eY2cV5QnWdmJHbxYVxRd02aARLCHVs3K2TWiQOljApHSHikcKq+yFmzvtCnMvUD
         GgsYROAtSN8wIUkqB12UNVY6FgkWOzPweys5W/zPe2Y1I5dLdLfxN/AXkc7tnHhD0sCH
         jjkhhnXE79CD/qE9dklJc9lCX+BebPfHx0Sog7Aeda543s/ltdNVH/gp0iUnLwIKBadR
         U6XRSU/wmqH/i4aodhyCLlnvywcMhfREin0Tne6gPq35fkVoa6PyODMV7IIzQdIj1RnL
         ruog==
X-Forwarded-Encrypted: i=1; AJvYcCXVKB+CIe9GaqTYcBlG8juj+K89+pD4ytJBOTUSCXCuDREjcuZKrm+DYMZE+oi/5rlkhTmcunEUKX5WMY+b0MMpnmzWkCilvJAiMX22Zzzy
X-Gm-Message-State: AOJu0YzkxNUQkmTPqtMCVVfYYg1RqmLfHzPeH71ks0hlNBt/oBXiy09A
	HAEkHOtNh+sgufSOY6ayKqc1YKBqigO9CSuiXvdTJyDnlPGeQHGwlVxM+VtBVRc=
X-Google-Smtp-Source: AGHT+IFd9+zDBggMUEnYbs4X0hsHQYh+Hj4Aej+R4rn7fzXqChszrhGpkzejjAS1RwVrkPfA71InHg==
X-Received: by 2002:a05:6a21:3182:b0:1a9:da1f:1679 with SMTP id za2-20020a056a21318200b001a9da1f1679mr4846522pzb.34.1713200610709;
        Mon, 15 Apr 2024 10:03:30 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:03:30 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 19/20] irqchip: riscv-intc: Set ACPI irqmodel
Date: Mon, 15 Apr 2024 22:31:12 +0530
Message-Id: <20240415170113.662318-20-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_180333_157029_A427691C 
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

INTC being the root interrupt controller, set the ACPI irqmodel with
callback function to get the GSI domain id.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index b20272151aed..af7a2f78f0ee 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -326,6 +326,10 @@ int acpi_get_imsic_mmio_info(u32 index, struct resource *res)
 	return 0;
 }
 
+static struct fwnode_handle *ext_entc_get_gsi_domain_id(u32 gsi)
+{
+	return riscv_acpi_get_gsi_domain_id(gsi);
+}
 
 static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 				       const unsigned long end)
@@ -366,6 +370,7 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 		return rc;
 	}
 
+	acpi_set_irq_model(ACPI_IRQ_MODEL_RINTC, ext_entc_get_gsi_domain_id);
 	return 0;
 }
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
