Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EA6C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 19:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFmyiofW7ClRbP75qn9xh5VRRbmwAL9KLhvo82wR1oY=; b=COUIWYbOi6OXv0
	yklywLkof+QihZkeFWjoMP3m5SRFhUoXda3iNrduJqDD06nJUv57TbLtAjDC3U8az2rFN6G1ntdDN
	YoYdvDRD18HhzhLulojr/pa5kww68rGMl7s8hDezQZN9hLxPMe95D5KZ9dk6cBBgMcDs80Q5dnAUY
	g0JwwohAH9574AepidVd8ux1AD4nA0xsLVboToBW9GCQcIt5k55L7iUgneQSpHoc1a1Fjvr6D98Lq
	jMPi5D2oPW0B/kzVJTNzBc+NNXh4KRvyKVCB/6+t8pYmLO0J54MxqyMT4/Bq9Y1KWJBOlhC123Wwp
	mBlFebhGwR9VbNWbjw/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neMAU-00Fawr-AV; Tue, 12 Apr 2022 19:27:14 +0000
Received: from mail-qk1-f181.google.com ([209.85.222.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neMAI-00Fatv-Q2; Tue, 12 Apr 2022 19:27:04 +0000
Received: by mail-qk1-f181.google.com with SMTP id b189so14589255qkf.11;
 Tue, 12 Apr 2022 12:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0JEyUctm+WKncuIF5YDm3I/aHHGOlYRWAe57/MVe48=;
 b=GuIkhXcpoJLxFZml6sp/7klQkaPR2u5uigmDwZYbiRi+i5HIyGtngdjvb2Wx30G4qw
 CM74CLbedHd3EHVAEUOPTWafAHGW18iXcc5JQHtqmoPE828EEwCQRlvdV8DvW+77eJgS
 ztlYzKUmbGQ9O2q7tOmUU2xkMbBQFLh/L/uwGojoK9eBVVQFW997qZixDcJEJpcfcyVQ
 6mcd8ikgWf3KZDLTgCMFVXDed6iD1UTlfcld1orZcovFQRV46TE9cfyp9OzU3uqsJ54q
 kkRgy1l7pc2Jkt6w5c4HgrhyuJ/YKTJ3qn7mXXGPl21el6HFzfhy87v+7exE4dhlPBH1
 MB0Q==
X-Gm-Message-State: AOAM533excE/m4AbrXSAQTBD3F89XAwRvPlvIqitGBbOatirlIFxjQid
 +9v/PQxO36p0yFyc1uHm7/lc3Kg5PTEEGBXB
X-Google-Smtp-Source: ABdhPJwzSwt7H0rchT7h9/CXTkwnw6eFLAvA8DHLt1VH6Ac0c38g59awP1EzfZRRIF1UMhEbJPiqVw==
X-Received: by 2002:a05:620a:4721:b0:67d:715d:2cdc with SMTP id
 bs33-20020a05620a472100b0067d715d2cdcmr4371337qkb.134.1649791619552; 
 Tue, 12 Apr 2022 12:26:59 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 d126-20020a37b484000000b0067e60283d08sm21364244qkf.40.2022.04.12.12.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 12:26:59 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id f17so3979949ybj.10;
 Tue, 12 Apr 2022 12:26:59 -0700 (PDT)
X-Received: by 2002:a81:5210:0:b0:2ef:21e3:54dd with SMTP id
 g16-20020a815210000000b002ef21e354ddmr5208597ywb.438.1649791608129; Tue, 12
 Apr 2022 12:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220412172754.149498-1-Jason@zx2c4.com>
 <20220412172754.149498-3-Jason@zx2c4.com>
In-Reply-To: <20220412172754.149498-3-Jason@zx2c4.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Apr 2022 21:26:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXexfkgfrLcUis3DSWJ=SSC-CargHbMvopsjoWrvNacFg@mail.gmail.com>
Message-ID: <CAMuHMdXexfkgfrLcUis3DSWJ=SSC-CargHbMvopsjoWrvNacFg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] m68k: use fallback for random_get_entropy()
 instead of zero
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Arnd Bergmann <arnd@arndb.de>, "Theodore Ts'o" <tytso@mit.edu>, 
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "David S . Miller" <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 sparclinux <sparclinux@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_122702_869154_4728F096 
X-CRM114-Status: GOOD (  22.93  )
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

On Tue, Apr 12, 2022 at 7:29 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> In the event that random_get_entropy() can't access a cycle counter or
> similar, falling back to returning 0 is really not the best we can do.
> Instead, at least calling random_get_entropy_fallback() would be
> preferable, because that always needs to return _something_, even
> falling back to jiffies eventually. It's not as though
> random_get_entropy_fallback() is super high precision or guaranteed to
> be entropic, but basically anything that's not zero all the time is
> better than returning zero all the time.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
