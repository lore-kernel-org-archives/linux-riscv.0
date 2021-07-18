Return-Path: <SRS0=1tpi=MK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DE8C636C9
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jul 2021 02:06:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA0606108B
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jul 2021 02:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA0606108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lDu1MttuqJSRIEtUAbUq3XDldNUULFONpBANrPrTT/8=; b=Y8OJOuKzrW4K0xoSZsSNJwKcqc
	iEsqRUDpFHby1VTJYHpxPFtBbHVCFahG9oSBs0U5GbPl2RdLaobAbMEfpS3wGNrUB9RelQRacQ5UE
	UPRzRfLnZ5bvvmk741DUtNUBCFiZgK5uHTyYdj2d07H+BXmYBBtD4UA1YZ84IS1DwICwxspdyvhMK
	YxDSFxykH/tpXtGbSkg3qRmQ/if+3ZGwgGJlMI9D+CAbpfEGrjfat+cfT52xWjNR/QEk5nPSgwxSW
	/KBGoFfD90Azz0b3oI6ZE1oeuzTQfYnyqnxaF+o4I+55e/JBZ5yZZejdGGyOphlxImv5pHQ/5BDJB
	BJUTU5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4wBU-007HDz-TM; Sun, 18 Jul 2021 02:05:37 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4wBR-007HDa-UO
 for linux-riscv@lists.infradead.org; Sun, 18 Jul 2021 02:05:35 +0000
Received: by mail-pg1-x530.google.com with SMTP id y4so14891483pgl.10
 for <linux-riscv@lists.infradead.org>; Sat, 17 Jul 2021 19:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r3r0xr3xQT3tqFtAXjrLzwLty2YGFEw5z5Xe8CK5waE=;
 b=BIsgOLzUH3y+6iuau+giFvY+VBqg3llRPcbYfygw3U1yN714r9bfUL2kZRZrHrY3Qa
 Gmgb7Uq288gKlPcxmAyhw/IudqCgXLtaH7Eaw9Vwfg4IzukgBcyb4eABpwOJ8F5nfG8m
 R2lIhWP7S43IbuZwm48ZoFFn/+PWu6lMLDOFV2cIeDTp+xrm+ETQSFwM1Ea0ZDU8Lsay
 VYu2p+BDPejMEWzCA5QulXWNpZEMN/cg9q8+kydBOZf1tRxg9J8q7JEAF8GPbZXSwcm2
 oM00D1tJ3L73sIS4QyXZx37sbNWH8hXUs8Jwzl+S1r7slS9kOluOd3xlwwjojpmXGGua
 wJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r3r0xr3xQT3tqFtAXjrLzwLty2YGFEw5z5Xe8CK5waE=;
 b=VNPINnmEsMq2MGh7FUeoLIGIT4049Eeds1dEh2t2efwKYdujBe5DtB9dN2/yUr/zq/
 kBIvpB1CJRroNvpg0Eqp1bm61/rKfE2MNxHu1YXk99w/y+lTUtOyFYgoIHLUPgrZ6xFy
 GsIEJaRPJH+JrUXNwQLMTcXygpGeSj1S2DDLgiVNQ0Z7LVxxYPySux/+5RptLsIGncJy
 CRVXfDiuDktP6CMYCkf5pynqmevFA+hg/ltBCv+y9wcNkbs74difTWwyLUmEODdQK5HL
 O6VBB2dUBMpwAFxQ6ukO7EIWeSJUXkcBz9SgdmjNt/UtOFez6BAeatBeLO1joUArL3Pz
 b3dg==
X-Gm-Message-State: AOAM532W58i8Pql7At6BYJPkpPnJ3Yc7csPhNaxo3IMP7cfcjgXuVshW
 uO4bmHFuH6PnMCzPUledhxCiDnQ2k9g=
X-Google-Smtp-Source: ABdhPJwGe4qtYV5VLawTvm8k5fplwin7XSEGy9ukFvsJ8lmnkFgPJR+5aL71jQjah2eK2oqw6kFdLQ==
X-Received: by 2002:a65:64cf:: with SMTP id t15mr17562561pgv.131.1626573928985; 
 Sat, 17 Jul 2021 19:05:28 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id j2sm15475612pfb.53.2021.07.17.19.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 19:05:28 -0700 (PDT)
Subject: Re: [PATCH] riscv: __asm_copy_to-from_user: fix out of boundary
 memory copy
To: Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
References: <20210717161213.91892-1-qiuwenbo@kylinos.com.cn>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <7d492508-728c-2a6d-f3f8-79c519118fe2@gmail.com>
Date: Sun, 18 Jul 2021 11:05:24 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210717161213.91892-1-qiuwenbo@kylinos.com.cn>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_190534_056848_18581A93 
X-CRM114-Status: GOOD (  20.16  )
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


On 7/18/2021 1:12 AM, Qiu Wenbo wrote:
> The __asm_copy_to-from_user function will copy extra bytes beyond the
> boundary when two conditions hold:
> 
> 1. (src - dst) & (SZREG-1) == 0
> 2. 8*SZREG <= size < -src & (SZREG-1) + 8*SZREG
> 
> The first condition makes the function enter the unrolled word copy code
> path. And the second condition makes the function believe that there is
> enough bytes to do one iteration of 8*SZREG byte copy. That is not true
> since the available bytes is reduced by -src & (SZREG-1) byte to make
> both src and dst aligned to SZREG.

Thanks for analyzing the bug.

>  	li	a3, 8*SZREG /* size must be larger than size in word_copy */

Changing the 8*SZREG to 9*SZREG as bellow

li	a3, 9*SZREG

would fix it but since it is going to respin the patch
I would like to add the word_copy when the size is in between 2*SZREG
9*SZREG as Palmer have mentioned.

Akira

> 
> This behavior causes serious issue with exec system call both on RV64
> and RV32. The passed-in command line parameters might be changed
> silently since they are copied to the new process's stack continuously.
> 
> Fixes: ca6eaaa210de ("riscv: __asm_copy_to-from_user: Optimize unaligned memory access and pipeline stall")
> Signed-off-by: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
> ---
>  arch/riscv/lib/uaccess.S | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index bceb0629e440..7ab7cb96dcd9 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -36,6 +36,9 @@ ENTRY(__asm_copy_from_user)
>  	 * Use byte copy only if too small.
>  	 */
>  	li	a3, 8*SZREG /* size must be larger than size in word_copy */
> +	neg	t1, a0
> +	andi	t1, t1, SZREG-1
> +	add	a3, a3, t1
>  	bltu	a2, a3, .Lbyte_copy_tail
>  
>  	/*
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
