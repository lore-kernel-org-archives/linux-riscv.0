Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E03BC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 13:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKhnCWhFxcSyzzWcjGdSWC3h+sG1E/g6HLFT0BBa4o0=; b=zdyxw+v/JRGXxi
	SbJ5TDInOo6Js3V2X/VhXoLGAkW8pVkvRPXEpcvtKeru1rWDe6GPt3icHx9NIuGnAgGr6Z6KFkC/O
	5LzDFJnOiobxQk/jC4LDB+ohFBmoa8o2xCfGktygsEB1bo1GWYBL3VGeB6C3cHoCb/B+y/QKzLhoi
	BbXAg/6GztXt43F0FEM07GWlB+YrgAauUESZUETM3Wl4zOrRWBH7jejOO9TrvDFZQCNENuXFa8o4c
	0amTlYfY9g/Mte/BIqwRhlCEs6s3wcjRWdws4eAcqKanh7QQ1KOI5n3TvFKf7l74feTPfL4CCADH/
	vSa1ZPY9CKnpqSGmkCBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oibzI-008FDr-Rt; Wed, 12 Oct 2022 13:41:32 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oibzF-008FCA-Eg
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 13:41:30 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id a2so11776096vsc.13
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 06:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNaONkodKU8wuhjhY6olb/IOl+q0m7F2XRj580RmVHU=;
        b=MhofUUXYT3tMT7oMQ+a5cs30JJ4oxfDawPPGaNHs4RrO+MqfLXIzE6Vb5DKawierXs
         kBBWD3mF1Svm6j9Bk5Efo8SKBS5fj6LsDKyEmMxd5p0ScJj20zY+wLFWDFX1sZXmYeJ/
         yWckjMTjg1kGb4YuR9giH8xD/PNg8MUWv2eYl9tOaB5OfqGP2zi7LJBFBubdEXhp/HV+
         j+5m0uu7Q1SsV6RdzOqsXmbDVQflTXfn91nd0Mdh0lhhC7P6rLZL9otgU9vIRf6PgSsf
         z0Qnd9DGQkDU0625sqluJJofMfWEk7nI+eWAuHsOJE75dWE7ddsUzxYpTiub0k/WZSKE
         iotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNaONkodKU8wuhjhY6olb/IOl+q0m7F2XRj580RmVHU=;
        b=JgV7W8jPSHGn8G3DEN//KLV8YJIWlVfVyeRwANg129vcoki8LnTzlooCtk3VpJ+qly
         bRqfwQ88gSqf6p3ZVPDlQv0ed4dekZeKZ9SYh3k3SbssurvAeEkGWiJi2iUh6sKOncju
         bDWUgLy/ylkJStHFkAn25XfYD1/hKN/fEeDbsKhzCpFqu6Laelc80FYnsfBezREDDuyb
         86iCP0xOWyBmLC66xsGxCqb3dDjeivSqsuEI5oHW+p0HLI+PJIpPSM4DGL6sHTkPUikD
         hSwsUr3K9FPpNRpqxx5o4AdyxNZ5V5w9E+bb8721Tmwp0HwuYMQUmsEsWvjxXDkdKSqa
         2/9w==
X-Gm-Message-State: ACrzQf0362m5os2OsfQmN8OktQVTPRwp9Du/zqVKlCHW2jM62sJdbqJK
	qhz55feo9yi5OAlI/Z6etKtiDL/Lkqq1lh6qOJw=
X-Google-Smtp-Source: AMsMyM5+q5LtrcFWQspxCt566WeBlBUnLhzlSoIIWh3N2hJAuyYFmaM4pCXOCmY1Vj++tYwP0S9AlrvwQVCWofodsZI=
X-Received: by 2002:a05:6102:31b6:b0:3a6:eeec:a566 with SMTP id
 d22-20020a05610231b600b003a6eeeca566mr14831683vsh.28.1665582087089; Wed, 12
 Oct 2022 06:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221012082949.1801222-1-ajones@ventanamicro.com>
 <Y0a5QYWzEwRlGtxf@yury-laptop> <20221012131325.oc7onxqo7t46wxq5@kamzik>
In-Reply-To: <20221012131325.oc7onxqo7t46wxq5@kamzik>
From: Yury Norov <yury.norov@gmail.com>
Date: Wed, 12 Oct 2022 06:41:16 -0700
Message-ID: <CAAH8bW9z6D_DRCAvQi5BUN9dh82LBZwGd-GWa8r+MFc=xs6xVw@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Fix /proc/cpuinfo cpumask warning
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_064129_521835_6FAB1AF1 
X-CRM114-Status: GOOD (  34.29  )
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

On Wed, Oct 12, 2022 at 6:13 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Wed, Oct 12, 2022 at 05:55:29AM -0700, Yury Norov wrote:
> > On Wed, Oct 12, 2022 at 10:29:49AM +0200, Andrew Jones wrote:
> > > Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
> > > started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
> > > are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
> > > start and next seq operations implement a pattern like
> > >
> > >   n = cpumask_next(n - 1, mask);
> > >   show(n);
> > >   while (1) {
> > >       ++n;
> > >       n = cpumask_next(n - 1, mask);
> > >       if (n >= nr_cpu_ids)
> > >           break;
> > >       show(n);
> > >   }
> >
> > Can you instead of sudo-code print show the real control flow? What
> > function hosts the infinite loop?
>
> The function is seq_read_iter(), which is pointed out above. I'd rather
> not reproduce / describe more than what I've done here, as the function
> is large. I'd be happy for reviewers to double check my pseudocode to
> make sure I got it and the analysis right, though.
>
> >
> > > which will issue the warning when reading /proc/cpuinfo. Ensure no
> > > warning is generated by validating the cpu index before calling
> > > cpumask_next().
> > >
> > > [*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.
> > >
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > Cc: Yury Norov <yury.norov@gmail.com>
> > > ---
> > > v2:
> > >   - Got comments on the x86 equivalent patch and made the same
> > >     changes to this one
> > >     - Added all the information I should have in the first place
> > >       to the commit message [Boris]
> > >     - Changed style of fix [Boris]
> > >
> > >
> > >  arch/riscv/kernel/cpu.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > > index 4aa8cd749441..63138b880b92 100644
> > > --- a/arch/riscv/kernel/cpu.c
> > > +++ b/arch/riscv/kernel/cpu.c
> > > @@ -166,6 +166,9 @@ static void print_mmu(struct seq_file *f)
> > >
> > >  static void *c_start(struct seq_file *m, loff_t *pos)
> > >  {
> > > +   if (*pos >= nr_cpu_ids)
> > > +           return NULL;
> > > +
> > >     *pos = cpumask_next(*pos - 1, cpu_online_mask);
> > >     if ((*pos) < nr_cpu_ids)
> > >             return (void *)(uintptr_t)(1 + *pos);
> >
> > OK, as far as I understood your explanations, *pos == nr_cpu_ids
> > is a valid index because it's used as stop-code for traversing.
> >
> > However, you're completely silencing cpumask_check(), including
> > those cases where *pos > nr_cpu_ids. I suspect there's no valid
> > cases for it. If so, the patch should look like:
> >
> >  +    if (*pos == nr_cpu_ids)
> >  +            return NULL;
> >  +
>
> That makes sense and it's probably worth a v3. I'll wait and see if more
> comments roll in before sending though.
>
> >
> > The same for x86 patch.
> >
> > If it comes to v3, can you send both as a series?
>
> OK. I'll write a cover letter trying to explain that I don't expect them
> to both go through the same tree.

I can take it in my tree, if it helps.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
