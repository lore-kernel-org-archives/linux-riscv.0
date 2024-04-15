Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EFCC00A94
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rEKboOnm/bv0UxP1K5Nb7U4gdNf7ZtKrh8WH2fS/Cnw=; b=XFNFjuM7pvRWto
	cI7/e4HNDIWx/iU8G4KFiFEvfEmG8W6txUoV8wPhhzmYovXjwB03O8qZpoyDn1nwnYmYBYzVD2WRC
	eMS/WcFjlGY+BzMTCcnKUYcEKglKgiYoyykMBksf6314HmLWoN3CNZbhnhZsRK3+DKsvJN1XIeH2P
	9gqOGmiwD1okdITvLe41vJ6hhECDe1IhHwnwRILLYKLZtAhjGuRH8zNdGfoHyyvskmpByUHIIP7iU
	G1CwUJ7gRjU9MfbZXiHJ6TPjkXVZIr+OehaRniaHvDpPwMMXyw+zikY/k5XCWgG6R+YZSmEKb0O9L
	zT7dUMDj44mcnzsUmORA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPj6-00000009BxH-2MsO;
	Mon, 15 Apr 2024 17:02:40 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPiE-00000009BR8-1HT0
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:01:56 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ed627829e6so3791303b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200503; x=1713805303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoHprznTatfd3jPIiDLel21Ov4h1fvX4qo25ti25gdk=;
        b=NkD/6adJbx2WWaW9g0LNJguAANigcw3RghTTUvkhYp2ODNntWwnFTRNv89+1V7elsy
         HLEFYKn2zidm9CwRndZJUsO8uWN1FVwgWc6fvW0N5GwKon0NmyS/zN5qiKSoN/ImVV52
         3ZkC3XnIR2DYUnTCvGF3Ya8F+Vl4Amft6CYNtnhy5EyAAqvym6CREOaTayfuDrKQWinD
         w1ZsdWcDKM5d/qCCq1FTtd2wJR0xHkn3A/BHDpO1dR5o4y226h9IphcXU1snon8x2F16
         mgVwyVgpFALI8dKetjU8IJOXEc/JKPDm7hgafXV7K6X40W+YrYI5hSn2iiQvGSO1R8Dl
         P4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200503; x=1713805303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoHprznTatfd3jPIiDLel21Ov4h1fvX4qo25ti25gdk=;
        b=W+766zYQ0zEgW4C4EbEAiZ9zjGszpEy9b4BYDlIsWfnXJDYXQIWVf6TbFW9YW39x6Q
         ATcIAXqXzj6V5P0p6NvFyVu5rk80ID99mKGmaRdJRulMViqameHpk+i+T5IthzzeZnl2
         P//o6+Dv5EcTTAnBYJLVRG72TouDDgTuZ4CEKbii/SpL4IyMhOWry6zV8TMemxNlwIvm
         j9Cmlg0jW8NuHr0b7k2rckn9ET+he9KiorER1ZD8GWUp+Czhw7pi9FQ+3OBHczsWyCJI
         zO7RfwhWCmNgdSXjarJTYKxIXw9/yMJ2uqSioyS3/u25Niincp/48ER3QhPyT2morzH3
         JL0A==
X-Forwarded-Encrypted: i=1; AJvYcCW4xBprO8vOgyMF3W6OkAKryj6gZ3hN2MV5AodhAIwxQYc3oyzu658jdnHSmJg3fCAImPVc8HAM9+SUkWMGjtgKCVSmn5Rc5wUa/RPPAlQq
X-Gm-Message-State: AOJu0YyjXXcj6D4A2qv2SYMBow1oqifO+4DglDeRNahp5G8ItfuytmFE
	tv/+faFwc1nMiIOXg4KVM+Zjiw3Fs0zCiSyihXgknC1HC5jomYVQiNVuKQZSbjg=
X-Google-Smtp-Source: AGHT+IEZTBakzY6PKzMTgs/zcMBONEtbNskqJbnRsI44xNlUKHaklyMLmZlZj49QTc7g7/a+/pPcjw==
X-Received: by 2002:a05:6a21:3381:b0:1a7:58ca:cdf3 with SMTP id yy1-20020a056a21338100b001a758cacdf3mr14872194pzb.8.1713200503358;
        Mon, 15 Apr 2024 10:01:43 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:01:42 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 03/20] PCI: Make pci_create_root_bus() declare its reliance on MSI domains
Date: Mon, 15 Apr 2024 22:30:56 +0530
Message-Id: <20240415170113.662318-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_100146_539139_A75C9D3C 
X-CRM114-Status: UNSURE (   9.18  )
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

Similar to commit 9ec37efb8783 ("PCI/MSI: Make
pci_host_common_probe() declare its reliance on MSI domains"), declare
this dependency for PCI probe in ACPI based flow.

This is required especially for RISC-V platforms where MSI controller
can be absent. However, setting this for all architectures seem to cause
issues on non RISC-V architectures [1]. Hence, enabled this only for
RISC-V.

[1] - https://lore.kernel.org/oe-lkp/202403041047.791cb18e-oliver.sang@intel.com

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/pci/probe.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 1325fbae2f28..e09915bee2ee 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3048,6 +3048,9 @@ struct pci_bus *pci_create_root_bus(struct device *parent, int bus,
 	bridge->sysdata = sysdata;
 	bridge->busnr = bus;
 	bridge->ops = ops;
+#ifdef CONFIG_RISCV
+	bridge->msi_domain = true;
+#endif
 
 	error = pci_register_host_bridge(bridge);
 	if (error < 0)
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
