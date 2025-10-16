Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4408CCD193
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 00:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CVcf/M3G1hiJBs9SoEhwzHnJx9CqdaJ/N0tvdGuMQqo=; b=HNXcyRXKBLvAY4
	wqgNfxTXCRvwj937SaGOJd9MmxIk477S3vrMouurLZL+Y0Zppu8eZzBznaF1ijfPx/NFWUJKBcZaN
	RWOtLoaun4LgMQIFmXhGPW5szv/OOVMsbEBiePTofmgwIJC6OTl5KYGrAZrmRy7kOEOjA8mby5RQD
	AAajd4IASD5C0PkwWJlYaMLMKEegI/4hzfp3cX9SUbC53Z42GwV3MSIGdsjl6+1/Bjd7TQStoYKrA
	C645wY60Omr1s8LHYBhBoSjIV47Sfqi/kBgaf/Wiin0AaKlZuqpBBuMKHMwcK1Bcegw76zoD/++Mj
	+/f9terpqq9/leR0bZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Byt-000000039mz-0mij;
	Thu, 16 Oct 2025 00:36:35 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Byr-000000039mQ-0NCx
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 00:36:34 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-279e2554c8fso1560705ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 17:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760574992; x=1761179792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXt/D84/OJQisXQbO31kOLN3Cpr3xQX/Xq1KFsebzo8=;
        b=BIX3LsDWMaO6HTOU48uZWeV6IrAPWoPxZNP0lYXjiyU3Wb9IikKCvXA7serKpuS4J3
         bFCVZCvtUffYrWr1cFPBIxwZnhsOIVqXDuNxTnNPCRv9tB4RyPCz1zkELcNsTrsDvMgk
         lzsenVlbBhDH5ij1deaVp+vl0Lv6ErMszfjr8z0d/1l+G0kKEW7RQ1gNN+Cz2vJNV1Wq
         ceqC/98075hONtTSFcXlWcPEEt+M6WTZnQqN94ElH7P4tnpp4bsv1ngVJjAdqQ6Z3Bsc
         tipqlox2jQO/gqVpO10tWgZOQ75ddERj6V2PY4+ir0i8fsCQ+ktJT9I3D0D2dyRzhrJk
         Fbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760574992; x=1761179792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXt/D84/OJQisXQbO31kOLN3Cpr3xQX/Xq1KFsebzo8=;
        b=BS0YiAmgMCVR0Y6siwMZlxcBy020VnaB6w5bOHmr1zpNOjBSrJ+W41d9VZ1Acyp82M
         zq8OZqOpma1xYyarAH5sEkpvD3phXAJp992N4PA0oS8Ug0lyGo3wd31plcX2mU4NjoIm
         9B+z/ODlgcLoc7nDcvoERBXPMbwm1S1tUg12Dg4iAz8HEKrtYd3N71OceJE4nIuaz0PH
         +ZI54F3VLzxw+27EP4CN30xTVjV9ZaOR1rLhLp51uyNhp8w2fJ9BEbrJrAy/V9978q4F
         8dSllgNWFbpBcirkSGyRAYXnfbZ93wji5j0QaVri0/pOBGosynL9kGBbh7o9mUfT9Hy+
         4LWA==
X-Forwarded-Encrypted: i=1; AJvYcCVaitP545UoIQUutKs4A8vSWWQObKIamdS7NR9dpapq27aq95YKaBigB4hxvJNwOcABaTWq6AI3BBucjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx17QvyKLBzQeJWKtibegzso7EgeP2TnaBgvSInrXcpp65oMzzv
	NiYToa0RlswNW6yT+pe8+RXwsRvKwHT1lFKqzgEuPj2uqJsGpXklmNzihcMCXSWd8Q0=
X-Gm-Gg: ASbGncumffWYvn0i9RHs4EGaSszqUvhZsONJJxVCrJ3mNJ0WjS+9HeKS3ckhed0nGzg
	j4DLV0s9M5/xm0cyvwGiltL2496ECrOhYfGhX2K/7m5DiQCMFV9Tqahblynf8XopyiCUtz6LduQ
	ynX2H+AvXGSbd8Bf6n+ObnJxwXIkk2B79jHGORf7ine+1ZJytOEEo8IPVjNY50kjdlfnSZrJj4B
	5+5OGU5t/5mAj8SNKzV+gek4wZ3HuAWdnLc1n7RxCiVgGfD7CSE99ElG1B0ynwyEuQNCIADqyCK
	L/SX9eQWt2QPHOESu85dneGui5SOb5ZTvjXwnAfviayu252ZJZdurCXWGs8/1oFuhsn6hWkHXEI
	TdJnGGLOao+eHFVK1uGKszhOAqJolprNRIMFaOJjpHRqG8kswES6k+m4TwsCaKRPatyqnMI8mfU
	r7TtlEwgG3FP/MRPsRz2eX+A==
X-Google-Smtp-Source: AGHT+IGtW+n2FCn4fDdMcJPotohaS+nhnzdOOjJUzirVY10P+zkRGhCTeSBu1T0bO7J51NeGGnPfWw==
X-Received: by 2002:a17:902:f788:b0:28c:2db3:b9ab with SMTP id d9443c01a7336-2902725f2efmr434684235ad.26.1760574992292;
        Wed, 15 Oct 2025 17:36:32 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099aba4f5sm8780165ad.91.2025.10.15.17.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 17:36:32 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] gpio: sifive: Support module autoloading
Date: Wed, 15 Oct 2025 17:36:25 -0700
Message-ID: <20251016003631.3912523-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_173633_126219_F86BBD5F 
X-CRM114-Status: UNSURE (   8.41  )
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

Add MODULE_DEVICE_TABLE() so the driver module can be loaded
automatically based on a compatible string alias.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/gpio/gpio-sifive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 94ef2efbd14f..e9a992cd4b9c 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -260,6 +260,7 @@ static const struct of_device_id sifive_gpio_match[] = {
 	{ .compatible = "sifive,fu540-c000-gpio" },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sifive_gpio_match);
 
 static struct platform_driver sifive_gpio_driver = {
 	.probe		= sifive_gpio_probe,
-- 
2.47.2

base-commit: 5a6f65d1502551f84c158789e5d89299c78907c7
branch: up/gpio-autoload

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
