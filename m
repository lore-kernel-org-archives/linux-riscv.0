Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE23C5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 06:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dABr5VYJwcAf8A8xr/ySDW1mlW8NG1ZNJkOXG83GPBU=; b=NsbGJjALFNLKAy
	F+97wreygwBif1DfKM2oMFdJnJF4JiSEgcniylC4jwLaams3qTaLE8thfz+vBhV6AtVTjAoFJoAUu
	MXImKg0oeHtHmkR2IzcYkB+uihGPZ3HnOXI4/CauY3S/SB8euuiT/9OcSkDtXhMaFst47RbHy0kpj
	B9FHgBCqctHv9TLEdl+EcIGRuO62mmSYgw9gxPAC6mdHUEntJ4NbOoE5Ui1DGttpYFpZLHuey8boj
	2j/bRx81Sh/QlwwF3L+SZ5MUmPqaHIQjgGs+RC8hssv11mQBpoVB6H0G0nkZ7O/LPRUOlN0wSKKV5
	Qs/YzcwksXDUM9z4gWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJKg-0000000DJJX-1ZPF;
	Tue, 20 Feb 2024 06:10:22 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJJJ-0000000DIMM-3Fcp
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 06:09:02 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d953fa3286so31767225ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 22:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708409337; x=1709014137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKr4R3ReoTivFHMhBAg5uu2FBun4VRRnzFiPnpPYZRY=;
        b=FNs/1UOvOH9MoxlBP6s5fb/bE7A81DiNXEjPPh5TsGGcnKjevGWIvcCjtFvOt6uos/
         yhyK07OCgV+K5ylOX6MIzrOGMX/teANowLp3YdIPKRraFhk4ITtwOiyLuWcXgvppVV5c
         qMwoBtP0nwLRvCKUQMoHSShwOR9xeLpfJq4+5wTjzbXmbC+hOd5oVMOoC7QJWUNeMT3l
         da6v2xUQBuNj4DnJfJN+rA+kBPUuFLGxTrNphB9eQQJDexQx0XnZc9A8qoBTkZDyQfAx
         Noxhh5gdX0+PNZLRr8RbQXcOUGlN+LUXMsEGkBe/GpRDprCI+Vq1LZoeY732P5jebzPU
         XHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708409337; x=1709014137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKr4R3ReoTivFHMhBAg5uu2FBun4VRRnzFiPnpPYZRY=;
        b=svyJjEuExYpCtWukRwQaZ3cyelCgwYOw/jIa8ene54bvzayrPq3MRVUC7Jh69LCo7M
         NOvcvTOsDBAKQ5WJzSAmTLEpTzwIR9fZEnEw70nF4ECCnGzgvck+9EBd29L7oioW39MI
         B55aqF+T5opKRFvogxWX3Hb3MivnhsKVd+mjk1MerYrdW/qjdlIkdJ43iBLL+RQjYvfL
         X8D25NBhIAO5J1aF70j3OniFnJOQJRxOzpQ79hqPpA0diCZ3BgKfneJs2pZuCuY8iEtL
         31Iuqf4fWJgVKIjTe8aJlFy5UibxtClvWe5k8vtfNNu3UjcxsY05EFEMqPa6Sj5wELFZ
         N+mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBKzBjiv9j/fsUfu54P2yKZyDcdYE5t+Cu8jespDCP0dAoVjdAHIgYXj7z0VPxa9bpk16uMp1jgRDvkfqPbzSvsCizTKawcG/c6Q73wbV/
X-Gm-Message-State: AOJu0YyqjW595/qJk47DCnq7AMpI0h7iCRFjR/A+ZSIDKQKwh9StpwMh
	gq3TyH7nKIillUliFANOEYCWtP41Y2YrMY3SMoITQo5qzk0oUoiGzRkfhz0CMCY=
X-Google-Smtp-Source: AGHT+IFb9Bfg8TcznAeX4miXen9vY/PhmLFqArIgBS7TcN4jBtbB9IX0woMxS1qzebtfhfM8laVDAw==
X-Received: by 2002:a17:902:ec89:b0:1db:aa46:4923 with SMTP id x9-20020a170902ec8900b001dbaa464923mr13179616plg.40.1708409337095;
        Mon, 19 Feb 2024 22:08:57 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.86])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090276c600b001db4c89aea5sm5368114plt.158.2024.02.19.22.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 22:08:56 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v13 12/13] RISC-V: Select APLIC and IMSIC drivers
Date: Tue, 20 Feb 2024 11:37:17 +0530
Message-Id: <20240220060718.823229-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220060718.823229-1-apatel@ventanamicro.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_220858_067377_C032CB21 
X-CRM114-Status: UNSURE (   9.43  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
index bffbd869a068..569f2b6fd60a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -162,6 +162,8 @@ config RISCV
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
