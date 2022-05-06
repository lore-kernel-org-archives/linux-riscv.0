Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A0FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 14:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5hAlq1NULbOEH8iFPpmFT6fTP1hLwAwWZPtRspwYUc=; b=TTPMfRAnrb9I1D
	Y2hub6ANnpHVnVlr7RnFfsO2tXz3IyiPMeCLVo1R2yTBnDvlW4BLNyiSLN81mKm6juxahNSYy8n3g
	DTquOjKfSVy+YlW69RByfWUlySmfK7H/pc1TC1/BCJpFIdTwVdoflm4tO5v4VovkQ5KolfbkKdOg6
	b1DapDkgNvM0+WHB1GTMBqWUNqeMPaGtjtVyA09lz3C5/pH90575J28b3YpGbtp7yXvmaJ43izKNV
	K7BH1vJd4N8c4Yt9V74VOZnjT55E0Rl0hodb7g4uuuEhRIgeDGZ5eKJsKnpAO5pB0EJ7esXOgVjCZ
	FHP3ZuIGtf3djtpaFHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmyfT-003h7g-N9; Fri, 06 May 2022 14:10:51 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmyfL-003gve-5E
 for linux-riscv@lists.infradead.org; Fri, 06 May 2022 14:10:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id C4EBD1F46719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651846231;
 bh=aPzN11eOYyBmn6uYxSJ4z+OxGW0B11goKlzatjEFOG4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=A5kW1JJmvHfMp+G3BYZfs1DtIoJxwTSAkQcm9HkU230sGHCbaarPy3d3ylVb7ghQK
 QFidNeP16CsPIu7NGef5buR6vQrZaa2Bu2Ol7ocivR52MK99+p14lZHhPhckFBadHq
 LWO8HGz0L5XHJgOXIl4zHum9KGrTPQ8XNRCAiPLiBFHqfgiXkDJFYnZvSeZjgWY6Sf
 b+r6JcWvC90AjEGx12tTLe293/2dwUtSGPf4vDeIZmmldanQoeJoRJ1W5+Zs/dm4mK
 YMULBdy55mQ6HS0+7WhL/7UJ3ikAvXuW+YZrNYtURWDPqYm9/aozEGozBwUb1cqkv6
 H0OATVRjsYPpg==
Message-ID: <ca422804-0fa0-5fef-07e2-a9ff005a495c@collabora.com>
Date: Fri, 6 May 2022 17:10:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v7 04/20] kernel: Add combined power-off+restart handler
 call chain API
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
 <20220411233832.391817-5-dmitry.osipenko@collabora.com>
 <CAJZ5v0gnTSoeNP+QXwrZ45FQY4howVkJMuCjM=j+_-2BngJdQg@mail.gmail.com>
 <990621e7-9f8a-8b4a-02ec-fd6c1e1f48ff@collabora.com>
 <CAJZ5v0jxXtwot0qpib4UG8Tz8Hd1dEbgo58tEdPFboU8xwKHNw@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAJZ5v0jxXtwot0qpib4UG8Tz8Hd1dEbgo58tEdPFboU8xwKHNw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_071043_426240_7A1508D4 
X-CRM114-Status: GOOD (  15.70  )
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

On 4/20/22 21:47, Rafael J. Wysocki wrote:
>>>> +       POWEROFF_PREPARE,
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct power_off_data - Power-off callback argument
>>>> + *
>>>> + * @cb_data: Callback data.
>>>> + */
>>>> +struct power_off_data {
>>>> +       void *cb_data;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct power_off_prep_data - Power-off preparation callback argument
>>>> + *
>>>> + * @cb_data: Callback data.
>>>> + */
>>>> +struct power_off_prep_data {
>>>> +       void *cb_data;
>>>> +};
>>> Why does this need to be a separate data type?
>> To allow us extend the "struct power_off_prep_data" with more parameters
>> later on without a need to update each driver with the new arguments.

> I'm not really sure what you mean here.  Can you give an example?
> 

The restart callbacks use more than the cb_data and we have:

struct restart_data {
	void *cb_data;
	const char *cmd;
	bool stop_chain;
	enum reboot_mode mode;
};

If we'll ever need to extended struct power_off_data similarly to the
restart_data, then we will need to update all the power-off callbacks
instead of adding a new field to the power_off_data.

Hence, for example, if you'll want to extend power_off_data with "enum
poweroff_mode mode", then for each driver you'll need to do this change:

-power_off(void *cb_data)
+power_off(void *cb_data, enum poweroff_mode mode)

and you won't need to do that using struct power_off_data.

Why do we need this? Because I saw in the past people changing kernel
APIs that way when they wanted to add new arguments and then needed to
update every call site around the kernel.

-- 
Best regards,
Dmitry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
