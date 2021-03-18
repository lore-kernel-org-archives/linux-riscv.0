Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA38AC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 23:47:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B2D564E81
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 23:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B2D564E81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h662cvJ9a9vg0/D6VMRpN8556BBTwCCOdCZ6aDP93uE=; b=J00CvVD6P6OgkeCMKDL8NT6zI
	K0e7ZrM9+is1pEqT61HPSzc3yR+YgUHRqB9wdJnPB6TumNEi7qi/+FFOCgG5rRmmFtwqUOiqO3gEk
	MV4G40sfsU3+4zqOl5snIc8iekJyXiG3WDS+Vc+jrL68YhW3wYn6PZZ8nsTtWguo9WDnM19ycyWwX
	NIO0VHawANZ+2ookrskz03MA2DE5otycMLqsOmHi3rxsmcvT4/1Wbi8OtrQ+ideueNNBDtBJrR34/
	UpPGzlerv8vDQM8DJQSGBmYMuNAHIOzZJjPvTlXMccCG/XvNl4DHjvfZdf8LbVQAS2Ebs67xwOsNw
	qE3y9vIHA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN2Lb-006BnJ-Sy; Thu, 18 Mar 2021 23:46:36 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN2LW-006Bn0-9j
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 23:46:33 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lN2LR-0001V8-Jc; Thu, 18 Mar 2021 23:46:25 +0000
Subject: Re: [PATCH] RFC: riscv: evaluate put_user() arg before enabling user
 access
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Terry Hu <kejia.hu@codethink.co.uk>
References: <20210318224135.134344-1-ben.dooks@codethink.co.uk>
 <CAK8P3a1re8s4nacPQn=E2PnkxM5TQEihDu6XvV1Tg9y1J8iseQ@mail.gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <983c5b8e-b5dc-9c8f-66ed-7a7bf0033ff8@codethink.co.uk>
Date: Thu, 18 Mar 2021 23:46:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1re8s4nacPQn=E2PnkxM5TQEihDu6XvV1Tg9y1J8iseQ@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_234630_833357_A9C2ED68 
X-CRM114-Status: GOOD (  15.93  )
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

On 18/03/2021 22:48, Arnd Bergmann wrote:
> On Thu, Mar 18, 2021 at 11:41 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>>
>> The <asm/uaccess.h> header has a problem with
>> put_user(a, ptr) if the 'a' is not a simple
>> variable, such as a function. This can lead
>> to the compiler producing code as so:
>>
>> 1:      enable_user_access()
>> 2:      evaluate 'a'
>> 3:      put 'a' to 'ptr'
>> 4:      disable_user_acess()
>>
>> The issue is that 'a' is now being evaluated
>> with the user memory protections disabled. So
>> we try and force the evaulation by assinging
>> 'x' to __val at the start, and hoping the
>> compiler barriers in enable_user_access()
>> do the job of ordering step 2 before step 1.
>>
>> This has shown up in a bug where 'a' sleeps
>> and thus schedules out and loses the SR_SUM
>> flag. This isn't sufficient to fully fix, but
>> should reduce the window of opportunity.
>>
>> Cc: Arnd Bergman <arnd@arndb.de>
> 
> Reviewed-by: Arnd Bergman <arnd@arndb.de>
> 
> Note: your Signed-off-by seems to be missing.

Sorry, forgot as was intending smaller RFC release.

Thanks for the help sorting out the compile issues

I need to review the patch description anyway and make it flow
closer to 73 columns instead of the rather truncated version it is.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
