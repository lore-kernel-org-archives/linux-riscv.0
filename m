Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8B9C2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 19:01:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E9D124181
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 19:01:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HW+R3U6s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="chs8hXLc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E9D124181
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UkU592EIBBkDmBveWEaZQAzRChEX5uejrXrjrDsWq0k=; b=HW+R3U6s1hbxdGXiqvLlaoZMK
	tJe8gOO7VtyAn96iLjiK5YYUjnwIW2Cm7vftV7ZqznrTexZc+K3c61HGSMSezvBvZ5TgadJbL8GA8
	nk21lGmSiseaBq/TRaGMGtTlcuJLpgOuv8DNTgSXH020Q9XKbicYyQlCB65umXXfQnxTPIjlu7UEr
	gFMj1X/LrQlOI/SJB9OU1s5G3m3CbXbFUlnwA2S5jjPvAIm2NJBfCJCJWHNSPr2/WvOn9Bc5YDVTu
	ZZdMnVLBtAFsI0a6ymvIIh+42k764xwDeaYTXfBy/X6Zy6cjPrc73NcIlVqzzOpY/+B8WiTyKcAI0
	is7E2Bl4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf6E2-0006QN-Oh; Tue, 17 Nov 2020 19:01:10 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf6Dz-0006P6-BB
 for linux-riscv@lists.infradead.org; Tue, 17 Nov 2020 19:01:09 +0000
Received: by mail-pj1-x1044.google.com with SMTP id f12so967629pjp.4
 for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2020 11:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JYseXDP4i2Hhs9DKh0McOND6mIxwYGtf78PBSIeQhlo=;
 b=chs8hXLcwd8v9y7yYPXw8+lpeD8ILMsYdq9M/QbiFunuKosgKrQiGFGhM/sdSNogEy
 y5FfPEAmg+uQyaYiJjNGok+rMJ+0yycAVzRmf/9oduyoN8qTx/xfR7C2clvGuZlvrSWm
 h6uHL4U70EPBHKI/1HFJ4P1SlY8UG/T8TjZodhVXNlUmiiElibOjwtnIlTngdpxF44l4
 cCw9lczormZiwbDCu10NzFeEWNVXO6tTqdAGXJXhLoRCNJrtFD5N7lxotBuqMMngIfLn
 LSexRkOzUEp0CuuC6tJX50yWmoeveA7MmM9ViI5QqXT9mS5bDX1jjDVGsQ0Z29y3/aVj
 2q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JYseXDP4i2Hhs9DKh0McOND6mIxwYGtf78PBSIeQhlo=;
 b=oOmoge4QC8q+Zs5qZDbecsbWQ7OIeF2pItg/ZX5Kt0yNTA9bOzEajIaKtpKSM4pyP+
 NVzCJTehM+QI2X41fTI0kiCtL6uZ7MSJtzomRYvOe2V0CyWQZ3nZ9TUJbPnXbEbLfY/9
 nBfarciH379C5Cr5gAOAJHhIUya6bgDkLjgZ7O52p5rclnDT2eWanrQMYYeyyKphI8tD
 eIc+Wbe7Mub0D09wMUVhblrahLjLJj3DBA5SrDiTIpFb8dqJtsgKSv8i+NAXpAZvs68V
 WBmIhqlJKNXJYFKFcPg/xksRhdNeCKx1bOjNoKjXvAA9LDD0IolPwyV23L3NVFzwdusr
 LayA==
X-Gm-Message-State: AOAM5328NOFKRNEzkIvC8zbvLoifbroOWEUsedE432uaXPVe/Uj78k5f
 5ZRjUALD8JWFI8/CmIDWnnnidtFe5aX7ZWNxQNTBxA==
X-Google-Smtp-Source: ABdhPJzOldRgN7SwijtAG+tyo1d3bxVSfLlQ9ioQKrAyDUF3ZWvrGjttGmCw3KlHNpWoKDPJBLlEPsGTDtV8hBGihh0=
X-Received: by 2002:a17:90a:d250:: with SMTP id
 o16mr449165pjw.25.1605639664820; 
 Tue, 17 Nov 2020 11:01:04 -0800 (PST)
MIME-Version: 1.0
References: <20201117013951.7827-1-rdunlap@infradead.org>
In-Reply-To: <20201117013951.7827-1-rdunlap@infradead.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 17 Nov 2020 11:00:54 -0800
Message-ID: <CAKwvOdmESwnF14TLjRfzJg8Dau8XW0LgoDvXtdPjPOqdf211SQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: fix barrier() use in <vdso/processor.h>
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_140107_418520_57B150E2 
X-CRM114-Status: GOOD (  20.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Albert Ou <aou@eecs.berkeley.edu>,
 LKML <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 5:40 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> riscv's <vdso/processor.h> uses barrier() so it should
> #include <asm/barrier.h> to prevent build errors.
>
> Fixes this build error:
>   CC [M]  drivers/net/ethernet/emulex/benet/be_main.o
> In file included from ./include/vdso/processor.h:10,
>                  from ./arch/riscv/include/asm/processor.h:11,
>                  from ./include/linux/prefetch.h:15,
>                  from drivers/net/ethernet/emulex/benet/be_main.c:14:
> ./arch/riscv/include/asm/vdso/processor.h: In function 'cpu_relax':
> ./arch/riscv/include/asm/vdso/processor.h:14:2: error: implicit declaration of function 'barrier' [-Werror=implicit-function-declaration]
>    14 |  barrier();
>
> This happens with a total of 5 networking drivers -- they all use
> <linux/prefetch.h>.
>
> rv64 allmodconfig now builds cleanly after this patch.
>
> Fixes fallout from:
> 815f0ddb346c ("include/linux/compiler*.h: make compiler-*.h mutually exclusive")
>
> Fixes: ad5d1122b82f ("riscv: use vDSO common flow to reduce the latency of the time-related functions")

Hi Randy,
Thanks for the patch, it looks good to me.  I only had a question on
the commit message.

Is this also related to:
commit 3347acc6fcd4 ("compiler.h: fix barrier_data() on clang")

I plan to backport 3347acc6fcd4, so it would be good if all of the
follow ups are all tagged accordingly with fixes tags, so that I don't
break anything backporting 3347acc6fcd4 because I forgot or missed any
follow ups that also needed to be backported.

> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Arvind Sankar <nivedita@alum.mit.edu>
> Cc: linux-riscv@lists.infradead.org
> Cc: clang-built-linux@googlegroups.com
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> ---
>  arch/riscv/include/asm/vdso/processor.h |    2 ++
>  1 file changed, 2 insertions(+)
>
> --- lnx-510-rc4.orig/arch/riscv/include/asm/vdso/processor.h
> +++ lnx-510-rc4/arch/riscv/include/asm/vdso/processor.h
> @@ -4,6 +4,8 @@
>
>  #ifndef __ASSEMBLY__
>
> +#include <asm/barrier.h>
> +
>  static inline void cpu_relax(void)
>  {
>  #ifdef __riscv_muldiv



-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
