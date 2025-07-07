Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12BFC8303C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 03:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yWgc24FYZaIE1ERD974iglAXtHgxcmtprotvi+Rlsds=; b=EaKkPcp5bGthgy
	c2g1+oZqVoKtUfNCL8/XLvVzc43F5ROsywXzYuzqiqqSApd1y8E182hM1w2jVWQRLO2wnDMnZuigH
	N5rpWCrRn9O1xYNwzGs3q8wpAmrBfvB11gZQG3Obhvueku2P1gS+G2IHoq+s0nX0JqAQIJlZ+NvZy
	hgL4kgCsdSXyD7AOPLb9S7criT7GdM2LkODGPA7xyq/VQbQ0eMoRYKMvTO811MzUQnOPUEvN9Lyvx
	8mHkc+fa03j0wx7qpaYhgTFPFhYYUVNEui1KqbrS272ep69jLgLF0E0bHzGwIoLT04SU3qlDgfgLv
	S2guW/Af67OoynE5zyzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcvV-00000001Kiq-46VA;
	Mon, 07 Jul 2025 03:53:57 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcvT-00000001Ki6-4AUk
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 03:53:57 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso2711915a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 06 Jul 2025 20:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751860435; x=1752465235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i5wHfXXQ4zEBMf9atQWdwXzfnG4mDo9qjXuqOPXqkyY=;
        b=ZHsUDthyyMA/DqDwRguDvK2dQq+aBL9+4xhOWmrpaD0ST/f+onR200rkNUAxgdYCqx
         AE5Y3CLZtS04cPHeZ+41STS8MrnL6RtnAO9RDHpbSRgjNivpiwGvTmpVfEP8mLes8ohG
         +oj669x2CzejqvY6OvfdpDKRJB0DB/giif6tByQd0JkvQ+Ajk5+BQdlyB0ZbWpxtsjOI
         S6WGjdx7FKUapYMhaRsJjN/NqujD4bJ8GejtsqRu97q1mO7gI5DP4+05BtF569+dcUni
         InNBhhcgbRvKieZZVG2eYcgoG4UpwC25uGFMPf+C65y9VpZE8q+7tTO5IC8HUIAxPDJZ
         dnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751860435; x=1752465235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5wHfXXQ4zEBMf9atQWdwXzfnG4mDo9qjXuqOPXqkyY=;
        b=UFOW6DkaO5/TsxYX0dWrwkCgJ3TlU0B7/Xg1QeXHZBPEn5MdGcecMmRqWxSsc+Tvzu
         onUaOEX54mLrxUl4wfo/xfUFAPU103C3+BTvLyRQabI8XfECbOgs4N5Kggjv/M9YaQDQ
         2UTIcsjabEsDIhzAWXUsq8xw5Ar1yZIiU4oY3Ejo6id9iysfAHa29c1VgHrD8NsKbh1N
         X+oggL5hHWKHB6ypclIuxwBqifS1tuxktl7TXpLWhL6FCU60fquha9HpqJJABwmgyLYF
         4xWgR8m+IPQf5kNVk82F7YxQNqZn/p03LUJnIJA7TaICYab7YUZF4wZ1lDgy3f/NfrRm
         cWiA==
X-Forwarded-Encrypted: i=1; AJvYcCUPiGUCU0c2TtcQE29OZyvnCMbfWcp12PrcBK2jCCncIJcsQlO8hXdu92RugwjPrIQHlKOMzEiXm0z+CQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBnL9/S+FMn8NUrlNyKDoIkadCmow0PmDugZXNzlIbPj1sCKqQ
	fXM+B7OsnEkch10GDSIZ2BX9/NBcg+Qtmbz7v01Kzv7xrgkLCXDYEpT97Kx/WFXWWYk=
X-Gm-Gg: ASbGnctGFe+4NNRsWd+V04akWXBFVzC1nRe5PhQnjLGa8aBu/d2MYuxGjl/gBusflGd
	xr4DFKgInvbKlpw5QnpqD8VxcsSKdoOo0gatwJ7aE1ZLTzr1eiJOe5tuPHMhNq0yrOOTOUWoOaT
	0RUCSPCQjq2Pk6hG/Kqzoj+fl176kxltxLaYHGfO/821SKLVB4Kpn4evPFnxD8agKBY5NOnf1bY
	gDOl67DFQyjGgn0nauF4fv26MsGaaDQBUXlndcanmVBbqoGeRmUKw2AIjgCJUhNGQEyHwBp2IXR
	6RCvCKp1oVszN1ijn0O4/jKqIMgF10oXQAPyFP8LWfRm6DdJqQm7FHrgG3xr4an1+1HJ/A/5oMt
	NJrmyrvzcRU9It9udRfM=
X-Google-Smtp-Source: AGHT+IH3PnAiGTyAZ+6qYrNH6yhveNJVZ6r8Z9td+wti94tqoIsXso9lzCWFTyC7yioqYXSlTSnKJw==
X-Received: by 2002:a17:90b:3c50:b0:311:d28a:73ef with SMTP id 98e67ed59e1d1-31aac447bc9mr17532339a91.10.1751860435085;
        Sun, 06 Jul 2025 20:53:55 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae80ae0sm8159137a91.21.2025.07.06.20.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 20:53:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/2] Few timer and AIA fixes for KVM RISC-V
Date: Mon,  7 Jul 2025 09:23:42 +0530
Message-ID: <20250707035345.17494-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_205356_028431_1B75F55C 
X-CRM114-Status: GOOD (  10.14  )
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

The RISC-V Privileged specificaiton says the following: "WFI is also
required to resume execution for locally enabled interrupts pending
at any privilege level, regardless of the global interrupt enable at
each privilege level."

Based on the above, if there is pending VS-timer interrupt when the
host (aka HS-mode) executes WFI then such a WFI will simply become NOP
and not do anything. This result in QEMU RISC-V consuming a lot of CPU
time on the x86 machine where it is running. The PATCH1 solves this
issue by adding appropriate cleanup in KVM RISC-V timer virtualization.

As a result PATCH1, race conditions in updating HGEI[E|P] CSRs when a
VCPU is moved from one host CPU to another are being observed on QEMU
so the PATCH2 tries to minimize the chances of these race conditions.

Changes since v1:
 - Added more details about race condition in PATCH2 commit description.

Anup Patel (2):
  RISC-V: KVM: Disable vstimecmp before exiting to user-space
  RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization

 arch/riscv/include/asm/kvm_aia.h |  4 ++-
 arch/riscv/kvm/aia.c             | 51 +++++---------------------------
 arch/riscv/kvm/aia_imsic.c       | 45 ++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c            |  2 --
 arch/riscv/kvm/vcpu_timer.c      | 16 ++++++++++
 5 files changed, 71 insertions(+), 47 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
