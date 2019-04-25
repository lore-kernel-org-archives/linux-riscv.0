Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7D5C43219
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 20:17:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2132F2077C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 20:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p6wfWUrA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YJSdfZ7K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2132F2077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=ZsHKoCML49noguxkc5HbxB5ZQluXYlHWr6L8ZnF6eA8=; b=p6wfWUrAo1LPGUZDZpPPYJm+a
	7yU5KKXSz3RH7sruuV66UqClrln/nAPsWOUX3THk8Bru/CyQ0TTEorjQoVoK5aKKZJFQFgQ7mD9ib
	69LJCcYBD3IZqz+tIZ1+OnfCDhbxO0Nsmr5HAmPDZxTiCgIv3WU1RHp/iYYEUfKQVXm62ewfbI36j
	ncURAG9wHT0rMpdVnP/6ui3LA3W3EHt3mgqb0u9F1DJDYT3pLECtY9l9coPSfqvKOrTNSQZ11Ws98
	8JlSL69F4ZpvDZo3CBpCas+U/olB+MgMMpufdIjdTXJUsqmB7B+H/l007X+duhnL4HO3CVajZ8dAL
	2PU/hHSFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJkoQ-0006vd-Hd; Thu, 25 Apr 2019 20:17:42 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJkoO-0006v5-5g
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 20:17:41 +0000
Received: by mail-pf1-x444.google.com with SMTP id e24so451983pfi.12
 for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2019 13:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=5fkf5yKfz2Ypcm+PBwoO3dAoRYLWoAtz23trESpGGa0=;
 b=YJSdfZ7KObgzWpPiLcJ1+7fQSIsg22kv3cqhiYUZCSpjc4Xpc8Z4yKDa7UfFm9D9kk
 BzeWIv/TIWmq5V9kwbvt5R9psk0uWVm+vlSpZneZhc9QWoyAz0PcCS1hd2019KdBHOSk
 ucVeHDk+O98AhNMR+YOx0Pt3Y30v/gC1qKEVU3dhRzvpVnNTugYV4qq2LjtR/rcRQ349
 ovbq0OmTpLoKm3xM1czjkwrBMoFz3s2KrK0mm3Oyz6RbZ1EudrdToj2HdLoFWHPzOkwm
 JagIkg+VSEwSTO7crj45WZ6l80s4vcnyDfpnpTOcA/8d/C1gdUdGGh3STPrAVHDBFVzM
 6H/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=5fkf5yKfz2Ypcm+PBwoO3dAoRYLWoAtz23trESpGGa0=;
 b=Jq7UXFW2qKDh4WYlwinzxO0CX0kiwBWyqdYSmyQj+91HdXoDwhmeCHcz8cjopTFmV4
 tT9b9PSx+qCF2BDJczIyMwLB4IzKXruo10dHoWIuYS8FGCtP5vjj7SgmOgfn/SA0aEx6
 VPnJvnAz5mExOJdQbODWQg8hwAqJa+ThE2GWVA7Rm9i1V8Vi7TbhgfRFzuV1waJ2enC7
 DRQnS95wzAnWRGSRX5SHGzTUinUnfUa1VsQiTFZkpr+OmQ4Md10AsdckjyVo8U6pXhZQ
 q9vqG1dgxbFXW9uvGBGcqLTWK0kZHg+eE+77HPCWe3GHtINyE5iKravw59A4XEikrGqu
 68+A==
X-Gm-Message-State: APjAAAWKk/6yNOIhn+Dftb+uDoKwew5tt4XJIdemYfjBr8C8hvvGAtea
 yuyXgh9xqCh++srf7EyybWlbNDX4lo4=
X-Google-Smtp-Source: APXvYqyxgxOQakakHtjr/zCjeQs5Vra+7CYxhqgReW+/b2m/YCR5eDf4DmbT/8k6K9/zbwJ1ByjJ3g==
X-Received: by 2002:a63:500f:: with SMTP id e15mr39264150pgb.198.1556223458820; 
 Thu, 25 Apr 2019 13:17:38 -0700 (PDT)
Received: from localhost ([134.134.139.92])
 by smtp.gmail.com with ESMTPSA id a6sm49638589pgd.67.2019.04.25.13.17.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Apr 2019 13:17:37 -0700 (PDT)
Date: Thu, 25 Apr 2019 13:17:37 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Apr 2019 13:13:01 PDT (-0700)
Subject: Re: [1/3] x86: Update DEBUG_TLBFLUSH options description.
In-Reply-To: <20190410224449.10877-2-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: atish.patra@wdc.com
Message-ID: <mhng-4767a1c0-439a-4092-ba98-ec388d714a10@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_131740_235957_56F5E25E 
X-CRM114-Status: GOOD (  17.48  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, anup@brainfault.org,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com, mingo@redhat.com,
 bp@alien8.de, gary@garyguo.net, hpa@zytor.com, linux-riscv@lists.infradead.org,
 tglx@linutronix.de, luc.vanoostenryck@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 10 Apr 2019 15:44:47 PDT (-0700), atish.patra@wdc.com wrote:
> CONFIG_DEBUG_TLBFLUSH was added in 'commit 3df3212f9722 ("x86/tlb: add
> tlb_flushall_shift knob into debugfs")' to support tlb_flushall_shift
> knob. The knob was removed in 'commit e9f4e0a9fe27 ("x86/mm: Rip out
> complicated, out-of-date, buggy TLB flushing")'.  However, the debug
> option was never removed from Kconfig. It was reused in commit
> '9824cf9753ec ("mm: vmstats: tlb flush counters")' but the commit text was
> never updated accordingly.
>
> Update the Kconfig option description as per its current usage.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/x86/Kconfig.debug | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
> index 15d0fbe27872..c1a48d4ffebb 100644
> --- a/arch/x86/Kconfig.debug
> +++ b/arch/x86/Kconfig.debug
> @@ -125,21 +125,12 @@ config DOUBLEFAULT
>  	  hair.
>
>  config DEBUG_TLBFLUSH
> -	bool "Set upper limit of TLB entries to flush one-by-one"
> +	bool "Save tlb flush statstics to vmstat"
>  	depends on DEBUG_KERNEL
>  	---help---
>
> -	X86-only for now.
> -
> -	This option allows the user to tune the amount of TLB entries the
> -	kernel flushes one-by-one instead of doing a full TLB flush. In
> -	certain situations, the former is cheaper. This is controlled by the
> -	tlb_flushall_shift knob under /sys/kernel/debug/x86. If you set it
> -	to -1, the code flushes the whole TLB unconditionally. Otherwise,
> -	for positive values of it, the kernel will use single TLB entry
> -	invalidating instructions according to the following formula:
> -
> -	flush_entries <= active_tlb_entries / 2^tlb_flushall_shift
> +	Add tlbflush statstics to vmstat. It is really helpful understand tlbflush
> +	performance and behavior. It should be enabled only for debugging purpose.
>
>  	If in doubt, say "N".

Reviewed-by: Palmer Dabbelt <palmer@sifivee.com>

I'm not going to take this via my tree, but I'll look into the next two.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
