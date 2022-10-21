Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67BEC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 14:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKIekrs1J7II5uPDAWPk7b15BJEbtQTJnwwlOqCtUzw=; b=lyG1o7IR+yoc2c
	bWiA76OZV/aMffTsyufr9HncVpspaaY7i0lkAz6ILCWlDsMwy4VCeID6w8KJhzyU2ZByowfCHM/y9
	iAmlZ9JnycxnBLknxCT0WBmayMKU/4BGtJXhISKl0i73zya0C4KuPbfi/kntOvsMkYMAwnEMYyF27
	osrV7j0JWGj4MvsMZ392QreyUpXOP2hNMXKx57DjT/1wHmXXciKU8B4fOxOE3wKFEs/RVvoTiMLer
	7fqaNzjc0RgUKM2DUsDYHc+YmfyUCvUqSCLsn+xh2ovkqWiNR6bT1W6x3odVfkL7Q1VIygqpp9yZj
	vThFMteFUhIPP7fbg8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olt7b-008Upx-DJ; Fri, 21 Oct 2022 14:35:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olt7Z-008UpW-8N
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 14:35:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0CEF61E2D
	for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 14:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4284CC433D6
	for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 14:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666362936;
	bh=B/5S/o4drVYHhiJToyAIzlZIavyyZUO2GzzMWPOCRFM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oxPZ4DvnpzhyB31VWjvWVlmDbdfsz7IIn4MjSXnnZkd7Wxv+JfyO84t1oF/wj4ZIo
	 ADbbMVe1KEckFXK5LhCRuBHiPx3J48pA0p8GaTXKBzlyq5Ka9lr4oLhB94rzAp0jLD
	 w9bMMwkq3j2wrgM8C7AyMOmXS7yg2Jh2bhvWIy6ypy0SilnR+kw1uqnG1wN42e+Kle
	 ICcYjE+wwdh/S5rZ1ZoF8ZnmtXSIVKvJreBDyqndreet6C8RnXCIBNTWse/hdUY5YM
	 zJdKltagoMM6zxGzsjALam5sIG0BqB7OtkaXgslBO0aQMhUZpAkPveERrE3aGNjnIh
	 Srn4b+CQ5dTuA==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-132fb4fd495so3723084fac.12
        for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 07:35:36 -0700 (PDT)
X-Gm-Message-State: ACrzQf0XkK/wYRFAEcWBIpher9+n/OHZnadpBvxze0Unn1RECFt1Brwa
	huv5cBF1tD8ra/fJ8PeH5Mkea2sPFyM4NIWI6nk=
X-Google-Smtp-Source: AMsMyM67fmIp02X01LltgnR22002Nyx8nO5i3CGxzwXCtW7W6hgE8MoIslqqWisrCMwZm9k1V0Tl1aKjfJEkZuQuzFM=
X-Received: by 2002:a05:6870:5803:b0:12c:c3e0:99dc with SMTP id
 r3-20020a056870580300b0012cc3e099dcmr27899577oap.19.1666362935455; Fri, 21
 Oct 2022 07:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221019154727.2395-1-jszhang@kernel.org> <Y1HZFcBo21SQzXVj@andrea>
 <CAJF2gTRAEX_jQ_w5H05dyafZzHq+P5j05TJ=C+v+OL__GQam4A@mail.gmail.com> <Y1JaE/ot91Z0KXuC@andrea>
In-Reply-To: <Y1JaE/ot91Z0KXuC@andrea>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Oct 2022 22:35:23 +0800
X-Gmail-Original-Message-ID: <CAJF2gTROm_ifvbccUmj0_CTLNq5oh1GC+XCLX+NQm4L5P71CFw@mail.gmail.com>
Message-ID: <CAJF2gTROm_ifvbccUmj0_CTLNq5oh1GC+XCLX+NQm4L5P71CFw@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix race when vmap stack overflow
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_073537_355275_A81CB5B1 
X-CRM114-Status: GOOD (  19.35  )
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

On Fri, Oct 21, 2022 at 4:36 PM Andrea Parri <parri.andrea@gmail.com> wrote:
>
> > > > +     atomic_set_release(&spin_shadow_stack, 0);
> > >
> > > Have not really looked the details: should there be a matching acquire?
> >
> > I use atomic_set_release here, because I need earlier memory
> > operations finished to make sure the sp is ready then set the spin
> > flag.
> >
> > The following memory operations order is not important, because we
> > just care about sp value.
> >
> > Also, we use relax amoswap before, because sp has naturelly
> > dependency. But giving them RCsc is okay here, because we don't care
> > about performance here.
>
> Thanks for the clarification.
>
> I'm not really suggesting to add unneeded synchronization, even more
> so in local/private constructs as in this case.  It just felt odd to
> see the release without a pairing acquire, so I asked.  ;-)
Okay, let's keep:

 handle_kernel_stack_overflow:
+1:     la sp, spin_shadow_stack
+       amoswap.w sp, sp, (sp)
+       bnez sp, 1b
+
....
+     smp_store_release(&spin_shadow_stack, 0);

>
> Thanks,
>   Andrea
>
>
> > eg:
> >  handle_kernel_stack_overflow:
> > +1:     la sp, spin_shadow_stack
> > +       amoswap.w.aqrl sp, sp, (sp)
> > +       bnez sp, 1b
> > +
> > ....
> > +     smp_store_release(&spin_shadow_stack, 0);
> > +     smp_mb();



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
