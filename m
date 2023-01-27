Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3911C38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 13:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5m5TF8f9EwvYzYOSo3EJKR0RLDHA4C79MzONvpFdYxo=; b=IqnzS5VCB0SDsW
	rL9pFRomky9loW/e9dXKH9hHpfocT/liZI6MDsRhaF3NTtvK5FrvoXJSjN+3SfGH1E43gXbO5byy8
	iyiH+qTGmCAtEWcZ8vnDKxeJcYXn+CqpaM6uqSeaGXtxkqd0xr0cGq+AK2mwbuWHKHqArJP+mEvpE
	FOsdh8l6GhucIr84jgBjQoWyiksTX+g5fipBb9VYoiGPkdF0/wALc6F9eg8zgTVgBWm3HcXj2UJpP
	Oo9sdcTQWEMj34AJhbs8RVfDSkf3N/bPVQYDA77jhz8J9JtrWTly+gf3ZE3P95aGG4sImFGIVupn/
	RoCxvzqKds0EKZ+5ou3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOcL-00Evsv-ON; Fri, 27 Jan 2023 13:18:09 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLO02-00Ed49-C6
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 12:38:35 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id p10so686850vsu.5
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 04:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=76/Qo0p/UxKI75yKdBSKj64ShK7ggokQHoWD6X+9VHg=;
        b=Hszngf222LTCIZHcJU1fcQ3FtMpp0R2eOQm3OvoYjsDNqUd9DWcmWOy+/4fg78+HsO
         8XFpqun0Ueoj6fmd17AWt7K/6W2VW1sD/tmGPEQcv4nIf9Gt3HuB0Vnhk/IwXI1pSYGJ
         BPZXC2Km1XXz633t+U9T88H2NhD1Xhj19dWgOmKi0Ec6TgvVDAHSMWw0oEdfg5mMiwUp
         QFM3/gIYS3j1sl3Pz9WOlt/pZg66CUZmDctaZTQiyqh4feNu+YQconFv4gttY67JPn67
         yOiZvxB6QYbnHv4Q60G40Qo4FX7HK0lwkbFRczhuBipr3M3bs+35aM8GDrCkk65hkX7y
         amzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76/Qo0p/UxKI75yKdBSKj64ShK7ggokQHoWD6X+9VHg=;
        b=BdIlmAgx3E0G5jZpECw6GnrbVz8LrIKqUScUrkklK3tEAdo+ddL749sGuF4NO/k0f3
         I1PKjDuCLdJmApsSBUYugiSo5eb85gm94sKgS+0e46V3xZnoFcg1mDMvT0SXvEYBaS2m
         wTj7tI23d031yQzSo1lwEGErq5qDG4jJ4MHxIp/wdVzGoaYrThWbRXW0+jcYLr22MJCt
         VpfZTWQx9rGr/VbbRlVrtrr0LxIiMNm/i420yutF5tlPQBeQog4akFbicIfhQ7kgz0eR
         2zq6EPtwdNnn62u+MA/ukaVIfIKm5OXx5mwbGY2GbN8w4xFLkFr/pJEnpJLLCz2lKiT5
         Y2SA==
X-Gm-Message-State: AFqh2krKlhzdZ0FowqYYbbmFzgzMPxoypyRtv0UZ5uPN+yG8f9JYsqFi
	xRM70SsnD/sGrIfhoIAqyJWgQ35FdM4xDHB2uQRHQtLbDXMmWg==
X-Google-Smtp-Source: AMrXdXvc0q+iLQCnU6T6GYjXCaxLciz1aBj2XVRZ5Wl7IH4DhMufJ5y3L690UwNsvqdwM9Ay5ls2J7TzC6BW9BtSReM=
X-Received: by 2002:a05:6102:3134:b0:3d3:d816:c798 with SMTP id
 f20-20020a056102313400b003d3d816c798mr4972887vsh.59.1674823110815; Fri, 27
 Jan 2023 04:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20230112140304.1830648-1-apatel@ventanamicro.com>
 <20230112140304.1830648-3-apatel@ventanamicro.com> <20230126160234.pkx4socjv3fcxpmn@orel>
In-Reply-To: <20230126160234.pkx4socjv3fcxpmn@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 27 Jan 2023 18:08:19 +0530
Message-ID: <CAK9=C2X3=GZ1KDhHOAY2Mk+=uYAqSMVSYEQkWizm2=VgF_ynXw@mail.gmail.com>
Subject: Re: [PATCH 2/7] RISC-V: Detect AIA CSRs from ISA string
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_043834_434584_633D0C18 
X-CRM114-Status: GOOD (  22.26  )
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

On Thu, Jan 26, 2023 at 9:32 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Jan 12, 2023 at 07:32:59PM +0530, Anup Patel wrote:
> > We have two extension names for AIA ISA support: Smaia (M-mode AIA CSRs)
> > and Ssaia (S-mode AIA CSRs).
> >
> > We extend the ISA string parsing to detect Smaia and Ssaia extensions.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 8 ++++++++
> >  arch/riscv/kernel/cpu.c        | 2 ++
> >  arch/riscv/kernel/cpufeature.c | 2 ++
> >  3 files changed, 12 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index 86328e3acb02..c649e85ed7bb 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -59,10 +59,18 @@ enum riscv_isa_ext_id {
> >       RISCV_ISA_EXT_ZIHINTPAUSE,
> >       RISCV_ISA_EXT_SSTC,
> >       RISCV_ISA_EXT_SVINVAL,
> > +     RISCV_ISA_EXT_SSAIA,
> > +     RISCV_ISA_EXT_SMAIA,
>
> These will change a couple different ways due other other patches in
> flight, but let's put the pair in alphabetical order now so they get
> moved together that way.

Okay, I will update.

>
> >       RISCV_ISA_EXT_ID_MAX
> >  };
> >  static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
> >
> > +#ifdef CONFIG_RISCV_M_MODE
> > +#define RISCV_ISA_EXT_SxAIA          RISCV_ISA_EXT_SMAIA
> > +#else
> > +#define RISCV_ISA_EXT_SxAIA          RISCV_ISA_EXT_SSAIA
> > +#endif
>
> This isn't used in this patch, so should probably be introduced in a later
> patch when it is.

Okay, I will move this to the patch where it is used.

>
> > +
> >  /*
> >   * This enum represents the logical ID for each RISC-V ISA extension static
> >   * keys. We can use static key to optimize code path if some ISA extensions
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 1b9a5a66e55a..a215ec929160 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -162,6 +162,8 @@ arch_initcall(riscv_cpuinfo_init);
> >   *    extensions by an underscore.
> >   */
> >  static struct riscv_isa_ext_data isa_ext_arr[] = {
> > +     __RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> > +     __RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> >       __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> >       __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> >       __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 93e45560af30..3c5b51f519d5 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -228,6 +228,8 @@ void __init riscv_fill_hwcap(void)
> >                               SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
> >                               SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> >                               SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> > +                             SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
> > +                             SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
> >                       }
> >  #undef SET_ISA_EXT_MAP
> >               }
> > --
> > 2.34.1
> >
>
> Otherwise,
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
