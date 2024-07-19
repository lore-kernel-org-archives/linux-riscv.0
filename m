Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D280C3DA59
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 13:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nSV9lOJy5NnXWbnvVFhKc8x11SUSJgdGlwA/+rolCSo=; b=YZyIswTd9sCijJ
	FR+kQTTJHj/UZYSoDDOUrO/HZK8bpKZz/MlKskkGvtFc5lN4vVQemUFs+ZOHXHRr/K9JY0b2JWjEH
	daP+/FvuGHnmt0dvSgM4sIYeOXbGUfIq5ZMfx+iEIU65OmgjavDsQEz6Gyp4ja8hZRsnQeTlMqWnT
	RQzIGnuE4ocu5TGtXBIe0Wj4Xc7tRTfi8AF4q+ShdLtPMbCuFVNZadsVEimm97Dv3cNRhPpgn7F7N
	h97jqVHkasgghxPriNSTLn2RLmZsm0n7vlh1aQTGXQ1y4QOS6M6vKeiAvlu0TZRr4nHfL0JShNzA+
	GXcg25b5XTcgeL3TBunA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVAEz-00000005AoX-38v9;
	Sat, 20 Jul 2024 13:35:13 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVAEv-00000005AnD-2UOt
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jul 2024 13:35:11 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-761e0f371f5so3035053a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 20 Jul 2024 06:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721482508; x=1722087308; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=okX3z9/O4JxpS7ZY3ssg2VM6MGJ5Gd7HSr4hGICtRaQ=;
        b=OMZ1uk61Sx14nojczEM8e6qeJUsCIteFN0ZiLAe5whwIHDRb4CyyasKT+27FbVFrFb
         1fgN9vRGhPsm/UU0oYWcERo25fTuaTCEPb9izcLytcmNHp+gtTzbqP3raUBdXo+lH0KO
         515/Y2BSKtukYygtctRbY3bYkvpwd2CeHJfzZwRLmZFtzKM6Lnqd++mb4bUBxFBWcKAv
         V118KBvV64iqtuX2BFRtLkaENxccysUZijTUzQNhDX7P+Dv2OB20bnX48Qnd+OPKmzdz
         sd67cE1ZZVrRCiyHZRjXPxArTAqRV4F1AIjdPN9WQiAPJSqLTyUgkGikJRZznjGK5mrJ
         axCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721482508; x=1722087308;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okX3z9/O4JxpS7ZY3ssg2VM6MGJ5Gd7HSr4hGICtRaQ=;
        b=O6vr4sC7xANLPltiOSKk2AqlPb4dv8b/3A6Jkdq1yv5WvaKrjQyvXYHnPKjVjvbc2T
         Y2TPsjBlrWWI9qFXEnY793czG85Kb7ZdhFHqYVa2JwxAoV9TRYS1i7pyc76Y9lNeJoRu
         oLi5pxHtn4fZ+4xUz6+OoVc0spygbNTkjerUhTLcmPTYVe9VItPWkgASbEbJm0cbpPh3
         5Bnghsm9lBeJBcKmDISHjZeK+8jj+tXmDnvQzOVrATrfa4gczToCZBFNprm8GGl8Lt5c
         dl1UzurZ764dIaUA855jhTogEdLlOoftgWdJmrEeSchdjNGvpH1NWqGpLYwKMhgHcYYb
         AWmw==
X-Forwarded-Encrypted: i=1; AJvYcCVcehVFRzhJdNuBgOddBCN5hMcJ8LYH2elIvL7BTbR470zM85jQnc4ECcb2Xac2rEsyKRvkTA5HfGju/qLx81sC7nVxvKz0v+R3Jac1FhPU
X-Gm-Message-State: AOJu0YySTBlFbjZkVm5ss7A81tGGAkRyo3i29HY2AK2Bb43hT9BTyZIk
	H6r4us7qK+8jq/SOtY2P1WF8JMR8j2rz+3tGPbA2qnI2pUHFMgufFneEK5ZI33M=
X-Google-Smtp-Source: AGHT+IEo9zfPWvHmxxSk8ddC7++jG3WjgsugpmTZfOPfhJCYUsON31LAXDkBtajkrFwAOoXVxE4NzQ==
X-Received: by 2002:a17:90a:e381:b0:2c3:2f5a:17d4 with SMTP id 98e67ed59e1d1-2cd16d1c5f2mr4312138a91.4.1721482508093;
        Sat, 20 Jul 2024 06:35:08 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ccf7c72075sm3534264a91.28.2024.07.20.06.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 06:35:07 -0700 (PDT)
Subject: [PATCH] cache: StarFive: Require a 64-bit system
Date: Fri, 19 Jul 2024 09:38:41 -0700
Message-ID: <20240719163841.19018-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_063509_915110_BD02A392 
X-CRM114-Status: GOOD (  10.88  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

This has a bunch of {read,write}q() calls, so it won't work on 32-bit
systems.  I don't think there's any 32-bit StarFive systems, so for now
just require 64-bit.

Fixes: cabff60ca77d ("cache: Add StarFive StarLink cache management")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 drivers/cache/Kconfig                   | 1 +
 drivers/cache/starfive_starlink_cache.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index 94abd8f632a7..db51386c663a 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -18,6 +18,7 @@ config STARFIVE_STARLINK_CACHE
 	bool "StarFive StarLink Cache controller"
 	depends on RISCV
 	depends on ARCH_STARFIVE
+	depends on 64BIT
 	select RISCV_DMA_NONCOHERENT
 	select RISCV_NONSTANDARD_CACHE_OPS
 	help
diff --git a/drivers/cache/starfive_starlink_cache.c b/drivers/cache/starfive_starlink_cache.c
index 24c7d078ca22..8ee9569771f8 100644
--- a/drivers/cache/starfive_starlink_cache.c
+++ b/drivers/cache/starfive_starlink_cache.c
@@ -19,7 +19,7 @@
 #define STARLINK_CACHE_FLUSH_CTL			0x10
 #define STARLINK_CACHE_ALIGN				0x40
 
-#define STARLINK_CACHE_ADDRESS_RANGE_MASK		GENMASK(39, 0)
+#define STARLINK_CACHE_ADDRESS_RANGE_MASK		GENMASK(39ULL, 0)
 #define STARLINK_CACHE_FLUSH_CTL_MODE_MASK		GENMASK(2, 1)
 #define STARLINK_CACHE_FLUSH_CTL_ENABLE_MASK		BIT(0)
 
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
