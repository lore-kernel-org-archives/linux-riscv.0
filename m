Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087E0C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 22:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tL+gxwXT++Ru35K2HdKC9Pson8cX2+DbIzTvCL3Yj+E=; b=EOKQmdOHcgpmAJ
	tyretGGSNpmo5aeZdjdwQljPK6jN9HDuwbzFvkzyh4V6c3otHLEoReDtxRVgu90y7Ml7j+H8jOoSm
	Cbnk1uI4q2RDJ72n3yvdB9eCgRTeJvGcF1BHCxyr058sSWdmOHy6eVEej5X8i4ksjAN7DI/7HBCDl
	h2OnGqHQuyBQqDyP8sPl+4EktKunsEn2DzvjULXc4D960H1RyEgoyAAvOEAsd1FBGQ6SdfOmn6DQe
	n7PBiN/S7kwsTVomItrORWOPVvajN6sf1sVL64RO3PpkTPy4Sdz4nGXwa5eSeJGGweS5VUkM+WgeW
	sGIjBOrFMfk/3eCmuTxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1xAe-00EpaG-03;
	Wed, 24 May 2023 22:41:28 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1xAU-00EpSy-0v;
	Wed, 24 May 2023 22:41:18 +0000
Message-ID: <8af1acf1-64a5-5868-9702-0929fe279761@infradead.org>
Date: Wed, 24 May 2023 15:41:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: linux-next: Tree for May 15 (several RV64 build errors)
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-next <linux-next@vger.kernel.org>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
References: <mhng-e172207d-d67d-46ab-ab95-85f0a854ace2@palmer-ri-x1c9a>
 <65124759-26de-4111-bc54-545a00620d75@app.fastmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <65124759-26de-4111-bc54-545a00620d75@app.fastmail.com>
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



On 5/23/23 23:23, Arnd Bergmann wrote:
> On Wed, May 24, 2023, at 03:29, Palmer Dabbelt wrote:
>> On Tue, 23 May 2023 17:22:20 PDT (-0700), rdunlap@infradead.org wrote:
>>> On 5/23/23 06:07, Alexandre Ghiti wrote:
>>>> On 23/05/2023 04:28, Randy Dunlap wrote:
>>>>> On 5/19/23 03:42, Alexandre Ghiti wrote:
>>>>>>>> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld: section .data LMA [000000000041a000,00000000075bffd7] overlaps section .text LMA [00000000000f09d4,00000000033562ab]
>>>>>>>> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld: section .init.pi.text LMA [00000000033562ac,0000000003359137] overlaps section .data LMA [000000000041a000,00000000075bffd7]
>>>>>>>
>>>>>>> I'll check this one too which seems to be related to kernel/pi introduction.
>>>>>>
>>>>>> Thanks to Bjorn: this is caused by XIP_KERNEL, which is known to have limited size, hence the overlap, so no fix for this one. Is there a way to exclude this config from randconfig?
>>>>> Does this mean exclude XIP_KERNEL or something else from randconfigs?
>>>>
>>>>
>>>> I meant excluding XIP_KERNEL from randconfigs: it has very strict constraints regarding what can/can't be enabled then it needs human intervention to make sure the error above does not happen. So I would not bother testing this in randconfigs if possible.
>>>
>>> I can exclude it from my randconfig builds, but I don't know of a way to exclude it from randconfig builds in general (i.e., for everyone).
>>
>> Arnd had suggested a trick related to menus that would result in 
>> randconfig never enabling some config.  It'd suggested for 
>> CONFIG_NONPORTABLE, but we didn't use it because it'd reduce randconfig 
>> coverage.
>>
>> Maybe we should add a CONFIG_VERYSPECIAL of some sort and hide things 
>> like XIP behind it (maybe M-mode too)?
> 
> I usually add 'depends on !COMPILE_TEST', that excludes it from most
> build bots.

XIP_KERNEL already has "depends on !COMPILE_TEST", since April of 2021.

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
