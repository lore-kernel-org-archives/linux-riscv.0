Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A576C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 21:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hAo8V3m8AbIKDFOzGlmo6UHstN8Y/0gbPmOGvhPtNww=; b=uxYWWFn06HDOzz
	kPEn6dpIJZ9Rv2pAQf/fZQzZXpzdLXzgqlvRhzVxL5DO5QQ5dqYMf7lIFFBDND4Uqr65XS8nSFErO
	MMJI3SFKjUc6fsC2zYhAo77wgkR9iuTAZtcseQxXyggokKKGHwQzG8D7VmTQAqYys/jenxQ7qtIwp
	BoqROEbfK0NJisOHmE4MjjULbL3NFeGbPLua+CnsTn8g+9+cevjv7JmJNwy8F7tolWQk6tH6OA9MV
	hZrZOsW4p9y7vdIkA/op2JZStBw53p/YeRNvPKWmcITMU6eJv5latjeAXZwRA/59pKKHPVo9yExLC
	3B+1HxLBbvBx6c6sR1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrQps-003zEt-AJ; Wed, 18 May 2022 21:04:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrQpp-003zEa-UL
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 21:03:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13DD160FCF
 for <linux-riscv@lists.infradead.org>; Wed, 18 May 2022 21:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790F0C34118
 for <linux-riscv@lists.infradead.org>; Wed, 18 May 2022 21:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652907836;
 bh=C6ZPEPxOZAN12azD/fwrk+j/6+C5D+/6JNnA8f0Hn7A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KdlUM67kO4vLjc+9iXpu0HAnvVxOp555umS5H+ikJYYBRpEIsdKSj9ues56wGG5y5
 9EpT3b1LdmueOYEf1vkgQXdlCMxJvZPinX4EYDZKL7TyEaC614UC3wCB/6zFs4M0D4
 RsE6zlAlBNO9HAbRyyJYCBEBbt/4SMTWPcs+BvnpdzlNPznEgFCW/Agi3CSFXER2FS
 0/COcp3KrMY/zUY2cavHMXAGGorH9yA5bHqVQ1Y+Jxk1BhtN+a072UOfZCdMNa2Xzs
 2wKbozqpFaZROYYHeOQ4BoqwvTmMbd5CQwljEhe8pQnLYzCUopoiP7ylMUgIxoyQFf
 OY7uaGzddauiQ==
Received: by mail-oi1-f176.google.com with SMTP id l16so4193857oil.6
 for <linux-riscv@lists.infradead.org>; Wed, 18 May 2022 14:03:56 -0700 (PDT)
X-Gm-Message-State: AOAM5311su9S17+n/Cp1sVnKE05dpD3I6Msbcnu+/YksYVLIwmcgNis0
 icDxhyquRsczj5S36J40kTB/UOrYoRrF/ZD70rs=
X-Google-Smtp-Source: ABdhPJxAy0RYlypDvElW+UxqxkK2Lu4KGok9yXXBZxGkdD9cQ5Fo0NzIt8Z1EFuUYz6J3hd2igAnh7kCqgXYR+7pJsI=
X-Received: by 2002:a05:6808:e8d:b0:322:bac0:2943 with SMTP id
 k13-20020a0568080e8d00b00322bac02943mr885914oil.126.1652907835508; Wed, 18
 May 2022 14:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220518095646.47548-1-sunilvl@ventanamicro.com>
 <20220518095646.47548-2-sunilvl@ventanamicro.com>
In-Reply-To: <20220518095646.47548-2-sunilvl@ventanamicro.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 18 May 2022 23:03:44 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF2N+0zRCNg0Aq9Y8Y35FUaQ1V+swzY__y86sayKW7PPA@mail.gmail.com>
Message-ID: <CAMj1kXF2N+0zRCNg0Aq9Y8Y35FUaQ1V+swzY__y86sayKW7PPA@mail.gmail.com>
Subject: Re: [PATCH V4 1/1] riscv/efi_stub: Add support for
 RISCV_EFI_BOOT_PROTOCOL
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@rivosinc.com>, 
 Anup Patel <apatel@ventanamicro.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Abner Chang <abner.chang@hpe.com>, linux-efi <linux-efi@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_140358_090856_05827E68 
X-CRM114-Status: GOOD (  26.49  )
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

On Wed, 18 May 2022 at 11:57, Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> This patch adds the support for getting the boot hart ID in
> Linux EFI stub using RISCV_EFI_BOOT_PROTOCOL. This protocol
> is preferred method over existing DT based solution since it
> works irrespective of DT or ACPI.
>
> The specification of the protocol is hosted at:
> https://github.com/riscv-non-isa/riscv-uefi
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  drivers/firmware/efi/libstub/efistub.h    |  7 ++++++
>  drivers/firmware/efi/libstub/riscv-stub.c | 29 +++++++++++++++++++----
>  include/linux/efi.h                       |  1 +
>  3 files changed, 32 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
> index edb77b0621ea..aced62a0907e 100644
> --- a/drivers/firmware/efi/libstub/efistub.h
> +++ b/drivers/firmware/efi/libstub/efistub.h
> @@ -720,6 +720,13 @@ union efi_tcg2_protocol {
>         } mixed_mode;
>  };
>
> +struct riscv_efi_boot_protocol {
> +       u64 revision;
> +
> +       efi_status_t (__efiapi * get_boot_hartid)(struct riscv_efi_boot_protocol *this,
> +                                                 size_t *boot_hartid);

size_t is not a EFI type, and your spec uses UINTN here, which is
equivalent to 'unsigned long'. However, jump_kernel_func() takes a
unsigned int for the hartid. Please clean this up.


> +};
> +
>  typedef union efi_load_file_protocol efi_load_file_protocol_t;
>  typedef union efi_load_file_protocol efi_load_file2_protocol_t;
>
> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> index 9c460843442f..012504f6f9a4 100644
> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> @@ -23,7 +23,7 @@
>
>  typedef void __noreturn (*jump_kernel_func)(unsigned int, unsigned long);
>
> -static u32 hartid;
> +static size_t hartid;
>

and here

>  static int get_boot_hartid_from_fdt(void)
>  {
> @@ -47,14 +47,33 @@ static int get_boot_hartid_from_fdt(void)
>         return 0;
>  }
>
> +static efi_status_t get_boot_hartid_from_efi(void)
> +{
> +       efi_guid_t boot_protocol_guid = RISCV_EFI_BOOT_PROTOCOL_GUID;
> +       efi_status_t status;
> +       struct riscv_efi_boot_protocol *boot_protocol;
> +
> +       status = efi_bs_call(locate_protocol, &boot_protocol_guid, NULL,
> +                            (void **)&boot_protocol);
> +       if (status == EFI_SUCCESS) {
> +               status = efi_call_proto(boot_protocol,
> +                                       get_boot_hartid, &hartid);
> +       }
> +       return status;
> +}
> +
>  efi_status_t check_platform_features(void)
>  {
>         int ret;
> +       efi_status_t status;
>
> -       ret = get_boot_hartid_from_fdt();
> -       if (ret) {
> -               efi_err("/chosen/boot-hartid missing or invalid!\n");
> -               return EFI_UNSUPPORTED;
> +       status = get_boot_hartid_from_efi();
> +       if (status != EFI_SUCCESS) {
> +               ret = get_boot_hartid_from_fdt();
> +               if (ret) {
> +                       efi_err("Failed to get boot hartid!\n");
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
