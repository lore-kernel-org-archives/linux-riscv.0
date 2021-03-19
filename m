Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D30FC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 14:20:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B149464EE6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 14:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B149464EE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z/NZaiSTDZnqGAbKl++1uJTYwoJbuW/G9x9AgSV0PrA=; b=OFJ3JKOPjxJKcBEa0FAewQu5x
	HR09Qz3StYnb4nm5lptI/IgCAwv/pum/Xq2+2bHtdiUgTmLqEnitKUw87Ibivayygyq9W/j8puugT
	DmQbqPlUOMGvCs5RfEztlgdwoQbixVBsff97VYB2lR7Xs2nIMcqSpZYMTknIKPWk/PgZP5N+y7W8Q
	XZWFr6tptQPNBxjWWfsuovLROc+rnxxFd9mwPB6EEYEv1DYOXTSS/NRZT/XLTjpwej261S6FnO4Ey
	fDfVG3Jlf9dRtGezKQHu+UcQuaGeWZE01xgq+mD2f15PGuzCd/s0MF66InxbvtaeSlrePLsVbj2FU
	TuSZDlglw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNFyv-007X7I-Ji; Fri, 19 Mar 2021 14:20:05 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNFyr-007X6c-97
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 14:20:03 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lNFym-0007Jq-OM; Fri, 19 Mar 2021 14:19:56 +0000
Subject: Re: [PATCH] RFC: riscv: evaluate put_user() arg before enabling user
 access
To: Christoph Hellwig <hch@infradead.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Terry Hu <kejia.hu@codethink.co.uk>, Arnd Bergman <arnd@arndb.de>
References: <20210318224135.134344-1-ben.dooks@codethink.co.uk>
 <20210319130514.GA1053613@infradead.org>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <00cfb67c-86cf-b303-cdb0-260ac0f06f2f@codethink.co.uk>
Date: Fri, 19 Mar 2021 14:19:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319130514.GA1053613@infradead.org>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_142001_519515_12E14B16 
X-CRM114-Status: GOOD (  21.05  )
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

On 19/03/2021 13:05, Christoph Hellwig wrote:
> On Thu, Mar 18, 2021 at 10:41:35PM +0000, Ben Dooks wrote:
>> The <asm/uaccess.h> header has a problem with
>> put_user(a, ptr) if the 'a' is not a simple
>> variable, such as a function. This can lead
>> to the compiler producing code as so:
> 
> Nit: your commit log seeems to truncate lines after 50 chars, you can
> and should use almost 1.5 as much.

Thanks, noted this once I'd re-read the patch. I have a few
other minor bits to test and to credit Arnd with helping out
after failing to get the first attempt to compile.

>>    * @ptr must have pointer-to-simple-variable type, and @x must be assignable
>> - * to the result of dereferencing @ptr.
>> + * to the result of dereferencing @ptr. The @x is copied inside the macro
>> + * to avoid code re-ordering where @x gets evaulated within the block that
>> + * enables user-space access (thus possibly bypassing some of the protection
>> + * this feautre provides).
> 
> Well, hopefully the compiler is smart enought to not actually copy.
> So we should probably talk about evaluating the argument here.
> 
>>   #define __put_user(x, ptr)					\
>>   ({								\
>>   	__typeof__(*(ptr)) __user *__gu_ptr = (ptr);		\
>> +	__typeof__(*__gu_ptr) __val = (x);			\
>>   	long __pu_err = 0;					\
>>   								\
>>   	__chk_user_ptr(__gu_ptr);				\
>>   								\
>>   	__enable_user_access();					\
>> -	__put_user_nocheck(x, __gu_ptr, __pu_err);		\
>> +	__put_user_nocheck(__val, __gu_ptr, __pu_err);		\
>>   	__disable_user_access();				\
> 
> It looks like __get_user needs the same treatment.

I will check that, then again I don't think people do anything
that would be an issue. We caught this from the put_user() in the
schedule_tail() code which causes the pid fetch function to be
called within the __enable_user_access().

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
