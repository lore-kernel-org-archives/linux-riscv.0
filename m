Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F901C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 03:21:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA4A860FE3
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 03:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA4A860FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8W69PDl4FfDqodmc2lFKBPdVFcGwICxRTU3fS+Qqv9Y=; b=mLoyDAtWKBCX7J
	R7LkDIQIVAMafJfNkEJBhEaT13kQqalJi7GQzY1jAvqm0E5OXSDiZxNW78dooQbjRCxBEf5Z2s9al
	0u1G5T2bbJBpvRHLw5uP9luT2CjOfjVOei0pGalBJtxZ+IL1hZDAveoUs4fDLb11iHXuurDhjUA1l
	3hV6L4wgxB7FZVC8cX60F9E4IOrVNjUywnnJ+XhC4gGHPTUfICAFTya1wxv1dWpYSvAxzjh6Tc+O5
	bPgIR697NHWE0Pex5l7ZPFGiiMmSYQkCrvNgkf2X3SaVzcQsf55ahuROP+gKf13kkbHNx7tXwkotU
	9XSvcm3b8l0SqrYgXLNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYgRA-001PUW-Gp; Fri, 08 Oct 2021 03:20:44 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYgR6-001PSG-Fi; Fri, 08 Oct 2021 03:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633663239; x=1665199239;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r5rxc6zMPQ2DYaQEjqFn2bycJ2e7Cu+Jo2WU4mJ233A=;
 b=Ong7PJQXvvSkbfp1sJEe7eb3X/btwn0RAp5KTtjbollbNLvpRvE/Ni9s
 YNZSR46MV5onvwya99hgut+QS2tx/dzfbIQMRdLTdTUiZrz20XvZFqvOe
 ZATC0AHn93Klj6s3//0ToEv2NlSogVFk04IKzzXVNNHZmjPdkTPMZFG6y
 QRZwoQRqhD6/nOzdT5dmpjbq7wJOx7e3FNxRnnrkGZlFJI92FyjdUU5rU
 ege1J0VS7l8EdDHU/Zj2G7GF0m8VfISr9uE2bZp/yvBPgOMdK6PBzr2x4
 kshIRS1DU5ExiNrICeOXjGyPhYTUwMC1+vUviOqThN6J5b7WBoUrd3xpO A==;
X-IronPort-AV: E=Sophos;i="5.85,356,1624291200"; d="scan'208";a="187014414"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Oct 2021 11:20:37 +0800
IronPort-SDR: a7Al/6hl3z5q0rrimWLwf/AxnXEiCRZi4OcG7HX+MebfI2xdyRuv5pouclmoi7KBfu8BxT6/av
 wJOq6zqbADNXzn+7YHGpEE7RqYz7LAlWvZ6WQAGr0RVCQO8ERIpuJjEPdqVJ8Fu+rbzGtEXgKl
 +shFhWUPgddE04uechyDN+Iu80azx2jV2mmeE9M7t3FzQ2PhCLqljoK51CWxoNWvN+FcZf0lZz
 3QEBz5mkErqa6NRC8YqS2bL4JUScMBY/Vp5jSzrYZtseXKlcFNU5x2Yk7h+t82f8Ks3PHhMc9y
 offuL8utXkYIVCqNFzQGR2YQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 19:54:58 -0700
IronPort-SDR: ZtCQf6or+fC78Z8QZyBs2K0CO7y3mLxtVHF9x5BnCMI3DlUT1RwacAAl+r7LdltpsHJ5znnwtm
 FfzQYGfAj314iIzIKa8g/A+mV5TquECZkTe5UzqpjpLEvLdoVmGCcMP65Dlb4q8Rm6WNRI6dRm
 /TOCGV80jcIKPRHKpvjDzIJxTLUSugb4jrFMGOuul/0NXcVN5Zebmlyhwqzi55s9tbouyOPEdT
 i/nNtgHEJUNa6jIiOA3SoC/CSfkExJc5XI6wHbQP54nWqbSrt0VZbR3nJS0G8N/Fi8YYS6XzY5
 7yY=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.125])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Oct 2021 20:20:39 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anup Patel <anup.patel@wdc.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v3 0/5] Add SBI v0.2 support for KVM
Date: Thu,  7 Oct 2021 20:20:31 -0700
Message-Id: <20211008032036.2201971-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_202040_597134_2F78EE48 
X-CRM114-Status: GOOD (  15.17  )
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

Changes from v2->v3:
1. Rebased on the latest merged kvm series.
2. Dropped the reset extension patch because reset extension is not merged in kernel. 
However, my tree[3] still contains it in case anybody wants to test it.

Changes from v1->v2:
1. Sent the patch 1 separately as it can merged independently.
2. Added Reset extension functionality.

Tested on Qemu and Rocket core FPGA.

[1] https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc
[2] https://git.kernel.org/pub/scm/virt/kvm/kvm.git/log/?h=next
[3] https://github.com/atishp04/linux/tree/kvm_next_sbi_v02_reset
[4] https://github.com/atishp04/linux/tree/kvm_next_sbi_v02

Atish Patra (5):
RISC-V: Mark the existing SBI v0.1 implementation as legacy
RISC-V: Reorganize SBI code by moving legacy SBI to its own file
RISC-V: Add SBI v0.2 base extension
RISC-V: Add v0.1 replacement SBI extensions defined in v02
RISC-V: Add SBI HSM extension in KVM

arch/riscv/include/asm/kvm_vcpu_sbi.h |  33 ++++
arch/riscv/include/asm/sbi.h          |   9 ++
arch/riscv/kvm/Makefile               |   4 +
arch/riscv/kvm/vcpu.c                 |  19 +++
arch/riscv/kvm/vcpu_sbi.c             | 208 ++++++++++++--------------
arch/riscv/kvm/vcpu_sbi_base.c        |  73 +++++++++
arch/riscv/kvm/vcpu_sbi_hsm.c         | 109 ++++++++++++++
arch/riscv/kvm/vcpu_sbi_legacy.c      | 129 ++++++++++++++++
arch/riscv/kvm/vcpu_sbi_replace.c     | 136 +++++++++++++++++
9 files changed, 608 insertions(+), 112 deletions(-)
create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi.h
create mode 100644 arch/riscv/kvm/vcpu_sbi_base.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_hsm.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_legacy.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_replace.c

--
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
