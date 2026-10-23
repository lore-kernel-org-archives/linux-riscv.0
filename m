Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70F9606A322
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yS/3qhny;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=codethink.co.uk header.i=@codethink.co.uk header.a=rsa-sha256 header.s=imap4-20230908 header.b=aLp7+vXu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tFhfmoR4vfbNK+luidgwfb2bIec7BvLzAUKpeksLlSE=; b=yS/3qhny007RqjvUVLhpg5zX2Y
	5wvHZPaY2xjTQY7G+kE/Mh9BtrK+HgVGUtLCiPruBnemUISvquE6q4eHklkpJKBRdG1oJjV2JMBZb
	kfmO3GkoWnBIJS1Y1Ziyx2kV/oopXjUg0rcciiXbKPOmQ160H14PRUdiHDmoSMKyY+Z4xQEZwi5fA
	XsORFh7pgRQQDJXJl0CxZEQ96fBLcmbCOIWwtjyScY3+/YcazUQHh82jSNPjdtIZH+hZVRgvhomsc
	jf2VlwYRKcEPt93INW14KEa2JLNCwfk7Y8KUEt/NGkn1s13BueidSghyJYqn5brZZFgT0giWWEoUZ
	jU/UjSOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKACO-0000000FqFa-2TQb;
	Fri, 23 Oct 2026 08:00:24 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKACL-0000000FqDs-2Hg3
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 08:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=6ewGmAlFYwsNDKvJWEZID5X9+tdMRDfrjURgzdEaZTs=; b=aLp7+vXuIfkGnsz9
	StFobNKifmcZc13DIr1yqvsHN11UaNjXGlCY9384GSy3nYOqxvqN/R/OrLNBWTxW7rQVRxGahj3cu
	cPg2qLDtF3aQBPsOHAld6+dFggk/dW5vOz8Dhmp125oFH3BDUZdAn61EYMlNb4lUVfDKQPWfjg4DJ
	oFTheX5fBhkoVg/bHgfrbo2xaxeoFs98VCkNtZAxXyQ7Rms3nEuP1IsZvXsDBr9EJf/V2j+OFzIGa
	iHBpc/tx2dD+wtUeUsy6Wx6hVHFD+lA0Qy/VaaYN13xsNb+LdJxfOQwfSHi9qrxMaPpf7oaacpmbL
	eweJmgWtHtjUZLDPhg==;
Received: from [167.98.27.226] (helo=[10.35.224.5])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1xKABh-00CJU2-RC; Fri, 23 Oct 2026 08:59:41 +0100
Message-ID: <4382d639-62ba-40ea-88f5-ff5242b79ebf@codethink.co.uk>
Date: Fri, 23 Oct 2026 08:59:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix SR_SUM leakage across context switches
To: Andy Chiu <tchiu@tenstorrent.com>, Yunhui Cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 zong.li@sifive.com, wangruikang@iscas.ac.cn, debug@rivosinc.com,
 qirui.001@bytedance.com, guoziyi114@gmail.com, samuel.holland@sifive.com,
 cyrilbur@tenstorrent.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261022083212.84721-1-cuiyunhui@bytedance.com>
 <atqL1ScMLUg2bM_E@Tao-Chiu's-Mac>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <atqL1ScMLUg2bM_E@Tao-Chiu's-Mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_010021_663611_F322CA21 
X-CRM114-Status: GOOD (  30.13  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22/10/2026 23:19, Andy Chiu wrote:
> Hi Yunhui,
> 
> On Thu, Oct 22, 2026 at 04:32:12PM +0800, Yunhui Cui wrote:
>> __switch_to() saves the sstatus value of prev and restores the SR_SUM bit
>> of next with csrs. However, csrs only sets bits. If prev has SR_SUM set
>> and next has SR_SUM clear in its saved state, the old SR_SUM bit remains
>> set in sstatus.
>>
>> This lets next run with user memory access enabled even though its saved
>> SR_SUM state is clear.
>>
>> Use csrrc to save the sstatus value of prev and clear SR_SUM from the
>> live CSR before restoring the saved SR_SUM state of next. This keeps
>> prev's SR_SUM state intact, while preventing it from leaking to next.
> 
> Do you have a way to trigger this bug on existing code or is it the cae
> where the bug could happen but we never experienced it in real life?

The original case for dealing with this was due to the user-access
macros occasionally embedding calls into the area where the SR_SUM
was set, allowing pre-emption there. We did try and fix this and as
far as I knew then it was mostly fixed by re-ordering the uaccess
macros.

> If I understand correctly, this can only happen when the user access
> routing volutarily makes a schedule() call mid-flight, or a code fogets
> to turn off SR_SUM right after an user access and has a live SR_SUM when
> calling schedule some time after. Both case should be a bug as SR_SUM
> shouldn't live in the kernel code that is not doing user access.

I'm not sure how much code does a SR_SUM enable a few different accesses
and then SR_SUM disable, but IIRC there is a possibility to do this.

> A trap-introduced context switch would interrupt a code that have SR_SUM
> set. However, since the bit is cleared at every exception entry, the
> context switch code would not see a live SR_SUM. Seeing the bit set in
> this case means something is not turning SR_SUM off properly.
> 
> I aggree that this is the better way to handle SR_SUM in a context switch
> but attaching a call trace or stating that "We have not caught this in
> real world due to ..." in the commit message would be appreciated.
> 
> Cheers,
> Andy
> 
>>
>> Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>> ---
>>   arch/riscv/kernel/entry.S | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> index 61b7a77166971..628b85e3915a7 100644
>> --- a/arch/riscv/kernel/entry.S
>> +++ b/arch/riscv/kernel/entry.S
>> @@ -443,15 +443,15 @@ SYM_FUNC_START(__switch_to)
>>   	REG_S s10, TASK_THREAD_S10_RA(a3)
>>   	REG_S s11, TASK_THREAD_S11_RA(a3)
>>   
>> -	/* save the user space access flag */
>> -	csrr  s0, CSR_STATUS
>> +	/* Save and clear the user space access flag. */
>> +	li    s1, SR_SUM
>> +	csrrc s0, CSR_STATUS, s1
>>   	REG_S s0, TASK_THREAD_SUM_RA(a3)
>>   
>>   	/* Save the kernel shadow call stack pointer */
>>   	scs_save_current
>>   	/* Restore context from next->thread */
>>   	REG_L s0,  TASK_THREAD_SUM_RA(a4)
>> -	li    s1,  SR_SUM
>>   	and   s0,  s0, s1
>>   	csrs  CSR_STATUS, s0
>>   	REG_L ra,  TASK_THREAD_RA_RA(a4)
>> -- 
>> 2.39.5
>>
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
