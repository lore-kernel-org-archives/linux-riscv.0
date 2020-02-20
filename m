Return-Path: <SRS0=e4Tc=4I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16E6C7619D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2020 02:31:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B147524656
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2020 02:31:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lTalJQxx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="drmlXiSW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B147524656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ls/ZKFAF7ugD71hWN/JId7rd8jqPH9VsW9pzroBDDQc=; b=lTalJQxxkDTARi/m67lZmog7u
	x7C6vTU+ygdnOZYMhKgx3+gqeErYGjmf9qp5Lj0RGToLO32w8roU6ekFOPzHjBYwIbaxw0S8/g0Y+
	c5lblc9lKnL5nG+GbcxZqRtRljTmQJ19IBIX4GXNhiwaSFQndc55jqKCZrJjDhKBX69RkQ2RN0tOr
	Ei7mSfgr4gn+tLH6axCry+sPZn9j8tI2uoR7GoUbw0yXi8wUmya7ngSiJb/qgLEHm/5v6R3nxlPqx
	yKTwVh9S4iPeRXWbGkOQdsRIDKESJnNfjbI2Lg81fMrD8GvdiEx0tCOSUo2yp+ci413rwu10qeNBa
	IkXidJdRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4bcg-00018G-CM; Thu, 20 Feb 2020 02:31:30 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4bcd-00017v-QW
 for linux-riscv@lists.infradead.org; Thu, 20 Feb 2020 02:31:29 +0000
Received: by mail-qt1-x843.google.com with SMTP id d9so1823809qte.12
 for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2020 18:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ls/ZKFAF7ugD71hWN/JId7rd8jqPH9VsW9pzroBDDQc=;
 b=drmlXiSWoTZ9a8ZniEMqY+W6fLq0k5Tj99bA4KfGJVptEv5BJdXIPPK8cbto1PPBQX
 pcWXa+OuKzaYj+g28YagKDU6ATmorDKy9hfy2F/SR/iNlN+pWx6IYddYByTC4sb53up4
 YrbTfFMkTzEEz8C7lsqe81JMeFO8fePMz4iL1z5x+ccuPaGtY5F/7ML3o0ZzSgrYr5Vi
 CtVD8FR6v1QrKja+c2pnkhfOKq5bMh2el+RkTvf0AwOIcVweElKfRVgoK+qQL6L2hNkT
 oYoPvflXoO7Ku7Rq+1zIJrAngMJFRz7OCMJ02xIzOI0cm+RY18j/pIkVHg1aMXOXjyou
 B/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ls/ZKFAF7ugD71hWN/JId7rd8jqPH9VsW9pzroBDDQc=;
 b=J7JoAu+hJsnYKMhULBzITbbttkNSUsdI4QGwlYSgIQjGM4k5KyvJX+c9H76Q6fV0Zm
 /RoXZfWjQZ8QBZVIuxXIMoVGEC1SW6j5HO4mW27QISeRciTEDccVPkBySqgMiL3AHyXL
 y96rP5yMkHYAn489kjIjBRHR/J6xjQTiC7Z9dgdrFQA8Sq58x5116ANPnZ32H6ryUNnt
 QwoaTjADOG+X1Ucbvs7Zi85Rvga4k/jTixY7OPmtkfR2kQ4FEmmwRJ8885uhTsVoNTUA
 4IMBQzGGaFuDs3gHNqNJ7xsyXoHZ+uXDmNrJPLoKXN5j0Q3mhafHUbNoWU/UX3TK2cOo
 1bzA==
X-Gm-Message-State: APjAAAW8oZ45kafBkeRkA4lNYEyYDMbns4ABxktLwRh03MZOhT49DLeB
 gVMVPEY3bE04RsBCWt2v2rKgmslPI/byOxvzJezjRQ==
X-Google-Smtp-Source: APXvYqzIjwpz/1Q+C/J+8RTlUoq+oNMkswNIVZArZ8LPph8cv2VX9sNM//0lLv30UFUZvZjsnBjxVfwxREugpYCrWss=
X-Received: by 2002:ac8:33f8:: with SMTP id d53mr24338845qtb.86.1582165886561; 
 Wed, 19 Feb 2020 18:31:26 -0800 (PST)
MIME-Version: 1.0
References: <1582097304-5547-1-git-send-email-vincent.chen@sifive.com>
 <1582097304-5547-2-git-send-email-vincent.chen@sifive.com>
 <b58183d5-a7db-3902-100f-8f4f0d06c148@ghiti.fr>
 <CADnnUqcnOw1svnEYhb0O-q_TvTJQH3MuR2o8nrqNedQogoQbbg@mail.gmail.com>
In-Reply-To: <CADnnUqcnOw1svnEYhb0O-q_TvTJQH3MuR2o8nrqNedQogoQbbg@mail.gmail.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 20 Feb 2020 10:31:15 +0800
Message-ID: <CABvJ_xgvCwk+3NYziJdA_5F6g3zZZp2BzBw2qBhujQHfzvDf9Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: avoid the PIC offset of static percpu data in
 module beyond 2G limits
To: Carlos Eduardo de Paula <me@carlosedp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_183127_864857_8FCE306D 
X-CRM114-Status: GOOD (  25.54  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>, deanbo422@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 20, 2020 at 6:43 AM Carlos Eduardo de Paula
<me@carlosedp.com> wrote:
>
> On Wed, Feb 19, 2020 at 2:53 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
> >
> > Hi Vincent,
> >
> > On 2/19/20 8:28 AM, Vincent Chen wrote:
> > > The compiler uses the PIC-relative method to access static variables
> > > instead of GOT when the code model is PIC. Therefore, the limitation of
> > > the access range from the instruction to the symbol address is +-2GB.
> > > Under this circumstance, the kernel cannot load a kernel module if this
> > > module has static per-CPU symbols declared by DEFINE_PER_CPU(). The reason
> > > is that kernel relocates the .data..percpu section of the kernel module to
> > > the end of kernel's .data..percpu. Hence, the distance between the per-CPU
> > > symbols and the instruction will exceed the 2GB limits. To solve this
> > > problem, the kernel should place the loaded module in the memory area
> > > [&_end-2G, VMALLOC_END].
> > >
> > > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > > Suggested-by: Alex Ghiti <alex@ghiti.fr>
> > > Suggested-by: Anup Patel <anup@brainfault.org>
> > >
> > > ---
> > >   arch/riscv/kernel/module.c | 18 ++++++++++++++++++
> > >   1 file changed, 18 insertions(+)
> > >
> > > diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> > > index b7401858d872..c498beb82369 100644
> > > --- a/arch/riscv/kernel/module.c
> > > +++ b/arch/riscv/kernel/module.c
> > > @@ -8,6 +8,10 @@
> > >   #include <linux/err.h>
> > >   #include <linux/errno.h>
> > >   #include <linux/moduleloader.h>
> > > +#include <linux/vmalloc.h>
> > > +#include <linux/sizes.h>
> > > +#include <asm/pgtable.h>
> > > +#include <asm/sections.h>
> > >
> > >   static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
> > >   {
> > > @@ -386,3 +390,17 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> > >
> > >       return 0;
> > >   }
> > > +#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
> > > +#ifdef CONFIG_MAXPHYSMEM_2GB
> > > +#define VMALLOC_MODULE_START \
> > > +     max(PFN_ALIGN((unsigned long)&_end - SZ_2G), VMALLOC_START)
> > > +#else
> > > +#define VMALLOC_MODULE_START PFN_ALIGN((unsigned long)&_end - SZ_2G)
> > > +#endif
> >
> > I would use the same definition for both cases:
> >
> > #define VMALLOC_MODULE_START \
> >         max(PFN_ALIGN((unsigned long)&_end - SZ_2G), VMALLOC_START)
> >
> > as it avoids ifdefs and amounts to the same. And maybe you can avoid the
> > definition of VMALLOC_MODULE_START at the same time.
> >
> > > +void *module_alloc(unsigned long size)
> > > +{
> > > +     return __vmalloc_node_range(size, 1, VMALLOC_MODULE_START,
> > > +     VMALLOC_END, GFP_KERNEL, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> > > +     __builtin_return_address(0));
> > > +}
> > > +#endif
> > >
> >
> > It's weird checkpatch does not complain about the alignment of those lines.
> >
> > Otherwise, I have just tested it and it works, so you can add:
> >
> > Tested-by: Alexandre Ghiti <alex@ghiti.fr>
> >
> > Thanks,
> >
> > Alex
> >
>
> Thanks for the patch, applied on v5.5.0 and v5.6.0-rc2. Worked fine on
> Qemu and Unleashed:
>
> root@debian10-riscv64:~# sudo modprobe openvswitch
> [  124.257220] openvswitch: Open vSwitch switching datapath
>
> root@debian10-riscv64:~# modprobe br_netfilter
> [  193.168269] Bridge firewalling registered
>
> root@debian10-riscv64:~# lsmod
> Module                  Size  Used by
> br_netfilter           23054  0
> bridge                217063  2 br_netfilter
> stp                     2891  1 bridge
> llc                     5968  2 bridge,stp
> openvswitch           197057  0
> nsh                     3501  1 openvswitch
> nf_conncount           11362  1 openvswitch
> nf_nat                 39088  1 openvswitch
> nf_conntrack          143270  3 nf_nat,openvswitch,nf_conncount
> nf_defrag_ipv6         10091  2 nf_conntrack,openvswitch
> nf_defrag_ipv4          2410  1 nf_conntrack
> ip_tables              16409  0
>
> If desired, add:
>
> Tested-by: Carlos de Paula <me@carlosedp.com>

Thank you for testing this patch, I will add it.

Vincent Chen

