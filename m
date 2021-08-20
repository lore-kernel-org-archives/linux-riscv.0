Return-Path: <SRS0=APW5=NL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BA6C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 06:42:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 082D461053
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 06:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 082D461053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Cc:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QE1LEE3Xl2uXKPf/q8CXDVcUYnaFpAvzUeX2jjT2EWk=; b=ZENK7XPT+vXzft2ZWGp6h+utcL
	yzvJA0vPXjO01cSs+rUZVYWsDN0YfK2Pd9ifLk3hnuIXkWzQdJihES8rkFKGpp1+c0KMiwilSXGr7
	fBHk/qEruMzL2H4m0oRIKQKy0xASTTcF5t1GDYr9ujuVFxerqSfZTk/sivOssybAejiI2Mo2KSnw7
	xtKrFGvkE2fKsyhB7y24IFopaKeKYECHfH8tPiy9i8bmEXELaDzuENXnbYcxfE9FZqojYG4D31fJn
	2PQydfg3HdB/szZj1v2DdoEqDb4pBRzpftLPq+Ilo6j350oGHWdc3bOlO9UZ+CiEJkZyE3HgunyZJ
	1o2qLfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGyEY-00ABRJ-Mm; Fri, 20 Aug 2021 06:42:30 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGyEV-00ABQq-Nt
 for linux-riscv@lists.infradead.org; Fri, 20 Aug 2021 06:42:29 +0000
Received: by mail-pf1-x434.google.com with SMTP id m26so7764215pff.3
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 23:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6hE1IwbcD/W0J8iLODxuA+fomqEuqcycOTMy2P9S7y4=;
 b=rLVGoejHlJKFNTpNrieIDupRrj/jAGb07v/vsoixmpSTO+QUfUIbGjr+doazWsETGe
 ak8sA9GNMyFJ8saeGCXn1xj1k28aWW7sCfQjSoBK/9Ky+pZBivfXQTytXZz6/F8ocfvy
 63jtIxF9LGBtkYUAwB2F6dhEjS+fVkY6mKP11rvdcegGAjMWdxZoaSr2VrggyIEcnVm2
 RcU5HLJun/88UbrBss+6+43JaPIX53R3HRu5CrStZkZCBO51W6StugowMh5pxPT9jAT+
 4WyJlAu8XXMwmH+JzArd6OSgxk3EJKOo05OFT21hHLqUebHfq3I+MNr3jCJtk0/qiQwi
 hgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6hE1IwbcD/W0J8iLODxuA+fomqEuqcycOTMy2P9S7y4=;
 b=DH/FnwmIJ7TxcfySANLEfV0KUkfD6fX7kN4xhuKPCYEtDLPskEftioCTsIGU+OqSE2
 VRjqKWCU4OOhtfr0B7RCXSK4BMvWJZMD4uMyze80hF+WJbqSCmhp6lUoXTGGRYquJVGk
 BGLegDnwt4/bPU5+So/TFHn6Q01ruPzzhj1Yv9/YwCpzSQuhIqwVd5ErKTTyuyzTtF24
 Nm2p5APmFELYMT3JXJB4Hes+1o6OUQxTk7xODie2h8ddTfzF1AD/xEOnvF5J1Jl4drKB
 hic2C4PM2N4k5qPCjr+WMCsAwE2qZnjwYERpsMeI1Cm/44iLbf8HVXZRDj4rwAywFuph
 mXCQ==
X-Gm-Message-State: AOAM530Z9zDpqN4vMlDJBY+kWGFDUE7zG/iBWdRtl63SES2UAidiMt5L
 887n5cPt88Kx5ek2adhoPiY=
X-Google-Smtp-Source: ABdhPJxDt6Hn3mdV88Z1fZn0pqd9mCs3I5QX3BaCXW1OL8QI7ryJ7oap+vwFNX6X1LyQuD6DEcMT3w==
X-Received: by 2002:a65:62cb:: with SMTP id m11mr17342007pgv.425.1629441744057; 
 Thu, 19 Aug 2021 23:42:24 -0700 (PDT)
Received: from [10.252.0.53]
 (ec2-54-199-237-251.ap-northeast-1.compute.amazonaws.com. [54.199.237.251])
 by smtp.gmail.com with ESMTPSA id z2sm6813828pgz.43.2021.08.19.23.42.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 23:42:23 -0700 (PDT)
Cc: akira.tsukamoto@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux@roeck-us.net, geert@linux-m68k.org, qiuwenbo@kylinos.com.cn,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] riscv: __asm_copy_to-from_user: Improve using word
 copy if size < 9*SZREG
To: Andreas Schwab <schwab@linux-m68k.org>, Palmer Dabbelt <palmer@dabbelt.com>
References: <e3e9fb3a-40b1-50f3-23cc-50bfa53baa8d@gmail.com>
 <mhng-f83b1d51-c006-4b01-830a-0f827f0c56a1@palmerdabbelt-glaptop>
 <87zgthjjun.fsf@igel.home>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <ebfbcb26-5f17-2cc2-4845-6cdb24326338@gmail.com>
Date: Fri, 20 Aug 2021 15:42:20 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87zgthjjun.fsf@igel.home>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_234227_857469_A2872763 
X-CRM114-Status: GOOD (  19.52  )
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

Hi Andreas,

On 8/17/2021 4:00 AM, Andreas Schwab wrote:
> On Aug 16 2021, Palmer Dabbelt wrote:
> 
>> On Fri, 30 Jul 2021 06:52:44 PDT (-0700), akira.tsukamoto@gmail.com wrote:
>>> Reduce the number of slow byte_copy when the size is in between
>>> 2*SZREG to 9*SZREG by using none unrolled word_copy.
>>>
>>> Without it any size smaller than 9*SZREG will be using slow byte_copy
>>> instead of none unrolled word_copy.
>>>
>>> Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
>>> ---
>>>  arch/riscv/lib/uaccess.S | 46 ++++++++++++++++++++++++++++++++++++----
>>>  1 file changed, 42 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
>>> index 63bc691cff91..6a80d5517afc 100644
>>> --- a/arch/riscv/lib/uaccess.S
>>> +++ b/arch/riscv/lib/uaccess.S
>>> @@ -34,8 +34,10 @@ ENTRY(__asm_copy_from_user)
>>>  	/*
>>>  	 * Use byte copy only if too small.
>>>  	 * SZREG holds 4 for RV32 and 8 for RV64
>>> +	 * a3 - 2*SZREG is minimum size for word_copy
>>> +	 *      1*SZREG for aligning dst + 1*SZREG for word_copy
>>>  	 */
>>> -	li	a3, 9*SZREG /* size must be larger than size in word_copy */
>>> +	li	a3, 2*SZREG
>>>  	bltu	a2, a3, .Lbyte_copy_tail
>>>
>>>  	/*
>>> @@ -66,9 +68,40 @@ ENTRY(__asm_copy_from_user)
>>>  	andi	a3, a1, SZREG-1
>>>  	bnez	a3, .Lshift_copy
>>>
>>> +.Lcheck_size_bulk:
>>> +	/*
>>> +	 * Evaluate the size if possible to use unrolled.
>>> +	 * The word_copy_unlrolled requires larger than 8*SZREG
>>> +	 */
>>> +	li	a3, 8*SZREG
>>> +	add	a4, a0, a3
>>> +	bltu	a4, t0, .Lword_copy_unlrolled
>>> +
>>>  .Lword_copy:
>>> -        /*
>>> -	 * Both src and dst are aligned, unrolled word copy
>>> +	/*
>>> +	 * Both src and dst are aligned
>>> +	 * None unrolled word copy with every 1*SZREG iteration
>>> +	 *
>>> +	 * a0 - start of aligned dst
>>> +	 * a1 - start of aligned src
>>> +	 * t0 - end of aligned dst
>>> +	 */
>>> +	bgeu	a0, t0, .Lbyte_copy_tail /* check if end of copy */
>>> +	addi	t0, t0, -(SZREG) /* not to over run */
>>> +1:
>>> +	REG_L	a5, 0(a1)
>>> +	addi	a1, a1, SZREG
>>> +	REG_S	a5, 0(a0)
>>> +	addi	a0, a0, SZREG
>>> +	bltu	a0, t0, 1b
>>> +
>>> +	addi	t0, t0, SZREG /* revert to original value */
>>> +	j	.Lbyte_copy_tail
>>> +
>>> +.Lword_copy_unlrolled:
>>> +	/*
>>> +	 * Both src and dst are aligned
>>> +	 * Unrolled word copy with every 8*SZREG iteration
>>>  	 *
>>>  	 * a0 - start of aligned dst
>>>  	 * a1 - start of aligned src
>>> @@ -97,7 +130,12 @@ ENTRY(__asm_copy_from_user)
>>>  	bltu	a0, t0, 2b
>>>
>>>  	addi	t0, t0, 8*SZREG /* revert to original value */
>>> -	j	.Lbyte_copy_tail
>>> +
>>> +	/*
>>> +	 * Remaining might large enough for word_copy to reduce slow byte
>>> +	 * copy
>>> +	 */
>>> +	j	.Lcheck_size_bulk
>>>
>>>  .Lshift_copy:
>>
>> I'm still not convinced that going all the way to such a large unrolling
>> factor is a net win, but this at least provides a much smoother cost 
>> curve.
>>
>> That said, this is causing my 32-bit configs to hang.
> 
> It's missing fixups for the loads in the loop.
> 
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index a835df6bd68f..12ed1f76bd1f 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -89,9 +89,9 @@ ENTRY(__asm_copy_from_user)
>  	bgeu	a0, t0, .Lbyte_copy_tail /* check if end of copy */
>  	addi	t0, t0, -(SZREG) /* not to over run */
>  1:
> -	REG_L	a5, 0(a1)
> +	fixup REG_L	a5, 0(a1), 10f
>  	addi	a1, a1, SZREG
> -	REG_S	a5, 0(a0)
> +	fixup REG_S	a5, 0(a0), 10f
>  	addi	a0, a0, SZREG
>  	bltu	a0, t0, 1b

Thanks, our messages crossed.
I also made the same changes after Qiu's comment, and contacting him
so I also could try it at my place and confirm if there are any other
changes required or not.

Please give me a little more while.

Akira

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
