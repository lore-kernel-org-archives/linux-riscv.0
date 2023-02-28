Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08174C64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnVMaOv9eTtjufMSmvlQdQAIQoPoWoCYfYvKzOJf27s=; b=0n2OZg/CMB8nwt
	4XMrmbSleLCgZWAYsT1MafcYYDit2LQ2FYaUQvFmYC1DqH2opfJ2kUsmzFKt/711eUutwHAZHGcEU
	Lr6z6UTOzUKwAgDK49Jnhcx2ef3Txu+GVU4lCAW4z81FMsoeBuEIpjTWxEThWWMnECAdi5PAp/UDB
	tFulqve1WO4tanxm50mSfDvesDO3tqXNctmX4BBuk6m83HVSNeX6ZS3/bFFRUXNxMEJOgpdDGEwPa
	4SYKEJbVFmRdoqSu4TLgvl/ybnzO4DVXhINhgM5xjM3z4qwDRvNacycLbxdqsSo3GMt352TUr5YCG
	/YFaa2XGw7mbRyOyvTZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX1oQ-00DdWt-Gj; Tue, 28 Feb 2023 15:22:42 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX1oO-00DdUw-6l
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 15:22:41 +0000
Received: by mail-io1-xd2a.google.com with SMTP id 76so4165120iou.9
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 07:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrCu0geLOi4OVGkwEDjMoWqOD6knh9EFuIYJINwxG2Q=;
        b=IGBBoowU11kDoWvFa5UzxduFuKkleISEIsB8g0SLdw3lG87SsG8+PsmkrCrm3TH2pt
         LBN/n5AsWe0dZ2AIgADeF8KWpj+ycPcePDpjwLCg0T63e6K3XjzdEZXIUgV6TE7WUBN1
         AK2CARlsdEe/OX1TbsU78oHzkcJn1RVW+c7oYGgocxiBXOe8c+dQkbo6AMBYWCYSeWRC
         vhMfw47fslKk3wVgBClGFXE6FBNXcORvFJZL+8l11ZidzustABk5nGG0x2gpRfO9RxJD
         PuL/N5Cl9Ya1t3fGA7nJ+DSi9olydAlsnnYP9GKF7V1L+IZjLHdL2hpD/GalkWFZw9V7
         1jRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrCu0geLOi4OVGkwEDjMoWqOD6knh9EFuIYJINwxG2Q=;
        b=qwVTBiGP6K7mf/IAL9iWZu6GHjASx91CKofjHoSzitLzUoNXuDVnRDV7Ove9EP9ctJ
         hDm4cTQkpxh4HLHr7w1tve1viBnT94DHfJgaeApqrBACHxsvvWypVPIlZzHp8nzEck2Q
         5X+ITHfCM2ocV5JyCITxiRuYbaUekvajifE/v+nuILrM7e/zdftOsDVF5atuQJQVvbw2
         VSAVXzp5Rfz4rcvCHaRokLpJYIdV4QGwDTZLUpBuvN88IITXZBzG35hg0BG/VSJpqnBV
         h2BLVx4FFVLaw1C7X72Sy4eZliRDNZn+BaFavCgc+9Em8G7GtT5NaEBBUBX/G5N+nrIv
         XA2g==
X-Gm-Message-State: AO0yUKX1S7WyIiuZHTd6s5rScGFQst+Je5RWV/+1CQyGBo2nEcKedTBc
	sOxFIGhUFcu9JlnOCeW40UI7Xxd0WJY=
X-Google-Smtp-Source: AK7set+LdpBxgFLhGrJy0C3vaLPK+VEhjyTfN5z2xzeOHwePBtyBs6X9Ur4LvLgcB2HwBRmMy6YJhg==
X-Received: by 2002:a05:6602:210b:b0:717:ce6a:188a with SMTP id x11-20020a056602210b00b00717ce6a188amr1936244iox.18.1677597757839;
        Tue, 28 Feb 2023 07:22:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b18-20020a056602001200b0073f0832050bsm3130445ioa.18.2023.02.28.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:22:37 -0800 (PST)
Date: Tue, 28 Feb 2023 07:22:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
	Dinh Nguyen <dinguyen@kernel.org>, openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 08/10] parisc: fix livelock in uaccess
Message-ID: <20230228152236.GA4088022@roeck-us.net>
References: <Y9lz6yk113LmC9SI@ZenIV>
 <Y9l0w4M91DwYLO3N@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9l0w4M91DwYLO3N@ZenIV>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_072240_268531_1FB5D080 
X-CRM114-Status: GOOD (  19.34  )
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

On Tue, Jan 31, 2023 at 08:06:27PM +0000, Al Viro wrote:
> parisc equivalent of 26178ec11ef3 "x86: mm: consolidate VM_FAULT_RETRY handling"
> If e.g. get_user() triggers a page fault and a fatal signal is caught, we might
> end up with handle_mm_fault() returning VM_FAULT_RETRY and not doing anything
> to page tables.  In such case we must *not* return to the faulting insn -
> that would repeat the entire thing without making any progress; what we need
> instead is to treat that as failed (user) memory access.
> 
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  arch/parisc/mm/fault.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
> index 869204e97ec9..bb30ff6a3e19 100644
> --- a/arch/parisc/mm/fault.c
> +++ b/arch/parisc/mm/fault.c
> @@ -308,8 +308,11 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
>  
>  	fault = handle_mm_fault(vma, address, flags, regs);
>  
> -	if (fault_signal_pending(fault, regs))
> +	if (fault_signal_pending(fault, regs)) {
> +		if (!user_mode(regs))
> +			goto no_context;

0-day rightfully complains that this leaves 'msg' uninitialized.

arch/parisc/mm/fault.c:427 do_page_fault() error: uninitialized symbol 'msg'

Guenter

>  		return;
> +	}
>  
>  	/* The fault is fully completed (including releasing mmap lock) */
>  	if (fault & VM_FAULT_COMPLETED)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
