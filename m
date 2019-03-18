Return-Path: <SRS0=/XvO=RV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CD4C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2019 13:16:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8610820850
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2019 13:16:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NMo/MpKF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="IjQ7m1re"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8610820850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWxzFIXOPv7WQu8r7xL8drgsnCZMBtBXPj2XRlmv/6E=; b=NMo/MpKFzx8KID
	16muyGFV0eHLld80Ff1x3vO7MUulMK/TMp60S/KQSOsbgmwT4o0IFM48Xsi20mXJxUy9fW8YAU8+b
	6EsuFkYnHBc+JE7BkXmljynf31Q/4654nK6hLI3QbDqOdHtBP8lDv/5+D37BUgy/tfsifSVJAo9L5
	s49FnomcSXjD349ZJJsdl5PY2vctdmGscH9n9D32VdrbApsJ6fea5dxu3fEXWpN8a8RwLdSxaspmQ
	b30yFsEw3PHxaTqoU6E/nKs9phCnYI0IUefhlbIZT5EMN1LAZViQ4peBh2V7yV0Tq/2E+ndV14XtX
	WAzR3lY4mg6bCJTg3gaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5s84-0001KM-M9; Mon, 18 Mar 2019 13:16:36 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5s80-0001Jt-Vn
 for linux-riscv@lists.infradead.org; Mon, 18 Mar 2019 13:16:35 +0000
Received: by mail-wm1-x341.google.com with SMTP id z11so4467861wmi.0
 for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2019 06:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g64YoHzuEN2SBtL+x9K2khDJvdrcnFpjx98k9Faec1E=;
 b=IjQ7m1re3QhOrFkjpRa8gPCk6ZQg94EHRttEgzMETq750OcSRs860cr7WChXMyjPIm
 1NAN9/3JR9ghnYd19PZOReUrZ0BFjTVfJA9XjJ36v1IfnTlhBN0z4z6STrcXJoIDjSnW
 lKoRkDH6FcFD5MIRRXXIuzNW41mm4+bA/12zDi4OpoF0drDEDvzkaZ57QAmkyO1tEn85
 pFyIY7+O8MvEBRRhlL2J7+GFibduEh5BYVgW7fVHbpXUK10kuYSkBCL9gVvoN+wFwlHp
 xbl1wEIQJXKqicKJDzoF2o3ShaLzX1Tw2hWZdrYGUiU+6UiYC0dz2HEg26bxNIl46Ewg
 mWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g64YoHzuEN2SBtL+x9K2khDJvdrcnFpjx98k9Faec1E=;
 b=XsfCAb3U4p+BGWiDOi+jeJ3eAm3BmOQc1+8KKqyO/Mt+7O8shvQi8rS5e7CC1KJ/3W
 zfERd4DdpwHh0AWaVchpQUsaz5zEI21i6u93qFMHGxGocimFw+XDcFia00/Oig7qbK2L
 dzwarrG/ugVJU9J0FeF2rR+Jvh0ehveHQqKMv8mYSzdOdyTlTov/Guas2QghAhUxkL02
 gAxS0VZpyasqxLjt9cPLdrig7136wsuP5ifUCVcniZdUbYTY7s7aHFxgvBZ8fH+rIuB4
 WicSZlKcf00dwxlvz/sap4SlH6cHKf1JQN7d3Xjr6uxy+3mkM+6E80P1aZrOGWDnnD6P
 q3OQ==
X-Gm-Message-State: APjAAAV0JVlYZJEw9sRkNCcpaw+n19sZXch0UvXbAE8MptV/fu8LEwA1
 msNdSRY91xdiZ0tXuGBSrgfOhoo9jJjNORC1d2y0Xw==
X-Google-Smtp-Source: APXvYqz9IOtdZn8AQZucJSs2Lf809Ve64vuugNQhSWkDtbSyFFTWljhnANppqlNIorTBVKxgO7McMIoogiVRifV4smI=
X-Received: by 2002:a1c:700e:: with SMTP id l14mr10370733wmc.132.1552914989569; 
 Mon, 18 Mar 2019 06:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190312220752.128141-1-anup.patel@wdc.com>
 <20190312220752.128141-4-anup.patel@wdc.com>
 <20190313183121.GB28630@rapoport-lnx>
 <CAAhSdy1mrV2CakS0cfOY8F1B7uH_yXjO3W-CiMUcYonkRnVbeQ@mail.gmail.com>
 <20190314065311.GC24380@rapoport-lnx>
 <CAAhSdy2uEgyvs=5NdoZ3H208qeDGJ9OrTOeaz6HQ+1va+R3dUA@mail.gmail.com>
 <20190315155828.GB920@rapoport-lnx>
 <CAAhSdy0HoTTccyy203Y9m3kdAjCOzjjMdrb670huU71pjOMw4A@mail.gmail.com>
 <CAAhSdy0D6JpySExCG7ziSSDmQ_88=paiMwjjXTTR1gbKCEOs3g@mail.gmail.com>
 <20190318071829.GF21385@rapoport-lnx>
In-Reply-To: <20190318071829.GF21385@rapoport-lnx>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 Mar 2019 18:46:18 +0530
Message-ID: <CAAhSdy20gXURgLqRfN6N74Qfk5d2rNBYSq0ZVwNGSXAYJD6iMg@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: Allow booting kernel from any 4KB aligned
 address
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_061633_079660_88C7D1B4 
X-CRM114-Status: GOOD (  24.89  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 18, 2019 at 12:48 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Sat, Mar 16, 2019 at 04:55:30AM +0530, Anup Patel wrote:
> > On Fri, Mar 15, 2019 at 9:52 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Fri, Mar 15, 2019 at 9:28 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
> > > >
> > > > I still don't get why it is that important to relax alignment of the kernel
> > > > load address. Provided you can use the memory below the kernel, it really
> > > > should not matter.
> > >
> > > Irrespective to constraint on kernel load address, we certainly need
> > > to allow memory below kernel to be usable but that's a separate change.
> > >
> > > Currently, the memory below kernel is ignored by
> > > early_init_dt_add_memory_arch() in
> > > drivers/of/fdt.c
> > >
> >
> > I explored the possibility of re-claiming memory below kernel but then
> > we have an issue in this case.
> >
> > For RISC-V kernel, PAGE_OFFSET is mapped to kernel load address
> > (i.e. load_pa in this code). The va_pa_offset is based on load_pa so linear
> > conversion of VA-to-PA and PA-to-VA won't be possible on the memory
> > below kernel. I guess this is why early_init_dt_add_memory_arch() is
> > marking memory below kernel as reserved. Is there better way to do it??
> >
> > We started exploring ways to re-claim memory below kernel because
> > we are trying to get Linux working on Kendryte K210 board
> > (https://kendryte.com/). This board has dual-core 64bit RISC-V but it
> > only has 8MB RAM.
>
> Huh, 8MB of RAM is tough...
>
> It is possible to use the memory below the kernel, e.g x86-64 does that.
> But it is definitely a separate change and with such RAM diet using 4K
> pages seems unavoidable.
>
> I still have concern about using 4K pages whenever the load address is not
> 2M (4M) aligned. People tend to not pay enough attention to such details
> and they would load the kernel at an arbitrary address and get the
> performance hit.
>
> I think the default should remain as is and the ability to map the kernel
> with 4K pages (and use 4K aligned load address) should be a Kconfig option.

I agree people will tend to not pay attention on the load address alignment
but this is also possible with current approach. Currently, if user boots kernel
form any non-2M aligned address then we don't see any prints at all which
let's users think it to be kernel bug. In fact, I have done same mistake couple
of times.

Another approach (apart from kconfig option) would be to throw big-fat
warning when users boot kernel form 4K aligned load address this way
atleast kernel boots instead of no prints. Your thoughts??

>
> Another thing I'd like to suggest is to completely split swapper_pg_dir
> initialization from setup_vm() and keep this function solely for
> initialization of the trampoline_pg_dir. The trampoline_pg_dir can use
> large pages and the memory below the kernel start can be mapped there
> simply by mapping the entire large page containing the kernel start.
> Then, the swapper_pg_dir setup can run with virtual memory enabled and can
> have much more flexibility.

Sure, this is a good suggestion. I will add this as separate patch in this
series.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
