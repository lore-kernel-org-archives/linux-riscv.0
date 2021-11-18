Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51304C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 08:40:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11A5A61B30
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 08:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11A5A61B30
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BMt2wxuiC7RxC27yZWBkbrH4hqnvM2AxL69xIZQ1hsI=; b=XWcckHMmooIsBO
	v6UhT4gwnXHdWY8hE4qluxpQVGzOfhAnLQkwrJJL6nz9WamBAas6LD3HKs6vJ8fpGZ7ZBW8jfAkAx
	C9r3IziZJBJ2LcluDzVJetzkvjv4RNlCXEc0DvdOG3WCyPLG1M9z1wzqTnfnQlXuLYKZbrmynGn58
	xMgqpXn5uOFsmt7G9XQDeW3qNKlBM0lv8TwyNVLxzTl64wh2KxN/4EOWRvBUczAIiZptsSlNYZV3J
	+Uu+sIn/akk6eWaFL90NiebYD1+jcpEa9oi+tZ6cggwXjv41B/PzBAVr7sII4TQK9b5FLvJA0PRfU
	OVM9bNC/B8/x0tM0KxdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mncxm-007Dkf-9p; Thu, 18 Nov 2021 08:40:10 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mncxi-007Dir-Nk
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 08:40:08 +0000
Received: by mail-oi1-x22f.google.com with SMTP id bf8so12720616oib.6
 for <linux-riscv@lists.infradead.org>; Thu, 18 Nov 2021 00:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZ5d2Mg97hCmt2Auy3YSJwXJWgHFgaajhKOEaXBwnhg=;
 b=CibBKtO6qxuKTBTJ0psPoXn9amPcjTOpSGsm9vUUpAg8kHeq+Dmf7Zh1G3f2iLXGIo
 yHwmQzIYjGadq07oNk0RVUB3BfkBp2w2fuJGxEbQ7JGBiQ5A4dlTwquUKZWgvqlzGQdp
 hJsoGgnEjBrUQvCB7c4g/mHIqgT/WsTz6cSReQoKxm9M7cAeIAflut7WjJNWEr2/GPZe
 npHxNRBqmJBYVTGtoqTAS/xKuWg0U3ZBL34B3caoTHEqix9ocmXME+k4SfncdccsY8CE
 dpvHxU8Pu/SnP397X/30Ws8jCSFFj4HVmQg2+pEcjEyWiRuVftk3z9XL/o5eZ/r8Bw0y
 O8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZ5d2Mg97hCmt2Auy3YSJwXJWgHFgaajhKOEaXBwnhg=;
 b=6LaXBw/ibgNUgW/yAhc/HUqxgXAZUXBnmOGiTO6X+2BuvVlftEu0dMQHsv2yvoOODY
 8UrG++lCsu8WlOhhP+JCWtAmq5JFuSxTrm/Xt3qvd8CuRhi+uC8juUfZHJf9xPwSUPMy
 7nA8NXbeTgtskUNSxqtNbUAQ+XwyMGUsdBe8yYAFcGIP1GkQmngDQXN6Q4eSNrLdx9kV
 iXTpnf7KGAlh862XhROtmzo7O4IvJBtGZegOgYVNmiLJ+9hx66FO+urs3UdumRHCdnsw
 GxLyo0bqthaTbS6A5VJiSnoJX7S6LAw0MGVQahiOnP+6ys1hnAbfh0lUGh7W/RHRi2Rd
 lE6A==
X-Gm-Message-State: AOAM532ylk+uFv9qblDonUsjs0xbbhHQZvy3WLKNd5NEInQJfXArMY+F
 QTb7toTvC2BNNesZX1F21nEhJg==
X-Google-Smtp-Source: ABdhPJxVg8pZ9U2lJaHKgd16zEGWSw2zFeEUTc1fmN5tAS2Msi4uRoVOvNoWLXa28uD9pKte8FCZ9Q==
X-Received: by 2002:a05:6808:2187:: with SMTP id
 be7mr6203100oib.97.1637224803916; 
 Thu, 18 Nov 2021 00:40:03 -0800 (PST)
Received: from fedora.. (99-13-229-45.lightspeed.snjsca.sbcglobal.net.
 [99.13.229.45])
 by smtp.gmail.com with ESMTPSA id p14sm422100oov.0.2021.11.18.00.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 00:40:03 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v5 0/5] Add SBI v0.2 support for KVM
Date: Thu, 18 Nov 2021 00:39:07 -0800
Message-Id: <20211118083912.981995-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_004006_866986_2A56C82F 
X-CRM114-Status: GOOD (  13.64  )
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

The Supervisor Binary Interface(SBI) specification[1] now defines a
base extension that provides extendability to add future extensions
while maintaining backward compatibility with previous versions.
The new version is defined as 0.2 and older version is marked as 0.1.

This series adds following features to RISC-V Linux KVM.
1. Adds support for SBI v0.2 in KVM
2. SBI Hart state management extension (HSM) in KVM
3. Ordered booting of guest vcpus in guest Linux

This series is based on base KVM series which is already part of the kvm-next[2]. 

Guest kernel needs to also support SBI v0.2 and HSM extension in Kernel
to boot multiple vcpus. Linux kernel supports both starting v5.7.
In absense of that, guest can only boot 1 vcpu.

Changes from v4->v5:
1. Added reviewed-by tags.
2. Removed the redundant kvm_cpu_context pointer sanity check.

Changes from v3->v4:
1. Fixed the commit text title.
2. Removed a redundant memory barrier from patch 4.
3. Replaced preempt_enable/disable with get_cpu/put_cpu.
4. Renamed the exixting implementation as v01 instead of legacy.

Changes from v2->v3:
1. Rebased on the latest merged kvm series.
2. Dropped the reset extension patch because reset extension is not merged in kernel. 
However, my tree[3] still contains it in case anybody wants to test it.

Changes from v1->v2:
1. Sent the patch 1 separately as it can merged independently.
2. Added Reset extension functionality.

Tested on Qemu and Rocket core FPGA.

[1] https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc
[3] https://github.com/atishp04/linux/tree/kvm_sbi_v05_reset
[4] https://github.com/atishp04/linux/tree/kvm_sbi_v05

Atish Patra (5):
RISC-V: KVM: Mark the existing SBI implementation as v01
RISC-V: KVM: Reorganize SBI code by moving SBI v0.1 to its own file
RISC-V: KVM: Add SBI v0.2 base extension
RISC-V: KVM: Add v0.1 replacement SBI extensions defined in v02
RISC-V: KVM: Add SBI HSM extension in KVM

arch/riscv/include/asm/kvm_vcpu_sbi.h |  33 ++++
arch/riscv/include/asm/sbi.h          |   9 ++
arch/riscv/kvm/Makefile               |   4 +
arch/riscv/kvm/vcpu.c                 |  23 +++
arch/riscv/kvm/vcpu_sbi.c             | 211 ++++++++++++--------------
arch/riscv/kvm/vcpu_sbi_base.c        |  70 +++++++++
arch/riscv/kvm/vcpu_sbi_hsm.c         | 105 +++++++++++++
arch/riscv/kvm/vcpu_sbi_replace.c     | 133 ++++++++++++++++
arch/riscv/kvm/vcpu_sbi_v01.c         | 126 +++++++++++++++
9 files changed, 599 insertions(+), 115 deletions(-)
create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi.h
create mode 100644 arch/riscv/kvm/vcpu_sbi_base.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_hsm.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_replace.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_v01.c

--
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
