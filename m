Return-Path: <SRS0=/aKF=IC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20724C433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 13:22:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6793E64F09
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 13:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6793E64F09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2KP5jIN4PPfnremVmdA1zV21c1Trpte/xbXs4E7KxwM=; b=dP3Ld5qefU9Zw8GxqEw4Z3PEo
	BvNgBt9S1/zoAZoQPCKCAnffGPPjlUauxjH5V7goXl2+sYSYEzHnYQb7gSlXnW2Ns8ouB5xc20DOi
	HwpXec7suM7f2JfozBzEc1HWPY+4AN1D55dIQKoPzJ24Sgu1MyXib9LGk3TxbjjxdCtF3lgysLirV
	hFkKiS6GlK/VTu2Pe1Ax3QN0Q5GSj2nD6bGKOqjOhMWKIH0bn/UB3DzpSahE1E3POifPalzBAyeWW
	TXxyntMIwDxm+RjSwk8vTGF8XUz4TRA5rrqZXl2mmdJvyqNNgtz5cLWBW6vDPAUJUs+0VVilTmlCi
	knhGBf3/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHnvv-008jIE-Iq; Thu, 04 Mar 2021 13:22:27 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHnvn-008jHC-GX
 for linux-riscv@lists.infradead.org; Thu, 04 Mar 2021 13:22:21 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MYvTs-1lDLrH3Mbw-00Uugz for <linux-riscv@lists.infradead.org>; Thu, 04 Mar
 2021 14:17:08 +0100
Received: by mail-oo1-f41.google.com with SMTP id g46so6561907ooi.9
 for <linux-riscv@lists.infradead.org>; Thu, 04 Mar 2021 05:17:06 -0800 (PST)
X-Gm-Message-State: AOAM530lqZyOWpSGx04+OeQpgyJToHJx7xRj6eTE1lYfdApWS2fUbiw/
 ACZvJq8fTVfljifN0d1RXTlHBHBDCdXpdypfsD4=
X-Google-Smtp-Source: ABdhPJyDAcCszG/gim3Q88MryWi+HXqViVK+A7PRUkvc/zpTY828X+UfaEHAR4o+WJBT1JGEAZQq2PjQUvByoq0w50o=
X-Received: by 2002:a4a:304a:: with SMTP id z10mr3361077ooz.26.1614863825887; 
 Thu, 04 Mar 2021 05:17:05 -0800 (PST)
MIME-Version: 1.0
References: <CAOnJCULm4gGxikjN4eArY2n-7i2T30q=08uODP_sFXjzUkRz2Q@mail.gmail.com>
 <mhng-cb425c13-c9ad-46e7-9b8a-b017be00e098@penguin>
In-Reply-To: <mhng-cb425c13-c9ad-46e7-9b8a-b017be00e098@penguin>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 4 Mar 2021 14:16:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0NO7aB8rgrApGbnk9kihE0q4us6i4H_rKyKgcsrgKMrA@mail.gmail.com>
Message-ID: <CAK8P3a0NO7aB8rgrApGbnk9kihE0q4us6i4H_rKyKgcsrgKMrA@mail.gmail.com>
Subject: Re: question about RISCV EFI stub support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <atishp@atishpatra.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>, Atish Patra <Atish.Patra@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-Provags-ID: V03:K1:gUmE/YmR9WCdHYIr3q2bWjZy8REpH68e3jMoSWaa2hLttmSA23B
 WvETtfVOkT3gh1xTrQsTaGz/zCx3g7Qama2t7TvlPdUlSQJZVP7zn4RRNw8ZAVrj0IAmtoy
 BmOBY+Y0ghMzxTplYOTbSu8XU58OZeZL2za7kw9/VTfyidRMDcj4Kw8G4UcWv8OUwcOVsaW
 nMlotpOJPAWnJwxkUlObg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A0GKj9k4y3o=:wS6Qqw2o/oTcBewj8Ptv1O
 weJDXqJrEaGlevhgy1BSJZGphCGTkZ2lI5OUfPKVu68wL3bzZrxIdFggM6XmEXXMO57D6kuCU
 aw1ItOTYo4uuPW3KZBycU1g56rj9KYFBb9lMcvHijpvg7Qp7bM9u0TNnNxXnb8Ij2X1rLUmS4
 Me4taVUW4ognPN8mryzQ3NOQ7VH50Q1dDOZaZ+qoqXKCYFe22/kxLff2uuqD4jV+LB/mXvgRv
 slVLJjPvtl+FRK6haCrmn0Li0Ur6Rw46Uo6KodllRuUIwcDXrYf1pN7ylgbU3VA2ta4IjbzS+
 mP4Vjh0bSuSkKmn/cWmQwgRffxaWIsOzvgvq0omK8wpf4iF2oStz42SGer2Hh6/sedxJifyy3
 nrWsysogaPXdtovdfG9CRRZ1dFgelCl9NgMZoZpfmakaGMT4zv4tal1ZoNGjp
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

On Thu, Mar 4, 2021 at 3:25 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> The reason we coupled C and EFI is really to avoid the existence of EFI-only
> kernels, which are a headache these days because EFI isn't widely supported or
> used on RISC-V.  The general assumption is that, since we recommend rv64gc for
> portable systems and EFI is mostly of interest to portable systems, we won't
> end up with non-C EFI systems and therefor don't need to worry about having
> incompatible kernels.  That said, if there's one thing I've learned from the
> whole RISC-V thing it's that whenever I say "we don't think hardware that does
> X will show up" it does.  Assuming that's the case and we end up with non-C
> systems that people want to run EFI on, we'll figure out a way to do that -- if
> someone has real hardware I'm inclined to support it, otherwise we just end up
> with a mess of vendor-specific forks.

I think it makes sense to require the EFI stub in addition to RV64GC in the
minimum set for a 'portable' kernel, along with an MMU and a well-defined
set of peripherals that need built-in drivers (irqchip, clocksource,
console, ...),

Any hardware platform that doesn't have the minimum portable set or that
requires additional kernel support for booting can still be supported by
custom kernel configurations, it just wouldn't work with random distro kernels.

I think you require that already per documentation, but it might be helpful to
have a Kconfig symbol in the kernel that enforces this by selecting the
required options (ARCH_RV64I, RISCV_ISA_C, MMU, EFI, SERIAL_SIFIVE,
SIFIVE_PLIC, ...) and hiding any incompatible ones (CMDLINE, BUILTIN_DTB,
...).

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
