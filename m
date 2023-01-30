Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B56C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNoYZHHRjxCrwrMgOanpAq1ANXvLhV8FraT1NTXoe/A=; b=wPTWTyIwdhzueQ
	WVAVLnQU0XOtljw6f9o3gVj/z3GyMtT2zuUSCZHG+0SuTvcs0Ay9St0Nj4vlWv0ny9PfzIOIJ7lkQ
	A8kBXL5TzsUSPg+72MEUgOpUOpSmSD9WycJNfi8CjmQmR1NfcO+xy7cM3FDs/+AyRKiEdFG1N52Wl
	uX0hzgd1YL0h3OaoWWYpA25Bktf7y/Cx/rg+LBmeEZi4Br4OBVlVxbi/+FMLeK8tUcCPTs38kqrxS
	D4RmlXukLGLKgoljSaSIBXK9kzp6rcXHOdMkXgERnIzwYFu1YWeCuzsnFIC5QK1X7EhFAG8XEr2ZF
	FGW3OH+EbqkVZH4JZzDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMV0Z-003rMs-NO; Mon, 30 Jan 2023 14:19:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMV0S-003rLR-Fs
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 14:19:40 +0000
Received: by mail-wm1-x32e.google.com with SMTP id o36so2080755wms.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 06:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QVfyUaMlKe2XgKvP+3UZFMNGgzOkxpuMQuoaVQh0BKc=;
        b=AU5OTDUQfdokXPeFU5yQryz/q9qCxaUN91+qIhqfKpwMtoooFYxLZ+jyVqOWOOnFcm
         R9juG1J/K6NASljEygwMQHYkM9UwC2lChPae8ue/Z2qbu4y3wh3U4CIHGVkE4G9yWZe3
         w8b+MFuKkD0IIxf3m1WUq4rMdbLFawaBlmb0DBBOQbsF4cZ+epAFbH8OTYKoJEt6FRIU
         hhMUwxrm1K0edMp/noTFix8XechTBHb2fKw6XJnYPbuhlpBUNZW1DWBSLzy/8CpWjDz4
         RtQ8I4CGdwRZ1nODOxCei15r1vrC/tWP/Bvae6aII0GLmVkACD41/kg0eHHRFqwd7Epi
         Y5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVfyUaMlKe2XgKvP+3UZFMNGgzOkxpuMQuoaVQh0BKc=;
        b=z6Ej06eIaOb16MLaBe2Rfw19ULAOXLruVfN9CN0p0opB0ImS5ZJBZuJBxQFivl1KKW
         teAyjJS+21OqQuWfGfSZZWQllhIyPC2qtwlIFxpmQYrohfU4bUUrAwqp1JV0Hmk83IX0
         DTYSynqHi0fP8wbzuDq/pxLd3SOOLN5xSvaoq9hRYQ66AOnYHkiz6H1tl+TuLAy95BUk
         Q54qtcTgV0U7Iruwi2hX8LCUOWtscaCuA68FmvhSTwV0SXZtWeLz0riX9yOB+hWJRjt7
         wiHO7hQvaysZ+UDQ/qVgqC5PL5iWPwqPOZGvXqDy8Q0oTfyNtlpp8vFKvqna/KMnvEr1
         AdAA==
X-Gm-Message-State: AO0yUKU7DP13ZooJkLj+SA0+vtwHi4bOibYe+9Sh2MlQSnlLYBTe1RZJ
	cD13nBcxyzdCvafadyhamdl3cA==
X-Google-Smtp-Source: AK7set/pqvBd/T/fnKgqYnfdEL/4TEGOcLzq7bpTeWO1f5GtFkVADlDjXe6AYRSdPNLc0ue8bBGsTw==
X-Received: by 2002:a05:600c:54e5:b0:3dc:4f2c:c856 with SMTP id jb5-20020a05600c54e500b003dc4f2cc856mr7773946wmb.32.1675088374692;
        Mon, 30 Jan 2023 06:19:34 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id e5-20020a05600c254500b003dc47fb33dasm8355006wma.18.2023.01.30.06.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 06:19:34 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:33 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v4] riscv: Use PUD/P4D/PGD pages for the linear mapping
Message-ID: <20230130141933.wuikrruh2svkcfv4@orel>
References: <20230123112803.817534-1-alexghiti@rivosinc.com>
 <20230123142554.f22ajf6upfk2ybxk@orel>
 <20230125104102.2thvourt3lx2p36a@orel>
 <CAHVXubjUCmk6xGTCPzMujYqKUwE0bhQBqd8A+=yq7ijQZtBObg@mail.gmail.com>
 <CAL_JsqJ8JtkOBLpdf3hU9JWcdRTFr3Ss1Hd+yFpMqs7ujUiyCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ8JtkOBLpdf3hU9JWcdRTFr3Ss1Hd+yFpMqs7ujUiyCQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_061936_553959_D613B44C 
X-CRM114-Status: GOOD (  35.89  )
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

On Mon, Jan 30, 2023 at 07:48:04AM -0600, Rob Herring wrote:
> On Wed, Jan 25, 2023 at 6:13 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> >
> > On Wed, Jan 25, 2023 at 11:41 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Mon, Jan 23, 2023 at 03:25:54PM +0100, Andrew Jones wrote:
> > > > On Mon, Jan 23, 2023 at 12:28:02PM +0100, Alexandre Ghiti wrote:
> > > > > During the early page table creation, we used to set the mapping for
> > > > > PAGE_OFFSET to the kernel load address: but the kernel load address is
> > > > > always offseted by PMD_SIZE which makes it impossible to use PUD/P4D/PGD
> > > > > pages as this physical address is not aligned on PUD/P4D/PGD size (whereas
> > > > > PAGE_OFFSET is).
> 
> [...]
> 
> > > > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > > > index f08b25195ae7..58107bd56f8f 100644
> > > > > --- a/drivers/of/fdt.c
> > > > > +++ b/drivers/of/fdt.c
> > > > > @@ -891,12 +891,13 @@ const void * __init of_flat_dt_match_machine(const void *default_match,
> > > > >  static void __early_init_dt_declare_initrd(unsigned long start,
> > > > >                                        unsigned long end)
> > > > >  {
> > > > > -   /* ARM64 would cause a BUG to occur here when CONFIG_DEBUG_VM is
> > > > > -    * enabled since __va() is called too early. ARM64 does make use
> > > > > -    * of phys_initrd_start/phys_initrd_size so we can skip this
> > > > > -    * conversion.
> > > > > +   /*
> > > > > +    * __va() is not yet available this early on some platforms. In that
> > > > > +    * case, the platform uses phys_initrd_start/phys_initrd_size instead
> > > > > +    * and does the VA conversion itself.
> > > > >      */
> > > > > -   if (!IS_ENABLED(CONFIG_ARM64)) {
> > > > > +   if (!IS_ENABLED(CONFIG_ARM64) &&
> > > > > +       !(IS_ENABLED(CONFIG_RISCV) && IS_ENABLED(CONFIG_64BIT))) {
> > > >
> > > > There are now two architectures, so maybe it's time for a new config
> > > > symbol which would be selected by arm64 and riscv64 and then used here,
> > > > e.g.
> > > >
> > > >   if (!IS_ENABLED(CONFIG_NO_EARLY_LINEAR_MAP)) {
> > >
> > > I see v5 left this as it was. Any comment on this suggestion?
> >
> > Introducing a config for this only use case sounds excessive to me,
> > but I'll let Rob decide what he wants to see here.
> 
> Agreed. Can we just keep it as is here.
> 
> > > > >             initrd_start = (unsigned long)__va(start);
> > > > >             initrd_end = (unsigned long)__va(end);
> 
> I think long term, we should just get rid of needing to do this part
> in the DT code and let the initrd code do this.

initrd code provides reserve_initrd_mem() for this and riscv calls
it later on. afaict, this early setting in OF code is a convenience
which architectures could be taught not to depend on, and then it
could be removed. But, until then, some architectures will need to
avoid it. As I commented downthread, I also don't want to go with
a config anymore, but it'd be nice to keep arch-specifics out of
here, so I've posted a patch changing __early_init_dt_declare_initrd
to be a weak function.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
