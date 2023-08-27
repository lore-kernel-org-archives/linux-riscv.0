Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91D1C83F1B
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 01:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=npoK9bajZgY4lUVoEvZditnfZjfOO8EnxwWhXXFxBOI=; b=UvljufTnhW0EBg
	XQQdlbbC/TZKJrbgkUOUagYY6EHx2hhkvujsKQX9bMTck1LMXaAfluxOnp/4dRThdg0cZG2UHtAkK
	Ep+yXmBd9uyVrBICo3EvpRJu7sglJU0zZThDS89AGJ6WtgLA4kaHS2kHabCeJUgXF+OUmDvmu5sOa
	JAqCZejTqIXfN0CZ5uXcO5PzbjREaftcodmGXDEocMM7eFrB1NUI2rKqEzOgG6vgnxjvo463PocQX
	K/QU7afS1KXSOKRLg4FEu9bFj+84UzU1/3T6eVzR62yaLTHlozkUyiws62AjjWqUFH1uLdKI+jn99
	hD1SLPxLgD18c3uoKrlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qa4YG-007MaP-35;
	Sun, 27 Aug 2023 01:26:52 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qa4YC-007MZI-1r
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 01:26:50 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c0c6d4d650so17383045ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 26 Aug 2023 18:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693099606; x=1693704406;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UNSCCQJ2PHIrpnuCYjkfmwAL1UlsOXF5w17YaiUOSMs=;
        b=CgS+ELHYl68sNVrtSNvW+no+75+iNX5v8szBnRR5GsefmWuQMd+wl+Is32E5MtWRPd
         4mOAlMT0Pt2bc6beSZcQGlNQ059Pk6xy2nfKkLpKNdlMh3RclwViHo33EZtCrbvEWp8Z
         qhieYrdu/ZkisUY8fnkwfZU9A/JIUoyr654ieaLuJ6hVwIPqVAdBB6HMqhX6Nw5iJzOB
         9ImbtOxHaC58nmFogp28Z7KS5uhB9DdPSeHFAIp0wQkf6hiGenV3Huc+apT1SK+iZaC6
         nJ0+PCHAoCfpwpX/6AR/zJwZgxUSrvICwnNWqyHXFhVQlvq9Zf0yOEDfhHP/hJahultn
         WrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693099606; x=1693704406;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNSCCQJ2PHIrpnuCYjkfmwAL1UlsOXF5w17YaiUOSMs=;
        b=lyACsHZOfSTRGCLY5DlIKajzq8uoBaWgDmLBo/ThRPWrwC5tBcqrL7HLnL2pvn7jn/
         OeRbcyp3QQauKsAmprHhWrb/8pZ1fE6WUggLxZ/PbsXA4uhJCVKon255FqpJvy3SYy+m
         QdtkyiFda8XQH0fCgzl1sAjs73yCMsi+GY75JOdZZ4KD2sSjlLKGx2PM83Zt/BiHDxcb
         B6sa6WNUwtD8PBGU2uFA/HicN4illa9hOHw+sv/eEzmfb0BISU1eV4qT72UlUYTxTQNg
         Kkn7yYEApOBD0YUggnKD3Nd4RIiP3zhsUQ7zLucsnj6WazuoIE8ipH7gJt/b4Px8+wvx
         dmIw==
X-Gm-Message-State: AOJu0YzuTItD0bxcGhYvcRcswwD5ldG2bxH8ABj/Aup7ZCdW6Bs81n5j
	G+faeTMwtkmD8ZEZTkW1G5KPDQ==
X-Google-Smtp-Source: AGHT+IH8uJ+mK8/jT0ou9nq6/xNAJEE4H8D7+FwR4quNsvGNSpXeGhllAqEyEP6g1xYfWsCvIsJbdg==
X-Received: by 2002:a17:903:24f:b0:1b8:4e00:96b with SMTP id j15-20020a170903024f00b001b84e00096bmr26818362plh.9.1693099606315;
        Sat, 26 Aug 2023 18:26:46 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jf6-20020a170903268600b001b869410ed2sm4357404plb.72.2023.08.26.18.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 18:26:45 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/5] riscv: Add fine-tuned checksum functions
Date: Sat, 26 Aug 2023 18:26:05 -0700
Message-Id: <20230826-optimize_checksum-v1-0-937501b4522a@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC2m6mQC/x3MQQqAIBBA0avErBPUDKSrRITZVENooRWRdPek5
 Vv8nyBiIIzQFAkCXhRp8xmiLMAuxs/IaMwGyWXFNVds2w9y9GBvF7RrPB0bB6FqqbWxUkDu9oA
 T3f+z7d73Axxw9zpjAAAA
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_182648_833616_9E1E7515 
X-CRM114-Status: GOOD (  12.30  )
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

Each architecture generally implements fine-tuned checksum functions to
leverage the instruction set. This patch adds the main checksum
functions that are used in networking.

Vector support is included in this patch to start a discussion on those
since I am not super familiar with the vector instructions. I wasn't
able to get the vector patches to compile in the kernel, but as vector
support matures I will be able to go back and fix them up. I have tested
the vector patches as standalone algorithms in QEMU.

These functions work best with the Zba and Zbb extensions, so support
for those instructions were added to the kernel.

To test this patch, enable the configs for KUNIT, then CHECKSUM_KUNIT
and RISCV_CHECKSUM_KUNIT.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (5):
      riscv: Checksum header
      riscv: Add checksum library
      riscv: Vector checksum header
      riscv: Vector checksum library
      riscv: Test checksum functions

 arch/riscv/Kconfig                    |  23 +++
 arch/riscv/Kconfig.debug              |   1 +
 arch/riscv/Makefile                   |   2 +
 arch/riscv/include/asm/checksum.h     | 165 ++++++++++++++++++++
 arch/riscv/lib/Kconfig.debug          |  31 ++++
 arch/riscv/lib/Makefile               |   3 +
 arch/riscv/lib/csum.c                 | 283 ++++++++++++++++++++++++++++++++++
 arch/riscv/lib/riscv_checksum_kunit.c | 111 +++++++++++++
 8 files changed, 619 insertions(+)
---
base-commit: 7bafbd4027ae86572f308c4ddf93120c90126332
change-id: 20230804-optimize_checksum-db145288ac21
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
