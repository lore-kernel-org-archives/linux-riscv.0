Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE9ACD128A
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 07:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7b0ri4wtM3FYbJjv7VRZpJgfP8agFfMQ5uhYfjCnyvk=; b=G6F6euXRC2p87m
	y3ryOhf+HXJKP8qXQIxhJpUG2IZhY/s9N09ko7zfWvXsiceUModjfd1lVnVZ3a5fd8wpSJBVmKlI1
	JspF0JZAZazFVdsapkTTMYW9YWlt3VMiopCniklysgj+iu7GYnNL9OsYHnEkbBQ5U+kCNkMUnTfoP
	AcWYRDgEWgRdwTa4xTMCUTkx7Gn1chWkUHCQiJRY0ZGJ/6qrWJI37f8gGDqvUiGmZrglaUS+PwLlp
	AUE03Qk+eW936wp0cf0QtqctWDAhKX2Pm0861pxvFMhx6DNQmhtYGIMnxMHHsYUqEFUyp4TDySi1R
	98oA9b5WobynUkiWuvzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrBwd-0000000789W-0RCz;
	Mon, 01 Apr 2024 07:19:03 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrBwZ-0000000788y-3UZx
	for linux-riscv@lists.infradead.org;
	Mon, 01 Apr 2024 07:19:01 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-2228c4c5ac3so2336603fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Apr 2024 00:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1711955939; x=1712560739; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KmnMPiHdZwTuSyiAmUBbotIL+Wtz9SccD/2TsEE+0ng=;
        b=fB1sryizgNU59QfWN85IgzbAHGIwELdhsqI0SGlR04pX9Ft2VZDv21YxzptICBvx2O
         LnQCEn/sYO9H/DFXOqvej+Q6qX6F4OkhjnF8FDcTCHD9KVGdiWQ5SpqaHfq51/3z3o2c
         sf9NkNHUCRZAou1W25SVKXgO2+KWBOysCrJdw5OccDh7EXNxqqQmLBs8ZQurPehECZTh
         fGgNmiF8wGUZo4r0jpoOzxtt+pQio5sUJhehThILaMz1PgJXemKXJoVcHhj31EBYL9zC
         LJQ3ZTwXxu3ZLIlNYsGydNv9VctVKl/0InSDLSmm9SnzcIbTMoZG5ZxfAUfbgxTts+lU
         fjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711955939; x=1712560739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmnMPiHdZwTuSyiAmUBbotIL+Wtz9SccD/2TsEE+0ng=;
        b=rEQi8BmsBrxLCvTYWdA/WEXnFmIK4cw65K0q7+gIVXrZu6p+TsUzLLZeX6TwZi50xn
         w3KxMdH+x9CT6uQ82wYD/wXlkZXoQJadD5DW2SBhlfXbxJEoOn5q0H7MX2z62ZKluA3l
         ZviEEhuPRlU/93VgQhBVG6ooRJNaTyA+vPZStEdIG5KRE/i9/4O1JOOPxg4HC7BW6KKi
         WRrBhm29HBbeo5Cgh1W9xYhsY1SrjwpXbWwQZrqLb4kk1PUrYtdzhPBC8HA821B/83Nt
         OwNx2JgST3JxgeuzPeoiGKK7G1c6i26giMP1MJpEwHe5Rd7oBtaLeDw109tZ5vICLFRp
         eSCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkBl7iT/3J7XPmSITpoMSJiLXvOZfWzIsByCVRVKaRD/eG5PNpoSrs9BSLKEcFOHYz5mRj24bhYDXnQVG9Sfkr89a+pQPhYbWu2pas3ASa
X-Gm-Message-State: AOJu0Yycg6Qenl2U/ODtevscySy/oq+mNPUFJu+I8h89e5FFMAZ/nuHr
	ZJDE59aoa+IT6YQrJVoCBLCGUtNR7n74z8S1Lam41UdnbdJs0D4gjQqpDsuN6NQ=
X-Google-Smtp-Source: AGHT+IGSfvqjOauFHIchIvjURLPiv+JlWEBBSRMGmtVtVu+cf9tXS/DlNmsy1MccDtCO/34D8tR6/w==
X-Received: by 2002:a05:6870:2309:b0:221:9227:e006 with SMTP id w9-20020a056870230900b002219227e006mr10279412oao.47.1711955938782;
        Mon, 01 Apr 2024 00:18:58 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id gy8-20020a056870288800b00222649d5b4esm2717950oab.16.2024.04.01.00.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 00:18:58 -0700 (PDT)
Date: Mon, 1 Apr 2024 12:48:42 +0530
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
	Charlie Jenkins <charlie@rivosinc.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Zong Li <zong.li@sifive.com>, Jisheng Zhang <jszhang@kernel.org>,
	Baoquan He <bhe@redhat.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>, James Morse <james.morse@arm.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Evan Green <evan@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Marc Zyngier <maz@kernel.org>, Anup Patel <apatel@ventanamicro.com>,
	Tony Luck <tony.luck@intel.com>, Ard Biesheuvel <ardb@kernel.org>,
	Yuntao Wang <ytcoode@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v2 6/6] ACPI: RISCV: Enable ACPI based NUMA
Message-ID: <Zgpf0rqUSEZcSiAV@sunil-laptop>
References: <cover.1709780590.git.haibo1.xu@intel.com>
 <01cb5780041565784d459cd94a5c4f55eaa87739.1709780590.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01cb5780041565784d459cd94a5c4f55eaa87739.1709780590.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_001859_900337_431B8314 
X-CRM114-Status: GOOD (  14.95  )
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

Hi Haibo,

On Thu, Mar 07, 2024 at 04:47:58PM +0800, Haibo Xu wrote:
> Enable ACPI based NUMA for RISCV in Kconfig.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0bfcfec67ed5..0fb55f166701 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -447,6 +447,7 @@ config NUMA
>  	select HAVE_SETUP_PER_CPU_AREA
>  	select NEED_PER_CPU_EMBED_FIRST_CHUNK
>  	select NEED_PER_CPU_PAGE_FIRST_CHUNK
> +	select ACPI_NUMA if ACPI

If the firmware didn't provide the SRAT/SLIT on ACPI based systems, then
there will be a message "Failed to initialise from firmware" from
arch_acpi_numa_init(). This is not specific to RISC-V. But I am
wondering why should it be pr_info instead of pr_debug.

Thanks,
Sunil
>  	select OF_NUMA
>  	select USE_PERCPU_NUMA_NODE_ID
>  	help
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
