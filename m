Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14B7ECAAA1
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 10:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRXEAScQyt0ltz0yRJn7at5vtHhK/awph0P+jCKYGtA=; b=kTLJmCMAbOevNY
	DaKjJzAn1ZfaKl+fY0PNHBCh/J9c61pvgF4qlOFIVQxYqaG1XyFP5sIGBI/QSfM3jh1x5R9ReDS1P
	al5FnbySpDXU1VSz1ptz1vmpAPPvmN71nV/uILgKbdMYnwAhfvIAQAs+i61dv3uXT8ff/ase4QcbV
	5lrPcShPTAqEnoov2xO2o3FFm0l/tyvXzpDwCxCb41LFs8hYAyvYCTPGKXFX70p7fi+9rDEgVQYjD
	XO9yQ1CPfO4tNk9Xuu0R0ztGNMNsXDTp0LzLtAfxBNLRz7XBvxO5eYR6bA+TochyGPiSGEFKcUJFf
	ANt/cXVHr9Nh8qV8/s1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omuMo-000cPg-Bc; Mon, 24 Oct 2022 10:07:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omuMc-000cKT-Oi; Mon, 24 Oct 2022 10:07:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 70464B810B5;
	Mon, 24 Oct 2022 10:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF0FC43146;
	Mon, 24 Oct 2022 10:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666606041;
	bh=sHcd7a6CJYMXJN0T3O0Gmv4Ta3CAm5TN0dTsZcDGJ14=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ReZ2aXSu4iGUnECx43CmDCXR51jonPgXWttAkMbJ1vxW/RfZox0LtcML3bEU7c6D7
	 hdY6vFzKrPAA6r4Rm+e+K9hwkdX6VDQBN3H/19MwBbioinWgiIdaWnhaFmEg45/IOe
	 k8lDkDEQqTW4YPjEYFwOUXoRMUJLb0fRcW99YI6C7iH8dt/CzZ3ykwxv/iRXvKLaUR
	 hl5j4uzA33e/5/L/4GxfTd0EaJRBYEzeKNcQXqS2bEYHXJxQyEvvaPwkW6k+ORlR9B
	 JP/TPxwM/0BQiitncrp9Xhx3Y5OspSVCm1pgRk+AaXFrhkig3okDrlgpl/cmP8aYe3
	 7JiaGnT4JjCsw==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-13ae8117023so11263161fac.9;
        Mon, 24 Oct 2022 03:07:21 -0700 (PDT)
X-Gm-Message-State: ACrzQf3bUHoKSCBSylFWKZrvh8jz9C7DVOE2kKzNjOgTUBcoo6O533Bv
	j2bfWCKGnv7Pd1KfzENAQKapt2wjIkvEz6AQi50=
X-Google-Smtp-Source: AMsMyM7QXKv6uxTpUWFoPA/4LGtlOREZxkoYaz1p9CiCmnpdXChNo5b56CWYTdva7IGbg7H9Bi+XdpUjePtX7f4UGH0=
X-Received: by 2002:a05:6870:5803:b0:12c:c3e0:99dc with SMTP id
 r3-20020a056870580300b0012cc3e099dcmr35011449oap.19.1666606040276; Mon, 24
 Oct 2022 03:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221020135913.2850550-1-guoren@kernel.org> <Y1Fb4HGzJEKCD1SF@zn.tnic>
In-Reply-To: <Y1Fb4HGzJEKCD1SF@zn.tnic>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 24 Oct 2022 18:07:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR92khYqensUorjWTQz=8u9HSsbmwSa2FBWmRsUkoxJcA@mail.gmail.com>
Message-ID: <CAJF2gTR92khYqensUorjWTQz=8u9HSsbmwSa2FBWmRsUkoxJcA@mail.gmail.com>
Subject: Re: [PATCH] arch: crash: Remove duplicate declaration in smp.h
To: arnd@arndb.de, Borislav Petkov <bp@alien8.de>
Cc: tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com, 
	heiko@sntech.de, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, 
	Catalin Marinas <catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_030722_984245_F40A3064 
X-CRM114-Status: GOOD (  12.75  )
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

On Thu, Oct 20, 2022 at 10:32 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Thu, Oct 20, 2022 at 09:59:13AM -0400, guoren@kernel.org wrote:
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
>
> Acked-by: Borislav Petkov <bp@suse.de>
Thx.

Hi, Arnd

Because it crosses the architecture, could you take this in your next-tree?

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
