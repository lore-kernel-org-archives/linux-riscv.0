Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1DACF3968
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 13:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VD5Krn9zNJspKVOw8g2qEM5c/blWXhjMPIieSpJZ+Uw=; b=CQsbTyvESZ94Qz
	Lx8O8andXF8SnWTsScFJRssG8Dw4ZrNnx4TvpVlf63PVKtnif8lqED1173UuW2LA7FHCcD+mBi2CN
	0tMrZ+rU8/lYRbiMKawJuQ1o2YrnYdpsqYmmyTHQoH778GqKqVDb27DB/fzVwH3kqyLJ2UrXwgrv5
	VqCpK7hn01igi4qD0hs4j0VyO+TRLz9oumyAmCngA8MomJdeJAoN9I1cI/VZQmjr2X12V7SsHWTqv
	ni+oUdaidZRg/RVmjWz3HLv7fMddZfngLVV4psx/gyIQSfA12xH31Lo6V3T2frzD5nYITXCG2MS81
	b0bluvsWrNe/AQLQtB5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stRt4-00000005KNF-1cUS;
	Wed, 25 Sep 2024 13:16:58 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stRsB-00000005K8b-0GTJ
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 13:16:08 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2d8a54f1250so4401531a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Sep 2024 06:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727270158; x=1727874958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XUJTSwNM1e4VTN+bCMYDMDP5A3DfmVKg+wgt1x46TI4=;
        b=LmDpjVruoMIdJcaukjJbX8jSvExXixXAVqMZDuXy4+V2wR9yQAjDBTWxTg77MxN0fK
         LdQMLDlob5BXGrYWaTu/CnPiqZwRPwsHDT/DHwOG5YbCU5XX8rHCSmbQOfL+Uv51WyR3
         I7MwqNSvD+9HDFsooNt7Lx5oUgaWr0o2oBs8yQZu74dS6l5QI/Ne89TjVqTgf8jO1rQG
         dKrpJtOZgR2rAorhYHTe5LbLHBXn5v3JzoU8YcQ6NbQSzMgqBMxb9RKK54Y2zjDgw7Sf
         +n5odI6JdW6aL81Hnoygwq4e0McM1l0s55rIrNXm+SukBL9l15g397koy3oLKZOKLWR2
         NIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727270158; x=1727874958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUJTSwNM1e4VTN+bCMYDMDP5A3DfmVKg+wgt1x46TI4=;
        b=Jo8h41vs421OfRGVIc2c9KJ72hCFkECGjgSN/gs1n1/pISLDKewS6M+PTdRQJkqkKk
         NCApTKT4/oa5+gxQ74Iqk8lNVaDKCg6KxHYzSE384y0rj3rkTaiXG7v78ZqKrFxXFAyH
         k0KCK9zxgu2eXsJ8CuWe4J9SD4rFP0EVu3KhDLZX4AGvme6RQmj44Yncs33Z6OMH7aV5
         HRIfIStzFX0y06aiC6tH9uUBUOWwSdbzbNheNzp1EI+JDyWNvic7N+ZCvKB+5ahjE9D8
         1CbNf5S1BVuGYV/ebWf94zc+kism7FNLQCJOvn832Q8G/nGyHAcWD/ZGbbqB7pRtQk1k
         yv+w==
X-Gm-Message-State: AOJu0YxMeP/tk9mHkAuc0y0TedtAjsVHzpnKcjTYNAefaaE7qItVngY5
	5JBGVuDn//Zdl/aUdqkLRtoqTz9XM2lwJ1Ng8NbhRa1ii1Tfvsqv81Uj08pCYhA=
X-Google-Smtp-Source: AGHT+IGKQFKFIicIvwhIpG4qJ8M43Ad5bDM2eqKiY3aBm1kBagIZP/pVcceYSqLXQDDwD/rQiYLZWA==
X-Received: by 2002:a17:90a:6b06:b0:2d8:8d62:a0c with SMTP id 98e67ed59e1d1-2e06ae21751mr2920097a91.3.1727270157832;
        Wed, 25 Sep 2024 06:15:57 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1e09e2sm1479465a91.32.2024.09.25.06.15.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Sep 2024 06:15:57 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	andy.chiu@sifive.com,
	guoren@kernel.org,
	christoph.muellner@vrull.eu,
	ajones@ventanamicro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lihangjing@bytedance.com,
	dengliang.1214@bytedance.com,
	xieyongji@bytedance.com,
	chaiwen.cc@bytedance.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 0/2] riscv: Idle thread using Zawrs extension
Date: Wed, 25 Sep 2024 21:15:45 +0800
Message-Id: <20240925131547.42396-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_061603_306210_CA1E474F 
X-CRM114-Status: GOOD (  10.44  )
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

This is the third version of idle thread based on Zawrs extension. We
noticed that Zawrs is supported in v6.11 now and rebased our code on
it. Below is the original description.

This patch series introduces a new implementation of idle thread using
Zawrs extension.

The Zawrs[0] extension introduces two new instructions named WRS.STO and
WRS.NTO in RISC-V. When software registers a reservation set using LR
instruction, a subsequent WRS.STO or WRS.NTO instruction will cause the
hart to stall in a low-power state until a store happens to the
reservation set or an interrupt becomes pending. The difference between
these two instructions is that WRS.STO will terminate stall after an
implementation-defined timeout while WRS.NTO won't.

This patch series implements idle thread using WRS.NTO instruction.
Besides, we found there is no need to send a real IPI to wake up an idle
CPU. Instead, we write IPI information to the reservation set of an idle
CPU to wake it up and let it handle IPI quickly, without going through
tranditional interrupt handling routine.

[0] https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc

Xu Lu (2):
  riscv: process: Introduce idle thread using Zawrs extension
  riscv: Use Zawrs to accelerate IPI to idle cpu

 arch/riscv/Kconfig                 |  10 +++
 arch/riscv/include/asm/cpuidle.h   |  11 +---
 arch/riscv/include/asm/processor.h |  32 +++++++++
 arch/riscv/include/asm/smp.h       |  14 ++++
 arch/riscv/kernel/cpu.c            |   5 ++
 arch/riscv/kernel/process.c        | 102 ++++++++++++++++++++++++++++-
 arch/riscv/kernel/smp.c            |  51 +++++++++++----
 7 files changed, 203 insertions(+), 22 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
