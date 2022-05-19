Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30198C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 19 May 2022 18:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2vxOdoBUWnvXNwNKOa29c+9Vn4kpm7nPtrobQ1NMMfA=; b=0qQAsnRgxyqnt4
	VAW0UqQ1GMCm5LFqMeHfO99/xjm2N63RHvfIM/PTZBs+daHv41lE/xmxgers0TU47opRfHvlpgoqL
	aphu0aaLWB+LMpTzJBfeYGPRXlUx7fLoVJ7Bkqpa90yU69N7HJA94ayf40EQCmlVV/9T7kZ51RHNz
	zwZ6a6+0eIZ9IU8+ZLyNkqsfYbhplhda4pFEy9P6t2yRc8H7yyru3rXniz3hySP2dhxyZT6kRFQbR
	MmJVoj1iY3vXO1WdkEY2LqrhluPmOMYyc/Fz5jx/ZqzaD22ut3/ZJQvPVxlWL7Nfdb1iJNMVz9fcS
	Is9vZEEl0cD8z8zSPylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrkYu-008nIZ-Bz; Thu, 19 May 2022 18:07:48 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrkYq-008nGP-8O
 for linux-riscv@lists.infradead.org; Thu, 19 May 2022 18:07:46 +0000
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f16645872fso64976047b3.4
 for <linux-riscv@lists.infradead.org>; Thu, 19 May 2022 11:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fcjVw/C61oH9MO2vq0TEosk2QoMcMTcOP6iTXwM1Imk=;
 b=Bly4/VIk2mp1Zm47Z/R9VCAnjQXGxCkstcgbPY9u9zlTpUFi/hyiG6VJBRjZk7F7yS
 Te3BRmhK4WXN5cOqtwQ34P9mq0DlEwkn/nDsng7QxQKAo3XESNflSuenlim2O6Oy0Ctd
 B6VRybdO47cd2XGSrFZlWgFgaMQlmLPnGXFyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fcjVw/C61oH9MO2vq0TEosk2QoMcMTcOP6iTXwM1Imk=;
 b=M9dd49rADqI1paTZ0KrXZaKghb0B/xA1HmfZmccbTtHLEHjrMK++VfSPOUpIzyoZcK
 W6UuefyyizdOZ4U2VsCv2k138/wN8dLZePxFFiOLSdQM7TLhSgQpmA1E0RNHpsuOAlmm
 BQ8IxdV0TS2710KqgaYDpLxYL5P1IRSSJjT6Nl+oE+rDbitS8Lg/CDFskBOiCk4C5tNa
 MMbf6ifcLGjyJQPQ11tGZNKTsdgLs/t8mosy4qUMbIPYb6uG7laodlaESq/oyTe1LR2e
 6QYvzRdDCGyyh48KZftfe+dMZWbYxfNG9ngOyBQ9D/GV1GUJNFOIfnPMhJhXUwYvmAIW
 taLA==
X-Gm-Message-State: AOAM531B2L1LBfDSuIcHo764P7B5OkpvYiqIXhf5SJhQfDMxkbxoX5in
 XsQg87n7kmIeG3ITDnOTzXwguuayNQlWWSRT694v
X-Google-Smtp-Source: ABdhPJzoPGSuS7/uwFvjd9b5dItfqWlDbb3NqKkTyeYmTFTSu7vWkaWgdbD31EmpuTMbzawsYzbFEl9Gvt+LTBESob0=
X-Received: by 2002:a81:8494:0:b0:2fe:ff73:cdb7 with SMTP id
 u142-20020a818494000000b002feff73cdb7mr5778647ywf.373.1652983660355; Thu, 19
 May 2022 11:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220518095646.47548-1-sunilvl@ventanamicro.com>
 <20220518095646.47548-2-sunilvl@ventanamicro.com>
 <CAMj1kXF2N+0zRCNg0Aq9Y8Y35FUaQ1V+swzY__y86sayKW7PPA@mail.gmail.com>
 <04ed20b1-e312-dfc2-c314-02750c076681@canonical.com>
 <CAMj1kXEX0DWprb7cv_js1=M1J1hSXLBa=cOOjVo3tTVyGT0siQ@mail.gmail.com>
In-Reply-To: <CAMj1kXEX0DWprb7cv_js1=M1J1hSXLBa=cOOjVo3tTVyGT0siQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 19 May 2022 11:07:28 -0700
Message-ID: <CAOnJCULUoedeARe0J=aduAVD35uHMe0MN9Pc_LDkavWZ-VtOkg@mail.gmail.com>
Subject: Re: [PATCH V4 1/1] riscv/efi_stub: Add support for
 RISCV_EFI_BOOT_PROTOCOL
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Sunil V L <sunilvl@ventanamicro.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>, Abner Chang <abner.chang@hpe.com>, 
 linux-efi <linux-efi@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_110744_531377_9F2BF6D1 
X-CRM114-Status: GOOD (  36.43  )
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

On Thu, May 19, 2022 at 1:14 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 19 May 2022 at 08:17, Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
> >
> >
> >
> > On 5/18/22 23:03, Ard Biesheuvel wrote:
> > > On Wed, 18 May 2022 at 11:57, Sunil V L <sunilvl@ventanamicro.com> wrote:
> > >>
> > >> This patch adds the support for getting the boot hart ID in
> > >> Linux EFI stub using RISCV_EFI_BOOT_PROTOCOL. This protocol
> > >> is preferred method over existing DT based solution since it
> > >> works irrespective of DT or ACPI.
> > >>
> > >> The specification of the protocol is hosted at:
> > >> https://github.com/riscv-non-isa/riscv-uefi
> > >>
> > >> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > >> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > >> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> > >> ---
> > >>   drivers/firmware/efi/libstub/efistub.h    |  7 ++++++
> > >>   drivers/firmware/efi/libstub/riscv-stub.c | 29 +++++++++++++++++++----
> > >>   include/linux/efi.h                       |  1 +
> > >>   3 files changed, 32 insertions(+), 5 deletions(-)
> > >>
> > >> diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
> > >> index edb77b0621ea..aced62a0907e 100644
> > >> --- a/drivers/firmware/efi/libstub/efistub.h
> > >> +++ b/drivers/firmware/efi/libstub/efistub.h
> > >> @@ -720,6 +720,13 @@ union efi_tcg2_protocol {
> > >>          } mixed_mode;
> > >>   };
> > >>
> > >> +struct riscv_efi_boot_protocol {
> > >> +       u64 revision;
> > >> +
> > >> +       efi_status_t (__efiapi * get_boot_hartid)(struct riscv_efi_boot_protocol *this,
> > >> +                                                 size_t *boot_hartid);
> > >
> > > size_t is not a EFI type, and your spec uses UINTN here, which is
> > > equivalent to 'unsigned long'. However, jump_kernel_func() takes a
> > > unsigned int for the hartid. Please clean this up.
> >
> > unsigned long and size_t have the same number of bits. This seems to be
> > a question of taste where we should follow the maintainer.
> >
>
> We use unsigned long wherever the UEFI spec uses UINTN. This is not a
> matter of taste, really.
>
> > jump_kernel_func() assuming boot hart ID to be an unsigned int is not in
> > line with the RISC-V ISA which allows to use all xlen bits.
> >
> > >
> > >
> > >> +};
> > >> +
> > >>   typedef union efi_load_file_protocol efi_load_file_protocol_t;
> > >>   typedef union efi_load_file_protocol efi_load_file2_protocol_t;
> > >>
> > >> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> > >> index 9c460843442f..012504f6f9a4 100644
> > >> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> > >> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> > >> @@ -23,7 +23,7 @@
> > >>
> > >>   typedef void __noreturn (*jump_kernel_func)(unsigned int, unsigned long);
> > >>
> > >> -static u32 hartid;
> > >> +static size_t hartid;
> > >>
> > >
> > > and here
> > >
> > >>   static int get_boot_hartid_from_fdt(void)
> > >>   {
> > >> @@ -47,14 +47,33 @@ static int get_boot_hartid_from_fdt(void)
> > >>          return 0;
> > >>   }
> > >>
> > >> +static efi_status_t get_boot_hartid_from_efi(void)
> > >> +{
> > >> +       efi_guid_t boot_protocol_guid = RISCV_EFI_BOOT_PROTOCOL_GUID;
> > >> +       efi_status_t status;
> > >> +       struct riscv_efi_boot_protocol *boot_protocol;
> > >> +
> > >> +       status = efi_bs_call(locate_protocol, &boot_protocol_guid, NULL,
> > >> +                            (void **)&boot_protocol);
> > >> +       if (status == EFI_SUCCESS) {
> > >> +               status = efi_call_proto(boot_protocol,
> > >> +                                       get_boot_hartid, &hartid);
> >
> > A lot of the kernel code seems to be unfit to handle hart IDs exceeding
> > INT_MAX (e.g. sbi_cpu_is_stopped()). Until this is fixed we have to
> > treat hartid > INT_MAX as an error.
> >
>
> This is an issue in the core kernel code, not in the EFI stub. As you
> pointed out, the ISA implies UINTN / unsigned long here, and if the
> startup code cannot deal with that, it can be fixed separately.

It was kept as unsigned int because hartid > INT_MAX is very unlikely to happen.
But I agree that we should just follow the spec(allowing XLEN bits for
hartid) and
change "unsigned int" to "unsigned long" wherever hartid is concerned.

As the hartid is changed to unsigned long, get_boot_hartid_from_fdt
should be fixed as well.
Currently, it is using fdt32_to_cpu.



--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
