Return-Path: <SRS0=wY1U=HS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F92C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 11:25:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2136064DA5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 11:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2136064DA5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pUFrW9CocC912e7XX9svthhC0zM5oQBxgHLWdU5HJJI=; b=loRKnEZiMmugMaAqGt5eow5Ez
	wtc4Pv8SjCAJHg24VBqyOQveeP7v3d7yVEvj4KWHfx7z6E0xychZi2/hySBTrzf50JV5bS6rVX2ip
	KIoix68Byq9k4ak4O2DkBHIAfRpORpr90dDa0kK6y0HJdp7d5b+g1U/Nix41bAtvFbPdYqeLDcHkB
	53uGO/02XZGxSLcq91pdNQ7SL/hTcfXfFWHwjoo5YR1u3vFheigEl1CAYp8dUrSYNzrTmyoOxxGEU
	KQmwvSf4K5VBe0m6Ve6bZhw+SXi+f4pFKjQihzuk5zYAOykh6dfea7ZTy+jbslL0x8djrKnxoNeWM
	K8DRuCr1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lByUD-0005lC-D4; Tue, 16 Feb 2021 11:25:45 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lByUB-0005kN-8P
 for linux-riscv@lists.infradead.org; Tue, 16 Feb 2021 11:25:44 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d3so6801175qtr.10
 for <linux-riscv@lists.infradead.org>; Tue, 16 Feb 2021 03:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OpdMgD15nVOmxBqHmgQp5QV05JlNNLMOu1zTK5wectk=;
 b=BJlVkeg+KiYKigJv0dLocm82YBRds4Ze0jh0m/e1C4EWOqEFjdkvw84Sy7UTocnkSP
 7JOD+hiV/AhOYlEahswG+drBrVpdQtpxC1+dlJNJxM4GLAWIVkzcn4FNpO6gfLpicS/C
 ltsSOxMyOOjQtylvk7nP1UVZyj/sTEh6vHZUpkYFV37aYfCTkpt+vy/gJS5dxcxuvqTt
 KB/tTD0d72xBCF68FnY8LslS+Vnlxl3OnQTVrVwDPMHJp1uxmg63+gfuHup/+mc2gQdi
 +tWjbjdhol1lp+S5UW5I+3ruWIP+E3U5gNtjhiqwYauzIl0h8Og4Gh+PKIJ8pEm25uOy
 9Tog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OpdMgD15nVOmxBqHmgQp5QV05JlNNLMOu1zTK5wectk=;
 b=ELHULBj0b5lHyEhw2MHlsvYKhU663O+A8W3brg91A3C8gxHCY5NvOhRPjqUVjVzo16
 TswAtQzlb7qibxoczP72KdQbZIYIKnrOfXxGNKrYOlwke68k6M15KoGxmzF9gZ9H/Jzu
 MLPNe0eKBEDWFqeXQp0+nAv6VYrv2bTSMt4/vLiP3OobRZcPRU7qDN1j5p9BdfN1H4Mc
 /MR8gLjmqVFCNrbTcRY5LDqQtNIzDsTjBV0eZIeYX1kgrH5z7D4RdOrFpipH6CTLYbbw
 RTF11bjqBNyk2VAwHLAtNldBuSEIPugr56tWJ+jcNADELlR8u7q+ajbn8h9G3v9sOwxu
 nH+w==
X-Gm-Message-State: AOAM530Q5BJCNfGvDzWQvgvcGWIqdYKcJC6v7eDntuaoloFqwyTNG0Dk
 ve/9KVAqP800su/PraaA98GeRFxlPJcKTCLIfku52w==
X-Google-Smtp-Source: ABdhPJwpW1GE+h0hCdOCxpmjTvpVz2L9jJNy9DdTONweY3+hgOg8KMJs8pE5xCd0rshQ3wiZ9zidYh4Xdpp/YWRYGQg=
X-Received: by 2002:aed:3647:: with SMTP id e65mr9003272qtb.43.1613474740157; 
 Tue, 16 Feb 2021 03:25:40 -0800 (PST)
MIME-Version: 1.0
References: <CACT4Y+bDqMiC+ou5ghb=XB3Oyjw3p-GTDvNw4NkkQqQthw1yuQ@mail.gmail.com>
 <mhng-02b88d43-ede8-48f9-82f1-c84201acb7a8@palmerdabbelt-glaptop>
 <CACT4Y+aN3LvgaBc_zmW=t=D7ChU-jrWYnjt5sZ2GEDQhg_BC9A@mail.gmail.com>
 <CACT4Y+aC19DaNOm87EO3cER2=MEmO9pmtUxzVmRtg9YhZKuMVA@mail.gmail.com>
 <20210118145310.crnqnh6kax5jqicj@distanz.ch>
 <CACT4Y+bFV6m1LCYb1nO7ioKJK99916D76sJ+H-LgBjWx6biF5w@mail.gmail.com>
 <CACT4Y+bmDKNnykeTP9yKjje3XZjbXY3De+_e3fMFOMoe0dnARw@mail.gmail.com>
 <6e9ee3a1-0e16-b1fc-a690-f1ca8e9823a5@ghiti.fr>
 <CACT4Y+adSjve7bXRPh5UybCQx6ubOUu5RbwuT620wdcxHzVYJg@mail.gmail.com>
 <CACT4Y+ZNJBnkKHXUf=tm_yuowvZvHwN=0rmJ=7J+xFd+9r_6pQ@mail.gmail.com>
In-Reply-To: <CACT4Y+ZNJBnkKHXUf=tm_yuowvZvHwN=0rmJ=7J+xFd+9r_6pQ@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 16 Feb 2021 12:25:28 +0100
Message-ID: <CACT4Y+awHrJfFo+g33AiAnCj3vq6t6PqbL-3=Qbciy6dAJfVWg@mail.gmail.com>
Subject: Re: riscv+KASAN does not boot
To: Alex Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_062543_383886_C5B47671 
X-CRM114-Status: GOOD (  30.08  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Bjorn Topel <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 nylon7@andestech.com, syzkaller <syzkaller@googlegroups.com>,
 Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 16, 2021 at 12:17 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Fri, Jan 29, 2021 at 9:11 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> > > I was fixing KASAN support for my sv48 patchset so I took a look at your
> > > issue: I built a kernel on top of the branch riscv/fixes using
> > > https://github.com/google/syzkaller/blob/269d24e857a757d09a898086a2fa6fa5d827c3e1/dashboard/config/linux/upstream-riscv64-kasan.config
> > > and Buildroot 2020.11. I have the warnings regarding the use of
> > > __virt_to_phys on wrong addresses (but that's normal since this function
> > > is used in virt_addr_valid) but not the segfaults you describe.
> >
> > Hi Alex,
> >
> > Let me try to rebuild buildroot image. Maybe there was something wrong
> > with my build, though, I did 'make clean' before doing. But at the
> > same time it worked back in June...
> >
> > Re WARNINGs, they indicate kernel bugs. I am working on setting up a
> > syzbot instance on riscv. If there a WARNING during boot then the
> > kernel will be marked as broken. No further testing will happen.
> > Is it a mis-use of WARN_ON? If so, could anybody please remove it or
> > replace it with pr_err.
>
>
> Hi,
>
> I've localized one issue with riscv/KASAN:
> KASAN breaks VDSO and that's I think the root cause of weird faults I
> saw earlier. The following patch fixes it.
> Could somebody please upstream this fix? I don't know how to add/run
> tests for this.
> Thanks
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 0cfd6da784f84..cf3a383c1799d 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -35,6 +35,7 @@ CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
>  # Disable gcov profiling for VDSO code
>  GCOV_PROFILE := n
>  KCOV_INSTRUMENT := n
> +KASAN_SANITIZE := n
>
>  # Force dependency
>  $(obj)/vdso.o: $(obj)/vdso.so



Second issue I am seeing seems to be related to text segment size.
I check out v5.11 and use this config:
https://gist.github.com/dvyukov/6af25474d455437577a84213b0cc9178

Then trying to boot it using:
QEMU emulator version 5.2.0 (Debian 1:5.2+dfsg-3)
$ qemu-system-riscv64 -machine virt -smp 2 -m 4G ...

It shows no output from the kernel whatsoever, even though I have
earlycon and output shows very early with other configs.
Kernel boots fine with defconfig and other smaller configs.

If I enable KASAN_OUTLINE and CC_OPTIMIZE_FOR_SIZE, then this config
also boots fine. Both of these options significantly reduce kernel
size. However, I can also boot the kernel without these 2 configs, if
I disable a whole lot of subsystem configs. This makes me think that
there is an issue related to kernel size somewhere in
qemu/bootloader/kernel bootstrap code.
Does it make sense to you? Can somebody reproduce what I am seeing?

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
