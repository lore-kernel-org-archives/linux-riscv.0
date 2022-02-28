Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26657C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 12:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGQWBc0US8tm9cvvhBLTx60BXZJrkfAlWJnKIzrTkAo=; b=SpTgR9zuGERT5U
	gcTQttASgeWz2Xbb1ktJ+cX4ltpvesVx3RCv/Io1B71qsIXAFJz6q1jfPAGD1p6NSg67EdZvLsL51
	ika7QPZWSob305AC5HhCL8M+ELCggR8x2Yv56tXI4Fz6VXMuVGufTP1+NpEiqJ97X7oQfVvpeGwGZ
	TZ09CjK3NUlRJrcx0WRUdSfRWYoXXW/90YdCjwsC10vwBFO5P5Nz7vPQeDnt3J0hR06keooX684OA
	heD78NPMWTgTWNUYyPqov7ZswpiC85DMEJCy/c1BcYRNebWei9VIL8cjZhSHK2ry+r2MMLkiNf+W0
	3FJMyBTAIWgVSHtumGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOfJP-00CGxH-Vh; Mon, 28 Feb 2022 12:39:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOeuI-00C6kT-S1; Mon, 28 Feb 2022 12:13:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 75CB46111F;
 Mon, 28 Feb 2022 12:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5C2C340F7;
 Mon, 28 Feb 2022 12:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646050413;
 bh=m+Mr/LSWoSX8OkgGcblK1edJYBHkvQ8ETiM4gpOKC3I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rIMwDp96WEceKeR//qBV3hW3RflLbT7Ri6SkOJyFuYr1Umz7PSvd2tJnyGzsnCuOS
 zkRyMuoLF4OGwgS+f/Wsr1lbvrKVwKD+GgZo0lF48j2T2ja0JkL5vU+2vdoz2hSosg
 6OQVRAqUsoJ0aCkxHUP/njxd/M/ACV6bVFgUaP4nROyg0nDWrG1O6p88Q0nPMOvat3
 zrPnrEukqvielX4IAh9Uetd+2K27NDb3zp1Ca3sodR1USsvoivi8RrwikZlQbMWRVF
 Fsv3mZNjmf5ZYFYlQ1CQ2WNC6HV9skutTKtKfLL6m3wkMUQgl4m9/NbufixetgZfFh
 dohrw6mir2x7g==
Received: by mail-vs1-f42.google.com with SMTP id t22so12709394vsa.4;
 Mon, 28 Feb 2022 04:13:33 -0800 (PST)
X-Gm-Message-State: AOAM53207wBJAZZB+wVSkJtKLemsW3CdohSOHAuTGUYDRNZivZfgkVMj
 ez6pwtHJuy/zSzgNLiOt4R40G18DB6GSveYOG2s=
X-Google-Smtp-Source: ABdhPJyOu5HUo/VjwWn8/fo2A1Ybsum6GvVfDzqE4Hcq0Flfey7YjZaD85t/OqXDAvijqsqOBSTjjzgFI7EmcLKksiE=
X-Received: by 2002:a05:6102:3a12:b0:31e:6646:b3d1 with SMTP id
 b18-20020a0561023a1200b0031e6646b3d1mr4905201vsu.51.1646050412829; Mon, 28
 Feb 2022 04:13:32 -0800 (PST)
MIME-Version: 1.0
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-4-guoren@kernel.org>
 <b8e765910e274c0fb574ff23f88b881c@AcuMS.aculab.com>
 <CAJF2gTRQ0XWSjoEeREtEGr5PPD-rHrBKFY_i6_9uW3eEN_6muQ@mail.gmail.com>
 <e5ee4f6799704bd59b0c580157a05d2d@AcuMS.aculab.com>
In-Reply-To: <e5ee4f6799704bd59b0c580157a05d2d@AcuMS.aculab.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 28 Feb 2022 20:13:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQhFK55z4juC7uHpWmHsEXSOkbMyXeid6KsnhfPRo7wqg@mail.gmail.com>
Message-ID: <CAJF2gTQhFK55z4juC7uHpWmHsEXSOkbMyXeid6KsnhfPRo7wqg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220228_041339_033487_A555B8EB 
X-CRM114-Status: GOOD (  26.48  )
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

On Mon, Feb 28, 2022 at 8:02 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Guo Ren
> > Sent: 28 February 2022 11:52
> >
> > On Mon, Feb 28, 2022 at 2:40 PM David Laight <David.Laight@aculab.com> wrote:
> > >
> > > From: guoren@kernel.org
> > > > Sent: 27 February 2022 16:28
> > > >
> > > > From: Christoph Hellwig <hch@lst.de>
> > > >
> > > > Provide a single common definition for the compat_flock and
> > > > compat_flock64 structures using the same tricks as for the native
> > > > variants.  Another extra define is added for the packing required on
> > > > x86.
> > > ...
> > > > diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.h
> > > ...
> > > >  /*
> > > > - * IA32 uses 4 byte alignment for 64 bit quantities,
> > > > - * so we need to pack this structure.
> > > > + * IA32 uses 4 byte alignment for 64 bit quantities, so we need to pack the
> > > > + * compat flock64 structure.
> > > >   */
> > > ...
> > > > +#define __ARCH_NEED_COMPAT_FLOCK64_PACKED
> > > >
> > > >  struct compat_statfs {
> > > >       int             f_type;
> > > > diff --git a/include/linux/compat.h b/include/linux/compat.h
> > > > index 1c758b0e0359..a0481fe6c5d5 100644
> > > > --- a/include/linux/compat.h
> > > > +++ b/include/linux/compat.h
> > > > @@ -258,6 +258,37 @@ struct compat_rlimit {
> > > >       compat_ulong_t  rlim_max;
> > > >  };
> > > >
> > > > +#ifdef __ARCH_NEED_COMPAT_FLOCK64_PACKED
> > > > +#define __ARCH_COMPAT_FLOCK64_PACK   __attribute__((packed))
> > > > +#else
> > > > +#define __ARCH_COMPAT_FLOCK64_PACK
> > > > +#endif
> > > ...
> > > > +struct compat_flock64 {
> > > > +     short           l_type;
> > > > +     short           l_whence;
> > > > +     compat_loff_t   l_start;
> > > > +     compat_loff_t   l_len;
> > > > +     compat_pid_t    l_pid;
> > > > +#ifdef __ARCH_COMPAT_FLOCK64_PAD
> > > > +     __ARCH_COMPAT_FLOCK64_PAD
> > > > +#endif
> > > > +} __ARCH_COMPAT_FLOCK64_PACK;
> > > > +
> > >
> > > Provided compat_loff_t are correctly defined with __aligned__(4)
> > See include/asm-generic/compat.h
> >
> > typedef s64 compat_loff_t;
> >
> > Only:
> > #ifdef CONFIG_COMPAT_FOR_U64_ALIGNMENT
> > typedef s64 __attribute__((aligned(4))) compat_s64;
> >
> > So how do you think compat_loff_t could be defined with __aligned__(4)?
>
> compat_loff_t should be compat_s64 not s64.
>
> The same should be done for all 64bit 'compat' types.
Changing
typedef s64 compat_loff_t;
to
typedef compat_s64 compat_loff_t;

should be another patch and it affects all architectures, I don't
think we should involve it in this series.

look at kernel/power/user.c:
struct compat_resume_swap_area {
        compat_loff_t offset;
        u32 dev;
} __packed;

I thnk keep "typedef s64 compat_loff_t;" is a sensible choice for
COMPAT support patchset series.

>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
