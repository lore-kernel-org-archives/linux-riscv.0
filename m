Return-Path: <SRS0=CPyr=A5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72127C433E1
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jul 2020 01:06:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A2FD20717
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jul 2020 01:06:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KRlSZ5tu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="DlQrUmEc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A2FD20717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8NFTbpXTkfSPPtiRYUzn9fuKedvgx0mPQXW3aTqKxqQ=; b=KRlSZ5tuhV6mII2SKB+tTYAxS
	VBJu2N9ID3G0MotVCYRemJCNSxjQU0goQl34m/SWPUJ3QncZBaXDnI6q8LBQzAI2JMkpUS245zljz
	+z0Wgo41Yt+w2dYNG0MRp53zWDUXI4Q2eZ1yUFBJ1NzWUCi8hlYmNHx7rYOLnanlR2mc/5Pnp9Jdf
	2OL+JUM6Mdl4KmgFG7mEqpn6S0jITHQJQGcSJ6Fkn5uYMFcZQ3nAd+EFugKamixssCzI38lvcW3xM
	SnD8KZJ2oncRXcqCzMBL7Ke1luZ4XnkfVvKLIFMoTDrs2wAX4QtyiIxMD+ChDZLdolp+OJ2QY6ghC
	+088I1saw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwbIW-0007SU-Uy; Sat, 18 Jul 2020 01:05:52 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwbIT-0007Rf-VU
 for linux-riscv@lists.infradead.org; Sat, 18 Jul 2020 01:05:50 +0000
Received: by mail-wm1-x344.google.com with SMTP id a6so8085412wmm.0
 for <linux-riscv@lists.infradead.org>; Fri, 17 Jul 2020 18:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LE3moRbyBfkEEvwl1ynsLf05iOxnrGFtEat6arjyjJA=;
 b=DlQrUmEcVs+sEzs7LTd6DciH8etJ7IwCujSHeDADxBNWKlerCcMjspn/MdYRgsubVO
 eTUPZ9yUuqQCMtLBhNQ3KgfTfCtnpEDh+rCd+1VBseJoD6abQWrF1PCQ+R7sbSO/cDgu
 sv9WWSlhBIos7DU49J+FTiOuQAgdnZvz8oTW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LE3moRbyBfkEEvwl1ynsLf05iOxnrGFtEat6arjyjJA=;
 b=XCrjbCLMrIfFde5O0Qh9Kp47jTs7yXq49D/lt0DOTMm7FgtQ+x2GOO0+MWhOPHMpsv
 EEFHXF4EJRkDHzm5gKNzHfsjPc6PriCMKCXz2AIb9c+Lqvy5ZR5J4hqOGpUv+Dau2UwL
 JXhdiotyEW9u3HF7vyOpahFg0yoyPN3KQ/7hzdyX7wU33vJvv7YpJlJFTsCVTiqvoZ3R
 OCMhC745VGLqtlljVUdhaoTF3IZsjzQ1/IX+B82x0j0eKAuBGE3oyUE8//Gq5w/vIUSg
 jzotDp9ea0cxnhkKr/eRSkeluBEYjOOPcaF5KFsYNcYJxciXC8tub/NJhjTG98fWRSLf
 lHZw==
X-Gm-Message-State: AOAM533SZHVZ53KBvYCh6GA1tL4os9K5uAYhJuNF0XX23YeA+tdmEvLY
 ZEyGOgXYA7mVbg37tnb0MlkLJJErEY3/PnCHlaQ8
X-Google-Smtp-Source: ABdhPJyW71Q+9gPc4iagfJKsdp8eQ4psR6/HGFDPbhItnh5dgiQ/pXQ+97eEPflcrjAm5dln6WHL8WYRXQVbggtopgg=
X-Received: by 2002:a1c:345:: with SMTP id 66mr11309396wmd.31.1595034344969;
 Fri, 17 Jul 2020 18:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200716234104.29049-1-atish.patra@wdc.com>
 <20200716234104.29049-2-atish.patra@wdc.com>
 <CAK8P3a2EesjQAs-YGrCO=cYfUVWFQ3CbJfVXJx3qZjCS_XW+wA@mail.gmail.com>
In-Reply-To: <CAK8P3a2EesjQAs-YGrCO=cYfUVWFQ3CbJfVXJx3qZjCS_XW+wA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 17 Jul 2020 18:05:34 -0700
Message-ID: <CAOnJCUKF-tfN-fHyRcjyAMnYVzQqp=_CLa2F4TQNO7jA4infoQ@mail.gmail.com>
Subject: Re: [RFT PATCH v3 1/9] RISC-V: Move DT mapping outof fixmap
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_210550_020631_AB30920F 
X-CRM114-Status: GOOD (  22.53  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-efi <linux-efi@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 16, 2020 at 11:32 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Jul 17, 2020 at 1:41 AM Atish Patra <atish.patra@wdc.com> wrote:
> >
> > From: Anup Patel <anup.patel@wdc.com>
> >
> > Currently, RISC-V reserves 1MB of fixmap memory for device tree. However,
> > it maps only single PMD (2MB) space for fixmap which leaves only < 1MB space
> > left for other kernel features such as early ioremap which requires fixmap
> > as well. The fixmap size can be increased by another 2MB but it brings
> > additional complexity and changes the virtual memory layout as well.
> > If we require some additional feature requiring fixmap again, it has to be
> > moved again.
> >
> > Technically, DT doesn't need a fixmap as the memory occupied by the DT is
> > only used during boot. Thus, init memory section can be used for the same
> > purpose as well. This simplifies fixmap implementation.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
>
> The patch seems fine for the moment, but I have one concern for the
> long run:
>
> > +#define DTB_EARLY_SIZE         SZ_1M
> > +static char early_dtb[DTB_EARLY_SIZE] __initdata;
>
> Hardcoding the size in .bss seems slightly problematic both for
> small and for big systems. On machines with very little memory,
> this can lead to running out of free pages before .initdata gets freed,
> and it increases the size of the uncompressed vmlinux file by quite
> a bit.
>
> On some systems, the 1MB limit may get too small. While most dtbs
> would fall into the range between 10KB and 100KB, it can also be
> much larger than that, e.g. when there are DT properties that include
> blobs like device firmware that gets loaded into hardware by a kernel
> driver.
>
I was not aware that we can do such things. Is there a current example of that ?

> Is there anything stopping you from parsing the FDT in its original
> location without the extra copy before it gets unflattened?
>

That's what the original code was doing. A fixmap entry was added to
map the original fdt
location to a virtual so that parse_dtb can be operated on a virtual
address. But we can't map
both FDT & early ioremap within a single PMD region( 2MB ). That's why
we removed the DT
mapping from the fixmap to .bss section. The other alternate option is
to increase the fixmap space to
4MB which seems more fragile.

>        Arnd



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
