Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A998C64EC4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 15:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/aWkrp0qsbH7jY6nR40z3Eta63XHAfb5JhdtiiSmDg=; b=UyRLeYnkeCDw/v
	TmTcnZsFRGIGoqWproMvzlijc7Q3nxN6Hh7J+Bb/xPv06RsVsNmTRxcpdacfjPaIlqDZLk6JoOXTK
	rjZRPWcV6DhCL/hG39swy7VPcMPL9Jbw2OhUTtg0HxFDxEezvL11nyzlslf4EZ7Sv26MedY04Lpa6
	V+pGsabNz2hmeovg+cvV2aMdR8SO2fUiaw0WOyjTAd5yc/QB207HkuatU7Q16o21v4l+uX/Aritz7
	8vrc3O5PHmAwMfiYWfT3zrn/HZ42SA/Z/KfgyqsyZ49f7Ljomw2chaVusfHDZ+RrreT78+/zS8xYS
	1fvwRN7hMEYyzzIVvv8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paIHi-00AwCm-4H; Thu, 09 Mar 2023 15:34:26 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHx6-00Aold-Se
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 15:13:10 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 5A86A240014;
	Thu,  9 Mar 2023 15:12:57 +0000 (UTC)
Message-ID: <de204b7c-7c1d-bd7b-0072-d128757258e2@ghiti.fr>
Date: Thu, 9 Mar 2023 16:12:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: RISC-V reserved memory problems
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Mike Rapoport <rppt@kernel.org>, Conor Dooley <conor@kernel.org>,
 palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 frowand.list@gmail.com, robh+dt@kernel.org, mick@ics.forth.gr,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 Valentina.FernandezAlanis@microchip.com, Daire.McNamara@microchip.com
References: <8e10bf15-9fa9-fe90-1656-35bf3e87e7f8@microchip.com>
 <f8e67f82-103d-156c-deb0-d6d6e2756f5e@microchip.com> <Y9wytv5KSt1ca+td@spud>
 <ZAchb/DfbIh+qaE4@kernel.org> <8abfb680-e1dd-8d1f-dd10-0a8bf086f5c3@ghiti.fr>
 <b797bd15-ef3d-4d28-9aad-ffe0a32aa0b0@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <b797bd15-ef3d-4d28-9aad-ffe0a32aa0b0@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_071309_128653_2A2A9D95 
X-CRM114-Status: GOOD (  20.58  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/9/23 13:51, Conor Dooley wrote:
> On Thu, Mar 09, 2023 at 01:45:05PM +0100, Alexandre Ghiti wrote:
>> On 3/7/23 12:35, Mike Rapoport wrote:
>>> Hi Conor,
>>>
>>> Sorry for the delay, somehow this slipped between the cracks.
>>>
>>> On Thu, Feb 02, 2023 at 10:01:26PM +0000, Conor Dooley wrote:
>>>> Hullo Palmer, Mike & whoever else may read this,
>>>>
>>>> Just reviving this thread from a little while ago as I have been in the
>>>> area again recently...
>>> TBH, I didn't really dig deep into the issues, but the thought I had was
>>> what if DT was mapped via fixmap until the setup_vm_final() and then it
>>> would be possible to call DT methods early.
>>>
>>> Could be I'm shooting in the dark :)
>>
>> I think I understand the issue now, it's because In riscv, we establish 2
>> different virtual mappings and we map the device tree at 2 different virtual
>> addresses, which is the problem.
>>
>> So to me, the solution is:
>>
>> - to revert your previous fix, that is calling
>> early_init_fdt_scan_reserved_mem() before any call to memblock_alloc()
>> (which could result in an allocation in the area you want to reserve)
>>
>> - to map the device tree at the same virtual address, because
>> early_init_fdt_scan_reserved_mem() initializes reserved_mem with the dtb
>> mapping established in setup_vm() and uses reserved_mem with the new mapping
>> from setup_vm_final (which is what Mike proposes, we should use the fixmap
>> region to have the same virtual addresses)
>>
>> Hope that makes sense: I'll come up with something this afternoon for you to
>> test!
> Sounds good. Please give me some ELI5 commit messages if you can,
> explanations for this stuff (which I found took a lot of archaeology to
> understand) would be very welcome next time we need to go back looking
> at this stuff.


Can you give it a try here: 
https://github.com/AlexGhiti/riscv-linux/commits/dev/alex/conor_dtb_fixmap_v1 
?

That works for me but I need to carefully explain and check that's 
correct though, not upstreamable as is.

Thanks,

Alex


> Thanks Alex!
> Conor.
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
