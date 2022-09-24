Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE8EC07E9D
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Sep 2022 10:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OcFpioAiV+vQRPumc94+LHzGiTP+EZIucPDUiC5TkEc=; b=Sl7g+gVoAZNO80
	jDr9nYxG+E+8ZUfag1Ptg5UwYCusa+AmNabeRM0bRQIFd95RxYKkMPxkQfaMhpTagfpdPB+gHBfS4
	iZ/AbpYC09Fio255j+/1KCAH6TV+OYwkVWHZCe3BrRTWC887WqlU20a4X098LkJsms6fhUKsh3S2N
	eMQKmThwEdXlu8j3pSDxztc8SW6NTdgNd4Xbd00dU4mOx9gKxA+Y/WzhU1qru8p81uRgUIGWWtFSY
	NxzOPuCPNtpZdABrmVh2xPD/SSyptrL2kM0aXOuJg9oOEKXmjsergcsPxIWsTjOCHpPttpgcs17eO
	IfOxR9myau15IW79IeHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc2qJ-006vGt-Dq; Sat, 24 Sep 2022 10:57:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc2q8-006vF6-Oi; Sat, 24 Sep 2022 10:56:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3EBCCB80DD4;
	Sat, 24 Sep 2022 10:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23FAC433C1;
	Sat, 24 Sep 2022 10:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664017012;
	bh=V4Q7joVq4Vh28mV5JoGwZY9Fr4z3XEyNHjibZkJ6xM4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=smexMUyuiIOm0DxrzLY8Q6/UEcrVcwDVLczyzxgwr6UfesLefjHrbfgDUJxC9rFxu
	 28Q5UeEKpgJHfkrqpWu3ciTJpX5ROGoFmshZqx+REueLGUHOhJWPMznd6YsXRdgcIX
	 hQhHABl2MY0tNU7hd9u4xMA5kKwc7+oCDxvyIB7wRraPAyVIS1IgIVJXPDgWNIcqwv
	 2+7OpPmbFcWHADNbW7nn2LglZVOyyWX+P9IOpcPER+5wbIQx0UXaagWB6hp9oU+aCM
	 KjoHQ8i5l9PStqCI+SqTXzd0ofI+0yI4Cn1VyCINNESK+vIWRrnm27ya3QkvVR9Reg
	 ToT5tun131nxw==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-130bd20fae6so3424851fac.9;
        Sat, 24 Sep 2022 03:56:52 -0700 (PDT)
X-Gm-Message-State: ACrzQf3eMXqjZhu8m8PoII/J1e9ynPNoh6CayEqZQ15JgErqzSTo4kp9
	0niBo41W/igkypsGk8kJzj3j7tDGRUntVVvKRJo=
X-Google-Smtp-Source: AMsMyM7okz2g4+Eu8G2Vgq5ZMGTyNCaXzvu5bWg1+8D0MA3PwS8EAeFcqVNA5Op6Tyhd+HCgMYihgYioopETaTo0aSQ=
X-Received: by 2002:a05:6870:5803:b0:12c:c3e0:99dc with SMTP id
 r3-20020a056870580300b0012cc3e099dcmr13275175oap.19.1664017012091; Sat, 24
 Sep 2022 03:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220921033134.3133319-1-guoren@kernel.org> <20220921033134.3133319-4-guoren@kernel.org>
 <5594014.Sb9uPGUboI@phil>
In-Reply-To: <5594014.Sb9uPGUboI@phil>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 24 Sep 2022 18:56:39 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQqWFfcJsAn_UPaXVdC6HQecnLyFPBOrnpxrJfWJMsOeQ@mail.gmail.com>
Message-ID: <CAJF2gTQqWFfcJsAn_UPaXVdC6HQecnLyFPBOrnpxrJfWJMsOeQ@mail.gmail.com>
Subject: Re: [PATCH V4 3/3] arch: crash: Remove duplicate declaration in smp.h
To: Heiko Stuebner <heiko@sntech.de>
Cc: xianting.tian@linux.alibaba.com, palmer@dabbelt.com, palmer@rivosinc.com, 
	liaochang1@huawei.com, jszhang@kernel.org, arnd@arndb.de, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220924_035657_129140_47365B95 
X-CRM114-Status: GOOD (  19.32  )
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

On Fri, Sep 23, 2022 at 7:00 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Am Mittwoch, 21. September 2022, 05:31:34 CEST schrieb guoren@kernel.org:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Remove crash_smp_send_stop declarations in arm64, x86 asm/smp.h which
> > has been done in include/linux/smp.h.
>
> nit: the commit message could reference the commit that brought in the
> generic declarations, which was
>         6f1f942cd5fb ("smp: kernel/panic.c - silence warnings")
Good advice, thx.

>
> other than that
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>
>
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > ---
> >  arch/arm64/include/asm/smp.h | 1 -
> >  arch/x86/include/asm/crash.h | 1 -
> >  2 files changed, 2 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> > index fc55f5a57a06..a108ac93fd8f 100644
> > --- a/arch/arm64/include/asm/smp.h
> > +++ b/arch/arm64/include/asm/smp.h
> > @@ -141,7 +141,6 @@ static inline void cpu_panic_kernel(void)
> >   */
> >  bool cpus_are_stuck_in_kernel(void);
> >
> > -extern void crash_smp_send_stop(void);
> >  extern bool smp_crash_stop_failed(void);
> >  extern void panic_smp_self_stop(void);
> >
> > diff --git a/arch/x86/include/asm/crash.h b/arch/x86/include/asm/crash.h
> > index 8b6bd63530dc..6a9be4907c82 100644
> > --- a/arch/x86/include/asm/crash.h
> > +++ b/arch/x86/include/asm/crash.h
> > @@ -7,6 +7,5 @@ struct kimage;
> >  int crash_load_segments(struct kimage *image);
> >  int crash_setup_memmap_entries(struct kimage *image,
> >               struct boot_params *params);
> > -void crash_smp_send_stop(void);
> >
> >  #endif /* _ASM_X86_CRASH_H */
> >
>
>
>
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
