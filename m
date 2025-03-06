Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1196FC282D1
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 06:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxkjvzruiFN5la199R8bW7dxTxSKFyyuF6Kdx2nAUBA=; b=Gc3+t73U1mPtVp
	qncWx/92OFg6tvQA21yG4yLRHclXvDe4lz3EVtxUNP7P1gLEza15fPJYGvpVduaxmDHrHRtKdpX7w
	IiP2vbYBpD95Gz4YgCKW501tir7tBB57hhL8yq1vaC09qe9bBevEPHuy5v9TcShcXhSUN9gx9pXFX
	UisbSEbaWCewBlnkB0fByTbzTJIhZMLvyQauFzMuFFSbCpIz+xbnh7h/dmZB1euGEqMXPIL3XtaWX
	a3v/I2FCdrVLR4ZDZBcVo1S4gGkkTHfS8v8/7/LgYTYoKUnAGVQzMWCsMf03MVT8dRd/s8Xd/b4lp
	Xul5e5kGUUeOkaYOAAgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq4le-0000000A7wH-3fHb;
	Thu, 06 Mar 2025 06:31:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq4lc-0000000A7vk-2o7i
	for linux-riscv@bombadil.infradead.org;
	Thu, 06 Mar 2025 06:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=bblUkYK5rTVes/OOwKXM7H10R1JrlrPcUhP5Wq4e/a4=; b=oXQVDqCC5pakUAjZUpvYicro5w
	t/qrTzNbStiPj2kdifJL96pgI0ELvNVC13o7E+auHKcM8Dk+mV/ltlQqyPZZ1OSUEX6whG2T+iqcB
	io2/EfL5mcv9Svx9NiWBMphLmrRTlHgJp79GoKm7l5XndfIWcAfe8m/h7Ysb5D3ubEt7YrIhC+aZm
	/PPNwDVzGpoj5crSUeZyxLq8XtaumPsLLooBdcHwpFCfq+BSSy4QiJRflmILrDUgIu5NxoTGUVDmC
	R7gARKepNMNPHSZq3LhuiLquuKH72674hSqzougidWu5mhMVMthtWbnODQmU44hlGPqiFcqACxhQd
	yBBa76jA==;
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq4lY-00000006vDY-0twi
	for linux-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 06:31:35 +0000
Message-ID: <f3bde84d-b53e-4b81-b995-3b81d614b789@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1741242686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bblUkYK5rTVes/OOwKXM7H10R1JrlrPcUhP5Wq4e/a4=;
	b=cGqsCgJ05RfBl8CUHOvSxMvx0U4R/sCtc1iKSgkqKMnU3rRPu7bKNSBxMf27yiTAmAL0ll
	BXHMH9QeIZEnpKdBieyhWzOgdDigRbRj4p6+Uddozp9Gfz7PrlQV4SVEtULETnw2b5k39W
	kVMUcADcB1l5sgDny6PMFFZEMCAl6HoURzD1W5YOxrQYuqnndzs96u/Z9iu7aDYXYwCczc
	r/uAiZ4ssjiMHJhP27jjIpyRZzP2xo+KYWm4ebGYZcI495r51Teq9xBl+mowyOLRsziGdL
	yT2l4g3ZFf9PxWELid/G3tbQZfgNMWelyLLXFPHfNJs3p49WYyy8mnzTqPmjyg==
Date: Thu, 6 Mar 2025 07:31:22 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] selftests: riscv: fix v_exec_initval_nolibc.c
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250305-fix-v_exec_initval_nolibc-v1-1-b87b60e43002@iencinas.com>
 <Z8jG1ViOUbw79cEN@ghost>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
Autocrypt: addr=ignacio@iencinas.com; keydata=
 xjMEZgaZEBYJKwYBBAHaRw8BAQdAYZxeXU5yoeLYkQpvN+eE3wmAF4V0JUzIlpm/DqiSeBnN
 LElnbmFjaW8gRW5jaW5hcyBSdWJpbyA8aWduYWNpb0BpZW5jaW5hcy5jb20+wo8EExYIADcW
 IQSXV5vKYfM26lUMmYnH3J3Ka8TsNgUCZgaZEAUJBaOagAIbAwQLCQgHBRUICQoLBRYCAwEA
 AAoJEMfcncprxOw21F4BAJe+mYh3sIdSvydyDdDXLFqtVkzrFB8PVNSU9eZpvM0mAP9996LA
 N0gyY7Obnc3y59r9jOElOn/5fz5mOEU3nE5lCc44BGYGmRESCisGAQQBl1UBBQEBB0CVC5o6
 qnsTzmmtKY1UWa/GJE53dV/3UPJpZu42p/F0OAMBCAfCfgQYFggAJhYhBJdXm8ph8zbqVQyZ
 icfcncprxOw2BQJmBpkRBQkFo5qAAhsMAAoJEMfcncprxOw2N8ABAPcrkHouJPn2N8HcsL4S
 SVgqxNLVOpsMX9kAYgIMqM0WAQCA40v0iYH1q7QHa2IfgkrBzX2ZLdXdwoxfUr8EY5vtAg==
In-Reply-To: <Z8jG1ViOUbw79cEN@ghost>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_063132_374054_7F55DA2E 
X-CRM114-Status: GOOD (  10.42  )
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



On 5/3/25 22:49, Charlie Jenkins wrote:
> On Wed, Mar 05, 2025 at 05:39:28PM +0100, Ignacio Encinas wrote:
>> Vector registers are zero initialized by the kernel. Stop accepting
>> "all ones" as a clean value.
>>
>> Note that this was not working as expected given that
>> 	value == 0xff
>> can be assumed to be always false by the compiler as value's range is
>> [-128, 127]. Both GCC (-Wtype-limits) and clang
>> (-Wtautological-constant-out-of-range-compare) warn about this.
> 
> This check was included because the "dirty" value is an implementation
> detail that I believe is not strongly defined in the ABI. Since linux
> does always set this value to zero (currently) we can safely remove this
> check. 

Thanks for the review. Just after sending the patch I noticed it should
also remove some code that becomes useless after this change: 
_prev_value_ and _first_ variables were only needed because two "clean" 
values were supported.

I'll send a v2 tomorrow. I'm guessing keeping your "Reviewed-by" and
"Tested-by" is the appropriate thing to do as the changes are very
simple. Let me know if that's not the case.

Thanks again!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
