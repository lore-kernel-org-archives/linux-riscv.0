Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECFCC3DA78
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jan 2023 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o8asAvVJzvCsfDd3qA9KuOtU5hcaN8cuAWrzSg28XQU=; b=hq+y0P3+RlnK1w
	PqVLQ9cuOMTgVOJpecFnoyQpBg4T7VNkqWajbqC4BxklfLfpYG/NAGjAyVPUB2sstmfIplr1GM2gI
	ONEcdqg2Sr8Ly5+pOaCPOgoOuZBBCENveMGVNV85Z+jgPsixvNjVrBqjI2fJuxlMsf1bkrJ5Q7Wno
	GwyHz4x0PwpJ9pD7OYxtagGQOVMCW2QPSea97Gre4WUFzoQW4cQUng6mKqOiSBORMEfIecEfA7W3l
	ma1DdN/bJcWEseehvahRIZUWKmfUUTvaUQ7SBXuzG3JRe9f6N4QnmRNhIKfUd17AqbJw/SoY96YMj
	loB9kixzDOwYvjiQLD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH5Qg-007bgH-60; Sun, 15 Jan 2023 16:00:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH5Qc-007bc6-KB; Sun, 15 Jan 2023 16:00:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0C08CB80B78;
	Sun, 15 Jan 2023 16:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2731DC433F0;
	Sun, 15 Jan 2023 16:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673798411;
	bh=E+NZhD2hCGi+e43+lqEhMCRkDpuYWfFvgKHNmrbFjxs=;
	h=From:To:Cc:Subject:Date:From;
	b=fTrLoZC/tNtzy1yAhQC5tKiDcsbSjEnQflv8MplgvfWlhXA/7Vql1PkTWk0SFCM6p
	 /6dELs+DwZtzQlN+vcLfe5mHwAWe9vijw+kQgIzKWYqu3jw+GHA4bUpYZVx4MZZGTK
	 ZGCLvX0Cc9BVPyXx3rcplLNJjuT6pcNb3cgrD0YMXRl/bXiliVnXXShkdxMf0NSCvJ
	 uIv6DiTarFAnNhCcRGaORh9qCWyHeblRmyw3keBYCOQzrL5OGwwiFznzWi9Yp/tft7
	 35Th42qu6O/oDoFMbjQUpiTyxbit0gIG+jZwkHslVR87Mc5BdGmPL1ASaFWcPoHXat
	 ycv58ip3taVNA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v4 00/13] riscv: improve boot time isa extensions handling
Date: Sun, 15 Jan 2023 23:49:40 +0800
Message-Id: <20230115154953.831-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_080015_137134_78602187 
X-CRM114-Status: GOOD (  17.45  )
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

Generally, riscv ISA extensions are fixed for any specific hardware
platform, so a hart's features won't change after booting, this
chacteristic makes it straightforward to use a static branch to check
a specific ISA extension is supported or not to optimize performance.

However, some ISA extensions such as SVPBMT and ZICBOM are handled
via. the alternative sequences.

Basically, for ease of maintenance, we prefer to use static branches
in C code, but recently, Samuel found that the static branch usage in
cpu_relax() breaks building with CONFIG_CC_OPTIMIZE_FOR_SIZE[1]. As
Samuel pointed out, "Having a static branch in cpu_relax() is
problematic because that function is widely inlined, including in some
quite complex functions like in the VDSO. A quick measurement shows
this static branch is responsible by itself for around 40% of the jump
table."

Samuel's findings pointed out one of a few downsides of static branches
usage in C code to handle ISA extensions detected at boot time:
static branch's metadata in the __jump_table section, which is not
discarded after ISA extensions are finalized, wastes some space.

I want to try to solve the issue for all possible dynamic handling of
ISA extensions at boot time. Inspired by Mark[2], this patch introduces
riscv_has_extension_*() helpers, which work like static branches but
are patched using alternatives, thus the metadata can be freed after
patching.


Since v3
 - collect Reviewed-by tag and remove Heiko's reviewed-by from patch5
 - address Conor and Andrew comments
 - fix two building errors of !MMU and RV32 

Since v2
 - rebase on riscv-next
 - collect Reviewed-by tag
 - fix jal imm construction
 - combine Heiko's code and my code for jal patching, thus add
   Co-developed-by tag
 - address comments from Conor

Since v1
 - rebase on v6.1-rc7 + Heiko's alternative improvements[3]
 - collect Reviewed-by tag
 - add one patch to update jal offsets in patched alternatives
 - add one patch to switch to relative alternative entries
 - add patches to patch vdso

[1]https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
[2]https://lore.kernel.org/linux-arm-kernel/20220912162210.3626215-8-mark.rutland@arm.com/
[3]https://lore.kernel.org/linux-riscv/20221130225614.1594256-1-heiko@sntech.de/


Andrew Jones (1):
  riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()

Jisheng Zhang (12):
  riscv: fix jal offsets in patched alternatives
  riscv: move riscv_noncoherent_supported() out of ZICBOM probe
  riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
  riscv: hwcap: make ISA extension ids can be used in asm
  riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA
    extensions
  riscv: introduce riscv_has_extension_[un]likely()
  riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
  riscv: module: move find_section to module.h
  riscv: switch to relative alternative entries
  riscv: alternative: patch alternatives in the vDSO
  riscv: cpu_relax: switch to riscv_has_extension_likely()
  riscv: remove riscv_isa_ext_keys[] array and related usage

 arch/riscv/errata/sifive/errata.c           |  3 +-
 arch/riscv/errata/thead/errata.c            | 11 ++-
 arch/riscv/include/asm/alternative-macros.h | 20 ++---
 arch/riscv/include/asm/alternative.h        | 17 ++--
 arch/riscv/include/asm/errata_list.h        |  9 +-
 arch/riscv/include/asm/hwcap.h              | 97 +++++++++++----------
 arch/riscv/include/asm/insn.h               | 27 ++++++
 arch/riscv/include/asm/module.h             | 16 ++++
 arch/riscv/include/asm/switch_to.h          |  3 +-
 arch/riscv/include/asm/vdso.h               |  4 +
 arch/riscv/include/asm/vdso/processor.h     |  2 +-
 arch/riscv/kernel/alternative.c             | 56 ++++++++++++
 arch/riscv/kernel/cpufeature.c              | 78 +++--------------
 arch/riscv/kernel/module.c                  | 15 ----
 arch/riscv/kernel/setup.c                   |  3 +
 arch/riscv/kernel/vdso.c                    |  5 --
 arch/riscv/kernel/vdso/vdso.lds.S           |  7 ++
 arch/riscv/kvm/tlb.c                        |  3 +-
 18 files changed, 214 insertions(+), 162 deletions(-)

-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
