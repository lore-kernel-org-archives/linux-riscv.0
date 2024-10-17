Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E01D2F7E1
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 03:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WNGy1wEPwhi+Ca+iINnI3FeppI75fLddQ0rCWbDjPJQ=; b=phqtUG5zHu/4T7
	O++X+ZQN03t5aso1ri2EgvORPd8X0LNXQN2AFPxBzQqAiaP3Aj9cvOq1nzlkt/rvgzI4hOiiliTPv
	YJ97i/JDsgt49ketDRxzf/Uy4yKi63hi9WBRVDNDuBDQ+bJNLVIM8B/C8vBfQk0O4gRN/B2ViLO/l
	4JWmbuqnIQ4sGCaPl31WBEEhf1E0cgqUwZjy7tq2QTbh5lDoQrJQ4n/y/khb1UXaLaZNPD/+rN370
	NMlUb5hWrXZaViIgbz3uov7HzUQiSjJkeh+uismoyIWNuj8GxoJu6dNHBQcuKDwwVRPTIPtVqam7p
	KOv4HWyDePOGmNkiEY3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1H5I-0000000DeHa-04hY;
	Thu, 17 Oct 2024 03:21:56 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1H5C-0000000DeEn-13H1
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 03:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1729135255;
	bh=SgCHUiz82lndKjTeNsmeInw+/PdasPiFZ+8EYbiHHVQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Fmc0G5RtjStkT3aLU45yNNVh3xnuNiUvtXdd9NwMt2+15NmWmy5lRs11Tv/zuf9KI
	 dODDvuAZoe+dL1WBkPjkn114Wna2P6tvWH6GprPGwoL5TVuEOvVqtI3glF2NdJrJyD
	 pXXxhbsfPN7OMTYOeOKqtUmlRvXFsrocqtVm3hDU=
X-QQ-mid: bizesmtp90t1729135217tx872kpv
X-QQ-Originating-IP: T+ZWv92ZAhy3mBu2f6pTzPydIDKegYzrt3xG8YNpoGw=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 17 Oct 2024 11:20:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6572493434624532531
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
Date: Thu, 17 Oct 2024 11:20:10 +0800
Message-ID: <4C127DEECDA287C8+20241017032010.96772-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OP01qWhGSBjQR1yNlRZmXWD8KzbKmq6RgbpqA9JFLilTwklOiGvvUbOe
	HlJ5Q51J7vE8xZ1TjmDdDYLZK6kTqsBgncLlBIv1HvO+bk4K7gf0IxPUGrhZ5pc+2SiaXZo
	MykxtdrUG0pLyPpS3e4x0QS57b2Ycn8q0DHWKkSFvx0n2rX/ezVRx14WJCR+m9+HKVnjq/T
	+ldGhLfgyNg203V9/BGpwaRFv4tpX8KMKX3lm33kLHUDS35Q3vOXuleXFCTTXMWM98ko2s7
	XYfFvQZM6l8ePgfC1bHaaPnTZ3Eka5U/F9jDn6Zx4hq6ZFhqeho69NByCXyGRdHDk4h8yG4
	mV/pCQte3iWxdctVVkBozzSLifmMpdlEgOYiZu4dWTmu2pEc3EIHUX1BZIxTneDc8gzTg8R
	r9zG8uvrxRMqYJl6uARSfwISBU7Bvsm+sT0xMKYJNSFH/Bpd2En3VdOuATLsdPj3Jj4RZrK
	9ciGBobGRURHWm9PZbtExIkVNYCIED+BRGyHNZh8V/G/jx0phGotYoG8n/ZX0lmPN6Z/VtD
	ayWfqVwkx6jX1rVSs55dxCi3TSXFxmNZ02URylxYv/rXY7AqsgDAaU7QwaumyI+rebPRWcW
	JdIz9N2c2EozrqNKbvgH1sRldZOK5U2JyEwkpR8o0y6gFnxrYp/nS6yfvCqQfIE2CIRwoAx
	Y4tram+j5Vs2ojCArDo5jnRkBTso4INDUZ7ZyHYHwgMcLiEGFAt9s3HzMRS9ZtNJgLP7m1w
	uV3t7BEtJdjxmQBjVBKG7WTHXQOr3QkrccOMbimCruwLhegSw4NlrmxnIG68whoNfOL6VlM
	YiXnL7e3iJGKg7maVIRZM8ShO86qrAi7rPL1pV27NCx5z2vEeVHAEnN6e3yvS+IRMxCuLIP
	mSY+l6gOZ/MKo3mMF5CQwUlS2XOGY7MdGB3DEIxQYuGSODNuPREHKflJRM4bhxnOFfyzspu
	MpaczAHy995wFP28a2V2uf9TzXAsvTAzvMzWUKJ0XsATTdxqV/aD9cualBg+E7jmmdON92i
	TNWaee2/1HZD2MTqhflVMBl6sP1QfaGU8m5QEdlo+O2iJQcbquSNWbOIEvCFk=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_202150_851990_FF32CCAC 
X-CRM114-Status: UNSURE (   8.25  )
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
