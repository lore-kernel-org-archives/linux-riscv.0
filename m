Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6F6C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 08:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/FT/DYlvdFqONr9JlxBLi/V7S6737JSVfoLJsqLq69E=; b=oiojCGuEISns86
	ZezdKjN18cUZOL2zWvsxjWmJw02Y0qntJ4QWErZA01lmEFK4PIvSve0CebittoHd80H/WAmzxjc1o
	Vu4/XCSst9uS/cZjYKVo1UcRopVLMsJpfP+RXpgOcy4Oku45T/dFSa3T27mdfKY4kf/EiNbWyueA2
	tgAfqWBwOOuT2Aty45eNc6Uh1agj4KNLGtgr3TRPJ9F6IK6BnEVd2pHKxKTQfLE55y0ZhNS8MTM7N
	OTmjLu4g6aMmJO3lt+ohPTkxSO/xIVcw2Unnkkkd2ZnykoKGzPxZumwqbOnCFpfRftdRiGp0ymefU
	EEdIsBwHmtXlTIMATLrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovDNZ-0012Ia-Ix; Wed, 16 Nov 2022 08:02:41 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovDNP-0012Es-9O
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 08:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1668585751; x=1700121751;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aiQ1E4MA/V7AYoAnhMYGLoTHKrhMUZFLqWEuM1zwwcE=;
  b=caPyWep+dOy1TZGa8k4S/AbEfyfnqBXinxcZFiJEzolnUaJ8m0wzbKFD
   WFYOpwdPNE2KGWMZNK5S8AQlY7dY31ThGQfmpNKoUHqPbz7jyOltnnHmw
   fecica87UnvV/u71S72cdDG14nHIw1zDwdCA4HrWkgFNzS5XIrD/0qnev
   17HeOAYvKMtUr83C7DKGzDNYZyPeDail4y+2+VfBfqVBKLlwKM/DjzwsX
   CbkFTvK8+YGFS+gLo4qV9tEUSztCrePpHR/lcN5UKTfDPkYXPzCrxZ3Y2
   hj1RZ0SQhBCouU3vn4BbR3TFYbHpwHqEa1I4NCl+Z3mRsSlNG4xA5agrW
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,167,1665417600"; 
   d="scan'208";a="214661341"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2022 16:02:23 +0800
IronPort-SDR: /EDWscyk/WPwZ564QSfarINR3Igo03/f828XUOnz6QGKIx7nndtwWH6mKJlR9NupkWE/6LA5aw
 ZD5UGzSMzOgQSbWDV77ImlnFuU1VOFq5pfRuQi9m5Tz89vI8Yb8bCWRY/mf/ZDLhP9AuRpwZh5
 I2/A42N8zRJAhuvj8LFgxhF85lHwmRC1Gry2kL6hq9D0NTh4/SmgX/AqbbotwKSltiup1ExVWm
 LDtznUSaCmQun361mb6ySc3c36T90zcKWdZpOn+BRD6VBrOmZkJzQSHhKE2CBNvsMEt9CzmP9r
 9BU=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Nov 2022 23:15:34 -0800
IronPort-SDR: 60cubt/aGmgIOXnyKSQkQzqMypxoAhsbQbUADcY10TbFGuH5bLJnvUlEgEeDvrG6gRRXxvJ0FM
 TQZe0BgZaAMN25DElYbvVwhPiv0iLscLAMtIhlJyatYvg1vbyWcL4TKxaMP08dovnqptVkVFh6
 buWDPVVNpnGoCsCd5JhXuw4vcB+sOjPEgLizbPDyyvnPVAs3AlOro7gD1ft03i3dDPC0e0kqm5
 BWCSjD7oJqQwEID/eAd90cqpnwT18MQdi4qkNze8y22B/jUoPwXyV2c77GDZVXBWpxbjAP0Y9k
 u7U=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Nov 2022 00:02:24 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NBwWL1bssz1RvTr
	for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 00:02:22 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1668585741; x=1671177742; bh=aiQ1E4MA/V7AYoAnhMYGLoTHKrhMUZFLqWE
	uM1zwwcE=; b=HA1Ry+cg6RJ2gjCP8QzPoYEqbM+un5RWNEqtxmceQW57Bclcbag
	NGVq1I/ljnUAG7e+dWbg6SHQpAYCbV7sOdCxgqFgZ4pzgoNsKHS4IH8zUw04Ehu5
	dOBiDPL4KmGViD3JeZAwkB6etQOKepL41kIde5Ba4pgzbuGnRM1pZxWBs7ausiGW
	xHuUG/WUR1me2OOtLMdfMVusiCeskJy/VucmD/2wmEsQcj4UuKvYmRVFE6j4LVqm
	2iq97BemLKEd79gUPRS2/gmHt/dXWiGkEr5tvvvKOvf7ul4Wt6jiIkw7aMRmg/5x
	PB1wyQR574lwPScueQHcrY1HZ3N0U57D1/A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1BNLTFeI7Inz for <linux-riscv@lists.infradead.org>;
	Wed, 16 Nov 2022 00:02:21 -0800 (PST)
Received: from [10.89.82.19] (c02drav6md6t.dhcp.fujisawa.hgst.com [10.89.82.19])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NBwW94Qxqz1RvLy;
	Wed, 16 Nov 2022 00:02:13 -0800 (PST)
Message-ID: <b119e0b7-be10-46d8-886b-b5071b1b9562@opensource.wdc.com>
Date: Wed, 16 Nov 2022 17:02:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: Deprecating and removing SLOB
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 Conor Dooley <conor@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Pekka Enberg <penberg@kernel.org>,
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
References: <CA+CK2bD-uVGJ0=9uc7Lt5zwY+2PM2RTcfOhxEd65S7TvTrJULA@mail.gmail.com>
 <c1caa5ce-eeaf-8038-2dea-051c98aade45@suse.cz> <Y260tkNHc2vFITJ3@spud>
 <a5bba3ca-da19-293c-c01b-a28291533466@opensource.wdc.com>
 <93079aba-362e-5d1e-e9b4-dfe3a84da750@opensource.wdc.com>
 <44da078c-b630-a249-bf50-67df83cd8347@suse.cz>
 <35650fd4-3152-56db-7c27-b9997e31cfc7@opensource.wdc.com>
 <Y3JU5cfyid1rBoOy@hyeyoo>
 <97c0735c-3127-83d5-30ff-8e57c6634f6e@opensource.wdc.com>
 <0e45a2f2-6dd5-5a43-c1a0-7520c1ed2675@opensource.wdc.com>
 <Y3SYA31zobR6/qbj@casper.infradead.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <Y3SYA31zobR6/qbj@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_000231_458149_E87823A7 
X-CRM114-Status: GOOD (  23.18  )
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

On 2022/11/16 16:57, Matthew Wilcox wrote:
> On Tue, Nov 15, 2022 at 01:28:14PM +0900, Damien Le Moal wrote:
>> On 11/15/22 13:24, Damien Le Moal wrote:
>>> 6.1-rc5, SLOB:
>>>     - 623 free pages
>>>     - 629 free pages
>>>     - 629 free pages
>>> 6.1-rc5, SLUB:
>>>     - 448 free pages
>>>     - 448 free pages
>>>     - 429 free pages
>>> 6.1-rc5, SLUB + slub_max_order=0:
>>>     - Init error, shell prompt but no shell command working
>>>     - Init error, no shell prompt
>>>     - 508 free pages
>>>     - Init error, shell prompt but no shell command working
>>> 6.1-rc5, SLUB + patch:
>>>     - Init error, shell prompt but no shell command working
>>>     - 433 free pages
>>>     - 448 free pages
>>>     - 423 free pages
>>> 6.1-rc5, SLUB + slub_max_order=0 + patch:
>>>     - Init error, no shell prompt
>>>     - Init error, shell prompt, 499 free pages
>>>     - Init error, shell prompt but no shell command working
>>>     - Init error, no shell prompt
>>>
>>> No changes for SLOB results, expected.
>>>
>>> For default SLUB, I did get all clean boots this time and could run the
>>> cat command. But I do see shell fork failures if I keep running commands.
>>>
>>> For SLUB + slub_max_order=0, I only got one clean boot with 508 free
>>> pages. Remaining runs failed to give a shell prompt or allow running cat
>>> command. For the clean boot, I do see higher number of free pages.
>>>
>>> SLUB with the patch was nearly identical to SLUB without the patch.
>>>
>>> And SLUB+patch+slub_max_order=0 gave again a lot of errors/bad boot. I
>>> could run the cat command only once, giving 499 free pages, so better than
>>> regular SLUB. But it seems that the memory is more fragmented as
>>> allocations fail more often.
>>
>> Note about the last case (SLUB+patch+slub_max_order=0). Here are the
>> messages I got when the init shell process fork failed:
>>
>> [    1.217998] nommu: Allocation of length 491520 from process 1 (sh) failed
>> [    1.224098] active_anon:0 inactive_anon:0 isolated_anon:0
>> [    1.224098]  active_file:5 inactive_file:12 isolated_file:0
>> [    1.224098]  unevictable:0 dirty:0 writeback:0
>> [    1.224098]  slab_reclaimable:38 slab_unreclaimable:459
>> [    1.224098]  mapped:0 shmem:0 pagetables:0
>> [    1.224098]  sec_pagetables:0 bounce:0
>> [    1.224098]  kernel_misc_reclaimable:0
>> [    1.224098]  free:859 free_pcp:0 free_cma:0
>> [    1.260419] Node 0 active_anon:0kB inactive_anon:0kB active_file:20kB
>> inactive_file:48kB unevictable:0kB isolated(anon):0kB isolated(file):0kB
>> mapped:0kB dirty:0kB writeback:0kB shmem:0kB writeback_tmp:0kB
>> kernel_stack:576kB pagetables:0kB sec_pagetables:0kB all_unreclaimable? no
>> [    1.285147] DMA32 free:3436kB boost:0kB min:312kB low:388kB high:464kB
>> reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB
>> inactive_file:28kB unevictable:0kB writepending:0kB present:8192kB
>> managed:6240kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
>> [    1.310654] lowmem_reserve[]: 0 0 0
>> [    1.314089] DMA32: 17*4kB (U) 10*8kB (U) 7*16kB (U) 6*32kB (U) 11*64kB
>> (U) 6*128kB (U) 6*256kB (U) 0*512kB 0*1024kB 0*2048kB 0*4096kB = 3460kB
>> [    1.326883] 33 total pagecache pages
>> [    1.330420] binfmt_flat: Unable to allocate RAM for process text/data,
>> errno -12
> 
> What you're seeing here is memory fragmentation.  There's more than 512kB
> of memory available, but nommu requires it to be contiguous, and it's
> not.  This is pretty bad, really.  We didn't even finish starting up
> and already we've managed to allocate at least one page from each of
> the 16 512kB chunks which existed.  Commit df48a5f7a3bb was supposed
> to improve matters by making exact allocations reassemble once they
> were freed.  Maybe the problem is entirely different.

I suspected something like this when seeing the reported "free:859" :)
What I can try next is booting without SD card and the bare minimum set of
drivers to see if the fragmentation is still there or not. Would that help ?
These one page allocations may be for device drivers so never freed, no ?

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
