Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44894D59F5A
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 17:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y8hZfpDmkCUTIxgOlzVTl8pgb1kJxfJhGL6S21wrX3U=; b=kdDhHHqbTHI4pL
	2PTj87qW99dLZYdl/A1lbgp6X/sdTWQjoUX53OsGB1ZS+Zh1+bbxdOu1gmxkzZZ3X6V6AWFW1fWv8
	ciQ2KZA6CCtIZZWomYQugb2Iyc1AiJEhQ96Jj/wCUs0MCpdqNilieQEkYqDxffwh6J8cR8LYEAmq/
	RXxoSYZ47LspifRGLUnLgiCZiOsvC7ni4ZTsifHaIFKCC+7LfDMTmwiBhZtopMR4NdS3BN1uIUBIi
	stW2UMK5vXjP85ZnSUZOTrFeQP16m+xqHq5wXOmZMPoiXOQtVSY2C5xfPWquEz7YkhV65SskW1vZE
	mS0hUIpL6N9qHoZzkM0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kCW-00000004FPb-3ZXw;
	Wed, 06 Nov 2024 17:52:16 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kBP-00000004F4r-17g4
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 17:51:08 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5ced377447bso3830a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Nov 2024 09:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1730915464; x=1731520264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XVcjUYi+p2tO+HyWvtxM4cA353hNsNdE371FkKVPyL4=;
        b=CIuVh0IQ5ls0J3FiowezkOYbkAer1j33kNLfgH0JrfuwgpXJF2HOp04AL+mtA6e2Yb
         27t2CMoZVp9h/U2NrXv5jdXtACULYBHWFYxErxWybEOVo9pQkvqk8n1vKa7Gma3u4a37
         YXUF4ZObbzwjRoEa4RuFhqU0B3Xk1qNyL+PGSafamkhogGe3Oi+qSFaveowC7pNQ4its
         qW+J7JHlCKZEolbqF+UfIUd2qxBVyRJ87nyiwTGz2ObI//ALZElpU1SECH0xgATnzvMU
         f6pzjCrplpaT3Jvgtiv+zAEch2PC/t9CaWy8V3l4ZCqfWUwkUsPv3usJJkTCBp7wPiaE
         NNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730915464; x=1731520264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVcjUYi+p2tO+HyWvtxM4cA353hNsNdE371FkKVPyL4=;
        b=o5rAKaIX1hl25KiPj6az2eWIyOzECT9fWpL0w2jCz8YymgcH5FDLaVmLgfZbqQW3en
         JZ2YhBJIUjG/yP0d7mN39iFWwx3VAXuwi5YKTfgi44L7q6eTS2VAyMQ7ZOs9DAq0DUae
         jpR3QQkxlLB4/k5Kp1BpQt4FO0ZY6JmdmsfuQ/NFUZsj2czKPxco9PGd5DKyKUVkZsFo
         YVGU0mwOL39O8pRZOeQ4J8rbyV76X/R5v5ERJ3sU1qU7OQHq2CQxO4QPx9LHjIunrUhH
         K0mrcqkjwjxj0CLn/j+38CwmyfGx47um8p4DfagiPafdTgOZm3sg/F53PxQwvpXYCan5
         Vz8w==
X-Forwarded-Encrypted: i=1; AJvYcCWLkOFyf8xx82nCilG0SvKfCrNDY+6Ly/En673tOwJ2xXXT0FifHB0/m93qrdQ4p3njkzPrHIoMqvUjkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZjYN5jXkXpXuZPUpx9jqNFGr/60X4wg5VZmuaKUOP/NdahEsk
	iD9AUEFaHC4hIn/+9se0fXjsfDsRLLcL/dCzpCbayAWWpX61A2RgJ5p/sgDNjWw=
X-Google-Smtp-Source: AGHT+IHXfsJQTYy5HHptGM/9osFkvYFJQ5HtzeFTl1ShVaweHG9C+gB1ii3r1lKuqPbvrPZMSrlCpQ==
X-Received: by 2002:a05:6402:510e:b0:5c2:439d:90d4 with SMTP id 4fb4d7f45d1cf-5cd54af9db7mr20651491a12.30.1730915464436;
        Wed, 06 Nov 2024 09:51:04 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6b0fc63sm3075873a12.83.2024.11.06.09.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 09:51:03 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH 0/2] iommu/riscv: Add platform msi support
Date: Wed,  6 Nov 2024 18:51:03 +0100
Message-ID: <20241106175102.219923-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_095107_326487_00E6F4ED 
X-CRM114-Status: UNSURE (   9.28  )
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

The first patch is fix for an issue found while preparing the second.
The second patch adds MSI support for a platform IOMMU. The patches
may be tested with QEMU when including [1].

Based on linux-next commit 5b913f5d7d7f ("Add linux-next specific files for 20241106")

[1] https://lore.kernel.org/all/20241106133407.604587-1-dbarboza@ventanamicro.com/


Andrew Jones (2):
  iommu/riscv: Free irq vectors on pci remove
  iommu/riscv: Add support for platform msi

 drivers/iommu/riscv/iommu-pci.c      |   1 +
 drivers/iommu/riscv/iommu-platform.c | 102 ++++++++++++++++++++++-----
 2 files changed, 85 insertions(+), 18 deletions(-)

-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
