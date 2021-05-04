Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72345C433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 10:29:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFD26611C0
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 10:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFD26611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1dLTvg8NJPPsV53O4w9PgzC6R4ZNoUTPs86n4cic12s=; b=qTmvN6IFordM1VFMNEHp4RCzu
	rejVx/kT6EChScBPJJUTm7tVMqmAM0PEmoK9m8YzRJVfx70w/6fxVhFWMUS0DTRh6SgP88p4U0kKy
	KS8c9LFquyfHwUd3c8HNnJshsV5lHXPNHLwimBy4/SitVI2kuIzTNuCBAhR/ifVT29QxltOma9h3v
	ZFLfTReCUJTxCgLa48pzQBR7gSy7odZQ6Hsuj6CoH9nUjGGa+vD/jZEF2bxR56pX/UyhwkqPpkGGp
	72xgLeXoPrtFC3moyW55mogOI/hRhY85G4Ge5bLYEKQ+PxRA+th0FVO4fnlt13E/ptHyqV0TGX9+R
	HXCFPXUYg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldsIS-00FyVp-Sm; Tue, 04 May 2021 10:28:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsIN-00FyV6-47
 for linux-riscv@desiato.infradead.org; Tue, 04 May 2021 10:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dgb9VLbXx2tiQjiliX2CVp3l/xl303Qwf2JBJdlh0SQ=; b=Of9sMQUK36jkjXFPqCWM6zEMpr
 HRrHx7dnimyr+xEijZGz9xZRhBb4WmH4BkzlLpLe4V92jYMdj7qUAn6TZ88PIWg9ymDclifBQuADu
 N+84SmUMX7faodWgWI67+P9AW8pdMJ3TYOFIIO+NhOj8LE/ZG12jwIWpNpNYUdPgPB8wBpgOhR9lX
 qWCK256Lfq6P18X1BU3wOtxRQJXHMNSmCXAtnz9o8TEASRRvWJ1Do0lCHJeQF31dJJ9GH273o7SuW
 vTOaXlLmPUzPErWOHpIf0TExTakZQkCsDM0ba/NqbEvCwLc290lWXTDvLGPV+r2ayY61ll+T9BlFR
 Q+UMW5LA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsIK-003tjP-Ed
 for linux-riscv@lists.infradead.org; Tue, 04 May 2021 10:28:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EAD4613C0
 for <linux-riscv@lists.infradead.org>; Tue,  4 May 2021 10:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620124127;
 bh=dgb9VLbXx2tiQjiliX2CVp3l/xl303Qwf2JBJdlh0SQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OMlThanMroC7t/Y160W99ZocuyAr4w8fXQ07/HQtVO2nbS6VEXkS8GLyn2j+t/xER
 0sTYqMSJKR416yXOMtSo3SIbgiNtEIN2eFgl20plWso0fzHiNdGPNSWA10YzfJ9K4D
 y2Ii+tJihSFeKWZeX5iEj763No0vjdlAqEQfJartr2q95ms0uG8Y5vi4pHD7iqD3Yq
 cb6kDvleh4bzBIteD0qIFaVN6y+Jjrnx24+R7aTyawcb/rhepCULzhtyS/o42RlUfi
 PtnjEPyceVpuvS3Qvpc3Q8ecI5izMGBHs8HxUXaLD1Bud7985ojfcPBUBkaMLPJ5OK
 x2X9H2ehcnQUQ==
Received: by mail-oi1-f169.google.com with SMTP id n184so8268720oia.12
 for <linux-riscv@lists.infradead.org>; Tue, 04 May 2021 03:28:47 -0700 (PDT)
X-Gm-Message-State: AOAM531W8u7AMxIa8wB671X3/Kn3ZVHHeB4rh/nm9c9lo9k/6hNXxNJi
 Xtzm4hUdqxob08uzXCOpo0L28TB2CqnC9Cv9TaU=
X-Google-Smtp-Source: ABdhPJwWs+8lBECoghrn0jMvooaSkPWY3QfZNpDmHd7lBZl4tsIEGqtAm4chefB94vOZj78+zIHb30u5CHLOgE1IpDw=
X-Received: by 2002:aca:4056:: with SMTP id n83mr2521838oia.47.1620124126620; 
 Tue, 04 May 2021 03:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210427120607.2646166-1-arei@altlinux.org>
 <CAMj1kXGm9d7SdBoozEoOP4G6ETmNiZR8kum91RVc_4eUTroE2w@mail.gmail.com>
 <CANA1cBL0AiJBbZX6x3LjTLYJ7z2ueaDWDKJrM50Xd2AxNPO14g@mail.gmail.com>
In-Reply-To: <CANA1cBL0AiJBbZX6x3LjTLYJ7z2ueaDWDKJrM50Xd2AxNPO14g@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 4 May 2021 12:28:35 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGhwXsVrjqSMCzkQ83MWh0W=63x5_+fyuugyewkB=xAXw@mail.gmail.com>
Message-ID: <CAMj1kXGhwXsVrjqSMCzkQ83MWh0W=63x5_+fyuugyewkB=xAXw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Relocate the kernel relative to a DRAM base.
To: Nikita Ermakov <arei@altlinux.org>
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_032848_587947_657A3FA9 
X-CRM114-Status: GOOD (  24.98  )
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

On Wed, 28 Apr 2021 at 18:00, Nikita Ermakov <arei@altlinux.org> wrote:
>
> On Tue, 27 Apr 2021 at 15:43, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Tue, 27 Apr 2021 at 14:07, Nikita Ermakov <arei@altlinux.org> wrote:
> > >
> > > Try to get the base of the DRAM from a DTB to use it as a lowest address
> > > in physical memory to relocate the kernel. If it is not possible to
> > > obtain the base from a /memory node of the DTB let's make an assumption
> > > that the DRAM base at the beginning of the memory.
> > >
> >
> > Why?
> >
>
> You right, this patch is useless. I made it because I overlooked
> efi_low_alloc_above() in libstub/relocate.c
> Sorry for bothering.
>
> I had an issue with booting a Linux kernel with EFI stub on a HiFive
> Unleashed board.
> My boot chain was as follows: ZSBL -> FSBL -> OpenSBI -> U-Boot
> (bootefi) -> Linux
> When I tried to boot the kernel, U-Boot throws an Store/AMO access
> fault exception.
> I checked the riscv-stub.c and libstub/relocate.c and I thought that
> it tries to relocate the kernel at the 2 MiB.
> With this patch the kernel started to boot and I thought that the
> theory was right.
> But, after further investigation I found out that U-Boot EFI does not
> mark the first 4 KiB page of DRAM as EFI_BOOT_SERVICE_DATA on the
> board and efi_low_alloc_above() allocates this region as conventional
> memory. The lowest region of DRAM is protected and that is why I got
> the exception when the kernel tries to relocate to the 0x80000000. The
> reason why U-Boot EFI does not mark the first 4 KiB of DRAM as
> EFI_BOOT_SERVICE_DATA was that there wasn't /reserved-memory node in a
> DTB. I had the FSBL with a patch which enables an entire L2 cache and
> it does not preserve a0, a1 registers before a jump to the OpenSBI.
> So, OpenSBI didn't fixup the DTB where it adds the /reserved-memory
> node.
>

OK, thanks for the explanation. I will disregard this patch then.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
