Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81744C61D97
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 10:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5cMwss/RlRRPJw0uyUpJ2ltns8ARnBn3RgfTuE4yOTI=; b=yaU6+YXNGExqmo
	943UXFRqveP2jEvDEx7ogEYQuawi5UPwvGSwaqcYeg1+MwakyyLyboyQEa72E/3Z4wspodn2JBHKc
	jLuwAh8NAbgJDlj7ViD78TxYxCGDuhav+0Eu3ztmhqvogVJndHNbDnWVtxcD+KFF/8rwbyqJdLTGi
	z6cg5o/P80eni3oYEfziSxv4VmlDbSyQnPtB3B8e4uObGfuN5yC7yqP7paSYl2dKdNtC/GC/Gv3jV
	N1CRZu1pt0ZKmvpqvQMCQA8iQvKfAvI0kEGcqNd7kRXqxkxayp8iJckfjR8YvjA7bIX97xaytsH3S
	yAhM0Ab8HjxqtXFEgVTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6TL2-006pv4-2W;
	Fri, 24 Nov 2023 10:23:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6TJt-006pU7-1L
	for linux-riscv@bombadil.infradead.org;
	Fri, 24 Nov 2023 10:21:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Vk+K03FMpa5I++N+IPb24j4gsziH07t0yvKcvp4gCiw=; b=VyFuNyBZPblnjY2sQLJKCD6fNt
	GTsephs/nFkLzTgdLtHREnjF7B4e27wgCNjeelewYTz6SK/duB0puBSr6P3hWfpZEWIs9jPPU01ef
	1m9Yla3F8gK6Wrs9XFUEtFMWR3jUO+gnV1IfYPCnbxuNO7l6dX251LqhFxEspTV2DjxoSuKR3CjOq
	JF6nsCgRbFYA+RUBsbp9sTVTaV2jTmUK72zC0+w2lLf+jhf/DiPEx1iBhRMa+hx1OttTXAQ/pMscK
	s1DMlDyALMYTQO1BF/9f8AE2aIgpM0DmZpxym5wvLFPTa9BGyOKqO9j1eLjKPoQ80n5V3lONDJuM6
	aBGyUzsg==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6TJe-00DqUw-38
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 10:21:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-332c087d302so370617f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Nov 2023 02:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700821281; x=1701426081; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vk+K03FMpa5I++N+IPb24j4gsziH07t0yvKcvp4gCiw=;
        b=xIrDG6WIwAxrccRGkMkUvYbkdowgCTTKWtSb8Wa0SNAi9xpTC8jFrarveYNIEE/wdZ
         EQCIOH7MMxdM1aF6GqAgW1sTMG+Spk5ySNSqt6sbKFrp5+S2PJ4enL5RGSqQbZS4uc+W
         xcJDLA9BHa/7ZVTTVCZrYdvjNE9oHotmM+Hvmmt21yOGxzrg+3cjiyRyEj5fdga4hfGO
         Boy5UMJW3+BZq2a/lg8g+l6FxSiE+lh98dHZR+Dan9Wa2Oc06obMb6P/mTd/CePMwij3
         thGCfV2riUybCoYYu0HIu1fJ6T1ChKIp1rAIVSvJ1QV48ZkZslVPHm6g3sv6DTp0jW3e
         YY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821281; x=1701426081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vk+K03FMpa5I++N+IPb24j4gsziH07t0yvKcvp4gCiw=;
        b=k6V1ieR1ms0sbt6TXMNh7CMW1jc3eRaZ9ZhZaXWB5hjYTQ8GdcyyUi0iAzJzYYyRrb
         uTCPXrl+5DaTwjj1xi5GPmWuY5OjFJOncaBjXs6t3OXFsYoUXuCYDQuvNm4UmJ43pwz5
         Es03QmQHMHEqRUvRhoexWfkTaBXBKQleriU89rUisOUAHgOXX6T1i+1kELs0aD1RHmL7
         UqK3eGXYySivDlNiyTCKDJ4AK8UxATlp98Me+W9TmZz1v462iaUzuEGwozgLnh3wOBc7
         myf5UMmIx6tS2PTuw+vTnHsZzPMmyTYwMQH1RcjcC/wWT4CRe71+Y8w59kXWKcruSl6C
         HZwQ==
X-Gm-Message-State: AOJu0YwLSe82o2vEKfDLAsNoJvqVnDQfNsUmMEKvmgMfgZj0rHTMpe+y
	nAOhD+GFfRHT9WaFBbTNvh9GTA==
X-Google-Smtp-Source: AGHT+IHfAetx+moACOMxx0ZqVDGW0f2zx0GRuaQijEBgGWyP33sq9c4jdtFCKMaWouOHYVP0LZ7Pnw==
X-Received: by 2002:adf:d1ee:0:b0:32f:9b7c:fe73 with SMTP id g14-20020adfd1ee000000b0032f9b7cfe73mr1629025wrd.5.1700821280779;
        Fri, 24 Nov 2023 02:21:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:3471:930b:671b:cf77? ([2a01:e0a:999:a3a0:3471:930b:671b:cf77])
        by smtp.gmail.com with ESMTPSA id c9-20020adfef49000000b0032fb7b4f191sm3952549wrp.91.2023.11.24.02.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 02:21:20 -0800 (PST)
Message-ID: <5a4971eb-853a-493c-8c02-0c7bd14b88d6@rivosinc.com>
Date: Fri, 24 Nov 2023 11:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: fix __user annotation in traps_misaligned.c
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
References: <20231123141617.259591-1-ben.dooks@codethink.co.uk>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231123141617.259591-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_102147_114294_715FFCEC 
X-CRM114-Status: GOOD (  19.56  )
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

Hi Ben,

I sent a similar patch two days ago
(https://lore.kernel.org/linux-riscv/20231122135141.2936663-1-cleger@rivosinc.com/).

On 23/11/2023 15:16, Ben Dooks wrote:
> The instruction reading code can read from either user or kernel addresses
> and thus the use of __user on pointers to instructions depends on which
> context. Fix a few sparse warnings by using __user for user-accesses and
> remove it when not.
> 
> Fixes:
> 
> arch/riscv/kernel/traps_misaligned.c:361:21: warning: dereference of noderef expression
> arch/riscv/kernel/traps_misaligned.c:373:21: warning: dereference of noderef expression
> arch/riscv/kernel/traps_misaligned.c:381:21: warning: dereference of noderef expression
> arch/riscv/kernel/traps_misaligned.c:322:24: warning: incorrect type in initializer (different address spaces)
> arch/riscv/kernel/traps_misaligned.c:322:24:    expected unsigned char const [noderef] __user *__gu_ptr
> arch/riscv/kernel/traps_misaligned.c:322:24:    got unsigned char const [usertype] *addr
> arch/riscv/kernel/traps_misaligned.c:361:21: warning: dereference of noderef expression
> arch/riscv/kernel/traps_misaligned.c:373:21: warning: dereference of noderef expression
> arch/riscv/kernel/traps_misaligned.c:381:21: warning: dereference of noderef expression
> arch/riscv/kernel/traps_misaligned.c:332:24: warning: incorrect type in initializer (different address spaces)
> arch/riscv/kernel/traps_misaligned.c:332:24:    expected unsigned char [noderef] __user *__gu_ptr
> arch/riscv/kernel/traps_misaligned.c:332:24:    got unsigned char [usertype] *addr
> 
> Fixes: 7c83232161f60 ("riscv: add support for misaligned trap handling in S-mode")
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 5eba37147caa..446e3d4eeea9 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -319,7 +319,7 @@ static inline int get_insn(struct pt_regs *regs, ulong mepc, ulong *r_insn)
>  static inline int load_u8(struct pt_regs *regs, const u8 *addr, u8 *r_val)
>  {
>  	if (user_mode(regs)) {
> -		return __get_user(*r_val, addr);
> +		return __get_user(*r_val, (u8 __user *)addr);
>  	} else {
>  		*r_val = *addr;
>  		return 0;
> @@ -329,7 +329,7 @@ static inline int load_u8(struct pt_regs *regs, const u8 *addr, u8 *r_val)
>  static inline int store_u8(struct pt_regs *regs, u8 *addr, u8 val)
>  {
>  	if (user_mode(regs)) {
> -		return __put_user(val, addr);
> +		return __put_user(val, (u8 __user *)addr);
>  	} else {
>  		*addr = val;
>  		return 0;
> @@ -343,7 +343,7 @@ static inline int store_u8(struct pt_regs *regs, u8 *addr, u8 val)
>  	if (user_mode(regs)) {				\
>  		__ret = __get_user(insn, insn_addr);	\
>  	} else {					\
> -		insn = *insn_addr;			\
> +		insn = *(__force u16 *)insn_addr;	\

__read_insn() is called with either a u32 or a u16 pointer which is why
this macros did not used a specific type. Doing so would result in
loading half of what is needed. My patch addresses that.

Thanks

>  		__ret = 0;				\
>  	}						\
>  							\

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
