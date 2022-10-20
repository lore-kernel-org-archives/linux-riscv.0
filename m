Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18768C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 14:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ILleaLAOlSPwAvgv3kLLNpef9rtjDTdwh/NvtHo4FIw=; b=WSYeCeWHDAnI96
	9uO3f9iOWoOTxHqqgSrM91RoD79Gn1tB0Z0/E4mEexBWhAl/1Ja9tWVW0P6NK6sj+w5WqnSDRY+63
	8Qr63YpR/dZeBjwXiJGFJfnaLmzTlNiFrK6+pzzvrzjoVmGaG4FotE++SSFW5Xo1AeTRgbEIJIXnC
	qlZvzIs87QN5KbDbdTr8PeXMmZ63l9aKEr9dLglLqZXYyzhEvvZ3vNoQfPGmWj023MLR2uC/U8q66
	if327Vc/AN5a3kcoLu+9h1Itm6clXpAeKzm/nJkYJUYAAvwOF6sSycoRG4MF9a3JCq7Fx4VrdCkf9
	wVoa7oJujdXArxGFDrPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWZW-00GBp0-Et; Thu, 20 Oct 2022 14:30:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWLi-00Fz7v-9m
	for linux-riscv@lists.infradead.org; Thu, 20 Oct 2022 14:16:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C8703B82772;
	Thu, 20 Oct 2022 14:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0C7C433C1;
	Thu, 20 Oct 2022 14:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666275399;
	bh=33WQ+X8Qxfmn5zCJMZeuV/59uVzIastC86R8fyKVBYI=;
	h=From:To:Cc:Subject:Date:From;
	b=UqAXvdKiv0PFm/2rr+IKWX8v6m2RJdSIXCy1N/7qPZlDbUQ5AoydaM0T4yrlbKJ3O
	 nIKH6mQfM68kYjzey51RWW8Sr/Nwxozc3KNeEZOhtEEP2V9DxEI84MzOAvw8LovEJi
	 CijQAoWzEdT59evlZpm8ngoCkpoOH/YMcfLlY21wlKdD/WnUSZA/gT0MrlLJYa5mtl
	 Qpv9QlPy0qwybO3yNoV4jROBQm6o0pv0E9KETolxNWzOb74SmiephxjS0O4OAlPWNG
	 guLvHaQHOpGZ1o/RAbkgVn9xUEtkkLzG48+x/ATY2JxMtfwN1qwo7kKyEgyULhADtc
	 +DEjwpm83v6hA==
From: guoren@kernel.org
To: guoren@kernel.org,
	xianting.tian@linux.alibaba.com,
	palmer@dabbelt.com,
	palmer@rivosinc.com,
	heiko@sntech.de,
	arnd@arndb.de,
	lijiang@redhat.com,
	bagasdotme@gmail.com,
	bhe@redhat.com,
	yixun.lan@gmail.com,
	goyal@redhat.com,
	dyoung@redhat.com,
	corbet@lwn.net,
	Conor.Dooley@microchip.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	crash-utility@redhat.com,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V5 0/2] riscv: kexec: Fxiup crash_save percpu and machine_kexec_mask_interrupts
Date: Thu, 20 Oct 2022 10:16:01 -0400
Message-Id: <20221020141603.2856206-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_071642_525882_0E2115A9 
X-CRM114-Status: UNSURE (   7.32  )
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

Changlogs:
v5:
 - Remove the patch which isn't relate to riscv
 - Add fixup crash_smp_send_stop test result

v4:
https://lore.kernel.org/linux-riscv/20220921033134.3133319-1-guoren@kernel.org/
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


Guo Ren (2):
  riscv: kexec: Fixup irq controller broken in kexec crash path
  riscv: kexec: Fixup crash_smp_send_stop without multi cores

 arch/riscv/include/asm/smp.h      |  3 +
 arch/riscv/kernel/machine_kexec.c | 46 +++++++++++----
 arch/riscv/kernel/smp.c           | 97 ++++++++++++++++++++++++++++++-
 3 files changed, 133 insertions(+), 13 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
