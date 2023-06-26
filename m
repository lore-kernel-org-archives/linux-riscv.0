Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB72EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 17:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=86h3AUlr1E6P38Besvu32gxLRk7V72fGwCympfi9NZg=; b=VLikeovSBd0XmO
	clIgJMnC2kx5fc0yb32pryypDyhaU0pPXSaOUValpAdUlihSrffIL8OCwgOjjFWnbUsV7TschNHGA
	vESSMVYBehIlya/HyZcG7XUVBMNC+NqVSh2AZrRMou1+xF1KUW6FbCN8b3I40SJgVHDAkPzKal8Dn
	WJqS7sJWpdKI4r/egvzerlDXpBJMGNxksjIhHsYpUpU9vxuDX7nNSAyH4+dKt+NMY3ye+T7eX+5fb
	fy4VMvoBppvdJcv4GYFtQDRrt4FSQG+F6Yk0Edshi/eTEjT5W8MZziFfK2w/Npzk5cL7+OIwGrl9Y
	HhY4BDBedrNdu+vJQSpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDpyj-00Akil-19;
	Mon, 26 Jun 2023 17:26:17 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDpyg-00AkiF-0E
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 17:26:15 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-34207e81c98so20209785ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 10:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687800372; x=1690392372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jAa9/qyqoIOUnYhC99LNfoissbeamAdrpMuCz28sW8s=;
        b=H7zijVZ9COkKnC8EPRrq0SG3bgmwwD4JD/ym7AGril6FAWmKwYPiTnmRm+uTCXiYrV
         3Cnd/INrDqhDJQToc37RsQd2bw0lUmbz+L+2LIur1mo3m0/akE1hqdtuxAyNSTPgqyD6
         Vyh/o6lP7U5Hh0EVqcqKGizcYaT9V4qIO6tg06VvRIMpBBaEYlQwLXZfbjOGfAteYyuG
         imlXyaxx5bK9XHbXUYCPhZsaXZri/2yMPFRMyTbKAjTGKAY4H5H5Y15qjeILlxgzn4fD
         3QpHy9j4aDe8fF+A+ja630+GEGHBJ7Svrc4nFrTZ3ZM+Fk8bmf+kVQjFHeNEtDpFG41H
         ViFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687800372; x=1690392372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAa9/qyqoIOUnYhC99LNfoissbeamAdrpMuCz28sW8s=;
        b=brIhZ0CelKq22/8u6x32SmfXnRvMZlA8LDEnOeirVAzefiSfMhxoyYkOA7+oniQcq0
         O6JzAu2upTTwNOvmi2xCOjLsGcycz7k8kbEu8d9lKJxWWpuHTQj8jjZ3lpllr+PKqxIJ
         xLyCwcEETVB1QqlTnwSNi7DwRtaYKBpXHrWGDTKSED/vztZmziB/HUWl+pbMIT2Kv/O5
         A8Hz0zXBTkCdSr5GAg7L/eAWRXh4xFU3GcVkt82vjpgW2Fd/7PZBiuPaVR6+uXd7Ynmd
         uqbfZ4q2zsq7SkUqNwhvwCUtHeoIuVQXoheFssOc+ncHQU9hiRbpr94VhptrMOSqxuce
         ttOA==
X-Gm-Message-State: AC+VfDwm0xsQ20oG728RHapu5+4MSi3FYD/ReUS1mbRvMLJrGySn31lN
	y932tFICtqAwoxrQhheJ6Fme/g==
X-Google-Smtp-Source: ACHHUZ6RhZwQfHzkxUhFwFFWIzRQlw5p95P6F2U2d7QYXTJkZAt/nhSYpUch6hK1aPN88nc7hZ+DmQ==
X-Received: by 2002:a92:d30e:0:b0:340:72d1:69a with SMTP id x14-20020a92d30e000000b0034072d1069amr31425660ila.28.1687800372473;
        Mon, 26 Jun 2023 10:26:12 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id u15-20020aa7838f000000b0066a6059d399sm4026648pfm.116.2023.06.26.10.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 10:26:11 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] gpio: sifive: Support IRQ wake
Date: Mon, 26 Jun 2023 10:26:08 -0700
Message-Id: <20230626172608.2978505-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_102614_175022_23DAE838 
X-CRM114-Status: UNSURE (   8.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Each pin drives a separate interrupt in the parent IRQ domain, so there
is no need to set IRQCHIP_MASK_ON_SUSPEND.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/gpio/gpio-sifive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 98939cd4a71e..c2653313f3a2 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -150,6 +150,7 @@ static const struct irq_chip sifive_gpio_irqchip = {
 	.irq_disable	= sifive_gpio_irq_disable,
 	.irq_eoi	= sifive_gpio_irq_eoi,
 	.irq_set_affinity = sifive_gpio_irq_set_affinity,
+	.irq_set_wake	= irq_chip_set_wake_parent,
 	.flags		= IRQCHIP_IMMUTABLE,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
