Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CE2E75421
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 04:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8ALQb8gowSA6XwxMHWc2umiMh1l0ZIPPwgXkuGdaTQ=; b=3CNwflGGX2f16A
	XZf83uvkkVJr/P8+8jF0VDymIUtJXHZZc6ox9g+8VmLjxEMiRIu6VKb6t584IOFY1sEoR6tk0/AS+
	wmL7qcAUw0fO58O4jeZZ08QLhxVge8IPPTwLy8H2UwbouyDW9kavs+fa2W0+bpThcpaQWO0sXajqJ
	WGnkaDzXFLTlqTTOfx/X9QvTsCaPC8hsEbcGyHW4F9nClQbdb7gY/pHxXp1YPp/a9Pd5q+DKsFFot
	OZmZ2kySG32o2GLMcZCR/7l4n44UmcW9KgCK2PSDLQWxjax/eRfkRIXR9uI3X597Dll4vkrsO+dtW
	SnXf6NyysPVB54IKTa/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXI3-00DoRT-1v;
	Tue, 03 Oct 2023 04:45:47 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXI0-00DoPl-31
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 04:45:46 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-69101d33315so383197b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 21:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696308344; x=1696913144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36mJhajWQppw1r4vewDK4hFKpILxPms9Bh84cWTmNnE=;
        b=RFazHBGg1nZ4jLMolA6fV0KKTCF1l2hp0bbd58a8rv5l0X6Imm+38cs3r1bhujsO8f
         /rqO+ABrNGMuK4nX7YnnDG/kH2LWkIyJ7RBla0T5uSW48ynPh3ibOiF0zf/XJhh0qx+3
         RaUznGPZ2HjnJkSqys5Dsr3hEeGA6WKyOgI0sjM0CTT206TX4S5KhjTfcRZjXDweHSgw
         f+z1qCIiJsWYYAjsnfPDLqB9rKClYUYdHMd22TpXBX7ugPx2YqZwUbRVHCnfe5QYuaEn
         tdQ2NRpa+7iFbhiSj64ZsfUVHJ8aDFzZBbV7JTP82gIua+V4HHH3u7SerzcjlNdnTYlN
         8Kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696308344; x=1696913144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36mJhajWQppw1r4vewDK4hFKpILxPms9Bh84cWTmNnE=;
        b=ErUfuELm4MMHrBItRiGDapLhAJbq4mFWRP2i/ivMIgW9HZ2DCQy5NNX87YK/VANvI8
         QHeJuZb2CzLqz3d+Ylp2Ln7EoqC0axw7WJYcffjsDq/4IBjVl+uhQJO+qF9Fpi9d3uPV
         oW13mx9OiAD7a4k17zNiFijpo9DSS24vcebeiYCc8uGpGt83edz6n4KmBFTcxnztth1M
         LUjVvGZPJoLItLuEZCCpsBxfrXfTiDJiU9QpKNPF5s7ktYsZIeOY9C6ma9N+TEYlXtoh
         6rvKS3r2CRHyd69cUjptbS7CmP1GxOJP3g8cSEGunETV1kZWqe+KORXvw0hpOwMs0j2z
         LVxA==
X-Gm-Message-State: AOJu0Yzy4xumicap/SiPzpz0dGuABAKDgOAapx6xx4sdfwZrG/E1jJNE
	5ue/XR5DfDpe2DWGLXHRNebnZQ==
X-Google-Smtp-Source: AGHT+IEPf6VZJFHiNyB06jIOgpeLIxIG7B35aAuu0113CgIcNf9v+plMLjwZEC9Lc1L+0gdLK8AvRw==
X-Received: by 2002:a05:6a20:3ca1:b0:160:643f:ad54 with SMTP id b33-20020a056a203ca100b00160643fad54mr13378897pzj.20.1696308344308;
        Mon, 02 Oct 2023 21:45:44 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.132])
        by smtp.gmail.com with ESMTPSA id h9-20020aa786c9000000b0068e49cb1692sm346421pfo.1.2023.10.02.21.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 21:45:43 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v10 14/15] RISC-V: Select APLIC and IMSIC drivers
Date: Tue,  3 Oct 2023 10:14:02 +0530
Message-Id: <20231003044403.1974628-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003044403.1974628-1-apatel@ventanamicro.com>
References: <20231003044403.1974628-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_214544_974116_9E603F67 
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The QEMU virt machine supports AIA emulation and we also have
quite a few RISC-V platforms with AIA support under development
so let us select APLIC and IMSIC drivers for all RISC-V platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d607ab0f7c6d..45c660f1219d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -153,6 +153,8 @@ config RISCV
 	select PCI_DOMAINS_GENERIC if PCI
 	select PCI_MSI if PCI
 	select RISCV_ALTERNATIVE if !XIP_KERNEL
+	select RISCV_APLIC
+	select RISCV_IMSIC
 	select RISCV_INTC
 	select RISCV_TIMER if RISCV_SBI
 	select SIFIVE_PLIC
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
