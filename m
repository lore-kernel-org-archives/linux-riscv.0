Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0D4C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 01:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LpUv551NCYi3h8OO029nDLGHXTcQ4WCaOYZgvMe7ME=; b=lT4VXpZg3vo0tR
	XD+AbMW/ACJZ7ycKNtvKtOAsayQwM5o6cYMX3cif3ybY3PxcxFNyQsk4IZ5wFNR2eXJlo8z7uDp9H
	8GZ3CZ7YgFODWtyJ04tT0rAcOUHaRLuS6rxQbSdnB0ln17OofDNtNteXgmYsOK9jZH6zWD4GEant5
	fmKqtsNd5tzQayB1VOKJ42LRFgZJK3HJ1uaDqvnZSCblqVBRwgSTRCjjydkMiZPe1wIhCS3FhMtYd
	zU05sjnxguAodKDozWlpH/REubjj568ybq+AKRKUCmgxFGEtUg29dv952SWyNHQZJu1nuouplD/Tm
	wFXNahZVAZ6rJKo30RTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouOhF-00FU0C-GG; Mon, 14 Nov 2022 01:55:37 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouOh5-00FTy7-C1
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 01:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1668390927; x=1699926927;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nyOFTXz3d9X6eMOZsmuYqPSZyAOtJSgUq3fJ16zqsqM=;
  b=G1c3E/AWOgdg7aoiIEEedwKklsJYMQiVmYgWqtgS/gWRkeQ6wlvPh8RY
   KReFb5KBxH0dXNm55mKOkAR5P0m4JBY7bhFdXiNUdW1SuYzg/MbG+EsfX
   otN3K9wEfQIlOQcwt62DBMLz1oCD2rLMdmR8HaujcgBjxAeBspiz+rJ3s
   4teE+opuY1uErEVZz9Dm9pxcN2rwblrHSBAK9lUJqM3llGU/jnY9KSFEf
   XgMI3TZhxtC0GuHH62lPC3XSRDTsqFvhFrzSEeW5MiQTCXxu6Uc4UgROd
   Vv51qh5zKFAmPm0pXthONftMp0TCcNFot2aG6dzSxhp/k/P2rwxb/dxX0
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,161,1665417600"; 
   d="scan'208";a="214449246"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2022 09:55:18 +0800
IronPort-SDR: I3w4ye/7rxwLbszi5JzhEkQzPlUDsKS7D0lM7sKcM6DVDKY426EWjVq7oPpnzbzISm4kiBWAgC
 rm1H3hqaMcludbpNeuTQS5giPUDyqlaHyMn7WBfYhAi6t/pE//2NrFZephWsCwWfBHoHsUcoXq
 2PGIVye1MF+0oXxGQ7730dqgoyRiuRxnY6MHOsPpsGrXRKTwHFnWOEMhTiEf8RezSHfpwl9rGs
 v9JOnzQwbWsjNlXG3PnUcMArNNmanQBED/bonHbJvvr/dRn+vS9goVHls3XaUSj02z6wRB/Qhm
 Arc=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Nov 2022 17:14:17 -0800
IronPort-SDR: 5opJvc0+jqrwOtE0pAehyNUG1HjYmieuKlaSZANK/6aM9uKkmN4kdlrVmsIyjum5Pb0jNFVkOl
 CfqRPea6t7MuZNx15cK9Tq9kyiU8ckG7nmpQOc1aAttseqo9SM6IH7nwajxBcccYlYCtbiBdyG
 hhSGeqoWXSoLLocPTlbkwaVXtGAYrOMvG2w3qSzg6nHrQbpmHLEgx1EsjEZB3u6TETHittihcf
 ZEtlNEQjT/jMe7d9PmMYCvxtmPDU3isjI8LDCfc5TpfNo4umaANWbV50gk4jQSR4vSRxJOj/O9
 srw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Nov 2022 17:55:19 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4N9XSj4VyVz1RvTr
	for <linux-riscv@lists.infradead.org>; Sun, 13 Nov 2022 17:55:17 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1668390916; x=1670982917; bh=nyOFTXz3d9X6eMOZsmuYqPSZyAOtJSgUq3f
	J16zqsqM=; b=B7FIG24k/AkrbPRlxTTp+YAyPl2DtgOB49NBmCF1uJe1rzavO/J
	NnzQvOw5y6jZvpQDwbtMGe43anknJxLtaNq6ye3vNETqunaV7aPGbWlB5yTcJneZ
	dep7KJ5wOdey9UA9pJO55QieVSkTNlBVhNgkyYu31fgMtYTbglkkIlf7pD0mZS9U
	TV2BXR5pUYz63ZjDo3FL0DtWJD6Q7xWT2ajGfhM6MNxiQ4WATwU3nDj6s5pOHaUi
	EtT3fitwsRCuczjPghjRbOWkaSka9UnIqihDhmL1YAsBAgEnAIKojathaHJVhQgy
	vt64Jcr8YksY1GcywsWLEhEhXqIrpmbW4JA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mdZo0tg67i9W for <linux-riscv@lists.infradead.org>;
	Sun, 13 Nov 2022 17:55:16 -0800 (PST)
Received: from [10.225.163.46] (unknown [10.225.163.46])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4N9XSY61WPz1RvLy;
	Sun, 13 Nov 2022 17:55:09 -0800 (PST)
Message-ID: <a5bba3ca-da19-293c-c01b-a28291533466@opensource.wdc.com>
Date: Mon, 14 Nov 2022 10:55:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Deprecating and removing SLOB
Content-Language: en-US
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
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <Y260tkNHc2vFITJ3@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_175527_482933_A1CED567 
X-CRM114-Status: GOOD (  27.11  )
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

On 11/12/22 05:46, Conor Dooley wrote:
> On Fri, Nov 11, 2022 at 11:33:30AM +0100, Vlastimil Babka wrote:
>> On 11/8/22 22:44, Pasha Tatashin wrote:
>>> On Tue, Nov 8, 2022 at 10:55 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>>>>
>>>> Hi,
>>>>
>>>> as we all know, we currently have three slab allocators. As we discussed
>>>> at LPC [1], it is my hope that one of these allocators has a future, and
>>>> two of them do not.
>>>>
>>>> The unsurprising reasons include code maintenance burden, other features
>>>> compatible with only a subset of allocators (or more effort spent on the
>>>> features), blocking API improvements (more on that below), and my
>>>> inability to pronounce SLAB and SLUB in a properly distinguishable way,
>>>> without resorting to spelling out the letters.
>>>>
>>>> I think (but may be proven wrong) that SLOB is the easier target of the
>>>> two to be removed, so I'd like to focus on it first.
>>>>
>>>> I believe SLOB can be removed because:
>>>>
>>>> - AFAIK nobody really uses it? It strives for minimal memory footprint
>>>> by putting all objects together, which has its CPU performance costs
>>>> (locking, lack of percpu caching, searching for free space...). I'm not
>>>> aware of any "tiny linux" deployment that opts for this. For example,
>>>> OpenWRT seems to use SLUB and the devices these days have e.g. 128MB
>>>> RAM, not up to 16 MB anymore. I've heard anecdotes that the performance
>>>> SLOB impact is too much for those who tried. Googling for
>>>> "CONFIG_SLOB=y" yielded nothing useful.
>>>
>>> I am all for removing SLOB.
>>>
>>> There are some devices with configs where SLOB is enabled by default.
>>> Perhaps, the owners/maintainers of those devices/configs should be
>>> included into this thread:
>>>
>>> tatashin@soleen:~/x/linux$ git grep SLOB=y
> 
>>> arch/riscv/configs/nommu_k210_defconfig:CONFIG_SLOB=y
>>> arch/riscv/configs/nommu_k210_sdcard_defconfig:CONFIG_SLOB=y
>>> arch/riscv/configs/nommu_virt_defconfig:CONFIG_SLOB=y
> 
>>
>> Turns out that since SLOB depends on EXPERT, many of those lack it so
>> running make defconfig ends up with SLUB anyway, unless I miss something.
>> Only a subset has both SLOB and EXPERT:
>>
>>> git grep CONFIG_EXPERT `git grep -l "CONFIG_SLOB=y"`
> 
>> arch/riscv/configs/nommu_virt_defconfig:CONFIG_EXPERT=y
> 
> I suppose there's not really a concern with the virt defconfig, but I
> did check the output of `make nommu_k210_defconfig" and despite not
> having expert it seems to end up CONFIG_SLOB=y in the generated .config.
> 
> I do have a board with a k210 so I checked with s/SLOB/SLUB and it still
> boots etc, but I have no workloads or w/e to run on it.

I sent a patch to change the k210 defconfig to using SLUB. However...

The current default config using SLOB gives about 630 free memory pages
after boot (cat /proc/vmstat). Switching to SLUB, this is down to about
400 free memory pages (CONFIG_SLUB_CPU_PARTIAL is off).

This is with a buildroot kernel 5.19 build including a shell and sd-card
boot. With SLUB, I get clean boots and a shell prompt as expected. But I
definitely see more errors with shell commands failing due to allocation
failures for the shell process fork. So as far as the K210 is concerned,
switching to SLUB is not ideal.

I would not want to hold on kernel mm improvements because of this toy
k210 though, so I am not going to prevent SLOB deprecation. I just wish
SLUB itself used less memory :)


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
