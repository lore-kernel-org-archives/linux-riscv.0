Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCB3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 22:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V21+hL1dIi+Z8mM1SA2F8UBSxyZ+XZllfScxL2ul/Lw=; b=szUVNwaDmAu/y9
	JojBC9oEGwHDglzT5wsoFyfwq7IV9FFVWHRpMXAGqfhfaPOCRiHbo8SDyHXTYjpIXOPJnSo/tFcn9
	ykrFsJn12aQPVHKrUjlEF4Hc6qvdvHNdoXoaTT5mV+rUZ4nGoTOc8VjASB4GXNvwNMWivnR/BjCNw
	mBmixTJfGnLgqGP8vafNYuyeuLqlxqgndf4hBRRFsKBKNpDayFX9/QekQRHxqhwJh5lPsdv/gqhhb
	xZsSicFI48uw2+pJ164yusvLM2tJuhDbvN82KyWn3IixAQZ5ukQyI6nICnZ4CXpAAc4S4jyKvEgOz
	UVV5IQrRH3RKEZD5dSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nelVH-002uxL-7s; Wed, 13 Apr 2022 22:30:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nelP9-002s55-OI
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 22:24:05 +0000
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown
 [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 16B2A1F47620;
 Wed, 13 Apr 2022 23:23:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649888639;
 bh=EkR5aP9YXjDV++4Mm3vdM0ntQFHoUFn8du5hNEWzcVU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j1A1c0tVlfMHwkO7ph7+BXecjl3zjCSCuFY4mjDRsMmEMUiSRn2BdhdRX28bqNwRd
 0kArRjhlR3IJGzxnsIsIV55CLgmFFI2NSRANmlAgGh9kCXVIhjheVEf98HAY8hRICr
 de+NRfs0/E1u09npw7AvIBnHJ1RV4t8z84ccFmlq2rh+QRMZrOxIOsnFLQ8+zt1Kd4
 qKUl7Umpny+Mkmr77FYSLFjlQUix00R1aWWELoW4IA9Fdi4ygNsJKyHTTDcHL21FER
 5mHsl6TGS0ii5K5AIMCobu3OluHXcov5Vb4ZmIfOFm8YTbDv+QPwuKnXvhZ8Xql3Cd
 iLKh0vklwzMtQ==
Message-ID: <af51d9d0-26ba-fc66-05f1-d92ef7172730@collabora.com>
Date: Thu, 14 Apr 2022 01:23:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v7 03/20] reboot: Print error message if restart handler
 has duplicated priority
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer
 <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
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
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>, Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
 <20220411233832.391817-4-dmitry.osipenko@collabora.com>
 <CAJZ5v0gf1J+yPW14TAdLGLGfO+-2s=r0DDP7d+Rgop3=dB0gaQ@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAJZ5v0gf1J+yPW14TAdLGLGfO+-2s=r0DDP7d+Rgop3=dB0gaQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_152404_246049_DA2060ED 
X-CRM114-Status: GOOD (  23.34  )
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

On 4/13/22 21:48, Rafael J. Wysocki wrote:
> On Tue, Apr 12, 2022 at 1:39 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> Add sanity check which ensures that there are no two restart handlers
>> registered using the same priority. This requirement will become mandatory
>> once all drivers will be converted to the new API and such errors will be
>> fixed.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> The first two patches in the series are fine with me and there's only
> one minor nit regarding this one (below).
> 
>> ---
>>  kernel/reboot.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/kernel/reboot.c b/kernel/reboot.c
>> index ed4e6dfb7d44..acdae4e95061 100644
>> --- a/kernel/reboot.c
>> +++ b/kernel/reboot.c
>> @@ -182,6 +182,21 @@ static ATOMIC_NOTIFIER_HEAD(restart_handler_list);
>>   */
>>  int register_restart_handler(struct notifier_block *nb)
>>  {
>> +       int ret;
>> +
>> +       ret = atomic_notifier_chain_register_unique_prio(&restart_handler_list, nb);
>> +       if (ret != -EBUSY)
>> +               return ret;
>> +
>> +       /*
>> +        * Handler must have unique priority. Otherwise call order is
>> +        * determined by registration order, which is unreliable.
>> +        *
>> +        * This requirement will become mandatory once all drivers
>> +        * will be converted to use new sys-off API.
>> +        */
>> +       pr_err("failed to register restart handler using unique priority\n");
> 
> I would use pr_info() here, because this is not a substantial error AFAICS.

It's indeed not a substantial error so far, but it will become
substantial later on once only unique priorities will be allowed. The
pr_warn() could be a good compromise here, pr_info() is too mild, IMO.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
