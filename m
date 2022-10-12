Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC9AC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 13:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UpjLOR2YOWEvGwt+EMWtky9CFCS9bjEqZfp17VKCqtE=; b=jCAGG/S0ZuJvFb
	NPInCy+mxpa7sGPbZPvArwcMOLaTaZpDWiZlSomdd0XI0mMeKS68yvsbBDpSeWoEbxhIBPQuY1Tcz
	SuucXPwdyM8bvGO645IOOEOHqL2MqY/bqbXYJWInlgrM0gYtULphbSsWIztTszx9HpK3bM9PaOydi
	BHn4Tj3VUY00r6ejSCDH8z6ju60UX6Y54mt8PiIOwkFMyPExFvsy/Lz0DoQv1KdJW4g1gaHIr11f6
	nLbyTAmwDRimTGISQAN5LuLHRQdf6baBnZLGrw+zQZjWOSMmU686VSEw2r+gZmnh8NCzzVjSpFshE
	e1jE2ZXN3dfm81EiN6vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oibYI-0086fW-SC; Wed, 12 Oct 2022 13:13:39 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oibYA-0086be-5m
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 13:13:36 +0000
Received: by mail-ed1-x52f.google.com with SMTP id b12so2287009edd.6
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 06:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qec+PTzHVRJaCTYLMbLbFJcUxjGagA3lcOkRy3Fcpa0=;
        b=H8ZXF5cgpFfTnH9WMmsidkLVvJGK2QRQafdmcsaxlacZ0dMT33o30zQOTesinRlBQt
         Upa2RzZRvOczcNg3VHcZ3/QmtScT7DVwDYnnwJv6RD/jinZ9RkfDNf+fefI4vWIGQOyd
         mG5Bej+3NVpguxNW0668vRbI/oFDyRdAbRH3GgfYNWSvQXT3nt8Z2fAB9Ih9dPKJ5uVM
         66xv++Ydk8nARhfySiRM2XRkF0X6R6PG3rTr+FvlhOUQ1wjQqeLGwbD5hB0YXfHn/WLG
         LG8Q71jcieCDM4asn7V9LOUVFHG4ueEMWNdlIfKZQNU7CnVWoE1fobla2Y6rOx+VZtnP
         7nMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qec+PTzHVRJaCTYLMbLbFJcUxjGagA3lcOkRy3Fcpa0=;
        b=LU2pOA57Bqw3hNYqQLS5ofZhp5BOwz+t+DkrTGu42LcUCZz9XJBqWxckSjPkjCgllL
         /DYtajUFhy5hMwzxfamAUx8twnovmb0lUUtc8TC/vx5vDErBZ5M9fVXIIjmkeXO8VH+N
         xrEy/9XI3EqpuGnEYYZOwdFe3dQtWarfs5+xTw9em6QIDewoss5Es7e6tO0cfsSFJN7v
         D7UTwsYBKPS8DERNQIe9oK9zx0ulslytEBdRcXIEAJDYq1Piga7r5NvLpdc7Z1/ocyQM
         br2ki2ERXBvhOKIqvnZPN1NVbp8aTor1Ge1nZST7viy9NgGgJkF7mhc2uXwdVeICHNJy
         mSdQ==
X-Gm-Message-State: ACrzQf34BTXfj8ertrDNtyRVbgMFjwCeRuNer6+yO9+yHjXdCyb7qjud
	w2nAMS13POxEX0Y9zAbWiDABJA==
X-Google-Smtp-Source: AMsMyM4Z8GIXaJySZvnILH18H+0/tiWIyJ+Goli8Iw3sXUFq88849aAGyyIj+faT/QC287JNERqTvA==
X-Received: by 2002:a05:6402:5256:b0:459:42b3:3d86 with SMTP id t22-20020a056402525600b0045942b33d86mr26362820edd.370.1665580406476;
        Wed, 12 Oct 2022 06:13:26 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id v1-20020a1709067d8100b0078d957e65b6sm1279316ejo.23.2022.10.12.06.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 06:13:26 -0700 (PDT)
Date: Wed, 12 Oct 2022 15:13:25 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v2] RISC-V: Fix /proc/cpuinfo cpumask warning
Message-ID: <20221012131325.oc7onxqo7t46wxq5@kamzik>
References: <20221012082949.1801222-1-ajones@ventanamicro.com>
 <Y0a5QYWzEwRlGtxf@yury-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0a5QYWzEwRlGtxf@yury-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_061334_396340_CF2E1B46 
X-CRM114-Status: GOOD (  32.73  )
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

On Wed, Oct 12, 2022 at 05:55:29AM -0700, Yury Norov wrote:
> On Wed, Oct 12, 2022 at 10:29:49AM +0200, Andrew Jones wrote:
> > Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
> > started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
> > are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
> > start and next seq operations implement a pattern like
> > 
> >   n = cpumask_next(n - 1, mask);
> >   show(n);
> >   while (1) {
> >       ++n;
> >       n = cpumask_next(n - 1, mask);
> >       if (n >= nr_cpu_ids)
> >           break;
> >       show(n);
> >   }
> 
> Can you instead of sudo-code print show the real control flow? What
> function hosts the infinite loop?

The function is seq_read_iter(), which is pointed out above. I'd rather
not reproduce / describe more than what I've done here, as the function
is large. I'd be happy for reviewers to double check my pseudocode to
make sure I got it and the analysis right, though.

> 
> > which will issue the warning when reading /proc/cpuinfo. Ensure no
> > warning is generated by validating the cpu index before calling
> > cpumask_next().
> > 
> > [*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > Cc: Yury Norov <yury.norov@gmail.com>
> > ---
> > v2:
> >   - Got comments on the x86 equivalent patch and made the same
> >     changes to this one
> >     - Added all the information I should have in the first place
> >       to the commit message [Boris]
> >     - Changed style of fix [Boris]
> > 
> > 
> >  arch/riscv/kernel/cpu.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 4aa8cd749441..63138b880b92 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -166,6 +166,9 @@ static void print_mmu(struct seq_file *f)
> >  
> >  static void *c_start(struct seq_file *m, loff_t *pos)
> >  {
> > +	if (*pos >= nr_cpu_ids)
> > +		return NULL;
> > +
> >  	*pos = cpumask_next(*pos - 1, cpu_online_mask);
> >  	if ((*pos) < nr_cpu_ids)
> >  		return (void *)(uintptr_t)(1 + *pos);
> 
> OK, as far as I understood your explanations, *pos == nr_cpu_ids
> is a valid index because it's used as stop-code for traversing.
> 
> However, you're completely silencing cpumask_check(), including
> those cases where *pos > nr_cpu_ids. I suspect there's no valid
> cases for it. If so, the patch should look like:
> 
>  +	if (*pos == nr_cpu_ids)
>  +		return NULL;
>  +

That makes sense and it's probably worth a v3. I'll wait and see if more
comments roll in before sending though.

> 
> The same for x86 patch. 
> 
> If it comes to v3, can you send both as a series?

OK. I'll write a cover letter trying to explain that I don't expect them
to both go through the same tree.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
