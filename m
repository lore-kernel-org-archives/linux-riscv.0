Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A8FD2A538
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 17:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=09hTkXMjt94qKT1Cvy1MEdaVU6GvzfWsONFk+PKtsdw=; b=cmlH/K0f1Xs0vd
	VEb0q68dY2GEB1L2hPrVH7Odmq5etdfF6AMQlLW3Dn8GyBGwga2hghDSh4C2kbIE+0+vF9nGd+TXE
	bKOFFqNfmIaWDQ9KZ8riUf2Lt0ZtyyaREGAo1etOxrMmvjQGAp2lxCKr4OQqB79WfGUAsgtBUmUwD
	jPpOPlIrD0ePkiT0gGih9GSrjZJghPAFtVpw+I/EzWGjcxc0nT6xbyw83dleJN6z8PEe8vSrcEgxk
	QBy7h3/tKnyHU4xxH1fNLEnqbYjGtZnd9F6IMANrFtXjR4MZnTKTojLFwvG+L8rqr426ZhI+l8tu5
	/APNZTXIPvKvh5n5v1/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t18Al-0000000CbEn-43Oc;
	Wed, 16 Oct 2024 17:51:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t18Aj-0000000CbEA-1IA5
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 17:50:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D967A41325;
	Wed, 16 Oct 2024 17:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABC9DC4CEC5;
	Wed, 16 Oct 2024 17:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729101055;
	bh=hoU5DGRfSi0AM7CKet0iYo9j9GdgPMDGPjGhM0wKSno=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=joOpKlSdtlsK+cPFx91M0RfLr0zarS7AmroBAKCdc8Q0ejrq0O/uRX2Mu9NC69TJb
	 90m/iOJ7ngKXjE2R3rVK14kxb2xf/jX+804QGx5HtIz8ekCC6OcEMeL57nGtBeMQ+l
	 uXJY/BIcUov2zz9PloLHWdp1t8eOJaV/H6+m36YFc+C9ha0hMKMGhU4p02/TdMLgpW
	 aHiSQ3SEWNrl2yLA8NHES50JcGH5DUZSz7jBO8l9/nJh/hNnh0Pj7mABKTouS7pL8Q
	 5ihxkPJcb4XwKMhV7jBOzA/EFFhEilcwOjjhNM2Kej/J61y3LsSASiwrHgpIvTxvy+
	 Frer/KfZFs/tA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97252D2A53B;
	Wed, 16 Oct 2024 17:50:55 +0000 (UTC)
From: Celeste Liu via B4 Relay <devnull+CoelacanthusHex.gmail.com@kernel.org>
Date: Thu, 17 Oct 2024 01:49:49 +0800
Subject: [PATCH] riscv/entry: get correct syscall number from
 syscall_get_nr()
MIME-Version: 1.0
Message-Id: <20241017-fix-riscv-syscall-nr-v1-1-4edb4ca07f07@gmail.com>
X-B4-Tracking: v=1; b=H4sIALz8D2cC/x2MSQqAMAwAvyI5G7AuFf2KeNCaakCqJFAU8e8Wj
 wMz84CSMCn02QNCkZWPkMDkGbhtCishL4mhLMraFMai5wuF1UXUW9207xgEO9POjbW+a30FKT2
 Fkvdvh/F9P1Mix5BmAAAA
X-Change-ID: 20241016-fix-riscv-syscall-nr-917b566f97f3
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 Celeste Liu <coelacanthushex@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 "Dmitry V. Levin" <ldv@strace.io>, Andrea Bolognani <abologna@redhat.com>, 
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>, 
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>, 
 Yao Zi <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2366;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=lQHWH4mdPxR6fSPtGuLhEmZBLbEpDpJ9XVmyzF+kIjU=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkM6fx//rDbHWUTjFeQ1lxc+evTyrQnVWz7ZnMl5gXGN
 bKeX89itrCjlIVBjItBVkyRRWzn09fLSh99WMZrMgNmDisTyBAGLk4BmIiTFyPDhFnn9dIvunfM
 ezeRcxLDm791Uyo+aE9KqdXql5lxwCePn5HhUrLiJuNJhmd61+wIi3naMVdOfk7c5X/cwk3Xt4c
 4mnjxAQABV0jh
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-Endpoint-Received: by B4 Relay for CoelacanthusHex@gmail.com/default with
 auth_id=84
X-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_105057_516337_5158BE09 
X-CRM114-Status: GOOD (  12.26  )
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
Reply-To: CoelacanthusHex@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Celeste Liu <CoelacanthusHex@gmail.com>

The return value of syscall_enter_from_user_mode() is always -1 when the
syscall was filtered. We can't know whether syscall_nr is -1 when we get -1
from syscall_enter_from_user_mode(). And the old syscall variable is
unusable because syscall_enter_from_user_mode() may change a7 register.
So get correct syscall number from syscall_get_nr().

So syscall number part of return value of syscall_enter_from_user_mode()
is completely useless. We can remove it from API and require caller to
get syscall number from syscall_get_nr(). But this change affect more
architectures and will block more time. So we split it into another
patchset to avoid block this fix. (Other architectures can works
without this change but riscv need it, see Link: tag below)

Fixes: 61119394631f ("riscv: entry: always initialize regs->a0 to -ENOSYS")
Reported-by: Andrea Bolognani <abologna@redhat.com>
Closes: https://github.com/strace/strace/issues/315
Link: https://lore.kernel.org/all/59505464-c84a-403d-972f-d4b2055eeaac@gmail.com/
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/riscv/kernel/traps.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 51ebfd23e0076447518081d137102a9a11ff2e45..3125fab8ee4af468ace9f692dd34e1797555cce3 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -316,18 +316,25 @@ void do_trap_ecall_u(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
 		long syscall = regs->a7;
+		long res;
 
 		regs->epc += 4;
 		regs->orig_a0 = regs->a0;
-		regs->a0 = -ENOSYS;
 
 		riscv_v_vstate_discard(regs);
 
-		syscall = syscall_enter_from_user_mode(regs, syscall);
+		res = syscall_enter_from_user_mode(regs, syscall);
+		/*
+		 * Call syscall_get_nr() again because syscall_enter_from_user_mode()
+		 * may change a7 register.
+		 */
+		syscall = syscall_get_nr(current, regs);
 
 		add_random_kstack_offset();
 
-		if (syscall >= 0 && syscall < NR_syscalls)
+		if (syscall < 0 || syscall >= NR_syscalls)
+			regs->a0 = -ENOSYS;
+		else if (res != -1)
 			syscall_handler(regs, syscall);
 
 		/*

---
base-commit: 2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
change-id: 20241016-fix-riscv-syscall-nr-917b566f97f3

Best regards,
-- 
Celeste Liu <CoelacanthusHex@gmail.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
