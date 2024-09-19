Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AEFCE8D49
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Sep 2024 03:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WNGy1wEPwhi+Ca+iINnI3FeppI75fLddQ0rCWbDjPJQ=; b=lRuIE0y/w6YgO2
	qDwL/WUgVWa4zT6f0R+N703UaWEoxOE7xbIJj4tKo+HCm5H02891gLmXkFGE9KzxYJqKhr9sW6ktQ
	fzxSR81VOf/Mdp59FkiI4x7JWh4pSybS2MfgwT1a3An0dM/OqEtmaoKqBmLBjo2y9H0YcjMTUV32J
	SugpU1cHy2deEtqfI4gYNmGLbw22zs8WfJOGU5QbUubrRf+yqcZntW5ppXHF/gyE1n5c/r8dGONlN
	GFsEt+CP1O0RKukWPPblShCS1QiEAGHZpiMPwytR9/TLlGIbnIBu6ZSpy6hJ4pO20Pu2/PgpIGArY
	d3d4vQPc1zKA97DhP1Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sr854-00000009NEN-2gbQ;
	Thu, 19 Sep 2024 03:43:46 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sr851-00000009NDf-4AtO
	for linux-riscv@lists.infradead.org;
	Thu, 19 Sep 2024 03:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1726717350;
	bh=SgCHUiz82lndKjTeNsmeInw+/PdasPiFZ+8EYbiHHVQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gtZZ8HRSPC4t7+Sxe1Ngrcotzqpb55SeZR2V4FtT7AjGhHJMwLkq5HLxC+upg93Rs
	 GZ31SjcXNTZi7NZ572jZal4bakpIoDcYWkl+q22H9OmdJGtKjlxMb1JvzMP9/6SBgY
	 sAz59CiGc8xh7DRq9wkPiP0pnVx4KWljJnsR5xyA=
X-QQ-mid: bizesmtp91t1726717345tc4qvn7k
X-QQ-Originating-IP: tfsA70aSzkRofVa6syLi67IHJ7ynHwMMwuML09155uQ=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Sep 2024 11:42:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5706766640839109577
From: WangYuli <wangyuli@uniontech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	samuel.holland@sifive.com,
	conor.dooley@microchip.com,
	charlie@rivosinc.com,
	macro@orcam.me.uk
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	atish.patra@wdc.com,
	anup@brainfault.org,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	palmer@rivosinc.com,
	mikelley@microsoft.com,
	oleksandr@natalenko.name,
	deller@gmx.de,
	gpiccoli@igalia.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [RESEND. PATCH v2] riscv: Use '%u' to format the output of 'cpu'
Date: Thu, 19 Sep 2024 11:41:46 +0800
Message-ID: <CC5FEE6571AB2A58+20240919034146.57207-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_204344_545235_6F2E0137 
X-CRM114-Status: UNSURE (   9.23  )
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

'cpu' is an unsigned integer, so its conversion specifier should
be %u, not %d.

Suggested-by: Wentao Guan <guanwentao@uniontech.com>
Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
Link: https://lore.kernel.org/all/alpine.DEB.2.21.2409122309090.40372@angie.orcam.me.uk/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/cpu-hotplug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
index 28b58fc5ad19..a1e38ecfc8be 100644
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -58,7 +58,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 	if (cpu_ops->cpu_is_stopped)
 		ret = cpu_ops->cpu_is_stopped(cpu);
 	if (ret)
-		pr_warn("CPU%d may not have stopped: %d\n", cpu, ret);
+		pr_warn("CPU%u may not have stopped: %d\n", cpu, ret);
 }
 
 /*
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
