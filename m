Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2964AC2BA18
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 01:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/EUGaYo7yEoO59am2Q8JJ+mMh4RZyNa6Boj+VdsBsgw=; b=hYP01GUB0pJklB
	svgf5lPgiPP6Y/4zXfpfpy1xrrm7sZO3UNyPafOVoHThcLEFHL6eAbCL3tk139YSSp5VycnkqDie3
	L/9SyU9EuXVRN1IQYZhtww4QQ2tqMZG/kwImmXn+PY5yW7ZwHULxj0FtSLUoQER9NGUIGPj4H6JuG
	1F2rxRTxPvAXY0iLnRZt48uSw141mJhSKpBcYL4Fu02tJ5JEw8xzdBzZ6qBdx9MTIdl28fuNBh732
	+5rK/mk3U/1lwcC0LB3QLV7uOI/3mjI96Q9kfVdvWFsPed3OyMt5dgJgNe6MH2UPQPiqaOvBtdHCm
	xgOG9mJ0VAs3p2nU/hQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKSgv-00000007Hv8-0tBi;
	Fri, 21 Jun 2024 01:03:49 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKSgs-00000007HuG-20nO
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 01:03:48 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1f9b364faddso13501705ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 18:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718931825; x=1719536625; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s1haH7YBDu+P173UfNQ13ypdZ+PVdQ4InMnIfKHy+Oc=;
        b=Lf/xsNO6xAtOGnIY/veSfzQNVa11mv49h5kANauXZpm55++VVi/HJt7G+DGaXdMj3h
         3DEx5bZ1k9hi863fIxEPuSPNrCMV9Nqg1eG8xEia8Jeos8nxCDJDiixPo6k93ZGz5TZG
         /pUw2PFLU4OPv9hIirE49OZrf4sOp2GYDKDdt90rT+CkELgujQ+NWj71FtjOZnqT8dmB
         I1t/lbXimF+lj3DFy1Ajs+t7vkoRifpHPEbfxqm6VfoUmI53uVtH5NaBtiSlLVF2pgDm
         dsv72kbmViijU5zQznHucrMZ2bElh4hZuJifg1W3rXJif3O8YmNxXN+11VSaGpJADAQR
         bYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718931825; x=1719536625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1haH7YBDu+P173UfNQ13ypdZ+PVdQ4InMnIfKHy+Oc=;
        b=EcQCrttRXindMuMIGuc8S607XpNYFTZ/Z+n86J5343r2Go7r+icppQ0b0nmN9+fiRr
         vtA85LuLeSQgkbQgPGd3QlWEyLvuNXPHVS0ejnC44Zfmp1y9CcnVkWDOKU1NInok13Ac
         5KYqNrW19qM1+0VgI0AoRHfj/ohBlz46Zy/xDb3lb4lSQU97qd4YN1xwm1J+0TB+4cKL
         ryRo05vYqUnl4L4sU14tKHCSoyR1eRoMcoq0r96hLLwKwu9pm+vT4aK53Ed22tL5vvuX
         Yk64TJBmvPc3NfbJ2TulJeRFva8rwwh2hcHCRRqM6Bp0pc5OZO146S5rGfPvGCTG8RDH
         BClQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsx+/25jv7OkiJl8y6M00gE0Q9vPcCZh0hjiFy443suVqRt3M16Fx3ZFzY2KmDB263LyeeDDtdoZ60UiP6eOkyqmUwa16aAxVC3u6lJd2e
X-Gm-Message-State: AOJu0YyvNsI5oAYj8IZVN4IETuZXG1cauKg7yl5ZrDoMrZvWCbkLJwFU
	1jWezvHQUwAqI1d0TiEjO2xKWmihND3t99Ttlc5ndziwjIIMBKwkJS8dhNuti+s=
X-Google-Smtp-Source: AGHT+IGu8qLWME7uH03Xg6l6zR9dVoABsK411ijDXY+wd3PmxDALgviUPmuQn9akpQ/LqS6WroNeCg==
X-Received: by 2002:a17:902:da8e:b0:1f7:6ed:7389 with SMTP id d9443c01a7336-1f9aa4802a7mr84132235ad.66.1718931825123;
        Thu, 20 Jun 2024 18:03:45 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c6ca7sm2390805ad.177.2024.06.20.18.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 18:03:44 -0700 (PDT)
Date: Thu, 20 Jun 2024 18:03:42 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com, akpm@linux-foundation.org, bhe@redhat.com,
	rppt@kernel.org, dawei.li@shingroup.cn, jszhang@kernel.org,
	namcao@linutronix.de, chenjiahao16@huawei.com, bjorn@rivosinc.com,
	vishal.moola@gmail.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: cmdline: Add support for 'memmap' parameter
Message-ID: <ZnTRbptoowL+1GOP@ghost>
References: <20240618120842.15159-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240618120842.15159-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_180346_643433_ADB50047 
X-CRM114-Status: GOOD (  28.72  )
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

On Tue, Jun 18, 2024 at 08:08:42PM +0800, Yunhui Cui wrote:
> Implement support for parsing 'memmap' kernel command line parameter.
> 
> This patch covers parsing of the following two formats for 'memmap'
> parameter values:
> 
> - nn[KMG]@ss[KMG]
> - nn[KMG]$ss[KMG]
> 
> ([KMG] = K M or G (kilo, mega, giga))
> 
> These two allowed formats for parameter value are already documented
> in file kernel-parameters.txt in Documentation/admin-guide folder.
> Some architectures already support them, but Mips did not prior to

Copy-paste from a Mips patch? Should say riscv :)

It looks like this code is duplicated from xtensa and is effectively the
same as mips. Can this code be placed in a generic file so that the code
can be shared between mips, riscv, and xtensa -- maybe a new config that
gets selected by mips/riscv/xtensa?

- Charlie

> this patch.
> 
> Excerpt from Documentation/admin-guide/kernel-parameters.txt:
> 
> memmap=nn[KMG]@ss[KMG]
> [KNL] Force usage of a specific region of memory.
> Region of memory to be used is from ss to ss+nn.
> 
> memmap=nn[KMG]$ss[KMG]
> Mark specific memory as reserved.
> Region of memory to be reserved is from ss to ss+nn.
> Example: Exclude memory from 0x18690000-0x1869ffff
> memmap=64K$0x18690000
> or
> memmap=0x10000$0x18690000
> 
> There is no need to update this documentation file with respect to
> this patch.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/mm/init.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index e3405e4b99af..7be7ec3092ad 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -208,6 +208,56 @@ static int __init early_mem(char *p)
>  }
>  early_param("mem", early_mem);
>  
> +static void __init parse_memmap_one(char *p)
> +{
> +	char *oldp;
> +	unsigned long start_at, mem_size;
> +
> +	if (!p)
> +		return;
> +
> +	oldp = p;
> +	mem_size = memparse(p, &p);
> +	if (p == oldp)
> +		return;
> +
> +	switch (*p) {
> +	case '@':
> +		start_at = memparse(p + 1, &p);
> +		memblock_add(start_at, mem_size);
> +		break;
> +
> +	case '$':
> +		start_at = memparse(p + 1, &p);
> +		memblock_reserve(start_at, mem_size);
> +		break;
> +
> +	case 0:
> +		memblock_reserve(mem_size, -mem_size);
> +		break;
> +
> +	default:
> +		pr_warn("Unrecognized memmap syntax: %s\n", p);
> +		break;
> +	}
> +}
> +
> +static int __init parse_memmap_opt(char *str)
> +{
> +	while (str) {
> +		char *k = strchr(str, ',');
> +
> +		if (k)
> +			*k++ = 0;
> +
> +		parse_memmap_one(str);
> +		str = k;
> +	}
> +
> +	return 0;
> +}
> +early_param("memmap", parse_memmap_opt);
> +
>  static void __init setup_bootmem(void)
>  {
>  	phys_addr_t vmlinux_end = __pa_symbol(&_end);
> -- 
> 2.20.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
