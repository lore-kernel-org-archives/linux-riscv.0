Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D96C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 06:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trNS5wEVCFEtqdyhWUOuQNeizh0BnyyYpIF23mIHLBw=; b=Q3iAsy8htuR4ZH
	cwMNhiFK4UV5s00fefancG5sZa99A+m/fTN0jOlSQwrQTVyk8Nl2O4zsCJNcfOsI1yhWf/c5I4WU+
	KxP/rwDHasJgkw6e6h5EgE0L0/axUlnNOgI3r6SbyXh/bVSj6KMD6pWQF9l+lqxDkA7/hUdwoaV4j
	JLDi1xiofWLXlkbrdoueSsD5cpH9vKjnUW5LQMu31wAvoA0gvHzkdv58Gky5oOVjplh3rWgBz9M/M
	NVD1u4oeiB09v/lOe5XAZXVeItvnssC2uQEfvBmy60Pispxzl3RAOuVywk+3TRUlCgNXteaIBXx2C
	2Su0PEJNxPB9027Q7lpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYJsA-0000000AAED-2WyK;
	Mon, 29 Jul 2024 06:28:42 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYJrs-0000000AA5p-3HWH
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 06:28:41 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-70ede9df528so581766b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 28 Jul 2024 23:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722234503; x=1722839303; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9LhZsel+ZXOFBLouKmnPn+e0gC2RjgaR8JO/hzKLRAg=;
        b=jDohomnwtaxYwCezln31Kwl99AtA4uaq09D+SwlLsqsBDOMBmz7i1brO+0z6q7sW2H
         p85H9mN/9OCv498/j1s3iEuiy1C0nyv0EOiqkEvhKYIoQfoMZRZM/kFcK0OqT2C03vGA
         52/P7YkBNwTHbZeE65lu0WI75oO0DQgac5eGLLaKwePObQW8Omn4iGGo3+iRufGn16hZ
         c1ojw3dxtQpnmqsbSI5D3e5HZ1NYzA0DpCX1uwWhhI/XOgtIhQHeRMa75CkxTffV/DGW
         nIDBGMZHbEZ/wCtw/ZClcHDTAgW7SlYWO4QYFSQmSe/otC0TaXGeZIFM45Xgn7quE8Ta
         Cl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722234503; x=1722839303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LhZsel+ZXOFBLouKmnPn+e0gC2RjgaR8JO/hzKLRAg=;
        b=nMisuVaozVIIR2RgyRTL1Nq8/pOzmNGrG8aLXAkG3ITNbAKHYQ8HllXguEFM5tp8zq
         yBaL9ieKQlY+vSRXWBcsPs4MsQgnWI8nrDpYljdNkvPM5EbpDVNSDy5eKBenY5WdHbOL
         tTnenInPJG63w5RfMBPPgs6ulE6K5KDEXDMJylFYfTgIrzWmy+K2zqtqjV19DJEClDf2
         Y74V1+t7foNxw434yFNZiku1hWbTBbVUxqkYmmj2RA/kovF6owT0B4mJhp6UCTcd5PR2
         J8XTHJ5UCGGYZnnDBG8LZn95V/rUaRQCHwi+bj4pIpcUCNnCeaJ69zgGELW0S5YY9YR1
         Kstw==
X-Forwarded-Encrypted: i=1; AJvYcCWVe6OSjCDanp1hy+VDxnksMeOO/htwiaw9PJ4BUbGI2TDWkLaLxi/6sMCHqFv12L0fb1o5yTfZ/ipvBm3GDoZlPQvYxyh2jBp4cYl75V4n
X-Gm-Message-State: AOJu0YwVE4JdkCp5qX74VTcITG2GUq+HwFjNkI3e64u+Wti5z7KVCX9M
	UOgcxeMIZzUNewcJCewh5gPg7H31xzxRZAA18TVqMVxi4aLUIEUapiUe2uLJgww=
X-Google-Smtp-Source: AGHT+IFxLwq27q0Hdj/w8FwvESdnHQBwsPuqDTmOipebs/uzejoVKO14hWPOPPbb4dFbQ7eyO/Gv0w==
X-Received: by 2002:a05:6a00:6f64:b0:706:6bdc:4de5 with SMTP id d2e1a72fcca58-70ecea1dd24mr4120390b3a.7.1722234502813;
        Sun, 28 Jul 2024 23:28:22 -0700 (PDT)
Received: from sunil-laptop ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead715540sm6132019b3a.45.2024.07.28.23.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 23:28:22 -0700 (PDT)
Date: Mon, 29 Jul 2024 11:58:13 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, ajones@ventanamicro.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	James Morse <james.morse@arm.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] ACPI: NUMA: initialize all values of acpi_early_node_map
 to NUMA_NO_NODE
Message-ID: <Zqc2fQr4KJrJW9IB@sunil-laptop>
References: <20240729035958.1957185-1-haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240729035958.1957185-1-haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_232824_863409_DAE6475D 
X-CRM114-Status: GOOD (  17.08  )
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

On Mon, Jul 29, 2024 at 11:59:55AM +0800, Haibo Xu wrote:
> Currently, only acpi_early_node_map[0] was initialized to NUMA_NO_NODE.
> To ensure all the values were properly initialized, switch to initialize
> all of them to NUMA_NO_NODE.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  arch/arm64/kernel/acpi_numa.c | 2 +-
>  arch/riscv/kernel/acpi_numa.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
> index 0c036a9a3c33..2465f291c7e1 100644
> --- a/arch/arm64/kernel/acpi_numa.c
> +++ b/arch/arm64/kernel/acpi_numa.c
> @@ -27,7 +27,7 @@
>  
>  #include <asm/numa.h>
>  
> -static int acpi_early_node_map[NR_CPUS] __initdata = { NUMA_NO_NODE };
> +static int acpi_early_node_map[NR_CPUS] __initdata = { [0 ... NR_CPUS - 1] = NUMA_NO_NODE };
>  
>  int __init acpi_numa_get_nid(unsigned int cpu)
>  {
> diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.c
> index 0231482d6946..ff95aeebee3e 100644
> --- a/arch/riscv/kernel/acpi_numa.c
> +++ b/arch/riscv/kernel/acpi_numa.c
> @@ -28,7 +28,7 @@
>  
>  #include <asm/numa.h>
>  
> -static int acpi_early_node_map[NR_CPUS] __initdata = { NUMA_NO_NODE };
> +static int acpi_early_node_map[NR_CPUS] __initdata = { [0 ... NR_CPUS - 1] = NUMA_NO_NODE };
>  
The change looks good to me. However, I was wondering whether it needs
"Fixes" tag in which case I think you will have to split this patch into
two.

Otherwise,
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

Thanks!
Sunil
>  int __init acpi_numa_get_nid(unsigned int cpu)
>  {
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
