Return-Path: <SRS0=/HzI=OC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7FDC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Sep 2021 00:11:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77D49611BF
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Sep 2021 00:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77D49611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GO6eXyOAfMBZqLqTs8JZsnppwFwaDb0c5vQLZBHJ/gI=; b=p+tYtJuXUXs1Kc
	Gva5aJtTy8qdZFPeuSziCD0Q4gQck2fcT7QtKYNTDvJkRAqnDmkgy3vElHNPylJ4JDLM7JSZgTvCL
	4HnxrAhq+RwGOTtFeHlSZBwBPWGmLzrtqUVzr6Takiu5n/XF+AtdSIhrN5UGaD+vmcABtNarRvgLK
	tD24ysBGIhP8K307m+CSHa+H91PaGJrBhdhnjIqMm+1Z6SsR1e6vpAOc8ebtLAQLyxNLnSTogOlHF
	xJUzi2lf1cC6VUeahE0NLSk5j/MLTJkZSk0TL0aupkcHTp1ap9zcvi/y3jNvBM5RHUjr4WhP4RnaV
	pQ98tSdzqZuqIjpPcUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPD53-00Fbne-8T; Sun, 12 Sep 2021 00:10:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPD4z-00Fbmo-B5
 for linux-riscv@lists.infradead.org; Sun, 12 Sep 2021 00:10:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7991611F0
 for <linux-riscv@lists.infradead.org>; Sun, 12 Sep 2021 00:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631405440;
 bh=rjXQJPoGjJXG/Hc2aV6Aw8sNh7EVkz9yWcAzCNbbEjs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eXuEzLq6GWHkqS3CpXkj35rzzLmxtu2nj5NqNytbZT/1eFTIsvL4Y4RTc/JBBAv3q
 rxBBSupQIwdCxZduZrnRITpU7VCaLA2MIi0fQOaTBaw4cnorgMbjtcqn8rXABv/LPA
 a2XvU4N/hAd7xNdxkcmcDE/h/OP3R7/KZC7qWCLZhuGseNlzFvGfgrltPlHAndUddF
 DkZ28vkxhg4a4AclC/WiGdgvGnuGGRlvN6/6GvyBno6TK8/StfVRE+hcC+28CYaTH4
 UwznNCQh89sEPHMiHR4nzmK+9xQPcEGQ5DMvKuqDZGrHz6OsXPXWu9zwtPW+fJv4zO
 69retl15t86nw==
Received: by mail-lj1-f172.google.com with SMTP id s3so9897330ljp.11
 for <linux-riscv@lists.infradead.org>; Sat, 11 Sep 2021 17:10:40 -0700 (PDT)
X-Gm-Message-State: AOAM533ooFLXwf2s0PBHdhKnArt3cSusLFoIxRH3vRHZbKALtXAc7I4n
 JUGviXa7dv77mGDWSj7Ny5N5pzVQdMJfz2shYng=
X-Google-Smtp-Source: ABdhPJyiHODPdJ5L+2w4cbm1L9+Glebe7aq/6/Mw/j2r8k2lENKIx6D84Fb19m9zndoBsG51bmqUM7eRWPUwrBRFmpM=
X-Received: by 2002:a2e:9ac7:: with SMTP id p7mr4002766ljj.72.1631405439084;
 Sat, 11 Sep 2021 17:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAFnufp0eVejrDJoGE900D2U5-9qi-srVEmPOc9zHC5mSH4DgLg@mail.gmail.com>
 <mhng-22e6331c-16e1-40cc-b431-4990fda46ecf@palmerdabbelt-glaptop>
In-Reply-To: <mhng-22e6331c-16e1-40cc-b431-4990fda46ecf@palmerdabbelt-glaptop>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 12 Sep 2021 08:10:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTJ8M5FpL4=PDnPQgrrPaLxVhsZCTO2rXqaOm6MEn=gnA@mail.gmail.com>
Message-ID: <CAJF2gTTJ8M5FpL4=PDnPQgrrPaLxVhsZCTO2rXqaOm6MEn=gnA@mail.gmail.com>
Subject: Re: [PATCH] riscv: use the generic string routines
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Matteo Croce <mcroce@linux.microsoft.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <Atish.Patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, 
 Bin Meng <bmeng.cn@gmail.com>, David Laight <David.Laight@aculab.com>, 
 Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210911_171041_457061_6FB72CB1 
X-CRM114-Status: GOOD (  24.64  )
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

On Sat, Sep 11, 2021 at 11:49 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Thu, 05 Aug 2021 03:31:04 PDT (-0700), mcroce@linux.microsoft.com wrote:
> > On Wed, Aug 4, 2021 at 10:40 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >>
> >> On Tue, 03 Aug 2021 09:54:34 PDT (-0700), mcroce@linux.microsoft.com wrote:
> >> > On Mon, Jul 19, 2021 at 1:44 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
> >> >>
> >> >> From: Matteo Croce <mcroce@microsoft.com>
> >> >>
> >> >> Use the generic routines which handle alignment properly.
> >> >>
> >> >> These are the performances measured on a BeagleV machine for a
> >> >> 32 mbyte buffer:
> >> >>
> >> >> memcpy:
> >> >> original aligned:        75 Mb/s
> >> >> original unaligned:      75 Mb/s
> >> >> new aligned:            114 Mb/s
> >> >> new unaligned:          107 Mb/s
> >> >>
> >> >> memset:
> >> >> original aligned:       140 Mb/s
> >> >> original unaligned:     140 Mb/s
> >> >> new aligned:            241 Mb/s
> >> >> new unaligned:          241 Mb/s
> >> >>
> >> >> TCP throughput with iperf3 gives a similar improvement as well.
> >> >>
> >> >> This is the binary size increase according to bloat-o-meter:
> >> >>
> >> >> add/remove: 0/0 grow/shrink: 4/2 up/down: 432/-36 (396)
> >> >> Function                                     old     new   delta
> >> >> memcpy                                        36     324    +288
> >> >> memset                                        32     148    +116
> >> >> strlcpy                                      116     132     +16
> >> >> strscpy_pad                                   84      96     +12
> >> >> strlcat                                      176     164     -12
> >> >> memmove                                       76      52     -24
> >> >> Total: Before=1225371, After=1225767, chg +0.03%
> >> >>
> >> >> Signed-off-by: Matteo Croce <mcroce@microsoft.com>
> >> >> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >> >> ---
> >> >
> >> > Hi,
> >> >
> >> > can someone have a look at this change and share opinions?
> >>
> >> This LGTM.  How are the generic string routines landing?  I'm happy to
> >> take this into my for-next, but IIUC we need the optimized generic
> >> versions first so we don't have a performance regression falling back to
> >> the trivial ones for a bit.  Is there a shared tag I can pull in?
> >
> > Hi,
> >
> > I see them only in linux-next by now.
>
> These ended up getting rejected by Linus, so I'm going to hold off on
> this for now.  If they're really out of lib/ then I'll take the C
> routines in arch/riscv, but either way it's an issue for the next
> release.
Agree, we should take the C routine in arch/riscv for common
implementation. If any vendor what custom implementation they could
use the alternative framework in errata for string operations.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
