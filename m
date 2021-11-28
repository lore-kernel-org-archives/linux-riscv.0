Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD412C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 01:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYT7kHXhQSZ+gQqOQhCMkObwMJ0M5EU4dyuZKVT67hs=; b=39Cyt232igbPVN
	tJjGgrdieVd/vwKPu0LyHtxokFad8gaCOdU8N7GfsB7yQlQi/Gnxf/VwJJh6bd2VfhEC0HnKcWvaD
	vgJyBzTa+2HwKMhC/QidU8XEhErnrc/AbgJbfDMCv9caBqpiCBNG19y5nWcUaxMU7bq+Jcigms5Of
	P6FNFbTfvmLpO62mDB0GNgTmj0aKWmI/pT4Fuq5akXlNdXr6xZPeNRQocL6NJiq1S7TwaWys0/C7n
	bJYmcAgcOFDPpflmvnd8MY1ePtJArSy9TfGB4iCAWO622GSRCxeNkZ5l4wQQ681IdqYQiXEGC/fiO
	8a4uwPsMGPijv24g9n/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mr8nS-00Elry-0Q; Sun, 28 Nov 2021 01:16:02 +0000
Received: from rere.qmqm.pl ([91.227.64.183])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mr8nO-00ElrB-2X; Sun, 28 Nov 2021 01:15:59 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J1rCD4tJRz9Y;
 Sun, 28 Nov 2021 02:15:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638062155; bh=/7+VGRKxSD8xhQyHeA7wxZc9qtdjiI1iETTVe9pYPLI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oXqLZE7x4BBzR6RgITz19akH85JDkj2nuDH72AAzGlf1Y19/zRhLT/EYzkjxSquZY
 lQDmdeOlt8p2X8CEQglQKE82HPyr+MOsLSpQnGJ3s5n+8hbJIsMdPOKL4fZcMf0jgO
 CJ7+TE23XroAl9jtGHsf4Kws8DhnEqHir6C7zTLETfSX3VrDeoLBt5clA/cf/ZoC7B
 31pS0P4z0OUxVHiLECVTcCPYSnqvN5IbEtxNoArldRfYbOgq5wGXjBIkaa3TdqpC0q
 PWCaSN/jTI85sRsru7LR0d1SZHbfWHN7MsxouM8JlzJ+q5vzkEduCAsbuKP/U7sT2N
 iLQXxOKkkTf7g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 02:15:51 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 18/25] x86: Use do_kernel_power_off()
Message-ID: <YaLYR24XRijSmBq3@qmqm.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-19-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211126180101.27818-19-digetx@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_171558_318909_DCB8639F 
X-CRM114-Status: GOOD (  19.94  )
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 26, 2021 at 09:00:54PM +0300, Dmitry Osipenko wrote:
> Kernel now supports chained power-off handlers. Use do_kernel_power_off()
> that invokes chained power-off handlers. It also invokes legacy
> pm_power_off() for now, which will be removed once all drivers will
> be converted to the new power-off API.
> =

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/x86/kernel/reboot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
> index 0a40df66a40d..cd7d9416d81a 100644
> --- a/arch/x86/kernel/reboot.c
> +++ b/arch/x86/kernel/reboot.c
> @@ -747,10 +747,10 @@ static void native_machine_halt(void)
>  =

>  static void native_machine_power_off(void)
>  {
> -	if (pm_power_off) {
> +	if (kernel_can_power_off()) {
>  		if (!reboot_force)
>  			machine_shutdown();
> -		pm_power_off();
> +		do_kernel_power_off();
>  	}

Judging from an old commit from 2006 [1], this can be rewritten as:

if (!reboot_force && kernel_can_power_off())
	machine_shutdown();
do_kernel_power_off();

And maybe later reworked so it doesn't need kernel_can_power_off().

[1] http://lkml.iu.edu/hypermail//linux/kernel/0511.3/0681.html

Best Regards
Micha=B3 Miros=B3aw

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
