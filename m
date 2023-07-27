Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2DEC0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 07:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0OyGjzOYx4EP8E0APVDdPbWxf5hUPj776ZrzbJT+68Q=; b=YoFKLP9zQ2YufU
	tKqCyn5Wrfl9vMsOKvAS8dNnJG1FNMAI7aZPzVBuzSodzBgmSuaTzNCP7jeSKjCEzI5jqzJQHktPi
	hfAeoyf6IKM7p7l3few31yOkJK7uFLTt1mYgnyU9CywbPDDMP0kwEHvM/jw/zEoNvuVWZ2AE1+lbJ
	THYlEnQzilGBHgwHzIkuzEeeyhrOxeenvnawHUhK06DM3Cyb36SR5EJqVkIm8TsymwNcDZUv/ewJf
	SqF+g5zADXnK9jKH9REiniFzMHLKJ5OTR8mjpIhUcy3P8iL4MukqeeQHNaZBzpSkp5h7Fh1Zlgk73
	37OcrvlDUxzh3ZyXC2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOvCU-00CR15-16;
	Thu, 27 Jul 2023 07:14:18 +0000
Received: from mga04.intel.com ([192.55.52.120] helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOvCR-00CR0M-0e;
	Thu, 27 Jul 2023 07:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690442055; x=1721978055;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BAACILCTxyqMs2Tae391dkKNJN/XDjDizeOYFsgg42A=;
  b=KgLZZgrQZ0MBiP8+Do7NEjlNB/+SDTuLS3mYqcCPAtRxGxkciT/lpQ1Z
   q3UEp1iCTMAvNwAi1Nq792WFOGwHHz4btnjX9t1L4ViZOnBXnVugO9SM6
   TqP1IRc57j3i/qTumc/qRQWW1WbR/JfR+9X+I2QX9ECrcqQcRv5tnYcRb
   7nXqhJZlhz8TAv/3mNEYt3RSOsd4NFbcQ5/k0wscso/eYm2ArTHR7h04p
   +kMvr6a3Sju3v14Ef1Uj7jTcwSH0yaDLkjG3nSkePCYsqZAQ9QC3ROdUD
   Zcf9FkfHcvlcQGOd5Xsca85Nxqk2JKnqQoerLAMuqbBo9Kb5lkAuatLqh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="367102056"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="367102056"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 00:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="720785797"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="720785797"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 00:14:08 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	haibo1.xu@intel.com,
	ajones@ventanamicro.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Sean Christopherson <seanjc@google.com>,
	Vipin Sharma <vipinsh@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Andrew Jones <andrew.jones@linux.dev>,
	Vishal Annapurve <vannapurve@google.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH 0/4] RISCV: Add kvm Sstc timer selftest
Date: Thu, 27 Jul 2023 15:20:04 +0800
Message-Id: <cover.1690364259.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_001415_255266_FF57FE7B 
X-CRM114-Status: UNSURE (   7.03  )
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

The sstc_timer selftest is used to validate Sstc timer functionality
in a guest, which sets up periodic timer interrupts and check the
basic interrupt status upon its receipt.

This KVM selftest was ported from aarch64 arch_timer and tested
with Linux v6.5-rc3 on a Qemu riscv64 virt machine.

Haibo Xu (4):
  tools: riscv: Add header file csr.h
  KVM: riscv: selftests: Add exception handling support
  KVM: riscv: selftests: Add guest helper to get vcpu id
  KVM: riscv: selftests: Add sstc_timer test

 tools/arch/riscv/include/asm/csr.h            | 127 ++++++
 tools/testing/selftests/kvm/Makefile          |   2 +
 .../selftests/kvm/include/riscv/processor.h   |  76 ++++
 .../selftests/kvm/include/riscv/sstc_timer.h  |  70 ++++
 .../selftests/kvm/lib/riscv/handlers.S        | 101 +++++
 .../selftests/kvm/lib/riscv/processor.c       |  74 ++++
 .../testing/selftests/kvm/riscv/sstc_timer.c  | 382 ++++++++++++++++++
 7 files changed, 832 insertions(+)
 create mode 100644 tools/arch/riscv/include/asm/csr.h
 create mode 100644 tools/testing/selftests/kvm/include/riscv/sstc_timer.h
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/handlers.S
 create mode 100644 tools/testing/selftests/kvm/riscv/sstc_timer.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
