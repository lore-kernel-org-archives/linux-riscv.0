Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D621FC77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 11:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xur3oikoASDXDO2x+zWTtL922E9GRtyItPWehrTqM7A=; b=HyO834dGGK1MO+
	bfk/P3PLyMoPZHSXYQ2AAihJw2hBOPn15MIraOVcJw9YXLCJuKMSZfbZBW1cT1zt2ZPHWcKbnl4CI
	ZHs+ODX13sW6r+oMditeoLrRXw7GsHxkS1I2d7D4hlz4gGZUAqx6Wj1vUOjaSw8yYXUJA88MOQNsX
	5d94PEHyONpnC2k2Qo7jAdTgvqcgl/dE+DVCwK1WG7v1+njQ5nIMhW45wHE2mZh2UjOMIbS0PTMJ8
	11mKdH55gTHCcVscljNQ5BW2vXVOcZDpS+anJQysXfIGn/tD/AZcwI6sEbGd9TcpWUgtLQ7bndhSJ
	CPi6kP9aPg9OzM7nMs0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzT0-000Spx-0s;
	Mon, 08 May 2023 11:55:46 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzSy-000SoS-0o
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 11:55:45 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-51b661097bfso3061229a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 04:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546941; x=1686138941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38k1Pzb7K1cfn0j2an7l+ypiTAB8VfWPvQzIb1c40CU=;
        b=PChmFsn3jZ8YIN6et/HE2FT9KTKcn+85yUyr9DAN37WxMFW8+DniecytVJXMB+E4Yt
         cwg8NffeENFCvkKnaWixs6tUyDd3Pe6n2aLn4UIePpKETvgDRw/tKZj+YWWWcT4mL8PX
         tYib/TSvHrN7Ey/NaA2sBIl3ZhsF/OALW01VQPmUVWr5lFOnvHHzhr8ONcBU4wdYDXUM
         2glikRs238NvoLM/xUbz0Xj6aUVZA+JwoGLMj1OClPKRSjyvFoYHdvDFP9z9Wm3UBUso
         nG8WFplmCxjrRVNpFWVJOLFxXe7WeRsIP9yzHVTVBjY97ncMG5iq4wNUkEILfoLw9j50
         tEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546941; x=1686138941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38k1Pzb7K1cfn0j2an7l+ypiTAB8VfWPvQzIb1c40CU=;
        b=E80ceZBVA6NY0KQWwrlXkT219RuT6Rjn0mmuar4hObAeVDj4cKuSBw646EiQMuAR0l
         vVqU/w1OpLmx0Y1AAvXW9gejvHhF2xD+xB9LWTT8ZmhNmcY4VUkVDMyZdjHlLm75MkMf
         wB6F2ANOSer2NSBcI9Nq61cuEdr9aNFCz0+5HFgUq45TkfbsIoJTqHK4rtOaFM0bry/T
         1ERTmbqsX2lHr/nf2yvBkfkfl2tHFhVW//fO96aA5lKD9LgAL5UYEtzEzdPq3utSl3D4
         uGqTlF49ImSEuJbuxLyAjUiXiPFC16V1TQ/mv5DH228RjthC3zjIU+tl/oUunso+TtzQ
         iztw==
X-Gm-Message-State: AC+VfDwBuUqbn34ck7XPNk/8y0NfpMfKmTw3BrJrddj5WjywvB5RVkBv
	RChnI2xncGhIsPP+gS16fpULUQ==
X-Google-Smtp-Source: ACHHUZ6zMo1/GVdCMuvw4uqUNbB5el8P538gaRe9zZQmHaDTlvRjtiHbiNIa2a1kNbjX1A6CxKl+VA==
X-Received: by 2002:a17:902:8c96:b0:1a9:631b:7d68 with SMTP id t22-20020a1709028c9600b001a9631b7d68mr8947702plo.8.1683546941248;
        Mon, 08 May 2023 04:55:41 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:55:40 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V5 20/21] RISC-V: Enable ACPI in defconfig
Date: Mon,  8 May 2023 17:22:36 +0530
Message-Id: <20230508115237.216337-21-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_045544_287914_0D65E9AE 
X-CRM114-Status: UNSURE (   7.86  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Conor Dooley <conor.dooley@microchip.com>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add support to build ACPI subsystem in defconfig.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index d98d6e90b2b8..d3d1fbf2dd5f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -37,6 +37,7 @@ CONFIG_PM=y
 CONFIG_CPU_IDLE=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
+CONFIG_ACPI=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
