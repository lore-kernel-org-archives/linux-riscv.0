Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC695CCA47A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 22:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=we0Wh9q+AxxDzBBs0AdSV1PjfdO4CAbH0THA1oqwteY=; b=ytd4NhTIC3TEi1ftoZvfO1WzbV
	fGV4+qCmQdBJvmwkZtiuNCES2ojTBbLPehDDGW8fSV2IlxIObcI6UhG6jnNU3QAYEjDsDcnEzq3Eg
	R5ixxaqTTJKiT0SwV8OlMLNJAx7urThlaSR8UnfybNweVcSK9bn0pNzE3yv4YiTVMBERwq1Qs6xj5
	dmmAWKYV5KN2dx5oLpbN4q5N8euqep47szm1tbgjOPzGKRy7Mv92h0Qg2RFDuMcuK8cHLlJlaz5lc
	dBN8Eusjv1XNVTPTeqATS3zFr8h6nl57onU88uU3xynvrNsPJRhre3rRHB50yEdEx4LynH9WUB9u7
	6HvVFVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1xc2-004XTR-0W; Thu, 16 Jun 2022 22:05:14 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1xbj-004XLM-NO
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 22:04:57 +0000
Received: by mail-pl1-x635.google.com with SMTP id o6so2343034plg.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jun 2022 15:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=zGBZJcSZ/U2W2OG+8NJC+fEKRwdCP8ZVUrkCa1GUjJM=;
        b=e0Ru41M0uDOh0SC3RTUpcSh7Nlh3ZyNMHyhCVi3YyHT1OLrQ2v3HzYEEiZEOvuYB5I
         ZbrKrdxNBGXS6dRyfKMA7k6a5KOG+WXZCfH2Zh08Lzp247mnrGd99VNENM+sDeAXfadB
         TRDtkfo8Y+dLVRIWh1e4ywDVaKoos9VZDb7WXOyGSHPxKudONRkBvSDtVDmT2qGCUCkI
         0Wx7XQXBruiKF5X+xfE+n1eEbujxOgHbUL9V2nsRVh1utDdSxu1KSFSCyNS8OuFns2P5
         5KHne5Iy/XNGV9kETMpzEcPy8vjYCYZwJNjQvwJNNpB53Ri2bEdZI2brtRaxXvmP2wYd
         bpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=zGBZJcSZ/U2W2OG+8NJC+fEKRwdCP8ZVUrkCa1GUjJM=;
        b=ANEuhV9VVL3VaZATKj7vPzt6FMvTVSxZYEYUvtFQdr5gsFTLa7Xsa5DknYnY2tYgeQ
         jnqVLmFNIShvuk5qmOwwFQlz2+aNEvepQxHdk7nR3wkWtCuSSEMY8zFPSjiExv0KbgAO
         hxaXniHle/jaAGBzHS3KwnFzqNBgbVmtyfKmPPaz1/fjF2NVxkjUhmGbG2Jbom29cH6F
         NhYsdO99S1n4pQ5/PFpcigl4tgOa8p0d20S1hvzAfpnXjJw8YOTdMjFiwiFFHR0pPc1U
         dy5U8E0VYz7MLqfkZf/Yl96xR77cb27YEpLDNF+XSBWRPKUu68DkI11z8h22UzcVl1gF
         usQQ==
X-Gm-Message-State: AJIora9ruqWq5PrOAwBTfU9zsdnLKtbSX9RtilmmcTQJKyFWWDeAAZ5V
	VSwhQIz2b+BhSEYU8Kp3sR074VOZrQ1dcg==
X-Google-Smtp-Source: AGRyM1sa3Yb7kZOPhKBtePqEmeLvk2njJ75iBb/jB32mvauypDbZYIcJPAXhqydTqgyhfaAqw9R2Aw==
X-Received: by 2002:a17:902:d2ce:b0:167:7637:7025 with SMTP id n14-20020a170902d2ce00b0016776377025mr6278621plc.37.1655417093786;
        Thu, 16 Jun 2022 15:04:53 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id g12-20020a62f94c000000b0050dc762816asm2255514pfm.68.2022.06.16.15.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 15:04:52 -0700 (PDT)
Date: Thu, 16 Jun 2022 15:04:52 -0700 (PDT)
X-Google-Original-Date: Thu, 16 Jun 2022 15:04:46 PDT (-0700)
Subject: Re: [PATCH] riscv: Invalid instruction cache after copy the xol area
In-Reply-To: <20220518081753.29589-1-po-kai.chi@sifive.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, po-kai.chi@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: po-kai.chi@sifive.com
Message-ID: <mhng-296c3110-5e5d-48a4-bd41-1d46bf7987cd@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_150456_035309_9854573F 
X-CRM114-Status: GOOD (  26.75  )
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

On Wed, 18 May 2022 01:17:53 PDT (-0700), po-kai.chi@sifive.com wrote:
> We need to invalid the relevant instruction cache after
> copying the xol area, to ensure the changes takes effect.
>
> Signed-off-by: Po-Kai Chi <po-kai.chi@sifive.com>
> ---
>  arch/riscv/kernel/probes/uprobes.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
> index 7a057b5f0adc..9d52beeac73c 100644
> --- a/arch/riscv/kernel/probes/uprobes.c
> +++ b/arch/riscv/kernel/probes/uprobes.c
> @@ -165,6 +165,7 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
>  	/* Initialize the slot */
>  	void *kaddr = kmap_atomic(page);
>  	void *dst = kaddr + (vaddr & ~PAGE_MASK);
> +	unsigned long addr = (unsigned long)dst;
>
>  	memcpy(dst, src, len);
>
> @@ -177,10 +178,9 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
>  	kunmap_atomic(kaddr);
>
>  	/*
> -	 * We probably need flush_icache_user_page() but it needs vma.
> -	 * This should work on most of architectures by default. If
> -	 * architecture needs to do something different it can define
> -	 * its own version of the function.
> +	 * Flush both I/D cache to ensure instruction modification
> +	 * takes effect.
>  	 */
>  	flush_dcache_page(page);
> +	flush_icache_range(addr, addr + len);
>  }

This brings up a handful of issues:

* This always inserts a 32-bit breakpoint, but that's not quite correct.  
  This should really be checking the _next_ instruction as well to 
  insert a 16-bit breakpoint if it's a 16-bit instruction as otherwise 
  userspace might jump into the middle of the breakpoint.
* These instructions can be concurrently executing, which relies on some 
  instruction fetch ordering that's very lightly specified.  We don't 
  rely on that elsewhere (see stop_machine() in kprobes), but we 
  probably should.  It's probably worth adding something to probe the HW 
  to make sure this is supported.
* Adding the icache flush defeats a uprobes advantage in that we'll now 
  be triggering remote execution (to do the remote fence.i).  One option 
  could be to defer the fence and wait on it, but not sure if that's 
  sane and it'd likely require a lot of 

This also leaves a bit undefined WRT icache aliasing, at least in terms 
of the API used.  IMO it'd be

    diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
    index 9d52beeac73c..c857346864fc 100644
    --- a/arch/riscv/kernel/probes/uprobes.c
    +++ b/arch/riscv/kernel/probes/uprobes.c
    @@ -165,7 +165,6 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
     	/* Initialize the slot */
     	void *kaddr = kmap_atomic(page);
     	void *dst = kaddr + (vaddr & ~PAGE_MASK);
    -	unsigned long addr = (unsigned long)dst;
    
     	memcpy(dst, src, len);
    
    @@ -179,8 +178,10 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
    
     	/*
     	 * Flush both I/D cache to ensure instruction modification
    -	 * takes effect.
    +	 * takes effect.  We don't need to flush the whole icache, but that's
    +	 * all RISC-V defines so rather than worry about aliasing this just
    +	 * flushes everything.
     	 */
     	flush_dcache_page(page);
    -	flush_icache_range(addr, addr + len);
    +	flush_icache_all();
     }

which will end up doing the same thing but avoids the ambiguity.  I went 
ahead and put this at palmer/riscv-uprobe_fencei with that and some 
other minor things fixed up, LMK if that looks OK and I'll take it on 
fixes.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
