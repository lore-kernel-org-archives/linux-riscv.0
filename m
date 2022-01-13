Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3BFC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jan 2022 10:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0alaX60BqC/rXib9RdYIV5Ouru3+oHKKXWaxOfECzZE=; b=WcCSBJL0lLvwnP
	IDJunaUA8SyxRaOH/nHAOuP4J50qGPeZF6Bwddww1Fwn/9HSh8NWywJaAWKvBERjMI1tq8szjwivz
	yYJacnmLozZsahqUVtpk/yDh1qP8N+6Nfz+Wy1ZLKeEoFGxAjwQofh6BEcu1x9YZzZYszTGVoQVP5
	gTsOdgrLkFU9FmNDKNJ6p59dHqVO6HokzAImMWN6PRnOeXfUDWtUAxSsGjMpp1guxuaTzwkEVn1BF
	1wyqw74qe/PrZJ5cFvTZqlxUFEHkEIOC7Mv3YSbYrLnA5THeaqbh37h1uiqNdjcG1ZActVApiQtjE
	Xquvb5/XLC6bqNEo6Zxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7wv9-005LTI-Ky; Thu, 13 Jan 2022 10:01:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7wv7-005LSc-2u
 for linux-riscv@lists.infradead.org; Thu, 13 Jan 2022 10:01:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B41861B94
 for <linux-riscv@lists.infradead.org>; Thu, 13 Jan 2022 10:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107C4C36AE3
 for <linux-riscv@lists.infradead.org>; Thu, 13 Jan 2022 10:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642068084;
 bh=r9Xmti5ENowuf7ZOfx3WmCfknBUjGW9aFWNDHQ5ywbw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ECmdeO6B6Fd9TAMZmS4+5hjjVxjV4u6uojUTqPLvxyBNKYqmYu56XI8UiH942psvj
 3VtkZ2PZPJliy+EE0AwwLrR1D5i/UidL0WrI7xZpoVOLne2d8RBkoLiaxaDmiT84Ox
 1Pl9T8n24Vm3FYN0Ojov+pOJAWjyiEXYYYGcPAZPEcZUIiHOwNPIjanzdsWcDVJ6fb
 XINqKjmDNXxmRBLI6t7trBIJ7LPVWrUspF4J3Rld+j5Cbnxw0oqQEdJ66WvRZcHCl4
 9BaCs1Nc+LJ6C0TCOwt4Ofn4OGdHgJj1E9+WEkzCl40QiKwCineQpzL0gvyr2U0XRn
 pqL+IOlfyubuw==
Received: by mail-wr1-f44.google.com with SMTP id o3so9048861wrh.10
 for <linux-riscv@lists.infradead.org>; Thu, 13 Jan 2022 02:01:23 -0800 (PST)
X-Gm-Message-State: AOAM530woibAmorGeuJz0jQeQ6AK9zngPAMdX6xR6kGkdB4ptRay62lZ
 NqCmOWVroo8AF4n57X4X8PL8kXw3koGvC8ag8u0=
X-Google-Smtp-Source: ABdhPJxmEAR4hVCNb3lidjdZvURcPTPrdeL3xu7KyFiB0v7M6D909JIjwIn1kk32qmoZcvzTQ/FqCEfttR49kfWDs14=
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr3223206wry.447.1642068082415; 
 Thu, 13 Jan 2022 02:01:22 -0800 (PST)
MIME-Version: 1.0
References: <6fccad4e-b579-25ed-6bf3-2fb2a968b243@canonical.com>
 <c758bae4-3578-f062-edfd-f5835ae525fe@gmx.de>
 <CAOnJCUJ6Aoh7881HOSifQTc61+vCTVjxnYORfWM_WGLJQCugRg@mail.gmail.com>
 <7416157e-50d1-3664-7df0-2a45e29cd8c1@canonical.com>
 <CAAhSdy1DOnEGpxPQF7juUSyBTyx9W8KsH8exTpOmTLOnNCMJqg@mail.gmail.com>
 <CAOnJCU+taK16cnfnQtk3QM3s-f4RCUTWENAPe8Nhs-8L29vKew@mail.gmail.com>
 <d7f57c7f-a02c-c245-e1ef-af30bc9f6998@canonical.com>
 <CAMj1kXHXFXSojAUz6EDeoTkqD5AxeFTffA=RyTu5JnsAsAHsfg@mail.gmail.com>
 <20220113094448.GA15466@sunil-ThinkPad-T490>
 <CAMj1kXFU2TeywomSK5anCUihu1Ts-=OwSDEAJS5hq+vRc82c5Q@mail.gmail.com>
 <20220113095913.GA17107@sunil-ThinkPad-T490>
In-Reply-To: <20220113095913.GA17107@sunil-ThinkPad-T490>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 13 Jan 2022 11:01:10 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGLLd5tK+rahpMrS+OV+Abmo6bkPUs0e2Z1wZhngoyzAg@mail.gmail.com>
Message-ID: <CAMj1kXGLLd5tK+rahpMrS+OV+Abmo6bkPUs0e2Z1wZhngoyzAg@mail.gmail.com>
Subject: Re: Question regarding "boot-hartid" DT node
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <anup@brainfault.org>, Abner Chang <abner.chang@hpe.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, sunil.vl@gmail.com, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_020125_193291_872DE9FD 
X-CRM114-Status: GOOD (  18.63  )
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

On Thu, 13 Jan 2022 at 10:59, Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> On Thu, Jan 13, 2022 at 10:50:11AM +0100, Ard Biesheuvel wrote:
> > > Hi Ard,
> > >    Here is the draft EFI_RISCV_BOOT_PROTOCOL specification.
> > >    https://github.com/riscv-non-isa/riscv-uefi/releases/download/0.3/EFI_RISCV_PROTOCOL-spec.pdf
> > >
> > >    If you are fine with this, we can freeze this spec. Thanks a lot for
> > >    your help on this.
> >
> > Please don't use the EFI_ prefix, it is reserved for protocols that
> > are defined in the UEFI or PI specifications.
>
> Oh OK. I didn't know that. TCG2 protocols also start with EFI prefix. Is
> that a mistake?
>

Yes.

> Would "RISCV_EFI_BOOT_PROTOCOL" be better?
>

Yes, or RISCV_BOOT_PROTOCOL. The EFI is kind of redundant since we are
dealing with a EFI protocol.

> Thanks
> Sunil
> >
> > Other than that, this looks fine to me.
> >
> > --
> > Ard.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
