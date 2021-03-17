Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631C4C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 08:31:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9D1064F2B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 08:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9D1064F2B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VwN5ARY3wN9VQMt2oVwUh59pbGkCtZorU/74J+A20a0=; b=QHXNqVRcpK/iKGQXHrqvpsXOl
	iMx1C6Klrb7gr7omzwNiX3gDMbu5R2aBPOD+GUDpBTZnk03lAl3B2Ri+NrWmlw+QD3ako7h8BSbWZ
	s+OAWfFM8/m6/7nldnMJqIxqIkYlLB8iIZwlFUO9PLeUwj98gpVZMdqRJxrknxNyQH06oq7vQ0Vb+
	U2J7WiapMnX371UZzhdsC6KqodOo6STOszHX2yCpRg/RyoxxtiFwgprUer3/uU4umy84M7EPLJLNx
	EcHuiEipHRjLH9GbS5c52r4AfTeO2mqhFgw0j9C6946oYNYv4P8oR+2iy3Tuh5DOhkuJpsjb3CbTC
	6G9aETZHQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMRaP-002lPE-3o; Wed, 17 Mar 2021 08:31:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMRaK-002lOU-CY
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 08:31:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so4927882wmq.1
 for <linux-riscv@lists.infradead.org>; Wed, 17 Mar 2021 01:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4vjiwbzbA8IYE1XV320ax9Kro96quaaA91f7yjl2jDg=;
 b=w0OYVWsfUOclHsEp9Zg5Mb7BBfeg554unIreZ2+JU7Dw9Iazmmquuvl8/08zIYY8p7
 vjzYTh9Mb1X9ups5tq7/8pX/8FfQ6jelvZAVXkYJKi6+0swjA1NXuajz5TJ9zSIfKArO
 MaDDQSzdeo8xp86IPUwhrnmb3EKCuwRiskp6UJQDUcWo/WvK8jsE8COIFPKrTAgh2pkF
 hOshDXkPJkcwnhKWVsXm6BTO56Xz+XU9XfLOWuisWdK2+BkHa2hq5Cgbpc4NKNyWfl0y
 rIfGZELZhcbZ/LNM7A6v/8tbM296weOpDYSdaenULKGIVKsFJd5AYnKRRvEPuWPZOwGl
 p+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4vjiwbzbA8IYE1XV320ax9Kro96quaaA91f7yjl2jDg=;
 b=Co/yaF9hu8R/45InWcqz3a6c1xk4xdrr8V7J86uTx6NzD4NpNr0qNqsRaVqEbCHbs5
 Hr7RGSDoGp986fZ7VUX3o0U/gt+w+z8/SK2M4/Qx4TWyKbrpd82Sht5Eo7iOe4N2omPv
 fSeF6ja/IBuxutyQQGTax3Uz3QdIHunZZbVKxhvaa4RTV70H0epAR9+cBlKJeP5kiPZw
 nyoQAd5eex/+Wifv1zraxB/WLln0dwzbnmvP6Cylltl0OK+szP6mxbGG3+SA9df5H6W3
 ztLiSJf7fb/ZcJ+dIN9L1br3jzLvLyRey3ue8wendZPlGw9yl/8TInPJztOI9mS73DCJ
 vKhg==
X-Gm-Message-State: AOAM5301wHkNgBQvbd4R8KHNXJFs/fg07rdy3J8bgXADX3xS2aIafsqV
 PQmglAm9THJpT6V279WDdU5gjI6ig0RP1HIctzr0lw==
X-Google-Smtp-Source: ABdhPJzjxW0MI2nIZu00KPfbZrQJvdakT/LohkLISl3B3zJubs3TMKed8g8s9zrp8uVcUglvefASoIAZ2/iTHto+Duo=
X-Received: by 2002:a1c:bd55:: with SMTP id n82mr2488447wmf.3.1615969879781;
 Wed, 17 Mar 2021 01:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210315110500.802897-2-anup.patel@wdc.com>
 <mhng-15799b77-832f-49f3-ac18-af2ec08eebf5@palmerdabbelt-glaptop>
In-Reply-To: <mhng-15799b77-832f-49f3-ac18-af2ec08eebf5@palmerdabbelt-glaptop>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 17 Mar 2021 14:01:06 +0530
Message-ID: <CAAhSdy3BzeU42CYO2fJ0LN31hpE=+CTxb=ys1GcC+h4uPVQ-jQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] RISC-V: Don't print SBI version for all detected
 extensions
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <Atish.Patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_083120_513829_132D7D50 
X-CRM114-Status: GOOD (  16.96  )
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

On Wed, Mar 17, 2021 at 10:38 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Mon, 15 Mar 2021 04:04:59 PDT (-0700), Anup Patel wrote:
> > The sbi_init() already prints SBI version before detecting
> > various SBI extensions so we don't need to print SBI version
> > for all detected SBI extensions.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/kernel/sbi.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > index f4a7db3d309e..c0dcebdd30ec 100644
> > --- a/arch/riscv/kernel/sbi.c
> > +++ b/arch/riscv/kernel/sbi.c
> > @@ -577,19 +577,19 @@ void __init sbi_init(void)
> >                       sbi_get_firmware_id(), sbi_get_firmware_version());
> >               if (sbi_probe_extension(SBI_EXT_TIME) > 0) {
> >                       __sbi_set_timer = __sbi_set_timer_v02;
> > -                     pr_info("SBI v0.2 TIME extension detected\n");
> > +                     pr_info("SBI TIME extension detected\n");
> >               } else {
> >                       __sbi_set_timer = __sbi_set_timer_v01;
> >               }
> >               if (sbi_probe_extension(SBI_EXT_IPI) > 0) {
> >                       __sbi_send_ipi  = __sbi_send_ipi_v02;
> > -                     pr_info("SBI v0.2 IPI extension detected\n");
> > +                     pr_info("SBI IPI extension detected\n");
> >               } else {
> >                       __sbi_send_ipi  = __sbi_send_ipi_v01;
> >               }
> >               if (sbi_probe_extension(SBI_EXT_RFENCE) > 0) {
> >                       __sbi_rfence    = __sbi_rfence_v02;
> > -                     pr_info("SBI v0.2 RFENCE extension detected\n");
> > +                     pr_info("SBI RFENCE extension detected\n");
> >               } else {
> >                       __sbi_rfence    = __sbi_rfence_v01;
> >               }
>
> Thanks.  I'm just putting this one on for-next so you don't have to carry
> around the diff.

Thanks Palmer.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
