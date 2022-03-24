Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F645C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 11:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOpyuK7GWbOfnZ5spdtQplFmtFWI2VJvGXdMhNfIQ7U=; b=O7dEKTk9ytfh2w
	lQcKUKCNXnrlW2Bx8w81rLa3d0XPF40N48Wfmprtl3m1i5IFcZjTJtgvxhbQG+0kCOXPx4J6rrb6e
	4H+KpzR/yNpwZfzufzOIupAIx0DzA5cWbNmx9VxMuRKzlaqu+JABtK0rRlzXZp3+bk9It/M9xglr7
	/fkCD2+zsGx5Pqu/CehFww8lKfBGaQwv4TTXv04c8Ooa5CQwHV9QAjUWapi0/LrDKkhAXLxAts8mL
	LSZcj9bkd3uH1XP5uwnbKqRe6/u0q8M1WF7gSPNtgwGD4P/XznbHzF7zz8LLUrbpOe8H1WaJTG6CW
	nwPPNKaIY2QajW2/ErsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXLDP-00GI3n-MB; Thu, 24 Mar 2022 11:01:16 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXLDM-00GI2G-BW
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 11:01:14 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 gp15-20020a17090adf0f00b001c7cd11b0b3so276714pjb.3
 for <linux-riscv@lists.infradead.org>; Thu, 24 Mar 2022 04:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TgxDvrGaoMcFgStBxDsJOk2r+RouA2NL1p9DYfmaMws=;
 b=dl3kUSUKr6hRrdJIc2h86tl6HHGvyog2XfukxAIGMMQBC4lsYPXJ404lp5Fm56hBgt
 juKH2zHD+Ma/ZSZYMI5w3ChJsT+ZaA3YcWyYNOXgl+yrf4XXUrPxU8CElLn4q/NB3b0x
 EZ5K2YdEj4we4YyKg7/vkDCA1Fkne5pdLbT/Uf6ibsV6C9PJOOejFHReVnm0NInquWB4
 4Lr6wx8TFnkXh+2RlArZKstGwCNrp5Hh+uyp9E+suexcGmEftGFsvMcB66WY7KqMuw8R
 2xSknYUMcQbnDozIKc0X7AbVPfVScJeQRCPw/YKf3xVQADR7QFY8GpJaCl7KGt9guJRF
 Pb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TgxDvrGaoMcFgStBxDsJOk2r+RouA2NL1p9DYfmaMws=;
 b=e+XMuv6UJFj+tmpMmipO1GGsQM/FJcd8arkqEUKFRHILGnzcN8Ui1vYNKmX7DkvYkU
 1+xvfh1INMgGYbzE4D7EW5hGAi3/Q4nzPcqzaLR0G3ZadD02MFmUtGgyfnIgKqqEp8Es
 LNnP5B9L5Lk/SscG3zHaNTUxeXqg9ly/ZzEmzVyq7NBjNuT5WUv0rTHI+KrWY8Mji1Gx
 nkCFpbjLwa+9gfKEVHbJAlRdW536Xwc8opgShUFE9PuPSBXpeT9gP0REJKEBeQSUdWwJ
 9n8k1dXHXOKzzVRTrWQN3GTrsuCOq/2g+WMEVsDc1uBL9zcVDA/A3k3osdLo6BkTLwIW
 g2WQ==
X-Gm-Message-State: AOAM531CA7l+eBCGw1y0Nbhwc+f4Eyz5c6+tEhHaVBzLHO8H/SrXtnKC
 CKy86K7Sq4YTEZZ3k9/wtfnjmA==
X-Google-Smtp-Source: ABdhPJyn/dodVmHBih3bECPHt+1UUA3UbDcrcUkYbhDx74DUGpzeJn7hv2UTAgKdnJd8CFFz6OJZow==
X-Received: by 2002:a17:902:cf0f:b0:154:70ca:11d0 with SMTP id
 i15-20020a170902cf0f00b0015470ca11d0mr5211055plg.28.1648119671399; 
 Thu, 24 Mar 2022 04:01:11 -0700 (PDT)
Received: from sunil-laptop ([49.206.7.17]) by smtp.gmail.com with ESMTPSA id
 d11-20020a056a00198b00b004fa7da68465sm3172992pfl.60.2022.03.24.04.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 04:01:11 -0700 (PDT)
Date: Thu, 24 Mar 2022 16:31:01 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: ardb@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, heinrich.schuchardt@canonical.com,
 Atish Patra <atishp@rivosinc.com>, apatel@ventanamicro.com,
 abner.chang@hpe.com, jrtc27@jrtc27.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH V2 1/1] riscv/efi_stub: Add support for
 RISCV_EFI_BOOT_PROTOCOL
Message-ID: <20220324110101.GA36244@sunil-laptop>
References: <20220303145944.307321-2-sunilvl@ventanamicro.com>
 <mhng-8685b269-d3cf-4dbb-b2d2-bd79266ac477@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-8685b269-d3cf-4dbb-b2d2-bd79266ac477@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_040112_436948_424B30D0 
X-CRM114-Status: GOOD (  25.09  )
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

On Tue, Mar 22, 2022 at 06:32:20PM -0700, Palmer Dabbelt wrote:
> On Thu, 03 Mar 2022 06:59:44 PST (-0800), sunilvl@ventanamicro.com wrote:
> > This patch adds the support for getting the boot hart ID in
> > Linux EFI stub using RISCV_EFI_BOOT_PROTOCOL. This protocol
> > is preferred method over existing DT based solution since it
> > works irrespective of DT or ACPI.
> > 
> > The specification of the protocol is hosted at:
> > https://github.com/riscv-non-isa/riscv-uefi
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
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
> >  	} mixed_mode;
> >  };
> > 
> > +struct riscv_efi_boot_protocol {
> > +	u64 revision;
> > +
> > +	efi_status_t (__efiapi * get_boot_hartid)(struct riscv_efi_boot_protocol *this,
> > +						  size_t *boot_hartid);
> > +};
> > +
> >  typedef union efi_load_file_protocol efi_load_file_protocol_t;
> >  typedef union efi_load_file_protocol efi_load_file2_protocol_t;
> > 
> > diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> > index 9c460843442f..915ad209d004 100644
> > --- a/drivers/firmware/efi/libstub/riscv-stub.c
> > +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> > @@ -23,7 +23,7 @@
> > 
> >  typedef void __noreturn (*jump_kernel_func)(unsigned int, unsigned long);
> > 
> > -static u32 hartid;
> > +static size_t hartid;
> > 
> >  static int get_boot_hartid_from_fdt(void)
> >  {
> > @@ -47,14 +47,33 @@ static int get_boot_hartid_from_fdt(void)
> >  	return 0;
> >  }
> > 
> > +static efi_status_t get_boot_hartid_from_efi(void)
> > +{
> > +	efi_guid_t boot_protocol_guid = RISCV_EFI_BOOT_PROTOCOL_GUID;
> > +	efi_status_t status;
> > +	struct riscv_efi_boot_protocol *boot_protocol;
> > +
> > +	status = efi_bs_call(locate_protocol, &boot_protocol_guid, NULL,
> > +			     (void **)&boot_protocol);
> > +	if (status == EFI_SUCCESS) {
> > +		status = efi_call_proto(boot_protocol,
> > +					get_boot_hartid, &hartid);
> > +	}
> > +	return status;
> > +}
> > +
> >  efi_status_t check_platform_features(void)
> >  {
> >  	int ret;
> > +	efi_status_t status;
> > 
> > -	ret = get_boot_hartid_from_fdt();
> > -	if (ret) {
> > -		efi_err("/chosen/boot-hartid missing or invalid!\n");
> > -		return EFI_UNSUPPORTED;
> > +	status = get_boot_hartid_from_efi();
> > +	if (status != EFI_SUCCESS) {
> > +		ret = get_boot_hartid_from_fdt();
> > +		if (ret) {
> > +			efi_err("/chosen/boot-hartid missing or invalid!\n");
> 
> Is that the right error message?  IIUC it doesn't really make sense in an
> ACPI context, that's a DT-ism.

Sure. Will update this message in next version.

Thanks
Sunil
> 
> > +			return EFI_UNSUPPORTED;
> > +		}
> >  	}
> >  	return EFI_SUCCESS;
> >  }
> > diff --git a/include/linux/efi.h b/include/linux/efi.h
> > index ccd4d3f91c98..9822c730207c 100644
> > --- a/include/linux/efi.h
> > +++ b/include/linux/efi.h
> > @@ -380,6 +380,7 @@ void efi_native_runtime_setup(void);
> >  #define EFI_CONSOLE_OUT_DEVICE_GUID		EFI_GUID(0xd3b36f2c, 0xd551, 0x11d4,  0x9a, 0x46, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d)
> >  #define APPLE_PROPERTIES_PROTOCOL_GUID		EFI_GUID(0x91bd12fe, 0xf6c3, 0x44fb,  0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0)
> >  #define EFI_TCG2_PROTOCOL_GUID			EFI_GUID(0x607f766c, 0x7455, 0x42be,  0x93, 0x0b, 0xe4, 0xd7, 0x6d, 0xb2, 0x72, 0x0f)
> > +#define RISCV_EFI_BOOT_PROTOCOL_GUID		EFI_GUID(0xccd15fec, 0x6f73, 0x4eec,  0x83, 0x95, 0x3e, 0x69, 0xe4, 0xb9, 0x40, 0xbf)
> >  #define EFI_LOAD_FILE_PROTOCOL_GUID		EFI_GUID(0x56ec3091, 0x954c, 0x11d2,  0x8e, 0x3f, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b)
> >  #define EFI_LOAD_FILE2_PROTOCOL_GUID		EFI_GUID(0x4006c0c1, 0xfcb3, 0x403e,  0x99, 0x6d, 0x4a, 0x6c, 0x87, 0x24, 0xe0, 0x6d)
> >  #define EFI_RT_PROPERTIES_TABLE_GUID		EFI_GUID(0xeb66918a, 0x7eef, 0x402a,  0x84, 0x2e, 0x93, 0x1d, 0x21, 0xc3, 0x8a, 0xe9)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
