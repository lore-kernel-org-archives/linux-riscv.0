Return-Path: <SRS0=iJWH=NH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAC9C4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 19:00:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99ACA60F22
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 19:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99ACA60F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCrEh/hO3/srfkac7VSTxE7NILQlMyco0lMiqgPorYg=; b=PoN8rc4TYFDmCZ
	t5dPiCscDYdyeMufYoG94j86Ub9I1qjPoIV7zp8kBxNEjTT5D06CkQR085N/v02UmEmwN9HOtaiho
	PB1jWPWOVFa8qJy2Ilma/KQnR6RcjIHta8nHeC402OaxHa/9zs4i6hx4IfdBb2+qHilKj0QI+sH/S
	ToVWegx03gyXEgSfVE31JqRwLsXnGFnIWR+dB3xyNLCRfe7teF2ptSjYSZ4XXnmO+fByyRYfOz9BP
	qi17/0IqASx14KIat8FJQzV7nFa3wGCOOGEtWHF1GRTpYKnTIh+SkFBlyp1rUgodyMNol5CVF1+GZ
	2G4LfmULlFcasw9mfEAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFhqZ-0003ZG-UW; Mon, 16 Aug 2021 19:00:31 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFhqV-0003Ts-Pr
 for linux-riscv@lists.infradead.org; Mon, 16 Aug 2021 19:00:30 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4GpNlQ4jSRz1qwGp;
 Mon, 16 Aug 2021 21:00:18 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4GpNlQ3lsxz1r6P1;
 Mon, 16 Aug 2021 21:00:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id C_DzlPCR5dQ3; Mon, 16 Aug 2021 21:00:17 +0200 (CEST)
X-Auth-Info: Rw1j2hvSxw+BeG4hBnBmc2okW6IsahQRiTeFyGFwkw5fEIf7BhrTh0d9IoJAMmc+
Received: from igel.home (ppp-46-244-185-182.dynamic.mnet-online.de
 [46.244.185.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 16 Aug 2021 21:00:17 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id C1A902C2640; Mon, 16 Aug 2021 21:00:16 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: akira.tsukamoto@gmail.com,  Paul Walmsley <paul.walmsley@sifive.com>,
 linux@roeck-us.net,  geert@linux-m68k.org,  qiuwenbo@kylinos.com.cn,
 aou@eecs.berkeley.edu,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] riscv: __asm_copy_to-from_user: Improve using word
 copy if size < 9*SZREG
References: <e3e9fb3a-40b1-50f3-23cc-50bfa53baa8d@gmail.com>
 <mhng-f83b1d51-c006-4b01-830a-0f827f0c56a1@palmerdabbelt-glaptop>
X-Yow: Now I'm having INSIPID THOUGHTS about the beautiful, round
 wives of HOLLYWOOD MOVIE MOGULS encased in PLEXIGLASS CARS
 and being approached by SMALL BOYS selling FRUIT..
Date: Mon, 16 Aug 2021 21:00:16 +0200
In-Reply-To: <mhng-f83b1d51-c006-4b01-830a-0f827f0c56a1@palmerdabbelt-glaptop>
 (Palmer Dabbelt's message of "Mon, 16 Aug 2021 11:09:45 -0700 (PDT)")
Message-ID: <87zgthjjun.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_120028_165840_4B057149 
X-CRM114-Status: GOOD (  20.98  )
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

On Aug 16 2021, Palmer Dabbelt wrote:

> On Fri, 30 Jul 2021 06:52:44 PDT (-0700), akira.tsukamoto@gmail.com wrote:
>> Reduce the number of slow byte_copy when the size is in between
>> 2*SZREG to 9*SZREG by using none unrolled word_copy.
>>
>> Without it any size smaller than 9*SZREG will be using slow byte_copy
>> instead of none unrolled word_copy.
>>
>> Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
>> ---
>>  arch/riscv/lib/uaccess.S | 46 ++++++++++++++++++++++++++++++++++++----
>>  1 file changed, 42 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
>> index 63bc691cff91..6a80d5517afc 100644
>> --- a/arch/riscv/lib/uaccess.S
>> +++ b/arch/riscv/lib/uaccess.S
>> @@ -34,8 +34,10 @@ ENTRY(__asm_copy_from_user)
>>  	/*
>>  	 * Use byte copy only if too small.
>>  	 * SZREG holds 4 for RV32 and 8 for RV64
>> +	 * a3 - 2*SZREG is minimum size for word_copy
>> +	 *      1*SZREG for aligning dst + 1*SZREG for word_copy
>>  	 */
>> -	li	a3, 9*SZREG /* size must be larger than size in word_copy */
>> +	li	a3, 2*SZREG
>>  	bltu	a2, a3, .Lbyte_copy_tail
>>
>>  	/*
>> @@ -66,9 +68,40 @@ ENTRY(__asm_copy_from_user)
>>  	andi	a3, a1, SZREG-1
>>  	bnez	a3, .Lshift_copy
>>
>> +.Lcheck_size_bulk:
>> +	/*
>> +	 * Evaluate the size if possible to use unrolled.
>> +	 * The word_copy_unlrolled requires larger than 8*SZREG
>> +	 */
>> +	li	a3, 8*SZREG
>> +	add	a4, a0, a3
>> +	bltu	a4, t0, .Lword_copy_unlrolled
>> +
>>  .Lword_copy:
>> -        /*
>> -	 * Both src and dst are aligned, unrolled word copy
>> +	/*
>> +	 * Both src and dst are aligned
>> +	 * None unrolled word copy with every 1*SZREG iteration
>> +	 *
>> +	 * a0 - start of aligned dst
>> +	 * a1 - start of aligned src
>> +	 * t0 - end of aligned dst
>> +	 */
>> +	bgeu	a0, t0, .Lbyte_copy_tail /* check if end of copy */
>> +	addi	t0, t0, -(SZREG) /* not to over run */
>> +1:
>> +	REG_L	a5, 0(a1)
>> +	addi	a1, a1, SZREG
>> +	REG_S	a5, 0(a0)
>> +	addi	a0, a0, SZREG
>> +	bltu	a0, t0, 1b
>> +
>> +	addi	t0, t0, SZREG /* revert to original value */
>> +	j	.Lbyte_copy_tail
>> +
>> +.Lword_copy_unlrolled:
>> +	/*
>> +	 * Both src and dst are aligned
>> +	 * Unrolled word copy with every 8*SZREG iteration
>>  	 *
>>  	 * a0 - start of aligned dst
>>  	 * a1 - start of aligned src
>> @@ -97,7 +130,12 @@ ENTRY(__asm_copy_from_user)
>>  	bltu	a0, t0, 2b
>>
>>  	addi	t0, t0, 8*SZREG /* revert to original value */
>> -	j	.Lbyte_copy_tail
>> +
>> +	/*
>> +	 * Remaining might large enough for word_copy to reduce slow byte
>> +	 * copy
>> +	 */
>> +	j	.Lcheck_size_bulk
>>
>>  .Lshift_copy:
>
> I'm still not convinced that going all the way to such a large unrolling
> factor is a net win, but this at least provides a much smoother cost 
> curve.
>
> That said, this is causing my 32-bit configs to hang.

It's missing fixups for the loads in the loop.

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index a835df6bd68f..12ed1f76bd1f 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -89,9 +89,9 @@ ENTRY(__asm_copy_from_user)
 	bgeu	a0, t0, .Lbyte_copy_tail /* check if end of copy */
 	addi	t0, t0, -(SZREG) /* not to over run */
 1:
-	REG_L	a5, 0(a1)
+	fixup REG_L	a5, 0(a1), 10f
 	addi	a1, a1, SZREG
-	REG_S	a5, 0(a0)
+	fixup REG_S	a5, 0(a0), 10f
 	addi	a0, a0, SZREG
 	bltu	a0, t0, 1b
 

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
