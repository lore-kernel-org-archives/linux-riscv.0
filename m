Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35873CD128A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 07:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDcHH+ATa8A5v3ryBY86O9/ADW/wfINRlASk+U7EwKM=; b=TUIurpOG4F2HQu
	Cr+UI0p3VD468EewuTq1hSnSdlbeWinJAwTLyXeSLD8oxK6YdX2WwETMIEmQAMZhys+qaZ4kjNKe7
	JEfc/r0mxSZtNoQfOfKvF+AFUUiR3+AMBPSrFbY7E7QwhToiKKQqchx8pEzGO/EtmN6pkmWbxLDw8
	PGJJ2drsFt1KpjYI02X29hfPF+ddxcOaZOz6RphhnJXpoTtXcHYIg0nsIEA/71QVAZb0qfBPtl2Y1
	5HM312mAbiDrtOAVcrpZljwQUZVyFgtvVWPgE0/JV6AqxGvtY9F+DQMYf5VwKBF25Dwuvsnj0DTYw
	LBhFWHnGbRpmryYC7xmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruofC-0000000AnNA-4Bbw;
	Thu, 11 Apr 2024 07:16:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruof8-0000000AnKT-0Gea;
	Thu, 11 Apr 2024 07:15:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB73D61FBA;
	Thu, 11 Apr 2024 07:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F893C433C7;
	Thu, 11 Apr 2024 07:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712819756;
	bh=EGxUFWIY3FhDr3OERYjKXmTSAvHQ47fM+usiXa4A2Co=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PoTjX5JUmRzsaa0P9y56kJydskXtPGFPN262bWdaHgDQod2o3roC0PZCNerABsCwG
	 bfYoknQIk2nufau511D9CeAz99/c+XBDYy9O7yS9Z1jFNFtUA7xvKQxJ/mBKdpOcAQ
	 8oBKA5LroCCkdcvSrmvcnHz8S4wEMgGzlbJBgQOBAwfoqFEvq51qHBY4tBRmieeKdp
	 K1V/z2yZw+dZ7cxWukX9RlSxbg26oONq6miKxZS20ViA44IL5h1YPGHEH4QM1NDmps
	 q4uBHpt3fB7RefgLPmbmEkh8QFaXUgnwKcsoM6Ruke9SxJbcWtDtjMPnbo5XIn7C6E
	 5gAsmHwkNvlMw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d6c9678cbdso97063141fa.2;
        Thu, 11 Apr 2024 00:15:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9CLP5qXvDbJk3GPutZQdmWcAgVn7DMUaJmLMhFvbtbe17j5Vfzh8bMsWEdBPMxl2BT+2ZbmbC1bviRSnURqbcJ4V2aYm/IfhFGfd67YeXZZtrZcxRaziWyWVfOwdx6oYb8VwrDRlBOi0wwinuxb6nKUe3CA4=
X-Gm-Message-State: AOJu0YzA/zgfH5mPkuGqQxyQBni/+oKHB+c5u+6Tr52P+T1DciWQJb6G
	TdC+dYzZCFNl9Dlmb0dPXlaxR/5vfqBUbJ5EmjRyNkrU8QOB8PPr1vK569OE1y8Jvg+J/koj4tZ
	DQeTSy8voN0xKfxTGPNCTp05PsrA=
X-Google-Smtp-Source: AGHT+IEIbzlNGUw7dH6rrBUAPRiam7orrjfOi6n1jf8KoAxJeALyXjve8wFV4wHUyAY7FtZhkFPztybk10CRfm7afS8=
X-Received: by 2002:a05:651c:211e:b0:2d8:d8b5:73d4 with SMTP id
 a30-20020a05651c211e00b002d8d8b573d4mr2830394ljq.4.1712819754902; Thu, 11 Apr
 2024 00:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com> <87wmp4oo3y.fsf@linaro.org>
 <75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com> <87wmp4ogoe.fsf@linaro.org> <4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com>
In-Reply-To: <4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 11 Apr 2024 09:15:43 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGW5XQxXrYaPhT6sCjH7s0EwqzNjWies3b8UWnUBW5Ngw@mail.gmail.com>
Message-ID: <CAMj1kXGW5XQxXrYaPhT6sCjH7s0EwqzNjWies3b8UWnUBW5Ngw@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Samuel Holland <samuel.holland@sifive.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Thiago Jung Bauermann <thiago.bauermann@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, amd-gfx@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_001558_214481_7C78F736 
X-CRM114-Status: GOOD (  24.22  )
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

(cc Arnd)

On Thu, 11 Apr 2024 at 03:11, Samuel Holland <samuel.holland@sifive.com> wrote:
>
> Hi Thiago,
>
> On 2024-04-10 8:02 PM, Thiago Jung Bauermann wrote:
> > Samuel Holland <samuel.holland@sifive.com> writes:
> >> On 2024-04-10 5:21 PM, Thiago Jung Bauermann wrote:
> >>>
> >>> Unfortunately this patch causes build failures on arm with allyesconfig
> >>> and allmodconfig. Tested with next-20240410.
> >
> > <snip>
> >
> >> In both cases, the issue is that the toolchain requires runtime support to
> >> convert between `unsigned long long` and `double`, even when hardware FP is
> >> enabled. There was some past discussion about GCC inlining some of these
> >> conversions[1], but that did not get implemented.
> >
> > Thank you for the explanation and the bugzilla reference. I added a
> > comment there mentioning that the problem came up again with this patch
> > series.
> >
> >> The short-term fix would be to drop the `select ARCH_HAS_KERNEL_FPU_SUPPORT` for
> >> 32-bit arm until we can provide these runtime library functions.
> >
> > Does this mean that patch 2 in this series:
> >
> > [PATCH v4 02/15] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
> >
> > will be dropped?
>
> No, because later patches in the series (3, 6) depend on the definition of
> CC_FLAGS_FPU from that patch. I will need to send a fixup patch unless I can
> find a GPL-2 compatible implementation of the runtime library functions.
>

Is there really a point to doing that? Do 32-bit ARM systems even have
enough address space to the map the BARs of the AMD GPUs that need
this support?

Given that this was not enabled before, I don't think the upshot of
this series should be that we enable support for something on 32-bit
ARM that may cause headaches down the road without any benefit.

So I'd prefer a fixup patch that opts ARM out of this over adding
support code for 64-bit conversions.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
