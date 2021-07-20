Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A086C07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 10:10:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14CBB610C7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 10:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14CBB610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Cc:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sXwUS0rmgHp3EdkxdW9XwMsp11Lca8GHR2KZR+vcjo8=; b=fBQo7PtlSLTVYpGEAbM7i6CB9Q
	HCLqD0+mu2T2sCwWcrkJ0c+LpfPRzeBu1BIP3g+npzr9jmkBDAzCICYNPzVdRpy4JIcx9lEbdszMr
	qLbUIqrwBm67eIYqq4ZIP/oUXOyrq+5r38ik9nX9Wq9rkUlC1KIQkAA7s+EkzOo7hhFCKC/ItJqG3
	q3cvX1coom3E0ufEBp21HOQlJkSf+tdbw/dX0NqVp29uJrj6SuwtjStlNrL9zTuh6f3szQkMqA6F7
	kZxc2GtZch9dlKC5tH60t4bl0KYhv7yTNW0gzGkTvnJxy4mR8OGnpjR5UGls6uJCa2h00HxD+SWNb
	8jYhF1Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5mi2-00CTk7-Eq; Tue, 20 Jul 2021 10:10:42 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5mhz-00CTjM-N4
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 10:10:41 +0000
Received: by mail-pg1-x535.google.com with SMTP id 37so22092168pgq.0
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 03:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:subject:from:to:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ON9ROCmxC1aHRN/SLW7yw1lyXR8Z00bQ/GTjePKJTgE=;
 b=MRonwvEmyWMwBa8NaqpGyHVm7zzwBSzrXrgMnYeR4erCWkiJf6p6KUjgvb3yr9eb9E
 VfXIEPhLXi0fvF4ETMbzCyMelCMRedb4dNDUbYjq3P+yx3jcTDTQaLaoyQ5sYTBVMSlq
 IdF7aokMXKGn9Qdnl/gs6ytx9QZcQPz3ymowJ6HTQpQkmGPwipp66QnCSbtQENdmRgBB
 ipGxEXxeBB07L2fYf9QmoJgzsL3p+nslMwJiMHdqk8LJ4dzHcD3+a2wt3UVCb9+9oH7z
 F+kqREC+dgV7LtrdYXG4uyzYWGcbHbzaBG0J8Z3f0e/j+xGYyp9nJjd5jlcqpI59dAPr
 NSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ON9ROCmxC1aHRN/SLW7yw1lyXR8Z00bQ/GTjePKJTgE=;
 b=DKaVwMPBwqIO7aEvOE61Y8UvnbXSHiexg3Zf66RBY2TqQELsxZdAxv/VLn7ZIZReso
 W/OTeJy2JlJmbaGLKl6TaaxOwVedS+vhZgDDL55ncpKug3ee7aRLPTJsacXmtbOuJ+wG
 4gGWaQ343wYbITLWL80XlMa12jrPGzxszDoyWHyotObokpgeVpN+9JxgZ6Q5imABnKRR
 jH+FcQJR+u3O6pJDs2ZTiLQPlT+BjqW/jPcOTBl5FcjSKQspor9Qsp2agVkKkThTbh9G
 51KulIlrcw14kFBzkbRzuiO8UyGMRfm88Ov6K/KkNqky1lxL2IIRBX5EZCrNO+HmW6PH
 Banw==
X-Gm-Message-State: AOAM533WpUTAmjmAbyytRk4HUpZSkS1v0/CjjcKAlwRt8cz9lvp20rzk
 byZiQf6aKxnb6aupO0mC9ifPKBJbCowtog==
X-Google-Smtp-Source: ABdhPJyqv7mswHKE/HhoKkokudoWmFy07PVRg7fYeT0U1c3tTRNf+RiTnHMmNzx8f0s35Feb9VIL1g==
X-Received: by 2002:a65:5b4d:: with SMTP id y13mr13559477pgr.84.1626775838637; 
 Tue, 20 Jul 2021 03:10:38 -0700 (PDT)
Received: from [10.252.1.51]
 (ec2-52-196-129-95.ap-northeast-1.compute.amazonaws.com. [52.196.129.95])
 by smtp.gmail.com with ESMTPSA id h5sm22416929pfv.145.2021.07.20.03.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 03:10:38 -0700 (PDT)
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: __asm_copy_to-from_user: fix out of boundary
 memory copy
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
To: Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Guenter Roeck <linux@roeck-us.net>
References: <20210717161213.91892-1-qiuwenbo@kylinos.com.cn>
 <7d492508-728c-2a6d-f3f8-79c519118fe2@gmail.com>
Message-ID: <66708601-774f-3add-5c94-c1c10e6acfd0@gmail.com>
Date: Tue, 20 Jul 2021 19:10:34 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7d492508-728c-2a6d-f3f8-79c519118fe2@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_031039_819722_513BEA5D 
X-CRM114-Status: GOOD (  19.18  )
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

Hi Qiu,

On 7/18/2021 11:05 AM, Akira Tsukamoto wrote:
> 
> On 7/18/2021 1:12 AM, Qiu Wenbo wrote:
>> The __asm_copy_to-from_user function will copy extra bytes beyond the
>> boundary when two conditions hold:
>>
>> 1. (src - dst) & (SZREG-1) == 0
>> 2. 8*SZREG <= size < -src & (SZREG-1) + 8*SZREG
>>
>> The first condition makes the function enter the unrolled word copy code
>> path. And the second condition makes the function believe that there is
>> enough bytes to do one iteration of 8*SZREG byte copy. That is not true
>> since the available bytes is reduced by -src & (SZREG-1) byte to make
>> both src and dst aligned to SZREG.
> 
> Thanks for analyzing the bug.
> 
>>  	li	a3, 8*SZREG /* size must be larger than size in word_copy */
> 
> Changing the 8*SZREG to 9*SZREG as bellow
> 
> li	a3, 9*SZREG
> 
> would fix it but since it is going to respin the patch
> I would like to add the word_copy when the size is in between 2*SZREG
> 9*SZREG as Palmer have mentioned.

I created a series to fix above on the other thread.
It had to revise two places to fix the overrunning memory copy.

>> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
>> index bceb0629e440..7ab7cb96dcd9 100644
>> --- a/arch/riscv/lib/uaccess.S
>> +++ b/arch/riscv/lib/uaccess.S
>> @@ -36,6 +36,9 @@ ENTRY(__asm_copy_from_user)
>>  	 * Use byte copy only if too small.
>>  	 */
>>  	li	a3, 8*SZREG /* size must be larger than size in word_copy */
>> +	neg	t1, a0
>> +	andi	t1, t1, SZREG-1
>> +	add	a3, a3, t1
>>  	bltu	a2, a3, .Lbyte_copy_tail

I chosen just using 9*SZREG instead of using fine grained three lines. 

Your analysis greatly helped for creating the fixes. Please let me 
know if it still has issue. 

Thank you,

Akira

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
