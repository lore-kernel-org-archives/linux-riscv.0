Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A884C5478C
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 04:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rvGsSyyfVLJXq0PSV0pfx58L/I5MvTmVYSRVRx5ACoI=; b=4BA4tAG+KGDbM+
	9CBVA+WjNy3j+gogqulVkgOozaAxP0En4IE0a0SvX36jACdrwUJdWvCtVFJF8de7gwijRXenXWk1+
	33f9cy+xUkoa+X5hgbwp2jUz4KxT4aBsFluJiNScARLqNSdid7VrOWScAqg7Yvq+VcXYTENldlM12
	ww33zx4s/P1QsYmKD9+QKWV9ndiD7Ua61Fie1Ve8Z9nY59k22f/ppzcE1DHuBwkAR2MI8DU97VptN
	ObQey5U1R73x0Iw8TlFheZMPkwWTrN6V0inJkXqWk3xV7Ih13D+qlXb7s14KhGCoeMXB61JiP7p2W
	ndaFdsOeeExpbX7qHVJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reSIs-0000000GNPr-0Umw;
	Mon, 26 Feb 2024 04:09:22 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reSIe-0000000GNHl-3SDH
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 04:09:10 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6da9c834646so2723712b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 Feb 2024 20:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708920547; x=1709525347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5v94DxHTEIb3n5F/F4oKqeNpt9RHfDtfleNBZBAcsM=;
        b=dltHLOmaC246x5g5DxHENYqf6Yu18rBtdcNxp+E4pLwUAduUS0Wpa8Uj01xhfjNEVo
         yOd7BvmR1V3rT6D7rhywObzZj96lqXnfr0BJ7fEdCb85uMr8siWLsIhgnSD15e7tGlcp
         GQVvzEcM3INHJOMFb0SsVQub3OrvsEoWBVD16sSslUVNgBNQSH41ihgjUiSALXVoQE9/
         3gCiRC+v9D6T1HDR2MHlrCaW2hNDvUD8R9g0b8J4vhwP9Gu/Rj8mcIFX048zi23GTqo2
         6wBQfubOG8/6kECMOmTS3l2ydClvtODh9QkgnTNWLrynzpOrUMWuSJ2T11dnW0XMzeoL
         QTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708920547; x=1709525347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5v94DxHTEIb3n5F/F4oKqeNpt9RHfDtfleNBZBAcsM=;
        b=fd2C2DO+T2oUAnfr5nE8FopKr4k8BqGLr73arRJYornTbqZZCRxOfKTtXF5+DBNoHA
         U2/bz0jpqw+KJHYDA/qWFXdhoHt0mrQq6pzGK18VKUjQ2Ghist5QuewryKAISXToQZ+Q
         +MFPbbREmnRou7Dq4MWjv1xfxm6Q+2U7C282VDQDEi732+swowkRbBVVyqHj1WSnwYe8
         ZLlQw3fyeHvNYwcNQlYhpYS1O6abKwk8ZeDO+56w92pJlqznWXnpdXXjCU9LCFDk+aeB
         4+sIcPSGibwYg+oUqjXHSzvqzM56F5Yr5zC88O2gcEajQpIJxVz3leA2v4J3I28FZi0+
         +x6A==
X-Forwarded-Encrypted: i=1; AJvYcCWoRImTtNDkWSHtzRPoQVHBDwKiMPQWmJgxIwpK9g4w+hx4Xg98jtnibagYRIO8wD5Y2bgkTC8dm03O12iX6OP67HyBXQ7MU2jr1jqFN6Zd
X-Gm-Message-State: AOJu0Yz92VxmkiPwsBe2P3iTtdeA9+Pr0pq5RsHUOCJfhECTJOFfBS2Y
	Dybc2MwgCopNoW87K5C2bPUxCDHKf3FjGwUNldY1+D1+QEScaQt9K1+8TFRcd8g=
X-Google-Smtp-Source: AGHT+IEDPxbGJSvrlZ93JjP4+EdbzDDtWpP2MPh5tJ8fgAQjYG+gZtkJ/x/LoQqtZ7r8SgdKF1ybmQ==
X-Received: by 2002:a05:6a21:2d0b:b0:1a0:e59d:1dc4 with SMTP id tw11-20020a056a212d0b00b001a0e59d1dc4mr11149308pzb.11.1708920546850;
        Sun, 25 Feb 2024 20:09:06 -0800 (PST)
Received: from localhost.localdomain ([171.76.86.62])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902654b00b001dc6f7e794dsm3023258pln.16.2024.02.25.20.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 20:09:06 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v15 01/10] irqchip/riscv-intc: Fix low-level interrupt handler setup for AIA
Date: Mon, 26 Feb 2024 09:37:37 +0530
Message-Id: <20240226040746.1396416-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226040746.1396416-1-apatel@ventanamicro.com>
References: <20240226040746.1396416-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_200908_893881_8823CB80 
X-CRM114-Status: GOOD (  11.27  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Use riscv_intc_aia_irq() as the low-level interrupt handler and print
"using AIA" in the INTC boot banner when AIA is available.

Fixes: c1be2ae5987a ("irqchip/riscv-intc: Add support for RISC-V AIA")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index cccb65339982..f87aeab460eb 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -183,7 +183,10 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn, struct irq_ch
 		return -ENXIO;
 	}
 
-	rc = set_handle_irq(&riscv_intc_irq);
+	if (riscv_isa_extension_available(NULL, SxAIA))
+		rc = set_handle_irq(&riscv_intc_aia_irq);
+	else
+		rc = set_handle_irq(&riscv_intc_irq);
 	if (rc) {
 		pr_err("failed to set irq handler\n");
 		return rc;
@@ -191,8 +194,9 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn, struct irq_ch
 
 	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
 
-	pr_info("%d local interrupts mapped\n",
-		riscv_isa_extension_available(NULL, SxAIA) ? 64 : riscv_intc_nr_irqs);
+	pr_info("%d local interrupts mapped%s\n",
+		riscv_isa_extension_available(NULL, SxAIA) ? 64 : riscv_intc_nr_irqs,
+		riscv_isa_extension_available(NULL, SxAIA) ? " using AIA" : "");
 	if (riscv_intc_custom_nr_irqs)
 		pr_info("%d custom local interrupts mapped\n", riscv_intc_custom_nr_irqs);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
