Return-Path: <SRS0=fWiV=JZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8F0C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 18:02:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D43F1613F3
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 18:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D43F1613F3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9v4Vvc7tstic+rosyFvfA5FAKJygg4U6BoXRsLMY6tg=; b=W8PsTg0dhywRzhklOM9xGmtQrf
	hk7pTXY/QicYScgY3Of4toZAg0KEVNCwtIzEKRpNf7U4ppSJYFssMwuHV6k3Un1pyBbw5le4tZ6y8
	Lm9kpFJ88pkXdVTGdNgdsZ1eIfYmys65BSyON6Wlonz3AWVjYXzv2MdHx/QaEkqCNL1b//lUWeqoJ
	DO1GxFq6fnBm6gcVSHqvaZb+mttI0ISgqWWirI6CnqjkDF0EAbGT1i/bpg3qMY34OnSvLLjGBPY93
	GW7gwZOGsU24mll8RSVqfM+Uoh430niznZ5UKgBheFUFfj7a4PMiOk6gKJoJo69Z7dTpvS4m751Ns
	XtCf5Ijg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lboWB-0042SU-Bf; Wed, 28 Apr 2021 18:02:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbbcY-002jfG-PV
 for linux-riscv@desiato.infradead.org; Wed, 28 Apr 2021 04:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=30dnzWh/H//3pMA+OZTUJzmMiZLLg9/1IuNp9r5Doh4=; b=Dnh53np5yJ8BKMQ3vn4TF254cR
 r/sRMBIthyriBaYNe2IPFK3BlrlhrZZG7QDhfZRSZeXgZcmz7hKUytXs/JS0SEuAJgYSajWFvfI6r
 KkfhUi3MAMbDsMDQE9wwPShQOM0UaEwzBmq3aItvkCrnkAYbIJo21txU5ktHhjmb+0TD0p4TDS6Ax
 TlcTgvrtIrcXjCBT8aikZa5u2yQ3pyOVd6ZuuNrnD2Y473v57C7KPZ3p1u+OtxZoWSemKo+oAGzme
 CFCx7MRYAoh7RfWz3zWHZ3n4zViO5NmVpQeA37BjX9k+ZODUSZ/qrDMMlRG++HHlcvgljkLOhP4PQ
 IkQ3i+Pg==;
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbbcW-00HAsZ-9i
 for linux-riscv@lists.infradead.org; Wed, 28 Apr 2021 04:16:17 +0000
Received: by mail-ot1-x331.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso55419796otb.13
 for <linux-riscv@lists.infradead.org>; Tue, 27 Apr 2021 21:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=30dnzWh/H//3pMA+OZTUJzmMiZLLg9/1IuNp9r5Doh4=;
 b=ajdbxIcLtOc7ooJP1T6BcErHoDTu7r+XOk8IXeIAIWg48RKcmCWPzEaZSvnwN+pXcQ
 wNEt+R8jameONE+0OX6qNHclmfsoI99YUlJVx7gAGvYW8F6oaYnNquAPmHa8ouJxIJ76
 wS8HyQ8FRaXh88bCMKbAwABUbmXcEb5bPn/iP3Ta2IBJcAWA2u9wINagDzrHd8CyxEyi
 8vtBDtA7UGe8LGTUGFd0gkYRCWKByXftwhko/63z22CdJTb38I24Vw9QRnRHGvkGrRj8
 3pS+0MtBU1vzdtbDinPgV58RudWNv8OJnajYgOlOnwZYJoZwnO31kv5IfuLE+nfXFwhR
 xcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition:user-agent;
 bh=30dnzWh/H//3pMA+OZTUJzmMiZLLg9/1IuNp9r5Doh4=;
 b=AuU2Z7z7lFuYaeYuXhKaxYXvktI7Q9SAqfm49FF+wIMnvLCrzBZHBxwdtr8ps94JUo
 pwBpb3Qt1usr/9ZnReAuvRy+JsWi52KkHIMYN0XOAS0XfS5JdFJesLPBBGubhfugTMiz
 5WYHe6lvRiXpXyNE2jgRlUyGUo3V+koQg24XPSsU1zOKujd0PUdumGwAjeJ9FcxZ1YzR
 XW0sZzqiZrkfwyKndlp0Chh4Xe8/ilgiUL0ZOFaC2rIBqQFrSmHeduyEibDDxW2ozklq
 sNDWg/yR/4MZLsarO/DJU9GO5v6HSsghSsEx1uRRvPcZhnR6+anPoQK63WiWXXUQBdv/
 Pk8A==
X-Gm-Message-State: AOAM532mrabtnpXM0zvlNfeIE1TsMRilQFAlmeX5xfAzdTu2oS98wXiP
 efFLgKCXmgDlUmZI86oMdoGAoqHOEHI=
X-Google-Smtp-Source: ABdhPJy/c4SpHDoNAR37Vb176+WYflebJZskcoFCa69SDF3FQiqXGqc2TOofPFawEbA9A5ceeEdsZA==
X-Received: by 2002:a9d:7f96:: with SMTP id t22mr22333029otp.152.1619583371243; 
 Tue, 27 Apr 2021 21:16:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 93sm443440otr.31.2021.04.27.21.16.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Apr 2021 21:16:10 -0700 (PDT)
Date: Tue, 27 Apr 2021 21:16:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 akpm@linux-foundation.org, Atish Patra <Atish.Patra@wdc.com>,
 Anup Patel <Anup.Patel@wdc.com>, wangkefeng.wang@huawei.com,
 rppt@kernel.org, vitaly.wool@konsulko.com, alex@ghiti.fr,
 greentime.hu@sifive.com, 0x7f454c46@gmail.com,
 chenhuang5@huawei.com, linux-kernel@vger.kernel.org,
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH] RISC-V: Always define XIP_FIXUP
Message-ID: <20210428041609.GA44281@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_211616_359289_26BEDF51 
X-CRM114-Status: GOOD (  17.57  )
X-Mailman-Approved-At: Wed, 28 Apr 2021 19:02:33 +0100
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

On Tue, Apr 27, 2021 at 08:34:15PM -0700, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> XIP depends on MMU, but XIP_FIXUP is defined throughout the kernel in
> order to avoid excessive ifdefs.  This just makes sure to always define
> XIP_FIXIP, which will fix MMU=n builds.
> 
> Fixes: 44c922572952 ("RISC-V: enable XIP")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  arch/riscv/include/asm/pgtable.h | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 2f1384e14e31..fd749351f432 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -73,18 +73,6 @@
>  #endif
>  #define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
>  
> -#ifdef CONFIG_XIP_KERNEL
> -#define XIP_OFFSET		SZ_8M
> -#define XIP_FIXUP(addr) ({							\
> -	uintptr_t __a = (uintptr_t)(addr);					\
> -	(__a >= CONFIG_XIP_PHYS_ADDR && __a < CONFIG_XIP_PHYS_ADDR + SZ_16M) ?	\
> -		__a - CONFIG_XIP_PHYS_ADDR + CONFIG_PHYS_RAM_BASE - XIP_OFFSET :\
> -		__a;								\
> -	})
> -#else
> -#define XIP_FIXUP(addr)		(addr)
> -#endif /* CONFIG_XIP_KERNEL */
> -
>  #endif
>  
>  #ifndef __ASSEMBLY__
> @@ -101,6 +89,18 @@
>  #include <asm/pgtable-32.h>
>  #endif /* CONFIG_64BIT */
>  
> +#ifdef CONFIG_XIP_KERNEL
> +#define XIP_OFFSET		SZ_8M
> +#define XIP_FIXUP(addr) ({							\
> +	uintptr_t __a = (uintptr_t)(addr);					\
> +	(__a >= CONFIG_XIP_PHYS_ADDR && __a < CONFIG_XIP_PHYS_ADDR + SZ_16M) ?	\
> +		__a - CONFIG_XIP_PHYS_ADDR + CONFIG_PHYS_RAM_BASE - XIP_OFFSET :\
> +		__a;								\
> +	})
> +#else
> +#define XIP_FIXUP(addr)		(addr)
> +#endif /* CONFIG_XIP_KERNEL */
> +
>  #ifdef CONFIG_MMU
>  /* Number of entries in the page global directory */
>  #define PTRS_PER_PGD    (PAGE_SIZE / sizeof(pgd_t))
> -- 
> 2.31.1.498.g6c1eba8ee3d-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
