Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC5BCCD194
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 09:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAekB5ZJBfbY1qKLNCxeKYukLxcfUdmuhDsxpqauIag=; b=rHB/4iLKpnG5Le
	6Ya7U0+O/KGWU9HStByYnZKL+oppl9dJKydhA+kr3OF7MfSArj+agsKLylH9wEuGM2qWX9Jh80Y+s
	U8AosmNqnYqlDDuujc+iHxBL8R63vDMviy8FMRRZ5FviAg9QPfG6P4F81aPksOGFY1gbIlZBL5GJ2
	XL5Ct57otM93RZUFjxi3b8qo1z9zKSKHbVga03plSR8cGeJPRxVcTd0xyeNJGdOtoFcFGkUCAYY5Z
	0Pr5It0imVch2pzS4Lm3SL4dwwxeCt0dooyOSYr8YC2I+Wzke3nBZ7BdaahWVnVtf5mR7n6qQnBK6
	be23Sqwg/6mWd+g1fWkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqrT3-00000007yM6-1yvk;
	Wed, 18 Sep 2024 09:59:25 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqrRd-00000007yAr-0oHB
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 09:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g4N4ta8VTBkx5BKm7nsRYoHF+tQVh17Il9eA7aFWUF8=; b=FBpiC6Sp9ir6hJb69pXknLqmOK
	DaCOj3IxbZtnUb9tgKaRMj+c/3WtpOii9ae0pGTvfxI4FBySlrwUvmDyThClv8Vv6ZYfI6r8r4Ye2
	lymty86EuZYIGhwCuFS4Tsetj+OXe3u5vaoP1vB7WaxEipgg1q8RgAOqpvwRnsuUjC1xguvpSC3ys
	ySmnDgehRl/8lrpDO1viOMo1pa0T2DUCSMC9Cyv1jtgh/3I5go05iWTDwUrb0tuMcQU2/c3MxJ6GM
	waZCFfrVUp5okN+y7qidkgh+6X7WpY/QZiZkSe64dFS+979IYnUH88qvDEjAzy9mN8RALiZGkr6e2
	RHVah27w==;
Received: from [83.68.141.146] (helo=[10.136.0.254])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1sqrRZ-00G1C7-4d; Wed, 18 Sep 2024 10:57:53 +0100
Message-ID: <1bf46ac0-2ab4-44d3-bcf0-7a29ba6380c1@codethink.co.uk>
Date: Wed, 18 Sep 2024 10:57:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: extern illegal instruction trap and trap RDCYCLE
To: Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
References: <mhng-ac746ffc-8099-447d-a45f-772550f23290@palmer-ri-x1c9>
 <bab6f17a-3e39-4be4-a20e-bbdbbc2e81f8@codethink.co.uk>
 <6ea17387-6efc-49c7-b631-b6a682054d49@rivosinc.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <6ea17387-6efc-49c7-b631-b6a682054d49@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_025757_352182_9F5F82C2 
X-CRM114-Status: GOOD (  23.63  )
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

On 18/09/2024 10:55, Atish Patra wrote:
> On 9/17/24 7:01 AM, Ben Dooks wrote:
>> On 17/09/2024 14:46, Palmer Dabbelt wrote:
>>> On Tue, 17 Sep 2024 06:08:50 PDT (-0700), ben.dooks@codethink.co.uk 
>>> wrote:
>>>> This is a RFC series to change how the illegal instruction trap
>>>> is handled and then how to trap RDCYCLE and emulate it with RDTIME
>>>> instead.
>>>
>>> Only 1/3 made it to lore for me, not sure if it's just stuck somewhere.
>>>
>>>>
>>>> I did this when we found multiple libraries using RDCYCLE and
>>>> upgrading multiple runners to newer kernels caused many problems
>>>
>>> OK, so I think we're kind of just stuck with RDCYCLE then -- it was 
>>> part of the base ISA when we merged the port, and every time it 
>>> disappears we end up breaking userspace.
>>
>> Yes, it was an annoyance, we managed to track down all the users and
>> patch out.
>>
>> I thought this might be a useful idea for more generic type, so might
>> look at updating to have a table of instruction masks to call.
>>
>>> I'm not sure what exactly the right way to do this is: IIRC there's 
>>> some perf-related hooks for this, but there's also systems that just 
>>> don't implement the RDCYCLE instruction at all and thus we'll need 
>>> some sort of emulation for those.
>>
>> I couldn't get the PMU driver to allow it, not sure if there was an
>> issue higher up or some other issue?
>>
> 
> Here is the way to properly allow it via the driver.
> 
> https://www.kernel.org/doc/Documentation/admin-guide/sysctl/kernel.rst
> 
> Check the perf_user_access

Didn't work for me, not sure why

> 
> As you noted, the user space application shouldn't use RDCYCLE for 
> various reasons discussed in the past.
> 
> If RDTIME is really not an option, you can always set the legacy mode to 
> enable access.
> 
>>> So hopefully the other two patches get through the lists at some 
>>> point, but I think in general this is a reasonable thing to do -- or 
>>> I guess maybe a completely unreasonable thing to be stuck needing to 
>>> do, but no way around it ;)
>>
>> I'll check back later, currently as OSS-EU
>>
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-riscv mailing list
>>>> linux-riscv@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>>
>>
>>
> 
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
