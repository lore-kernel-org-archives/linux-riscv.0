Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CE6C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 11:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5vfmsMJHm+3EKTOT12r4eHxbGaM63LKTnqRbjtC65J8=; b=xgLjAma41mbgMk
	2n6XwQaGRQoPApsG23zNlTaXjf9PaKZYyqWvlR6uhSqgV+BgMYYLh6E+Dm3MAMizYPM038bRWxRNd
	vRI2ptmSS2BknjQcxiutOLuJuMiJtZW+hJ+yYg1goaDE5SF5yABZVROd2B7pM9xDLd2CHvdF8TRVZ
	9Q8rVZWp+saTSH9EEbEq80/Yv0de3ESOPxmSbTikTSwoXg8Z1gBSGn95OuL0f/Ff/pbgU6tXrxC7Z
	Yp2qXmVwyB4NTBp4ZE18wVz6COQpoK2isiOhSjZgHc+tuCAY+S0scSEwGbru7ExAo40kKBFBuAeTY
	8tkhaErAus6Ft3AK60hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDlp5-008SnE-GB; Tue, 19 Jul 2022 11:55:31 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDlp3-008SkU-8n; Tue, 19 Jul 2022 11:55:30 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MZCX1-1o0vnR2FLl-00V65I; Tue, 19 Jul 2022 13:55:24 +0200
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-31e0d4ad6caso77387137b3.10;
        Tue, 19 Jul 2022 04:55:24 -0700 (PDT)
X-Gm-Message-State: AJIora/LgBGxf6Yx2W9JGelydS4FEJdpZrdlMW332dudkwTrMwntHymQ
	hN5bL+sCCeylOP5VK5HbcaxgmnAkTIh/mCJCi6M=
X-Google-Smtp-Source: AGRyM1t9u7bj2YKjBFpcu5Ozi36BZwukcrSN9A6siyhURYMRnJ74r74VIYyf4LXb/QiwSX6mJLACHGCDSTzuEa0736k=
X-Received: by 2002:a81:d93:0:b0:31c:d32d:4d76 with SMTP id
 141-20020a810d93000000b0031cd32d4d76mr37696610ywn.135.1658231722965; Tue, 19
 Jul 2022 04:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220717033453.2896843-1-shorne@gmail.com> <20220717033453.2896843-3-shorne@gmail.com>
 <YtTjeEnKr8f8z4JS@infradead.org> <CAK8P3a1KJe4K5g1z-Faoxc9NhXqjCUWxnvk2HPxsj2wzG_iDbg@mail.gmail.com>
 <CAAfxs740yz1vJmtFHOPTXT6fqi0+37SR_OhoGsONe4mx_21+_g@mail.gmail.com>
 <CAK8P3a1Mo9+-t21rkP8SDnPrmbj3-uuVPtmHbeUerAevxN3TNw@mail.gmail.com> <YtaNvpE7AA/4eV1I@antec>
In-Reply-To: <YtaNvpE7AA/4eV1I@antec>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 19 Jul 2022 13:55:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2UTND+F83k2uQ+f=o1GWV=oa5coshy8Hy+cKHUGuNzEg@mail.gmail.com>
Message-ID: <CAK8P3a2UTND+F83k2uQ+f=o1GWV=oa5coshy8Hy+cKHUGuNzEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] asm-generic: Add new pci.h and use it
To: Stafford Horne <shorne@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Bjorn Helgaas <bhelgaas@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-csky@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-um <linux-um@lists.infradead.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>
X-Provags-ID: V03:K1:JU7UIuypQ+jI+KA0W00n8DL5jAeoAvJ3XjUtB/UTy2IqT77bIPt
 dBl9NY1V1+bxzDudkqe1i+QO/Fy/2CVZoMjRf1Unv8IlCzEAv5YNeaMdc0AxG6j1tzX2J2n
 SBYn2INSnK5rKWzx6YlPCP5srhw/LJKoEaXtcLP9AkQEdF4xJ1ECiPZUl5unYsgMYVlzQ1s
 +Y/7fBWtE4GL7+CASEy5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jMfogJu6ZLo=:Cpj6/SeWQNYEkq0ydmQEHQ
 pLjmKQlMRyncdn6DFgqqVWKMEJCUC5rCAx2adu4mkIHDiQbrEinAfGyIYpH7t00gFuvs/eL6o
 AJgJ3+Umc0hxiwFbiE1axKWe9K8Qg+/z+HGt+bFqsGP6f48oltzzVhp43L/v/i3LCtB//Ns6j
 5mE/lHTS/rJ765UQvLUM5OemVTC+Y14pqUxpypH6peOVyjNcgBeeSFbag62aL0hQMCRpp9B7w
 JsZ0yJ/rpj7D5PlKGgWMKHv5E6zICPRFsLjyRNUdcMfy9DwtCXOgwO+F0ZVuDqupCXJYPDblY
 VBfcdkAlkpYYbzd3LfSYaUo7zgOuK68zWeEhXeMizDMB6RhHoNPGit5O7k9dJdGlduRp+b3S1
 J8K0hk6s9dNyq3eTJKeZ59hLREOou8T0AryUqnPtqIzqDDRtON5VRDSTaoxhJarxchn7KD61z
 LTq9dz/gimCp20bMAXfWq/UxxqCnyaQHl6mFbFA4jotdpQz8XneY57rsqJp1nYEHwi9yaHPVw
 Lw9zTnJgatVkoJSsfaQghn8kgJ26HjBBsXZM60f05A8YKdWEcXpT5bk0OEg7dZ6b+upiJfxko
 gU3oQ6x1WRA7w+BgjqnNsCQfhGf7a9JaLzkIGm1gzHkdEAAX2sgL0BAqDpumvRT/YNgi9EYKj
 +QtTXeafwsvpuiCqpGVmm/JADmDoC6rAB6W9EtIXt+AIvfZqd0XmXY8zEiOHEbnPuIHxvCt/7
 PKudKowQypA/dhGm3NHUaxesXc3HPVnlyS+DxonUH4yKC/VTSlyIG6gB5LFRreoF1Xnf36Pm6
 apcTK6jrnMJYJ9gnv6r0K+TxKfUDGZr2qPgBD18BXqH1FhGYurcwupAJAJJu9mzm07GpnyuF9
 u4LyUBTCJLYDKGNWZ33g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_045529_606447_B5D1C8F1 
X-CRM114-Status: GOOD (  15.52  )
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

On Tue, Jul 19, 2022 at 12:55 PM Stafford Horne <shorne@gmail.com> wrote:

> diff --git a/drivers/comedi/drivers/comedi_isadma.c b/drivers/comedi/drivers/comedi_isadma.c
> index 700982464c53..508421809128 100644
> --- a/drivers/comedi/drivers/comedi_isadma.c
> +++ b/drivers/comedi/drivers/comedi_isadma.c
> @@ -104,8 +104,10 @@ unsigned int comedi_isadma_poll(struct comedi_isadma *dma)
>
>         flags = claim_dma_lock();
>         clear_dma_ff(desc->chan);
> +#ifdef CONFIG_X86_32
>         if (!isa_dma_bridge_buggy)
>                 disable_dma(desc->chan);
> +#endif

There is a logic mistake here: if we are on something other than x86-32,
this always needs to call the disable_dma()/enable_dma().

Not sure how to best express this in a readable way, something like this
would work:

#ifdef CONFIG_X86_32
        if (!isa_dma_bridge_buggy)
#endif
               disable_dma(desc->chan);


or possibly at the start of this file, a

#ifndef CONFIG_X86_32
#define isa_dma_bridge_buggy 0
#endif

Or we could try to keep the generic definition in a global header
like linux/isa-dma.h.

> --- a/sound/core/isadma.c
> +++ b/sound/core/isadma.c
> @@ -73,8 +73,10 @@ unsigned int snd_dma_pointer(unsigned long dma, unsigned int size)
>
>         flags = claim_dma_lock();
>         clear_dma_ff(dma);
> +#ifdef CONFIG_X86_32
>         if (!isa_dma_bridge_buggy)
>                 disable_dma(dma);
> +#endif
>         result = get_dma_residue(dma);
>         /*

Same here.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
