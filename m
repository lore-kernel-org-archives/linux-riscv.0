Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E761DC433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 09:03:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B41DC20720
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 09:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rbli25fC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SF717i3r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B41DC20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nKiAJ7vM+n3jOHbO4XrphSFj+NOfo9JlKfAyYzt9Tvc=; b=Rbli25fCXE1oMIwBRSilkrEiv
	+aVH41AwXKk0gYNgQE+ko2Z3qB/vtcDEYK4ELRpxOklhE3mR3HC3J4kD0M/hdWgKk29CpUfRAN3e1
	7nI1/Ln1en4Oo0mUdjp1OT5Zs7y/wDQMxM8XFeaGs+ucHqv/mniJhLvOIG2EHD9V2GwalXzSXrz5l
	TtPo9XkR3qqfVAvqJA5N10SU391IqMoQY/y/pDxMwhbdsB1VeCoT8/dZ7ucg8mi2l8h5VES0wI3gw
	qzqf7PZvZVOuM/CU8L82CEnU/lBAoaoEiQllGHGmXsRRge8CSWkSLXIsGFuJeMU/H7KDryVqrxvNq
	VFrjE0oEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxoAp-00046i-Sa; Tue, 21 Jul 2020 09:02:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxoAm-00045s-56; Tue, 21 Jul 2020 09:02:52 +0000
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F16522BEF;
 Tue, 21 Jul 2020 09:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595322171;
 bh=H4sR2N24637FuvcXN7OsFonQ4tJiLJ5HJGUm63XkrCY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SF717i3ruwvvsB00BOLFc80n9scQYuZQ1PdLipTsltsFjejsLVQu/vt3AYsQii5pi
 U337BVficYv7cKmD9zTy/tjxaMLdR1//QRHaLpL41jlIYwcx4G9C/4B3NUiPJDZoFu
 CmQhhHmpC2cY9eXZPYGIoPLabzrTI8njiISCUfrA=
Received: by mail-oo1-f41.google.com with SMTP id y4so1484113oov.6;
 Tue, 21 Jul 2020 02:02:51 -0700 (PDT)
X-Gm-Message-State: AOAM532dlAz6nJLyMCfQJips2/r9/wATvNB4GeITBTskgPiCU9n5UULB
 534YT8sdoZ0BWCHAnfZXBU1AinyciFMT8BJG5mU=
X-Google-Smtp-Source: ABdhPJxTRlrnT+ydEM3pK3cWrhrvw/wbjW+JnumS5WS6Rxoc8K1cIu7KOklEbd+we69/kFrM//djif/Xf4zfAGSx86g=
X-Received: by 2002:a4a:b006:: with SMTP id f6mr23179936oon.13.1595322170629; 
 Tue, 21 Jul 2020 02:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200716234104.29049-1-atish.patra@wdc.com>
 <20200716234104.29049-2-atish.patra@wdc.com>
 <CAK8P3a2EesjQAs-YGrCO=cYfUVWFQ3CbJfVXJx3qZjCS_XW+wA@mail.gmail.com>
 <CAOnJCUKF-tfN-fHyRcjyAMnYVzQqp=_CLa2F4TQNO7jA4infoQ@mail.gmail.com>
 <CAK8P3a3iUdoOZrORz+aeXYiO35Lp8snrCkxSUPAY6Fh2EinaOw@mail.gmail.com>
 <CAOnJCUL2X9mK41iHLCg1_rtj7JS4p41hqXfmd=hyxK=2t5QQog@mail.gmail.com>
 <CAK8P3a3e3SBtTocpkCybKRjkBJG26G-8YdiroJbZLZYq9f0yfw@mail.gmail.com>
In-Reply-To: <CAK8P3a3e3SBtTocpkCybKRjkBJG26G-8YdiroJbZLZYq9f0yfw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 21 Jul 2020 12:02:39 +0300
X-Gmail-Original-Message-ID: <CAMj1kXH53V3Vu8Lq4yzSCn5ZSxn65KiVbt91PUPhkBRO6vuRSQ@mail.gmail.com>
Message-ID: <CAMj1kXH53V3Vu8Lq4yzSCn5ZSxn65KiVbt91PUPhkBRO6vuRSQ@mail.gmail.com>
Subject: Re: [RFT PATCH v3 1/9] RISC-V: Move DT mapping outof fixmap
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_050252_335158_E6CA6AA9 
X-CRM114-Status: GOOD (  19.64  )
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
 Kees Cook <keescook@chromium.org>, Zong Li <zong.li@sifive.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Atish Patra <atishp@atishpatra.org>, Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 21 Jul 2020 at 11:57, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jul 21, 2020 at 6:18 AM Atish Patra <atishp@atishpatra.org> wrote:
> > On Sat, Jul 18, 2020 at 2:24 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Sat, Jul 18, 2020 at 3:05 AM Atish Patra <atishp@atishpatra.org> wrote:
> > > > That's what the original code was doing. A fixmap entry was added to
> > > > map the original fdt
> > > > location to a virtual so that parse_dtb can be operated on a virtual
> > > > address. But we can't map
> > > > both FDT & early ioremap within a single PMD region( 2MB ). That's why
> > > > we removed the DT
> > > > mapping from the fixmap to .bss section. The other alternate option is
> > > > to increase the fixmap space to 4MB which seems more fragile.
> > >
> > > Could the original location just be part of the regular linear mapping of all
> > > RAM?
> >
> > No. Because we don't map the entire RAM until setup_vm_final().
> > We need to parse DT before setup_vm_final() to get the memblocks and
> > reserved memory regions.
>
> Ok, I see how you create a direct mapping for the kernel image, plus
> the fixmap for the dtb in setup_vm(), and how moving the dtb into the
> kernel image simplifies that.
>
> I'm still wondering why you can't do the same kind of PGD mapping
> for the dtb that you do for the vmlinux, creating linear page table
> entries exactly for the location that holds the dtb, from dtb_pa to
> dtb_pa+((struct fdt_header*)dtb_pa)->totalsize.
>

On arm64, we limit the size of the DT to 2MB, and reserve a pair of
PMD entries adjacent to the fixmap so we can map it r/o statically
using huge pages without using fixmap/early_ioremap slots. (Using a
pair of PMD entries allows the DT to appear at any alignment in
memory, given that PMD entries cover 2 MB each on 4k pages kernels)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
