Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833DEC28CF5
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jan 2022 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6VTm6cXDOSWQz1mKj4DIBDjnh/50rKKK9YImWM7glQ=; b=sNSq3WHhhRDYQI
	yOSPY2orT0kJasrn3D0MPSZNckePjjXWd6IjzIOxsXRyp1UIAsrdGv4Ph3zl4AVZ/d2dO1wSoQtVb
	YIn+WY2hNdZw7IV2FNiT8wfxFWNhBgnHxd8xhpRCWYf0B3fxR3KKhgbEZrstX1aE35ics1TKiruPQ
	SoD+hSG4r5XdFc5VhNh0lvJBwj8WAGC1x2z/59bDXiwaNSY7ocB5iq1Os07zgW+cVdZvlmNGg7Ii+
	SVWZL+CGuhhF4V7MSs2R0TeX8e5zS3eSMmzT6hRWoUsvdWpJr2/YUq52PP+qO/BtgGfhl0/YPWwzG
	YK0maOLDlwLBjqb3lXjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgN7-00BS15-KU; Wed, 26 Jan 2022 11:21:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCgFP-00BPws-S1
 for linux-riscv@lists.infradead.org; Wed, 26 Jan 2022 11:13:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4747B618D6
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 11:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F83C340E5
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 11:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643195634;
 bh=XM/Db7XSGpUQAZICPTrs3C2ME/dQWmo0rbes+fxO+a0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iO5RMBPGEds4p+yMag3ze50gepOaar+jaeociy+ticNNjhNsb8rsdBlZgB1EYPCHM
 lyz8Lqm5H0uCdrx3uxL19tQxnDcW7WeoKwMFcInKlf5Io8I/Cl/e4UirTfKypFW7FU
 L5peNUkhMpSDWbeVrOL5TqB4iMx8Z9Yooz+bvwzXsZgeV2EAeDD4K1izot+6VVjwwE
 zeHmwVzmKN6vSZ0RnhXGKyzXWf8MNsLgjc4gbZV6jK7ZwbJhLlAaiJkkdi2ki6Hm8U
 YaBPVm64OczQMqvMxFAgHWnXMTbAb+SeFKJYwBYrtbOy85nObP4iXp2kplCwhD47hQ
 /cxCgP9WDKFRQ==
Received: by mail-wr1-f47.google.com with SMTP id k18so25127247wrg.11
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 03:13:54 -0800 (PST)
X-Gm-Message-State: AOAM530aMJ1um0YDpTvWqBbTW6Tk9iPeOwKMQqyl6qW1/pQrf5umwKuN
 B7/bczypvvxAbkC7mpV7NrKJQR4WTlypL+1ePXM=
X-Google-Smtp-Source: ABdhPJwS0KJhYDwcunbECK8QjzphnXPHe5+y9Vh5Bp6dYp0Zsh5y/pH7rHyLH6SnUcjfCB/PIJ4UrcZhU/WAgye4O3k=
X-Received: by 2002:a5d:4944:: with SMTP id r4mr22242724wrs.550.1643195632984; 
 Wed, 26 Jan 2022 03:13:52 -0800 (PST)
MIME-Version: 1.0
References: <20220126110615.33371-1-sunilvl@ventanamicro.com>
 <20220126110615.33371-2-sunilvl@ventanamicro.com>
In-Reply-To: <20220126110615.33371-2-sunilvl@ventanamicro.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 26 Jan 2022 12:13:42 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGaBJX9qVXQXiFHPySfDz7SWYQ6+cbHvV5v3sw3tEv0Ow@mail.gmail.com>
Message-ID: <CAMj1kXGaBJX9qVXQXiFHPySfDz7SWYQ6+cbHvV5v3sw3tEv0Ow@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] riscv/efi_stub: Add support for
 RISCV_EFI_BOOT_PROTOCOL
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, linux-efi <linux-efi@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
 Abner Chang <abner.chang@hpe.com>, Jessica Clarke <jrtc27@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_031356_036557_E7698D24 
X-CRM114-Status: GOOD (  22.97  )
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

Hello Sunil,

On Wed, 26 Jan 2022 at 12:06, Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> This patch adds the support for getting the boot hart ID in
> Linux EFI stub using RISCV_EFI_BOOT_PROTOCOL.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/firmware/efi/libstub/efistub.h    | 15 ++++++++++++
>  drivers/firmware/efi/libstub/riscv-stub.c | 28 ++++++++++++++++++++---
>  include/linux/efi.h                       |  1 +
>  3 files changed, 41 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
> index edb77b0621ea..0428f8816942 100644
> --- a/drivers/firmware/efi/libstub/efistub.h
> +++ b/drivers/firmware/efi/libstub/efistub.h
> @@ -720,6 +720,21 @@ union efi_tcg2_protocol {
>         } mixed_mode;
>  };
>
> +typedef union riscv_efi_boot_protocol riscv_efi_boot_protocol_t;
> +
> +union riscv_efi_boot_protocol {
> +       struct {
> +               u64 revision;
> +               efi_status_t (__efiapi *get_boot_hartid)(
> +                                                        riscv_efi_boot_protocol_t *,
> +                                                        size_t *);
> +       };
> +       struct {
> +               u32 revision;
> +               u32 get_boot_hartid;
> +       } mixed_mode;
> +};
> +

You don't the mixed mode member here - this is for X64 kernels on IA32
firmware only.

>  typedef union efi_load_file_protocol efi_load_file_protocol_t;
>  typedef union efi_load_file_protocol efi_load_file2_protocol_t;
>
> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> index 380e4e251399..c7add4eb5453 100644
> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> @@ -46,12 +46,34 @@ static u32 get_boot_hartid_from_fdt(void)
>         return fdt32_to_cpu(*prop);
>  }
>
> +static u32 get_boot_hartid_from_efi(void)
> +{
> +       efi_guid_t boot_protocol_guid = RISCV_EFI_BOOT_PROTOCOL_GUID;
> +       efi_status_t status;
> +       riscv_efi_boot_protocol_t *boot_protocol;
> +       size_t boot_hart_id;
> +
> +       status = efi_bs_call(locate_protocol, &boot_protocol_guid, NULL,
> +                            (void **)&boot_protocol);
> +       if (status == EFI_SUCCESS) {
> +               status = efi_call_proto(boot_protocol,
> +                                       get_boot_hartid, &boot_hart_id);
> +               if (status == EFI_SUCCESS) {
> +                       return (u32)boot_hart_id;
> +               }
> +       }
> +       return U32_MAX;
> +}
> +
>  efi_status_t check_platform_features(void)
>  {
> -       hartid = get_boot_hartid_from_fdt();
> +       hartid = get_boot_hartid_from_efi();
>         if (hartid == U32_MAX) {
> -               efi_err("/chosen/boot-hartid missing or invalid!\n");
> -               return EFI_UNSUPPORTED;
> +               hartid = get_boot_hartid_from_fdt();
> +               if (hartid == U32_MAX) {
> +                       efi_err("/chosen/boot-hartid missing or invalid!\n");
> +                       return EFI_UNSUPPORTED;
> +               }
>         }
>         return EFI_SUCCESS;
>  }
> diff --git a/include/linux/efi.h b/include/linux/efi.h
> index ccd4d3f91c98..9822c730207c 100644
> --- a/include/linux/efi.h
> +++ b/include/linux/efi.h
> @@ -380,6 +380,7 @@ void efi_native_runtime_setup(void);
>  #define EFI_CONSOLE_OUT_DEVICE_GUID            EFI_GUID(0xd3b36f2c, 0xd551, 0x11d4,  0x9a, 0x46, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d)
>  #define APPLE_PROPERTIES_PROTOCOL_GUID         EFI_GUID(0x91bd12fe, 0xf6c3, 0x44fb,  0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0)
>  #define EFI_TCG2_PROTOCOL_GUID                 EFI_GUID(0x607f766c, 0x7455, 0x42be,  0x93, 0x0b, 0xe4, 0xd7, 0x6d, 0xb2, 0x72, 0x0f)
> +#define RISCV_EFI_BOOT_PROTOCOL_GUID           EFI_GUID(0xccd15fec, 0x6f73, 0x4eec,  0x83, 0x95, 0x3e, 0x69, 0xe4, 0xb9, 0x40, 0xbf)
>  #define EFI_LOAD_FILE_PROTOCOL_GUID            EFI_GUID(0x56ec3091, 0x954c, 0x11d2,  0x8e, 0x3f, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b)
>  #define EFI_LOAD_FILE2_PROTOCOL_GUID           EFI_GUID(0x4006c0c1, 0xfcb3, 0x403e,  0x99, 0x6d, 0x4a, 0x6c, 0x87, 0x24, 0xe0, 0x6d)
>  #define EFI_RT_PROPERTIES_TABLE_GUID           EFI_GUID(0xeb66918a, 0x7eef, 0x402a,  0x84, 0x2e, 0x93, 0x1d, 0x21, 0xc3, 0x8a, 0xe9)
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
