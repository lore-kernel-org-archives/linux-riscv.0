Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB7FCD37B1
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 23:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uKprjHcwtnzoxQkF2x8nhx3cPWDSdTZ0RuDjhNGUFBc=; b=wQgLaBe1lxpMNj
	hTUc24e8ot65h2NkPVcjDckQuk/Uz1VXTgSRDNAsZ6pPaSQWQkBLmQdUT2IAyt6XupGZSM/GN8fOO
	ERYMqcJS97FcxwvraVcJFF9WZp3B4BYRNjopg7kDzcVKmZh+hg8yAEq9I4bBUd4uDnOOReWrVQffi
	7YVU1pfQqW7/FNJ7tJorEAeiqOF3561J7Izi6ET8nCIprZXTr7SAiOUGzNcU18deoyXiPWSJ5yC4k
	hkXmHkKny1it96c5BNjEH5aJQze13ZWLN8/mFkj/jU3cOkgLcxZLqLDQRH1cjhysfb5LZNpzOAYqt
	fthPyUxfs6leSbPitiPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sld9O-00000002JNl-3EP5;
	Tue, 03 Sep 2024 23:41:30 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sld9L-00000002JMk-3ux0
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 23:41:29 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7141e20e31cso4844474b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Sep 2024 16:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725406887; x=1726011687; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8bYoZW+QQkfz32T7M8NYqTFSmzIgCZm1Z0RlhJ5J+EY=;
        b=ZaYYus+ho/KPg1vUsv48uAndPHXoGZYk6eO711exvDxZcHsqTZsZ0DhiMWVFsTS3pq
         OgmFq9x4+4DNCTeeEcRtUkfHU6XVkZKU3/xwZI4quiS0hEWNHi59WvQ5CH5hvcKxiOFp
         d1uG8gurTgMeUycGrF6MtgGOoSq0bH9diMxhcQINKKpfWYDGeCBnJ05TNEukvIyPmNPW
         ryvOZ77hGBkLlsU9vtmx7zDzL9mQo/G1wB+RERDjiNqa0BsGvt4YCyE5w9IBO6y4lanU
         WxqfKpgM2MxPFjRMKv0slbWxQ3BPlqRRvvJAipEZn1VL8gYYwsTyGf0syO+JeMbACYp9
         Qxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725406887; x=1726011687;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bYoZW+QQkfz32T7M8NYqTFSmzIgCZm1Z0RlhJ5J+EY=;
        b=JH7zsRdAP51JqZyt29fZDNtqxwVgymYTzy2KznGUE1e2gfXZM+x9fKfj9MpB50vn2X
         7ERehkTzPZs5nDwjYVhOGqDr0M5uy/voiVKFIFGVsx8cglMK0WzVkr7kwZDu0YF2Xkuv
         xpMxg1P85bz1hNos0uqtVrNAvkx2NFJwxgDMPCHyTHkFe4ALdgqBmqgqocT8RvLvspsc
         UxFYjnGM9poKZxl8IPFkbbGyRoUbrY4BnOhc2JMIksyAA5dVuFiX7rSFcZzYAw832KYr
         cX6XG9pjQaX3ZDPKgwhy4te6WTU+EeVkm7UAVbtZK/s+U2PMJXNKzSnwQfazB+Bx/phY
         yKow==
X-Forwarded-Encrypted: i=1; AJvYcCXVQU3LtAsy7wntT/cDfNuecFdd8KPZLO42/cHhS4P+Xip2KSOBXK+I2R8kURxCpZlHSgepNan1VDkzIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXAuDpjfqcGhRDfL9EAVLE61tmHR/wQIQFAU72xeq8FlW1SmfZ
	r77HxFZrDnazILWiEDuwZ3d3RXKk6GEYSweokSPPVAwcUSB/tZjBu63EtZuj00CA4X9WMlznvB5
	9
X-Google-Smtp-Source: AGHT+IH7ezt/NbLCrPaBllv4u0hUzRFiNnKEuctKhUStQwRWDmqE/m8sQIb/jU9irTsFdN2m8pF3NA==
X-Received: by 2002:a05:6a21:3115:b0:1cc:eb34:b1c0 with SMTP id adf61e73a8af0-1cecf5145b1mr15795533637.25.1725406886694;
        Tue, 03 Sep 2024 16:41:26 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea354b8sm3338325ad.143.2024.09.03.16.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 16:41:26 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 03 Sep 2024 16:36:19 -0700
Subject: [PATCH] irqchip/sifive-plic: Fix error codes
MIME-Version: 1.0
Message-Id: <20240903-correct_error_codes_sifive_plic-v1-1-d929b79663a2@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAHKd12YC/x3NQQrCMBBG4auUWRtIYhXiVUSCTP7ogDRlRkqh9
 O4NXX6b9zYyqMDoMWykWMSkTR3hMhB/39MHTko3RR9Hn/zVcVMF/zNUm2ZuBZZNqizI80/Yjfc
 Q6i3FFEqlXpkVVdbz8Hzt+wEkZsp0cQAAAA==
To: Thomas Gleixner <tglx@linutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Anup Patel <apatel@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Charlie Jenkins <charlie@rivosinc.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=NEqMSUiXPJnE6dN6HQOChucnRrDzOVn8LzJu3RmeZNg=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9r1eTNt3y1fsGdnbznPef/Ji2bcWeqpZj9Xz7rMaG94z
 4WgVnHPjlIWBjEOBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACai2cPwz2Cel5Lv9MSytD95
 j557Wc2M/b7t6+LyEztZM37xWhocPcXI8Cn27XwGfZbXtgIvdka56/tNiXgsrWefwK9yl63H7OY
 7bgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_164128_006843_251154B3 
X-CRM114-Status: GOOD (  10.71  )
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

Set error to -ENOMEM if kcalloc() fails or if irq_domain_add_linear()
fails inside of plic_probe().

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202409031122.yBh8HrxA-lkp@intel.com/
---
 drivers/irqchip/irq-sifive-plic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 2f6ef5c495bd..0b730e305748 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -626,8 +626,10 @@ static int plic_probe(struct fwnode_handle *fwnode)
 
 		handler->enable_save = kcalloc(DIV_ROUND_UP(nr_irqs, 32),
 					       sizeof(*handler->enable_save), GFP_KERNEL);
-		if (!handler->enable_save)
+		if (!handler->enable_save) {
+			error = -ENOMEM;
 			goto fail_cleanup_contexts;
+		}
 done:
 		for (hwirq = 1; hwirq <= nr_irqs; hwirq++) {
 			plic_toggle(handler, hwirq, 0);
@@ -639,8 +641,10 @@ static int plic_probe(struct fwnode_handle *fwnode)
 
 	priv->irqdomain = irq_domain_create_linear(fwnode, nr_irqs + 1,
 						   &plic_irqdomain_ops, priv);
-	if (WARN_ON(!priv->irqdomain))
+	if (WARN_ON(!priv->irqdomain)) {
+		error = -ENOMEM;
 		goto fail_cleanup_contexts;
+	}
 
 	/*
 	 * We can have multiple PLIC instances so setup global state

---
base-commit: 6804f0edbe7747774e6ae60f20cec4ee3ad7c187
change-id: 20240903-correct_error_codes_sifive_plic-4611f59291df
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
