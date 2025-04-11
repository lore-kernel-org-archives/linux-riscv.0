Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D25C369AE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 13:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZ+TytqYzXMfxIk4eGM4wGWgCW1aKC4RHNzeNa7N14A=; b=NfvcSfc0c8qpC1
	2rX64ZqcT0Y60UJQCC+piwjRiXyHJy7QT8BiDu3om7la342RJQscDBzpWpNKknTRS6WAqpxZEw5wV
	uWnzyZhQ+0P+KefadNxN0b4oNPEumBzUNRMgh791t53cjkZvjnnSolDp9FNn14E3XLVxZdAq8LEVR
	i537xvlaobPN2SNM4/HWwVBjftGAK5/aVZmS5Nxz3lWOY9MhcWx7OA1BdLPcxomnwhzFJxLwgidgG
	qBF7Qg0dnovMEjgE6+n0CPm4vd+7gGon8f7LR6kd5OhRoBSOBsAPd9oKgJeqZrxLbkiVWmlpJtO/t
	m8RpE1V4YxbWt6DGP4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ESI-0000000DvJc-0L6j;
	Fri, 11 Apr 2025 13:30:02 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EFK-0000000DsfL-3bjv
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 13:16:40 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-224171d6826so28169495ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 06:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377398; x=1744982198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63RGI1NwLEiYAeH/RFKeArdRDE2NQgX8WQsa8ntLKY4=;
        b=LIblWb5ZdKlcH/3bMrN5TnLzYKh9V1Gi0qond1IO1SdsPG9YzvoMxDT5f4xdU0JE58
         zuMpAE7jnvDosy5CtmKdXkpBmu9Nmdr4zzf3k3GOfl4FFmxNdxmwEI3QVj5uRb3iA4HY
         //7YPPAOJ6YYQECrEGYtBmywWDqr3lmhsmoYy1rFB9qEeWq2fvwedaTKa+/ElCWwGDri
         yuBG9DbpYHNcSkMu27Ie0+c0sIwJx0SQzExu1E8c+g8EE7a3s63Uyi2YAd6HCCuZEoSx
         UNuS6zXdLhsRPtQZwEbDYIWGRzNlZR9wOWpmccCNWKjHzXu7ANf4OVYdMQOjf9fKFjvI
         Aecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377398; x=1744982198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63RGI1NwLEiYAeH/RFKeArdRDE2NQgX8WQsa8ntLKY4=;
        b=pejbEdG7BvNad0U+9TI7g2XbElhvs9u5+lSYOQDkQ8CrwCTn1sU7o4f5kLxbRZAfEn
         jjGW0/ruf1+pVgXnxTCexQgSfGHxavrEg5ZVTdlYMmbqMkIDOGABvri5Nygrt004kOwa
         Xbay4QDyiFOgSJyioLhRDMMpbqVNatziJNH5bC5OVyiD8NKGnc0z+1UM0wYMaH2iEcuY
         Cd/sLe6EAbyb4qQ+03xKEIvYu//n2XK/vUlBNIp638YLDXNoKez4Mr6igl0L9Api1Gua
         luiP85pRS1eYaH8ruhAxENW/4+/2J3zaMOAU5VlvJggRjJkU6WkZzKzbVIIjQmYM0U+u
         JT0w==
X-Forwarded-Encrypted: i=1; AJvYcCV7ryZfg9JSSVmZsrSc3hGAPPAXgjSypCUN2tNNAXlTHBJjkEp+PecE9FzNt6q+wExwDr0SUoKdeK3KBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiqrE0dLIP7H28iAaPXw1luuKeM43/aM/GokI6zwVMug2wuhse
	RGOB3sLof8KWhgfKmK+xAozV87kqyDFgKuQsj3JozEw4MIXC5bFesaPc/eOe/FU=
X-Gm-Gg: ASbGncs0ObkbspKFNtvwxcrVHv2SlSjeFuzNzFo1fYMHHPzFY11pfOX587/Nz41eCs0
	TW1RoBdkzbMTdgE1j/AwmYcxpHif+mq66QkbrFkt/Tsrlh8lmIl9b//CHO//CXEUtoO9GoWXcH4
	MVhGcvsp5VluH8em0irnvbGT2ycDgqbPgrB99t6IkKERWag8fXirOUmh85ELIJIJeyiIOzledPi
	kVAJIbFqhqQhw8cvKji2XxD4qddUaz2aYzjfXIRSEooDkk2RspI8AV/AJ8O7Fd3kHccc6mDyI6k
	HdwXbcGcuA606o4d5IiF5MFr/rHbAZ8=
X-Google-Smtp-Source: AGHT+IGdBpii9FqwXTM5hJBzhslBNKfg5Cs2FGnvGr9Q17Wy0FzzwX5fnWry21A6oGkbvSxeOYahLg==
X-Received: by 2002:a17:902:db0d:b0:223:6180:1bf7 with SMTP id d9443c01a7336-22bea4ffb4cmr33239005ad.42.1744377398297;
        Fri, 11 Apr 2025 06:16:38 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:16:37 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 8/9] pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
Date: Fri, 11 Apr 2025 21:14:22 +0800
Message-ID: <20250411131423.3802611-9-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_061638_894571_FB5D7634 
X-CRM114-Status: GOOD (  11.30  )
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

The SpacemiT K1 SoC uses PWM_PXA driver.

Update the Kconfig file for the PWM_PXA driver to allow
the SpacemiT K1 SoC to use it.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/pwm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 4731d5b90d7e..6731669e724e 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -493,7 +493,7 @@ config PWM_PCA9685
 
 config PWM_PXA
 	tristate "PXA PWM support"
-	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
+	depends on ARCH_PXA || ARCH_MMP || ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  Generic PWM framework driver for PXA.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
