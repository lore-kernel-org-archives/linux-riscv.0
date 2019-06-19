Return-Path: <SRS0=pesg=US=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15190C31E49
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2019 12:52:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEB9F208CB
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2019 12:52:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lq+crKea"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEB9F208CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/1aT942zFPYNVKtMFdVDcDcpsR9ewdHePrDAmBww85A=; b=lq+crKea9z8MfVZEpgdRK5MMz
	klLkR9WXJFk+CFbNfc0Xn0vFApPgnThGXW2pnfjaMzeh/yjuMrQ2C0kOoCEmQPwCOx84od4RtYurN
	OytLsgBEIZDSLQuPL3rsjZLNLQCFmVXZfUybEczx/o60d4x+72bs/N5j4cGGdj2w+rQzbm687cr8x
	AcB4QVL95qlTdIFgf0yBARdUw8fYX7N/i/+xjUlOXttsgGFZbYA3FW28WW9cU9JhjOwv/SrPx+iQe
	KM8Ap18/G9JqLlkngyZICzVrAlNFozZ6lilzcZdNxnojShlAXTv5PbpzhC5qkLLNwXc4QQv58F41C
	OiwoXMQbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hda4a-0004Oq-Sd; Wed, 19 Jun 2019 12:52:20 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hda4O-0004FA-OH; Wed, 19 Jun 2019 12:52:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64E27360;
 Wed, 19 Jun 2019 05:52:06 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EDE23F738;
 Wed, 19 Jun 2019 05:52:03 -0700 (PDT)
Subject: Re: [PATCH RFC 11/14] arm64: Move the ASID allocator code in a
 separate file
To: Guo Ren <guoren@kernel.org>
References: <20190321163623.20219-1-julien.grall@arm.com>
 <20190321163623.20219-12-julien.grall@arm.com>
 <0dfe120b-066a-2ac8-13bc-3f5a29e2caa3@arm.com>
 <CAJF2gTTXHHgDboaexdHA284y6kNZVSjLis5-Q2rDnXCxr4RSmA@mail.gmail.com>
 <c871a5ae-914f-a8bb-9474-1dcfec5d45bf@arm.com>
 <CAJF2gTStSR7Jmu7=HaO5Wxz=Zn8A5-RD8ktori3oKEhM9vozAA@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <aafb3478-ce7b-3771-c03a-58510261f01c@arm.com>
Date: Wed, 19 Jun 2019 13:52:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJF2gTStSR7Jmu7=HaO5Wxz=Zn8A5-RD8ktori3oKEhM9vozAA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_055208_836591_1174E054 
X-CRM114-Status: GOOD (  16.16  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: julien.thierry@arm.com, aou@eecs.berkeley.edu, james.morse@arm.com,
 suzuki.poulose@arm.com, Marc Zyngier <marc.zyngier@arm.com>,
 catalin.marinas@arm.com, Anup Patel <anup.Patel@wdc.com>, will.deacon@arm.com,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com, hch@infradead.org,
 Atish.Patra@wdc.com, Palmer Dabbelt <palmer@sifive.com>, gary@garyguo.net,
 paul.walmsley@sifive.com, christoffer.dall@arm.com,
 linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Guo,

On 19/06/2019 12:51, Guo Ren wrote:
> On Wed, Jun 19, 2019 at 4:54 PM Julien Grall <julien.grall@arm.com> wrote:
>>
>>
>>
>> On 6/19/19 9:07 AM, Guo Ren wrote:
>>> Hi Julien,
>>
>> Hi,
>>
>>>
>>> You forgot CCing C-SKY folks :P
>>
>> I wasn't aware you could be interested :).
>>
>>>
>>> Move arm asid allocator code in a generic one is a agood idea, I've
>>> made a patchset for C-SKY and test is on processing, See:
>>> https://lore.kernel.org/linux-csky/1560930553-26502-1-git-send-email-guoren@kernel.org/
>>>
>>> If you plan to seperate it into generic one, I could co-work with you.
>>
>> Was the ASID allocator work out of box on C-Sky?
> Almost done, but one question:
> arm64 remove the code in switch_mm:
>    cpumask_clear_cpu(cpu, mm_cpumask(prev));
>    cpumask_set_cpu(cpu, mm_cpumask(next));


> 
> Why? Although arm64 cache operations could affect all harts with CTC
> method of interconnect, I think we should
> keep these code for primitive integrity in linux. Because cpu_bitmap
> is in mm_struct instead of mm->context.

I will let Will answer to this.

[...]

>> If so, I can easily move the code in a generic place (maybe lib/asid.c).
> I think it's OK.

Will emits concern to move the code in lib. So I will stick with what I 
currently have.

Cheers,

-- 
Julien Grall

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
