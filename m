Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A575C369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=aP5EADUtxWASZn1nqMg8GBGtJkmI9QGaHaTEdBl19YI=; b=d0t
	PjS1Mpe9YSjy/yYeufXuNEmQwmLFFH0DbJEavzStBg1ejiu/B2W9tva368UEAHZnjGG/7f4SAWR2e
	w/xLQa4jdNkMASRGcrNHeD2/lpFsxFjq98Wdw3dJX3Sfe3XFf7MN8eYz6KtuaQfMt42mUb9jAMOvr
	iUw/XPyx45l/XQ/POot16mezPSpQIgbpG7p6g+YSmXLG8JdyF8E8VD/0a6A6NritmFXiqwJH0GCHa
	bTwk2+Gb4/9tCIWbx5/VKTEcMf9AYzNFqVstsgXqG1m+IJmpM8l7TpzSsBpoEY5Qm+AXvgjz+cylF
	kXZ4FM0SOTRgE6rpvIBAjxTRQr/8s7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8NLV-00000000TUi-3wce;
	Fri, 25 Apr 2025 18:00:17 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MOC-00000000Jme-3NEe
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 16:59:02 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso2654220b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 09:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745600339; x=1746205139; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NefaNqk3RjvDYqaLH5irY4z1/htHyWmzbblLCF32TN0=;
        b=HfDYwmUu+oZQcv+FXcCarY7sJVHN5UI5fn5pM7+cvh016oFpEb915ZoUP4kFXw5vyw
         y+rYUfDPKRQ4KFJN48YSAPKc1bDRicT3OlCkttizZlTjpviMX1Y5ZRrEwcc2l9uK3HJN
         X3uiO5NYQz0fv3hoF6IfwwddLMk4adAMS6KWlhmVWjZHF/jqV6mnBhXZiMsqYksPmXRx
         /tV2kba4H+QYdQNlcXPtcjpNonzjac1uXH6nk/qwNRHzLiyLUKrkLdn68J5hqj2owkog
         zCcc3wGmmfhCP5uJRj/NS/QDfcCmqutms7CuT8sZJwPiUTSEdlLec3sPnolF0dVP4+Ev
         QnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745600339; x=1746205139;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NefaNqk3RjvDYqaLH5irY4z1/htHyWmzbblLCF32TN0=;
        b=b0rirh5lCe5vfcu2fPvPFvu+rSaogOGc/cDYZE2qlR19LE11GfQZtPq/wRO/xhfdA5
         TxB91ntJdlJQPTzEFzEjocssjfM+NpLQVnQoeUeWrFj91WKy9keUFv0bYV07esPwkLlc
         gVMNQRboJIwhAHpyxg8/tiVA/1CSqFtD55RyVm+sACZ+7NvMZ2spYtSifLGrTThqNEXI
         zuz6IjIrEzsNxE/yhzuY8R80ltOkaSeIV1b3SpnWFn31069aNNMFwPzq3unNagcwUsmV
         3TnoJdWPmm4VrgIo7egqPIZLB+ekfTyNT1nJMmIe5fkKImDjk0/cdihAobYNs3jrrdzA
         IP9g==
X-Gm-Message-State: AOJu0YwjS/saznGOr5x/52SnRTkX+iOdw3ACyKqjxF8gTPAnpvWWEuSh
	g0FAeSCL9yZzyzOfE5bdy4H3wbwiRe1LnFMQPZX9o21zZo5fZsMfOFuEg9DJ6PG/SLA8m7XwZ03
	G
X-Gm-Gg: ASbGncv9LJ89/i8mn8o5CpSNaeB9GjUQfchMFT+n2EdbMSKKR++5ulM7MTK6EDlouRd
	xYaREVwnNIfCXpSURWabvrNRBdWu0sLk3TBUCAI3cBudQ7qf/uO/mBTKv5ejUb27m98w0MfEQ91
	8zO2Ex/TSr6tDs//zmmevyWp9N3O/yMCFQlVqiuk9y6qpR8y88jqeKU9AJLLfmec3O6dqvKp155
	HkOsRszR4CP35ULS2lF5LIlrQzoGsE136dZiV/r1bjKV1UpiBEKZUcWfhDM4KpFYFO5JHBx6kYo
	v65E3K6OvwpisGJ1BjmpVsw+xKTVq4zfNNCqlo4=
X-Google-Smtp-Source: AGHT+IGgerAE9R879YStm8v8913A0Xp7rZn5GkLYDKLRRvjK5Wu3uZuXtRRCHUx4nGLPZRzT4d2mrg==
X-Received: by 2002:a05:6a00:218c:b0:736:5753:12fd with SMTP id d2e1a72fcca58-73ff72553c3mr318817b3a.4.1745600339394;
        Fri, 25 Apr 2025 09:58:59 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e259135b6sm3408570b3a.9.2025.04.25.09.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:58:58 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:58:58 -0700 (PDT)
X-Google-Original-Date: Fri, 25 Apr 2025 09:58:50 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.15-rc4
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-c76c6281-8851-4a75-8e4b-21762027369b@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_095900_838317_AB4B8B84 
X-CRM114-Status: UNSURE (   5.46  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6481549192940400193=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6481549192940400193==
Content-Type: text/plain

The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc4

for you to fetch changes up to 7d1d19a11cfbfd8bae1d89cc010b2cc397cd0c48:

  riscv: uprobes: Add missing fence.i after building the XOL buffer (2025-04-24 13:20:02 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.15-rc4

* A fix for a missing icache flush in uprobes, which manifests as at
  least a BFF selftest failure on the Spacemit X1.
* A workaround for build warnings in flush_icache_range().

----------------------------------------------------------------
rc3 has all the tree-wide fixes I'd stacked up locally, so things look pretty
clean on my end now.

----------------------------------------------------------------
Björn Töpel (2):
      riscv: Replace function-like macro by static inline function
      riscv: uprobes: Add missing fence.i after building the XOL buffer

 arch/riscv/include/asm/cacheflush.h | 15 ++++++++++-----
 arch/riscv/kernel/probes/uprobes.c  | 10 ++--------
 2 files changed, 12 insertions(+), 13 deletions(-)


--===============6481549192940400193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6481549192940400193==--
