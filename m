Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AABEC76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 11:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tc1Tt95fe3hENnXHIUSV4BNFoRqK6WZW1wosgU2YV6w=; b=xObs5rIFyzLNaR
	t9Ya3z3FL9CZjn+Yg/WkPKWfMygCu21gLicthf2f7L5idaSWrtKjOsBrhbuesOtRjQ0KxqTy0g/7Z
	Od3Ug9jlwaAMpAKWb+cGBLugp1j9yK06OINm/cU5rp7Sf++UZTtab2w5wfuFBB17YQeOn2fFR+HhM
	uSH8NvmYUgiSBPVKFALqiL9l7KkdSuv4IeHSVsAWZMlNQwkoD7N/cIS/aZzYApIdNoWIdGEns17MK
	j7rUsj3Jb085SGl26PFPkixsGTEllsXAh67qij52Dyc1RjYLkZhxMHnqWhXPqDAtMpd3x1N7ZwfpH
	XsrDJM41VRF9FfE1nSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pglAk-00AluP-1X;
	Mon, 27 Mar 2023 11:37:58 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pglAh-00Alt2-1b
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 11:37:56 +0000
Received: by mail-ed1-x535.google.com with SMTP id y4so34877512edo.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 04:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679917071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lFk1Od/+EdFCUvY552WWMWkI0eZLoEwGftRpKewd8rg=;
        b=DJZmuSfOOXMci0CCcQn88zNuGofkdZkxnSNwJ0x4zQstHMQky3y5QlTg5FVpotfbcP
         TQ4ByFJ0dp6h+arNG44mFKA4ZywVCsFeVzHYiQh2NJrMf6oZhJYryF387zRz8jhRoXk9
         ES4DBioW9Z9a6U5H3QlyNZOouR1KKWmMEjuT1maFPfW/k544tPLkUxFRb+Hnf2RYI5h1
         EZoY8Y69rWi3msOKEHdgttPTTJQ+JhoZXWctsUT1qA0k5BOC6C4AqEtOO/ixslGR/9H2
         dfNsFAh0TIGyambe6bm0rFUk8Xxn+OMjrgsda1PRyYRRZklZm1PgBPLkUXLo1MZkPlT3
         o7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679917071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFk1Od/+EdFCUvY552WWMWkI0eZLoEwGftRpKewd8rg=;
        b=DwZpiy6F4f+OHgsqHIy2U4iq6MutQz6/5Zl/f1JM0XkI1AekgpL48Le4+qRuxmGxKI
         +P64XxD54fspCRaa9zpnCp9MjgaTv/VbYs1UtMlUUIhPyWrkuVeBu35tjev/8vSCxhwk
         0UnvDS+EQatt/3jxShvl/SIMSh14R+tvtHnH8tdG6uHiJp4WmBIuZO6gvhhUlpuvYI4G
         zDgsLVVO6a/iYsTl+Z7ThBn1WfCTQMohWzhbyyLGCM3wB9SfLk1uPFKwFmXNILk2wJcn
         XqBOQvmrClR1oXrJi9vCyXJDproGoM1Ea7MJC4XBzTQm2Fh/i/Ok31HyiRQ8giccLHGI
         djWg==
X-Gm-Message-State: AAQBX9dum0eUFYKrcfOaVIWtqsJt2yFB4rsqKy2ehL8XAqiur/JgSJD0
	JcfpNUvafX5dzGuNFmqpbcnX4w==
X-Google-Smtp-Source: AKy350a+xAzIAbxpLmLmCH/0KNk1tkTjeH1fEruONhgv3OXe/3DHnb9cBTHt4wnrFQpYd0e8eXUy7g==
X-Received: by 2002:a17:906:f143:b0:933:4c93:69ee with SMTP id gw3-20020a170906f14300b009334c9369eemr12617295ejb.45.1679917071855;
        Mon, 27 Mar 2023 04:37:51 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id kg2-20020a17090776e200b009334219656dsm12248051ejc.56.2023.03.27.04.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 04:37:51 -0700 (PDT)
Date: Mon, 27 Mar 2023 13:37:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 3/3] riscv: Use PUD/P4D/PGD pages for the linear
 mapping
Message-ID: <20230327113750.4dahiicpcg3b27mz@orel>
References: <20230324155421.271544-1-alexghiti@rivosinc.com>
 <20230324155421.271544-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230324155421.271544-4-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_043755_540326_5A3FEFAA 
X-CRM114-Status: GOOD (  24.36  )
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

On Fri, Mar 24, 2023 at 04:54:21PM +0100, Alexandre Ghiti wrote:
> During the early page table creation, we used to set the mapping for
> PAGE_OFFSET to the kernel load address: but the kernel load address is
> always offseted by PMD_SIZE which makes it impossible to use PUD/P4D/PGD
> pages as this physical address is not aligned on PUD/P4D/PGD size (whereas
> PAGE_OFFSET is).
> 
> But actually we don't have to establish this mapping (ie set va_pa_offset)
> that early in the boot process because:
> 
> - first, setup_vm installs a temporary kernel mapping and among other
>   things, discovers the system memory,
> - then, setup_vm_final creates the final kernel mapping and takes
>   advantage of the discovered system memory to create the linear
>   mapping.
> 
> During the first phase, we don't know the start of the system memory and
> then until the second phase is finished, we can't use the linear mapping at
> all and phys_to_virt/virt_to_phys translations must not be used because it
> would result in a different translation from the 'real' one once the final
> mapping is installed.
> 
> So here we simply delay the initialization of va_pa_offset to after the
> system memory discovery. But to make sure noone uses the linear mapping
> before, we add some guard in the DEBUG_VIRTUAL config.
> 
> Finally we can use PUD/P4D/PGD hugepages when possible, which will result
> in a better TLB utilization.
> 
> Note that:
> - this does not apply to rv32 as the kernel mapping lies in the linear
>   mapping.
> - we rely on the firmware to protect itself using PMP.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Acked-by: Rob Herring <robh@kernel.org> # DT bits
> ---
>  arch/riscv/include/asm/page.h | 16 ++++++++++
>  arch/riscv/mm/init.c          | 58 +++++++++++++++++++++++++++++++----
>  arch/riscv/mm/physaddr.c      | 16 ++++++++++
>  drivers/of/fdt.c              | 11 ++++---
>  4 files changed, 90 insertions(+), 11 deletions(-)
> 

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
