Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E8EC2A09B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 03:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z1in1RFAwC/cbF1NreNVgQP2weOswFg1NhVxCK31fsE=; b=Jhn9qvqsxOl4jU
	keRlM3NPF5H858RZDZwDp2V2ov5JYi37R3csO6axHmtUaCkQt4IoxmgFcw+MRRiE/DvEQcicOECfR
	6V0CFRZ5xh+CkSrSjP6AhDlt8p04shxgbFl+PYQMbMB0pcIPiSNbO1gMqvy31RUr5Xzc92O2yzq/N
	BiIzJB1rFsHl0TE41YfDKfrv36GgAhif5CyRFxkzfriEAw5ZRue9awAO5PpS6GvyXqikTAo4taRjl
	vzVZEpTrlLqawcDHPpJDLg1tYx54SUZ8QdPsnRC6Fw9OkCqYDqOjwJlzpuYGHQgXmx1dZFZzVX//S
	5q/0Bv4c9xqHTe/vPAMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsBbs-000000073GE-0lJH;
	Fri, 07 Aug 2026 03:51:04 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsBbp-000000073FW-0QTn
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 03:51:03 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84847482584so1229119b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2026 20:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786074660; x=1786679460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SDjiRmYitCVi6Po+hNUTG0dnEo7TwlYi6LDldiPSa4E=;
        b=OHFSeKirINVER3lR5TZ7EdJtI6LHRaLB58DbcWIAWGCo+YUepm9IC3MBhIFeK7HXVQ
         5yT2Gt7bUANZ5p3gkrJwAf2fHN2jYrwlOwpyb/6Lb/c3e5YhhtPkR1WrFZ9v6/rN52HX
         NNv6zHGnN3eFsOOO71+oCy3aioDgdexlpwIZRv/7cr7B9pTj6xKqnyNuDhIOWRG0CKzz
         D/VNEeVZ8cEPOQM74TiwD4RjITNJCTaSINj2rDm9PoDG3QJ2khh2xmrlHmpdJ4H5SVcW
         wybt3JrhuBdxPTBDqgcxIUa5NfnBBdOGLayerya0t7a/Uv4qjx2xxHlU6ZiVLdNivGIj
         M/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786074660; x=1786679460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDjiRmYitCVi6Po+hNUTG0dnEo7TwlYi6LDldiPSa4E=;
        b=kjO9KLVrXvs6Lf1AvuoynHbfTO5vHhRED0FBeku3tnY7nxBItcVgE/2JLcnOcVI96o
         kiUD09+fh3TFZr/SROxrYiRJJRNXz6FmF1fcTbaRQYn7RC+dkTQThF/McyXcYEBFyfKz
         zCFCJHzKXsjliUGiozTDpicSLr7yT/sB1z1nYl85EP8ivZKgUqIFoh42dEufAOyMgUqI
         JgxNajilTKCmh6EHCU/weVxTZQGyIJ22iD/JPae2IKxWLOIPdlyqpvuhOG+YWbF2yQUr
         MYctAMnDJbqK3xO7MaLtPYY5aq6OR04V/IWR6elgn+rzFwpFpBxftAlW9/Anja8HW5Hb
         pRrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqds/lXtNV46CCLY1NHGNDv8S49C0k3tdQLjObNtXLX8JNRbQt0eU3OkQZWyb390O005leXXi53NtYdoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDXC4EHWP2qmdVdFGi+4cFvqTGM7Vi94guuLYtl8TxJe67ffHy
	5+qAIQWRwR7FZiRYXNnX76Si5QYptmoLXAvSmGdBZDXF3oXjlApvWN9m
X-Gm-Gg: AR+sD13weMjKm7PQulVcg6pf3S/JRqYW6xaPuWeFTFNXv/dzMU8x5+moFd36Cvsac2A
	iivbseNxWFhgTTorFKBbT66A2zbGO8bJ+xWzMdem1fIYJptA2HeD9zx5Odz7bqkv+hdu9GMA49g
	OxbVl+yyvgu0tHp717aqDooSJuvD8qOOJ5hkZ/ZJBhmArrjdhwwb0XvFZWm/c7mHtAVYKszOvXX
	t+KmMbMG7LGeHlwZ++oBrwHT7t2b05HNwndIsw7VqSSmj+gaP09nVXn6sD2JpffA+EOgM2qHW40
	BWuL8AbqjMXqCNa+EUMwv0Vha+YCw8D6QgGlwvDvDt0bPlqxc6v4BISyBLHbsfTUKdhVp/m2ScB
	wg5NJDzdUhB7qc1lFFdZhtRPpciYC+UU8xEEScFYvZX1BSY5NOwGKUDabbfVfFu2kvIX+3NcyQo
	+o7cmYJ8Yx0nF7tG/Rod+hsCF5BpDvXBTvAYsjiHcxLBDCrCbSNv79CeS/+8MFQj4HNNNV7p+nF
	Mp8sUQ=
X-Received: by 2002:a05:6a00:a117:b0:837:f111:b70 with SMTP id d2e1a72fcca58-84f41ba5757mr14013802b3a.4.1786074659915;
        Thu, 06 Aug 2026 20:50:59 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3d0d96sm287586b3a.18.2026.08.06.20.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 20:50:59 -0700 (PDT)
From: "Yuhang.chen" <yhchen312@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	pbonzini@redhat.com,
	shuah@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhouquan@iscas.ac.cn,
	"Yuhang.chen" <yhchen312@gmail.com>
Subject: [PATCH 0/2] RISC-V: KVM: Add PMU event filter support
Date: Fri,  7 Aug 2026 11:50:37 +0800
Message-Id: <20260807035039.294998-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_205101_145738_A5C9CE09 
X-CRM114-Status: UNSURE (   9.27  )
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

This series adds PMU event filter support to RISC-V KVM, allowing a
userspace VMM to restrict which SBI PMU events a guest is permitted to
program.

The KVM_SET_PMU_EVENT_FILTER ioctl and KVM_CAP_PMU_EVENT_FILTER already
exist as generic KVM uAPI (include/uapi/linux/kvm.h); RISC-V KVM does
not yet implement them.  Wiring them up lets a VMM limit a guest's PMU
event access, which is useful for sandboxing and for withholding host
PMU events the host does not intend to expose.

Patch 1 implements the kernel side: the uapi struct, the ioctl handler
with an SRCU-protected filter, enforcement in
kvm_riscv_vcpu_pmu_ctr_cfg_match() (a disallowed event fails with
SBI_ERR_NOT_SUPPORTED), and advertisement of KVM_CAP_PMU_EVENT_FILTER.

Patch 2 adds a selftest that covers the ALLOW/DENY semantics with the
event in and out of the list, filter clearing, and ioctl argument
rejection (EINVAL/E2BIG).

Testing: built and run under QEMU TCG with nested KVM (an L1 KVM host
running an L2 guest).  The selftest (patch 2) passes - all ALLOW/DENY
and argument-validation cases behave as expected - and dmesg stays
clean throughout the run.

Based on v7.2-rc2 (a635d6748234).

Assisted-by: YuanSheng:deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Yuhang.chen <yhchen312@gmail.com>

Yuhang.chen (2):
  RISC-V: KVM: Add PMU event filter support
  RISC-V: KVM: selftests: Add PMU event filter test

 arch/riscv/include/asm/kvm_host.h             |   3 +
 arch/riscv/include/uapi/asm/kvm.h             |  20 ++
 arch/riscv/kvm/vcpu_pmu.c                     |  28 +++
 arch/riscv/kvm/vm.c                           |  66 +++++-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/riscv/pmu_event_filter_test.c         | 199 ++++++++++++++++++
 6 files changed, 316 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/riscv/pmu_event_filter_test.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
