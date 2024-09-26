Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACD2CCF9EB
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 02:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WNGy1wEPwhi+Ca+iINnI3FeppI75fLddQ0rCWbDjPJQ=; b=VsTrMGOyQb1oIE
	Ak2t+oap7Am0ogjZ4nxEHZdjxIv4tT3cNGQuQvxYpJjWk2s42JNx3KIH/A97XqW5L6A4GkH66QPFq
	45V0tSBIeDr2ulGBkEfJr/wLDjErd79Lx/+PExmP3xUkWCqTpQK2DoVNurhjoUKSQYve91Z0kjGXJ
	JBnUnpZTF/w0BhuoOM09Eu4LNE+2DTTo0AosRJFuLaG8eCvKxXQQBez9ZgA2B+Oi8h6ZFakEN3blC
	9/rqCbotHdU7FfUiVtRen4xORKLIAakuBSKAdEv9+n9nnyjVlEXXkq3xDinYy6kkbmAUoLSj3Slpk
	u+vhlJMDy9xU4PRnPAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ste5q-00000006zA0-3uT2;
	Thu, 26 Sep 2024 02:18:58 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ste5n-00000006z6v-0dPw
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 02:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1727317060;
	bh=SgCHUiz82lndKjTeNsmeInw+/PdasPiFZ+8EYbiHHVQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=UFo8FVGFXTYgkIlvFVu7NNAz0PwiZ/X7y7vLMd1+AjhwVndCtTP4qC035SmdXY/wQ
	 mMueLnw0JFzb1RVU7ehq30Rd2NCcMEy+cyQ7PCSq83viS6aXUid/LMoTUa1O6c0gZK
	 Ed7Amf/eUH3Fp6yW4/6u+YaI96fpzijhbK7GpLuI=
X-QQ-mid: bizesmtp89t1727317049t27s5x5e
X-QQ-Originating-IP: RWncql2tgzXbdZQHdtoltutKeRWhDKw8fLlZUTgT37s=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 26 Sep 2024 10:17:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5024891882931544061
From: WangYuli <wangyuli@uniontech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	samuel.holland@sifive.com,
	conor.dooley@microchip.com,
	charlie@rivosinc.com,
	macro@orcam.me.uk,
	palmer@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	atish.patra@wdc.com,
	anup@brainfault.org,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	mikelley@microsoft.com,
	oleksandr@natalenko.name,
	deller@gmx.de,
	gpiccoli@igalia.com,
	apatel@ventanamicro.com,
	maz@kernel.org,
	kernelfans@gmail.com,
	jszhang@kernel.org,
	daniel.lezcano@linaro.org,
	Alistair.Francis@wdc.com,
	atishp@atishpatra.org,
	dwmw2@infradead.org,
	mark.rutland@arm.com,
	sabrapan@amazon.com,
	ross.philipson@oracle.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [RESEND. PATCH v2] riscv: Use '%u' to format the output of 'cpu'
Date: Thu, 26 Sep 2024 10:17:22 +0800
Message-ID: <DE320FC8D88E057F+20240926021722.1007313-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_191855_749250_3029F2B8 
X-CRM114-Status: UNSURE (   8.68  )
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
