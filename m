Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308ACC61D97
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 22:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HB1bYExmCgmVpPhIJKzR6hY75wq7C/oQz9gLjDkSQ8=; b=SxPF/0O5i9FCSQ
	YtwfQ76F7n9ailuLXkey7HK8Jp9lH1jJpEYjDNds0oFSxfmsFJbxzodUoY/DfyLVvPC9IrmkvhnIC
	b0bYw5ugqqNBZ/xreU+VyhuIqnWbr7ue6sk7nbfzrDeqbF1rRZ1n8kMMeYaDhSEP5NfnxTDxkBX50
	vr0HtK9kQaQDE+76REXXP4NnIUmITOCjel1ywddXBzKYHIPqJ/NgOEcD4KLqetboEOhbqY04K1TCH
	X9Hup5PiZM79XH7CmoFnEIOEPbrO/MTBrx/L581SNO5MTjIFKvJjbdf/7kTofy+B2nXseFfVl8R9p
	Dd6Elxvk5EQzakhfj2OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ZVF-000CfC-2h;
	Tue, 21 Nov 2023 22:45:57 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ZVC-000CeO-2Z
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 22:45:56 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7ad501cb1f9so241145039f.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 14:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700606753; x=1701211553; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7iA+kWZUEVLsdUBXgt5tCOpWMD0Y1GKECDIJZh9fHq4=;
        b=POv+Gwfuc3bVuWj93POKzW566a7dmjF759aL4Iya7Lqedz5/bsJrvXYQMxVeguwx0L
         Cfnli2wDTiuxbzqMseirH7w/0HMRP/EHIE6NxXa6WAW/FBlSOY6cXqNa3+aRhRVNHtpM
         MYMWgksosyP6bpdCrlbxKGgxIsA34bhx+tS1gYYvlvz0uyyuugbThLB+aoQlLbLUr36V
         AcrzkJLzYJGaffy0s5rbeOnGGf4tqFedAxlmwofGlFJ8qiJ0fScpgxpVuArq5azpNZd+
         QJ0V9v9Bj5hK1rbtt7oUvoPYomMzji417Z5VKVNx+cN7vyYoPeYIMVZ4Op4FiUR73L2l
         v2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700606753; x=1701211553;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7iA+kWZUEVLsdUBXgt5tCOpWMD0Y1GKECDIJZh9fHq4=;
        b=dJfcxET3KLPpKymqX6dTUYEtPQXPEcBxLIYZSdBsYfVASXe337aug503WIpafwwWQQ
         4aXfVz2hErU1bW0VMb8VFnpHhIsx5EmNFtvTvCDyCsQYR56bKTVaTLDLNBam+BQzWeCn
         wkbCjKkzYvPykUTLYR6YrZh30g7a9QI2TnSm74l4CifcnHu9lNLVGty/7IoUD1hCp0p3
         EoaFR7p9VVYGyV97jyTAJ4oHYv2svsc1wMCXmW8sOCaAdv5ri+hVz/WzFQHEnNEQdQCa
         qDRXR0gMSVj8aQzW9nAn8npMDdRzeCpdSPti61iGqkFwR4/SNcS2bH98k9n1bc61xSUL
         h2jg==
X-Gm-Message-State: AOJu0YyfjPTTIz3YKau+tuApjGhKzpQJ9NdA13ib5fczNhKy8lFnphqE
	5k++kNojqPZuIrYrydvWoDwirA==
X-Google-Smtp-Source: AGHT+IGhfz2kelvWRYhxoS/GC2I/AI6SPzGv2+DveMsAbESr2DRqPpVwoYyjSVjW8igCCV35ZmqdBw==
X-Received: by 2002:a6b:c812:0:b0:7a6:a089:572c with SMTP id y18-20020a6bc812000000b007a6a089572cmr316749iof.21.1700606752801;
        Tue, 21 Nov 2023 14:45:52 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:3d43:c8e2:1496:e620? ([2605:a601:adae:4500:3d43:c8e2:1496:e620])
        by smtp.gmail.com with ESMTPSA id p33-20020a056638192100b004664ef1a3c6sm1930255jal.155.2023.11.21.14.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 14:45:52 -0800 (PST)
Message-ID: <adf2a8f4-f675-4d27-8b46-5d80d3251b6c@sifive.com>
Date: Tue, 21 Nov 2023 16:45:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] RISC-V: Add SBI debug console helper routines
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-3-apatel@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231118033859.726692-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_144554_832135_DE7CEFCA 
X-CRM114-Status: GOOD (  17.09  )
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

Hi Anup,

On 2023-11-17 9:38 PM, Anup Patel wrote:
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
> +}

Since every place that calls these functions will need to do the vmalloc lookup,
would it make sense to do it here, and have these take a pointer instead?

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
