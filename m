Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F33AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 21:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KY4ToIzHYdFvr8SDddk3IvgSjFnB3eQQo3k2HTt4FOA=; b=xnH5nMzEz/aAVJBzz7/9btchqA
	qu2T9Jpf379933QvIz6AFkQ4Hi+uyyoUfqbVAXINP+9DULeeM7BQ7D6MK5VjT9aBO1xO+ySdHBm3n
	IX54+0i+eL2SgMXoPQZU5rC6wogw+AZHZ+sYw5SILmhuDJN0Si8zJNZskD86P1TLYWgAmpAjcfkiH
	yW1JkqWEpzdpUvwb8bgRibCIBAD5MkzhyOlKXVOILhW4yaE75yb8Mo9czWzVKWPV7Ga9CWDln2fQ8
	V7SBOGWF6e+sK8zINr3s3iW2wTHnDZW+5XnC3FSETERBLO+kZWvI0xKX2PiqDoCDJVaZWVR8tka0u
	wMPoKAvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oygLo-002Gcd-BZ; Fri, 25 Nov 2022 21:35:12 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oygLl-002Gb6-50
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 21:35:11 +0000
Received: by mail-pj1-x1030.google.com with SMTP id a1-20020a17090abe0100b00218a7df7789so8685963pjs.5
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 13:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j19IwnC8RkwHj/wJbasgF1K7q6L4NDpWoMvT/gTRM0I=;
        b=HnHwFCtS5HanJQq80MvNg+egi/Zbc3q5eblpduEwSXtJZCG7GY5Waqc+UNxejAypfi
         ptTkkTZaUPyckmHBnUhSk0DfoPfbcWpznIRNnHDxQf4ZZfpX6jsadDmnPOJTCB7t+zcq
         DVz/P7T2RAjka178ljnEOejs7WsHcq5ucxgASTj/RUqPuFNVD2aO31n3HHKqPxwbGXAp
         CgknCT0Le2v8s0JCLW0Luet/88s4rscY7cVVcVzBknBATb2l849sI0mbupuoWL7yOwlm
         pWFrSwYfo7a9YDbSttyAcLi07z9SrvSPi7/qKo3B2n1a2ynTRn19zXzcuuM7dLAdtZSM
         lMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j19IwnC8RkwHj/wJbasgF1K7q6L4NDpWoMvT/gTRM0I=;
        b=D8MmRiACxmlrLWrMQ5RZ8o0Z9ghVA7+K/ZELccDVDFLSA8Ms7NK6YplfnXhSluzMQy
         RH06JpJnwdzBtBArG8wj7RLvLsV7vQZi8+YY/HsqHM7dgWq9gkj+QvHp8WDAiGebaEYz
         pZCMkO2Ro+id427ZV1VQ2ImibTFHmyfBePLdpZw1psxqJY8iii1DIaQwo2XazEdtvWRj
         +wc0NnPXZgOmw+QEftzs0WhgCPb7yEBxHJVxMcXG+DFdam5CrlO5mh7oOY2uERY5VqLt
         +yv1w4ipVxEL4VfGF42MHK1U7Di2OtU3ZTArU3nUvX10789G7xvn+eSFAQH46ZCjOp5g
         ROqg==
X-Gm-Message-State: ANoB5pmoNuZK84I3uJpK+fa/7LbX/Uuoz4A66xmBczECKC23h9EMqXaD
	zo36bBHp0GVyv1p8dMBGJC3Cv5HCIBRu8A==
X-Google-Smtp-Source: AA0mqf5XCPljPOokHY/PUd0jBF87iUDZ4r4IHMTLVevRsZyfqnT+DZaP9DbWc+kjTYPygeNH5RagKQ==
X-Received: by 2002:a17:902:d2c7:b0:189:d3b:61f4 with SMTP id n7-20020a170902d2c700b001890d3b61f4mr20217931plc.169.1669412105998;
        Fri, 25 Nov 2022 13:35:05 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id c200-20020a624ed1000000b00574d8d64560sm504655pfb.175.2022.11.25.13.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 13:35:05 -0800 (PST)
Date: Fri, 25 Nov 2022 13:35:03 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: palmer@dabbelt.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v2] riscv: VMAP_STACK overflow detection thread-safe
Message-ID: <20221125213503.GB2037421@debug.ba.rivosinc.com>
References: <20221124094845.1907443-1-debug@rivosinc.com>
 <Y3+NMjOQW+yA1Kqj@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y3+NMjOQW+yA1Kqj@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_133509_435576_F527D3DE 
X-CRM114-Status: GOOD (  15.82  )
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

On Thu, Nov 24, 2022 at 11:26:42PM +0800, Jisheng Zhang wrote:
>On Thu, Nov 24, 2022 at 01:48:45AM -0800, Deepak Gupta wrote:
>> commit 31da94c25aea ("riscv: add VMAP_STACK overflow detection") added
>> support for CONFIG_VMAP_STACK. If overflow is detected, CPU switches to
>> `shadow_stack` temporarily before switching finally to per-cpu
>> `overflow_stack`.
>>
>> If two CPUs/harts are racing and end up in over flowing kernel stack, one
>> or both will end up corrupting each other state because `shadow_stack` is
>> not per-cpu. This patch optimizes per-cpu overflow stack switch by
>> directly picking per-cpu `overflow_stack` and gets rid of `shadow_stack`.
>>
>> Following are the changes in this patch
>>
>>  - Defines an asm macro to obtain per-cpu symbols in destination
>>    register.
>>  - In entry.S, when overflow is detected, per-cpu overflow stack is
>>    located using per-cpu asm macro. Computing per-cpu symbol requires
>>    a temporary register. x31 is saved away into CSR_SCRATCH
>
>This only works if CSR_SCRATCH doesn't contain any valid reg saving,
>but.. see below.
>
>>    (CSR_SCRATCH is anyways zero since we're in kernel).
>>
>
>To be honest, before [1] I have similar idea to keep the percpu usage,
>however, the solution doesn't work. The key here is that there's
>another VMAP_STACK bug in current riscv implementation: it only checks
>vmap stack overflow when comming from kernelspace, but vmap should
>check when comming from both kernelspace and userspace. So we can't

Why do we need to check if space is available or not when coming from user space.
Kernel stack is fresh and just starting out it's life.

>assume CSR_SCRATCH is always zero and free to use. The only available
>solution is my fix[1] which only makes use of tp. But since[1] modifies
>lots of code, it's not idea to merge it as a fix, so [2] is suggested
>and sent out.
>
>PS: I planed to send a fix for the missing FROM_USERSPACE after the
>race fix is merged.
>
>
>[1]https://lore.kernel.org/linux-riscv/20220925175356.681-1-jszhang@kernel.org/T/#t
>[2]https://lore.kernel.org/linux-riscv/Y347B0x4VUNOd6V7@xhacker/T/#t
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
