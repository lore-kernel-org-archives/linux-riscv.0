Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78888C25B0E
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 02:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TjrWfnUuixU99Z0q6T29Qpfv+Ixt/EAbmBk/hETT+Oo=; b=YjaBN+Y7DgcXAN
	YcIw5ao95iJnwWt86Oe7CyV5BHHmPYFLVH82+8G/vBeCodlEloZYn1xzagg87Y+BhZh8nqUK3RHsA
	RkM1ilaZ7iUz4BEu87UURQcMsfpvQJXTmc84eUErLpVNxkyXC91t5hu/RTwrZQRhrcCl9oSP3SyTL
	C1/2IYUdhhphK711qurO3dC3ao2gOINl2MOyOZmYrZu2YZ2Jt/YKk3ChtJoLTuIgdaSfJGXWDcF/E
	4RmB+04jtJx/1/a5c0taa8eeababJ93XiPGjQIYhtqB5Uif/2eO5IayB09GBgcIf4r2rAZDDz1T0t
	NqzgJYLNfLUSZGAGceOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOsA3-00F6mX-3d; Fri, 19 Aug 2022 02:55:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOs9z-00F6e8-Qb
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 02:55:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3F5AEB8255B;
	Fri, 19 Aug 2022 02:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACEFC433D6;
	Fri, 19 Aug 2022 02:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660877695;
	bh=MWB0MHyVat//RCNcc5nnre2niTbT73AZeuEoxZb/j5I=;
	h=From:To:Cc:Subject:Date:From;
	b=toZYXqMaVqIO8OTDDRJtnrrNomIuEAiPS86Hrmo94FdHsZSV8tTL9aTemldPAceix
	 iZ3BUhvzmkSYGcSvGqTN/78PwcPPzY0CDt76g+N4jyRqoLAqQByoQaQtmfR0CGzFs0
	 /ADmlXcN03Gv5aQ7JHE0bzN/zEnF2UAbJE4zg5iN4a4r8NQR6/tx+n39mdJAl/2FKv
	 80TWYqEt70t/MqIXpimdZtdZqRHPyE2LwrlBHPizEF77xmxsz1EdcX3gHMp4EaK41z
	 lkNsXKQNpd9QCPEd2yJzg5v40ayZPQEES9o+1wmybFR6obzkpFXu1FKKRX2Q+3OIwd
	 PgFeELRDYZoKQ==
From: guoren@kernel.org
To: xianting.tian@linux.alibaba.com,
	palmer@dabbelt.com,
	heiko@sntech.de,
	guoren@kernel.org,
	conor.dooley@microchip.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liaochang1@huawei.com,
	mick@ics.forth.gr,
	jszhang@kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 0/3] riscv: kexec: Fixup crash_save percpu and machine_kexec_mask_interrupts
Date: Thu, 18 Aug 2022 22:54:41 -0400
Message-Id: <20220819025444.2121315-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_195500_045510_93BBF836 
X-CRM114-Status: UNSURE (   8.06  )
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

v2: https://lore.kernel.org/linux-riscv/20220817161258.748836-1-guoren@kernel.org/ 
v1: https://lore.kernel.org/linux-riscv/20220816012701.561435-1-guoren@kernel.org/

Changes in v3:
 - Fixup compile problem with !SMP, which reported by lkp@intel.com
 - Cleanup declarations in asm/smp.h
 - Add reviewed-by

Changes in v2:
 - Add Fixes tags
 - Remove extern from bool smp_crash_stop_failed(void)

Guo Ren (3):
  riscv: kexec: Disable all interrupts in kexec crash path
  riscv: kexec: Fixup crash_smp_send_stop with percpu crash_save_cpu
  arch: crash: Remove duplicate declaration in smp.h

 arch/arm64/include/asm/smp.h      |  1 -
 arch/riscv/include/asm/smp.h      |  3 ++
 arch/riscv/kernel/machine_kexec.c | 46 ++++++++++++----
 arch/riscv/kernel/smp.c           | 89 ++++++++++++++++++++++++++++++-
 arch/x86/include/asm/crash.h      |  1 -
 5 files changed, 125 insertions(+), 15 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
