Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8FCC83F11
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 09:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yiLU1q3B0ycjmnuhttwPapuhQy4Q3vafm+MXBGDung=; b=eRJE1EP0exWP+F
	fiKD9Kyq7e8jDjJUjurEwZ3xZHfPwHNTKEImnidpkkrenMDhz8fZSyhbl0T22HsfmeP+QpQhRSJou
	WZu8GZPry1fRcUCkF3eas6XZM2dSWSBz+DPrsRfmURz8Dx7NRvrilLwgNn2wqFUaHk5rOmjgYaLOZ
	FMVJv4mvCicDGyGmuoXQ70I6FDyW0SIxbb2/jbNsWznwzd4iNw/zHNPfXh522CEFElXipwVFGhIfq
	BZ5M0hSiVpqjMI1vQSsF9EMlIvJUJDizXl7AxX5yFkx/I66+6WRqpNcWPHyvVVbA3Co5PWUyFKjLm
	uo3iRvBTGFLhZol1WPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCEd-007kXr-0U;
	Sun, 27 Aug 2023 09:39:07 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCEa-007kVM-1b
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 09:39:05 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe61ae020bso3429538e87.2
        for <linux-riscv@lists.infradead.org>; Sun, 27 Aug 2023 02:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693129142; x=1693733942;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DuIriem81nzRehAv+dIheh/q19YUwVhfdgY3JITm7p4=;
        b=f3lSYfat1xc+E0DiMIwo06EcY9tEwjZnpZXPEX8BjKoIbXe4LH1kplzBr7lcrRPR3D
         1sAvk8we8Le95ycbX+4lOFkD/6Hptvzt3F+0djra4Sq7mcJoSejp9DaMOSzkCHISeE6v
         EZ5EpoJ+0HBJ+C/9QY0K5WB5U2IBVIZ2J02fq4FgZK86gl12cedjZUx9r4el36wIEYZE
         kH3xN4BrbOyAonEpDn472wptkRnsIS6vTDsnI+y+rHO+EvEdJvpoRoi1AJXB7JU4sUzx
         QhrOMQkZlnpcajlG2oi62dRmnyL4rz8oSaEB8/5i7jOj9XUDLLLYqJrb5k8WDetFK2uw
         8r+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693129142; x=1693733942;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DuIriem81nzRehAv+dIheh/q19YUwVhfdgY3JITm7p4=;
        b=iqjCYxabi5ecQyMMdFQS6CqPn1y0lxrKFIrYHIJAx9hePJD4ns+7zx2c3MlqVKZgdj
         V1lrTG16S5xKXoVhRLealS+hHxNyMmJaSeFPjY1x4RvYJ412AC3oTsF1+0TtttRFGlE5
         ud03SfXa/MwliLSpP652lW6h7HSCiGH6NsLDWodAVrgzRKTlNuh1tFec1kx4M8W4OUgd
         dEwEeG8UFT5sQfefdTvEOuwTMKqyBHJPGPUQ+uThqbjO9CqJC1w6WyQJkB2D1kp6SAWM
         NJOvz/PJRghEqqO/tNsvz5tYbBBF2Wc4TA+B6nB94bmj3LoVgzMvY4aW/GhQeo4KeuSl
         3pgQ==
X-Gm-Message-State: AOJu0YyVdd05BLthfsZfPFMet5TpvxTjtrXl3e4l6TBtwdgxPgPNH1Y6
	LBYI8af93PZ2HObQTErWa/P7eSZC7ZE=
X-Google-Smtp-Source: AGHT+IEu4KedotAalNoGEFOjHUv8834Pj0IVdvHm0sooQIXz6DlODmHRjfdqI70WK+Y0LxJZUrqHxA==
X-Received: by 2002:a05:6512:32cc:b0:4fb:90c6:c31a with SMTP id f12-20020a05651232cc00b004fb90c6c31amr20053257lfg.14.1693129141642;
        Sun, 27 Aug 2023 02:39:01 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id v19-20020aa7d9d3000000b005256771db39sm3109860eds.58.2023.08.27.02.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 02:39:00 -0700 (PDT)
Date: Sun, 27 Aug 2023 11:39:00 +0200
From: Nam Cao <namcaov@gmail.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>,
	bpf@vger.kernel.org, Hou Tao <houtao@huaweicloud.com>,
	yonghong.song@linux.dev,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Puranjay Mohan <puranjay12@gmail.com>
Subject: Re: RISC-V uprobe bug (Was: Re: WARNING: CPU: 3 PID: 261 at
 kernel/bpf/memalloc.c:342)
Message-ID: <ZOsZtH+5P0/R6kvd@nam-dell>
References: <87jztjmmy4.fsf@all.your.base.are.belong.to.us>
 <87v8d19aun.fsf@all.your.base.are.belong.to.us>
 <ZOpAjkTtA4jYtuIa@nam-dell>
 <87cyz8sy4y.fsf@all.your.base.are.belong.to.us>
 <ZOsKukBz8i+h4Y8j@nam-dell>
 <87y1hw7t5p.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y1hw7t5p.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_023904_535528_1437A551 
X-CRM114-Status: GOOD (  22.18  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 27, 2023 at 11:04:34AM +0200, Bj=F6rn T=F6pel wrote:
> Nam Cao <namcaov@gmail.com> writes:
> =

> > On Sun, Aug 27, 2023 at 10:11:25AM +0200, Bj=F6rn T=F6pel wrote:
> >> The default implementation of is_trap_insn() which RISC-V is using cal=
ls
> >> is_swbp_insn(), which is doing what your patch does. Your patch does n=
ot
> >> address the issue.
> >
> > is_swbp_insn() does this:
> >
> >         #ifdef CONFIG_RISCV_ISA_C
> >                 return (*insn & 0xffff) =3D=3D UPROBE_SWBP_INSN;
> >         #else
> >                 return *insn =3D=3D UPROBE_SWBP_INSN;
> >         #endif
> >
> > ...so it doesn't even check for 32-bit ebreak if C extension is on. My =
patch
> > is not the same.
> =

> Ah, was too quick.
> =

> AFAIU uprobes *always* uses c.ebreak when CONFIG_RISCV_ISA_C is set, and
> ebreak otherwise. That's the reason is_swbp_insn() is implemented like
> that.

That's what I understand too.

> If that's not the case, there's a another bug, that your patches
> addresses.

I think it's a bug regardless. is_trap_insn() is used by uprobes to figure =
out
if there is an instruction that generates trap exception, not just instruct=
ions
that are "SWBP". The reason is because when there is a trap, but uprobes do=
esn't
see a probe installed here, it needs is_trap_insn() to figure out if the tr=
ap
is generated by ebreak from something else, or because the probe is just re=
moved.
In the latter case, uprobes will return back, because probe has already bee=
n removed,
so it should be safe to do so. That's why I think the incorrect is_swbp_ins=
n()
would cause a hang, because uprobes incorrectly thinks there is no ebreak t=
here,
so it should be okay to go back, but there actually is.

So, from my understanding, if uprobes encounter a 32-bit ebreak for any rea=
son,
the kernel would hang. I think your patch is a great addition nonetheless, =
but I
am guessing that it only masks the problem by preventing uprobes from seein=
g the
32-bit ebreak in the specific test, not really solve it. So, if there is a =
32-bit
ebreak in userspace, the bug still causes the kernel to hang.

I am still quite confident of my logic, so I would be very suprised if my f=
ix
doesn't solve the reported hang. Do you mind testing my patch? My potato of=
 a
laptop unfortunately cannot run the test :(

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
