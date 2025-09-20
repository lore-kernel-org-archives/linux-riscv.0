Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AFACAC5A7
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 23:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iRW0pWAejTbk8ElZVY5YizZVRudlYkhzisnRZJKwUTk=; b=TQOtRnlmbjiXTk
	A7wwp+8FAbP4dFt+9emn8kThFPN0qbdfUKgR6KAibBJgPMIP54UJQRLTFJoOCaW3fAiaLzQUx33gH
	MNqS9TF5fMNP27pfLBwV5zJl40CTzvpNqNc1WVZB0cdE51JKaznErRt3wfEuKIvADZ4G0PpC4HE15
	9Mh7zi1xNqZxNsOfWzkXjWblyiKgF10WcfMfvSVsViw8wIkP1nGmHux3AsyF0+cozQT4pEgV+n2bG
	WLBZQlQ5dw/wEP76JrK7pkt0dZ0DcYDEPP5PWIsh4tRwjXKQJYi2dA4g0SVDulFvq7cFyw4PY8xBG
	4iJKAckErxUZN8cWHdgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v07N7-000000065tE-47Jt;
	Sat, 20 Sep 2025 23:52:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v07N4-000000065sg-2rSV
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 23:52:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DDE4402FA;
	Sat, 20 Sep 2025 23:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65C0C4CEEB;
	Sat, 20 Sep 2025 23:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758412322;
	bh=ZoD/cqLIPrBYReuhPFTFJ9c8GRJBw2et4Fjogl70Y9Q=;
	h=From:Subject:Date:To:Cc:From;
	b=k/8kqP34ENiiawVlQ0KtmjuAF7YmdLyLGAC2ikbUtZqJPd7tSUxLly9x5Kf+RmkJa
	 FN9SZuQb1EeZSs0USjeFN1nqOQTxT/3Bxb+crl03I+ZACup5rszLilCaOsdgUYZYsU
	 J1PmMTIFlwBe29D+41e1sK+dObJNqc/So4dt1GFLW/og+d5mYp3FKV0JcSicQrP9lb
	 X/D0D0U8aCv8qJOhfB48bGCVMUB+qOmbvnfpMTZ0yHFDZClxwKHN6bcDyH2fv+PUq8
	 btypFV3Nt3ZeMbByoAAts0X/uMLnHxHDqafzpB+o0STV3b7Uv6mZarycFSPKoGW25u
	 2Z8uBLrQc+4dA==
From: Drew Fustini <fustini@kernel.org>
Subject: [PATCH v3 0/3] RISC-V: Detect Ssqosid extension and handle srmcfg
 CSR
Date: Sat, 20 Sep 2025 16:51:41 -0700
Message-Id: <20250920-ssqosid-v6-17-rc5-v3-0-5093162922d8@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA0+z2gC/x3MSQqAMAxA0atI1gZixfEq4qK2UbNxaKAIxbtbX
 L7F/wmUg7DCWCQIHEXlPDLqsgC322NjFJ8NhkxDAw2oep8qHmOLVYfBNbg6R0vb246sgdxdgVd
 5/uc0v+8HVZiqz2MAAAA=
X-Change-ID: 20250909-ssqosid-v6-17-rc5-fcc0b68a70a2
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 James Morse <james.morse@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, guo.wenjia23@zte.com.cn, 
 liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Drew Fustini <fustini@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_165202_772156_AEFEACC7 
X-CRM114-Status: GOOD (  18.10  )
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

This series adds support for the RISC-V Quality-of-Service Identifiers
(Ssqosid) extension [1] which adds the srmcfg register. This CSR 
configures a hart with two identifiers: a Resource Control ID (RCID)
and a Monitoring Counter ID (MCID). These identifiers accompany each
request issued by the hart to shared resource controllers.

Background on RISC-V QoS:

The Ssqosid extension is used by the RISC-V Capacity and Bandwidth
Controller QoS Register Interface (CBQRI) specification [2]. QoS in
this context is concerned with shared resources on an SoC such as cache
capacity and memory bandwidth. Intel and AMD already have QoS features
on x86 and ARM has MPAM. There is an existing user interface in Linux:
the resctrl virtual filesystem [3].

The srmcfg CSR provides a mechanism by which a software workload (e.g.
a process or a set of processes) can be associated with an RCID and an
MCID. CBQRI defines operations to configure resource usage limits, in
the form of capacity or bandwidth. CBQRI also defines operations to
configure counters to track the resource utilization.

Goal for this series:

These two patches are taken from the implementation of resctrl support
for RISC-V CBQRI. Please refer to the proof-of-concept RFC [4] for
details on the resctrl implementation. More recently, I have rebased
the CBQRI support on mainline [5]. Big thanks to James Morse for the
tireless work to extract resctrl from arch/x86 and make it available
to all archs.

I think it makes sense to first focus on the detection of Ssqosid and
handling of srmcfg when switching tasks. It has been tested against a
QEMU branch that implements Ssqosid and CBQRI [6]. A test driver [7]
was used to set srmcfg for the current process. This allows switch_to
to be tested without resctrl.

Changes in v3:
 - Fix parameter in __switch_to_srmcfg() when CONFIG_RISCV_ISA_SSQOSID
   is not set to avoid error in clang. This does trigger checkpatch
   warning about "Argument '__next' is not used in function-like macro"
   but it seems that '__switch_to_srmcfg(__next)' is needed to avoid
   the error that LKP reported. '__switch_to_srmcfg()' will trigger a
   build error in clang.
   https://lore.kernel.org/oe-kbuild-all/202509162355.wByessnb-lkp@intel.com/
 - Improve description of ssqosid in extensions.xml
 - Link to v2: https://lore.kernel.org/linux-riscv/20250915-ssqosid-v6-17-rc5-v2-0-2d4b0254dfd6@kernel.org/

Changes in v2:
 - Restore the per-cpu fix from RFC v2 that was missed in v1:
   change DEFINE_PER_CPU to DECLARE_PER_CPU in qos.h and move
   DEFINE_PER_CPU to qos.c
 - Introduce a patch that adds Ssqosid to riscv/extensions.yaml
 - Link to v1: https://lore.kernel.org/r/20250910-ssqosid-v6-17-rc5-v1-0-72cb8f144615@kernel.org

Changes in v1:
 - Rename all instances of the sqoscfg CSR to srmcfg to match the
   ratified Ssqosid spec
 - Link RFC v2: https://lore.kernel.org/linux-riscv/20230430-riscv-cbqri-rfc-v2-v2-0-8e3725c4a473@baylibre.com/

Changes in RFC v2:
 - change DEFINE_PER_CPU to DECLARE_PER_CPU for cpu_sqoscfg in qos.h to
   prevent linking error about multiple definition. Move DEFINE_PER_CPU
   for cpu_sqoscfg into qos.c
 - renamed qos prefix in function names to sqoscfg to be less generic
 - handle sqoscfg the same way has_vector and has_fpu are handled in the
   vector patch series
 - Link to RFC v1: https://lore.kernel.org/linux-riscv/20230410043646.3138446-1-dfustini@baylibre.com/

[1] https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
[2] https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
[3] https://docs.kernel.org/filesystems/resctrl.html
[4] https://lore.kernel.org/linux-riscv/20230419111111.477118-1-dfustini@baylibre.com/
[5] https://github.com/tt-fustini/linux/tree/b4/cbqri-v6-17-rc5
[6] https://github.com/tt-fustini/qemu/tree/riscv-cbqri-rqsc-pptt
[7] https://github.com/tt-fustini/linux/tree/ssqosid-v6-17-rc5-debug

Signed-off-by: Drew Fustini <fustini@kernel.org>
---
Drew Fustini (3):
      dt-bindings: riscv: Add Ssqosid extension description
      RISC-V: Detect the Ssqosid extension
      RISC-V: Add support for srmcfg CSR from Ssqosid ext

 .../devicetree/bindings/riscv/extensions.yaml      |  6 ++++
 MAINTAINERS                                        |  7 ++++
 arch/riscv/Kconfig                                 | 17 +++++++++
 arch/riscv/include/asm/csr.h                       |  8 +++++
 arch/riscv/include/asm/hwcap.h                     |  1 +
 arch/riscv/include/asm/processor.h                 |  3 ++
 arch/riscv/include/asm/qos.h                       | 41 ++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h                 |  3 ++
 arch/riscv/kernel/Makefile                         |  2 ++
 arch/riscv/kernel/cpufeature.c                     |  1 +
 arch/riscv/kernel/qos/Makefile                     |  2 ++
 arch/riscv/kernel/qos/qos.c                        |  5 +++
 12 files changed, 96 insertions(+)
---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250909-ssqosid-v6-17-rc5-fcc0b68a70a2

Best regards,
-- 
Drew Fustini <fustini@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
