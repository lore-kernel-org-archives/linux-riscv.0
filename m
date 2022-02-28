Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474EAC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 12:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Mfe/pQj7WaUM8VWkK+dmaNKBPovMr4vXULB/e55sgk=; b=gXy/lviyWRIDtS
	NqQ+dVi26aw5AaqvgAPNBWeP8nojsfDJQu16npgA+YqcAnpwUorjPG5QXm3iINq8B49lezhRd6MDF
	tt3GBfEI68VkIba8sHV24aLqmHnMaSswfpcjOSo5Z9CSak14tF/k3KTBdXYP+ioCqLNHwUStBeljO
	6DwFWEirK0exwyWMijVBRWUmS6v/eKG6cqchTGIqU0OqtENIwmw+QD97todQvGBRY7mUr++H0O032
	aj7vbehUGvvK92Xi18P5iufdrZ645YxvbeqrHvpfH8uPTbAppX8woa6WIgepbr3O1F8RTGqc2gqMo
	gZcMa4Rbp7+OXBjfP8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOf7o-00CCGZ-M5; Mon, 28 Feb 2022 12:27:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOeZS-00Bzz0-IN; Mon, 28 Feb 2022 11:52:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C482610F4;
 Mon, 28 Feb 2022 11:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB44C36AEC;
 Mon, 28 Feb 2022 11:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646049125;
 bh=12lEy+rZsxAbLHQ5lt0XyIX0neTrZHPLb7NInfEDMcc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kVJjmhgTkwGhssShoeuWGYqbNxv3lHquRsBE9kN49Zlo0a9fLT6teoaONvIEGwd72
 V0W6w+r+PEo6GW3cgb7A59hJAB4XGPekuWNfd29Ms+19nihjIUViOYA7oQCjXTfyea
 0VD/LLXAAPs1NHYsvfuOxVsPJosPSugFuP1g0/HAnaQQ0/SSSXUaMAtb3Khiu9LSEc
 RzZpRw4ILISQgeutLcb1OIcyE0RcL5CXlf0p/on2kOr1qnZR0TVYZ8or3nWzz00GBD
 Zh21adw4G+2LobtDyqYNqwjQrptU6uDxiW8yR58x+O94SSOCm7Tqp5NygDHQ8Pm1cp
 rlnj538An+yCw==
Received: by mail-vs1-f41.google.com with SMTP id e5so12602327vsg.12;
 Mon, 28 Feb 2022 03:52:04 -0800 (PST)
X-Gm-Message-State: AOAM531vWmDTWRClg5dha3qEFCFHvWydpuu9brIjUBDVvvsIxlMOcMS6
 9LdYKcyutz4ByAFclYhR1MSISWeQg28zj61EMo0=
X-Google-Smtp-Source: ABdhPJyyPh+wlne6x5ff7JCJYWjx6kud3nRui6/1lnG2gpd2T7gIweR6o3nUA+PM6jttzlFNCgpAgO9PQ0gdkcBMjWc=
X-Received: by 2002:a05:6102:c4a:b0:31a:54e6:edb1 with SMTP id
 y10-20020a0561020c4a00b0031a54e6edb1mr6626535vss.51.1646049123736; Mon, 28
 Feb 2022 03:52:03 -0800 (PST)
MIME-Version: 1.0
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-4-guoren@kernel.org>
 <b8e765910e274c0fb574ff23f88b881c@AcuMS.aculab.com>
In-Reply-To: <b8e765910e274c0fb574ff23f88b881c@AcuMS.aculab.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 28 Feb 2022 19:51:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRQ0XWSjoEeREtEGr5PPD-rHrBKFY_i6_9uW3eEN_6muQ@mail.gmail.com>
Message-ID: <CAJF2gTRQ0XWSjoEeREtEGr5PPD-rHrBKFY_i6_9uW3eEN_6muQ@mail.gmail.com>
Subject: Re: [PATCH V7 03/20] compat: consolidate the compat_flock{,
 64} definition
To: David Laight <David.Laight@aculab.com>
Cc: "palmer@dabbelt.com" <palmer@dabbelt.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "anup@brainfault.org" <anup@brainfault.org>, 
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
 "liush@allwinnertech.com" <liush@allwinnertech.com>,
 "wefu@redhat.com" <wefu@redhat.com>, 
 "drew@beagleboard.org" <drew@beagleboard.org>, 
 "wangjunqiang@iscas.ac.cn" <wangjunqiang@iscas.ac.cn>,
 "hch@lst.de" <hch@lst.de>, 
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, 
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, 
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "x86@kernel.org" <x86@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_035206_741742_F827B31C 
X-CRM114-Status: GOOD (  23.31  )
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

On Mon, Feb 28, 2022 at 2:40 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: guoren@kernel.org
> > Sent: 27 February 2022 16:28
> >
> > From: Christoph Hellwig <hch@lst.de>
> >
> > Provide a single common definition for the compat_flock and
> > compat_flock64 structures using the same tricks as for the native
> > variants.  Another extra define is added for the packing required on
> > x86.
> ...
> > diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.h
> ...
> >  /*
> > - * IA32 uses 4 byte alignment for 64 bit quantities,
> > - * so we need to pack this structure.
> > + * IA32 uses 4 byte alignment for 64 bit quantities, so we need to pack the
> > + * compat flock64 structure.
> >   */
> ...
> > +#define __ARCH_NEED_COMPAT_FLOCK64_PACKED
> >
> >  struct compat_statfs {
> >       int             f_type;
> > diff --git a/include/linux/compat.h b/include/linux/compat.h
> > index 1c758b0e0359..a0481fe6c5d5 100644
> > --- a/include/linux/compat.h
> > +++ b/include/linux/compat.h
> > @@ -258,6 +258,37 @@ struct compat_rlimit {
> >       compat_ulong_t  rlim_max;
> >  };
> >
> > +#ifdef __ARCH_NEED_COMPAT_FLOCK64_PACKED
> > +#define __ARCH_COMPAT_FLOCK64_PACK   __attribute__((packed))
> > +#else
> > +#define __ARCH_COMPAT_FLOCK64_PACK
> > +#endif
> ...
> > +struct compat_flock64 {
> > +     short           l_type;
> > +     short           l_whence;
> > +     compat_loff_t   l_start;
> > +     compat_loff_t   l_len;
> > +     compat_pid_t    l_pid;
> > +#ifdef __ARCH_COMPAT_FLOCK64_PAD
> > +     __ARCH_COMPAT_FLOCK64_PAD
> > +#endif
> > +} __ARCH_COMPAT_FLOCK64_PACK;
> > +
>
> Provided compat_loff_t are correctly defined with __aligned__(4)
See include/asm-generic/compat.h

typedef s64 compat_loff_t;

Only:
#ifdef CONFIG_COMPAT_FOR_U64_ALIGNMENT
typedef s64 __attribute__((aligned(4))) compat_s64;

So how do you think compat_loff_t could be defined with __aligned__(4)?

> marking the structure packed isn't needed.
> I believe compat_u64 and compat_s64 both have aligned(4).
> It is also wrong, consider:
>
> struct foo {
>         char x;
>         struct compat_flock64 fl64;
> };
>
> There should be 3 bytes of padding after 'x'.
> But you've removed it.
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
