Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692A9C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 07:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D7cGpb8AWMKk908slH8pv98G3l7b6pNY6F5NoJ/knrA=; b=zIX3mOWFayW0T0
	4XL0IfK52t5ChhhUxQtENmA6qDbGeWRWLrltpujbaUwj3EJNAQ/dQOC9+75OpSrj2H/ipeV7qKtbE
	1hhJpuqLdyhObjpQNXJ4RA+eMqE9X0j6FqrRHNCjRs/1K37vNif0PsadcpyhBuQs4eMc1Bo/G3kF6
	jc9sUajrM9c1dCxW39AYjXvMeBoF0vTGhjNFnTGbX+bdSht/8dEm7xzRTggmMIWP4UNUIHyqxa2jK
	t749oVK52gQKYCByAp39dL+uglXf1jKACBCXUm34a0OctniJZq7+URYJNEBe63ekYwKfdpaHWceZr
	AbEliXitgq/I81AFog+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogL8k-000MTs-Uv; Thu, 06 Oct 2022 07:17:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogL8h-000MTI-Pl
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 07:17:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 226356182A;
	Thu,  6 Oct 2022 07:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683D1C433C1;
	Thu,  6 Oct 2022 07:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665040670;
	bh=WNXmYjwN1rHUu/M3HLQ1TTrTsskFX86T4eU0bZFneQM=;
	h=From:To:Cc:Subject:Date:From;
	b=Tff/cDKpkitEOwG+wbPBfQtl6wMHqCnclaEC6GGgjKtuQd/rA1V8kliapr7w1rHlB
	 WeUkCO+/gfZx92hgNxuXUDI87ge2OBowNoaflvRYfFPWHsXmRgifK1vX74PmBCuOoZ
	 3VqnVy/vciUHKFLC4Jnqhj9SmZCjBFV6+WJH5MOzcMmuYG/u3VFSOPPWMICgsNV7ey
	 SDn+hMv7eAi+VC865LGADpTBnbo4Ua5sPCSwil8IAor2e0YXull3q/t2OZgCPHBW2m
	 Ylov5M7AlfDK482i6+ol6E7NSNXrzzuaSxyJRY2VcIwu5ztJaW9cJQ8EWCryiGl2Yq
	 PGgyCq7wBcKGw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] riscv: improve boot time isa extensions handling
Date: Thu,  6 Oct 2022 15:08:10 +0800
Message-Id: <20221006070818.3616-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_001751_889712_52E11CCA 
X-CRM114-Status: GOOD (  12.20  )
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

[1]https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
[2]https://lore.kernel.org/linux-arm-kernel/20220912162210.3626215-8-mark.rutland@arm.com/


Jisheng Zhang (8):
  riscv: move riscv_noncoherent_supported() out of ZICBOM probe
  riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
  riscv: hwcap: make ISA extension ids can be used in asm
  riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA
    extensions
  riscv: introduce riscv_has_extension_[un]likely()
  riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
  riscv: cpu_relax: switch to riscv_has_extension_likely()
  riscv: remove riscv_isa_ext_keys[] array and related usage

 arch/riscv/include/asm/errata_list.h    |  9 +--
 arch/riscv/include/asm/hwcap.h          | 94 ++++++++++++++-----------
 arch/riscv/include/asm/switch_to.h      |  3 +-
 arch/riscv/include/asm/vdso/processor.h |  2 +-
 arch/riscv/kernel/cpufeature.c          | 78 +++-----------------
 arch/riscv/kernel/setup.c               |  4 ++
 6 files changed, 71 insertions(+), 119 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
