Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12B7C00140
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 01:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V+AhskH0bdMkuw+uQgFh/LBwX9n6gHrPcYcbRu1wb9w=; b=a4i7Gk239wLzak
	PpliX9LoXn6EDKnLWUdRermUbpCXvNfzveO9pB2NBiejtl8Q+imFtw+K87QpiFJDwyq3kersAnzm8
	n+E4bwPOOZtDP3gjOnriCbtn6gY6j0GxDUQV73iPL0nGXZSs3CqXb3E6RdheZZj4ej80hmdtvI7GC
	RbtcPwq2b+JSqPWto0OC9rBR8MCkyI6FMei2KOiVrhV6V91zrc4RqoiABq+qXoJRikfwaOSNDDkhx
	jsnIEGrZ0HMaLMFrdgnH0WrzEHszffQHH9fxFsanMRVbftwLlFhygvlyX+JoHOKHV1Cd6neY3bRuz
	e6Ge8O09GWbx1l4W1QMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNlMR-008cel-QV; Tue, 16 Aug 2022 01:27:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNlMO-008cbm-0W
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 01:27:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6F2E8B815A5;
	Tue, 16 Aug 2022 01:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7627C433D6;
	Tue, 16 Aug 2022 01:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660613228;
	bh=/mGseJZgdyPhe4TH7J2aYC+EJppAEfiwBjSFQw9INt8=;
	h=From:To:Cc:Subject:Date:From;
	b=J8eswGHY/mdK84n3nQJ3tGDW86TCcvnDcZ0H51QoTkk0DMWnOFN4aLX+MXCXkhMOt
	 izzVootNZbADGtoDgczSj2Fvy2XmdnVpemma1gGufx2Kw0P3vGpxfqvUdZ6uIFuyhl
	 6dqPU/Y+KOgJSHe/m0YgsKP06zD2r+ts6bp3tpm85lQe/o5fMBY2m4jITN96uAIF7j
	 fURLJV3NQQNJrDahX+ms1FnzhyMShNss7znOQfN6qsSJsRnBLtc1QE1NwJSjCKONQm
	 rII+kIh1Ak1snp4OWUdLNqZhYH8KTsvfdMMzzVD6rYtA8i3BzJUmSp3nOrRvgpHZ6J
	 Jgfu0h0fZq1qQ==
From: guoren@kernel.org
To: xianting.tian@linux.alibaba.com,
	palmer@dabbelt.com,
	heiko@sntech.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liaochang1@huawei.com,
	mick@ics.forth.gr,
	jszhang@kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 0/2] riscv: kexec: Support crash_save percpu and machine_kexec_mask_interrupts
Date: Mon, 15 Aug 2022 21:26:59 -0400
Message-Id: <20220816012701.561435-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_182712_270920_8F48D8CB 
X-CRM114-Status: UNSURE (   6.53  )
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
interrupts properly. The patch series fix them.

Guo Ren (2):
  riscv: kexec: EOI active and mask all interrupts in kexec crash path
  riscv: kexec: Implement crash_smp_send_stop with percpu crash_save_cpu

 arch/riscv/include/asm/smp.h      |  6 +++
 arch/riscv/kernel/machine_kexec.c | 44 +++++++++++----
 arch/riscv/kernel/smp.c           | 89 ++++++++++++++++++++++++++++++-
 3 files changed, 126 insertions(+), 13 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
