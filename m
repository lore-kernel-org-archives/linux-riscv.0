Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1295CC47089
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Dec 2022 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V7AnJUQXRphphbF6Jb9jyZcMIRCTrsR7o1rcb6vEp00=; b=P1sOyZLKaRYgaK
	rzjYSh/gxa5In/cJK1SP+6ymQSXHCoFT3j6ZXi8P+AQTO6thYpX5oAe7Pxcc7JcZ2LQfgocJBQhXk
	+EU/oupN48scoLYwmK0qYxlIwX+JEuOZ3P2i2qoOz30YcOPVomyFKMiT9PAmMqOGMd0a1/ukHVR9G
	wfsPyNcuzSpsHrBtNQgapSoAewUaGqCRp/KZzbZzHO6MIrpkx8FtV6VqAUQ9x0MqcfO5+8NMAodCo
	CIx1X1UkpwQAAAySRpaP0/TDNMgM4KM7zhRjtgIG0lMuLj0ecsXqPrJH6kcfjncw3LkXucAud1PRA
	ZRrmK0GcUmZzV2yL8mQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tHU-00A7QI-KM; Sun, 04 Dec 2022 18:00:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tE9-00A6Yq-Ep; Sun, 04 Dec 2022 17:56:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E2884B80B8C;
	Sun,  4 Dec 2022 17:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449FEC433D7;
	Sun,  4 Dec 2022 17:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670176588;
	bh=pXsh8SVW/sBp/P3v6mc5bVyqy/bCl/0yI5e+z8DIwis=;
	h=From:To:Cc:Subject:Date:From;
	b=tQtG9KFpqkqGYmeGkTRbDw7dFD2tA0xqcHOa0rvlzLlRNlTklMnnb7Hra23zr673O
	 UCxXyY7ZxAa3ZBtBTYDJeszodPtvzxBSViHCAcKhduKrmfuYT1ucDpKIVxQQLWlZPd
	 /9Fa9kenqy3+BcN/nvOQNhPzOqI6CW+73bWJsAwuB7sTGorl3ggYWGdz+JXhI2Ut44
	 NUveSgkXxxfHMYikHN1Kj5TUi2lieXGxvSO2FtsArZzbtAzrh056c/CR3gkcp3n0T2
	 DFgdkDRbbkub+pvLLVU2PtGrbkQl2iXvvfC71aTAThHCKS9kwApzekms9ahM4gjg7T
	 Cf803DYekHhSw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 00/13] riscv: improve boot time isa extensions handling
Date: Mon,  5 Dec 2022 01:46:19 +0800
Message-Id: <20221204174632.3677-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_095633_836091_17F99094 
X-CRM114-Status: GOOD (  16.35  )
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
platform, that's to say, the hart features won't change any more
after booting, this chacteristic make it straightforward to use
static branch to check one specific ISA extension is supported or not
to optimize performance.

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

 arch/riscv/errata/sifive/errata.c           |  4 +-
 arch/riscv/errata/thead/errata.c            | 11 ++-
 arch/riscv/include/asm/alternative-macros.h | 20 ++---
 arch/riscv/include/asm/alternative.h        | 14 +--
 arch/riscv/include/asm/errata_list.h        |  9 +-
 arch/riscv/include/asm/hwcap.h              | 96 +++++++++++----------
 arch/riscv/include/asm/module.h             | 15 ++++
 arch/riscv/include/asm/switch_to.h          |  3 +-
 arch/riscv/include/asm/vdso.h               |  4 +
 arch/riscv/include/asm/vdso/processor.h     |  2 +-
 arch/riscv/kernel/alternative.c             | 63 ++++++++++++++
 arch/riscv/kernel/cpufeature.c              | 82 +++---------------
 arch/riscv/kernel/module.c                  | 15 ----
 arch/riscv/kernel/setup.c                   |  2 +
 arch/riscv/kernel/vdso.c                    |  5 --
 arch/riscv/kernel/vdso/vdso.lds.S           |  7 ++
 arch/riscv/kvm/tlb.c                        |  3 +-
 17 files changed, 191 insertions(+), 164 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
