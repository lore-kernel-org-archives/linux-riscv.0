Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46E5C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nJcesVB/Lr57BIYasiYbkheCneJHTFW6+AJe9q//Aw=; b=Fy7GxrbRlnwHH7
	2iEuE56wm7bNGn2DgeOkqNPbyQ/FyS4Q03hFrB35uxZH80s3V9pRlSq351fVis2Mx2DstTehWXfKP
	Z3sh5V9j+iAGBeh8w/UAX0vXKJmByWGd71Mqd71/gVghbMYwi060gI5Io2zb7i+IWUAPeCuiLmIXH
	RCZrWZRWBwmNsg4XXURbXn6I82w8fuFtGDxdreCl2pVA2QvUvDBS0zwBk4PTEKC+G2/vWPp8vL+Xf
	3rKdfHTqXqn1OqOJocSEwrSIAdv0IsP1sYJnxNmgtMAQO3MAYAO7SaoXsJHBtyNu4kD2wRfeH9lXh
	oah/PwaP/kpr3kM38IlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEteF-00CNDu-59; Tue, 01 Feb 2022 13:56:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEte2-00CNAy-KG; Tue, 01 Feb 2022 13:56:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9AA2B614F1;
 Tue,  1 Feb 2022 13:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B04C340EB;
 Tue,  1 Feb 2022 13:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643723789;
 bh=LR7K+KdhE8ua4Hf11bODf1Ipe6bgjP3NN3+/HtimckQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nULUMuvXkvrb2wx3h/E78ZWoev9tF1+n30y0uhd+VeL4suK4h/7PaBEhJdpbFimhZ
 eHq0ecvW4j9hpvDyoZLt082QO0YUiD4dzL5ypbtytbtJmn7imennsvXbabeHBBV/vB
 3HyaukGCDLsTs1HAwDF19bw+hwSBPkKz7r7PU1bCJuZxl9sFSOqZpTujWPyNpJr7z4
 SFGJYyGAlUcLKGJpL5WZ8M8ewKFW2/+hdSvUvDhleXoVNOU8+wdKNUvmjZ2EJo/7jc
 bNeohXIAvk6tn7PJhPBZ216d3Y87XjTjr7gYe/BUWcPiFfGHoxZ/8lWDlggv7ZX8Fr
 9cFvpFMp+gkng==
Received: by mail-vs1-f53.google.com with SMTP id g23so16163603vsf.7;
 Tue, 01 Feb 2022 05:56:29 -0800 (PST)
X-Gm-Message-State: AOAM532EJ0jiTtqpBZQTwwi5nNW6GhP48DC52Ty/jTg0z9Hd4BO/ojjE
 MaiIOXqvtchaucVBiiTY8cM/OgAio4UXLg/z1dc=
X-Google-Smtp-Source: ABdhPJySe8D0nEEAYvBRzFy6LwfvSeR3L3Y/oGIyxpX/nRoUeaoc3ecWWnv60QtmaYC3C4Lb9VuYZme6+tyqFZXZr7A=
X-Received: by 2002:a67:f94e:: with SMTP id u14mr10667024vsq.2.1643723788142; 
 Tue, 01 Feb 2022 05:56:28 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-17-guoren@kernel.org>
 <YffVZZg9GNcjgVdm@infradead.org>
 <CAJF2gTRXDotO1L1FMojQs6msrqvCzA782Pux8rg3AfZgA=y0ew@mail.gmail.com>
 <20220201074457.GC29119@lst.de>
 <CAJF2gTTc=zwD__zXwYbO8vmup5evWJtzyiAF9Pm-UVHLJRc5hQ@mail.gmail.com>
 <CAK8P3a2C7nDGQvopYzi1fe_LWyosp8t9dcBsduYK5k_s_OrCaA@mail.gmail.com>
 <CAJF2gTTgTzvGfa3nGzVo4C=fe+ZCGBWp=VhTMRt1vF1O1bnS5g@mail.gmail.com>
 <CAK8P3a3u8zo+MOOpDXaX8PY2ukN3J2VHnV8uDXQwc=0WgV6qFw@mail.gmail.com>
In-Reply-To: <CAK8P3a3u8zo+MOOpDXaX8PY2ukN3J2VHnV8uDXQwc=0WgV6qFw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 1 Feb 2022 21:56:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTtCboaEdC1MXkONUr1Nc6BcM4xM5tdE9t6_PiSdiGHLg@mail.gmail.com>
Message-ID: <CAJF2gTTtCboaEdC1MXkONUr1Nc6BcM4xM5tdE9t6_PiSdiGHLg@mail.gmail.com>
Subject: Re: [PATCH V4 16/17] riscv: compat: Add COMPAT Kbuild skeletal support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>, Christoph Hellwig <hch@infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>, 
 Drew Fustini <drew@beagleboard.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_055630_788661_EB47C4F0 
X-CRM114-Status: GOOD (  27.18  )
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

On Tue, Feb 1, 2022 at 7:48 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Feb 1, 2022 at 11:26 AM Guo Ren <guoren@kernel.org> wrote:
> >
> > Hi Arnd & Christoph,
> >
> > The UXL field controls the value of XLEN for U-mode, termed UXLEN,
> > which may differ from the
> > value of XLEN for S-mode, termed SXLEN. The encoding of UXL is the
> > same as that of the MXL
> > field of misa, shown in Table 3.1.
> >
> > Here is the patch. (We needn't exception helper, because we are in
> > S-mode and UXL wouldn't affect.)
>
> Looks good to me, just a few details that could be improved
>
> > -#define compat_elf_check_arch(x) ((x)->e_machine == EM_RISCV)
> > +#ifdef CONFIG_COMPAT
> > +#define compat_elf_check_arch compat_elf_check_arch
> > +extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
> > +#endif
>
> No need for the #ifdef
Okay

> > +}
>
> > +void compat_mode_detect(void)
>
> __init
Okay

>
> > +{
> > + unsigned long tmp = csr_read(CSR_STATUS);
> > + csr_write(CSR_STATUS, (tmp & ~SR_UXL) | SR_UXL_32);
> > +
> > + if ((csr_read(CSR_STATUS) & SR_UXL) != SR_UXL_32) {
> > + csr_write(CSR_STATUS, tmp);
> > + return;
> > + }
> > +
> > + csr_write(CSR_STATUS, tmp);
> > + compat_mode_support = true;
> > +
> > + pr_info("riscv: compat: 32bit U-mode applications support\n");
> > +}
>
> I think an entry in /proc/cpuinfo would be more helpful than the pr_info at
> boot time. Maybe a follow-up patch though, as there is no obvious place
> to put it. On other architectures, you typically have a set of space
> separated feature names, but riscv has a single string that describes
> the ISA, and this feature is technically the support for a second ISA.
Yes, it should be another patch after discussion.

>
>          Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
