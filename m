Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C698C6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 03:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ksfpj62BcBrie086Fn1YLyu9fqIMM9UnvXGd5/q4tGE=; b=e1E3pgEwIkX4BL
	cOYNi9tIg+c6KvCbo23GzBbxuNvHABrdxz+53FIMQpPw2t6S1S8V4Sb5QTPj77lde4IHpQ8rMXgPB
	/FJNsI8L/56MMaBBDKzwPje4KPj/qAgNEjWriX67sRRyceHWK8AmJvSl8sLzAC85i/Ho4Wi4RCusL
	iXA9kNZ+YAV+eBRWpBwJmDL0s+v+J3vHl474drthWbY+XB3eXGmtqRbw6HEWgsXtnWhDVN/rPEeWl
	o2ZXXpIuFezNzU5P7tKhS6Zoby1NK9WyCcMljVAVIxZEjgRpOv/nvn6keRgg545I3/k0kAuPjWEhr
	cH4nwKV5yXkTfnL+YN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaqT3-008Z45-RB; Wed, 21 Sep 2022 03:32:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaqSp-008Yx8-9R; Wed, 21 Sep 2022 03:31:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B1A562F21;
	Wed, 21 Sep 2022 03:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFBF0C433C1;
	Wed, 21 Sep 2022 03:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663731113;
	bh=L86JnuAVDjwV91egGrglApUiZIzU+Mu/qe9sCYqDgWM=;
	h=From:To:Cc:Subject:Date:From;
	b=e9O4oZsEDvFJZ7tY+/tb3bYBz7fd04JUedr8USCPhjsB0NBVfG1ApVlve/CntD5i9
	 VZSnYPnkRaUKTYNpwEuywjnLtOV2A0dNc6Blto0Ctmg/vI7Ps0QRT2Tf97bJvtimtW
	 Xqsfol0cY4sQmKgfg4eiDyx+MXz1kgpCe/2cPWKu1A5229It89GrCmH93svxyDNLKq
	 13Sk5DhTVzGTlqzL19tTEwKWDtfy6iO/yvE+uunLajQfaNHKYTO8VbKaVYVKWD9Bpj
	 AVYrcu65tCejmheajxcXRVz35zYP9RaG/SBJ5PW3A7+quaPkPJngBfGwKvfYsM8Pcu
	 amwxs3N7G2Jtg==
From: guoren@kernel.org
To: xianting.tian@linux.alibaba.com,
	palmer@dabbelt.com,
	palmer@rivosinc.com,
	heiko@sntech.de,
	liaochang1@huawei.com,
	jszhang@kernel.org,
	arnd@arndb.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 0/3] riscv: kexec: Fxiup crash_save percpu and machine_kexec_mask_interrupts
Date: Tue, 20 Sep 2022 23:31:31 -0400
Message-Id: <20220921033134.3133319-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_203155_370475_B289AB79 
X-CRM114-Status: UNSURE (   8.95  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Current riscv kexec can't crash_save percpu states and disable
interrupts properly. The patch series fix them, make kexec work correct.

Also cleanup arm64, x86 declarations in asm/smp.h.

Changlogs:

v4:
 - Add cpu_ops[cpu]->cpu_stop() in ipi_cpu_crash_stop
 - Wording optimization in comments

V3:
https://lore.kernel.org/linux-riscv/20220819025444.2121315-1-guoren@kernel.org/
 - Fixup compile problem with !SMP, which reported by lkp@intel.com
 - Cleanup declarations in asm/smp.h
 - Add reviewed-by

V2:
https://lore.kernel.org/linux-riscv/20220817161258.748836-1-guoren@kernel.org/ 
 - Add Fixes tags
 - Remove extern from bool smp_crash_stop_failed(void)

V1:
https://lore.kernel.org/linux-riscv/20220816012701.561435-1-guoren@kernel.org/

Guo Ren (3):
  riscv: kexec: Fixup irq controller broken in kexec crash path
  riscv: kexec: Fixup crash_smp_send_stop without multi cores
  arch: crash: Remove duplicate declaration in smp.h

 arch/arm64/include/asm/smp.h      |  1 -
 arch/riscv/include/asm/smp.h      |  3 +
 arch/riscv/kernel/machine_kexec.c | 46 +++++++++++----
 arch/riscv/kernel/smp.c           | 97 ++++++++++++++++++++++++++++++-
 arch/x86/include/asm/crash.h      |  1 -
 5 files changed, 133 insertions(+), 15 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
