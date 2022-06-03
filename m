Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA99C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jun 2022 04:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWnAu9qf74Q7hBIYY6JsVz15iEARzEb/XbCzVCJFwm4=; b=ScxoN7/sTgSozT
	BzguQ0eU5SMxE3jKf5V1uAmPrH0yyHIzBYVaGUaB4CbHt2FJAcd5X9Ye9ojOpo4lwjtwn/9uLghvc
	eZZdx1ng4r7jim9QMnhS7E46jSmQqSb1rijCmgSdXDlXsTvB4EMqbKm5iPaeobB5a/NkToZN+1wBf
	J4jAxY11RJqQ3bgZPtWxGLsA+Orkir7biFxxUfJ0v5FPyFXWfdvd4M0hO8T57iaCcMRXPKsKPtaHa
	QjXVF/hKMQ+HJD6CLWPcR7QcLET8OAXqvhkMFVrxnLslEfi8xAC5IhEk0hdHdL7mrs5MNMApb07Hf
	oJQjPJ7c/GtJyAocTdkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwyzt-005o1w-Fj; Fri, 03 Jun 2022 04:33:17 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwyzr-005o0h-0f
	for linux-riscv@lists.infradead.org; Fri, 03 Jun 2022 04:33:16 +0000
Received: by mail-wr1-x431.google.com with SMTP id i10so107254wrb.10
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jun 2022 21:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vD4OLfKIFfGtPa5y0jFVwdykOdv+Mnr0Uixx1FpZoy0=;
        b=yU/SgzSBAt1nzCv+gtsQNekuiPdjc7en8Za9CNTL+CXMx+z1HaYPZjPlIpqzf5rIlg
         cao9VPP6LfSHgTMgw3UZopSsoOgZQnYAPvnLEPez95+7+vUHCdbZLwoaMqIOfvZN/CNO
         W9qHVGZPGJGLpXImyr0XPjtFB0u0MBd5lBU8/3Trugv5obA4YQxLackcJW8QS5vTrSXs
         24EGlZZmaokB5XPj5tviqqAaOjogoR9AJTfM1FQQ0ewV9gkCw9ysoTgVq9ZOCkLH8DAa
         iGu6a1c0Rbe7onMz5grzmI1C9A5OZaPs5vdn1H84YoLg/yRQNJVUilWrbIj/mDa0vpZB
         0k0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vD4OLfKIFfGtPa5y0jFVwdykOdv+Mnr0Uixx1FpZoy0=;
        b=0rGnSI24olHXMVtp19zVXSBPv0307Zu9zV7hF9Kf9D1HpZz+FFOi5VAwgK6UHYyp1o
         1OgHybUOQ6eT8k6bwdCMwm4KewGbaF/eJLo9Fq7jfBGO+00dpYENGz0eLuvpSBp06kVo
         ONvN9iZ1eS+44+s32fUN/FVlllg8DwOIQzhAOyn+5R2Gd7edrabxzccXlY5p7g/RM+xw
         XnxE+Txor/QQ2S8F3mOqTUIk1LdnL2SF5ry1OxWNJj5T2pZX1aB5Ylfoto0KlvZ+66ng
         YhavKAuvnnCKaHUpZ2hQK4O5atCkBOzw9GaVNJSFD7G3mj5QnKr1/6nFu9K00VGFSs5q
         c8pA==
X-Gm-Message-State: AOAM530JVICMAJxatKTklbudjMlLU5d8B5AuRkhvOt73C6uOMAfcT2GM
	KRblCheD4apufkfM6TBJDRbsUh3ImnH5pgQeN92Chg==
X-Google-Smtp-Source: ABdhPJwt7W+KX4MtCMg6NzWsDLRyzubaw5RShkTBjOfLyk3i7t5J1gsnfZjgOrEkIxeXfFUcKMzwahlSWGkcgBksuGc=
X-Received: by 2002:a05:6000:1f18:b0:20f:e61b:520e with SMTP id
 bv24-20020a0560001f1800b0020fe61b520emr6348325wrb.214.1654230792135; Thu, 02
 Jun 2022 21:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220430191122.8667-6-Julia.Lawall@inria.fr> <mhng-523319d8-fda9-4737-9c43-d54bcfd7a7f2@palmer-ri-x1c9>
In-Reply-To: <mhng-523319d8-fda9-4737-9c43-d54bcfd7a7f2@palmer-ri-x1c9>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Jun 2022 10:03:00 +0530
Message-ID: <CAAhSdy3+imWabbArUAg0Bki3qvD1PGVB-L-xY5CvNa_YBu80aA@mail.gmail.com>
Subject: Re: (RISC-V KVM) Re: [PATCH] RISC-V: fix typos in comments
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, kernel-janitors@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_213315_270556_8BB4B3DE 
X-CRM114-Status: GOOD (  21.23  )
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

On Thu, Jun 2, 2022 at 9:56 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sat, 30 Apr 2022 12:11:20 PDT (-0700), Julia.Lawall@inria.fr wrote:
> > Various spelling mistakes in comments.
> > Detected with the help of Coccinelle.
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> >
> > ---
> >  arch/riscv/kvm/vmid.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> > index 2fa4f7b1813d..4a2178c60b5d 100644
> > --- a/arch/riscv/kvm/vmid.c
> > +++ b/arch/riscv/kvm/vmid.c
> > @@ -92,7 +92,7 @@ void kvm_riscv_stage2_vmid_update(struct kvm_vcpu *vcpu)
> >                * We ran out of VMIDs so we increment vmid_version and
> >                * start assigning VMIDs from 1.
> >                *
> > -              * This also means existing VMIDs assignement to all Guest
> > +              * This also means existing VMIDs assignment to all Guest
> >                * instances is invalid and we have force VMID re-assignement
> >                * for all Guest instances. The Guest instances that were not
> >                * running will automatically pick-up new VMIDs because will
>
> Anup: I'm guessing you didn't see this because it didn't have KVM in the
> subject?
>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> if that helps any, I don't see in anywhere but not sure if I'm just
> missing it.

Thanks Palmer, I had already planned to pick this as a RC fix for 5.19
but I forgot to reply here.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
