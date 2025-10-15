Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FC2CCD185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 19:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ygyEh+kFpNSzh5z/U9oYR55r/clHJId6FjYojd3CF5w=; b=yosyjlYkeKZvHH
	BGJNx7r91CU4l03o2xCCowBcipdWuOpe3dcjUe7U1gYnWzz3nQsIirlCQAxjfnyXHWvIs+5f17kr3
	CCeqNjTouup8wLozyq8PoY6XBBuyuJqkXE/Y2C5HsolvlSzO3fwoGcj6URZ/ogoRFg5auRwam/8Xs
	iT9z+lmu4ZG6n6CioRQx6N8JB3y7RlgA5aWyI+qWJOZ4IMZE4mWEOhhU1dmsIh5NRnX52FxCeS8h9
	mA+bxV3Mt38ByDCmM8cVHXrRROHB0xi19oPEcbDlHFGUTV811Mn1kdEOGq/BvJIvNarC2B6ZvzgQ0
	NHz1oIHrfBv88b7PYdaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97cc-00000002nfr-0J9Y;
	Wed, 15 Oct 2025 19:57:18 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97cZ-00000002neX-2p0l
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 19:57:16 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7930132f59aso30496b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 12:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760558235; x=1761163035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VigWJ0s8yQhr+m/VwpfA3DOr5u41jNPv40KwlpsnDE4=;
        b=OnDoHWxpFZcI8BiV9GTEBQhiZw15wS56AVZBi0zb3GMhAoTE7Z22koCgXmlyu0N7TI
         cxhItVSfNPpJhZredR4xtpYrO+IA86Wrv/iLjwgPb9dZnNy3HxYojiG/OuduOLRvTvRc
         ApVXn0UNTjU5+q2BDH4uU3YjjTnpnHGse+RDFbbmnofzxTzB81coIapUGNDAsZNESjzE
         Mm/gtCpUiTB0sQMyo3+aawtrh6Azg2u/g04kiQUBc2xBE1kIWsys7yKo9bbY1/krXldC
         fOf4Xr1ckVDl7Oku0kXBPWK20oyjDvR6D5/lZ7V7jZwkF2K5pwCNVaKzLqSb0wTfRKCk
         5Qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760558235; x=1761163035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VigWJ0s8yQhr+m/VwpfA3DOr5u41jNPv40KwlpsnDE4=;
        b=Y2m/nm0UVCqYHzjRv1cwP8sWN1AqTpkO2/S9yKOndKyqrJTPNDH1kOu8mLa5iFi+VY
         cK1187anjv4m6qeSlfBXTYzLz9ow1mzUkcr1krXF+teL1CvZwwqPiNFmG/SzUaCEI2zk
         eHlpeeJe7h6hDEdlBvVQqgmwjvSGTmtbn4uD/7S9iLcNqB1O0UNDePq+a+xEKgHfwexk
         Uwt9XCvLu2beSTsRGxvbsiwj+aJiaX3IkqC82UUZ2ndLvnzYdTEJHIqptRBUrv/D3/vJ
         D2g2j5+f/w4zCKRuGlpku1RaxueapHyMo4GPg2wOKXUZ+au5S4F1p6imcMY0V7A+wIrj
         sbhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhf1sAnMnWsdw8tqUo9xm0VV7R8YThDxpTSnzpixMWvQavn0k4CZVE108N2uWvk1a3aD6MpXxGyTpxDg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6HxCCk9C454lM8f6IIN9/ZYUvGylPV8CyOxBvqHdgxwVCbqFi
	yWJNK+OLXhxHO9gxOojit71Ss9oq8dSClZ79r57OojsBtfrilevgEKD7SnK1Q8KNG+4=
X-Gm-Gg: ASbGncs72kOy9mryBNAVugMVdO9IpNzTPcBO2TSrIHPRIK7ASfO8PBdSpFQLJZ78HZs
	/fexNgpC5XFw+FfyksNPSd6j2MP3eV5Ixj74cnl+aCYNkamLwqZ3/BbwOifPBR1YMQqkxG9mhNV
	cEvOhyLmTw7M2zpQxKIkw5hSfKsQgyKZQip/dAgG+WwKpxGOoegLMJs9GCLMXAKKVCKF+C9rXg1
	/SSEQPlciLgSuEmLEbXR3R2SMkWhBUUeJGjbeZbxVmrpMjDneuGZ+ZPgaR2++HQoZMhGEZoKaa+
	UxUjgUT3ru74UmaGDJ/d43Pe6Vq8YvpZbdoDyAtsnHu7VXSPuvB3C87VY/L/hVT9XKVFI0kt/i9
	UYdb8nikZzbaYV2VYSrpKUIqd+4BCZqn+fwGxX49TWZ9c2nBWx9GdXIUz4eFVG3GbH+VbxP/3Hg
	==
X-Google-Smtp-Source: AGHT+IEyhAaC9z/YrPh8+QNDt58P5aYq0LIPPVePEvsYRW59ZLwjyZl10FeM552odxwsndFYq3etqg==
X-Received: by 2002:a05:6a00:3ccd:b0:771:fdd9:efa0 with SMTP id d2e1a72fcca58-7938723b3a3mr38560001b3a.15.1760558234951;
        Wed, 15 Oct 2025 12:57:14 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b06075fsm20151322b3a.17.2025.10.15.12.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:57:14 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 1/4] irqchip/riscv-imsic: Remove redundant irq_data lookups
Date: Wed, 15 Oct 2025 12:55:12 -0700
Message-ID: <20251015195712.3813004-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251015195712.3813004-1-samuel.holland@sifive.com>
References: <20251015195712.3813004-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_125715_708381_C3C51BC2 
X-CRM114-Status: GOOD (  11.82  )
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

imsic_irq_set_affinity() already takes the irq_data pointer as a
parameter, so it is pointless to look it up again from the IRQ number.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/irqchip/irq-riscv-imsic-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 643c8e459611..7228a33f6c37 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -158,11 +158,11 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		tmp_vec.local_id = new_vec->local_id;
 
 		/* Point device to the temporary vector */
-		imsic_msi_update_msg(irq_get_irq_data(d->irq), &tmp_vec);
+		imsic_msi_update_msg(d, &tmp_vec);
 	}
 
 	/* Point device to the new vector */
-	imsic_msi_update_msg(irq_get_irq_data(d->irq), new_vec);
+	imsic_msi_update_msg(d, new_vec);
 
 	/* Update irq descriptors with the new vector */
 	d->chip_data = new_vec;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
