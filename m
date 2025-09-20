Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BD3CAC5AE
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pEzQPBlj6jfxsoYlmMA1I41dgw9B6eId8yMYx9x0iY=; b=gakm4J7ruNfP/0
	AKl8XM6XcuOqBb3uK2rhBDb1Zn8GkzF/62LzA+Hi2kMMqetoAeFz8wlni5VMORwqrYa5NDl89cDzx
	31kRggpXfVh4n01wtcA64EGmhuA6xzgFdDxTXDktXC7yrMbDzwt/+/ZL+6hkc/PrOzHbMudeIC16F
	1BMaF3dnSKwl11CTW2Fr2UVo4GxDkz+rY3noZxJJbgDDsFLgtXU0oB7p8A/cvQx9r2IFRdjB2iBhd
	ylCje7SgJElTZlwl4P1wTFUztyRMZEvYX5An59lEr4CKFU/BB/Os0YyOej8oZVfVxZ/tgxhu4dCcQ
	krLosiJ+zcTeH60UKQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04Mc-00000005twE-2BR6;
	Sat, 20 Sep 2025 20:39:22 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MU-00000005teS-1pzP
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:15 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-887745ee814so105354739f.3
        for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400753; x=1759005553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lp5QAIgY+FjKQKHqRdWuauO9I56sIIxDetTr/Rl2SyY=;
        b=XWdrPjrdgF1MZv0ByT3YQ+pN3CCuVmYwz87vlebqIsFsib2L5THiiJAkdcfGvQfbF6
         ddqnm6XG0I+i+9rj1oTYxAJe+6dbdlZd+VujdfG0dmvRZcRyh8OfO63EhwsYXEgq763p
         iovKoy+PT0+58ByEj9hpt8qgefU5CIrXEbwyB14HgWyIR+S/z26iXqxoAhKq5ZpUbG4q
         7s0hXVEI8u+2v86coQdYb0nxN+5a/oA1ZBCBhme1s25wVJYss4VybheFGE6k2BleC56C
         y2uP9r8nJL1YzAY2NJw2/6ZSy7WzvuzUICi1letine7xp/DQQleXqdYcEsZcKUXka0Oq
         H4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400753; x=1759005553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lp5QAIgY+FjKQKHqRdWuauO9I56sIIxDetTr/Rl2SyY=;
        b=BDgYRI8B3zC80Svf/Ef3f3+s9yyJnetVyRkEt+u+rnZHUB6qXSR2gLfHy5zc/DXJ90
         1FI7gZrCLMnnImEAIEc4SB/HhLVs//Q+SSiQc2nP6oFzzOSceJDrYp3TI34m0lrfqtcL
         Rqgb6q9292UbrspjPGhy1xHxUAxhvJ7wXi1iLfGvi2OVAamIZ1jJzxI6ccQJHYWFGnNG
         qBAqUGccmcTFT8cYTVYZvaXTvi32nd5pKeWNsfzMfje07Jo6RuXMx3Z88YECylCzCLJv
         d5ShI6x2BuEtuyT9uGpeJ8AVeOrJJF6UElafNsXP5GS10L6C+w/gJJ+663A54Syf2rt0
         vkrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTpCLyzvhUnk0GdNH9e5juKG/b6Jzh0vo42iATnSc3ILYcwmuQsP6VcCQSnnh+lYOoCOE+bec4tx0tGw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpt1BBUCLyHfb+O9YJYGdZj8ZdGoMnUp9dBwfPxWd5AV13Lite
	9mQrYIAfU7DJZZQYPc7wsf3JBXsRN346csKXLipqNJ2hG3TCybtb3z5X+D3ASAL/OF4=
X-Gm-Gg: ASbGncuN+x556b6mTibDdJL/gjWIeShwtybApfRSzNVF7ksodglk1RG9dfBZTXPNO9t
	BxAddHze1/1jlOcMQp+eilihQlkifRWko9d7Z8Cih/RHkSo9da4UIpGzzkM31xeQdeGMvyt39QI
	pC3cn8FSHgzofjNlXOyggqRrCs6XcpJJHsphN0pp0eRI4ubpYZZtfL9U2TqOLEz1Rq55DYC6+ql
	L7u4RVAOEnvGpgOebtQeFHc+c0TUMYJud4BKXPFyocLltl8gX1Ee7kntMErfZpo3QLI7Tm0RCWu
	siNUjTAWt3Eavbo7S0ytNkIpdb/Q5pGxN8GaDhs8/RxjeEgKTYWNRKIb+XwbdZaBFG+Qrc4V0pq
	ejgSgHwDpu+UkR5TlUmUK5uWS426JRsjH0bA=
X-Google-Smtp-Source: AGHT+IEGRyXKIZhBuusMIimPhPuaP1RErmgLHhjZOiDaZM931WOu2VdkPLc6h5n6dwDp6Uc98U+7Ow==
X-Received: by 2002:a05:6e02:188d:b0:423:f924:c885 with SMTP id e9e14a558f8ab-42481938b95mr127031045ab.13.1758400753481;
        Sat, 20 Sep 2025 13:39:13 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-555a288f097sm699084173.44.2025.09.20.13.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:13 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com,
	zong.li@sifive.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr
Subject: [RFC PATCH v2 16/18] vfio: enable IOMMU_TYPE1 for RISC-V
Date: Sat, 20 Sep 2025 15:39:06 -0500
Message-ID: <20250920203851.2205115-36-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133914_540460_6981D48E 
X-CRM114-Status: GOOD (  10.16  )
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Enable VFIO support on RISC-V architecture.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/vfio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index ceae52fd7586..ad62205b4e45 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -39,7 +39,7 @@ config VFIO_GROUP
 
 config VFIO_CONTAINER
 	bool "Support for the VFIO container /dev/vfio/vfio"
-	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
+	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64 || RISCV)
 	depends on VFIO_GROUP
 	default y
 	help
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
