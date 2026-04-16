Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9337F8A15D
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2026 11:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Z94JaD7CE1isDF3zae0PX1QxWZYY6FC45vpoLo9EaI=; b=IMNgT1mgmGrnIu
	TZSg7X4a5zwgC2TeXgUioRF2rcW/4uJ03FXjNEwU5rNHNmp5NFyx7aBkgzvgVnnuXSdtH1QEziNqY
	oZIO9k/xyj0QwE1zCDVrzspRST2Tr6EL7QJkeROXHopgCtaoLFihQWLAfOx6C4cXy4C8OX2JUj5bW
	PErCjeJKGkFDWYE5NJapnLrmvnfZldWkGB6Ju+jMMI4TzRsu1yi5JgM7/qMASjGHPoWcIkQa747/W
	ol7I3Dldeh0kQLzz2b7xFYpcwq1+WYdCWDoxSMhUE2H+UhSnUi8L3E2z9vYOi62/+oTK24ZgTU3Tn
	NG9uo7MMbJOdLOhFhg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKu0-00000002O4k-30Qv;
	Thu, 16 Apr 2026 11:28:56 +0000
Received: from mail-qv1-f52.google.com ([209.85.219.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKty-00000002O4I-2YgD
	for linux-riscv@lists.infradead.org;
	Thu, 16 Apr 2026 11:28:55 +0000
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8a016799d2cso84678506d6.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Apr 2026 04:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338933; x=1776943733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0N28AiHhMQm9a3ncbvMl4jwXcNZbOrN6OiiJm2DjJOE=;
        b=Q6Hhtf/S6zDN+LfyvLooAWIMtXJ8YxU1VdFdcvB/8cP9IE1I3+GTby6DNz61qM8/Eg
         /LRMxboIoMxmyafavmQ6V1vguL2vDusF2nrFLOrh1smWizF9W1CLqNAnuhpd5YEMR+TW
         duwwmOH4e5u8lfF+z5xjsjHkYo1OM/pQ7PC8pZ3TourkAQ7tPELDq0AXpybi8HvnYI02
         ZwEsdU/xSy8c4xpME/yp9HqYl9Kl/l1e+m0CtlUpFM3mQ3fInNuGQW1gBN505aclPEQM
         5EAA5UtMLL+fUjne2tqS/m/c8DMhWN6qHf4cMY5hs0mtcrF1sNirB2r11PdjNdtsGkST
         9qow==
X-Forwarded-Encrypted: i=1; AFNElJ8C1RMXWXwBHq70Wcl0oAxKtZdUv+Zr4PBgZBSgz6YMm+tTbJBKfMhipqDc9GmXRDIF4cnMG9YEzZZ3hw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yww2OsA8rLgrM064XqHxrrx0gnJBp4ffauWvSLTLx8Orh9TWuCI
	axDRG7PgGZhVqPAH7cpWm97oemukScGw3pOX6XDMr9ya1UQR2L37yjnPSKobCw==
X-Gm-Gg: AeBDiesUpwWni/8t2QA+YtpSnbksLh9rFyVLY9V8N8kzOu2BOlXGvjn4Xz7cbNBNDmR
	HNBOmcJAzg03ShyW2dowFN1181n7/vZBezhch7lxyjpdn0lqNg67/eI0jTJ0fe4jSqI1k/0QOSH
	nUaiqH+GuBG34lvb07rWW/va/7TglqD6EGvfkuRcnQRpzgAvGBQUUmdEwC1xXB/nrXJS2BRmfNq
	LFF/KiCFWTSz9jIPYWMtg2esRkjG+RY9bYGFRL8pRs+xIbkBXuqRWc1uCt0vKDs72nDELMbfhP1
	HwfPuZoleVqtz/+f7IB/ylWLEB1bIg2xW7fRsvm1BGuNQCCumGLOCA1BId+CtmkZGh1hqdVwjKI
	gzefEn8b4p2Sut//YMRZil3RvtgFGPwdZJHbXKhO6IwUPD+P3/OMacn3rfOibu1gXW34s7I17mf
	WpyYnvP5h7yU9E3s/Rm1SeNeJlsIPbcg7N/o8xXgEkEkjmYdkcdcdGxwfT6J08P3SPS4xsZM/OB
	Lo=
X-Received: by 2002:a05:6214:2263:b0:89f:2fa:a9bb with SMTP id 6a1803df08f44-8ac8621eaf0mr426610456d6.9.1776338933263;
        Thu, 16 Apr 2026 04:28:53 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ae6cb9ef57sm34097426d6.29.2026.04.16.04.28.53
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:28:53 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50d58c513dbso56517861cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Apr 2026 04:28:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9m2Yct44PUxRnHI0D8mqf1R2NvPJ3v2xnDFztS2PWd8yt/3zBNr7HsjxeYw4tT1yGvB7FLgut8w177mw==@lists.infradead.org
X-Received: by 2002:a05:6102:3fa2:b0:608:1b6e:f4dc with SMTP id
 ada2fe7eead31-609ff0c50e9mr11028119137.11.1776338540828; Thu, 16 Apr 2026
 04:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.045532623@kernel.org>
In-Reply-To: <20260410120318.045532623@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtR7T62Wf+yDM=J0+96C64qRws=ffX_xXbfzfbS0Xz8g@mail.gmail.com>
X-Gm-Features: AQROBzCyA8BqoTVnHFn7fWQMKVWyMF2wrQlYn44P8f0X0RsdCOwGnnxui8decDA
Message-ID: <CAMuHMdXtR7T62Wf+yDM=J0+96C64qRws=ffX_xXbfzfbS0Xz8g@mail.gmail.com>
Subject: Re: [patch 07/38] treewide: Consolidate cycles_t
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_042854_652425_9A3E6544 
X-CRM114-Status: GOOD (  20.70  )
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

On Fri, 10 Apr 2026 at 14:19, Thomas Gleixner <tglx@kernel.org> wrote:
> Most architectures define cycles_t as unsigned long execpt:
>
>  - x86 requires it to be 64-bit independent of the 32-bit/64-bit build.
>
>  - parisc and mips define it as unsigned int
>
>    parisc has no real reason to do so as there are only a few usage sites
>    which either expand it to a 64-bit value or utilize only the lower
>    32bits.
>
>    mips has no real requirement either.
>
> Move the typedef to types.h and provide a config switch to enforce the
> 64-bit type for x86.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

>  arch/m68k/include/asm/timex.h      |    2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
