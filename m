Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27F7D715F8
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 23:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cQ3eCDVUPJmArrxl3n/LZ7eTzKZo+v6QUOtZKZcp1IA=; b=e2Ag7sRnE9b0wF
	JuiKFPmyDpSULKRYcy/SmKg0Xmqwb2bcMgKWe1zTOhpmGSPEu7byA56Nse4FXGx1sU9sxHb+YV/CQ
	OvDyUSxSHUv7NqdDif92gw8tGGs+VTQ8nGmmkSXZCRFDfN+Hfh9PWw5GVcRhgTEP/xzFR1J42MtE3
	UFMMJbqKYlxiZohcObdym4/EPOaon4knCrOe84S0ozFq3IPELGqQrBi/Tn6Q/xwjvrQVVK8MYrT/J
	tYC6RaBw3GY5FJdslyjdqGLqK7uvOTGjhDppQDBTzIZpiO+U+/02LXJKb1/6ELfiSvtGHhfU/g4We
	jOvY5wEbRnKCvhjPunyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjmwh-0000000Ah3g-1bJH;
	Sat, 24 Jan 2026 23:21:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjmwf-0000000Ah3J-1lpX
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 23:21:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D15C43FCD;
	Sat, 24 Jan 2026 23:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033FFC19421;
	Sat, 24 Jan 2026 23:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769296892;
	bh=Se+XgkrMv5HfloTeudL4/5zk4ovq+p9aIUYDgD9jhW0=;
	h=Date:From:To:cc:Subject:From;
	b=d3mDGNK703aa4KOM9Pz7rjI11v05b/dhklAjUWMYTbrrUoazzS5JH67KEmXN4FK3m
	 CpspSzMfksgziMabD0AYvN21u7TKqYH3i+X9GaPfxsgLS9RD6gEos0Kw6A0lFQNw3d
	 +LUQUzAG5BQEue12h0VYgkTnqRQvQBmT+FxqCXMHKZ/muXVNLPuLLx+1YxUewcgmrf
	 WncreHql2GyC3oRt9814bAZKlbk60J2W+0abNkBxn0wUQLlyhxVwM5agFuQSUNUYTP
	 4tT3m6vQ76xe0SI4950cD1kO1u8imXwQWdNzwtgJgEwoPwlnypiAgtH3anSnZtR0og
	 1YKE9C+7UAZHw==
Date: Sat, 24 Jan 2026 16:21:29 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V updates for v6.19-rc7
Message-ID: <081aefd5-d47d-8397-693a-3e0a3c73783e@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_152133_480182_2A20D10D 
X-CRM114-Status: GOOD (  10.88  )
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

Linus,

Please pull these RISC-V fixes for v6.19-rc7.  

The notable changes here are the three RISC-V timer compare register 
update sequence patches.  These only apply to RV32 systems and are related 
to the 64-bit timer compare value being split across two separate 32-bit 
registers.  We weren't using the appropriate three-write sequence, 
documented in the RISC-V ISA specifications, to avoid spurious timer 
interrupts during the update sequence; so, these patches now use the 
recommended sequence.  This doesn't affect 64-bit RISC-V systems, since 
the timer compare value fits inside a single register and can be updated 
with a single write.

thanks,

- Paul


The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-rc7

for you to fetch changes up to 841e47d56cef9b96fd2314220e3d0f1d92c719f4:

  riscv: Add intermediate cast to 'unsigned long' in __get_user_asm (2026-01-22 20:21:14 -0700)

----------------------------------------------------------------
RISC-V updates for v6.19-rc7

- Fix the RISC-V timer compare register update sequence on RV32
  systems to use the recommended sequence in the RISC-V ISA manual.
  This avoids spurious interrupts during updates

- Add a dependence on the new CONFIG_CACHEMAINT_FOR_DMA Kconfig symbol
  for Renesas and StarFive RISC-V SoCs

- Add a temporary workaround for a Clang compiler bug caused by using
  asm_goto_output for get_user()

- Clarify our documentation around to specifically state a particular
  ISA specification version for a chapter number reference

----------------------------------------------------------------
Guodong Xu (1):
      Documentation: riscv: uabi: Clarify ISA spec version for canonical order

Jonathan Cameron (2):
      riscv: ERRATA_STARFIVE_JH7100: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA
      soc: renesas: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA

Naohiko Shimizu (3):
      riscv: clocksource: Fix stimecmp update hazard on RV32
      riscv: kvm: Fix vstimecmp update hazard on RV32
      riscv: suspend: Fix stimecmp update hazard on RV32

Nathan Chancellor (2):
      riscv: Use 64-bit variable for output in __get_user_asm
      riscv: Add intermediate cast to 'unsigned long' in __get_user_asm

 Documentation/arch/riscv/uabi.rst |  4 +++-
 arch/riscv/Kconfig.errata         |  1 +
 arch/riscv/include/asm/uaccess.h  | 14 ++++++++++++--
 arch/riscv/kernel/suspend.c       |  3 ++-
 arch/riscv/kvm/vcpu_timer.c       |  6 ++++--
 drivers/clocksource/timer-riscv.c |  3 ++-
 drivers/soc/renesas/Kconfig       |  1 +
 7 files changed, 25 insertions(+), 7 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
