Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1ADC433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 08:58:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D45320720
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 08:58:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z+1wkXum"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D45320720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1uUUBzBUtCO8Ggk6ffqq6jcs8blxMQAuR02Va4pbh+4=; b=Z+1wkXumClgd8gbr4LJMJNOSx
	+Ldg+DpFP4L728GTYA5j7eQrjRHIld2znVoYLotDWylAnobIS6TtO2bfBIHZQtRW2GKbd070bp2ZK
	v0Zd+czyerBQCQLR+aRTE7zJU0dOnPM/ObBwf0GnS1qOMuJGXhw9D6TnJ0dtm3QYGmkFJEp/vzjPJ
	s6oKBvHp+LFVd9J4mPseeB5bZHnKvY0kCjcVZ6whSqAMXzR6wxHcBsvlrXdgEDUBrO6vIHfVktusF
	v5VEtCm09lrG/rypqs6Wu3TeXUWWP7t9NAItJdgCzkPjR/ckAX70pvba5OK6NisOQLf94kduAohos
	o01RD6DeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxo5w-0002rK-8o; Tue, 21 Jul 2020 08:57:52 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxo5r-0002pf-O7; Tue, 21 Jul 2020 08:57:48 +0000
Received: from mail-qt1-f177.google.com ([209.85.160.177]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mr9Jw-1kZatd2pKY-00oEee; Tue, 21 Jul 2020 10:57:43 +0200
Received: by mail-qt1-f177.google.com with SMTP id i3so15542035qtq.13;
 Tue, 21 Jul 2020 01:57:42 -0700 (PDT)
X-Gm-Message-State: AOAM533vclJQQyha/6jm49FqdsO8YTVB45JGMFvsOdtxEscC0H71WiCP
 7+pmMwpGqwfpUjJB14KFjWijtPd23e/V6sg/bpQ=
X-Google-Smtp-Source: ABdhPJzH4+6GvIyScoWZX14qfgZTea78AfBKB9wNJLXGQJDMUWXul6IY9ixoNgyrTeiEbnBgWhMjSyrj9u9KINMqP1I=
X-Received: by 2002:ac8:4ccb:: with SMTP id l11mr27467703qtv.18.1595321861275; 
 Tue, 21 Jul 2020 01:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200716234104.29049-1-atish.patra@wdc.com>
 <20200716234104.29049-2-atish.patra@wdc.com>
 <CAK8P3a2EesjQAs-YGrCO=cYfUVWFQ3CbJfVXJx3qZjCS_XW+wA@mail.gmail.com>
 <CAOnJCUKF-tfN-fHyRcjyAMnYVzQqp=_CLa2F4TQNO7jA4infoQ@mail.gmail.com>
 <CAK8P3a3iUdoOZrORz+aeXYiO35Lp8snrCkxSUPAY6Fh2EinaOw@mail.gmail.com>
 <CAOnJCUL2X9mK41iHLCg1_rtj7JS4p41hqXfmd=hyxK=2t5QQog@mail.gmail.com>
In-Reply-To: <CAOnJCUL2X9mK41iHLCg1_rtj7JS4p41hqXfmd=hyxK=2t5QQog@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Jul 2020 10:57:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3e3SBtTocpkCybKRjkBJG26G-8YdiroJbZLZYq9f0yfw@mail.gmail.com>
Message-ID: <CAK8P3a3e3SBtTocpkCybKRjkBJG26G-8YdiroJbZLZYq9f0yfw@mail.gmail.com>
Subject: Re: [RFT PATCH v3 1/9] RISC-V: Move DT mapping outof fixmap
To: Atish Patra <atishp@atishpatra.org>
X-Provags-ID: V03:K1:7UkoHZAltcgVlV7BaayfwEFdPzucNZVQPhNcdnmB33siVLiisEj
 /Np7FqEvvqVuRP1nsQ060U5+rV2qw1dI4tKzosh/aLNuJyIMiTYn+UiwULkmZJ365Jfax2+
 7mnbcB1v/87YQzQq/WzG1ng/PsMzPZN/5zBltL21aPxn6LgC4zMqfr3SpeXLixthM9TLTRq
 LLacavPsL/j3UWvurdX2w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MpfYjdB187M=:nC2tFFWEeuDVFTKKYtKOBW
 tTSWellJqTKnA/0zU5SDYQJFHrZXVqFuESYFnr7pwKaNdD3dMw/9FWDMe2ns3yPyUFFtBx3rp
 I09dx0jLGSwhvK96IpNVsljCV5dYMMVAHDLFN19slcbJNrb6rzDNWQv8vW+CNIdAuWy2NIpnm
 byOer3hpovMfJkewDgCPenQOh94LVRpcfspE/Y56Z6j13T2zBiIzYzclpMVK2KPLHgZVHrWjD
 LIMxcLDATRx/T1Uv0XF6fThhDlSNDu2Vdoiosypk2j93SQoZrhIXQNPX/qifkOat19mYQ6dnu
 mBi7KDbotSqoRavvpDAy/IABneLVQNxv58HAHnhoQgUR+bWt0RV/FytFJuNTy+4hlTM/JZwK2
 ypjst6AO3Vy6JkStzX83vdo03APi8QNtZJ/UQ3wmOWpcwln7CoBK63wGAOmMTGvB7Abds288R
 gOifcfbSYfA1Rvy0Tai94aEY7i6KA1gre3C1BfrF+7u6Lnspe4u//rUAymeopyy/FZ4HywCpN
 uxXF+w5ORS0fC5lvzjlqODF0qTm9910NsNWXmxNU5QHIec6AUHplkDb635JHLsUf4y1UPEOvP
 7eyBI3Il4a+eAc05qQxtNqlSizElQ41xnF8T+zRiwPtuFae3Vgg40pAWhDKGtrsJnAN2Klu2V
 1QB5nraiG66b1OoC/ic7yWijTRkUjvuFhWR6dR6bzan2qxoN4wQWJUgdP8tJu5KLYQOpi/OuU
 uzjbsgmhPVX1V49qHVAuWg1mwEaOthhoWOTrGgphah6ozopsdzcumvQO2+8jPeS9gpU1Ff1Tz
 tahvCcpZKo8bd22KMlsHCy03oxklLVNU+6VW1yZ6azV9oAMBQ8aOGGOuT/fKP8bTKRQZtY47+
 hPNs32SiXPoEq59Rw/I0ixJKXRAy5vXU2A4O+HRlqk7gkTiNMR1/brcfMMpOwuuYrtu24qfBj
 NGeiZ5VDuDZ1GoKzrTsVtfcJzoC/rX9UWbkfRYpBhogKTLq/lJ0I+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_045748_008787_2E142F9D 
X-CRM114-Status: GOOD (  16.53  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-efi <linux-efi@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2020 at 6:18 AM Atish Patra <atishp@atishpatra.org> wrote:
> On Sat, Jul 18, 2020 at 2:24 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Sat, Jul 18, 2020 at 3:05 AM Atish Patra <atishp@atishpatra.org> wrote:
> > > That's what the original code was doing. A fixmap entry was added to
> > > map the original fdt
> > > location to a virtual so that parse_dtb can be operated on a virtual
> > > address. But we can't map
> > > both FDT & early ioremap within a single PMD region( 2MB ). That's why
> > > we removed the DT
> > > mapping from the fixmap to .bss section. The other alternate option is
> > > to increase the fixmap space to 4MB which seems more fragile.
> >
> > Could the original location just be part of the regular linear mapping of all
> > RAM?
>
> No. Because we don't map the entire RAM until setup_vm_final().
> We need to parse DT before setup_vm_final() to get the memblocks and
> reserved memory regions.

Ok, I see how you create a direct mapping for the kernel image, plus
the fixmap for the dtb in setup_vm(), and how moving the dtb into the
kernel image simplifies that.

I'm still wondering why you can't do the same kind of PGD mapping
for the dtb that you do for the vmlinux, creating linear page table
entries exactly for the location that holds the dtb, from dtb_pa to
dtb_pa+((struct fdt_header*)dtb_pa)->totalsize.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
