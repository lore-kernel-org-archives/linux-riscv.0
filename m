Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0603C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 19 May 2022 05:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v4timtwmi8yadal/29GYtNKXgwL0yAXVUdje1heuzPM=; b=Z85D5WgvADI9Zs
	tNLWYD1L4CZbzBC9UA6xTJrvdAp/YnhfHYZsjo7Ny16OxRHWhB7rNVY6jvDEnDqtdbQp1zUFX1KMi
	DDXt/invqbzGa36KqA2ZvnHfSwPds8GPUKTUh/Gv0hQ3RaMwL+FiDDbsx+nu69m7jAajzn55VFX6m
	AEaTbhy8/KSBBKo6Wq2DqEr3ueErTyb38Nmu6AYF89UReCRA2MHJmpO9xTq0b4w/Z8Bs+r9v3PFLN
	d6WHpXR8+CQzc/IC8M/w0oE3gYhxAEP6ruaQNu4dQIOF3HhYUYu9M5cD0yYHhlVZp7mEywx4GmCdq
	lJizujgOTG5IXvQh99Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrYXU-0054kC-Dh; Thu, 19 May 2022 05:17:32 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrYXR-0054jE-DU
 for linux-riscv@lists.infradead.org; Thu, 19 May 2022 05:17:31 +0000
Received: by mail-pl1-x62a.google.com with SMTP id 10so368361plj.0
 for <linux-riscv@lists.infradead.org>; Wed, 18 May 2022 22:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zAUUyXF7zOYAAXxr10cwniZUmfce9SsmSNMPASYnhsg=;
 b=eYIsG1fMr9NialLjEJm93FuKci9KO0OYOl1IUUfyTHtBVKLLwP8L8g5twIaeGN1v3Y
 +egpZA31XyzUZ3yHYEApTp9WwcHCBZDuByDN1LUTe4oUl5ZIeJ2VI5Ho11ODmbXpIFUT
 BFvHwghVmbviJkeSrIykz2lnCJ0XvcWANywlVRH7WOffQADJ9EUIuqhpUuR3/O1KzpCV
 BvpiLykKvo+5DBPRJOttKdIuDYANYeG4iVyLv4AvPbpyxmW0tKLCaWTTIssOHmLQYnYU
 237j0O03RU/pNLwPxF1eNunxKzMNLonrrWRjHSGF/oIQoZwmcdQtmZRY9/paQkbXXg2b
 wY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zAUUyXF7zOYAAXxr10cwniZUmfce9SsmSNMPASYnhsg=;
 b=InhyyASOlU7Ju7rwZLrOO3lDSg2Q62uoUbQ/dPu80j7maz+hfHN5bOhbVXvf6cCLtd
 PuhNdDwBOhPt8Qtt8LKh+fIpUYV1lUDLzqjGeUyWZmdJnA7q0qfcXllSKWePM/WX+sCJ
 8c9u2Zrv7lWvd5vKUuaFTOUOar8qC2V7v82Vm+BMg78CO8DlnRhoBq6cSFXo0vU6HR+Z
 LQVBUd4a71OrM45H6jEVduhhp5iOcPFbmSPvNhgTPAx4xcdG/p9ii00YaWvt9hqMldOf
 ytjhL9pP7bDuO2atA8+d9EDJ+bSqTtq6OB8VPHVa5SqTJYLMtCv8ri7fYJjabihXB51g
 713Q==
X-Gm-Message-State: AOAM531xCNNAUTeCEVYpuKQg1fOIL7oX/zUmstTkDr76JY8vKN895MmF
 qz/N/ECZrZ7G02fiErOudJ5Edg==
X-Google-Smtp-Source: ABdhPJzcgO8ll6kSjyrY8Y1n90kzQWUUiWkAMrTkKPO+8+uxSumaEv0lj6uRSB8qPKkCaLkj4v1dgA==
X-Received: by 2002:a17:902:7087:b0:161:88a4:db37 with SMTP id
 z7-20020a170902708700b0016188a4db37mr3053810plk.131.1652937447786; 
 Wed, 18 May 2022 22:17:27 -0700 (PDT)
Received: from sunil-laptop ([49.206.10.235]) by smtp.gmail.com with ESMTPSA id
 p23-20020a1709027ed700b0015e8da1fb07sm2745664plb.127.2022.05.18.22.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 22:17:27 -0700 (PDT)
Date: Thu, 19 May 2022 10:47:20 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Abner Chang <abner.chang@hpe.com>,
 linux-efi <linux-efi@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH V4 1/1] riscv/efi_stub: Add support for
 RISCV_EFI_BOOT_PROTOCOL
Message-ID: <20220519051720.GA8910@sunil-laptop>
References: <20220518095646.47548-1-sunilvl@ventanamicro.com>
 <20220518095646.47548-2-sunilvl@ventanamicro.com>
 <CAMj1kXF2N+0zRCNg0Aq9Y8Y35FUaQ1V+swzY__y86sayKW7PPA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXF2N+0zRCNg0Aq9Y8Y35FUaQ1V+swzY__y86sayKW7PPA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_221729_494358_5548E141 
X-CRM114-Status: GOOD (  27.64  )
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

On Wed, May 18, 2022 at 11:03:44PM +0200, Ard Biesheuvel wrote:
> On Wed, 18 May 2022 at 11:57, Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > This patch adds the support for getting the boot hart ID in
> > Linux EFI stub using RISCV_EFI_BOOT_PROTOCOL. This protocol
> > is preferred method over existing DT based solution since it
> > works irrespective of DT or ACPI.
> >
> > The specification of the protocol is hosted at:
> > https://github.com/riscv-non-isa/riscv-uefi
> >
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> > ---
> >  drivers/firmware/efi/libstub/efistub.h    |  7 ++++++
> >  drivers/firmware/efi/libstub/riscv-stub.c | 29 +++++++++++++++++++----
> >  include/linux/efi.h                       |  1 +
> >  3 files changed, 32 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
> > index edb77b0621ea..aced62a0907e 100644
> > --- a/drivers/firmware/efi/libstub/efistub.h
> > +++ b/drivers/firmware/efi/libstub/efistub.h
> > @@ -720,6 +720,13 @@ union efi_tcg2_protocol {
> >         } mixed_mode;
> >  };
> >
> > +struct riscv_efi_boot_protocol {
> > +       u64 revision;
> > +
> > +       efi_status_t (__efiapi * get_boot_hartid)(struct riscv_efi_boot_protocol *this,
> > +                                                 size_t *boot_hartid);
> 
> size_t is not a EFI type, and your spec uses UINTN here, which is
> equivalent to 'unsigned long'. However, jump_kernel_func() takes a
> unsigned int for the hartid. Please clean this up.
> 
Thank you Ard. Yes, hartid can be of native length. Have fixed this and
sent V5. Please check.

Thanks!
Sunil
> 
> > +};
> > +
> >  typedef union efi_load_file_protocol efi_load_file_protocol_t;
> >  typedef union efi_load_file_protocol efi_load_file2_protocol_t;
> >
> > diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> > index 9c460843442f..012504f6f9a4 100644
> > --- a/drivers/firmware/efi/libstub/riscv-stub.c
> > +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> > @@ -23,7 +23,7 @@
> >
> >  typedef void __noreturn (*jump_kernel_func)(unsigned int, unsigned long);
> >
> > -static u32 hartid;
> > +static size_t hartid;
> >
> 
> and here
> 
> >  static int get_boot_hartid_from_fdt(void)
> >  {
> > @@ -47,14 +47,33 @@ static int get_boot_hartid_from_fdt(void)
> >         return 0;
> >  }
> >
> > +static efi_status_t get_boot_hartid_from_efi(void)
> > +{
> > +       efi_guid_t boot_protocol_guid = RISCV_EFI_BOOT_PROTOCOL_GUID;
> > +       efi_status_t status;
> > +       struct riscv_efi_boot_protocol *boot_protocol;
> > +
> > +       status = efi_bs_call(locate_protocol, &boot_protocol_guid, NULL,
> > +                            (void **)&boot_protocol);
> > +       if (status == EFI_SUCCESS) {
> > +               status = efi_call_proto(boot_protocol,
> > +                                       get_boot_hartid, &hartid);
> > +       }
> > +       return status;
> > +}
> > +
> >  efi_status_t check_platform_features(void)
> >  {
> >         int ret;
> > +       efi_status_t status;
> >
> > -       ret = get_boot_hartid_from_fdt();
> > -       if (ret) {
> > -               efi_err("/chosen/boot-hartid missing or invalid!\n");
> > -               return EFI_UNSUPPORTED;
> > +       status = get_boot_hartid_from_efi();
> > +       if (status != EFI_SUCCESS) {
> > +               ret = get_boot_hartid_from_fdt();
> > +               if (ret) {
> > +                       efi_err("Failed to get boot hartid!\n");
> > +                       return EFI_UNSUPPORTED;
> > +               }
> >         }
> >         return EFI_SUCCESS;
> >  }
> > diff --git a/include/linux/efi.h b/include/linux/efi.h
> > index ccd4d3f91c98..9822c730207c 100644
> > --- a/include/linux/efi.h
> > +++ b/include/linux/efi.h
> > @@ -380,6 +380,7 @@ void efi_native_runtime_setup(void);
> >  #define EFI_CONSOLE_OUT_DEVICE_GUID            EFI_GUID(0xd3b36f2c, 0xd551, 0x11d4,  0x9a, 0x46, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d)
> >  #define APPLE_PROPERTIES_PROTOCOL_GUID         EFI_GUID(0x91bd12fe, 0xf6c3, 0x44fb,  0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0)
> >  #define EFI_TCG2_PROTOCOL_GUID                 EFI_GUID(0x607f766c, 0x7455, 0x42be,  0x93, 0x0b, 0xe4, 0xd7, 0x6d, 0xb2, 0x72, 0x0f)
> > +#define RISCV_EFI_BOOT_PROTOCOL_GUID           EFI_GUID(0xccd15fec, 0x6f73, 0x4eec,  0x83, 0x95, 0x3e, 0x69, 0xe4, 0xb9, 0x40, 0xbf)
> >  #define EFI_LOAD_FILE_PROTOCOL_GUID            EFI_GUID(0x56ec3091, 0x954c, 0x11d2,  0x8e, 0x3f, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b)
> >  #define EFI_LOAD_FILE2_PROTOCOL_GUID           EFI_GUID(0x4006c0c1, 0xfcb3, 0x403e,  0x99, 0x6d, 0x4a, 0x6c, 0x87, 0x24, 0xe0, 0x6d)
> >  #define EFI_RT_PROPERTIES_TABLE_GUID           EFI_GUID(0xeb66918a, 0x7eef, 0x402a,  0x84, 0x2e, 0x93, 0x1d, 0x21, 0xc3, 0x8a, 0xe9)
> > --
> > 2.25.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
