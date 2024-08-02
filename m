Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBFAC52D6D
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 07:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QUZUCb3loA80TaYH6H9LGcZ5ebz9TunV8YrAufOTvVs=; b=SQfAiKVlo16dkG
	pKB4RebV+j/hfcubF5kLUivhBNsm4XhwcqPxvGXhFOrYrr9SZqzWDMkcErl33Ze12+Xn3ebo5jUJd
	B1gs0EvahwDkRqDAl/K1wHAkrqHjMOd24/aQwd4MfSHClmslQBAlXhYUA6Df6ElvvXoGKMwnU9V1c
	tNqFEl0w4b+7iEBmCY6M1yvnm/ynSBfQttsTYRoNmnAMxJ7BpU/Qt7U7jbXMnZtUUKZh/3rj8nZ5A
	6WlSsZN5KjuZrXXwec88X41LZnclh05ee+tDJwOWPSndVuSMufrRd+J9iooNuuIAo+TZGJDr9Q9Xo
	TVBGldiimMFaSfqk7jfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZnAf-000000081ja-2gee;
	Fri, 02 Aug 2024 07:57:53 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZnAd-000000081j3-11gZ
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 07:57:52 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-26106ec9336so4329692fac.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 00:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1722585469; x=1723190269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DSk2SRb06KZUAv0d+mrcW9m53Z2saj4GCHKLYd5CkJM=;
        b=O7Y8yyf3sSX9f9hzjH+P9JzWQ0SoKtTk+rd8qHv+4J2VrZ3XNKYOOJSHcRFIlIq7QJ
         12hykjQ07UTpcjEyXoU3dh8eGTqz29Etk3rO/siSrcoB9IderQaVjCGEnNBqnjYNGi/X
         FZ/EAyk5S1/78hC6iG8/n2Gu1H6ewgYiwQqhGeo2twiLb/rBH8HBumZIdWLZsNGNJPO3
         chkTjRTunPKXj3hMUqnPgURQPtzcFi60AUT17GlXPXjd1tpmMJ+wR7vLwt3khKnqHjiu
         oGpErW0yIU/TF13JgwsjCQ+++Qhx1dfKuukvF3idzn9ahjl1wwD/tU0vIhvMtRurT4ZJ
         Go/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722585469; x=1723190269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSk2SRb06KZUAv0d+mrcW9m53Z2saj4GCHKLYd5CkJM=;
        b=NHDgMOfhRXbdlF+DhNcyJkKEHI3Ovof+aZUyj0SJei3MM7FRS+ScqeWGxZvsa9I8iM
         0Q2nLBEjD7Y4bY065k4byFRj5JT/b1ydd/lQhdmDPp2gEIsJD3Mw0hpktfxM6YThGL8T
         iP48hDhUD7hHO0sjGw925/Rp3/lUkdFqP5vNeQcwmVi5EVT2S/OvyUKd24VV+lz9j0TF
         cN0gd6535L4xdx6RgXgEIpO082/JPTo5Kb8MDOzt6Dw1AMOq+dX5LupKg7fHGX5Ue6xB
         Skw++ISlB3romJBS4ksauYO22h4NC4yNYuz+6jwDlHmkv1DoeOwZx2izauE5RFFWGn9P
         rJXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpaAQpd2zUR/3DaMdNsLgzjB9xTYOAOUPqeq4RRdAbrdnkMboU5VPMGYXkV7TajmA8EfbNbgn//pC9xdvZUBLot4xewswIFoKKRB2wUbqc
X-Gm-Message-State: AOJu0Yz18PLZdZeUwcc3eCpMeISdRWHfTz/YlyDCtcQHkRgqs9O1gTXQ
	B/+dLLmc+50WJBXPOmV/pbM61ylywx1UOUAjMAb7HT/SrrlGliW6otyenznf2rA=
X-Google-Smtp-Source: AGHT+IHt3LTQ4erd6SES1d05LGiiptuVS1mFE1tdYsly2nwg/Kfko1wMAuTecScTfUxFzVbUZAIqpA==
X-Received: by 2002:a05:6870:9a23:b0:261:1cd4:cd9b with SMTP id 586e51a60fabf-26891af6e71mr2621695fac.17.1722585468686;
        Fri, 02 Aug 2024 00:57:48 -0700 (PDT)
Received: from Vincent-X1Extreme-TW.. (2001-b400-e3d0-aff4-6515-fef1-f4cc-f5cd.emome-ip6.hinet.net. [2001:b400:e3d0:aff4:6515:fef1:f4cc:f5cd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ecfc471sm886279b3a.165.2024.08.02.00.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 00:57:48 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: anup@brainfault.org,
	tglx@linutronix.de
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	vincent.chen@sifive.com
Subject: [PATCH] irqchip: let the probe of APLIC be earlier than IMSIC
Date: Fri,  2 Aug 2024 15:57:41 +0800
Message-Id: <20240802075741.316968-1-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_005751_322290_53BA04A8 
X-CRM114-Status: GOOD (  12.54  )
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

When the debug message of driver/base/dd.c is enabled, the following
error messages are present in the boot log:

[    0.207941] platform d000000.aplic: error -EPROBE_DEFER: supplier
28000000.imsics not ready
[    0.208115] platform d000000.aplic: Added to deferred list

The reason for this error message is that the probe of APLIC is executed
earlier than IMSIC. This error also causes all the platform devices
connected to the APLIC to be added to the deferred list. Because both
APLIC and IMSIC are registered by device_initcall, this patch adjusts the
compile order of APLIC and IMSIC to ensure that the probe of IMSIC is
executed earlier than the probe of APLIC.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 drivers/irqchip/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 15635812b2d6..3c09666569d6 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -96,9 +96,9 @@ obj-$(CONFIG_QCOM_MPM)			+= irq-qcom-mpm.o
 obj-$(CONFIG_CSKY_MPINTC)		+= irq-csky-mpintc.o
 obj-$(CONFIG_CSKY_APB_INTC)		+= irq-csky-apb-intc.o
 obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
+obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
 obj-$(CONFIG_RISCV_APLIC)		+= irq-riscv-aplic-main.o irq-riscv-aplic-direct.o
 obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
-obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
 obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
 obj-$(CONFIG_STARFIVE_JH8100_INTC)	+= irq-starfive-jh8100-intc.o
 obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
