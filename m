Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131F0CD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 15:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kNcBsfO6aJzGgqHPtk8bqhla1QcSFnSRD78bKfr1imM=; b=Yc9S/SQiwzDLVi
	HVKM8fTQ//F2NNN5Uvv0sPXkY5VniIN+NHDC7bYEAlDNDJ/P+fo36wRMG0Jswyo1pkadG42p8/Rs+
	g3nnOMYsupKAEJpe9TzAoVPBvLIOqbvVFETorXOJgq0UbzQ1SYXS6FT3vkjq4Qn8HKDAJ/aAgeXfU
	0kNf5D3qQA5vVjpJ5PwDZ3j9kdHT7la1ktbqGNVEWnxEgYI4E+Hm6akVuXXiG/KFdSgMjq0nOjAaQ
	xP99Gvmvo/I41x5Vk1BL3Ll9o0wUSY/83PMWhci+sgHW30lq5A3pQIervGi8KN8X+THMRmysSsUZu
	xym//W+5VWNFUdp0sCHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBql-000000037wU-0u2D;
	Wed, 13 May 2026 15:50:19 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBqh-000000037uR-32PQ
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 15:50:18 +0000
Received: from Lee.localdomain (unknown [39.152.152.253])
	by APP-01 (Coremail) with SMTP id qwCowACHMm6MnQRqEXQgEA--.35827S2;
	Wed, 13 May 2026 23:50:00 +0800 (CST)
From: Li Guan <guanli.oerv@isrc.iscas.ac.cn>
To: acme@kernel.org,
	namhyung@kernel.org
Cc: irogers@google.com,
	adrian.hunter@intel.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Li Guan <guanli.oerv@isrc.iscas.ac.cn>
Subject: [PATCH 0/3] perf build: Fix cross-arch build failures and GCC 14 warnings
Date: Wed, 13 May 2026 23:48:48 +0800
Message-ID: <20260513154851.1085334-1-guanli.oerv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CM-TRANSID: qwCowACHMm6MnQRqEXQgEA--.35827S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ArWrZr1Duw4UZFy3WF4fuFg_yoW8Ar43pF
	s8uw45Xr1DXr4Skw13Aay8WF13uaySga1Sq34ftw13Jr13tFy7tFyIyr1Yg3W7J34kJw12
	kr1qg3s8Wry5AF7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUY5l8UUUU
	U
X-Originating-IP: [39.152.152.253]
X-CM-SenderInfo: hjxd0znlorv2ny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_085016_122188_A570954D 
X-CRM114-Status: UNSURE (   7.18  )
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

This patch series addresses a set of build and linking failures encountered
when cross-compiling the perf tool for non-x86 architectures (specifically
RISC-V and ARM64), while also ensuring compatibility with stricter GCC 14
compiler checks.

The series resolves three distinct issues:

1. GCC 14 Compatibility: Fixes a -Werror=discarded-qualifiers build failure
   in the RISC-V specific code by explicitly casting strrchr() return
   values to (char *).
2. Hardware Tracing Isolation: Decouples arch-specific auxtrace objects
   (e.g., intel-pt, arm-spe) from the generic build process, preventing
   "No such file or directory" and undefined reference linker errors on
   architectures that lack these features.
3. Instruction Decoding Stubs: Provides global __weak stubs for dump_insn()
   and arch_is_uncond_branch() in builtin-script.c, resolving undefined
   reference linker errors on architectures (like RISC-V and ARM64) that do
   not yet implement hardware-specific instruction decoding.

These changes have been successfully verified via full builds across
x86_64, s390x, aarch64, and riscv64 architectures.

Li Guan (3):
  perf build: Fix cross-arch build failures by isolating auxtrace
    objects
  perf riscv: Fix discarded const qualifier error in _get_field()
  perf script: Provide weak stubs for instruction decoding

 tools/perf/Makefile.config          | 21 +++++++++
 tools/perf/arch/riscv/util/header.c |  4 +-
 tools/perf/builtin-script.c         | 22 +++++++++
 tools/perf/util/Build               | 20 ++++-----
 tools/perf/util/auxtrace.c          | 70 +++++++++++++++++++++++++++++
 tools/perf/util/auxtrace.h          |  6 +++
 6 files changed, 131 insertions(+), 12 deletions(-)

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
