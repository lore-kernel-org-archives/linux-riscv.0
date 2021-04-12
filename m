Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D43C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 05:12:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A0496120F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 05:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A0496120F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u+zFkB3sRXlbCjelpSy7igcbu6VizhBfKuXNmWC5xTo=; b=Y1OS8efX9rPUX84vWMxOa2xI5
	gazN8Sz14hpVAsJTPKSz9+BiAoqUgM8V4svMt5+B9p8Na8fQ2JKXAaxZra6MsoJ1xikARgNYrExHG
	2RiPJp3MIyfD1cKbFc0x5X44gbt6v/cIVmaZRknomYTnQH/cM95as2eQ6Hx68m5w1pUS3Swusap92
	KLcjhkMFqMmUpt7pqbshGoMWrkaX61sM8ZED9OzpYdlVdl9jRvfOPBh8I2S8macq+orWU+d/UXzDt
	sEcgxqwuOJaX8PgLG14ynGf3XGDLDYON1GkO3kumY/EtuLD7641NygQ6iskeUg+LkaEyztMUI6eZW
	71J+FdJGA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVosG-005iXm-EZ; Mon, 12 Apr 2021 05:12:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVosD-005iXd-2W
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 05:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:
 Subject:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=m5h2MS0RKbdrUZN/JBolmUKfcJFo3TmmXT33IWYWWzk=; b=VzEaio4eTlSAAV13p4A1EJTsGy
 j342AIZVs2jWxfLu9pEVjEOSXZ8AysM8HZx1P6/jHavbtdMTkSfSEJS/AIl9iFKoZ3WRs002neuSR
 gyWYw95PcfspM1TRhB5/hT7+opZ1Lhr1G+wK0nOwVbLOD4UWd1Mt3DYhvgKC5bXxJYsKoYtVuEtBk
 Lw8eWZtQa9FnOk1cgJgUEF2iAVUYXAPDeDdtfBjglMo7KKlFFcPHorTpqDuZHa18O6Ah/eMPQBtar
 zNifna/WIXFbW7tOKjMOi7aLZW3Q8T3zwxPlAlq8kfKVtbahOMPlKB0E3AJdUU/15ENgOP7tA5f24
 TRO7chuw==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVos9-005shU-H2
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 05:12:31 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.100] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B2748E0007;
 Mon, 12 Apr 2021 05:12:23 +0000 (UTC)
From: Alex Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v7] RISC-V: enable XIP
To: Vitaly Wool <vitaly.wool@konsulko.com>, Mike Rapoport <rppt@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-arch@vger.kernel.org,
 Linux-MM <linux-mm@kvack.org>
References: <20210409065115.11054-1-alex@ghiti.fr>
 <3500f3cb-b660-5bbc-ae8d-0c9770e4a573@ghiti.fr>
 <be575094-badf-bac7-1629-36808ca530cc@redhat.com>
 <c4e78916-7e4c-76db-47f6-4dda3f09c871@ghiti.fr>
 <YHBEsDuEvPAnL8Vb@linux.ibm.com>
 <e7e87306-bb04-2d4f-7e7f-aabd40dccb3b@redhat.com>
 <YHBdzPsHantT9r8t@linux.ibm.com>
 <CAM4kBBKyHSYz+NNDpT=fWseWccsQ4HZ3teBc01jYT2g8j7Ze2A@mail.gmail.com>
Message-ID: <ec1117a5-63fa-f800-1193-b5737eee6150@ghiti.fr>
Date: Mon, 12 Apr 2021 01:12:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CAM4kBBKyHSYz+NNDpT=fWseWccsQ4HZ3teBc01jYT2g8j7Ze2A@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_221229_859509_7BE196BB 
X-CRM114-Status: GOOD (  29.02  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le 4/9/21 =E0 10:42 AM, Vitaly Wool a =E9crit=A0:
> On Fri, Apr 9, 2021 at 3:59 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
>>
>> On Fri, Apr 09, 2021 at 02:46:17PM +0200, David Hildenbrand wrote:
>>>>>> Also, will that memory properly be exposed in the resource tree as
>>>>>> System RAM (e.g., /proc/iomem) ? Otherwise some things (/proc/kcore)
>>>>>> won't work as expected - the kernel won't be included in a dump.
>>>> Do we really need a XIP kernel to included in kdump?
>>>> And does not it sound weird to expose flash as System RAM in /proc/iom=
em? ;-)
>>>
>>> See my other mail, maybe we actually want something different.
>>>
>>>>
>>>>> I have just checked and it does not appear in /proc/iomem.
>>>>>
>>>>> Ok your conclusion would be to have struct page, I'm going to impleme=
nt this
>>>>> version then using memblock as you described.
>>>>
>>>> I'm not sure this is required. With XIP kernel text never gets into RA=
M, so
>>>> it does not seem to require struct page.
>>>>
>>>> XIP by definition has some limitations relatively to "normal" operatio=
n,
>>>> so lack of kdump could be one of them.
>>>
>>> I agree.
>>>
>>>>
>>>> I might be wrong, but IMHO, artificially creating a memory map for par=
t of
>>>> flash would cause more problems in the long run.
>>>
>>> Can you elaborate?
>>
>> Nothing particular, just a gut feeling. Usually, when you force something
>> it comes out the wrong way later.
> =

> It's possible still that MTD_XIP is implemented allowing to write to
> the flash used for XIP. While flash is being written, memory map
> doesn't make sense at all. I can't come up with a real life example
> when it can actually lead to problems but it is indeed weird when
> System RAM suddenly becomes unreadable. I really don't think exposing
> it in /proc/iomem is a good idea.
> =

>>>> BTW, how does XIP account the kernel text on other architectures that
>>>> implement it?
>>>
>>> Interesting point, I thought XIP would be something new on RISC-V (well=
, at
>>> least to me :) ). If that concept exists already, we better mimic what
>>> existing implementations do.
>>
>> I had quick glance at ARM, it seems that kernel text does not have memory
>> map and does not show up in System RAM.
> =

> Exactly, and I believe ARM64 won't do that too when it gets its own
> XIP support (which is underway).
> =



memmap does not seem necessary and ARM/ARM64 do not use it.

But if someone tries to get a struct page from a physical address that =

lies in flash, as mentioned by David, that could lead to silent =

corruptions if something exists at the address where the struct page =

should be. And it is hard to know which features in the kernel depends =

on that.

Regarding SPARSEMEM, the vmemmap lies in its own region so that's =

unlikely to happen, so we will catch those invalid accesses (and that's =

what I observed on riscv).

But for FLATMEM, memmap is in the linear mapping, then that could very =

likely happen silently.

Could a simple solution be to force SPARSEMEM for those XIP kernels ? =

Then wrong things could happen, but we would see those and avoid =

spending hours to debug :)

I will at least send a v8 to remove the pfn_valid modifications for =

FLATMEM that now returns true to pfn in flash.

Thanks,



> Best regards,
>     Vitaly
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
