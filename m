Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11871C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOMyxI16s6pYDxtZO8UxyuGd4zvw5mXpH3EIZI20SCY=; b=FNPLnIy5Fdt0N5
	Y1awpoHGFu4cqhAgzQPcrKAtRUvcbA05eqnBvieocmjxv0p5ad223114ZqmIdDvwdG8/qOXS/rsM9
	1dgJ0bRunWxkgqNDINk5baVW9G1kdnhv2gzH7PGUhSUkrB/wFsMBthuuHU3gtxm6eo5D7MtwASxM3
	bKR5P0EjtVwiU/gCGV8jEAXPrsIIA+zfCSU9TktmXrI2Or6q/3jbrCFPOVC0HKyJ0viFRp5/t7BEk
	VoMoXGhV+zBQAoxY0H6V27da+WF3T/ELJVzh2OPpsG6/3LTiVy1H1p8cfqSB3eNIWAmsn+ttL501c
	bH5ISQMa/5YtAvewYNFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neDFw-00D5lU-C4; Tue, 12 Apr 2022 09:56:16 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDFM-00D5YP-KF
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 09:55:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 1E1521F43F0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649757337;
 bh=L7sIocVMVJFFf6pt5kvonBwHJBi8ufG5aawNMHgSOk0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=S7aa0qukIEifv3VA3CuUR35b2mrfJnR/HsoJXzpmjRJMCbhxox8PyYd3y4yAh2cci
 fkdP6WhWpX2fTNoSalTPD6PO9LosH8R/uIddoXqmSbAGkyMpOv7gtxoyhkm7Vdt7Po
 VE+FMV4P/sBi8qGDGbVNV7G1cE0QQC1Psgi2NgDN4gF7AuPhmOvrPWztAg0OKxrhYx
 ZY0kqCMPGfjI965JP3tWKRvKNwoFqex5VZBw8ei+llxHp+CnMQUlR0C0Mb9omyZuyR
 pQwj21iO0qbnTtEuCeKQh+DA2pdqBpS/Tpsp0jFVlk3igIjJYKAd36t5EZ0tHXKfa6
 Nz+EAW2F2/bCw==
Message-ID: <24a38d79-b52e-387b-5ef2-954aef05a49d@collabora.com>
Date: Tue, 12 Apr 2022 12:55:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v7 00/20] Introduce power-off+restart call chain API
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
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
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
 <CAMuHMdVfOpGvF5FR6vFD-3a1h-7Kc_yAKQzWV71PD6mDy6BmZw@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAMuHMdVfOpGvF5FR6vFD-3a1h-7Kc_yAKQzWV71PD6mDy6BmZw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_025540_943335_2FB12019 
X-CRM114-Status: GOOD (  14.63  )
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

On 4/12/22 10:06, Geert Uytterhoeven wrote:
> Hi Dmitry,
> 
> On Tue, Apr 12, 2022 at 1:38 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>> Problem
>> -------
>>
>> SoC devices require power-off call chaining functionality from kernel.
>> We have a widely used restart chaining provided by restart notifier API,
>> but nothing for power-off.
> 
>> Changelog:
>>
>> v7: - Rebased on a recent linux-next. Dropped the recently removed
>>       NDS32 architecture. Only SH and x86 arches left un-acked.
>>
>>     - Added acks from Thomas Bogendoerfer and Krzysztof Kozlowski
>>       to the MIPS and memory/emif patches respectively.
> 
> Looks like you forgot to add the actual acks?

Good catch, thank you! Indeed, I sent out the version without the acks,
but luckily it's only the acks that are missing, the code is fine.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
