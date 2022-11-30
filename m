Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EADC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 04:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TwwZpx0fg/n3AAAboaKbm5nhrmOIdzV2ps6snjbn8ok=; b=hg7hKCH8PnW8A3
	oHiFpSyaM+K6YTeuS4b0I73iUlbkFpujK6YUilHJETSu3sm0d3ck8ay0s1DyBN9Yr+2Ldfh1x+z6I
	xJ7FVK1q82XzINs2oWSN73aS+BqTxMnS14JuOyVztPKbc4IM06+HJs8sEwG827412qMQ2quDkp7Ki
	769SQvDwSgSYvGJxQmDQUlibwDXtwsM+phekA5LhIvE93zEkJ4mD8Hzg55uLc71s8WMF/cJsxRs1q
	C1g1j330ob0uczGOMrstYatdfd88fxsnPXNciJRZcKXbLW2+ZJUStJa91Uhgpk5yqy0I+TdSMKYNy
	hmmfdWHUrPFA1EBW8AQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0EZj-00CvBD-Dx; Wed, 30 Nov 2022 04:19:59 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0EZg-00Cv9q-Qi
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 04:19:58 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id D7146320027A;
	Tue, 29 Nov 2022 23:19:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 29 Nov 2022 23:19:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1669781994; x=
	1669868394; bh=geF09RMhVzrmblG0AWI/JlVzOQzpfQlKgZsik6BhT/Q=; b=q
	AUMqP4zTpNErCbXaqgejwie3I7jfnINQbuBXdm6RBdnJj0cMBxlhJ8peQKJJHFXy
	dUKPXcEEce76resM5bYw5d9DytKDUTNZRNHwaExYpVhn/wNLaMkMr3gdEaOwRjus
	J5x5BqILonmpOho1O+MWdO4ZKLczwMV6P85KpK2AHYhW79RZkbQFBCXmZNaPuo6f
	jB5MQlh2YIWbUGxttakYcCYKjlQ6Z3uR53lB5QFlbHpSsrxG2pzL3uHu6O2bGiCe
	4zaU+0eDRpZthF9CMXJXj5hHSDKleeedPkTHzm53HAAHh5cL1jJuidjvSSl3ZMah
	zwxvEQowwEk8g+dt2eUkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669781994; x=
	1669868394; bh=geF09RMhVzrmblG0AWI/JlVzOQzpfQlKgZsik6BhT/Q=; b=U
	kL3LG9ZijG0AaGC6IQEQ3koQvXCOqDOngKqlqkOfqSs9KLk/YbFGPxofnr4Oa/Sh
	XvSIBZUileRUFWkJvJ53OesPMSDnqxOC4BCNr2kz3OhCZ2i/Y8G5wTYie0pw0Z0I
	7EbM32FlxJHNL09wx7EAZIIJxrR+4i7xj3XogZ2TPYMMAC4Dg3tdN0p4p9vf48jQ
	Qx8+YEgkM9Ni8ZrZmbBP8a1Eq0WgjA5YEVweFfKdlyiBXbcWFHwIU7oxu3c5WHfv
	8sFltOQv4/ub2ZqYKrFWLedPDA6f0emVefo2tKUiZ1EG8tFtRSNgimcN/dymplB7
	mM5GvQZVOsw+imYkx+eIw==
X-ME-Sender: <xms:6dmGY2Hv5ROJQB7Q2tn1v3XfZoIUIPSEEFE-u6gDCIqtvHztUZhC4g>
    <xme:6dmGY3UuWiGaDprCfdLK5dub4R_p6U7-geSrIv5Eo8LnJVDyLiC2BMM_IPNv_NuXQ
    cecdMA5FKYt7lvZqw>
X-ME-Received: <xmr:6dmGYwI-X3p6Uv1-bidb3svDqarniEjvr86LurEwhlU3zKgq9Zo_f4G8yL-lvR3VTGzOKWG-yRxmHX6IB2AGqg4FInAmQLTg1f8kuFH71U52UwggigTIhswYLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtddvgdeikecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfvvehfhffujggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepheettdefgeeuudelvdffleejheejueeludduiedvkeffgeetueev
    vdelvdetfeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:6dmGYwGf_tadIRd4AOdQKPaY_Y9JiZaizfzChXmVyURMks__a86E1Q>
    <xmx:6dmGY8VddPxxYz_U0wA-_LQDSqHkqAbxC8U8ZlPXrkYuEPe9HcVqgQ>
    <xmx:6dmGYzOHTdKgQPTepCc5-NHP56RVkqy8nJSDZn9cfZ8JwGlsppY9Tw>
    <xmx:6tmGY9t9UXNosbkwSqnTH2p36V3wBQ1n44_HEOEE5zgfkldbs458-Q>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Nov 2022 23:19:53 -0500 (EST)
Message-ID: <167c5c23-2863-7882-15ea-e251ed3caf8d@sholland.org>
Date: Tue, 29 Nov 2022 22:19:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>,
 Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221129140313.886192-1-apatel@ventanamicro.com>
 <20221129140313.886192-2-apatel@ventanamicro.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v4 1/3] RISC-V: time: initialize broadcast hrtimer based
 clock event device
In-Reply-To: <20221129140313.886192-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_201956_928978_371D6A88 
X-CRM114-Status: GOOD (  16.25  )
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

On 11/29/22 08:03, Anup Patel wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Similarly to commit 022eb8ae8b5e ("ARM: 8938/1: kernel: initialize
> broadcast hrtimer based clock event device"), RISC-V needs to initiate
> hrtimers before C3STOP can be used. Otherwise, the introduction of C3STOP

Specifically it is the hrtimer-based broadcast clockevent that we need
to initialize, not hrtimers as a whole.

> for the RISC-V arch timer in commit 232ccac1bd9b
> ("clocksource/drivers/riscv: Events are stopped during CPU suspend")

Maybe add some more details here:

... leaves us without any broadcast timer registered. This prevents the
kernel from entering oneshot mode, which ...

> breaks timer behaviour, for example clock_nanosleep().
> 
> A test app that sleeps each cpu for 6, 5, 4, 3 ms respectively, HZ=250
> & C3STOP enabled, the sleep times are rounded up to the next jiffy:
> == CPU: 1 ==      == CPU: 2 ==      == CPU: 3 ==      == CPU: 4 ==
> Mean: 7.974992    Mean: 7.976534    Mean: 7.962591    Mean: 3.952179
> Std Dev: 0.154374 Std Dev: 0.156082 Std Dev: 0.171018 Std Dev: 0.076193
> Hi: 9.472000      Hi: 10.495000     Hi: 8.864000      Hi: 4.736000
> Lo: 6.087000      Lo: 6.380000      Lo: 4.872000      Lo: 3.403000
> Samples: 521      Samples: 521      Samples: 521      Samples: 521
> 
> Link: https://lore.kernel.org/linux-riscv/YzYTNQRxLr7Q9JR0@spud/
> Fixes: 232ccac1bd9b ("clocksource/drivers/riscv: Events are stopped during CPU suspend")
> Suggested-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Either way:

Reviewed-by: Samuel Holland <samuel@sholland.org>

> ---
>  arch/riscv/kernel/time.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> index 8217b0f67c6c..1cf21db4fcc7 100644
> --- a/arch/riscv/kernel/time.c
> +++ b/arch/riscv/kernel/time.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/of_clk.h>
> +#include <linux/clockchips.h>
>  #include <linux/clocksource.h>
>  #include <linux/delay.h>
>  #include <asm/sbi.h>
> @@ -29,6 +30,8 @@ void __init time_init(void)
>  
>  	of_clk_init(NULL);
>  	timer_probe();
> +
> +	tick_setup_hrtimer_broadcast();
>  }
>  
>  void clocksource_arch_init(struct clocksource *cs)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
