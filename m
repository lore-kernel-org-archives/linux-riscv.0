Return-Path: <SRS0=DbKB=MB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51FEC07E99
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jul 2021 14:54:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AFCD61363
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jul 2021 14:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AFCD61363
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I+B3xYeMNH+zr8tOs3483vkBcISOAFtGFc1UDiLE/Gw=; b=aj1bFY07JTx1Tc
	Qgk7LPIvgqTblJkH8H2ZrdNrPjiSYpkOFX7QI+Lz/zEHPOfXGLhlGEIkma90JNlQhI5V/bv2ISL08
	0omNXl3nHyQ8sjC0bK8ICoAS2dC7eG6JkILEoJwpEmUO9sXTwhDjX0cGT+rysTZdqebFsvYbahLGj
	o/bNV+HCacBig7lZEowAuPznIG44RBafBnHTopKT1ThjdMhQAj3ibChq9iUICHdLXUbjF1v7qBhe8
	w/r9OGh+RnZfS8jCXN+jZag3Q2RCcY2M+jNqr9rs0L8vp1i4AdkfB9ahtkqY0BuFinco9tq54/7vJ
	H6MI0bvXQC+soTxUd95g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1rtF-001zRU-Me; Fri, 09 Jul 2021 14:54:05 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1rtB-001zPv-3m
 for linux-riscv@lists.infradead.org; Fri, 09 Jul 2021 14:54:03 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 b14-20020a17090a7aceb029017261c7d206so8364877pjl.5
 for <linux-riscv@lists.infradead.org>; Fri, 09 Jul 2021 07:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=yMC2dDsfx/Mr1GddEIQMt7HBp9JtaQFgPJ/R7R7Trsw=;
 b=A7QrFKXUsYmtHeBaijRHWzuXkoxhFLZqzgE4bzcQsgTWnD/09dL5hE5/74ixU1a1tJ
 RBwibABaw3BgKO3VYNKT9zGMYJb/znxT45YCz/NM7R7HBiMphKME4HFu2AF82KSF9NYz
 hPdjBu0UBxwNhntfk2PlfhunVGqIrOBUehZf6OuXpfEfStQNZyzIgsOKZTdBtf+FsSip
 X4IVvkNkC+o2214PsWwu7KhYe4fYouZ7yhi0iFNB7s+p8xNANKaz26OAT5YBoIIXUdxb
 NgoV1KbNHGeuecM0rwSAROJr/ZZYakiorO3Gt1gdSwZvLXINT3LTsPvIRSHChqdKCxrj
 v0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=yMC2dDsfx/Mr1GddEIQMt7HBp9JtaQFgPJ/R7R7Trsw=;
 b=oL5Gd4ESv0CJ+ODARYQd09bKWuoTZ0zsGdGfYtx04dqBvCcJdW2RG9J41ayYIzlesQ
 HjaLoidFq2Xzw1rbutbsUCuoZQzzZmQFipgLzGawSdq+FR7C2B+1mn995v5+FedqJJRp
 ti9PmjdnpMEU8xqcy1vN9JOvQ7z+r/8CgBeC+rla1T5J4herdIMowtVAOt8MZUOmACak
 9Rr/d3OszQ3H85ISfvCVlVRv61MMt9m8z7PfJUjTXsb66X928ekR/PP0CW+0XULwDPYR
 GWYsjlvdqo5m8RKukS/qPwSsFOKWpBP0H0Xc2P/jSXfWj2KYuFVidqFHQ05+n3cXRakv
 kfHw==
X-Gm-Message-State: AOAM533hSQKKx24eKqheDkSH2s9kF8vrraxUXaE693EAZTAo2VKxXgEN
 bCtH1kpznpBQJRiJB/8b8Slkaw==
X-Google-Smtp-Source: ABdhPJwu61BseB7IUoo1sfFhKkz1W27pvKObVOH7GSx7aJDKxh8xfFyEmgrmgVP7jchxXLslEJT1pA==
X-Received: by 2002:a17:902:934a:b029:128:f8c2:bf9b with SMTP id
 g10-20020a170902934ab0290128f8c2bf9bmr31305488plp.8.1625842440057; 
 Fri, 09 Jul 2021 07:54:00 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m18sm2931988pfd.42.2021.07.09.07.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:53:59 -0700 (PDT)
Subject: [PATCH] RISC-V: Fix a Kconfig ordering issue
Date: Fri,  9 Jul 2021 07:53:50 -0700
Message-Id: <20210709145350.3661558-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, apw@canonical.com, joe@perches.com,
 dwaipayanray1@gmail.com, 
 lukas.bulwahn@gmail.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_075401_193445_280C7ECC 
X-CRM114-Status: GOOD (  12.28  )
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

From: Palmer Dabbelt <palmerdabbelt@google.com>

These are supposed to stay in alphabetical order to prevent merge
conflicts.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3590eb76000e..a9fd3eb9c300 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -70,6 +70,7 @@ config RISCV
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
+	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_CONTEXT_TRACKING
@@ -108,7 +109,6 @@ config RISCV
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select UACCESS_MEMCPY if !MMU
-	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
