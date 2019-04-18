Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E46C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:31:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EC5F21479
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:31:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YftDFMTl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EzI3iDp3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EC5F21479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUeO9nlgqhZiYVyicWHXll1Yajss8YJyG7HXyWWOy80=; b=YftDFMTlzsp5jG
	UrqKQfI+frkvtg+/SeDgwzRZYJwgU76PCX8vr1TIP6/tGYKaK/G9Ppt0VziyoSKkR6xCo4i6dMrvp
	oOR26JW7zki0cJ4CqYeAfhRJEdUfJcgsXqnDYfZSe287pDiyrcnriPWxfgQJJS3lTkF6N1KxKiEgu
	3h1AgAFDzLLPSsVFQpKBNxXAnEgsXnlwk62UiT2Gci9Atywalb4ieq8YqBMY6M04J2hTZwcQJyoY2
	2ZYaJzsM4lNyULrye0zEoNGTsKwwK9uSiiZtKNRUmNupckWzCf6JqjR4/clAWiJVIMATIcsZrKQ6e
	0gAM0Rj2vd/YkQ4OEQ2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGzdr-0002NH-IN; Thu, 18 Apr 2019 05:31:23 +0000
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGzdo-0002Mb-OU
 for linux-riscv@lists.infradead.org; Thu, 18 Apr 2019 05:31:21 +0000
Received: by mail-vk1-xa44.google.com with SMTP id q189so206723vkq.11
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 22:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/TP6sA5sajZCj+xhLCrRc8XOgk3i0sdPUEQY20nxic=;
 b=EzI3iDp3/PwAWlzrGsEJt8pSHXmaq0t/LgPtPVDCMvm+jD1PtYJaid1ZV/xGYcmd5I
 lwY7VI0ze2TcOE31b8X8Debj5ZrSlCq5cQ8C17/vua658wrm2sWXYl5IeWCxo5rmKiWr
 /FetUT2kibkKsifqxGloTOoB5vk3HAZhnG57A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/TP6sA5sajZCj+xhLCrRc8XOgk3i0sdPUEQY20nxic=;
 b=N4sOAeXTdKsQJoeA0oyXEArepoYETLOngE+uZ+ThmNUh4Z/ggDRm+7TfDnbWWYrp9m
 qWTZj1OICJXHfbJSI/sjams/D+FLCblHdrZr+efe2pKf+RJYd0tFa9CRFH3WRjlUU0HS
 ge0ipFukIt6AYIRMEjt2aI/VpmqdSvGM5xQa74NgicYuld/KL7IMrAQbV8EoC3X3+e3X
 6mqsTbINNc5vuyox+GSFRLNK7FHGtGJrrOgT6cAyY9n8skxBkbava2PpzoV/80CxoiMe
 StdbPLP/AeZlaSSj7innrr715g0VNugCi4RKP5OHHTckKkcNVQLirkgPn3wFQRp3ELIF
 SCGw==
X-Gm-Message-State: APjAAAXfZZw9HWsbKNNea6fdJbrEcfTjwPAMARkInBXDfZ/vFn39AeOh
 +qxSZKlSLUQN2b+8Kczg8cvZ8K3FiVA=
X-Google-Smtp-Source: APXvYqyHrKJIxkhmTqJdOoqm0TD7YS1JbcX5MVbnGIHNfBHbav6x3qWGq6X6NB/NMjAkTaIyCzpzcQ==
X-Received: by 2002:a1f:acd1:: with SMTP id v200mr48284331vke.7.1555565479673; 
 Wed, 17 Apr 2019 22:31:19 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47])
 by smtp.gmail.com with ESMTPSA id w79sm310201vkw.51.2019.04.17.22.31.18
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 22:31:19 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id e2so488921vsc.13
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 22:31:18 -0700 (PDT)
X-Received: by 2002:a67:bc13:: with SMTP id t19mr2611825vsn.222.1555565478030; 
 Wed, 17 Apr 2019 22:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-10-alex@ghiti.fr>
In-Reply-To: <20190417052247.17809-10-alex@ghiti.fr>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 18 Apr 2019 00:31:06 -0500
X-Gmail-Original-Message-ID: <CAGXu5jKx_A8GsFWWABKwEXmL5dTMKjk3Ub9GoE7Do9NcZ_ai=A@mail.gmail.com>
Message-ID: <CAGXu5jKx_A8GsFWWABKwEXmL5dTMKjk3Ub9GoE7Do9NcZ_ai=A@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] mips: Use STACK_TOP when computing mmap base
 address
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_223120_795724_25AF8EC7 
X-CRM114-Status: GOOD (  15.31  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Burton <paul.burton@mips.com>,
 linux-riscv@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 James Hogan <jhogan@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 17, 2019 at 12:32 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> mmap base address must be computed wrt stack top address, using TASK_SIZE
> is wrong since STACK_TOP and TASK_SIZE are not equivalent.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  arch/mips/mm/mmap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
> index 3ff82c6f7e24..ffbe69f3a7d9 100644
> --- a/arch/mips/mm/mmap.c
> +++ b/arch/mips/mm/mmap.c
> @@ -22,7 +22,7 @@ EXPORT_SYMBOL(shm_align_mask);
>
>  /* gap between mmap and stack */
>  #define MIN_GAP                (128*1024*1024UL)
> -#define MAX_GAP                ((TASK_SIZE)/6*5)
> +#define MAX_GAP                ((STACK_TOP)/6*5)
>  #define STACK_RND_MASK (0x7ff >> (PAGE_SHIFT - 12))
>
>  static int mmap_is_legacy(struct rlimit *rlim_stack)
> @@ -54,7 +54,7 @@ static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
>         else if (gap > MAX_GAP)
>                 gap = MAX_GAP;
>
> -       return PAGE_ALIGN(TASK_SIZE - gap - rnd);
> +       return PAGE_ALIGN(STACK_TOP - gap - rnd);
>  }
>
>  #define COLOUR_ALIGN(addr, pgoff)                              \
> --
> 2.20.1
>


-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
