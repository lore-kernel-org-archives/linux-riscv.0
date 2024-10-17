Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856CAD3C52D
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WSB0XIlYb/VzFilBacTS6yFO3vHFCab/nwaQWIFlIEk=; b=iCZSlrAz5eMYWs
	w738AkfibKheoY9zyCbaNIECVookPjpNGifOFWADX8GpWFORevJwF/usP3HgQg4rlcz4EN5yb2E3q
	mgaslDxdbm91MtfTnelpfyQOT6hhgjoHFpRCQmTNZ14pbE6QXtyLDylol1FAauLNSFQoFuLGlTMGK
	JBSw28HUkPZgCHfwDKQGpxkkBbT0bXU29GeUtx5MTeXNWfLRhpjk710L0pl819atTS/Eisd5Vgp5m
	fvBXDxTnMpN3UxRSqoe+ebVP6u6uMYdaBiARQkNOvZsqTXiS0zEoDtDDbFjgL+8pBa7euDH3kUN6L
	v2qCtkOZzTPv3gZPUXjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Vjo-0000000FxjR-0HzO;
	Thu, 17 Oct 2024 19:00:44 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Vjg-0000000Fxfs-3ITR
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 19:00:38 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e2dc61bc41so963783a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 12:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729191635; x=1729796435; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZtSSNHjp9RieAv6xqx5h/2YC/5BXaB/H3bPub1QA44=;
        b=uTmxg+2Gjn7ehoSvn0gKTdNJPVqcE+wueUM6Ngjnrdq3VKAIrqQH8SPKFo0rLxdgxP
         5gPruAxNrNUYN7GPYBBYTGaITMVzL7nxaplh7zE04KuAIEMT1KCOVa9odfipNpTAp06V
         BXbg8YBnAZwiACA1xAIyHczNVYZhizKRVlNl6iy2i0knqhwKq4sD8rlZJwgzLmc5zrDa
         1Acz008lj2vyzlfro6qOs9fenPM1MO/RkyRuCYSRsabEK2DknH86CWfpAiVaZ0ikITKR
         txs0SHBnt2EKVxy0SHZT1BLs5mKCb01kiOzUUkK82yU0XhRDrEzco1ABRv12hSB1tj8V
         urzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729191635; x=1729796435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZtSSNHjp9RieAv6xqx5h/2YC/5BXaB/H3bPub1QA44=;
        b=NdQ1QXG7ACOj6UFVdUryZAb5IOAQVEEMrR0xltMFatTh3I+Plu5453WS328CCbKLZ/
         mTFMDgJWIUIXbf3J+P2SNCz7md5m1xBbI2iOZTzxtG4JZLPQ3H2GGs9PFC/PD+jS9Nef
         W6I8ibOACdnBHY+hdI3/jekuaOGwgLBzkeOxWkj55sqiVFaRmzKtSDQEJ+RtUFf9QxQT
         lldRYzqjmONzvtrpXfCnYd7gcliZ4BTYl/Q0/8rMmyPM/ad9JdM7hZMZKf2TreFlyrVK
         1P2eBJ07rGKc6pwB4ez/AfkX7rA6bfjdlTjwPrVSpInPlyfiyAIRYNyAoLmSGvxiy3w8
         BAyQ==
X-Forwarded-Encrypted: i=1; AJvYcCULbE2qll1oJlIrpRtk+KTuKMaewxgKqhlXsSJdJe7Z09WF/I3ozNELFNKw9G5jkm+sazTGsHTyvbFVMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVusfFyNrynCRNdNB3EaOg5557iUnoQBTT+XFdS3KwkGoKOEVN
	ahCuyQmRTjqbSWPzDoiOvedTdS8nrAPpDit8S83Dg5+/vmx28qga4vI90indIJ0=
X-Google-Smtp-Source: AGHT+IHTHDlITbXdl9xEaSwI+H+sXmZc1xXbLtusAMsDCjHmg2KFj3D2j/1IOgRBzWvA/vwAqAQd3Q==
X-Received: by 2002:a17:90a:640e:b0:2e2:b64e:f506 with SMTP id 98e67ed59e1d1-2e3152cb666mr25543882a91.13.1729191635225;
        Thu, 17 Oct 2024 12:00:35 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e55d7bf9a8sm217766a91.13.2024.10.17.12.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 12:00:34 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 17 Oct 2024 12:00:19 -0700
Subject: [PATCH v10 2/6] RISC-V: Scalar unaligned access emulated on
 hotplug CPUs
MIME-Version: 1.0
Message-Id: <20241017-jesse_unaligned_vector-v10-2-5b33500160f8@rivosinc.com>
References: <20241017-jesse_unaligned_vector-v10-0-5b33500160f8@rivosinc.com>
In-Reply-To: <20241017-jesse_unaligned_vector-v10-0-5b33500160f8@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=NcyP21pVMP4IjhRseZL4TuagKvpz9wkgoVbiu+LRgZ8=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pg3Bn5OXGT99YZcU4/wHRNont+3+XS6ZvXNH9qjHla8
 z2BP7uro5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIlkzmT4X/v+nrzsbbmsBru2
 bC2zUyFFstsUis01F6sfulu3TPzTQ4Y/XC8Svm/Pfz57+5Lk9K5gEymResXbv+Uc+LTvhbzrOz2
 NBwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_120036_993568_56B5B81E 
X-CRM114-Status: UNSURE (   8.90  )
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

From: Jesse Taube <jesse@rivosinc.com>

The check_unaligned_access_emulated() function should have been called
during CPU hotplug to ensure that if all CPUs had emulated unaligned
accesses, the new CPU also does.

This patch adds the call to check_unaligned_access_emulated() in
the hotplug path.

Fixes: 55e0bf49a0d0 ("RISC-V: Probe misaligned access speed in parallel")
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
Cc: stable@vger.kernel.org
---
 arch/riscv/kernel/unaligned_access_speed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 160628a2116d..f3508cc54f91 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -191,6 +191,7 @@ static int riscv_online_cpu(unsigned int cpu)
 	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
 		goto exit;
 
+	check_unaligned_access_emulated(NULL);
 	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
 	if (!buf) {
 		pr_warn("Allocation failure, not measuring misaligned performance\n");

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
