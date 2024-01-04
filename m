Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFDEC47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 10:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRsA4//A/BOLXZM5Kp1hKjdWgybyh0k6PZuzkrjwri4=; b=jaoazI+Q3rf3by
	DLqoJM57KEnHXSrt8PoAHjZrMjSAKIxliZshQMUugDr+QUkJFBx3IVG0DbHQ5nBgHj3oo4jhx5b0T
	AMaveygHDygjLvV+7T88e+UZRqfoYfoCvjms+UUdXboJk4nwr++VfXuuEXaA4xFgJF0c8dFogyfZq
	ASj65rh97cfhjieSriA/vQUffJFXKphkV0O3vPoKYa4C1GQTKy/6RJMBjnHJVXtegmGFFPulEeC3y
	w6nYUY9C2NPb6H6wTaNuqbA9N2OTuk0XaGH0cE4QPxyzHL+dAk1TH1LYb1AJ4OW9kSd+ZX1dodHkC
	2nQz6DtyIZyoCQOVpOhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLKi-00DawS-12;
	Thu, 04 Jan 2024 10:52:16 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLKf-00Datd-08
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 10:52:14 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a28005f9b9cso40817966b.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 02:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704365529; x=1704970329; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I5fZa5BBUNgRC/MuXKPlVg1/H35HoZwMYqORDEqtrMo=;
        b=MEkQCVK0Me+VtSWggdTqLPnz4aUG/D007G0Kv5p9ctNKG0lcTyI3rDoIHbcWqTtT1I
         BqKfGSnXI0jgYUDBOU5EG2Dz+WvPkBlzzZIOE8YTSuHRbw2OhbGs1RhapJEL5xweuLiF
         tN/rwiwgX+yxrw47p8DSCU442ksGWFC/nKb2K3VvIc8zZMErwQB3j6aPg7yIf1vBXZcO
         Kof6FvGClmFJoYbxONjEBDOq7POT3XzOYS++zItwrGAmug3Mo8cfnIe/XaryUSQ3E0JK
         YKpPTZBj2xXBH9hfaJYanpgae5AbeX3H1codW0ueiFlhirj6Ce4J3hKnfnW3vP2ejYUl
         UbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704365529; x=1704970329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5fZa5BBUNgRC/MuXKPlVg1/H35HoZwMYqORDEqtrMo=;
        b=PkI6LBmjldOEx9vZboiWIOmHj6r5EfA5/kVnV4iwFM58YMXGWYjI5dwHTmoxUbR8sV
         zNdgGxb2kwqDFx4D3FcK+71mu+wjYYICAuI6TpM3DYmWPCABtM/kg7zVwXB4cyYQ1R5q
         UPvwJodlFcSBqM3RBlgijGpHCOX7SbtJtRux3SuMjDsz+4rjljTj5WW4bFsIjLwk+3d9
         GOoShnk4fWxsOhrKoGqLb3DTc47ireYj6amCRG/MR4kBgf6EdNyQiQ7SAwAVu3Vyaxoa
         uYNmQYjpXd9sf8h/kvbz2TqqQb21hzpPYik5wHcnZvZ+SPOULKeqF/gXB91zFGDbEmca
         E0lw==
X-Gm-Message-State: AOJu0YxQPrfiGmRj7jFHVqlTXAWyQsNP9ZQwQSfp7AIskkaodYbMIqx0
	IA6jJmi9e5yEfec+WHwW5XkSnpG2tD9wKmWGEMM2zwBrMes=
X-Google-Smtp-Source: AGHT+IH2SFA7HOTq7Srx7DUub3qQkU+yO1rsmGqpIPcd4XSv3GgGa5Bl/CgkrtDWu8S+ikAtHQUTUA==
X-Received: by 2002:a17:906:d9c9:b0:a27:fdc1:593f with SMTP id qk9-20020a170906d9c900b00a27fdc1593fmr240521ejb.67.1704365529270;
        Thu, 04 Jan 2024 02:52:09 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id y2-20020a1709063da200b00a26e4986df8sm10496620ejh.58.2024.01.04.02.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 02:52:08 -0800 (PST)
Date: Thu, 4 Jan 2024 11:52:07 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	anup@brainfault.org, atishp@atishpatra.org, rdunlap@infradead.org, 
	sfr@canb.auug.org.au, mpe@ellerman.id.au, npiggin@gmail.com, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] RISC-V: KVM: Require HAVE_KVM
Message-ID: <20240104-d5ebb072b91a6f7abbb2ac76@orel>
References: <20240104104307.16019-2-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240104104307.16019-2-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_025213_084040_9412E496 
X-CRM114-Status: GOOD (  17.98  )
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


This applies to linux-next, but I forgot to append -next to the PATCH
prefix.

On Thu, Jan 04, 2024 at 11:43:08AM +0100, Andrew Jones wrote:
> KVM requires EVENTFD, which is selected by HAVE_KVM. Other KVM
> supporting architectures select HAVE_KVM and then their KVM
> Kconfigs ensure its there with a depends on HAVE_KVM. Make RISCV
> consistent with that approach which fixes configs which have KVM
> but not EVENTFD, as was discovered with a randconfig test.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d3825539d8@infradead.org/

I think powerpc may need a patch like this as well, since I don't see
anything ensuring EVENTFD is selected for it anymore either.

Thanks,
drew

> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig     | 1 +
>  arch/riscv/kvm/Kconfig | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a935a5f736b9..daba06a3b76f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -128,6 +128,7 @@ config RISCV
>  	select HAVE_KPROBES if !XIP_KERNEL
>  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>  	select HAVE_KRETPROBES if !XIP_KERNEL
> +	select HAVE_KVM
>  	# https://github.com/ClangBuiltLinux/linux/issues/1881
>  	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
>  	select HAVE_MOVE_PMD
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index 1fd76aee3b71..36fa8ec9e5ba 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -19,7 +19,7 @@ if VIRTUALIZATION
>  
>  config KVM
>  	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
> -	depends on RISCV_SBI && MMU
> +	depends on HAVE_KVM && RISCV_SBI && MMU
>  	select HAVE_KVM_IRQCHIP
>  	select HAVE_KVM_IRQ_ROUTING
>  	select HAVE_KVM_MSI
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
