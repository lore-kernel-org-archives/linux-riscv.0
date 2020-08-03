Return-Path: <SRS0=FXTp=BN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560BCC433E5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 17:59:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B00D22B45
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 17:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GUF7rWzG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="DbWXW36t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B00D22B45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AiCaMEKw1B8PzAd4IDWMzHgeeuyd6y4mfW97OknOY78=; b=GUF7rWzGj/Q5VvHJrObF+UkfIk
	6ZF7+ob7uL6ibi/E5UUoiw1kVYXXaPiHtztp2DI1Xmm/8X+2gFszWdiy5yKw9I8k7LNEUr8x0Pm1H
	4WC6YRDoi/NGIbPjZuOQDz2iNNeX+cUUw5Q7k13ExjLe3GaKqqzfEykA8UXDXgFASYJTU6A9bHmcp
	zIDPpoDlty0X0/aQBt2CVYXQMcwwMtE6ZJLA4v61RgO5YtnrOLh6VPMOy4LyQScM0oKaLH7XFo26n
	9PKeGcaM7Q9XpDjQR7fov1AQeabajOvsqIWuA3eiodjRRbV/lOd7+uYDtbi1NKfR4zhbG+IWVhC6M
	KyK7ie2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2eju-00054R-Re; Mon, 03 Aug 2020 17:59:10 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2ejq-00051f-9d; Mon, 03 Aug 2020 17:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1596477547; x=1628013547;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VOtqlyeTI7pj/+WHRY84iOltoY1CldDSHk2ut6rF0TA=;
 b=DbWXW36t4bSQYDrlLnfKHGqAvlMSTI8pfivap9e0Cl9l7HipLdhI4/E6
 atc68noaMocJoNZATpGflGv1LnDOl0bFJ7PX1A5yxuk+cQ9lu+4ST9k+1
 n4Chfqyq7+YK0AztLNQIiAD/p8rrEFQVSv9r1QMwgkSE3zfsLXPT0QMUA
 wC9y13PezquqpDdHsSweHIYHK7LKCgzfZUwWd88FJD6J4NDWb+T0+wHLH
 lB+SJ58YY350iwIhkKd6Gmymgp5aQt93yRF+7NRJzx6FN6etSR5YEjakC
 ecIEvoZjKHu6uBnmEjhsuU/TO08dzwC5FN2Dbsoge3uESluG9oxgAAbka Q==;
IronPort-SDR: eFiq/ls39xhs6D8IceGAYXtIk+rgTMCL/I/6m2qPUVoDtFAfNHHAgVxBz18h8u4ZXHHD3jMTBO
 oBHmzT+oWn1pxy8pmEJFjnnv+nVurr3NEKkOMl8skoyVa4AMZQnJ1lOlDHAmmCUNfhuM4+/ZQK
 GvLHiyXY0DJzAb4zNlGHsJk2bvDtwM/wc9qnTqiK1ktZghvXsjBp2qiRl1GD3MyfRRfTZ9V8tJ
 jb3R+ElYCNUcSlOrj7ieJH7KlibDw8egWY7ONWObjpEhqbxco18PPrBdQKDjNr5/SH+7MUF9JA
 iP8=
X-IronPort-AV: E=Sophos;i="5.75,430,1589212800"; d="scan'208";a="145273245"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Aug 2020 01:59:04 +0800
IronPort-SDR: TrN8lWpdvmlGuV71aKlpp+52+t3UjTWZMClfoTQxIWsGtZt3OVZBvvU2pe294Jz2yABmDxzpRl
 UvMNLbmZ4ELQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 10:46:25 -0700
IronPort-SDR: iZb2sq5TmobDGkm1+xth6Z7qWVDWypo/WO9cBwNRRp0XCuOe4j67qj5bOnpyao4FekVWUgDZom
 eh4CemSsEC9g==
WDCIronportException: Internal
Received: from cnf007830.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.196])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Aug 2020 10:59:03 -0700
From: Atish Patra <atish.patra@wdc.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/6] Add SBI v0.2 support for KVM
Date: Mon,  3 Aug 2020 10:58:40 -0700
Message-Id: <20200803175846.26272-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_135906_536731_C2EE262B 
X-CRM114-Status: GOOD (  14.15  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexander Graf <graf@amazon.com>,
 Thomas Gleixner <tglx@linutronix.de>
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

This series depends on the base kvm support series[2].

Guest kernel needs to also support SBI v0.2 and HSM extension in Kernel
to boot multiple vcpus. Linux kernel supports both starting v5.7.
In absense of that, guest can only boot 1vcpu.

[1] https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc
[2] http://lists.infradead.org/pipermail/linux-riscv/2020-July/001028.html

Atish Patra (6):
RISC-V: Add a non-void return for sbi v02 functions
RISC-V: Mark the existing SBI v0.1 implementation as legacy
RISC-V: Reorganize SBI code by moving legacy SBI to its own file
RISC-V: Add SBI v0.2 base extension
RISC-V: Add v0.1 replacement SBI extensions defined in v02
RISC-V: Add SBI HSM extension in KVM

arch/riscv/include/asm/kvm_vcpu_sbi.h |  32 +++++
arch/riscv/include/asm/sbi.h          |  17 ++-
arch/riscv/kernel/sbi.c               |  32 ++---
arch/riscv/kvm/Makefile               |   4 +-
arch/riscv/kvm/vcpu.c                 |  19 +++
arch/riscv/kvm/vcpu_sbi.c             | 194 ++++++++++++--------------
arch/riscv/kvm/vcpu_sbi_base.c        |  73 ++++++++++
arch/riscv/kvm/vcpu_sbi_hsm.c         | 109 +++++++++++++++
arch/riscv/kvm/vcpu_sbi_legacy.c      | 129 +++++++++++++++++
arch/riscv/kvm/vcpu_sbi_replace.c     | 136 ++++++++++++++++++
10 files changed, 619 insertions(+), 126 deletions(-)
create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi.h
create mode 100644 arch/riscv/kvm/vcpu_sbi_base.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_hsm.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_legacy.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_replace.c

--
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
