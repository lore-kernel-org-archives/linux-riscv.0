Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F599C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 11:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jIdn/s+MS12Jerah5usOoWnUw+xTMgOR6IxaX2rbM2I=; b=00v7Xtfo2gbDFt
	GpeSqHA06IbxOBBiEvZFNKv4cLFa7xEsiSuSa2hBJfTwqBbkSp2yWEYgYI4Fkk+3m18JN9Z8lo3il
	7GnMBVstiy9kVKXZBBFrc0qNSkFJ5MfBR+Z4PG15eVc7Z1OHDGxW4fJEpMZJNfyZkzBaGRdMp8MI0
	LdLcEkUTlRFWTk+hucL8JKZ070MAE/E5+T5YE42gIp1JVRYoIdcq/0Vz/APp3OFxLBvoVUWQ57WTG
	UtGSGj25rVVVzHoPDo1GN3R360b86252YwRphSvFGjKO4hBhOO0yq42OaichbH0YlLaDHVBhbxyFx
	kjDmS/VeZqIJZxqu7EgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXLv7-00GNRD-Hg; Thu, 24 Mar 2022 11:46:25 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXLv4-00GNPy-JZ
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 11:46:24 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7CDD13F1DD
 for <linux-riscv@lists.infradead.org>; Thu, 24 Mar 2022 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1648122374;
 bh=5o2Wrz52BFS+sHKlhOBzNp+TO7Z2H2kPAxclwT0DlNs=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=nlaokuM5R7KBQ1FrF/S/YHJ1nQ/0JeFUSV3eqcsCUgM6ADYckZYXK2E4j6afPuMOq
 EfCIRHUKXtmKbRmTNOtn7JIXtFL8RmHqaYI/u6fwASvdSULZD+OMNPF4u9/laG8KeP
 jkvHxcm9EkFIB0vb5NaMyvPmLTCdyGeFiMv/vQhlKrWVhSh3KN19tPgFzpJUjXP9TV
 plhGjGuxoitFmGQOwXDulY1v5m1hXZEWJdrwcxMn3LbT5Rzm3Tk4bfxJQfx8slNgEm
 ML+jIZqQlBq8MkL4G4TJ4CNQf1QQuFFgp6ClE22xfaHaqtfJ5c+uDUB2ehDvh7Y+Vs
 KP+0LPo2CNc4g==
Received: by mail-ej1-f72.google.com with SMTP id
 mm20-20020a170906cc5400b006dfec7725f3so2305237ejb.15
 for <linux-riscv@lists.infradead.org>; Thu, 24 Mar 2022 04:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5o2Wrz52BFS+sHKlhOBzNp+TO7Z2H2kPAxclwT0DlNs=;
 b=E17giFOyT6bHwqTyGgILW63eR/gcDUhzExJ0W2+x/hcThc8Wq0uzAnebppZ4i8FMEY
 0rzuTkEbwAt5vpHu9OQfv/0jb/3bbXeUywB7womdyZlkNe7qReMrDFj6ywufUd8xlTZ/
 xLolw1bCtZJ3syZz/SBTP6U/K1s+C5hcdHA5V/IvqD6kLNGwuOTNHZUKGwrTuyFCyiXX
 cGyAxiH8D5+/Qg1NVb2RSP0dccvWb9wnaGx3UELsWt1YlBZ3bHoF6A+FIEVV4YjHuOtY
 4Y+uvSJKZOJvmzefL7sQ2s7IlujUIJYZzGkYghzVcH9+PeTkVF9sP7GcepG5CHv9QFWo
 mjmg==
X-Gm-Message-State: AOAM530mg/deJ1gal7aC+xNIrHrMXLWY4yX34Xt4EriuffehIJyAyveO
 HVPMINsj+gYY0KyPn1oxtddUEEZruo9n8Dj3xndh+6gvOcPxhRzbOJ1pySlsvqNWUzJJekEkdrj
 l7Buj7q/AP//3MFlsysTf6hGWXlUP12fNJQzxbgbSEzRQAw==
X-Received: by 2002:a05:6402:42c6:b0:419:276c:4a64 with SMTP id
 i6-20020a05640242c600b00419276c4a64mr6192828edc.119.1648122374006; 
 Thu, 24 Mar 2022 04:46:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAJl37gIxQer/kIdtYQq2sgJrHG4K/gYURQV6bVjRyGvag5Ey+tedIIX1T3ZH/Jjoo4nJdPQ==
X-Received: by 2002:a05:6402:42c6:b0:419:276c:4a64 with SMTP id
 i6-20020a05640242c600b00419276c4a64mr6192805edc.119.1648122373772; 
 Thu, 24 Mar 2022 04:46:13 -0700 (PDT)
Received: from [192.168.123.67] (ip-088-152-144-107.um26.pools.vodafone-ip.de.
 [88.152.144.107]) by smtp.gmail.com with ESMTPSA id
 g13-20020a50bf4d000000b00410d407da2esm1350630edk.13.2022.03.24.04.46.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 04:46:13 -0700 (PDT)
Message-ID: <14f87d29-ebc9-51a3-020c-353878bcb1ba@canonical.com>
Date: Thu, 24 Mar 2022 12:46:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/1] riscv/efi_stub: Add support for
 RISCV_EFI_BOOT_PROTOCOL
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Abner Chang <abner.chang@hpe.com>,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Ard Biesheuvel <ardb@kernel.org>
References: <20220324112534.209959-1-sunilvl@ventanamicro.com>
 <20220324112534.209959-2-sunilvl@ventanamicro.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20220324112534.209959-2-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_044622_792946_0656616B 
X-CRM114-Status: GOOD (  24.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/24/22 12:25, Sunil V L wrote:
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

This seems to be v3 of the patch. v2 is available in
https://lore.kernel.org/all/20220303145944.307321-2-sunilvl@ventanamicro.com/

v3 replaces a message in efi_status_t check_platform_features():

<+   efi_err("/chosen/boot-hartid missing or invalid!\n");
 >+   efi_err("Failed to get boot hartid!\n");

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   drivers/firmware/efi/libstub/efistub.h    |  7 ++++++
>   drivers/firmware/efi/libstub/riscv-stub.c | 29 +++++++++++++++++++----
>   include/linux/efi.h                       |  1 +
>   3 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
> index edb77b0621ea..aced62a0907e 100644
> --- a/drivers/firmware/efi/libstub/efistub.h
> +++ b/drivers/firmware/efi/libstub/efistub.h
> @@ -720,6 +720,13 @@ union efi_tcg2_protocol {
>   	} mixed_mode;
>   };
>   
> +struct riscv_efi_boot_protocol {
> +	u64 revision;
> +
> +	efi_status_t (__efiapi * get_boot_hartid)(struct riscv_efi_boot_protocol *this,
> +						  size_t *boot_hartid);
> +};
> +
>   typedef union efi_load_file_protocol efi_load_file_protocol_t;
>   typedef union efi_load_file_protocol efi_load_file2_protocol_t;
>   
> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> index 9c460843442f..012504f6f9a4 100644
> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> @@ -23,7 +23,7 @@
>   
>   typedef void __noreturn (*jump_kernel_func)(unsigned int, unsigned long);
>   
> -static u32 hartid;
> +static size_t hartid;
>   
>   static int get_boot_hartid_from_fdt(void)
>   {
> @@ -47,14 +47,33 @@ static int get_boot_hartid_from_fdt(void)
>   	return 0;
>   }
>   
> +static efi_status_t get_boot_hartid_from_efi(void)
> +{
> +	efi_guid_t boot_protocol_guid = RISCV_EFI_BOOT_PROTOCOL_GUID;
> +	efi_status_t status;
> +	struct riscv_efi_boot_protocol *boot_protocol;
> +
> +	status = efi_bs_call(locate_protocol, &boot_protocol_guid, NULL,
> +			     (void **)&boot_protocol);
> +	if (status == EFI_SUCCESS) {
> +		status = efi_call_proto(boot_protocol,
> +					get_boot_hartid, &hartid);
> +	}
> +	return status;
> +}
> +
>   efi_status_t check_platform_features(void)
>   {
>   	int ret;
> +	efi_status_t status;
>   
> -	ret = get_boot_hartid_from_fdt();
> -	if (ret) {
> -		efi_err("/chosen/boot-hartid missing or invalid!\n");
> -		return EFI_UNSUPPORTED;
> +	status = get_boot_hartid_from_efi();
> +	if (status != EFI_SUCCESS) {
> +		ret = get_boot_hartid_from_fdt();
> +		if (ret) {
> +			efi_err("Failed to get boot hartid!\n");
> +			return EFI_UNSUPPORTED;
> +		}
>   	}
>   	return EFI_SUCCESS;
>   }
> diff --git a/include/linux/efi.h b/include/linux/efi.h
> index ccd4d3f91c98..9822c730207c 100644
> --- a/include/linux/efi.h
> +++ b/include/linux/efi.h
> @@ -380,6 +380,7 @@ void efi_native_runtime_setup(void);
>   #define EFI_CONSOLE_OUT_DEVICE_GUID		EFI_GUID(0xd3b36f2c, 0xd551, 0x11d4,  0x9a, 0x46, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d)
>   #define APPLE_PROPERTIES_PROTOCOL_GUID		EFI_GUID(0x91bd12fe, 0xf6c3, 0x44fb,  0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0)
>   #define EFI_TCG2_PROTOCOL_GUID			EFI_GUID(0x607f766c, 0x7455, 0x42be,  0x93, 0x0b, 0xe4, 0xd7, 0x6d, 0xb2, 0x72, 0x0f)
> +#define RISCV_EFI_BOOT_PROTOCOL_GUID		EFI_GUID(0xccd15fec, 0x6f73, 0x4eec,  0x83, 0x95, 0x3e, 0x69, 0xe4, 0xb9, 0x40, 0xbf)
>   #define EFI_LOAD_FILE_PROTOCOL_GUID		EFI_GUID(0x56ec3091, 0x954c, 0x11d2,  0x8e, 0x3f, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b)
>   #define EFI_LOAD_FILE2_PROTOCOL_GUID		EFI_GUID(0x4006c0c1, 0xfcb3, 0x403e,  0x99, 0x6d, 0x4a, 0x6c, 0x87, 0x24, 0xe0, 0x6d)
>   #define EFI_RT_PROPERTIES_TABLE_GUID		EFI_GUID(0xeb66918a, 0x7eef, 0x402a,  0x84, 0x2e, 0x93, 0x1d, 0x21, 0xc3, 0x8a, 0xe9)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
