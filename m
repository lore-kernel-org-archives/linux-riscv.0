Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29C6CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 08:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+feCRUon79fEhlhQqtHQFtPG9qW5DOiNA8JxyytNmDU=; b=rN104geUNh0WgA
	iLHJWyoNJVX6USB654L/CMYwMT8I9srY8tFmsmjNE530jj5k9hFOwh/sf3NnnuVLIp5DiVZUwu39N
	kz+wD30BDwv3uQ/lcUNf5tB0+BFRCE41hJdRfuNLt2CKETWbxa4wIcSkXQC8itThQqwI1w1x/CDLY
	HD1UC+tfgtMtqwBMiVKa1yUojE1I0FD5cjiYU4plA7EGUNwSf5jqrLlY990NTcbmFzXg3RQ+k/hHd
	rlg13t0iorLZyNc1DcttwQfRZ3yC97ogRXIZpcmjm+qk05RBR0g3l/QLNBpFJNVmEPCmi8E/6+zhP
	2bPI8525EQnYqEXMtYeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOg4-00Gkxd-0v;
	Thu, 19 Oct 2023 08:46:48 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOg1-00Gkwr-18
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 08:46:46 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32dcd3e5f3fso1264428f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 01:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697705202; x=1698310002; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FirHlCGgMz/FvpzIKQkoBCDO6SGDDg5U9N5KzhQ/LwY=;
        b=mKrMwqPv0kK4XPgxdcRdUNwnh2rp004u5E04ke+tzt4ZoueNbZf3o71yJA6t0IwT44
         YBY+XDXUiadRkSDtltITdMT8hui/sE5erpvBSDbPidriToyurQOkCq6xPnvvvlu0VGc7
         NldlL8wK6JuZ6qTp6Owckg4dD9AttTqj73iBUaBLW/XBo+2TwC7O5MA8Rpr5Ezd/s2s/
         wVKVrY9PnUFrKED89cs/PisnbC36SDBBxRyQAy0IrOgXL+Q3G3+1DgAEH6tbZL9nT+1i
         kN0hHp/vcKl4EkV2ibVhGOa0BcbUMGzTnUoN8Ta/ZKzOXA4ZicCrbBVwZb6FoHKFgIjA
         msJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697705202; x=1698310002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FirHlCGgMz/FvpzIKQkoBCDO6SGDDg5U9N5KzhQ/LwY=;
        b=n96LfTRRNFyQwxjtEwRAuMOLlbi3fnMwCotd+HFXV6x6AEUNUjRBn1F+/cuZLeSEag
         liqQzLklfrWSmuJcCWfjBdVWI7QQQx1HMCjrRLa7w1ePysTYjMZ2/8+5qAxopz8Ne86L
         ApJtZGhlk9cC1/Uv8W1XIZ+zXTEP5E9tJWcMWAdzpUJ1n7gDD9IUNHEHB72M1H68oBxl
         KVIxD64/qKresMdn+IkRkJayHjo8WzaHgQAXBRpcLSZkADoc61boFDwztAbuoCVp2w6E
         kFApT6JHaHF+PnJNu4wE6+8B6Nrqub/o8uG0sHpl1/X+cmJDDC+YfTeaLK9Uv9G/p1Fh
         ZRhA==
X-Gm-Message-State: AOJu0YytRJAVfqX9kCEoWYdqbDVX3tMkvdcTVCTr0RIcU/W2bHBNqFiw
	PjfHFROL1jLfRLuNCoJQ5KB1VQ==
X-Google-Smtp-Source: AGHT+IHIrPhAgCqHiVC0M3rtirooHgesr0AO+GlYhKykcNrHjz1YNAMNd8HgQcR133zWbZZBLn3Q5w==
X-Received: by 2002:adf:cd83:0:b0:329:6be4:e199 with SMTP id q3-20020adfcd83000000b003296be4e199mr1046765wrj.13.1697705202536;
        Thu, 19 Oct 2023 01:46:42 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id l16-20020a5d6750000000b0032dc1fc84f2sm3960900wrw.46.2023.10.19.01.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 01:46:42 -0700 (PDT)
Date: Thu, 19 Oct 2023 10:46:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] RISC-V: Enable SBI based earlycon support
Message-ID: <20231019-08c33e28cf77beab61519f49@orel>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-9-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012051509.738750-9-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_014645_393387_C5971EFF 
X-CRM114-Status: GOOD (  13.76  )
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

On Thu, Oct 12, 2023 at 10:45:09AM +0530, Anup Patel wrote:
> Let us enable SBI based earlycon support in defconfigs for both RV32
> and RV64 so that "earlycon=sbi" can be used again.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index ab86ec3b9eab..f82700da0056 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -132,6 +132,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_8250_DW=y
>  CONFIG_SERIAL_OF_PLATFORM=y
>  CONFIG_SERIAL_SH_SCI=y
> +CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 89b601e253a6..5721af39afd1 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -66,6 +66,7 @@ CONFIG_INPUT_MOUSEDEV=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
