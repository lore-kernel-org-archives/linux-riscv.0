Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37125C77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5fEuqYiMoUfhzB+Zfi44C2+7QMFNh30JeRpB94MB8Y=; b=WOOmWWi7dOEXog
	i41waWv5zqrdwK/l3ewBBE0TI1+gqjlzx7c8jOOYFY1/rfkyyFXq24TkvfL+PMAUwVqFl221f5aky
	ibrlGbsPrNWbHE8bG0ebyTpcnRBYnZAQsb02AqSulaEPVbY/qZhVDukSvkiVBoHLLJ5tGoC07K8jX
	/bB7SoiCd5I3f4uvLBywX8byN6CfEgaLBjeszAVcKbM7ygS4pTRcV0cHNhXApKXpf69M9tLOVwKRe
	xuCQ1ydKyFGdjbC5vzTRBBYapqkBAKjoeywsHee2Gqy0g7mtMCPz7UZAoXAHlP+ImBfNBCaay5Gxh
	jqpnwrwgETJTYj72CjJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR6l-00106C-1G;
	Mon, 15 May 2023 05:50:55 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR6i-00104W-38
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:50:54 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1addac3de73so25856925ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 22:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129852; x=1686721852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNB5noEZPasx/OngqcP7wy15OXtx85aYSDWecQ1qX3I=;
        b=crUKtBVQVJV1vWBpuccoTSp8DaYY66fm3VKniawcVP6BKqjaKB4T2BaZyNqDyNPU7n
         9YBY1TuYEPQIP65vBpgmiEENoR1RAcWrcdORTisds+fVFeKk4n6ot+7DHSQjWhfm42Ao
         dd8qhZ0hLmlYljm0LhvMRdBdV5496JPxOHUG3c+dIxD65S9A9Ryz9EyK68M3tzx/B0S9
         JBM/ZcwzO0eRD86zNvVnVbRkCTjmonAhCiFUSmyEaFJ7WoJ5cJ4XrULn3PiTm14zJR8u
         OtxancRacVKlprqQD+tHP/Lkv/v3J35sEnIy3t7ws0ik1FK+XOq34vdkAgHW6F3l3d2P
         kubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129852; x=1686721852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNB5noEZPasx/OngqcP7wy15OXtx85aYSDWecQ1qX3I=;
        b=AQJf8FP5YWm7pRIxCxCiyWmqCPC41ixWOtw0qF8UieH+Z7Qo5Y2n1KhmKH8xArELMB
         Ds9+m8kLM/GvuT+8r6YjJ4S8VBQra3sUqCtUiRPYBJrThKJ7zfEGe0h3/ldFW2Q4TZkz
         5jet2+QTbJqTGY8iR/0XEm5g685Vc/VR+3m3UXex2/9EoISZZcN1K71OfBqkUiyDODIR
         0LR4AoWKs6jyBDXoNtGR2TnkDdDHp6Iz6pbqM+odD46kIAqoGmLMoFP/qpZz52VrNc+3
         +44AvqCg4kzbz27lHlDIF563DYuJEALxac6UkL7qV5fhFVqwv9n30WY3OkcXsQmOZbwV
         +dEw==
X-Gm-Message-State: AC+VfDwhoODvQwdhGnEsh091HOynzsn+wQvgzwTHvuWeDs4rHnJRdYaI
	nCGcAhtsYfkdPZkjUtRYDj7sOg==
X-Google-Smtp-Source: ACHHUZ77ebtnzP9PEn9FZrDUXbQi5C1QdeX+0Vl8vrWcZZPVJfFbLqWE1kMFlDBKeV3SaPILOcDi3Q==
X-Received: by 2002:a17:902:b403:b0:1ac:8ad0:1703 with SMTP id x3-20020a170902b40300b001ac8ad01703mr21046473plr.35.1684129851850;
        Sun, 14 May 2023 22:50:51 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:50:51 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V6 11/21] RISC-V: smpboot: Create wrapper setup_smp()
Date: Mon, 15 May 2023 11:19:18 +0530
Message-Id: <20230515054928.2079268-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_225053_007560_04576D2F 
X-CRM114-Status: GOOD (  10.50  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

setup_smp() currently assumes DT-based platforms. To enable ACPI,
first make this a wrapper function and move existing code to
a separate DT-specific function.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/smpboot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 445a4efee267..a2e66126b733 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -70,7 +70,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	}
 }
 
-void __init setup_smp(void)
+static void __init of_parse_and_init_cpus(void)
 {
 	struct device_node *dn;
 	unsigned long hart;
@@ -116,6 +116,11 @@ void __init setup_smp(void)
 	}
 }
 
+void __init setup_smp(void)
+{
+	of_parse_and_init_cpus();
+}
+
 static int start_secondary_cpu(int cpu, struct task_struct *tidle)
 {
 	if (cpu_ops[cpu]->cpu_start)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
