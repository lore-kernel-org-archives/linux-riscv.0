Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497E0C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 05:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1y+6Nt9Ff/nIhg2eXOEP9hRM4oY0OfQK6mjguL5mgQ=; b=xCjFCmtSoQpaR/
	1DUCwYA61xDh32OWW33479blVmDGvtkxMH9HDi4RIvxrmMFBDnIP7n9dJGEilBvh2TfPAYUOX75Me
	Jf9/wFMVL5m/Lt/jO6plnBHhhg0LDPxrtqdBnN3HMixeYbbCflvIdfCuJUO6qiThKBJlo9hKZNIDp
	3WZJS21VALUUFeI7e1Rz97ax7HyeY9IGwaJnk6+MLHrziQPVe6SXnOs2O2lKd1DUFcdNNaICl0feU
	xFawE1lWp+Q0+ppmoFu4TRiGk8fqQRoesmbHaD4ntRQl1bx2xYTsWxkcI9dpSObo0Auqvr1zA6dWz
	C6VXverVFP42vEH1oqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouSL5-00G89I-DD; Mon, 14 Nov 2022 05:48:59 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouSKu-00G84j-Qi
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 05:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1668404928; x=1699940928;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=v1sR2mwFH9dmYdHzu0koJ50qxkQ0XF8GxeWMZxBQMlk=;
  b=LtbeCq1JD2RywULCrx9CN5jCnzxWLPt+GEQ727SWbuADAf3vC1GMNabt
   wRJ8Yi14wQeIieejAtbpjtt9CAwo44PFZPIddN1Wh5YrWmi4yuh+DzAR3
   wJ/VZ/CKiFmK4my6f5BMcfy6SqHLrzHkw+78VAIE5ek8Rn389UiDkSmtG
   MIfz5p9Q/xINLaN8p4AnHlTp5KOKTYBBSE/FKIyF5VWcH8+KmUNwDhoNf
   eSebEr6Q2cLcufBGBjrcMQzPvvqgikXC6L2LdsIvSZR3sdF+tHd67NuvF
   B3zDSAUSIWCfDEBiN+7WdGSQKnL2aPvtnc1ruvT+NH2uQKmYmksh77Ooe
   w==;
X-IronPort-AV: E=Sophos;i="5.96,161,1665417600"; 
   d="scan'208";a="328292712"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2022 13:48:40 +0800
IronPort-SDR: V5gkhapwEmKfPEupMrU6mPg99w9i/g/eG69mqI7JJxU5wHS3PJk0nHdav4xiZOWrZz9SqO1aPz
 JGHKU9NNWAKQmrahI416Jq+xoouvtbW75wf5vBHTyQotoEC47aOpdxA9N89haYhVQqh/d2NVlx
 qWAAo67+zrKBKZHj7THzXbF1K4NYIgJ7DdS7GX+Ytb4jvsMeEua56tGbHsXJeCsbj4F/qjkMNJ
 9EvayZds4yj3FlBu+iMmgf+tM9g7BMxp1MZEmsKmIQKx0Ti6k17pyNrpXerOy8CKuPXc1qTT6h
 gCM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Nov 2022 21:01:54 -0800
IronPort-SDR: DWk1i+jp+XsBTeqE2t7JEFz9wKyFCLToATYJt0GbAcvB3FcxhVU4KiqC/yYEsXm74b+5Na5kVv
 Nqqn3B7QD3k/UOT2zrv5GkVrdnKmD19GQjE8qHQiSPO09rGYLLP1z+jiE7XF4D0dYQk7EHRIE2
 bMrqm+gTwM+XzPwhvrf06qvPi9FB30xdV2NBCecwA3lFQ6y0FRyKlAjiJsQBaapG2VaOm2qVKP
 ffbM/2QLMT//9oAcMGPypxoFxOS0ToLS6DfJ+9SMExmlaQzqyjNqUrK8oLgk+K1ejaSeu30xvc
 3EE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Nov 2022 21:48:41 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4N9ddz64Qhz1RwvT
	for <linux-riscv@lists.infradead.org>; Sun, 13 Nov 2022 21:48:39 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:references:to:from:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1668404917; x=1670996918; bh=v1sR2mwFH9dmYdHzu0koJ50qxkQ0XF8GxeW
	MZxBQMlk=; b=Jj+OgXCgQLjiUSHdOF9I6MrgaqryVIX7t3nKyq6ZmaxCJrCDf+D
	tGBRwgMUBBGTq4WU22kKDQ58BiVzcFr1xRFoFfI1n8Bxo5+TB1XvlNxdODgFNzfR
	jI637Q7j4BNG1aLfH2JTTKH2lh843Eo9/6TImWIKH46gMtBWsZjKCoxGm9Oozafp
	gcs1atYVDBJpU4XwoYUztHkasGYGgZWrc/JjNE7l3NWvxCnS7nVLlm25abnZU+4P
	jNICFUVM5vo+y+8k+C+JC5BZmVgZ8TARD4EmnhnyFopFQzr/VUu1urRgOa3vVo3h
	xfnBECv6draKEFEd/vChz733S2WF8QS+58w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zTTnkdw9zbX3 for <linux-riscv@lists.infradead.org>;
	Sun, 13 Nov 2022 21:48:37 -0800 (PST)
Received: from [10.225.163.46] (unknown [10.225.163.46])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4N9ddp5cqHz1RvLy;
	Sun, 13 Nov 2022 21:48:30 -0800 (PST)
Message-ID: <93079aba-362e-5d1e-e9b4-dfe3a84da750@opensource.wdc.com>
Date: Mon, 14 Nov 2022 14:48:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Deprecating and removing SLOB
Content-Language: en-US
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
To: Conor Dooley <conor@kernel.org>, Vlastimil Babka <vbabka@suse.cz>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
 Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Pekka Enberg <penberg@kernel.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Rustam Kovhaev <rkovhaev@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Josh Triplett <josh@joshtriplett.org>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Alexander Shiyan <shc_work@mail.ru>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor.Dooley@microchip.com,
 Paul Cercueil <paul@crapouillou.net>
References: <b35c3f82-f67b-2103-7d82-7a7ba7521439@suse.cz>
 <CA+CK2bD-uVGJ0=9uc7Lt5zwY+2PM2RTcfOhxEd65S7TvTrJULA@mail.gmail.com>
 <c1caa5ce-eeaf-8038-2dea-051c98aade45@suse.cz> <Y260tkNHc2vFITJ3@spud>
 <a5bba3ca-da19-293c-c01b-a28291533466@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <a5bba3ca-da19-293c-c01b-a28291533466@opensource.wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_214848_881279_C66FE599 
X-CRM114-Status: GOOD (  31.44  )
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

On 11/14/22 10:55, Damien Le Moal wrote:
> On 11/12/22 05:46, Conor Dooley wrote:
>> On Fri, Nov 11, 2022 at 11:33:30AM +0100, Vlastimil Babka wrote:
>>> On 11/8/22 22:44, Pasha Tatashin wrote:
>>>> On Tue, Nov 8, 2022 at 10:55 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> as we all know, we currently have three slab allocators. As we discussed
>>>>> at LPC [1], it is my hope that one of these allocators has a future, and
>>>>> two of them do not.
>>>>>
>>>>> The unsurprising reasons include code maintenance burden, other features
>>>>> compatible with only a subset of allocators (or more effort spent on the
>>>>> features), blocking API improvements (more on that below), and my
>>>>> inability to pronounce SLAB and SLUB in a properly distinguishable way,
>>>>> without resorting to spelling out the letters.
>>>>>
>>>>> I think (but may be proven wrong) that SLOB is the easier target of the
>>>>> two to be removed, so I'd like to focus on it first.
>>>>>
>>>>> I believe SLOB can be removed because:
>>>>>
>>>>> - AFAIK nobody really uses it? It strives for minimal memory footprint
>>>>> by putting all objects together, which has its CPU performance costs
>>>>> (locking, lack of percpu caching, searching for free space...). I'm not
>>>>> aware of any "tiny linux" deployment that opts for this. For example,
>>>>> OpenWRT seems to use SLUB and the devices these days have e.g. 128MB
>>>>> RAM, not up to 16 MB anymore. I've heard anecdotes that the performance
>>>>> SLOB impact is too much for those who tried. Googling for
>>>>> "CONFIG_SLOB=y" yielded nothing useful.
>>>>
>>>> I am all for removing SLOB.
>>>>
>>>> There are some devices with configs where SLOB is enabled by default.
>>>> Perhaps, the owners/maintainers of those devices/configs should be
>>>> included into this thread:
>>>>
>>>> tatashin@soleen:~/x/linux$ git grep SLOB=y
>>
>>>> arch/riscv/configs/nommu_k210_defconfig:CONFIG_SLOB=y
>>>> arch/riscv/configs/nommu_k210_sdcard_defconfig:CONFIG_SLOB=y
>>>> arch/riscv/configs/nommu_virt_defconfig:CONFIG_SLOB=y
>>
>>>
>>> Turns out that since SLOB depends on EXPERT, many of those lack it so
>>> running make defconfig ends up with SLUB anyway, unless I miss something.
>>> Only a subset has both SLOB and EXPERT:
>>>
>>>> git grep CONFIG_EXPERT `git grep -l "CONFIG_SLOB=y"`
>>
>>> arch/riscv/configs/nommu_virt_defconfig:CONFIG_EXPERT=y
>>
>> I suppose there's not really a concern with the virt defconfig, but I
>> did check the output of `make nommu_k210_defconfig" and despite not
>> having expert it seems to end up CONFIG_SLOB=y in the generated .config.
>>
>> I do have a board with a k210 so I checked with s/SLOB/SLUB and it still
>> boots etc, but I have no workloads or w/e to run on it.
> 
> I sent a patch to change the k210 defconfig to using SLUB. However...
> 
> The current default config using SLOB gives about 630 free memory pages
> after boot (cat /proc/vmstat). Switching to SLUB, this is down to about
> 400 free memory pages (CONFIG_SLUB_CPU_PARTIAL is off).
> 
> This is with a buildroot kernel 5.19 build including a shell and sd-card
> boot. With SLUB, I get clean boots and a shell prompt as expected. But I
> definitely see more errors with shell commands failing due to allocation
> failures for the shell process fork. So as far as the K210 is concerned,
> switching to SLUB is not ideal.
> 
> I would not want to hold on kernel mm improvements because of this toy
> k210 though, so I am not going to prevent SLOB deprecation. I just wish
> SLUB itself used less memory :)

Did further tests with kernel 6.0.1:
* SLOB: 630 free pages after boot, shell working (occasional shell fork
failure happen though)
* SLAB: getting memory allocation for order 7 failures on boot already
(init process). Shell barely working (high frequency of shell command fork
failures)
* SLUB: getting memory allocation for order 7 failures on boot. I do get a
shell prompt but cannot run any shell command that involves forking a new
process.

So if we want to keep the k210 support functional with a shell, we need
slob. If we reduce that board support to only one application started as
the init process, then I guess anything is OK.

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
