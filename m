Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE40AECAAD1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 18:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLA8E7Q/vVuvXayHapXg3ztCFPrsHQ2pIpoB1tujQXs=; b=hMXOi30YTEcYEN
	5zzRj/uDImY4g4Getn67yybXCDR8rNWClzPRVmzWiO9p71xLJQzYbiY3YpLzyRF4NyaqKKYyCjaEA
	bY+ZqvF4VyaFCNqTqlWC6aNfp9/uVm5WcyenWZBoqZjzokW7awIvyaQPsk0OthAJel89pvA64ejqG
	LHg0V9QTCRjY9aBe1Aez2APIWYJ4C+KZkQykJAVfGyHArDwEgX7KFJPwnDHeITePaOHjikEMUaA/L
	ou20QY/IW0MubW87qeJpFZuM9okGGpSMsqQCxOe2RBCJ/HNnWRi6tg3JXmOdAZIC9UJcUJ9M1J6oL
	L2NMltZKr8mvXkWP427w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTS90-007VY0-P5; Wed, 31 Aug 2022 18:08:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTS8w-007VQ8-LL; Wed, 31 Aug 2022 18:08:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 70B1BCE1EA8;
	Wed, 31 Aug 2022 18:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BF0C433D7;
	Wed, 31 Aug 2022 18:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661969323;
	bh=RRltkuwJX7LP5kK/3k3rhHeIM5Hot3r7Dzu5sm7vQRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kjEWyJtWNJyqF1sWOIQ+uxemOhBF9KufKpx8qD5bN+fkZAdqi4a7jrAo/HlErp4DX
	 4JrXURA91d8hkInkWBE1es3vrtKJEag1lSCmaRnzz/itVcR4MM49ZWA6Sbm0vfsvkl
	 LOHM5808le50a4zKPFn3IrO63brm4V6tnNWJi2O6bhA0pc5h0MhAMnuebmuyonXou+
	 EVydrw1bfEdiLIKpA4cWmrqlj1kMnVUEf1psTVIEu7NzLvcHfSjXgazSbSDtAH45c1
	 A0YVzkG7josdrwFMYuKygXDRDEu9f0kfHCgrnCQ2M2/cymSWDY1wcmJYpoREFT34mN
	 xw6vWRBUCvd3A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 3/5] riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
Date: Thu,  1 Sep 2022 01:59:18 +0800
Message-Id: <20220831175920.2806-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831175920.2806-1-jszhang@kernel.org>
References: <20220831175920.2806-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_110850_887221_1445281B 
X-CRM114-Status: UNSURE (   9.40  )
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

Move POSIX CPU timer expiry and signal delivery into task context to
allow PREEMPT_RT setups to coexist with KVM.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 79e52441e18b..7a8134fd7ec9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -104,6 +104,7 @@ config RISCV
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
+	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_STACKPROTECTOR
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
