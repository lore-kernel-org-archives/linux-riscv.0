Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B004C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 19 May 2022 08:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=060pj6+3TEZHSFNJY7iXmvg48ZzhNf3xZARhmaL1XOs=; b=rFtRxmWKrCXbEy
	W367HS5tg9f9KF0U178mevT8otPCshGH8XBw4QqTImc+7Okj7sDm0q1xTUi9gE+2z0SSaRQHzNBa8
	8I73cIPFwKkPD9J2UwVJ6XklrDLwi82dwBMxvYKMfcQ5R1GOTVTvw38FBLjFiILiaK7jiGEqn8b6F
	esft5cuaBsDUBGmjYI3jxb47/WMUn4tG06DzwvcEns0yD85KLa3+QAlhuCYSv/NajhTAR+9qYVwOZ
	ai2gMsXnDGAzxElpp/YZ/BYS9KpmmkN0kKl2eYWG/3dpxQ0ufxDGqJGxyBEI2KGDgLNg95hy4ldK5
	VWeZm8KjoayDOPqRx9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrbIL-005jF5-Hl; Thu, 19 May 2022 08:14:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrbII-005jDi-9r
 for linux-riscv@lists.infradead.org; Thu, 19 May 2022 08:14:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9055BCE2330
 for <linux-riscv@lists.infradead.org>; Thu, 19 May 2022 08:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7ABDC34116
 for <linux-riscv@lists.infradead.org>; Thu, 19 May 2022 08:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652948037;
 bh=4plX3uAS0SdnNX/Myvz2UrgGFPyHEHdk2KPq8Rkr4mc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=p0HxlkY0Ho5DNCZnUU1uEZNgZf5rGqqa0iGKzJxvwq9h74upAs5gnVnK1AMIh0kI2
 oZnxix2xtNoqa4FoVFc5J586PcQm14fhJ0W6vZLz+oXyE8bz12NBVmZqfjsdUOwnlH
 IWC/elkhrLHAQ8BpeR4Z4Rkb2ehit8my6ADlrASp2GhEAGuRGSZY0eFW1y4GzGs0GQ
 8xSLc8/M2aNvESilk8RD3WhfJKNGnsTc1SgRsn+USrhqZSGuJ5D+kLBZIe7RmrxkVp
 DW0Nq/fMQuJwDsuujio2cu9AGJpMbkS0qZYbkWxjP4idCgPsctWOF1fMG9EuX85g9Z
 ZXom/N0rMMh2w==
Received: by mail-ot1-f43.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so3058232otu.4
 for <linux-riscv@lists.infradead.org>; Thu, 19 May 2022 01:13:57 -0700 (PDT)
X-Gm-Message-State: AOAM531pK8+UMUT7Dh7FlZBPukgKyrHGLu1eL7I8WSv4p/Ys4CDAi/Ei
 jjoqqqo4G71iU/iijMmhGtxp4OA6Z1uvOxVFzPs=
X-Google-Smtp-Source: ABdhPJwAAiXUyk+6r2tu1xnOHDPmu3iQD/VTSnREM+hS2xEtjPlVcokUQo0nNQ+np9MYI+FTF10/GOrHTvdCeXNeVvg=
X-Received: by 2002:a9d:84f:0:b0:605:e229:3c82 with SMTP id
 73-20020a9d084f000000b00605e2293c82mr1435134oty.71.1652948036975; Thu, 19 May
 2022 01:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220518095646.47548-1-sunilvl@ventanamicro.com>
 <20220518095646.47548-2-sunilvl@ventanamicro.com>
 <CAMj1kXF2N+0zRCNg0Aq9Y8Y35FUaQ1V+swzY__y86sayKW7PPA@mail.gmail.com>
 <04ed20b1-e312-dfc2-c314-02750c076681@canonical.com>
In-Reply-To: <04ed20b1-e312-dfc2-c314-02750c076681@canonical.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 19 May 2022 10:13:46 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEX0DWprb7cv_js1=M1J1hSXLBa=cOOjVo3tTVyGT0siQ@mail.gmail.com>
Message-ID: <CAMj1kXEX0DWprb7cv_js1=M1J1hSXLBa=cOOjVo3tTVyGT0siQ@mail.gmail.com>
Subject: Re: [PATCH V4 1/1] riscv/efi_stub: Add support for
 RISCV_EFI_BOOT_PROTOCOL
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Anup Patel <apatel@ventanamicro.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Abner Chang <abner.chang@hpe.com>, linux-efi <linux-efi@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_011402_736147_FBE1016B 
X-CRM114-Status: GOOD (  32.46  )
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

On Thu, 19 May 2022 at 08:17, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
>
>
> On 5/18/22 23:03, Ard Biesheuvel wrote:
> > On Wed, 18 May 2022 at 11:57, Sunil V L <sunilvl@ventanamicro.com> wrote:
> >>
> >> This patch adds the support for getting the boot hart ID in
> >> Linux EFI stub using RISCV_EFI_BOOT_PROTOCOL. This protocol
> >> is preferred method over existing DT based solution since it
> >> works irrespective of DT or ACPI.
> >>
> >> The specification of the protocol is hosted at:
> >> https://github.com/riscv-non-isa/riscv-uefi
> >>
> >> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> >> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> >> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> >> ---
> >>   drivers/firmware/efi/libstub/efistub.h    |  7 ++++++
> >>   drivers/firmware/efi/libstub/riscv-stub.c | 29 +++++++++++++++++++----
> >>   include/linux/efi.h                       |  1 +
> >>   3 files changed, 32 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
> >> index edb77b0621ea..aced62a0907e 100644
> >> --- a/drivers/firmware/efi/libstub/efistub.h
> >> +++ b/drivers/firmware/efi/libstub/efistub.h
> >> @@ -720,6 +720,13 @@ union efi_tcg2_protocol {
> >>          } mixed_mode;
> >>   };
> >>
> >> +struct riscv_efi_boot_protocol {
> >> +       u64 revision;
> >> +
> >> +       efi_status_t (__efiapi * get_boot_hartid)(struct riscv_efi_boot_protocol *this,
> >> +                                                 size_t *boot_hartid);
> >
> > size_t is not a EFI type, and your spec uses UINTN here, which is
> > equivalent to 'unsigned long'. However, jump_kernel_func() takes a
> > unsigned int for the hartid. Please clean this up.
>
> unsigned long and size_t have the same number of bits. This seems to be
> a question of taste where we should follow the maintainer.
>

We use unsigned long wherever the UEFI spec uses UINTN. This is not a
matter of taste, really.

> jump_kernel_func() assuming boot hart ID to be an unsigned int is not in
> line with the RISC-V ISA which allows to use all xlen bits.
>
> >
> >
> >> +};
> >> +
> >>   typedef union efi_load_file_protocol efi_load_file_protocol_t;
> >>   typedef union efi_load_file_protocol efi_load_file2_protocol_t;
> >>
> >> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> >> index 9c460843442f..012504f6f9a4 100644
> >> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> >> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> >> @@ -23,7 +23,7 @@
> >>
> >>   typedef void __noreturn (*jump_kernel_func)(unsigned int, unsigned long);
> >>
> >> -static u32 hartid;
> >> +static size_t hartid;
> >>
> >
> > and here
> >
> >>   static int get_boot_hartid_from_fdt(void)
> >>   {
> >> @@ -47,14 +47,33 @@ static int get_boot_hartid_from_fdt(void)
> >>          return 0;
> >>   }
> >>
> >> +static efi_status_t get_boot_hartid_from_efi(void)
> >> +{
> >> +       efi_guid_t boot_protocol_guid = RISCV_EFI_BOOT_PROTOCOL_GUID;
> >> +       efi_status_t status;
> >> +       struct riscv_efi_boot_protocol *boot_protocol;
> >> +
> >> +       status = efi_bs_call(locate_protocol, &boot_protocol_guid, NULL,
> >> +                            (void **)&boot_protocol);
> >> +       if (status == EFI_SUCCESS) {
> >> +               status = efi_call_proto(boot_protocol,
> >> +                                       get_boot_hartid, &hartid);
>
> A lot of the kernel code seems to be unfit to handle hart IDs exceeding
> INT_MAX (e.g. sbi_cpu_is_stopped()). Until this is fixed we have to
> treat hartid > INT_MAX as an error.
>

This is an issue in the core kernel code, not in the EFI stub. As you
pointed out, the ISA implies UINTN / unsigned long here, and if the
startup code cannot deal with that, it can be fixed separately.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
