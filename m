Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B738AC47DB7
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 09:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FokoJQwEUifLdzt3dBlgtxuOHHQ8i7y+iR0JIel+Nz4=; b=Keq3AGbAf7BfhW
	XxiXeWyN4m4nMd9t8JrDjAYFXmfuzD9tMqf+a2yQSvCTikXo8JKdSo5l19WhL0sE80VvzX6pqb2ev
	OuMKbOapSmKCG7t9Z/hTx++j+A91PjUe+HuUsqn4z6D3PiEmiT1UPJ0FMD71klykKXl3NAVwiA68x
	1Rcccrw8n2p5UrErCBTS2ZEk81l/viRxaUdMxFUKGzYcwx/cLHcDGxZ83QTr5f3s2TdzPLh5z27Bu
	/QeaXDuHrE9wxcdXb3wl5Icf6qA8B9pe9vaFwCAXeLaKvST5rX3ujqr42xHUyPdJHimUeLcHce15g
	BoQWTrQOdrK3SiZo6z0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQlNJ-004zVO-2i;
	Fri, 19 Jan 2024 09:41:21 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQlNG-004zTn-0T
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 09:41:19 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so536561a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 01:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705657275; x=1706262075; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VjY2td5hE6yXhz+Ia9iRWMUcND8jTxmyaK8S9msHCZg=;
        b=AdELw2zTxshyXe3LbMPU6uwRe8ef80daeQ5Cv5zla6eDNj4cQjOFvY1X0czGfERgRY
         TPP+6Jd4y3JzLlMit8JTmJVnpVjSvQxEAtEelGbO5QPJMqFsHimIaK97k2e4zFPuVWLD
         MbsmeQsqEoF2Myfv6sTkQS+5dvtxaTFhmB9p+mhEB5cxxSz/ui7Kr+/U3itc6NxjauCx
         j8vVLZ4RVNcQat+qeVYT5v1T6IWE+WolYasVTjfyJWYqzFMUw7E8AI8lAf7EvxU0OKim
         xhhzCvqe7dqxKd82rloGQVawRRn0y/e3SsecbSUWqGkozguIFOIZZLJW+3V7rtq35vFk
         4ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705657275; x=1706262075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjY2td5hE6yXhz+Ia9iRWMUcND8jTxmyaK8S9msHCZg=;
        b=ZfB8gVH60Yy+7A0oYXuV5St01DCK12vY6lPReZUL3ojz9I8u6c0dvA8/AYWDr4sZZF
         zxiJrZKg8qAbrk0xrfhheA5Sp1Wf0EoX8d4GnRbbVBtFSWQEnkdR8ggOHPWSFGOyrrRx
         oIg3W5JTRuVA+sxC0b6a+ghFV6/uLm5u57tCL0Fjx8+xqBDe4phZxyVQhYZqvEDuPEEh
         vDBpIMWbI65mv51rgqpBC85BC6POGBR+kd1eAKy9pbq93AS00Ubrn+wLWYyzLx3JY9U9
         MH5QaacbuGNQJ2Vsjwr7J18d9tRqaR2/pXlVBfZZUu1+7d9+puPp39zWiw/dQO+h3hoT
         iYXQ==
X-Gm-Message-State: AOJu0YyxYlYUKj3dtT8i4fVRGlxW89zu13Fw4j7DovxiLc+DFsGLmapG
	uxjFofDHBGBL6JjfvbRRdYmW0aBoxIgwvYz7edt714hnJKl7RltRDByxdQ+WW61y29tzUDEESZy
	l
X-Google-Smtp-Source: AGHT+IHTZetoKvZ4IVId0QiHm+6oVWhdJLXsLPNFWMrcJmVzn0CiP03i+EmBALPDmtPVDl+LJfC9Gg==
X-Received: by 2002:a17:907:318b:b0:a2c:867c:43e3 with SMTP id xe11-20020a170907318b00b00a2c867c43e3mr1292269ejb.86.1705657275448;
        Fri, 19 Jan 2024 01:41:15 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id t19-20020a1709067c1300b00a2cab4514a2sm9122593ejo.133.2024.01.19.01.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 01:41:15 -0800 (PST)
Date: Fri, 19 Jan 2024 10:41:14 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: lib: Check if output in asm goto supported
Message-ID: <20240119-1bff4a21b3d2d5c500a14fcc@orel>
References: <20240118-csum_remove_output_operands_asm_goto-v2-1-5d1b73cf93d4@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240118-csum_remove_output_operands_asm_goto-v2-1-5d1b73cf93d4@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_014118_187111_C3BF3254 
X-CRM114-Status: GOOD (  23.49  )
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

On Thu, Jan 18, 2024 at 02:36:45PM -0800, Charlie Jenkins wrote:
> The output field of an asm goto statement is not supported by all
> compilers. If it is not supported, fallback to the non-optimized code.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: a04c192eabfb ("riscv: Add checksum library")
> ---
> The OutputOperands field for asm goto statements is only supported
> starting from GCC 11. Split the asm goto to remove the use of this
> feature.
> ---
> Changes in v2:
> - Use CC_HAS_ASM_GOTO_TIED_OUTPUT
> - Link to v1: https://lore.kernel.org/r/20240118-csum_remove_output_operands_asm_goto-v1-1-47c672bb9d4b@rivosinc.com
> ---
>  arch/riscv/lib/csum.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> index 06ce8e7250d9..af3df5274ccb 100644
> --- a/arch/riscv/lib/csum.c
> +++ b/arch/riscv/lib/csum.c
> @@ -156,6 +156,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
>  	end = (const unsigned long *)(buff + len);
>  	csum = do_csum_common(ptr, end, data);
>  
> +#ifdef CC_HAS_ASM_GOTO_TIED_OUTPUT

Can't we just add another IS_ENABLED() to the if rather than this #ifdef?

>  	/*
>  	 * Zbb support saves 6 instructions, so not worth checking without
>  	 * alternatives if supported
> @@ -214,6 +215,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
>  		return csum >> 16;
>  	}
>  no_zbb:
> +#endif /* CC_HAS_ASM_GOTO_TIED_OUTPUT */
>  #ifndef CONFIG_32BIT
>  	csum += ror64(csum, 32);
>  	csum >>= 32;

BTW, I wonder how/if the check for CC_HAS_ASM_GOTO_TIED_OUTPUT in
init/Kconfig is working as expected. I see $CC, as opposed to $(CC),
being used there. I believe $CC is just the expansion of $C with a
'C' appended.

Thanks,
drew

> 
> ---
> base-commit: 080c4324fa5e81ff3780206a138223abfb57a68e
> change-id: 20240118-csum_remove_output_operands_asm_goto-49922c141ce7
> -- 
> - Charlie
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
