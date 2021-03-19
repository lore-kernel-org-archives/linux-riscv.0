Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6686DC433C1
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 21:57:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FFD86196A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 21:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FFD86196A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=foi1GR04vCpRz4BOHxHkw34r0pfzsP5aPoBflFXKgJA=; b=rEzHVwfQ9UF0D1D/VieDj9rjq
	OS6I9OxK37u2dkzZ4/iW0eVV/gpMofcf+UAjC47SH97A+gYic17hdOa2XyFHWfxJWH34x4Jp6Y9ur
	xcAMmV/2GRSX9pCyaAoYa2v80GYvjCXvywINpgg1N3NCnNcFIqLr61cDKa38k5jh8FOh1BHfzKaHm
	fhkkOyh0bV3y+G+60pQhsduOUbTeMtl9zdZblxvAeDBhWAEahtqIsctWBs3KPX+/AuEdZqwU1rk7y
	/BlPnCFEJMR50nn84CiSg+zURhqAEMfIOoa3JGMN1M4IVvvnVAHILeaAYjgTsVq6hQUONNI3sgXrL
	4u46dLC6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNN7A-008DwD-JY; Fri, 19 Mar 2021 21:57:04 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNN75-008DvB-PO
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 21:57:01 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lNN70-0006ri-LZ; Fri, 19 Mar 2021 21:56:54 +0000
Subject: Re: [PATCH] RFC: riscv: evaluate put_user() arg before enabling user
 access
To: Alex Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Terry Hu <kejia.hu@codethink.co.uk>, Arnd Bergman <arnd@arndb.de>
References: <20210318224135.134344-1-ben.dooks@codethink.co.uk>
 <8ba86786-ad2b-93e1-c345-6fc45f336dd4@ghiti.fr>
 <32c328a0-b1ab-397e-18d4-873d7ccfb6f2@codethink.co.uk>
 <bd16115d-d327-87fd-67ed-a54b9e926472@ghiti.fr>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <773ef297-5d49-0cd4-5ccb-9313c46402b8@codethink.co.uk>
Date: Fri, 19 Mar 2021 21:56:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <bd16115d-d327-87fd-67ed-a54b9e926472@ghiti.fr>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_215659_903254_4FD612CC 
X-CRM114-Status: GOOD (  23.02  )
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

On 19/03/2021 16:12, Alex Ghiti wrote:
> Le 3/19/21 =E0 11:09 AM, Ben Dooks a =E9crit=A0:
>> On 19/03/2021 15:03, Alex Ghiti wrote:
>>> Le 3/18/21 =E0 6:41 PM, Ben Dooks a =E9crit=A0:
>>>> The <asm/uaccess.h> header has a problem with
>>>> put_user(a, ptr) if the 'a' is not a simple
>>>> variable, such as a function. This can lead
>>>> to the compiler producing code as so:
>>>>
>>>> 1:=A0=A0=A0 enable_user_access()
>>>> 2:=A0=A0=A0 evaluate 'a'
>>>> 3:=A0=A0=A0 put 'a' to 'ptr'
>>>> 4:=A0=A0=A0 disable_user_acess()
>>>>
>>>> The issue is that 'a' is now being evaluated
>>>> with the user memory protections disabled. So
>>>> we try and force the evaulation by assinging
>>>> 'x' to __val at the start, and hoping the
>>>> compiler barriers in enable_user_access()
>>>> do the job of ordering step 2 before step 1.
>>>>
>>>> This has shown up in a bug where 'a' sleeps
>>>> and thus schedules out and loses the SR_SUM
>>>> flag. This isn't sufficient to fully fix, but
>>>> should reduce the window of opportunity.
>>>
>>> I would say this patch is enough to fix the issue because it only =

>>> happens when 'a' *explicitly schedules* when in =

>>> __enable_user_access()/__disable_user_access(). Otherwise, I see 2 =

>>> cases:
>>>
>>> - user memory is correctly mapped and nothing stops the current process.
>>> - an exception (interrupt or trap) is triggered: in those cases, the =

>>> exception path correctly saves and restores SR_SUM.
>>
>> This fixes part of the other issue.
>>
>> I did point out in the other email there could be longer cases
>> where the protections are disabled. The saving of the flags over
>> switch_to() is still necessary.
> =

> I can't find your explanation, could you elaborate a bit more here on =

> why this fix is not enough ?


I would have to check if this current applies to riscv, but there is
code that does the following (fs/select.c does this):

                 if (!user_read_access_begin(from, sizeof(*from)))
                         return -EFAULT;
                 unsafe_get_user(to->p, &from->p, Efault);
                 unsafe_get_user(to->size, &from->size, Efault);
                 user_read_access_end();

My argument for fixing with both is:

- cover more than the put_user() case
- try and avoid any future bug
- ensure we do not leak SR_SUM elsewhere

I may also have a quick check to see if we don't also leak other
flags during these swaps. It might be we should save and restore
all flags.

I do see that this fix is going to hit a good proportion of the
cases we've seen so far. I could try and run a stress test with
just this in over the weekend (so far syz-stress has been running
for over 24hrs with minimal issues)


-- =

Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
