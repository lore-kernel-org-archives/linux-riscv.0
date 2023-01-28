Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3CBC38142
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uG3/HxLWr87hT/ZNI3zrWsFsccJwtNf9lvIPqcC+RYs=; b=Ox0zqw/948Pf/y
	uSKEbHK4DU7M2fTvEw8I7baR6yX79bxahlED6zUzWJNL2VosmBTKxkTpESK+JZNjgAaKZYxINarAF
	1eHx1WWwg3yewDAAg0TUSajK3J4OoCGpGmVU612IP6yrNcL280xd1S3HqckuuFgegWctHD8/D6pYv
	H657pryvhStDccVnYdg5pEgLMshjZUnZh5LeOfHAgABMKVZsSn4j/W/iKB2unUR1FES2Now3GKS59
	KOTIrJUZniFvbPhCTlJ+8feKpST3Y/Lan9skRVmz8t+DKA+ybV76MiEbUr6qtp8vfD0olwv6JkmY6
	7BLR0sbIFt0gOxrJ+l/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLiDC-00Hasv-S3; Sat, 28 Jan 2023 10:13:30 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLiD9-00HarI-4P
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 10:13:29 +0000
Received: by mail-ed1-x535.google.com with SMTP id fi26so6780315edb.7
        for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 02:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sFlpJNoGBOazM9CU1KCnJW9Pwymj7pBp6JXDNmhBuT8=;
        b=m9tOjpSpKEb5QibVEue38Iap0SxF/gAOKE3vqNe4CJxeZhtNcrgxnvCjmkRVcanIn7
         JQyYFKW8n30551zAdA1noAvagUG9gVRT8vEI3Bzl/EdeTSiD9H88NrnAmDv42iE7Knfs
         cltndUPYkBZffCA+y+ZFekfjKGv0C9+HBH7491Xee9Uh6hgjWTv15jsjxAa3Ses9NnqS
         a3gU14supwACH3ccwf1zGunLSmMYcSVoQebCgjJsTv7dHHoTFOMVrLJGX5jxZB+yWA8d
         uBmsUEheDLNHH6IA1XSBYkAK9uhBvxI5Itr67YYu0wRbXDbhwD0cRTwAXqR/YSHvZrEU
         jA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFlpJNoGBOazM9CU1KCnJW9Pwymj7pBp6JXDNmhBuT8=;
        b=4dKX9RQ9MOTdNtMAgDvq4hSglb7J8THzT38fLko8KJsBABHppTREreeSy+Qz4S7hH+
         0X8ZfqeEGkA0cw/l8ER/TN3LumSlfbiDhqNO8mRTPGGUzT2ne8dV0dw9vTeiNp85kgJ2
         5tOpXrcqULgFETvxBJMJlYJRGUirMt6k49lb+hJGWi0xDuDKZryRwAjo0/dv6Q0IR1wZ
         HoGtnBxqQAi6oGs5dLHa3CeagfLtN/+iKkoKLTjeXAOMcHIsZkx/r0U8p7SQyjFCKc5s
         bpSzyyLkkxOQVbyp+fLH7YPw+f2ex0+aLfCdGfqCSjQfrDxMKe7+LtjJ1D2qiNspmoNG
         KRgQ==
X-Gm-Message-State: AFqh2koyFry4tg9zos/RYgfl1WLL3+iYFFmtDlZYi9fMIUYT5f/JWTD9
	xGVjQ01sUEn1/t/9Lrpxr87eyw==
X-Google-Smtp-Source: AMrXdXvvQykJl27DpI4dLKKbE4Gp6VgcIMfC9wpU5tWMTKXRTAjAQE6FyENclEpnl7Ei24HEknMf5Q==
X-Received: by 2002:a05:6402:1009:b0:479:8313:3008 with SMTP id c9-20020a056402100900b0047983133008mr42841481edu.0.1674900799926;
        Sat, 28 Jan 2023 02:13:19 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id y11-20020a50eb0b000000b00467481df198sm3689493edp.48.2023.01.28.02.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 02:13:19 -0800 (PST)
Date: Sat, 28 Jan 2023 11:13:17 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] riscv: Use PUD/P4D/PGD pages for the linear mapping
Message-ID: <20230128101317.6zc3r5eh7hqe5q6y@orel>
References: <20230123112803.817534-1-alexghiti@rivosinc.com>
 <20230123142554.f22ajf6upfk2ybxk@orel>
 <20230125104102.2thvourt3lx2p36a@orel>
 <CAHVXubjUCmk6xGTCPzMujYqKUwE0bhQBqd8A+=yq7ijQZtBObg@mail.gmail.com>
 <20230125151041.ijhjqswqiwmrzljd@orel>
 <CAHVXubjR8AsZhMz59goxfmf8LmA4bjePKUx=AkvmbqoF42tzmA@mail.gmail.com>
 <20230127085803.ruj624323wxeyllx@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127085803.ruj624323wxeyllx@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_021327_197845_6CBCF2F2 
X-CRM114-Status: GOOD (  36.79  )
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

On Fri, Jan 27, 2023 at 09:58:03AM +0100, Andrew Jones wrote:
> On Fri, Jan 27, 2023 at 09:45:21AM +0100, Alexandre Ghiti wrote:
> ...
> > > > > > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > > > > > index f08b25195ae7..58107bd56f8f 100644
> > > > > > > --- a/drivers/of/fdt.c
> > > > > > > +++ b/drivers/of/fdt.c
> > > > > > > @@ -891,12 +891,13 @@ const void * __init of_flat_dt_match_machine(const void *default_match,
> > > > > > >  static void __early_init_dt_declare_initrd(unsigned long start,
> > > > > > >                                        unsigned long end)
> > > > > > >  {
> > > > > > > -   /* ARM64 would cause a BUG to occur here when CONFIG_DEBUG_VM is
> > > > > > > -    * enabled since __va() is called too early. ARM64 does make use
> > > > > > > -    * of phys_initrd_start/phys_initrd_size so we can skip this
> > > > > > > -    * conversion.
> > > > > > > +   /*
> > > > > > > +    * __va() is not yet available this early on some platforms. In that
> > > > > > > +    * case, the platform uses phys_initrd_start/phys_initrd_size instead
> > > > > > > +    * and does the VA conversion itself.
> > > > > > >      */
> > > > > > > -   if (!IS_ENABLED(CONFIG_ARM64)) {
> > > > > > > +   if (!IS_ENABLED(CONFIG_ARM64) &&
> > > > > > > +       !(IS_ENABLED(CONFIG_RISCV) && IS_ENABLED(CONFIG_64BIT))) {
> > > > > >
> > > > > > There are now two architectures, so maybe it's time for a new config
> > > > > > symbol which would be selected by arm64 and riscv64 and then used here,
> > > > > > e.g.
> > > > > >
> > > > > >   if (!IS_ENABLED(CONFIG_NO_EARLY_LINEAR_MAP)) {
> > > > >
> > > > > I see v5 left this as it was. Any comment on this suggestion?
> > > >
> > > > Introducing a config for this only use case sounds excessive to me,
> > > > but I'll let Rob decide what he wants to see here.
> > >
> > > To me, the suggestion is less about trying to tidy up DT code and more
> > > about bringing this comment about arm64 and riscv64 not being able to
> > > use the linear map as early as other architectures up out of the
> > > depths of DT code. Seeing an architecture select something like
> > > NO_EARLY_LINEAR_MAP, which has a paragraph explaining what that
> > > means, may help avoid other early uses of __va() which may or may
> > > not fail quickly and cleanly with a BUG.
> > >
> > 
> > You're right, do you have some bandwidth for doing that?
> >
> 
> Sure, I'll post something today.
>

Hi Alex,

So on second thought, and after a bunch of grepping, I don't think we need
to try and give architectures a way to declare that they have incomplete
early linear maps. It would actually be difficult to determine when and
why it should be selected, and, afaict, this is currently the one and
only place it would be helpful. So, rather than pulling this comment about
early __va() all the way up to the Kconfig level, I think pulling it into
arch-specific code should be sufficient, and actually better.

The situation we have here is that OF code is providing a convenience
by doing early setup of initrd_start and initrd_end, which is nice for the
large majority of architectures, but, as we see, it can't be used by all.
My new suggestion is that we expose this initrd setup function as a weak
function which architectures may override if needed. If those
architectures want to prepare a mapping in their function, they can, or,
if they know it's safe to defer the setup until later, then they can just
provide a stub. I've drafted a patch where arm64 just provides a stub.
I'll post it soon.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
