Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA6EC52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 11:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8X8Ytkv21CHUB2NdGQ5Takmt/bnucgnyZ4UsIxqSTSY=; b=AOPXlQEsi+0YaK
	CUNDdW0FJLH0nmSPbjSgnM9jU5/YbDipFH9Nz9cmhBcFp1o02CiJTHB25QYSJc+mkC+TmG6ENvHU2
	SsJ06HxNQO/fE6+YcHI1sGYfedBuvri3uYxstEpQuiLjIFH2w3sEgfgLB4dvZxItYLPQQQ5sTC4ng
	5Rort/hJFTAyNjp9NuMDDm3o02jVxUK7JMvhUDXGmptD3KFZRofcl8U+icPZ/WA4vxkLFOVkQPI3a
	TYEvLhpomZ9uuUr6SSNnTVgIKx8dCdVbO0MJ4flUI3ivX92kisdPc/g1/9XvM1xSKPa5vRDDvIFqe
	YVhZHchYQ5BrLJTgxSNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seYtq-00000009obP-2gRx;
	Thu, 15 Aug 2024 11:44:14 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seYtm-00000009oaO-0T0j
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 11:44:13 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723722247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QqUsbSq2R+8U72AfUd3SQ6tENIkj+ufWopC5V72X18k=;
	b=t+XoJRf3L9lVbi8e14cbrqRYKPnQlndmlZxwJStKwWpyEeOVHZ/IXPgN8AU6X6b60ty2cF
	c1nLatrNtjk+gcj+nr2zoLBEgxGyhkKUFeBaow9/YI5D3dgS57sFPai14ujNjOLePMBYER
	IJf4W97IkeLLesRT+3txmsL9zQCHPmwZzw4cJCekYUyL4AK0VBND0dgCewxci9N2wk4DoK
	/ZdDbADTvnKooJjw2t28lQMSK4gBhqNXouBijtfwxmVnangSJO1BoFddeus7PLkkGFuP1P
	q0VSQjDAbKQbVBq7qd1WTaXVUl8tgsVlQYObUTarCZf2uvvfM/ITqRdg+U2Yqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723722247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QqUsbSq2R+8U72AfUd3SQ6tENIkj+ufWopC5V72X18k=;
	b=17/VBa7gEEyquNhFgRqvepRm1Y15NrPBQaltTU9nrKhdO4jrXKV204Z/bfEF3VimsvaaD3
	ikOoDu9+rxzSWjCQ==
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Emil Renner
 Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Anup Patel
 <apatel@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland
 <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
In-Reply-To: <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
 <87jzgjnh9z.ffs@tglx>
 <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
Date: Thu, 15 Aug 2024 13:44:07 +0200
Message-ID: <87ttfmm2ns.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_044410_314868_B101CF3D 
X-CRM114-Status: GOOD (  10.69  )
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

On Thu, Aug 15 2024 at 03:29, Emil Renner Berthing wrote:
> Thomas Gleixner wrote:
> Thanks for looking at this! Unfortunately the above patch isn't enough to fix
> the issue:
>
> https://termbin.com/7sgc
>
> It still hangs after the "[    0.176451] cpuidle: using governor teo" message
> until the watchdog reboots the systems.

So what's puzzling is that there is a timer installed early on:

[    0.000000] clocksource: riscv_clocksource: ....

That same init function installs the per cpu riscv clockevent, so there
should be a timer available.

The deffered probing of the PLIC driver delays obviously the probing of
the sun4i timer, but that should not matter when another timer is
available. So the sun4i driver might be a red herring.

Can you please add "ignore_loglevel initcall_debug" to the command line
and provide the output of a booting and a failing kernel?

And on the booting kernel please provide the output from:

# cat /sys/devices/system/clockevents/clockevent0/current_device
# cat /sys/devices/system/clockevents/broadcast/current_device
# cat /sys/devices/system/clocksource/clocksource0/current_clocksource

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
