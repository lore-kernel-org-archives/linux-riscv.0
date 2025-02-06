Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971BFC02194
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 13:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubjoWGDLRIjj3PvEeDqxxQsOPqc956U2tCzf4rVyrNE=; b=290S+dMuwE1A+a
	pDC48Vytnc7vmhkM+PY4soajVJn120XhjrA9/UmbmEMr9i/caKyz/U1NXLw1afLW+iyee7lTLAu9D
	rE87SoR9QKHVEjiJUxQts0nB6BOajt+6oRnOxySxKHZMAM4up9m/Yc7nGxwP8zPsSHjlhn9yliiF3
	36LDLZSzzd3fEy2AtgiegG+ntHYS55RcmTUq5cGfnpGf42/jTewRKZRdq0j1YsWpFS//JMD6TxBbM
	z1hLQaWMhwtUZoJuvux9cR2eTGBwK4dcHY6lVt0PzrceQ701qEZWY2yoSp80BZ24bAK8AgjgtYUi8
	pW7xZZNmsS59qSeF/Lmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1ov-00000006OvA-2Tfs;
	Thu, 06 Feb 2025 13:21:29 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1nM-00000006OSF-1k59
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 13:19:53 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2f9bed1f521so1228903a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Feb 2025 05:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738847991; x=1739452791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdj6PVBcwHidoO5BXn3s9EOfHL8khlRsKQpRtEXGdyE=;
        b=if0X0Az1lvchQx3itSXT2OrqASDSsOy6moRmFD3QKUuZDkWYzcZ0m+2Md5zZfThVg/
         NRLRvd2EnE4YpwwUYx6m5aSfYg3q7M0OGSnMAC+g3uIgHxN7hk014vhLQ1C51xGClpr9
         rLSC3+EuCKql/jkYoAeQs/l+pgDpY+2KZUNcsa4mNGNaLPg7b6vtznu9wVTYSIfTmrkk
         dp/MbOJ+xG17XNtND8BzZvMaqe0RDdmf7n+XIn6QfXcZn5OdyVLKxLrXhElIGetedcNU
         3y/lJCI7LhiY9KUur5v+JHhjgHX6mePq6YP9klLWbWJjotgPRbNj905WGe0BaaHxbdsR
         xVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847991; x=1739452791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdj6PVBcwHidoO5BXn3s9EOfHL8khlRsKQpRtEXGdyE=;
        b=tpdlClvqbyQwofWv03ieGuGQgQYOpFXvlCFf/f5WXuGkqN9lHv33v3X3y4LxUEO7F2
         VlrscpfhKcxmczH5on9SpCZwM17awy/q9QZWx7ud9KvQ+f385ONaS5JMSDw5+/dtX/tN
         BOEVkrfn9JoXz1UR5LvdFghE4/VM15Ax2I6j4Cg+o7liGKKuwSFrkAS5zs7CtKir1yIY
         /mAxYDq0J1ZEdmO3lqEAJwqDZF/7LPs+qU36XW6tN+Gi8oMwUJV/kOGiCcIzRa5teICv
         JRq8Wg22Xw3S2lTZ2k4lpkxrWOERmmx9SYfzzB1/X6wm5kdv60TmpCnS7ugXkNVz8AjF
         5ZqQ==
X-Gm-Message-State: AOJu0Yy1iM2Yhk6gNEpetaZZkG5WXRZBKt5CUkS3kDuKU/hDstA7Gp3r
	14waLkKtJnCkFg0+0HpHp+d3cTVHx95y2a3SVRkLeDp5C1dTQg1fFO9FFYDCtGA=
X-Gm-Gg: ASbGnct0OLmaSgg1XDJNyBPPjMFiEs5yg/A3VyF+FUbpfi/0Y+VF5Z42SF269gb1yIf
	DivUjqHUtvgPxKwkwxGEzFvdggFmXVxrRgWkoG1aX5f9sUUvT5U4pSVW5x6t+6mPBmug7bzdIew
	ju5K1vVpV8snKOnws6ueNcdh6qHupUXj/TAdUC4a1u59YgN/qH2Ln9dyOrjuYqdT91JLFJBNIKo
	05d8fAFglbMn64kPq0lxyLPtxA1nCUyFcbw8RHJWarFjAwuwhJ6SX0d20mYLNzC0VlJBBCibNxr
	U7piF/+ZrsMwm5Q7fA==
X-Google-Smtp-Source: AGHT+IHfXnIXGHHOMLsW93QKlkZW4Ccyu2SXidx5aNBvkoYn0PbZECkavhjDqZaPqEQhZX0lGCcrNA==
X-Received: by 2002:a17:90a:d406:b0:2ee:e113:815d with SMTP id 98e67ed59e1d1-2f9e0761240mr10760981a91.8.1738847991406;
        Thu, 06 Feb 2025 05:19:51 -0800 (PST)
Received: from L4CR4519N7.bytedance.net ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d987sm12170775ad.120.2025.02.06.05.19.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Feb 2025 05:19:51 -0800 (PST)
From: Rui Qi <qirui.001@bytedance.com>
X-Google-Original-From: Rui Qi
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	haibo1.xu@intel.com,
	guohanjun@huawei.com,
	sunilvl@ventanamicro.com,
	samuel.holland@sifive.com,
	parri.andrea@gmail.com,
	ericchancf@google.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Rui Qi <qirui.001@bytedance.com>
Subject: [RFC 1/5] riscv: select HAVE_ACPI_APEI
Date: Thu,  6 Feb 2025 21:19:22 +0800
Message-Id: <20250206131926.91289-2-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250206131926.91289-1-qirui.001@bytedance.com>
References: <20250206131926.91289-1-qirui.001@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_051952_451876_73129AA2 
X-CRM114-Status: UNSURE (   6.84  )
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

From: Rui Qi <qirui.001@bytedance.com>

The current riscv architecture code can already support GHES,
GHES depends on HAVE_ACPI_APEI, so enable it

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..df01fe8cc24a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -120,6 +120,7 @@ config RISCV
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT if MMU
 	select HAVE_ALIGNED_STRUCT_PAGE
+	select HAVE_ACPI_APEI if ACPI
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
