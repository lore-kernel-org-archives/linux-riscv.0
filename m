Return-Path: <SRS0=/4kn=D3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1916EC433E7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2020 01:23:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5701822244
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2020 01:23:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0Gskj1sb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XT9cVlUl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5701822244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wQYMIr24WxyJbTt8m3v0CIqi6zvwUHmPS7cdjCEB0IQ=; b=0Gskj1sb+kJiH3W3B2l5NFkiD
	6EkHusWtEEXQ9Icy/m2Bi+dK1UzM0bTlMmcgXMMuvT7fwCdnT9/eL8Q6YZLl735E7sWvSTG9M6cpB
	5g9vm/hj/n+aNJGpO0IxiXTJLMQL0IszKxSwM7PLDq8nsWm6rNMSVZKvVtdx98+BnWwC70vH32slT
	itblPik1P6E7WoTb9JKMnOlXxu8C+3VLWH4GnUmvPKmArIOL97VduYG3l+dk9K8bb5DjnytYipHYU
	DQGUDkzljHz50F+YvubSqc0wZBli72STAeUnch/QHIiftaydyxbuquiqIyvZE2yxuTRehForCtrrN
	x/oAYcI/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUgNJ-0007fY-0h; Tue, 20 Oct 2020 01:23:41 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUgNG-0007ex-3J
 for linux-riscv@lists.infradead.org; Tue, 20 Oct 2020 01:23:39 +0000
Received: by mail-lf1-x144.google.com with SMTP id r127so2326665lff.12
 for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2020 18:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=th+0/xxF/HYzACvmXr4ANHX6lzaHPNa8gNsU1Dv2cks=;
 b=XT9cVlUl5V/Jok3V7qXUik9lPh6fCuMWC/y1Ah87IFWy21nO8EzPWi/CZfy2FCENiE
 xsZJrGyN+6SxhgfBcNUctdGLOanQ1LzV0Ryh2zh09jZGWcbLDlpdmjKES+QJHUT7fXpQ
 rkt8GsElNUbHRpX3TW6+b6HKBO0cjwvw70sJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=th+0/xxF/HYzACvmXr4ANHX6lzaHPNa8gNsU1Dv2cks=;
 b=brqY/Aq18iAg+FTxGN9wvc586pzh70eyjf8ZXXIpiudZwSE9Tid9Rd5JXdC5HT60yY
 424pe+/wxpruEKmj/DjXtriOSvW6WYTLq8u5jwizhd1lrVeLhlsE6VEx0WS4u0ElrGkW
 afbjSMuZ7aXVikEHP2VBrCD4hQpxM6zlfB5Ea2Q3Dqy49o+iMSKQuN5CAGlebH1933Y0
 QglblPz6HU844LomULiy0PWZkkperU0Owjv5qQdiXLVgWT73nZOd91h5WCx3cGDr8Iin
 kzmdTlKlofAr62v2UfWA8WJMZM5TRN1z82t3jChB8N6eKwNoZl9t6A2abMS+cGxUXRwE
 M1eA==
X-Gm-Message-State: AOAM532fVRQG0lDdL1DiUfcFkf5BdtzclEMYms/MCcjKwmqvD0hHnwgC
 P1gvoHbpGAetHHrRTZg7mZ+SZ1Pq5zl3Qw==
X-Google-Smtp-Source: ABdhPJxr4R3K4dT/zbv1WWQdIxWQPHgFtmQxrpHVFQUaSzo3SA24yf+HyoX/ENNMp2rh5irK5Gb+BQ==
X-Received: by 2002:a19:f102:: with SMTP id p2mr110513lfh.280.1603157013932;
 Mon, 19 Oct 2020 18:23:33 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id u9sm74867ljj.115.2020.10.19.18.23.32
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 18:23:32 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 184so2376654lfd.6
 for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2020 18:23:32 -0700 (PDT)
X-Received: by 2002:ac2:5f48:: with SMTP id 8mr119497lfz.344.1603157012012;
 Mon, 19 Oct 2020 18:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-a46615be-f4b5-4861-81b2-f370964a9583@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-a46615be-f4b5-4861-81b2-f370964a9583@palmerdabbelt-glaptop1>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 19 Oct 2020 18:23:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiFoT7wKiGDui4zt1xCcXq14KovYzoZd_3iujy2ksr1Jg@mail.gmail.com>
Message-ID: <CAHk-=wiFoT7wKiGDui4zt1xCcXq14KovYzoZd_3iujy2ksr1Jg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 5.10 Merge Window, Part 1
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_212338_150246_F9C84B33 
X-CRM114-Status: GOOD (  14.21  )
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
Cc: linux-riscv@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 19, 2020 at 12:08 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> There is one merge conflict, which is between my fixes and for-next branches:
>
>     diff --cc arch/riscv/kernel/vmlinux.lds.S
>     index 67db80e12d1f,9795359cb9da..ffaa3da375c2
>     --- a/arch/riscv/kernel/vmlinux.lds.S
>     +++ b/arch/riscv/kernel/vmlinux.lds.S
>     @@@ -66,8 -71,11 +70,13 @@@ SECTION
>                     _etext = .;
>             }
>
>      +      INIT_DATA_SECTION(16)
>      +
>     + #ifdef CONFIG_EFI
>     +       . = ALIGN(PECOFF_SECTION_ALIGNMENT);
>     +       __pecoff_text_end = .;
>     + #endif
>     +
>             /* Start of data section */
>             _sdata = .;
>             RO_DATA(SECTION_ALIGN)

Hmm.

I put the INIT_DATA_SECTION after the __pecoff_text_end symbol. I
don't think INIT_DATA_SECTION should be considered text

I suspect it doesn't matter, but if there is some odd dependency that
I missed, this is a heads-up that my resolution doesn't look exactly
like the above.

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
