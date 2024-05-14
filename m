Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FACC04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 22:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJc/ofTS58VLXrThQzaF85zF8MdMzixT/zf8ACt6UVg=; b=KScM3+oKqQYIog
	EAtmDGsMvgU+kCRaTKsyHnC0thMAPXmlD/X4NbcN0pjpgh3pqxXFBLjBQrm8lhOVQ3xMaQR/O7RCe
	/Woc+xX8oac0OIh9qlCFWiMMJojBb5+swYtLYz6+DGM45e+PLcxbhfD3tn4EfdAKxsF8ADgHOwTcJ
	qs3jFKJhobjB1mlCjwKB7P8VzhwmrLrvcQyGLoNCSoMzZAzO4TxvZiJriU7xCKnuXVPk8QdrDnsKm
	CN/aY6k0j9eSulaeHwXerepIHkQ7y77JknjjgpzKce1l6rSX4blZ3ZjWFicPiVL63I/w/yaitFDlO
	K+4zBZ8Hl+REg44lYQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s70FX-0000000HIRT-3RbH;
	Tue, 14 May 2024 22:03:56 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s70FT-0000000HIQu-3Lxe
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 22:03:53 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6f4e59081e6so3376220b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 15:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715724229; x=1716329029; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vkiSNZElAJybtnCmIixSp8O/INwHpHiOAq0SsZz+2kI=;
        b=QlZ25drzVv8JxayL1BTUqRXv3GGZKVpQbGfOjDY3g6f71xLp33DlbRkT6d5x+2wLe3
         QnKsSYXrcBbA9QMLmuZ+mrK1uhAjw1UaQSOldiq08ByLKTq0bWWPWRjiDVMUnPp+0sAS
         Y1svhxVnVI8w2xr0rP4WYZFdRsKg4dXRpj52/+jTfXMQumndxqhYIDO3Pc0kIDXxFirD
         9jufMws/JLrOwroCbmWOE0Lu1tEhCWg9/cqrCm/Sr6Wd6WDdXwuF1Yvbgi4Iadum6pkp
         LLIKUmJWNQtVdM8DGzYbFqXoILuvBQ7wSDNvgXgckxDqanfw2dcgUwzFFsLPqORnUGZc
         RjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715724229; x=1716329029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkiSNZElAJybtnCmIixSp8O/INwHpHiOAq0SsZz+2kI=;
        b=YPJutJB7JGgYiduckf1Bn+KLOCIYFskqj56vnfsKaLbIhFxuBHAC3nDst9+7swCFVs
         tiIodwmL3yUBN3nPSRA39LEIbzZYU+i5DI+lgD1yAU89z4qX8xrCRtSNBJIaMud48QYF
         8duWy6mzbaLa2LAfTZmdyZRRBqnRmKLeNtRZtQst8hVPey7eN8wm5p10Hvm7xZmfAHu6
         9Vv6I/GS/N/ap/hu2HPzW3j5YAvPX4/V2tWxVylA5wMNUCv4E8PzJIsgPlv5ZLLp1fHJ
         NtZCOkx8K91/OBy6v6o3NI6kLlcPMM9D34q5x6IwpbKOzHQaFSCLSS4SW4isM3TlcuX1
         m8QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ1/6MTVfYDQut1S5NPfGUUQWjxA4oJKBv7dFcRPOcrzb6oo7JW+h03fyT2I+CnCHrp2FpVuJDRJl1wJtNEUmNLEzq9T+JqhlvsIYjt+gq
X-Gm-Message-State: AOJu0YwMpNWJXob6g80V+/47sXH+82OZHvHZh703DctT/ZFZ2jX9P1YB
	9Y8F5NZwb/vGyo5YDYF5fqlkXfjCEk4+O5Hh365wmmpoveokQpP7OtwcjKJ7tCI=
X-Google-Smtp-Source: AGHT+IFzz6no4CjoUbD4CmZsphn6hLm+cR/XvpBU0wg3uHhiu2k35I3C2xLgsT9+XMdGuUICVA/YGg==
X-Received: by 2002:a05:6a20:5527:b0:1af:d647:3108 with SMTP id adf61e73a8af0-1afde0af5c2mr12122015637.2.1715724228879;
        Tue, 14 May 2024 15:03:48 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf32b4dsm105280505ad.137.2024.05.14.15.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 15:03:48 -0700 (PDT)
Date: Tue, 14 May 2024 15:03:45 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Subject: Re: [PATCH] riscv: do not select MODULE_SECTIONS by default
Message-ID: <ZkPfwRj+QR2okyJv@ghost>
References: <20240511015725.1162-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240511015725.1162-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_150351_970921_417D7C5B 
X-CRM114-Status: GOOD (  19.62  )
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

On Sat, May 11, 2024 at 09:57:25AM +0800, Qingfang Deng wrote:
> From: Qingfang Deng <qingfang.deng@siflower.com.cn>
> 
> Since commit aad15bc85c18 ("riscv: Change code model of module to
> medany to improve data accessing"), kernel modules have not been built
> with -fPIC, so they wouldn't have R_RISCV_GOT_HI20 or R_RISCV_CALL_PLT
> relocations, and handling of those relocations is unnecessary.
> 
> If RELOCATABLE=y, kernel modules will be built with -fPIE, which would
> reintroduce said relocations, so only select MODULE_SECTIONS when
> RELOCATABLE.
> 
> Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6bec1bce6586..3f92dd3b45d2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -169,7 +169,6 @@ config RISCV
>  	select LOCK_MM_AND_FIND_VMA
>  	select MMU_GATHER_RCU_TABLE_FREE if SMP && MMU
>  	select MODULES_USE_ELF_RELA if MODULES
> -	select MODULE_SECTIONS if MODULES
>  	select OF
>  	select OF_EARLY_FLATTREE
>  	select OF_IRQ
> @@ -858,6 +857,7 @@ config PARAVIRT_TIME_ACCOUNTING
>  config RELOCATABLE
>  	bool "Build a relocatable kernel"
>  	depends on MMU && 64BIT && !XIP_KERNEL
> +	select MODULE_SECTIONS if MODULES
>  	help
>            This builds a kernel as a Position Independent Executable (PIE),
>            which retains all relocation metadata required to relocate the
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Looks great!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
