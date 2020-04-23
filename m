Return-Path: <SRS0=uwsC=6H=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661E7C55186
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2020 11:49:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3590D20787
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2020 11:49:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U5VvrOEB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eo9N4O3O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3590D20787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iQVVDh08QPtkHmzRDx8atFI+wcj1xBYdk1osIcCKm0A=; b=U5VvrOEBbomAXEIPNLwGYAg2P
	IIwqt40FlJY9ql7V12gB+KIiALVqoM9FMMRmCUNHH1pcIbuXtqxWTFBqcOoDPLbBUYf8lHIbakr10
	364R9F7jR92KdUbezcqb35wye2q5M7V7aI5GXq1Sb9pjsA0iDf/+SitZ7zR54KFzvjlzxrGGi1g9N
	UKYLNe2dCe0myhQ1wHhUrypTHIVV04HhNAq6GQI8XYOcBziLGSKWhr6kJzvX2WO+amA8NUgd+msme
	hRwqlBOlC6At6b10/4oeRehyaSbCLHclCx23RLt2Wt7eOUEZ+9cb1HCf9FxZ+t2Ru7YaXoKvmrmec
	3I24bZ/vQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRaM9-00075B-22; Thu, 23 Apr 2020 11:49:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRaM4-00073p-53
 for linux-riscv@lists.infradead.org; Thu, 23 Apr 2020 11:49:22 +0000
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F80A208E4
 for <linux-riscv@lists.infradead.org>; Thu, 23 Apr 2020 11:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587642559;
 bh=fhN+xcgVOvDvyMkZUHLzYZ2fs6t4eybeDRgxIVFs5ZA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eo9N4O3Oj6dp/4W8C2GUl964dkWnzFCvPX1rEf+puflB84+oFFjz/hCNJHyM6I91L
 0iRS0C4tg9ZfOjwhdWh6aslQ0iC1Q7IJwXJze5MmZ/HdhyFpkAsagl+0LhlMKxTfua
 u3blbKlHvP4Ws0sFV8jINTsy2Zf7EGT0ey11424g=
Received: by mail-il1-f172.google.com with SMTP id c16so5244838ilr.3
 for <linux-riscv@lists.infradead.org>; Thu, 23 Apr 2020 04:49:19 -0700 (PDT)
X-Gm-Message-State: AGi0PubV5dXKY5LtMZOodGAMLHCqkpIL0kJC4I3Hf7wJV5sjjkJhwXFN
 ujrBc100ztixojbi79n2n94evvalhI+7vnakpuY=
X-Google-Smtp-Source: APiQypK/bzpZv6rmWwkgua0YR1rCUqt9YZNlkKRquyWm5NmOQyn7m+Z57GzfqOTnY7EyCEDCxB0NUHC46D/aWYajfDU=
X-Received: by 2002:a92:39dd:: with SMTP id h90mr3006481ilf.80.1587642558710; 
 Thu, 23 Apr 2020 04:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200422172414.6662-1-ardb@kernel.org>
 <20200422172414.6662-8-ardb@kernel.org>
 <47e7e7a64905eeec1094116234c80a0553b02346.camel@wdc.com>
 <CAMj1kXEYrKQrQGjb8Z4b8tVgpPK3_LiZPYLL8mK3vQaBW2OXgA@mail.gmail.com>
In-Reply-To: <CAMj1kXEYrKQrQGjb8Z4b8tVgpPK3_LiZPYLL8mK3vQaBW2OXgA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 23 Apr 2020 13:49:07 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGX5gOkX5WMd2Gh4NJ8UXVe42gOGeDhfkGUuCQhc6yJUw@mail.gmail.com>
Message-ID: <CAMj1kXGX5gOkX5WMd2Gh4NJ8UXVe42gOGeDhfkGUuCQhc6yJUw@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] RISC-V: Add EFI stub support.
To: Atish Patra <Atish.Patra@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_044920_237503_26BC191F 
X-CRM114-Status: GOOD (  20.86  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 23 Apr 2020 at 13:15, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Wed, 22 Apr 2020 at 20:48, Atish Patra <Atish.Patra@wdc.com> wrote:
> >
> > On Wed, 2020-04-22 at 19:24 +0200, Ard Biesheuvel wrote:
> > > From: Atish Patra <atish.patra@wdc.com>
> > >
> > > Add a RISC-V architecture specific stub code that actually copies the
> > > actual kernel image to a valid address and jump to it after boot
> > > services
> > > are terminated. Enable UEFI related kernel configs as well for RISC-
> > > V.
> > >
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > Link:
> > > https://lore.kernel.org/r/20200421033336.9663-4-atish.patra@wdc.com
> > > [ardb: - move hartid fetch into check_platform_features()
> > >        - use image_size not reserve_size
> > >        - moved asm/efi.h addition into separate patch ]
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > ---
> > >  arch/riscv/Kconfig                        |  20 ++++
> > >  arch/riscv/Makefile                       |   1 +
> > >  arch/riscv/configs/defconfig              |   1 +
> > >  drivers/firmware/efi/Kconfig              |   4 +-
> > >  drivers/firmware/efi/libstub/Makefile     |  10 ++
> > >  drivers/firmware/efi/libstub/riscv-stub.c | 109 ++++++++++++++++++++
> > >  6 files changed, 143 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index f05dd09acd48..54c78cafcd35 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -379,10 +379,30 @@ config CMDLINE_FORCE
> > >
> > >  endchoice
> > >
> > > +config EFI_STUB
> > > +     bool
> > > +
> > > +config EFI
> > > +     bool "UEFI runtime support"
> > > +     depends on OF
> > > +     select LIBFDT
> > > +     select UCS2_STRING
> > > +     select EFI_PARAMS_FROM_FDT
> > > +     select EFI_STUB
> > > +     select EFI_GENERIC_STUB
> >
> > As palmer suggested RISCV_ISA_C should be selected here to avoid
> > unintentional errors. Otherwise, every looks good.
> >
>
> Ah, I must have misunderstood. I thought using c.li instead of li was
> sufficient here.
>
>
> In any case, once Palmer confirms that he is ok with the approach I
> suggested, he can fix that up when applying the patches.
>

Actually, I can do slightly better, and put the asm/efi.h patch back
into this one.

I'll do a respin once we've agreed that this is the approach we are taking.

