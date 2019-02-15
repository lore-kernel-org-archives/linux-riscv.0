Return-Path: <SRS0=HaOg=QW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62433C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Feb 2019 08:43:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12A102077B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Feb 2019 08:43:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lANtvuNv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="r/G/c1Qj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12A102077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iylOtLESaHBiQhOhn80fn1AgVE978kr+KCKXAeP+BLw=; b=lANtvuNvIrk33D
	Xeaf6JEjw7nErmNebREHumBNRun1jwoztKMAGHIyf3HY3HnVQpEIfrKs3+ubI0CpwrZEAoDR/PVos
	YF7uG127gucjcCjbP5gI/diQkOHZanwME6tdLHX4Yrb4Xg6DIr6dLhJVH8bmwWJNYHmD+TgkdOQNh
	z4CESz9zOyX8ue3qRIr4Ac9frgzR9SvsSQPA4oIaQ8RJzJOTrC1Qabt2flXzQkB4amnFlHv03Uqdo
	xVBsFjys8tA/FGcpoQAGw4LdZKOL/lsDEZyNKOlKn7e159lSuFvyMvAa8EHxQes1id1xgQCpqW2Ax
	32rjr0Iq9ZuwK6uSDyJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guZ5f-0001cB-Nq; Fri, 15 Feb 2019 08:43:23 +0000
Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guZ5d-0001bo-4K
 for linux-riscv@lists.infradead.org; Fri, 15 Feb 2019 08:43:22 +0000
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id x1F8h2fW003945
 for <linux-riscv@lists.infradead.org>; Fri, 15 Feb 2019 17:43:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x1F8h2fW003945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1550220183;
 bh=ipwSqGKOtUHrs33U6yO/OuzKAUWDmn9Er4eFuQ213OY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r/G/c1QjnEcKDOxcndklNUbzkPiWtjsSbxgkEJ5xCNVkeX4P2KgnfHMInSbRR3lm5
 aAqJ3tzTmmbbGnWbuYFqTKyWcNWeneBxGFpbqqXR7+aum1qTdHkM2s4LUZl5oYEjvn
 T1DN9rwPJBquAbBPYuagGLoaWgQ+SKYPoz8jF56yNKMiRUevGmgImo36p6h6C9DS/B
 qa1Ky8H4/1zbvcAb7pDHueVkenmzjKI2gEOS7uzRfxbS7fy4otG9BY+FkkwErRUc68
 md+TwLZuLDcyQw4JKbeozXTSkB8OXaZmDRz6ANlprYiFWFw4eTuffn6VDkVSahW9LB
 0xta5NWD51prA==
X-Nifty-SrcIP: [209.85.221.170]
Received: by mail-vk1-f170.google.com with SMTP id y14so2053023vky.9
 for <linux-riscv@lists.infradead.org>; Fri, 15 Feb 2019 00:43:03 -0800 (PST)
X-Gm-Message-State: AHQUAuaDHJE7RUhpkgebhUE+K8GVMN328Xp/leDJf/beOZO/m1ZDt6NE
 Q/nJMy6sC0CABoxpn7nFYv2gnBNkK2Rwejy5fSU=
X-Google-Smtp-Source: AHgI3IYjWlycwOqTadsN4vWgeiW+eLZwajnwdi0xsiNH8+3caYRm3HAPLl12jEJEPXCeo/0gyPelxImT0q2cWCrC3NU=
X-Received: by 2002:a1f:1ac3:: with SMTP id a186mr4404252vka.34.1550220182039; 
 Fri, 15 Feb 2019 00:43:02 -0800 (PST)
MIME-Version: 1.0
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-9-hch@lst.de>
In-Reply-To: <20190213174005.28785-9-hch@lst.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 15 Feb 2019 17:42:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNASycJG=26WUPwJsMwYPhj26YFhj+NH5jNcMGx3PQ-miTQ@mail.gmail.com>
Message-ID: <CAK7LNASycJG=26WUPwJsMwYPhj26YFhj+NH5jNcMGx3PQ-miTQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] lib: consolidate the GENERIC_BUG symbol
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190215_004321_417582_942F290E 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: linux-xtensa@linux-xtensa.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 14, 2019 at 2:40 AM Christoph Hellwig <hch@lst.de> wrote:
>
> And just let the architectures that want it select the symbol.
> Same for GENERIC_BUG_RELATIVE_POINTERS.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>


This slightly changes the behavior of GENERIC_BUG_RELATIVE_POINTERS
for arm64, riscv, x86.
Previously, GENERIC_BUG_RELATIVE_POINTERS was enabled only when BUG=y.


Having said that, this is not a big deal.
When CONFIG_GENERIC_BUG=n, CONFIG_GENERIC_BUG_RELATIVE_POINTERS
is actually don't care.



If you change this,
could you add some comments in commit description?


> ---

> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index c39dac831f08..913b2ca7ec22 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -85,6 +85,8 @@ config ARM64
>         select FRAME_POINTER
>         select GENERIC_ALLOCATOR
>         select GENERIC_ARCH_TOPOLOGY
> +       select GENERIC_BUG if BUG
> +       select GENERIC_BUG_RELATIVE_POINTERS

Precisely,

          select GENERIC_BUG_RELATIVE_POINTERS if BUG




> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 732614eb3683..c410ed896567 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -19,6 +19,8 @@ config RISCV
>         select ARCH_WANT_FRAME_POINTERS
>         select CLONE_BACKWARDS
>         select COMMON_CLK
> +       select GENERIC_BUG if BUG
> +       select GENERIC_BUG_RELATIVE_POINTERS if 64BIT

Precisely,

          select GENERIC_BUG_RELATIVE_POINTERS if 64BIT && BUG


> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index 15ccdd04814e..2a5c12be633e 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -17,12 +17,6 @@ config ARCH_HAS_ILOG2_U64
>  config GENERIC_HWEIGHT
>         def_bool y
>
> -config GENERIC_BUG
> -       def_bool y if BUG
> -
> -config GENERIC_BUG_RELATIVE_POINTERS
> -       def_bool y
> -


Hmm, s390 enables GENERIC_BUG_RELATIVE_POINTERS
irrespective of BUG...





> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 1bd4f19b6b28..f4cb31174e1b 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -91,6 +91,8 @@ config X86
>         select DCACHE_WORD_ACCESS
>         select EDAC_ATOMIC_SCRUB
>         select EDAC_SUPPORT
> +       select GENERIC_BUG                      if BUG
> +       select GENERIC_BUG_RELATIVE_POINTERS    if X86_64

Precisely,

          select GENERIC_BUG_RELATIVE_POINTERS    if X86_64 && BUG






--
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
