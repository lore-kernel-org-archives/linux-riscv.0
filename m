Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C3A6C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 20:19:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6BF623A57
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 20:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6BF623A57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TK5zBMCTRsJe4fdkHHyXYz78UxYF/v5eyO6mDgyW5lw=; b=dM7zj6uOaPInaC8OFntNinxgf
	1Ma1EYSUpEL29SNv9VVgkEOdlI+2vQJom1ODjnwpxJkEkg02TmgRGQt3CP5JU0JvyJjXJB7ZCrY82
	l1cJUu/5lQbWcxyE4z3v1CnnJHJbbtIEZwAyQAva/PnUNBIGgJ9p8VYDRfk0bNfRdsMWvdVmQn4Z1
	yx5tqvABfjXk5oJ7fZwwjVvbn8+rL9HH3nGoNU8iMnzd9aUDWb85o2AbJJKEpPW5qTmnPJ+1ZtwJy
	IDJDqx8NDqZLkT87/vY2rXq2uGz0GPocusfxLM6Z1Wo7+aEq22/f/YO+W92wxNxKVZYrX3KmFN4nO
	Vt8WndDlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0VYr-00077V-4I; Fri, 15 Jan 2021 20:19:09 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0VYp-00076t-GE
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 20:19:08 +0000
Received: by mail-lf1-x135.google.com with SMTP id o13so15024857lfr.3
 for <linux-riscv@lists.infradead.org>; Fri, 15 Jan 2021 12:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/lXuX9PxuZr7jes4v8nsbSed/V3MsPCYQunP39iMdnM=;
 b=FmYu7KPbAA69KmSy9fXY/thRSVm89ZtlB6vNVfgTyH66ccxPJlx4C0kTFfHpJ6X8fZ
 V79j50FUDHC+a272jMFCbxYGqJPf3LwWChtwxczeyg6q4tRrzEnPdObWUWCEmt5WrU9f
 YJLTFShJbYZ1MU6KgKGzdLzpdUDRYT05Amnf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/lXuX9PxuZr7jes4v8nsbSed/V3MsPCYQunP39iMdnM=;
 b=sOTG9U6w6qE4utZ35jk7FEiXaLKnPrgUJVDM/xnt1APS/EKXLK6+R+98qn2PJsg5ay
 NFCsKSncBp2bsI5xDvk10JdcExRbOplTGPNIaGrjT72jXnA9P7ztiRjl1A/yQm0A3m3a
 7UQdmMfb+IDU3fToVoy1/pfsl++bPYDgr3EaiGQmVVY2Gf2ozxri77mZfe36Bc1pvjve
 2NGWPJVbfLY2yf5QQbKA6I/byo57HEkSmlbTa9C0lmkTEUpln/B3R5NzLtmn60H0k8LY
 5pBjHgvRPql2DABAtAcx8Ys3h/dO2gXa6ok6LRFkpSg+ooLkRBup/QGwdgGEDgBrsKnM
 hECA==
X-Gm-Message-State: AOAM532aciUsw9DDItEjfLLOx6Z8S8qknwQpebXV2EdpzAKf1iZH0oxa
 X8pu2HYzwF3Kc20N9W3ML+VqXDJOIAiPwyNrQbZI9Q==
X-Google-Smtp-Source: ABdhPJyzyPY4+IG3BWVpXoEmr6Q4joU2QO5H8aaDRxbnWHHSJyMx5gTRpgFMUhXv6Diy06qPimOGHaoJBiVK8yAnKu4=
X-Received: by 2002:a19:4196:: with SMTP id o144mr6741722lfa.342.1610741945649; 
 Fri, 15 Jan 2021 12:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20210111212031.2422-1-vitaly.wool@konsulko.com>
 <CAAhSdy04Nm+ET3Oepe5zRyVWiWpZzmfe=0BrdOEPUHGEOF86Vw@mail.gmail.com>
 <CAM4kBBKsYxaMe_R=JU=FxWdxS3vsgvpcMY3PCKBW080-9uSOrA@mail.gmail.com>
 <CAAhSdy190iZJsuiMRfPeeFCciG=ag7kn7CbL-Rmzc++QF4QGCw@mail.gmail.com>
In-Reply-To: <CAAhSdy190iZJsuiMRfPeeFCciG=ag7kn7CbL-Rmzc++QF4QGCw@mail.gmail.com>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Fri, 15 Jan 2021 21:18:54 +0100
Message-ID: <CAM4kBBKZrCY=Xpsv6rWiaoi529g6x21Uoyc=USB29s3n02qJ1g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: simplify BUILTIN_DTB processing
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_151907_650830_52A459D8 
X-CRM114-Status: GOOD (  22.56  )
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 15, 2021 at 11:43 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Jan 15, 2021 at 3:18 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> >
> >
> >
> > On Fri, 15 Jan 2021, 10:39 Anup Patel, <anup@brainfault.org> wrote:
> >>
> >> On Tue, Jan 12, 2021 at 2:51 AM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> >> >
> >> > Provide __dtb_start as a parameter to setup_vm() in case
> >> > CONFIG_BUILTIN_DTB is true, so we don't have to duplicate
> >> > BUILTIN_DTB specific processing in MMU-enabled and MMU-disabled
> >> > versions of setup_vm().
> >> >
> >> > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> >> > ---
> >> >  arch/riscv/kernel/head.S | 4 ++++
> >> >  arch/riscv/mm/init.c     | 4 ----
> >> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >> >
> >> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> >> > index 16e9941900c4..f5a9bad86e58 100644
> >> > --- a/arch/riscv/kernel/head.S
> >> > +++ b/arch/riscv/kernel/head.S
> >> > @@ -260,7 +260,11 @@ clear_bss_done:
> >> >
> >> >         /* Initialize page tables and relocate to virtual addresses */
> >> >         la sp, init_thread_union + THREAD_SIZE
> >> > +#ifdef CONFIG_BUILTIN_DTB
> >> > +       la a0, __dtb_start
> >> > +#else
> >> >         mv a0, s1
> >> > +#endif /* CONFIG_BUILTIN_DTB */
> >> >         call setup_vm
> >> >  #ifdef CONFIG_MMU
> >> >         la a0, early_pg_dir
> >> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> >> > index 5b17f8d22f91..45faad7c4291 100644
> >> > --- a/arch/riscv/mm/init.c
> >> > +++ b/arch/riscv/mm/init.c
> >> > @@ -615,11 +615,7 @@ static void __init setup_vm_final(void)
> >> >  #else
> >> >  asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> >> >  {
> >> > -#ifdef CONFIG_BUILTIN_DTB
> >> > -       dtb_early_va = (void *) __dtb_start;
> >> > -#else
> >> >         dtb_early_va = (void *)dtb_pa;
> >> > -#endif
> >> >         dtb_early_pa = dtb_pa;
> >> >  }
> >> >
> >> > --
> >> > 2.20.1
> >> >
> >>
> >> We can avoid the early DTB mapping for MMU-enabled case when
> >> BUILTIN_DTB is enabled (same as previous discussion). Otherwise
> >> looks good to me.
> >
> >
> > Right, but I had already submitted the patch which takes care of that, and you have reviewed it too IIRC :)
>
> Ahh, I assumed this patch is based on latest stable Linux-5.11-rcX.
>
> Either you can create a series with two patches OR you can squash this patch
> into your previous patch.

Fair enough, I'll come up with a new (aggregate) one.

Best regards,
   Vitaly

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
