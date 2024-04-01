Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA91CD128A
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 07:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yevA1Z9Sa5D7kTRsDze89ywVeESLWBPce+BXl2tSPkM=; b=uzQgEmyR+W/+UR
	IiISvk/DCcBEerbYbBqL1yyPgiwiqUNeFNLGg71g4bVkjADNEu2aCaB2asV4FYPyjP8rgE/cBxywC
	C19OqFrSK582IfGbHmke2p5m5yxTudNZp5m15cM/LCtYo362kyDQodJLIKP4Jba9gzUBhh+0qYTNu
	C0LJ/RfYaUs0HVcftR2/F1pZwCfnkANSCSfC/dVb/A6VYCFXDL0Dsa68rAt67FWrdFsSVvDcxKBgi
	wLMDlHzUIq8GG3++ABSmWq9Wxl5NAyWlBOj4hdRvZjHkZLRdqGQEbrsgtRXRvlkqMUrO599XWukvO
	/zU39A/xx6gxUmDw+UaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrBfR-000000076MH-2T1L;
	Mon, 01 Apr 2024 07:01:17 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrBfO-000000076Lg-3kI7
	for linux-riscv@lists.infradead.org;
	Mon, 01 Apr 2024 07:01:16 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3bbd6ea06f5so1582834b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Apr 2024 00:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1711954873; x=1712559673; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CR3iwkHe4Np8Vng7wVF9RKBPosLNIp8pBnmcewjQ5aU=;
        b=h0Q88reSWfhYddglUTXCtEa6/h+W1KUwhbCnU4ISU2OuhCuSUG6/e7ltcS3xbFMyi/
         3w4DXos+yJpq/AVX88PRru2s5knWV8atoaEQeOQ9Z6n8byE+P6+6NfN8hx99t9lHAe9G
         VIhcdwGWI4BCWxn0Achrt/Lcf+SxGafq7s6mir9eKT1t0zHAKZoEWeMCV+PZiKZVWAVp
         JUFDY0/5ff2bkixXh0SR0WwqbSmxeANv/ICBpPFahg4OvLWsquXe9RhizrxAEEEVysK0
         kbhIApzILpyp7qIrNmCe5M0jG66sItzhfARj2ghiog6CGC4WSoMKd+jtDQ6n+yuM4u8N
         I+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711954873; x=1712559673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR3iwkHe4Np8Vng7wVF9RKBPosLNIp8pBnmcewjQ5aU=;
        b=tpUgMJyd09BHImQhigpyykRDy9UpHIGbx2zTTqEKICsTTkKDZHTK+Kxvo0oGUY52Wb
         Fhe0P0UE7saxqonTIjGho/T8E+7Y+MtX+fXALWsI4wFnWmvhHazcExHTQf2ayNdz73Cg
         0IpHai/u1bOy8FqjfK1PCweVwPSa3XsRB3YmLwNgcO1a97yEPCtMx6RThvw9OwKLkL2n
         xl1SkG6jF8TEFWe9MeV0Z3gkrAOlYhmJSD1zpAtie5/lAwgRI1oTTysiFDU51FD/SYCT
         HM81K+llt//whHmqC03R39drCGXE5km3UoX5+PCAd/4EIkjqzlUoHpUadVV7U+pdjzQE
         9WaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5gxM/1z3p4w9iQsq0kDVyPBJaIgcrKuNrllEAG/cKfxujHDl0m6DWAa2A5TFLDpRpSxv7kVrC73BcaF1zcDHbKK4kji8UWQyzh/tslsk
X-Gm-Message-State: AOJu0Yz/AiLUP2W5tbtJtLP3LbqC9kOClteW+9B/Ppe7gq4QFsgN4ncL
	EUPdLRdVUE1NRJWLWAOM0HcQj1GWOTu4BMMUnz310D7/ehV+oF5hS6zpZkzMD+8=
X-Google-Smtp-Source: AGHT+IHNVXbtf4nFi0CjQtWkGz+KO+8YX+Nli7rw8a7TjQYiIWVV4PVHNMdRC2/hIgsRYyvZbdhOXQ==
X-Received: by 2002:a05:6808:309c:b0:3c3:c157:5dc7 with SMTP id bl28-20020a056808309c00b003c3c1575dc7mr3557976oib.13.1711954873346;
        Mon, 01 Apr 2024 00:01:13 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id l7-20020a056808020700b003c4dac3b55dsm1018840oie.3.2024.04.01.00.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 00:01:12 -0700 (PDT)
Date: Mon, 1 Apr 2024 12:30:56 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, ajones@ventanamicro.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jisheng Zhang <jszhang@kernel.org>, Baoquan He <bhe@redhat.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>, James Morse <james.morse@arm.com>,
	Evan Green <evan@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Tony Luck <tony.luck@intel.com>, Ard Biesheuvel <ardb@kernel.org>,
	Yuntao Wang <ytcoode@gmail.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v2 4/6] ACPI: NUMA: Make some NUMA related parse
 functions common
Message-ID: <ZgpbqAraGbQqZv5d@sunil-laptop>
References: <cover.1709780590.git.haibo1.xu@intel.com>
 <c8b86184d9e6d078e9b9949d4837bc6e392c3f52.1709780590.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8b86184d9e6d078e9b9949d4837bc6e392c3f52.1709780590.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_000115_033689_A6BDDABA 
X-CRM114-Status: GOOD (  16.21  )
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

On Thu, Mar 07, 2024 at 04:47:56PM +0800, Haibo Xu wrote:
> The acpi_numa_slit_init(), acpi_numa_memory_affinity_init()
> and acpi_parse_cfmws() functions are common enough to be used
> on platforms that support ACPI_NUMA(x86/arm64/loongarch).
> Remove the condition to avoid long defined(CONFIG_ARCH) check
> when new platform(riscv) support was enabled.
> 
> Suggested-by: Sunil V L <sunilvl@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  drivers/acpi/numa/srat.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
> index 1946431c0eef..938c4adb7ec4 100644
> --- a/drivers/acpi/numa/srat.c
> +++ b/drivers/acpi/numa/srat.c
> @@ -219,7 +219,6 @@ int __init srat_disabled(void)
>  	return acpi_numa < 0;
>  }
>  
> -#if defined(CONFIG_X86) || defined(CONFIG_ARM64) || defined(CONFIG_LOONGARCH)
>  /*
>   * Callback for SLIT parsing.  pxm_to_node() returns NUMA_NO_NODE for
>   * I/O localities since SRAT does not list them.  I/O localities are
> @@ -351,13 +350,6 @@ static int __init acpi_parse_cfmws(union acpi_subtable_headers *header,
>  	(*fake_pxm)++;
>  	return 0;
>  }
> -#else
> -static int __init acpi_parse_cfmws(union acpi_subtable_headers *header,
> -				   void *arg, const unsigned long table_end)
> -{
> -	return 0;
> -}
> -#endif /* defined(CONFIG_X86) || defined (CONFIG_ARM64) */
>  
>  static int __init acpi_parse_slit(struct acpi_table_header *table)
>  {
LGTM.
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
