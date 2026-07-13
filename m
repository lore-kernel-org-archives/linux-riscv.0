Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77EFC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 21:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Q57lXPLBr8BFM8bChnaDNiFPXc+ga5DelKnhjFj5FE=; b=hrYAVoHNgQxHN4
	Y8/nhcjUf38rRYLoHfYY9YeoONd+MSnWSP9+GdhiQ/of65Mfzh30aGtUjLmLGeBTeZYNpZGkL9S24
	angf7LPZ/Dlh5NZyUk60STpP2zhcgjiIiXmdcP4rTgI4bljwGdGxNF/5RWYC6TEF76a6LZl2LGW6z
	oD1Y+yMYnhxlOz7U1piRiiNIEfJwRaZ/pTTLqKly/TwWx3HP/Quud7GvHfvZ0cWmFcWgHLPsHx7Fn
	7lpJPb45fCQXBXD2IZu56Ftt/O0WKFLN7PDyjcRLuY3uSKvhrQNUC/fpoNMmXZdYOA243D9ITBYqc
	jb1Vb7wNlndNT4SaIv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjO7b-0000000AR3i-035U;
	Mon, 13 Jul 2026 21:23:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjO7X-0000000AR38-41xT
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 21:23:25 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493f431e317so3043355e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 14:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783977801; x=1784582601; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HxoV5fOrooveUw60/Ip0S/Xhhh8viNbeuiWPNBZqotQ=;
        b=e42PGQKmukKTXxvMRf+Om4/juzUAYqtXl72fJUC4VLdMgH0SZUB5UWAv5yy+YDbkpo
         TiOeFgPrB1CNBWAvKrJz+XMcEq42931IBxM0IB1E89TBP017rT8d2c/0f9RoQBUZ2CK/
         ejJ308D1tXTZ/9ZUIuXK3bgeQeX08puDVBTbT5omHNzHyrlgLIA/xSu7agzN38jefnHB
         dxdAS7DZGfQTWGhzQ6p1wAFBzd1Biad1m4grxIetSnx/77tanbRTimIRKKzroQefZbM7
         41nsIRlEhSx/zgPi16gP0UCp6Bb3pPcax7ftRzdn23Jn/qoyJXb4is3A9xNQaAxl6I3K
         WL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783977801; x=1784582601;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxoV5fOrooveUw60/Ip0S/Xhhh8viNbeuiWPNBZqotQ=;
        b=cjMZxJaELjN4281LR1KahXuHGRR05g9dkzu2zaLoYztdDcMP1BrrqotJI3Zuf8U6Gw
         F83mG+yM3c251zuFmyUq1CxfN7OAvCPtCQaCUBXuKFUhGmYn5T+LXCwOtn5jhX42/fuH
         6Js3CuV1LFpLrnkrSJHGceA4bqn4zysY92Ldu2WeaRIuqF8FR0CaGnojUAwbCH1VxPbM
         g7H56i8fbl5DvBKYAkPeMq0tc02ZhGN1/rXytguTC0vjuJhE83mrEyvoRmIjPNdVuAaO
         IaOcDanylFI+IO8ovtAPam/Fa0+2zphdynHhmXTByfaTmTmHjFD4KUmATHzb13H5lB7S
         imwA==
X-Forwarded-Encrypted: i=1; AHgh+RrwE3Bots71m+QxPaXKrVROLzgOrtQ4TINp50qaj2nVfoPV3Mv4GoPs8KzBSqw1nAkPFBJoqVL/jDzMSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YziuEDwx+i7wcA4Crag04e9Dz/9gbmYnu8q7cTAv6T+Sq/nujMw
	kr1SSDMIkTVuyQd1/5GUTbqDXsNiAnPaPLREQu6zDiwMOkYEqRrBcxQo7dEP0K+x
X-Gm-Gg: AfdE7ckUa3u7EX0pItWiXvz4RBeU3xTRpoJFTp6LQuTMz8MWG5YAFhooFzZAnxw5E/c
	gbnDK/4mNYe57nCr1FsG2x7EyKPm/0koGDWQuI/XebUseQr4MVz+CByuPUYoD8jQ11jWuHF3EuO
	OxVahfKz2iGvoel3y/A10jNSzvYJ4t5/GwgoSPvS6AuPezYOFQS+xeJ18qDbPGRJT0oZaGOvNHC
	Sb5Jhx2KvKkfhMHeoVIBxvUwTJvILGM6YX5asVKb3J40yFWmTMregJ44fcNgvlw8DCKA7pP3m/y
	OrO2PEt8C1DBDvyWn51LRbm2r6iuX/wyPz8uxiq40lBUcEmoyVJW2WpNOdDCOX/IO/nv3i/pU7I
	MSvbcT3HYU+qYUEpLGgF3mtTqMpyBOKTsdKsALt5f3JkGsithVtJ7WUFg3o8kyFVR3zggMF7srj
	fjvY/P6lRbOnRncXNPHO2SftREV3QcRkYUxmEdOIj0uY9CTXR3bg==
X-Received: by 2002:a5d:64ef:0:b0:475:f0d1:eb5a with SMTP id ffacd0b85a97d-47f2dd132e0mr13483336f8f.53.1783977801424;
        Mon, 13 Jul 2026 14:23:21 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c30a9sm2251049f8f.31.2026.07.13.14.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 14:23:21 -0700 (PDT)
Date: Mon, 13 Jul 2026 22:23:20 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Rui Qi" <qirui.001@bytedance.com>
Cc: <palmer@dabbelt.com>, <pjw@kernel.org>, <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andy Chiu" <andybnac@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, "open list:RISC-V
 ARCHITECTURE" <linux-riscv@lists.infradead.org>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Gate FUNCTION_ALIGNMENT_4B on DYNAMIC_FTRACE
Message-ID: <20260713222320.12ad21f3@pumpkin>
In-Reply-To: <20260706130415.463682-1-qirui.001@bytedance.com>
References: <20260706130415.463682-1-qirui.001@bytedance.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_142324_045115_B3366565 
X-CRM114-Status: GOOD (  20.68  )
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

On Mon,  6 Jul 2026 21:04:14 +0800
"Rui Qi" <qirui.001@bytedance.com> wrote:

> The FUNCTION_ALIGNMENT_4B select forces the whole kernel to be built
> with -fmin-function-alignment=4. This alignment is only needed so the
> patchable-function-entry NOPs, which arch/riscv/Makefile emits under
> CONFIG_DYNAMIC_FTRACE, can be patched reliably on RISCV_ISA_C=y builds
> where compressed instructions otherwise allow 2-byte function
> alignment.
> 
> The select is currently gated on HAVE_DYNAMIC_FTRACE, a capability bit
> that is selected whenever the toolchain supports dynamic ftrace, rather
> than on whether tracing is actually enabled. As a result every
> RISCV_ISA_C=y build gets 4-byte function alignment across the entire
> kernel even when function tracing is disabled, needlessly growing the
> kernel image and wasting instruction cache for a feature that is not
> in use.

I'd have thought that 4-byte aligning functions would increase performance.
(cache-line aligning is likely to be best, but that adds a lot more bloat.)

	David

> 
> Gate the select on DYNAMIC_FTRACE instead, matching the condition under
> which arch/riscv/Makefile emits -fpatchable-function-entry, so the
> alignment is only applied when it is actually needed.
> 
> Fixes: c41bf4326c7b ("riscv: ftrace: align patchable functions to 4 Byte boundary")
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 66638fc9ba43..0c00f6aa715a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -158,7 +158,7 @@ config RISCV
>  	select HAVE_DEBUG_KMEMLEAK
>  	select HAVE_DMA_CONTIGUOUS if MMU
>  	select HAVE_DYNAMIC_FTRACE if MMU && (CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
> -	select FUNCTION_ALIGNMENT_4B if HAVE_DYNAMIC_FTRACE && RISCV_ISA_C
> +	select FUNCTION_ALIGNMENT_4B if DYNAMIC_FTRACE && RISCV_ISA_C
>  	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS if HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
>  	select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS if (DYNAMIC_FTRACE_WITH_ARGS && !CFI)
>  	select HAVE_DYNAMIC_FTRACE_WITH_ARGS if HAVE_DYNAMIC_FTRACE


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
