Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B18DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 00:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a75yx6TOPBwTuxC+Igr9nqcfEhgLG/1UhV6ANokKWhI=; b=4SuZgRjVzKxmaq
	vtBVMy6dAVv+/5mjdwPtpQTvBr/o+22JSUUgXUbL/IFXVEA08mPkgYaQrvSslIqgt4pq0fNmqs0Zm
	8wh3OY0i30QtF/NAiGRSMuFrgIA/4nIzY0d/nZuq6URaWu+Q2ZYmUqcpeIhfZQUtHG8uQ9RqsnCRm
	vKeUXwhuzfW3Z/+VSXX2WdMRdy/eUGCqti7bY/+UqB2a4jhkcrGDlBryRdvR5/6NFP5pfci/8GMxt
	Aj+wxoqKBKvQTjzzdVQS8YajPO2PpvClri5dcEcuMGtsCuZy6uo56JBQ9ZKoy6EYv4lyCNX0QwDsj
	3mZCKr9acu6FeNgw3Sxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1z4F-00BpKM-Iy; Mon, 05 Dec 2022 00:10:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1z4C-00BpIH-89
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 00:10:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8475760F2D;
	Mon,  5 Dec 2022 00:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D05C433D7;
	Mon,  5 Dec 2022 00:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670199038;
	bh=wHwBkSo7+9OsXeSnyzm3ampLGK0mAtM78dM7PJjSBzA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=LYVLlfwQlNqL4IrP/fLTZ3aY/WveKlAsLqqhxuFI9pBkv+61ywlfdBNMfEMI9et2f
	 thECXDLwAUFxfeeVM8QUEWgp7TBGxEtSu5VlmPcK+J60pVhutgNhTlH7p8UBnE9jL0
	 8X/2rQRT2w9Zvb+FeyUc2vBdRx4qP182YKwbzfhWLUI37EPceVJP8CYXp5PSZ/S6Ot
	 ZrVHhapPO83mb1NbCEtQgjoKxhc3/EF4Xo1vmN6QZXLu+zdKgWFWxFMQw+DBlVk4Gc
	 FF/sP7sHmrgqSCOEICFxjr6Nkk+MmIRkCoVRyhcUR9/XALh3NdyB+FgAouCnRPCGH6
	 dF0ChJteyChfw==
Date: Mon, 05 Dec 2022 00:10:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
CC: Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
 Samuel Holland <samuel@sholland.org>,
 Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_1/3=5D_RISC-V=3A_time=3A_initialize?= =?US-ASCII?Q?_hrtimer_based_broadcast_clock_event_device?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20221201123954.1111603-2-apatel@ventanamicro.com>
References: <20221201123954.1111603-1-apatel@ventanamicro.com> <20221201123954.1111603-2-apatel@ventanamicro.com>
Message-ID: <04CBEBD4-3EDC-4FA0-BB11-DDD6B710C60C@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_161040_417671_E8E78367 
X-CRM114-Status: GOOD (  11.82  )
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



On 1 December 2022 12:39:52 GMT, Anup Patel <apatel@ventanamicro.com> wrote:
>From: Conor Dooley <conor.dooley@microchip.com>
>
>Similarly to commit 022eb8ae8b5e ("ARM: 8938/1: kernel: initialize
>broadcast hrtimer based clock event device"), RISC-V needs to initiate
>hrtimer based broadcast clock event device before C3STOP can be used.
>Otherwise, the introduction of C3STOP for the RISC-V arch timer in
>commit 232ccac1bd9b ("clocksource/drivers/riscv: Events are stopped
>during CPU suspend") leaves us without any broadcast timer registered.
>This prevents the kernel from entering oneshot mode, which breaks timer
>behaviour, for example clock_nanosleep().
>
>A test app that sleeps each cpu for 6, 5, 4, 3 ms respectively, HZ=250
>& C3STOP enabled, the sleep times are rounded up to the next jiffy:
>== CPU: 1 ==      == CPU: 2 ==      == CPU: 3 ==      == CPU: 4 ==
>Mean: 7.974992    Mean: 7.976534    Mean: 7.962591    Mean: 3.952179
>Std Dev: 0.154374 Std Dev: 0.156082 Std Dev: 0.171018 Std Dev: 0.076193
>Hi: 9.472000      Hi: 10.495000     Hi: 8.864000      Hi: 4.736000
>Lo: 6.087000      Lo: 6.380000      Lo: 4.872000      Lo: 3.403000
>Samples: 521      Samples: 521      Samples: 521      Samples: 521
>
>Link: https://lore.kernel.org/linux-riscv/YzYTNQRxLr7Q9JR0@spud/
>Fixes: 232ccac1bd9b ("clocksource/drivers/riscv: Events are stopped during CPU suspend")
>Suggested-by: Samuel Holland <samuel@sholland.org>
>Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>Reviewed-by: Samuel Holland <samuel@sholland.org>
>Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Huh, thought I replied already but I just have forgotten to...
Since you've added this patch to your series,  it needs your SoB appended.

Thanks,
Conor.

>---
> arch/riscv/kernel/time.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
>index 8217b0f67c6c..1cf21db4fcc7 100644
>--- a/arch/riscv/kernel/time.c
>+++ b/arch/riscv/kernel/time.c
>@@ -5,6 +5,7 @@
>  */
> 
> #include <linux/of_clk.h>
>+#include <linux/clockchips.h>
> #include <linux/clocksource.h>
> #include <linux/delay.h>
> #include <asm/sbi.h>
>@@ -29,6 +30,8 @@ void __init time_init(void)
> 
> 	of_clk_init(NULL);
> 	timer_probe();
>+
>+	tick_setup_hrtimer_broadcast();
> }
> 
> void clocksource_arch_init(struct clocksource *cs)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
