Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD49CCDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 09:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rx9LvOQbl9UwaeY7Zuf9ZUxvLZHndf8QjkvREKKXbTk=; b=36qouDJyDHT67q
	S1DH5EPZ4FPOOquEFr3jspaCJjkj2DbT6z1mGd6NMulPT5FUln8SK+2CFg0fNzi2i/6hIXcuQmwWP
	vzYtS3J33hdrnliTI15nm44b509X38oSy8WJxd/7GZKPEFl43s4noTyXquFDrQYNPNV3/2tFGFaFU
	ocdiqo5zJ+0AI143RB+itVIcx9cIBbHSqcU5oDquSMqzkouyi6A1aPowCP+F3wmyF033ONekD1xom
	5LmqS23o4r9eSikvHVBUpd1iE9ggrqmx6aun5xhoFYU449a7cYUGzJ8Hwpuj9sWP3fLbgWseaMd+9
	jQJRNnihjg0TGNxk32fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsHM-000R8K-2U;
	Thu, 12 Oct 2023 09:46:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsHF-000R3y-0g
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 09:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697104002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThRb+UcGK85QIazXPneMxqNNLJr2GRSmiyAMj75w/LA=;
	b=jEKKiil1HnJmKjj3QJtC5ojt++wzPh0Sv8X7uSIPAlBIFV6RfW8Uk+XKUlKJV7e8APy0jn
	TUaNLmsNCHNhL0JUhxOebSNifb315I80OQl/TpY39Cb0Cj3tJEFRBJUCHkY9JjELicvFZ8
	7geZqB4m1VTzqCKBvX2vzQGYnRL1CW4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-ruYZKukwO6qwZF4l-7LOdA-1; Thu, 12 Oct 2023 05:46:41 -0400
X-MC-Unique: ruYZKukwO6qwZF4l-7LOdA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4053a5c6a59so5274995e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 02:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697104000; x=1697708800;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ThRb+UcGK85QIazXPneMxqNNLJr2GRSmiyAMj75w/LA=;
        b=gBMlv9mV2OQHavpHwoAFBmPQXZ9/lUdNC+KrEGnLAjZlXsJObB6cOoUAHV4LWPhxlf
         ZxTleCnjd5KNttdlD7wDZNjODttXRHpLscadhv6FxbRkrEpZyxtE0PLAj+4VdDt55vpO
         I4eFHTcu4eoLQGQ92yopmNZuUGW4rV9SyYYfcW/k6MoMMLnnqp4StU6pwQDS9VZueSw9
         tscXiBPLQYdXdtIpxx/3qrkZ3AHtYzGQ24dfqbUCDLA7zlF/AQwcEUoKUGV/QCed4Yc7
         LqLFkBzpFYwg3yUN6ZQpUGJBsKCdrt+Q2AMOJvq1W0b0Z+2gZcPlPPu9qlQFgT5frC9w
         nR8g==
X-Gm-Message-State: AOJu0YylpG9+M9niJ2aE8ojSwrsWWjk+fht+8cmCZykF2Kv9OLv0GVfS
	NRgFC91PbPQOe4Xwd439mGohullRmPJqs60PZ/VHwN+3IUkgEHJKtEd/gNYTyZbqAvmXYejHwx4
	8xQSkGG7xvk1xDuKtWqCrsdznn4yK
X-Received: by 2002:a7b:c851:0:b0:405:3252:fe2 with SMTP id c17-20020a7bc851000000b0040532520fe2mr20044588wml.14.1697104000203;
        Thu, 12 Oct 2023 02:46:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFoTJKOUlXNGuTxyVfpeYk3pzXXcIpsxixiWv56qeWL3YsmKEdqeyry4llLnNXWO3k3t8ZEA==
X-Received: by 2002:a7b:c851:0:b0:405:3252:fe2 with SMTP id c17-20020a7bc851000000b0040532520fe2mr20044570wml.14.1697103999801;
        Thu, 12 Oct 2023 02:46:39 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73d2:bf00:e379:826:5137:6b23])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c00c600b00402ff8d6086sm18968884wmm.18.2023.10.12.02.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 02:46:38 -0700 (PDT)
Date: Thu, 12 Oct 2023 05:46:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Gabriel Somlo <somlo@cmu.edu>, qemu-devel@nongnu.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv, qemu_fw_cfg: Add support for RISC-V architecture
Message-ID: <20231012054613-mutt-send-email-mst@kernel.org>
References: <20231011114721.193732-1-bjorn@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231011114721.193732-1-bjorn@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_024645_339001_B210F7C9 
X-CRM114-Status: GOOD (  20.04  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 11, 2023 at 01:47:21PM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> =

> Qemu fw_cfg support was missing for RISC-V, which made it hard to do
> proper vmcore dumps from qemu.
> =

> Add the missing RISC-V arch-defines.
> =

> You can now do vmcore dumps from qemu. Add "-device vmcoreinfo" to the
> qemu command-line. From the qemu montior:
>   (qemu) dump-guest-memory vmcore
> =

> The vmcore can now be used, e.g., with the "crash" utility.
> =

> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> ---

with typo fixed:

Acked-by: Michael S. Tsirkin <mst@redhat.com>


>  drivers/firmware/Kconfig       | 2 +-
>  drivers/firmware/qemu_fw_cfg.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index b59e3041fd62..f05ff56629b3 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -155,7 +155,7 @@ config RASPBERRYPI_FIRMWARE
>  =

>  config FW_CFG_SYSFS
>  	tristate "QEMU fw_cfg device support in sysfs"
> -	depends on SYSFS && (ARM || ARM64 || PARISC || PPC_PMAC || SPARC || X86)
> +	depends on SYSFS && (ARM || ARM64 || PARISC || PPC_PMAC || RISCV || SPA=
RC || X86)
>  	depends on HAS_IOPORT_MAP
>  	default n
>  	help
> diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cf=
g.c
> index a69399a6b7c0..1448f61173b3 100644
> --- a/drivers/firmware/qemu_fw_cfg.c
> +++ b/drivers/firmware/qemu_fw_cfg.c
> @@ -211,7 +211,7 @@ static void fw_cfg_io_cleanup(void)
>  =

>  /* arch-specific ctrl & data register offsets are not available in ACPI,=
 DT */
>  #if !(defined(FW_CFG_CTRL_OFF) && defined(FW_CFG_DATA_OFF))
> -# if (defined(CONFIG_ARM) || defined(CONFIG_ARM64))
> +# if (defined(CONFIG_ARM) || defined(CONFIG_ARM64) || defined(CONFIG_RIS=
CV))
>  #  define FW_CFG_CTRL_OFF 0x08
>  #  define FW_CFG_DATA_OFF 0x00
>  #  define FW_CFG_DMA_OFF 0x10
> =

> base-commit: 1c8b86a3799f7e5be903c3f49fcdaee29fd385b5
> -- =

> 2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
