Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA927C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 01:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=IBe4jS2k9Nolzr6ZPTPQyxcLp/aY22mRu2vAZKfgHSc=; b=phW8ZqFIvCT1EdBqXsTy/ao6/q
	9OTyWRpNwTCPgAY2Vex6+8+kkcnMvCDVz5Gx3VIoj72PG5hFoSLLRxocSxEDl01tqgP3ZIX1UTbfa
	C1hYuZOAW8PpJb0mQTj+feifZq8nsU3CdI776/66jqMzHrVcgOTAMhMH1XdABFyyMvDadQzhK9x1M
	exdWlWx1rGPlhL0f6catS7l0sHtK4YNCH0/J6+Uvamtg8Zm7XxU7Bdvs6Cv/0EMy87r2V3YHukhax
	Hl5YKFjBpSYmKgDQTDMc/Bda4bHgrT8TGhHt2qoORyxIF5iCoMoxU4I+ZOlvyqFgW72w65Y97wwBB
	59yHaJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWprN-00CZiC-Gk; Wed, 23 Mar 2022 01:32:25 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWprK-00CZh2-59
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 01:32:23 +0000
Received: by mail-pg1-x52a.google.com with SMTP id d76so4558664pga.8
 for <linux-riscv@lists.infradead.org>; Tue, 22 Mar 2022 18:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=rMjHIushB4ybeX1DyU7G56cAY5nqd2UeavqSztK6ww4=;
 b=BJgjURSESLE5/2Sq0NpAPHrXCmsa1IE7v1upAVBUlaci6jvsgPSPUz6+OF78gVz/cE
 /yZH6uN4UK0g3YpiquQhos3otbEb/MFlecf38dqnV19zqoDU5G+dKN3FocR77I8eHm8F
 zqCrrkA8p7UIykU5IMQmBM8c+aPAArgzA6igL1nILu4U2WAxR7C/Agsc3lxlPWwPbfQf
 21OT/5CEQz7JI0QCa7/uSX6sCKh+QDDGJpTYU3RyaJBslw3X2JaVHq7+TW2405H9Fdzt
 e9TzZQpLIwUrLUdmADi9ZT2vK25umiupSFrSaWW9t4W9opqzoHT5dVsDu/7PaV3Cvxhl
 ArOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=rMjHIushB4ybeX1DyU7G56cAY5nqd2UeavqSztK6ww4=;
 b=24TCh+dJOTMNUnJXHBoQzJuGq8zX0M+J9eht3D5+8cFO7z+6tw1CdxSire2ZfOOHks
 y29q9vqPWk6zGxKPY597t/mJhtr6Xm6id1i8J/89r4sYZ0MUQHORVxV3UCgLBIKx/UTj
 hUPpvkWfK5nEeTaKZLFQCd8rtwEYQQj+TzRSo+Z0I66s4jzkcZj8GjYBWbGlTP/92jVf
 w2UI5vYHZIsiOt9uYzla7fbFFBwOzb+sDit8AROBc3qqaIHHjpgfUBxw9VCFkNcIhkAe
 7W+cJ8s+mbdTFUEzPb6CbcW9FhdS3CSsISKskuB4hGxM1/Txk0yCmTbcQIBlCIHh9P/E
 VkDg==
X-Gm-Message-State: AOAM533TtD3klUinHQR3WQa/8Op9LWQP5s7ZphS7+FlIxcz8zr3pCHgz
 5OLHElgdahgiI/fqw6YsLyfm2Q==
X-Google-Smtp-Source: ABdhPJy2u6eJd1YQslyskpxe00dwJIhEwrLPQVCByPTJHb1IxI//l93v7Nc+VNGIajJi06MWmolgaw==
X-Received: by 2002:a63:d44c:0:b0:380:8c48:e040 with SMTP id
 i12-20020a63d44c000000b003808c48e040mr24326876pgj.14.1647999141159; 
 Tue, 22 Mar 2022 18:32:21 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 p7-20020a17090a2d8700b001c785d6c1ffsm325231pjd.28.2022.03.22.18.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 18:32:20 -0700 (PDT)
Date: Tue, 22 Mar 2022 18:32:20 -0700 (PDT)
X-Google-Original-Date: Tue, 22 Mar 2022 18:32:15 PDT (-0700)
Subject: Re: [RFC PATCH V2 1/1] riscv/efi_stub: Add support for
 RISCV_EFI_BOOT_PROTOCOL
In-Reply-To: <20220303145944.307321-2-sunilvl@ventanamicro.com>
CC: ardb@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 heinrich.schuchardt@canonical.com, Atish Patra <atishp@rivosinc.com>,
 apatel@ventanamicro.com, 
 abner.chang@hpe.com, jrtc27@jrtc27.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, sunilvl@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sunilvl@ventanamicro.com
Message-ID: <mhng-8685b269-d3cf-4dbb-b2d2-bd79266ac477@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_183222_229945_344429A6 
X-CRM114-Status: GOOD (  25.15  )
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

On Thu, 03 Mar 2022 06:59:44 PST (-0800), sunilvl@ventanamicro.com wrote:
> This patch adds the support for getting the boot hart ID in
> Linux EFI stub using RISCV_EFI_BOOT_PROTOCOL. This protocol
> is preferred method over existing DT based solution since it
> works irrespective of DT or ACPI.
>
> The specification of the protocol is hosted at:
> https://github.com/riscv-non-isa/riscv-uefi
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
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
>  	} mixed_mode;
>  };
>
> +struct riscv_efi_boot_protocol {
> +	u64 revision;
> +
> +	efi_status_t (__efiapi * get_boot_hartid)(struct riscv_efi_boot_protocol *this,
> +						  size_t *boot_hartid);
> +};
> +
>  typedef union efi_load_file_protocol efi_load_file_protocol_t;
>  typedef union efi_load_file_protocol efi_load_file2_protocol_t;
>
> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> index 9c460843442f..915ad209d004 100644
> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> @@ -23,7 +23,7 @@
>
>  typedef void __noreturn (*jump_kernel_func)(unsigned int, unsigned long);
>
> -static u32 hartid;
> +static size_t hartid;
>
>  static int get_boot_hartid_from_fdt(void)
>  {
> @@ -47,14 +47,33 @@ static int get_boot_hartid_from_fdt(void)
>  	return 0;
>  }
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
>  efi_status_t check_platform_features(void)
>  {
>  	int ret;
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
> +			efi_err("/chosen/boot-hartid missing or invalid!\n");

Is that the right error message?  IIUC it doesn't really make sense in 
an ACPI context, that's a DT-ism.

> +			return EFI_UNSUPPORTED;
> +		}
>  	}
>  	return EFI_SUCCESS;
>  }
> diff --git a/include/linux/efi.h b/include/linux/efi.h
> index ccd4d3f91c98..9822c730207c 100644
> --- a/include/linux/efi.h
> +++ b/include/linux/efi.h
> @@ -380,6 +380,7 @@ void efi_native_runtime_setup(void);
>  #define EFI_CONSOLE_OUT_DEVICE_GUID		EFI_GUID(0xd3b36f2c, 0xd551, 0x11d4,  0x9a, 0x46, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d)
>  #define APPLE_PROPERTIES_PROTOCOL_GUID		EFI_GUID(0x91bd12fe, 0xf6c3, 0x44fb,  0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0)
>  #define EFI_TCG2_PROTOCOL_GUID			EFI_GUID(0x607f766c, 0x7455, 0x42be,  0x93, 0x0b, 0xe4, 0xd7, 0x6d, 0xb2, 0x72, 0x0f)
> +#define RISCV_EFI_BOOT_PROTOCOL_GUID		EFI_GUID(0xccd15fec, 0x6f73, 0x4eec,  0x83, 0x95, 0x3e, 0x69, 0xe4, 0xb9, 0x40, 0xbf)
>  #define EFI_LOAD_FILE_PROTOCOL_GUID		EFI_GUID(0x56ec3091, 0x954c, 0x11d2,  0x8e, 0x3f, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b)
>  #define EFI_LOAD_FILE2_PROTOCOL_GUID		EFI_GUID(0x4006c0c1, 0xfcb3, 0x403e,  0x99, 0x6d, 0x4a, 0x6c, 0x87, 0x24, 0xe0, 0x6d)
>  #define EFI_RT_PROPERTIES_TABLE_GUID		EFI_GUID(0xeb66918a, 0x7eef, 0x402a,  0x84, 0x2e, 0x93, 0x1d, 0x21, 0xc3, 0x8a, 0xe9)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
