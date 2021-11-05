Return-Path: <SRS0=deyN=PY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AA1C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 23:59:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D718611C4
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 23:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D718611C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cLcjBxzIEdzkwDI87tqZIxeLHohSOvZbLlxI/gOxcs8=; b=11UNTn4kwV5rRG
	dC+O4k9jBUWvvR+8uC5KjvXlNp7uio514oOpoApPndVDA5gmKnSaoyD/gVkBisODF2LdwXtfLnEf+
	dYP65MX/JapFgSJbbvmkrdy2fVlzFd4JbF9nzGqInMEFf6OyfkRekyZKG0XM3HcRdE8l7F9U0tdWx
	Zl+NZRlXuc2+3JIdJGjc8r6QrgIekoZJBcD+ZmEv54pzi/rdoj41N6ek5w3GCrZdUgmT7nPyxqw4V
	fhlCZp4xGn4bCPhvtPiPSIuWPcT+9SPYHEEKfLmuFLhqe6gWzD/pz6MoyaK+hcXutV/gK3Cw8EFjr
	R870/ybg4UVA1kMKSwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj96y-00CSsr-53; Fri, 05 Nov 2021 23:59:08 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj96u-00CSpw-Le; Fri, 05 Nov 2021 23:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1636156744; x=1667692744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=99tlQEW6k3Si5SmCi7kC9BJb5Z29vH7T9LwAGl2NsGA=;
 b=ftjNwBewuAdL26ihmo7Y70yklZi/jgnPbRSofzUo+vgATyuou/ZJvl8E
 R//5VeVK6AFgeyD1UWban5Qwd+eyPwO37w0eDhH+Z/KGpLNLLVpZ1gTg9
 hrEY/BPayEVoVGpsOegOjNtMmDQ38jhm8RX5tifIGZa221dbpZjI66xXE
 Cpn8pRfq+lEEPx+gk0HIRgDgHvAlaKjy6EDe0og1dATAzAuj7jMEe2fUt
 ww4FcJFcu2jEED9GwtaH1BrWefUu5uq9s/+7fxPtiTD5DVMWiKGzAAkbt
 5Mfg4zVSUD3lbc3uCAirVkyYYMxuV2w6S81g33z4456B4ombzujmXiasH A==;
X-IronPort-AV: E=Sophos;i="5.87,212,1631548800"; d="scan'208";a="183840498"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Nov 2021 07:59:01 +0800
IronPort-SDR: 0MZ8gF2fTb+xBglnHtRL5d+CauSpdxUGKxn6RMCjYmrBFWfR939mZKlwyUkHC70BzIkgGFpjbC
 Ii+QrMA4n+Ms39JXrOoKDzmtVWyUV7chB49yiXHgB/RBnbT3HjAKPywZMXTwyfSCYv6iN51crE
 Cl46pbFAwg7g6hoIEMbAwj0Z9B8MwLJ2DpiEktFGsCwsYmfvGkMOSItOEurHqMAAc0n8DqBcGU
 bGWyCM8XB2J+5Hy2aqupOnUznme/WIlTa2uCJHd70bwMoY1NOa4AvyY2jeWG++GniDLR3Klnch
 tNgxVUBG2cABzmFdISSf3HFH
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 16:32:45 -0700
IronPort-SDR: Mp7jK/DwqabApqMFT4YQ7uvsQsRaOpx8l+aziVIk3tgrEOjpwBNQRlOwK1xks2tETfJheuqooL
 ijNN7igjkGgsosM5ZsHurYMnUSeepWtvRpHvt6E8b3qf6y49Ibxn2F9bhvZUJo2KyMH7pPikYi
 yOdTIGXQ73LfH2/w6z3zXS4S5mFU9dtstzhu0tgZnkiWYpbHUDOdh9xG9pXI3An40sXrvnT3sa
 Jua4FPQUjNqLzEPG0iDM7TdAqzI+JD716RII9ttKBG7jnB3xGkL4BvJ25nX40vfTXrepP8dtPq
 bPk=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.48])
 by uls-op-cesaip02.wdc.com with ESMTP; 05 Nov 2021 16:59:01 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>, pbonzini@redhat.com,
 Sean Christopherson <seanjc@google.com>
Subject: [PATCH v4 0/5] Add SBI v0.2 support for KVM
Date: Fri,  5 Nov 2021 16:58:47 -0700
Message-Id: <20211105235852.3011900-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_165904_805469_9891FBC1 
X-CRM114-Status: GOOD (  15.12  )
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
[3] https://github.com/atishp04/linux/tree/kvm_sbi_v03_reset
[4] https://github.com/atishp04/linux/tree/kvm_sbi_v03

Atish Patra (5):
RISC-V: KVM: Mark the existing SBI implementation as v01
RISC-V: KVM: Reorganize SBI code by moving SBI v0.1 to its own file
RISC-V: KVM: Add SBI v0.2 base extension
RISC-V: KVM: Add v0.1 replacement SBI extensions defined in v02
RISC-V: KVM: Add SBI HSM extension in KVM

arch/riscv/include/asm/kvm_vcpu_sbi.h |  33 +++++
arch/riscv/include/asm/sbi.h          |   9 ++
arch/riscv/kvm/Makefile               |   4 +
arch/riscv/kvm/vcpu.c                 |  23 +++
arch/riscv/kvm/vcpu_sbi.c             | 206 ++++++++++++--------------
arch/riscv/kvm/vcpu_sbi_base.c        |  73 +++++++++
arch/riscv/kvm/vcpu_sbi_hsm.c         | 107 +++++++++++++
arch/riscv/kvm/vcpu_sbi_replace.c     | 136 +++++++++++++++++
arch/riscv/kvm/vcpu_sbi_v01.c         | 129 ++++++++++++++++
9 files changed, 609 insertions(+), 111 deletions(-)
create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi.h
create mode 100644 arch/riscv/kvm/vcpu_sbi_base.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_hsm.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_replace.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_v01.c

--
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
