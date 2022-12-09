Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C026DC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 07:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hZYTwXvcllBLZ/dMugrVWtCLoBTXmnxvRI29mQlt2B4=; b=yfq5pOXt5CdsAB
	eH+lyn626klSZQVnjnUGXenB8R5mOMvw8/XTG9iYMwx3CJfu+DfNxKa55JP/GIkDpQwKARB45GitF
	fzM4/mh2GjwjqgNvXQJ2nlC5DuoBm4PmQXq8arNR04dliLTpbEfNtD0ZSToARa5hgH8OAVemAb76e
	IGA3uIEJ0Kr3KeyX1kn8TnlMwgqiA+0Ru7Bk5hMQXBQWEjWJDccXedom8pYDYMhxUu248oaRmWaKo
	mX03Hmv8S6GsqnyB6gKJelHOfZJopvOxyHEBMAZQDXk2qWRJaCllP/obvH1g1gBUZcTPnInQaCVwu
	m6/2dPYEgsPRxKNr4zWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3YEB-005IWk-Av; Fri, 09 Dec 2022 07:55:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3YE8-005IUh-5z
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 07:55:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9A892B827A3;
	Fri,  9 Dec 2022 07:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4385C433D2;
	Fri,  9 Dec 2022 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670572521;
	bh=wYIbLAR/5iF3vTBTzDgRe8zJ2RAJzzNQdh44OoznN6Y=;
	h=From:To:Cc:Subject:Date:From;
	b=FbwshvGCO+S/j9CBYvKhFYPuXKfqi3QPillGaior1K7Rwb/mNHfuUYLNoNwW4Vl2F
	 teSxRGPx3jUraZ0dLrbUbVozHIsV2axKcnPzZusF3aqOGzz9IWi+0gvz1DugQBjIdv
	 l4VR78w0mSpijn73+MXUNA6ZfMX/zd1y5mqt9Ot00uf8wkS7AXEcgx8DUXXWDNN1IC
	 4DimXaytnVUZQmraPYtE+g1/SqisshrNLGgLJlLe3a+AeC1eXaP9JXiVvXHM4lGufb
	 20SouKpa7qNMisv2zLoTQKa8TkVq6y/GYsvNInJnhxMXgIPQk9f/676PQAFX02K2Qr
	 RmaJThyMijfOA==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	conor.Dooley@microchip.com,
	guoren@kernel.org,
	heiko@sntech.de
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	crash-utility@redhat.com,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH -next V6 0/2] riscv: kexec: Fxiup crash_save percpu and
Date: Fri,  9 Dec 2022 02:55:11 -0500
Message-Id: <20221209075513.532249-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_235524_395039_43C89708 
X-CRM114-Status: UNSURE (   6.51  )
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
interrupts properly. The series fix them, make crash correct.

v6:
 - Fixup checkpatch.pl problems
 - Remove Fixes tags and make the series as features

v5:
https://lore.kernel.org/linux-riscv/20221020141603.2856206-1-guoren@kernel.org/
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
  riscv: kexec: EOI active and mask all interrupts in kexec crash path
  riscv: kexec: Make crash save multi harts' context

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
