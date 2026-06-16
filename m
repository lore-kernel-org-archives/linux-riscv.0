Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C10CD98D2
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 03:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19YMuuHk1BuKvLau0Fsu8E+QR1rPkWDTeWBtBHUljq8=; b=JvCnDQAdYmXldy
	ig3W02mFq5hLT9mMzv/EZj29iuHD25o29LHkVd8IQauzCHzKok/uaktztpNkWhOf7e5inEeuwXsEU
	mf/sX83Ik4J2otTaNML8xToR8STZqhXdtWq8dGFllejEoGPH2jVKRvThRnsknPuchbjQUWvYcNYrj
	IbhqdB71oDPWaW9pO77Jy4oKwPoVT5p2kofIZELdOIcJ3gDLdVhkeSfH5uhDN7hv8LLoDW/A6RJPw
	JecyF2fAu11UrtjaRs2imjeawXgUz/tVa73V2AdElZMRIo7x7grZbVPVRuNargvCOXh3qIW49nUfo
	LMC1R54n+MyLIr107xEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZKsD-0000000FAL9-0jqS;
	Tue, 16 Jun 2026 03:54:01 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZKsA-0000000FAKj-3p8l
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 03:54:00 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5aa68dbb38aso3642075e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2026 20:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781582036; cv=none;
        d=google.com; s=arc-20240605;
        b=YWx02X91kcE1s6KwxLi4/HLFEhcAhPBFRvME5iKfrW0tgBgnfPFNJhHnyf4gfosELA
         g7pbUwjNZ7vQsNIBi0ooir4JxlYlnhpOg1Uu44iOZDdoDlq1R4THyPeWQNzBwj1Ji75n
         qfTUDyDM5Ayahm53BDy4v4V/leEI0UDb+STbPGzP9Yq6sZnmSt5NElmWqIhiTXYdHznD
         Y2uHcSjcYArUvYh8eur59onJEUEATIsRL4F2NG2J042UtIDyA3KWW4Wc+hEzWaT6O4rv
         HANyZXizyqr3gXZ7Tc0M6px3FzcshvqDTHpZg7142us2xorrnta4JuikPAPpWHpRPkm6
         XHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qLhabjSK7UAyye3Jh7E9W8Bb2U2khl8+Uqz8T842S4E=;
        fh=kWbD8ApPEy6zPmiMtMLQanwWEu7iIrtuMzV+XtijLCg=;
        b=bmxxo6JK3UH7EkDRl/hTmX7hxd7gietw4qWKPs5b7fLQZpietvVCaDiQjuK9Z50TUP
         wwETeNlzu3WMsTTqZ1NmiRYRw5UYKlxtd9vvJeIlVLZ2SF4Ol4Go6QmFaermQ2MucyXx
         oRtbpWdVz7SjFH3RUX3VRh5WECeVFGDb1m8bvuadVnHOT62+UaJevYJJLyP5K0myWGRN
         c2niEv/ZhbWiPn8dujoiawi99hWbdiI8yhSyGAz7o99RWvjcm0g+bKR9CeelfNMQ5SiX
         pQor9ZxZPQhrXxy5NMz1VtyZOqHhhWLBFkHkPI94HP8w0QFMvYyzYc1sCT36tUYsAiwA
         tehQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781582036; x=1782186836; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qLhabjSK7UAyye3Jh7E9W8Bb2U2khl8+Uqz8T842S4E=;
        b=ZqEWO0yusyKWLucCyEk1W5JPfhC4yrLlEllQ4MQpxVqn3YxtC4sCWS3ig9WvgRTztS
         Zk7lbBCGyw1laqk+e5syEJNMNkAVyjWIYZ9AYG/tMVw64lSkTzuZ7aGAGXiyR9x8n9Sf
         fMwNyYsPUxVGq5HdffwoK0KyFD/3pTpzanMJSMPtCL3ZeBK5j74YNtXC5AcIFyqA1MWi
         QpFJ8neEw6D652FhRBotHQtoW0S0eX7v8O5tk0dFmmt9ZlRUAOYJujoTLS4ngH0vbamu
         1p1KleAMT6D+BBgpzgbPeZcSpXf5dIqF0bvSC0PudKryQ+jXmzdfW8FLPwyRfHBvY7RD
         PgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781582036; x=1782186836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLhabjSK7UAyye3Jh7E9W8Bb2U2khl8+Uqz8T842S4E=;
        b=HmYWJizWh25J9zIrcaleGDmFwlRcxycE4RuW2r29Cy1tzdUjdwodnJ4wwZsKQgt2Dj
         V0g27zA3l8cfqbP9eVwteKuTFVv0FkAVzSRis1vewqTAsr/1ZNjphOdTkMEKyxHBZj33
         pLIzja9D89nBPfPDlGFGA3u1EGxlaHRDo3OkKG7ukEl4LcVzoIohFhP5ffRrkC6PG/Vv
         bwvhdB3tQFfIIZ6/hQ8mRZSpj2LwjYiR+aFWK7OmtwPjibPUJUKiudjc6XRyMrKSTvHU
         V05Pl6ftS8Qj6giDeQnvKKegaXIj5RUXM1ZAq7ukwcdoNb/MZ8SeTi7dCb+VWADORdGW
         p7PA==
X-Forwarded-Encrypted: i=1; AFNElJ+vzf2vKSPRWYrRLnrVyfbBjg0CemfrfNsRXQ1R12LSzDw3/RZCCCYjCSam3QQJwyY9w+b59Dr8Kqgr3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbURMuSGolyWyOGVXsG7sWEXZvT5kYS30ZGZgRrrTBZWygp45J
	aIZXKQKwBJg+P69Prn+gMncwBhqnm91Ddg1wRIcwDrUv5ZH2F+cwz0krFG+Llu60b1Rpgkx0HGg
	2XEfmqjTgRxqoYaOHmtgszvOys8+zeuo=
X-Gm-Gg: Acq92OHEUDionEb7qGTlRXAexgo4tq0tC6qWkf/CVGsfjtNcqsYleDCgjH1Bw+elN4i
	EAAhOq+YwNWXVvZuoCrUc/KR+UejaJPyD1Yfuhy7Ol9Nac1Y05Fi8niGttdV2/ahZwK+F9/NGGx
	qQLnmIvY0V40FtFS68NBny1JXiLPr2TIO+NvgNN4aboI0+E66tGMNf2vUhuwNLParriGI78Tr3n
	W+KDXq2t9u9sF5/dcHV6Dua2U0JEkzQ/omksVAfb4vZg/XBYBXxgdm+q7Tb+9dhIwiQyE+K7beI
	8LEPMbrGNlnHX5TeG/N8Q0MELYvmpPk4nPHglw==
X-Received: by 2002:a05:6512:312f:b0:5ad:3035:cf7c with SMTP id
 2adb3069b0e04-5ad4377cd49mr336831e87.53.1781582035890; Mon, 15 Jun 2026
 20:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260612045502.70850-1-mark.hsj@gmail.com> <77749c92-ac8a-4074-bb59-59dbbd3d84f2@kernel.org>
In-Reply-To: <77749c92-ac8a-4074-bb59-59dbbd3d84f2@kernel.org>
From: Mark Harris <mark.hsj@gmail.com>
Date: Mon, 15 Jun 2026 20:53:43 -0700
X-Gm-Features: AVVi8Cd4raoYDRl8sd8Ez29J95vLZ0TsIDB8FDpnGx6elyrE-80rk9iKlefnU1w
Message-ID: <CAMdZqKEpxT3vzE97LbaxP9grg5wi3aeArzgdyORHyGz=ZsDe0g@mail.gmail.com>
Subject: Re: [PATCH] riscv: hwprobe: Avoid uninitialized read in hwprobe_get_cpus()
To: Michael Ellerman <mpe@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_205358_978587_74BB629F 
X-CRM114-Status: GOOD (  20.51  )
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

Michael Ellerman wrote:
>
> On 12/6/26 2:55 pm, Mark Harris wrote:
> > When cpusetsize < cpumask_size(), hwprobe_get_cpus() did not fully
> > initialize its copy of the cpu mask, which could cause non-deterministic
> > results from the riscv_hwprobe syscall on a system with more than 8 CPUs
> > when the supplied cpu mask is empty.  Address this by fully initializing
> > the cpu mask.
> >
> > Signed-off-by: Mark Harris <mark.hsj@gmail.com>
> > ---
> >   arch/riscv/kernel/sys_hwprobe.c | 1 +
> >   1 file changed, 1 insertion(+)
>
> This should have a fixes tag, I think it's:
>
> Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")

Yes, that looks correct.

>
> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> > index 1659d31fd288..caf6762427c8 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -450,6 +450,7 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
> >       if (cpusetsize > cpumask_size())
> >               cpusetsize = cpumask_size();
> >
> > +     cpumask_clear(&cpus);
> >       ret = copy_from_user(&cpus, cpus_user, cpusetsize);
> >       if (ret)
> >               return -EFAULT;
>
> cpus is on the stack, and is copied back out at the end of the function,
> so this looks like it could be a stack info leak.
>
> But the copy back is also bounded by cpusetsize, so in fact there is not
> any leak of uninitialised stack out to userspace:
>
>          ret = copy_to_user(cpus_user, &cpus, cpusetsize);
>          if (ret)
>                  return -EFAULT;

It can leak 1 bit of information from the kernel stack.  For example
with 16 CPUs, all online, if a 1-byte 0x00 mask is supplied, the
caller can determine whether the second (uninitialized) mask byte is
zero or non-zero due to the cpumask_empty(&cpus) check.

 - Mark

>
> Reviewed-by: Michael Ellerman <mpe@kernel.org>
>
> cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
