Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236EAC54E76
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 08:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsAdkcmi5Ns+PIXTMNbP91wDC2rneF/rkRmm6m4lKCY=; b=BEnZHCdIwtKT2G
	onozrNlPxXGpI1/xydrJocPWpgB/M0rNyvO2gY0Stj6KOTNZIr1LZygCKrym2RDoSunXRsXcHFxcR
	gTz7+oQkgofNqnv9ATwoG2Vo2V4edzB2GMH0/MNyFCSRsYizaKswqOHsCVbaq2S3ejlfAC4BNKMrg
	toIOF66wnjcwpQoIEjE8n7R3XqwBY68MKAXvBeVWSuAc2zHvj8s/0MsZfl1Zsru2ZgySKjR69aJWj
	JCCeF7XdJ4IUDN8OOdxLRvTtECKKvxqy/dQgmQ28WKFmUk1OAsSXJOEFbw/EEnPgMULy8hUwmVl5g
	F0pWKiLPrhQhUbWu/kMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4zHZ-00BTEz-24;
	Mon, 20 Nov 2023 08:05:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4zHW-00BTEW-0U
	for linux-riscv@lists.infradead.org;
	Mon, 20 Nov 2023 08:05:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso7698235e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Nov 2023 00:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700467519; x=1701072319; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k/r7/AHUvU5h9gmXC8cWkhPHDiuLCW3OhU5H88ffb6E=;
        b=Ao0h5DXPWv9LJuqt4y9tBoSb1e2YCSmpsscR7M0yEi53JFLX9xRPy+qcCwiu0G3ST+
         fO8Nme5c/mzDxGK7Tk1M+eCJYhPJ6N/QDM6I3xpWRCtPPveHSS+dh1cjJHL+UAsvEsk2
         xZu6HkTFaxk4DlSP4ocNtK2IG/+fWJUduJyJ6+tmdscCt3kfnQs3BmlAiul+8sfiS7qV
         otwGpEfrrDNe1AyHnHzPbOx3CNdyC0eS2MT2z6RX6Os+1IMg5SyQHMZPDIsmZASji9lQ
         HGiomAx6H0eyXFqyK38GfJUdbjmIytBwessrbjXE3C9uFGQLw0SaIBwl6wcX77rN1dTV
         Z/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700467519; x=1701072319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/r7/AHUvU5h9gmXC8cWkhPHDiuLCW3OhU5H88ffb6E=;
        b=ttDnkpbjCkQVLjdtK9Tz26ESeioTuMtN+SluLLD/2DHvzbWuGdenW19U6aUlUfhQiF
         qA0vrWbWPJStPcKPHupMAgRrMtDIX4hywKewXyF86NFV+uOSs4yde2h8jSXMBEDlAqbL
         AmIixwmfeVq9uXtyinKyjqA2E/Q5oUfLhsa6ISTzf94SMGGlRS8nZelWIjjcFJ1OqVAA
         vttn4R/Y79jqcMwXDsYV6LpAWeCuOF0Mk0QMCnl4v369RLmd+lN80kXYIF5bV8LMMyza
         CbtBs2TXZcV+zpty6Zl/sy+RGRonm3qJxxYFQbJBSmJ0xki2OAuDU5VgapZut9YMnQzL
         UXwA==
X-Gm-Message-State: AOJu0YydeZuI3Dr/37sETKV2PNYbVvktyQX9RimMPiutvs2WJy17Z0vd
	Z3vTazLLvSkwjxk7F2QnCnowRg==
X-Google-Smtp-Source: AGHT+IFN4nwCSr0/wD+U66vM10GQFv+Nri9nZ939m/NOfkfbpyvhNkhO8KxhTxplHCfzLfcHQj8ulg==
X-Received: by 2002:a05:600c:6001:b0:408:33ba:569a with SMTP id az1-20020a05600c600100b0040833ba569amr10872487wmb.8.1700467518744;
        Mon, 20 Nov 2023 00:05:18 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b004064cd71aa8sm12586581wmq.34.2023.11.20.00.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 00:05:18 -0800 (PST)
Date: Mon, 20 Nov 2023 09:05:17 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] RISC-V: Add SBI debug console helper routines
Message-ID: <20231120-639982716fbfd33a6fc144d6@orel>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231118033859.726692-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_000522_222210_219523C1 
X-CRM114-Status: GOOD (  21.46  )
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

On Sat, Nov 18, 2023 at 09:08:56AM +0530, Anup Patel wrote:
> Let us provide SBI debug console helper routines which can be
> shared by serial/earlycon-riscv-sbi.c and hvc/hvc_riscv_sbi.c.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h |  5 +++++
>  arch/riscv/kernel/sbi.c      | 43 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 66f3933c14f6..ee7aef5f6233 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -334,6 +334,11 @@ static inline unsigned long sbi_mk_version(unsigned long major,
>  }
>  
>  int sbi_err_map_linux_errno(int err);
> +
> +extern bool sbi_debug_console_available;
> +int sbi_debug_console_write(unsigned int num_bytes, phys_addr_t base_addr);
> +int sbi_debug_console_read(unsigned int num_bytes, phys_addr_t base_addr);
> +
>  #else /* CONFIG_RISCV_SBI */
>  static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) { return -1; }
>  static inline void sbi_init(void) {}
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 5a62ed1da453..73a9c22c3945 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -571,6 +571,44 @@ long sbi_get_mimpid(void)
>  }
>  EXPORT_SYMBOL_GPL(sbi_get_mimpid);
>  
> +bool sbi_debug_console_available;
> +
> +int sbi_debug_console_write(unsigned int num_bytes, phys_addr_t base_addr)
> +{
> +	struct sbiret ret;
> +
> +	if (!sbi_debug_console_available)
> +		return -EOPNOTSUPP;
> +
> +	if (IS_ENABLED(CONFIG_32BIT))
> +		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> +				num_bytes, lower_32_bits(base_addr),
> +				upper_32_bits(base_addr), 0, 0, 0);
> +	else
> +		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> +				num_bytes, base_addr, 0, 0, 0, 0);
> +
> +	return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value;

We can't get perfect mappings, but I wonder if we can do better than
returning ENOTSUPP for "Failed to write the byte due to I/O errors."

How about

 if (ret.error == SBI_ERR_FAILURE)
     return -EIO;

 return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value;


> +}
> +
> +int sbi_debug_console_read(unsigned int num_bytes, phys_addr_t base_addr)
> +{
> +	struct sbiret ret;
> +
> +	if (!sbi_debug_console_available)
> +		return -EOPNOTSUPP;
> +
> +	if (IS_ENABLED(CONFIG_32BIT))
> +		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
> +				num_bytes, lower_32_bits(base_addr),
> +				upper_32_bits(base_addr), 0, 0, 0);
> +	else
> +		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
> +				num_bytes, base_addr, 0, 0, 0, 0);
> +
> +	return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value;

Same comment as above.

> +}
> +
>  void __init sbi_init(void)
>  {
>  	int ret;
> @@ -612,6 +650,11 @@ void __init sbi_init(void)
>  			sbi_srst_reboot_nb.priority = 192;
>  			register_restart_handler(&sbi_srst_reboot_nb);
>  		}
> +		if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
> +		    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
> +			pr_info("SBI DBCN extension detected\n");
> +			sbi_debug_console_available = true;
> +		}
>  	} else {
>  		__sbi_set_timer = __sbi_set_timer_v01;
>  		__sbi_send_ipi	= __sbi_send_ipi_v01;
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
