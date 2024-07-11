Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D85C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 22:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=alHGCzUP/oozSIjAv5JSwQ+xf+b/ET4ejFwx11CdlZc=; b=vfMEjU1wkL3O3b
	EB6crH75SChJeQa7qh58g/8HemRMcG+ZJU1sW3XmUjwAz0n0RQlq49V0lz9bnpAXzkdpmCb+DlkE3
	wHB2b8Wp6wZjrxMpIJeD66yyAx/lpB24TNRAiWEnbU77hDU4MPoqkpf2EQERqpyF6QUq2uc0+BPMb
	Eq632dw3kOAtapLBJEKhd7mB4sUcOYYpCWPAzE5CXS3TOVL1eac3c+AJeIdYu2IcpkBzan1nliMAT
	QgBWkNm1iW60a5BMiboAK95zop3f0simvgTTzGwtFiOj1dUA8CD3pj5Z7N4QvbSTuZkf9SnfegpLD
	PZeiYpuCmkFO/+jpQFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS2C7-0000000FdmZ-24rN;
	Thu, 11 Jul 2024 22:23:19 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS2C4-0000000Fdm8-0PXy
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 22:23:17 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1f4c7b022f8so10956395ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jul 2024 15:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720736594; x=1721341394; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wOA6NsFk6L+7Ls7mZsmFkNNQzEFiEdl0CxMpv9bv/Qg=;
        b=AvyrXMt1YydF6mhWzJrctZfFrp+5rMbnk0vrBbWgqQiXb7tCUN5QFKUFWuuyZL8knW
         pZq9tZfw15ik5xX3tYJJibaBnI3D1yPlpCMlLH1vUc2RdG1wXXYsnD2uw+/1UmLcoUFT
         GpCj/7ej5X1VFn4FJ6A87ru1VSssfvI0/ALZBRxe0ig072Zm1lRcCwPCICiVzBnlqvzL
         cd7zp/3lYg/4xqBcm51CCa7+ExjWdeiHh5WAaR0d1ce4Uifio4SCC+hc+Za2f+v+bRfQ
         N60iGhg2VCqV7+l8XN2OIYNIZdqhNIj9H16O3f2bl0V2i5iRIIqYiTsqdpPZEIRBsBjL
         +xpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720736594; x=1721341394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOA6NsFk6L+7Ls7mZsmFkNNQzEFiEdl0CxMpv9bv/Qg=;
        b=t0gqq3cGf+cXTvm5sk+QLxO1BvMaCPopj2wuWz2xRfmTCIMzDFpaWyoJG4cByny5DT
         u+YTMLitx2qQVJFOnPD3AwSO7pHzViVJIqKfAgt6JTgqH+C//v5ACTxGkDq0r9uIdBPX
         O50VCsELNiGeIA3BE8zuZshAsy/FJL7WyV2GW7ntZGhFNbQjBHLNASsDsGFkRZ/oA5pz
         ZPbm23+liV1GexCz+Yd4aihLBKd8eoRFrw7yjErKKtfJpA/gauR4qVoZAWuOhuREqpKs
         2hpWbstEnIaeGPXyTdKKFVMTtxLP5Q/++fmSCWcVgs7Df069Qwc+AnkeRrNghA0936Ld
         sxcQ==
X-Gm-Message-State: AOJu0YyGEGzB4aFttg+hT4lR/duAqSIJWBeSn9AFk5haRBYcRf0vJjxj
	4dboRRHEDCZjgAEgMsqf4970cJ0f4TvRu5T3bevYHY+UdfzcdlQg6Xfz87UVyOI=
X-Google-Smtp-Source: AGHT+IEVnJzb7O36DPGCsgQl833NWjcEPMaDTTCYgNiB+OKGtg51343xFtMHn6nFNmILVnskS/PwlA==
X-Received: by 2002:a17:902:e745:b0:1f9:ddea:4523 with SMTP id d9443c01a7336-1fbb6cda816mr89697095ad.6.1720736594362;
        Thu, 11 Jul 2024 15:23:14 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a1083bsm55313555ad.37.2024.07.11.15.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 15:23:13 -0700 (PDT)
Date: Thu, 11 Jul 2024 15:23:11 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 7/7] RISC-V: hwprobe: Document unaligned vector perf
 key
Message-ID: <ZpBbT1OquCCwUTWA@ghost>
References: <20240711215846.834365-1-jesse@rivosinc.com>
 <20240711215846.834365-8-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240711215846.834365-8-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_152316_161269_E85A58BA 
X-CRM114-Status: GOOD (  19.37  )
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

On Thu, Jul 11, 2024 at 05:58:46PM -0400, Jesse Taube wrote:
> Document key for reporting the speed of unaligned vector accesses.
> The descriptions are the same as the scalar equivalent values.
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
> V1 -> V2:
>   - New patch
> V2 -> V3:
>  - Specify access width
> V3 -> V4:
>  - Clarify we're talking about byte accesses using vector registers
>  - Spell out _VECTOR_ in macros
> ---
>  Documentation/arch/riscv/hwprobe.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 78acd37b6477..f83a13dc4cbc 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -238,3 +238,19 @@ The following keys are defined:
>  
>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicboz block in bytes.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF`: An enum value describing the
> +     performance of misaligned vector accesses on the selected set of processors.
> +
> +  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN`: The performance of misaligned
> +    vector accesses is unknown.
> +
> +  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_SLOW`: 32-bit misaligned accesses using vector
> +    registers are slower than the equivalent quantity of byte accesses via vector registers.
> +    Misaligned accesses may be supported directly in hardware, or trapped and emulated by software.
> +
> +  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_FAST`: 32-bit misaligned accesses using vector
> +    registers are faster than the equivalent quantity of byte accesses via vector registers.
> +
> +  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_UNSUPPORTED`: Misaligned vector accesses are
> +    not supported at all and will generate a misaligned address fault.
> -- 
> 2.45.2
> 

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
