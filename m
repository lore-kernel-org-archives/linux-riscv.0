Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA04AC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 09:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKoGCt0FAcQFhGlvurH0bIVBs7UMlCGme0GAYHYoNxQ=; b=UUNOfHH22+xcx0
	n0XftzfqV0dCZShiGpvP6+LWxsq1L/zt+Y2WJVKjgwJfKrOnE5QluewcDGxmOWRKKZ+2ZJ3iwg5ji
	XEQyrSL8GaxPNg5aNXQyy0AS2nmwA03a/5cS/5QLiBGsZ0XIMgam+Lp7pIls1PmmVd1LSm/xSycmR
	pRGFQ4TBAHgVbA210CLRPVh8Vuox2q7hswR7y9lUyly/eougW89YvkE4h0MmZHcZlzf4XYZlhvMHt
	180Pfz0lOhb6s+F12LRfKlAO2sgn//VbNjE4pbIGvV82RkBlFmfP6ZgQEFJxw6NP4BG9yToDcbC2+
	go6hG+hr4bhVD/nMFwMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neDHS-00D6SS-Ix; Tue, 12 Apr 2022 09:57:50 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDGY-00D63t-3v
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 09:56:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id B9CA61F444DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649757412;
 bh=ta29d4wnkNjIs8vxiW+spXtMVlKSVX42O2OgeMWUE4M=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=kvhz7L+WR7F9HsP7+DAE1iJ09kPWZRmi5f2q6+wTFMWAjrPkNWY3Jzpgqp30kF162
 9ej87DkBRElok2belFURZJE+6KAffcONlx+uSragUy+EKLYmrLe+OmnInaVU38Utnj
 oGDfaSbiVVHQL6Yf2olT656ydNf9P6W4M76WukTbNC94PbuWprXpn8hcs1neMp19bi
 iNzDzyCfCh2mIdCCNxP2XuZopGSbEx58bF1q1D3kWpmOuMeUlqToTVLTBXzlWDyGYS
 beMdM6XO+lz1xQI7S8U0f+hcwzSbrlRYbQ5mvoaXJTg3bPRXH5hIYNcxpGgH7YbXoc
 9fEZqqnyfRE+w==
Message-ID: <2b603d3d-c6c1-13d7-8f77-042317a41d00@collabora.com>
Date: Tue, 12 Apr 2022 12:56:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v7 17/20] memory: emif: Use kernel_can_power_off()
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer
 <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>, Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
 <20220411233832.391817-18-dmitry.osipenko@collabora.com>
In-Reply-To: <20220411233832.391817-18-dmitry.osipenko@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_025654_341894_E60484F8 
X-CRM114-Status: GOOD (  18.16  )
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


On 4/12/22 02:38, Dmitry Osipenko wrote:
> Replace legacy pm_power_off with kernel_can_power_off() helper that
> is aware about chained power-off handlers.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/memory/emif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
> index edf3ba7447ed..fa6845313a43 100644
> --- a/drivers/memory/emif.c
> +++ b/drivers/memory/emif.c
> @@ -630,7 +630,7 @@ static irqreturn_t emif_threaded_isr(int irq, void *dev_id)
>  		dev_emerg(emif->dev, "SDRAM temperature exceeds operating limit.. Needs shut down!!!\n");
>  
>  		/* If we have Power OFF ability, use it, else try restarting */
> -		if (pm_power_off) {
> +		if (kernel_can_power_off()) {
>  			kernel_power_off();
>  		} else {
>  			WARN(1, "FIXME: NO pm_power_off!!! trying restart\n");

Adding ack from Krzysztof that he gave to v6. It's missing in v7 by
accident.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
