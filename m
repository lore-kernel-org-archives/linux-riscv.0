Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF44C4743C
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 21:28:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8928461287
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 21:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8928461287
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+Xn/XSnRby5DGHHSbuUcMTrxYFi0OxpQL6/+KASzc0=; b=gBtSXNJw13qRhD
	UombHf5pE97p0cltigTQ2FCcWTgWseyIf29NfF0OUoxgOejBMfkoYU6wryyS3bKeYkn2mOnSql5Vc
	+ITr/Gtaj1IIdmfhcULq/8Uk1EKn+zf9ybRd03Yk502GEhbbIEGspgDDJJONaH2xW7pk17St6Vi7G
	VLM0RI3IM9c20qTLY0RIaXgHULwUEDL8tcuK4KrRWPS2LT0dv+QE/6lTbHmiHLjQEklKYARcw7rhs
	7UYNAk6+uO5cYsHcFGBvqB3/4LHyrBdFfKGKcOFdtdkeklJxAJsuDXg/3LLxlwnrfujLsAku1/ho0
	GGm4LDqjaTYZSX830PMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpHMW-00FIgv-A6; Fri, 04 Jun 2021 21:28:16 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpHME-00FIfw-WD
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 21:28:00 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N49d1-1lP7bZ3N6f-0108pB for <linux-riscv@lists.infradead.org>; Fri, 04
 Jun 2021 23:27:56 +0200
Received: by mail-wr1-f50.google.com with SMTP id h8so10568910wrz.8
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jun 2021 14:27:55 -0700 (PDT)
X-Gm-Message-State: AOAM5323vbuTAcjERagiTYeFCDvsmK8/ObxhI7YCOUW1QbT9UhNhJOsH
 NcC+Lo8L7kJawdyyOeCOajZSSXEJ6pYxcRvsSJ4=
X-Google-Smtp-Source: ABdhPJzJDHuyMCqX6WOws3xbJdiVdgcELrwsCfZOh8KOJCGiTnqEKWWc8yDd/bMkdxBixLXUQF+S4GmeCWLLk2+jBEc=
X-Received: by 2002:adf:a28c:: with SMTP id s12mr5998470wra.105.1622842074948; 
 Fri, 04 Jun 2021 14:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAJF2gTTpurWpPUcA2JkF0rOFztKQgFBhOF9zQyuyi_-sxszhRQ@mail.gmail.com>
 <mhng-423aeaad-9339-4695-9a85-f947dd6135ac@palmerdabbelt-glaptop>
In-Reply-To: <mhng-423aeaad-9339-4695-9a85-f947dd6135ac@palmerdabbelt-glaptop>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 4 Jun 2021 23:26:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a04C8HObpSHNYqQpe4V96MoSLs7sEpiPvp4OpvyAU1_fQ@mail.gmail.com>
Message-ID: <CAK8P3a04C8HObpSHNYqQpe4V96MoSLs7sEpiPvp4OpvyAU1_fQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Guo Ren <guoren@kernel.org>, Anup Patel <Anup.Patel@wdc.com>, 
 Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>, 
 Christoph Hellwig <hch@lst.de>, wefu@redhat.com, lazyparser@gmail.com, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>
X-Provags-ID: V03:K1:Ucny0TVh9BPkDar5MoIkgo8RDQt8lg+PyoagxOLLcyctMN0kREf
 NamOr+ZpM4TyCUsHW4saS89ylHuvREFczlOHbULb7pVEPbwcCsV/RNifZd4M15YOMI9xi6/
 Gtd6b3guoTpfm1mkscdz9LTHSYCFP+O17xpSRkcI33Fbm8kiM2PxOAbqicvR/H/ZHXtO9oe
 Z/JQ3pKifsuOcRVctHlnQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:25W7H2wPeXE=:ixeF6cks3vC5Ji/to8U1vy
 8EIuBWWFJrxpgxUjOdUXytG64CeON20hTmWoXPRhTpQWFwhg61i0kfCcbvB1NJ90V6E1qr1iE
 KDfjjUzi+H7VqhgMuATh9Se7EcYoGscVaYtq2hdLNA2GPau8Bpu80URuq4+MWtnGvJGVAdyvW
 ewfGS/FGKH6r9V8VAgaN9y2+lb9b5DV1DNXGkrFn1234Ec8faaHwr/fPMnrOE/NQMavTBW3hE
 r9bv/cZVZwf8BstcrXLl/4dVhUIpclOqvapFh3MDT7+SSCMi580tXDZkJLOgUQ3cWQ21rtr16
 DGOTU3mVjsvAhsXgfHms7kdXPg9BjFyMRu9qeATGLZeLZnqYH5JXzXGF4hPx8psYYKtLhZX/h
 Ve35ZU1DWO1KLMvSO1KhIXzFLOVnCNa90CiQLQNbnRj1gfZBoiVVGiw233/RUOG9n6i8YEH2G
 6fesDMb3qM+BU7jlu8X7UmaahhT3C1aW2rj9coOKTws2CtgwK/d9lcEHv6K20PXwsLi3cPwdI
 a9ETafiI9WAPhiPhNkPxBH2tpPvZ71Rii6wV9ragQp6gjsLlR/arBLSbPm2RHgSiIhqAvIGKq
 jPAizVCpP0juBdiDXxMDNZKC/DEbQsCRfNy/kbJPgkq5Hu89+z7LMlU3P5dUM0TncVoy5Iym4
 Fgsc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_142759_353705_F20472DA 
X-CRM114-Status: GOOD (  36.17  )
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

On Fri, Jun 4, 2021 at 6:14 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:

> The hope here has always been that we'd have enough in the standards
> that we could avoid a proliferation of vendor-specific code.  We've
> always put a strong "things keep working forever" stake in the ground in
> RISC-V land, but that's largely been because we were counting on the
> standards existing that make support easy.  In practice we don't have
> those standards so we're ending up with a fairly large software base
> that is required to support everything.  We don't have all that much
> hardware right now so we'll have to see how it goes, but for now I'm in
> favor of keeping defconfig as a "boots on everything" sort of setup --
> both because it makes life easier for users, and because it makes issues
> like the non-portable Kconfigs that showed up here quite explicit.

It's obviously easy to take the hard line approach as long as there is
so little hardware available. I expect this to be a constant struggle,
but it's definitely worth trying as long as you can.

> >> To give some common examples that make it break down:
> >>
> >> - 32-bit vs 64-bit already violates that rule on risc-v (as it does on
> >>   most other architectures)
>
> Yes, and there's no way around that on RISC-V.  They're different base
> ISAs therefor re-define the same instructions, so we're essentially at
> two kernel binaries by that point.  The platform spec says rv64gc, so we
> can kind of punt on this one for now.  If rv32 hardware shows up
> we'll probably want a standard system there too, which is why we've
> avoided coupling kernel portability to XLEN.

I would actually put 32-bit into the same category as NOMMU, XIP
and the built-in DTB:
Since it seems unrealistic to expect an rv32 Debian or Fedora build,
there is very little to gain by enforcing compatibility between machines.
This is different from 32-bit Arm, which is widely used across multiple
distros and many SoCs.

> >> - architectures that support both big-endian and little-endian kernels
> >>   tend to have platforms that require one or the other (e.g. mips,
> >>   though not arm). Not an issue for you.
>
> It is now!  We've added big-endian to RISC-V.  There's no hardware yet
> and very little software support.  IMO the right answer is to ban that
> from the platform spec, but again it'll depnd on what vendors want to
> build (though anyone is listening, please don't make my life miserable
> ;)).

I don't see any big-endian support in linux-next. This one does seem
worth enforcing to be kept out, as it would double the number of user
space ABIs, not just kernel configurations. On arm64, I think the general
feeling is now that we would have been better off not merging big-endian
support into the kernel as an option, but it still seemed important at the
time. Not that there is anything really wrong with big-endian by itself,
just that there is no use case that is worth the added complexity of
supporting both.

Let me know if there are patches you want me to Nak in the future ;-)

> >> - SMP-enabled ARMv7 kernels can be configured to run on either
> >>   ARMv6 or ARMv8, but not both, in this case because of incompatible
> >>   barrier instructions.
>
> Our barriers aren't quite split the same way, but we do have two memory
> models (RVWMO and TSO).  IIUC we should be able to support both in the
> same kernels with some patching, but the resulting kernels would be
> biased towards one memory models over the other WRT performance.  Again,
> we'll have to see what the vendors do and I'm hoping we don't end up
> with too many headaches.

I wouldn't specifically expect the problem to be barriers in the rv64 case,
this was just an example of instruction sets slowly changing in incompatible
ways over a long time. There might be an important reason for version 3.0
of one of the specifications to drop compatibility with version 1.x.

          Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
