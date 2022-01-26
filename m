Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B83C2BA4C
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jan 2022 11:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4DSLe3Kot4FJKljbhXwP3PzQjp1TWfmSLlWON1hO/vw=; b=QHHWh4Vcj5IIiL
	BSi1ZA5EgVNygjzNcV+kQp96KSlLk1FRU/vNO5+6bmGNMOZQm1AFCC2Xw2J8v38j6xArkD5Jy0HEI
	5E51yeEBflGL/uyKEg/F2ms2ahbwXu9xRYQOwJ/3TUrM1+l4lCZJSL9El9un4sgtQmWJZUKq2on0H
	uOTCNE8/J/ueIP6/rrJdwMA80plTJV9ESGNxFscJ+nwiuYUSrRCxqXWXVsjTJnFi0+yx08w2QknEC
	OWfA24okHzUCK8iemAgB94EnwJe4V4B/0Z1KOxxNLH57YwkMwidTv21nshu9yxh25gEAH7r5fOhIP
	4vQ06EhvconQzT86kyiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgoS-00BZtQ-Ok; Wed, 26 Jan 2022 11:50:08 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCgkR-00BY46-C7
 for linux-riscv@lists.infradead.org; Wed, 26 Jan 2022 11:46:05 +0000
Received: by mail-pf1-x429.google.com with SMTP id d187so1113070pfa.10
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 03:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=b2YyWOge0M5kIT2ntqlrnr8NQs2OgZVVCHIbAnzaaKE=;
 b=WWfym4P+R3+IwpIxkHRmeB3tynZEscCZnnZFQ1YzNukA01mkuDYl6d6i0ahPydblHO
 AtQpFKqiEmopvLkUdF8SPT3UCWN2zo2PkJlketuHAyWOJs1Egydvx1C7wfNtGJK3pGsx
 DIv2rwUpj/l6XDgrxw6d+aHzeeIJY8aBeKMyjw4HWN5NOIWWRTfyS4FCNE9ccyWlkGdb
 Zf1j5vo2fJosqpjNgc7nwLvJaGWi9wGl1DB3ZFhfTbcFI9HvS1pX3SnT2qLvg3fnH0Ey
 NWyuC6ckMkdcCBYNd2PTyVoqfPtqgAPpS6Lg/cUpo1nJY6xGWBu6z+Fnegr/1N7X2+1M
 Hzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b2YyWOge0M5kIT2ntqlrnr8NQs2OgZVVCHIbAnzaaKE=;
 b=yrm6o2Ab/v0q/6iUKm51LefEiu84mR7Na24UOYFDVDlgFXT85qZl+903DkH+pqx4m0
 WuRQYgwtsC68CJBJQt+uDa1eBykjbWOK87wG5+ji17kA7iwDaK/LPDUHTh/TaLgUfaHO
 Mfowx04PM9JSrZubnm6E4aJKHmqeUTaGpkOHBPtXqwxLFZdVlwbwGYg52DJs3TzM1v5C
 ZTudK0fcly0t6pJPBccm4tYBCt09Zxbb/DtkIEewQtsTxFFfjAb56qxL7yCTiw3HIB4K
 dNAMq/eZ+AIoB62le0qJjwas5Ie3MT07WS5ia5v62JtXDTaUCIQjoc5CioBZyX0p2t8h
 MVCA==
X-Gm-Message-State: AOAM5305oX9XD0MAgIEwYLH5iNUUBf51EJb+rxlbk8ZyaOQABVjVCU9Q
 iwK7ijtdakh1fIHKjhbKAcALKA==
X-Google-Smtp-Source: ABdhPJyzaxql9iVXuLykTnyDGM1rb4BxxzxCMBfHaQkTumc+35DPn7h/HgwDnFeQSyGT+oLQfq6hHQ==
X-Received: by 2002:a63:6f07:: with SMTP id k7mr18454510pgc.574.1643197558636; 
 Wed, 26 Jan 2022 03:45:58 -0800 (PST)
Received: from sunil-ThinkPad-T490 ([49.206.3.187])
 by smtp.gmail.com with ESMTPSA id na7sm3055210pjb.23.2022.01.26.03.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 03:45:58 -0800 (PST)
Date: Wed, 26 Jan 2022 17:15:49 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-efi <linux-efi@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
 Abner Chang <abner.chang@hpe.com>, Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [RFC PATCH 1/1] riscv/efi_stub: Add support for
 RISCV_EFI_BOOT_PROTOCOL
Message-ID: <20220126114549.GA35654@sunil-ThinkPad-T490>
References: <20220126110615.33371-1-sunilvl@ventanamicro.com>
 <20220126110615.33371-2-sunilvl@ventanamicro.com>
 <CAMj1kXGaBJX9qVXQXiFHPySfDz7SWYQ6+cbHvV5v3sw3tEv0Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXGaBJX9qVXQXiFHPySfDz7SWYQ6+cbHvV5v3sw3tEv0Ow@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_034559_509022_7AEB11F9 
X-CRM114-Status: GOOD (  23.41  )
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

On Wed, Jan 26, 2022 at 12:13:42PM +0100, Ard Biesheuvel wrote:
> Hello Sunil,
> 
> On Wed, 26 Jan 2022 at 12:06, Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > This patch adds the support for getting the boot hart ID in
> > Linux EFI stub using RISCV_EFI_BOOT_PROTOCOL.
> >
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  drivers/firmware/efi/libstub/efistub.h    | 15 ++++++++++++
> >  drivers/firmware/efi/libstub/riscv-stub.c | 28 ++++++++++++++++++++---
> >  include/linux/efi.h                       |  1 +
> >  3 files changed, 41 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
> > index edb77b0621ea..0428f8816942 100644
> > --- a/drivers/firmware/efi/libstub/efistub.h
> > +++ b/drivers/firmware/efi/libstub/efistub.h
> > @@ -720,6 +720,21 @@ union efi_tcg2_protocol {
> >         } mixed_mode;
> >  };
> >
> > +typedef union riscv_efi_boot_protocol riscv_efi_boot_protocol_t;
> > +
> > +union riscv_efi_boot_protocol {
> > +       struct {
> > +               u64 revision;
> > +               efi_status_t (__efiapi *get_boot_hartid)(
> > +                                                        riscv_efi_boot_protocol_t *,
> > +                                                        size_t *);
> > +       };
> > +       struct {
> > +               u32 revision;
> > +               u32 get_boot_hartid;
> > +       } mixed_mode;
> > +};
> > +
> 
> You don't the mixed mode member here - this is for X64 kernels on IA32
> firmware only.

Ah OK. Thanks for the feedback, Ard. Will remove it in next version.

Thanks
Sunil
> 
> >  typedef union efi_load_file_protocol efi_load_file_protocol_t;
> >  typedef union efi_load_file_protocol efi_load_file2_protocol_t;
> >
> > diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> > index 380e4e251399..c7add4eb5453 100644
> > --- a/drivers/firmware/efi/libstub/riscv-stub.c
> > +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> > @@ -46,12 +46,34 @@ static u32 get_boot_hartid_from_fdt(void)
> >         return fdt32_to_cpu(*prop);
> >  }
> >
> > +static u32 get_boot_hartid_from_efi(void)
> > +{
> > +       efi_guid_t boot_protocol_guid = RISCV_EFI_BOOT_PROTOCOL_GUID;
> > +       efi_status_t status;
> > +       riscv_efi_boot_protocol_t *boot_protocol;
> > +       size_t boot_hart_id;
> > +
> > +       status = efi_bs_call(locate_protocol, &boot_protocol_guid, NULL,
> > +                            (void **)&boot_protocol);
> > +       if (status == EFI_SUCCESS) {
> > +               status = efi_call_proto(boot_protocol,
> > +                                       get_boot_hartid, &boot_hart_id);
> > +               if (status == EFI_SUCCESS) {
> > +                       return (u32)boot_hart_id;
> > +               }
> > +       }
> > +       return U32_MAX;
> > +}
> > +
> >  efi_status_t check_platform_features(void)
> >  {
> > -       hartid = get_boot_hartid_from_fdt();
> > +       hartid = get_boot_hartid_from_efi();
> >         if (hartid == U32_MAX) {
> > -               efi_err("/chosen/boot-hartid missing or invalid!\n");
> > -               return EFI_UNSUPPORTED;
> > +               hartid = get_boot_hartid_from_fdt();
> > +               if (hartid == U32_MAX) {
> > +                       efi_err("/chosen/boot-hartid missing or invalid!\n");
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
