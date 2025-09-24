Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604A6CAC5A5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 15:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9V6saMhIVsbYs0Rcntw0xeHXHTuBsT+Wg2VTBq1qbQ=; b=xX9L+Al0GTkbKl
	6kCvHnK+iz30LAc/XjTZJyJOW53Bqrvt40lVwjSWTrQuqKtSLZx2dDBPIQ37CTYecKW3jDkyKxzj2
	CveEi8vSzGQQKhLFWIN+dfRHD7N+nOLBtGOn+GQKqEnGa1piGiV+zbIZsPsqL9+nNYFTFaWmZWZ9g
	vmXhMQv7EKnuJf2CjXnF4wd9FkXWrYsgKav/r1Yh93ccPIT8MDTsP4LtQNtm4Oxfyg+XVWcSjfXZb
	H1Ao6JO6fMwGJl9ELxm7aUajCKoemhzKf+EByQ5k8I+bAfnuiPZDppWwfQ6gX9+FdT/PULTnxVQqQ
	UJETmF+Ll12dmgoXMdeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RX5-00000001Kd5-1O8u;
	Wed, 24 Sep 2025 15:35:51 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RX1-00000001KZc-12Tw
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 15:35:49 +0000
Received: from [192.168.0.105] (unknown [114.241.87.235])
	by APP-03 (Coremail) with SMTP id rQCowADH24XDD9RoAzdBBQ--.31926S2;
	Wed, 24 Sep 2025 23:35:31 +0800 (CST)
Message-ID: <27092a3a-cf9d-4481-99b3-4cc64a544b4f@iscas.ac.cn>
Date: Wed, 24 Sep 2025 23:35:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v6 2/2] riscv: Allow for riscv-clock to pick up
 mmio address.
To: aleksa.paunovic@htecgroup.com, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Djordje Todorovic <djordje.todorovic@htecgroup.com>
References: <20250924-riscv-time-mmio-v6-0-9c6158a14b37@htecgroup.com>
 <20250924-riscv-time-mmio-v6-2-9c6158a14b37@htecgroup.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250924-riscv-time-mmio-v6-2-9c6158a14b37@htecgroup.com>
X-CM-TRANSID: rQCowADH24XDD9RoAzdBBQ--.31926S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW3ZF4kWw4xJr4UAFWDJwb_yoW8XryDpF
	s3Cr13Ar15Xr4agwsIyF1DuryFqw4xGa43Kry2yw1Ivr45AFy8Kr4kt34vqFyDXF97Ar12
	qF1Skr4Y9r1UCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j8KsUUUUUU=
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_083547_652539_744E572B 
X-CRM114-Status: GOOD (  12.86  )
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

Hi Aleksa,

On 9/24/25 19:10, Aleksa Paunovic via B4 Relay wrote:

> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>
> Allow faster rdtime access via GCR.U mtime shadow register on RISC-V
> devices. This feature can be enabled by setting GCRU_TIME_MMIO
> during configuration.
> Reformat the clint timer to use the same mechanism if RISCV_M_MODE is set.
>
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  arch/riscv/include/asm/clint.h    | 26 ----------------
>  arch/riscv/include/asm/timex.h    | 63 ++++++++++++++++++++++-----------------
>  drivers/clocksource/Kconfig       | 12 ++++++++
>  drivers/clocksource/timer-clint.c | 20 ++++++-------
>  drivers/clocksource/timer-riscv.c | 34 +++++++++++++++++++++
>  5 files changed, 90 insertions(+), 65 deletions(-)

I have a question about the design of this patch. Do we *really* have to
combine the GCR.U timer driver into the existing riscv,timer driver?

It seems at least to me that all we really need is a *new* clocksource
driver with a higher "rating" than riscv_clocksource and
clint_clocksource, and the kernel will prefer it anyway.

In your patch, you're effectively making timer-riscv a driver for both
riscv,timer and mips,p8700-gcru, while including a whole bunch of
indirections and renamings. I think the structure of this patch would be
much simpler if it was just adding a new clocksource driver.

Please consider.

Thanks,
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
