Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B2BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 05:08:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AE736109E
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 05:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AE736109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xFaQ8vXaQqp7NopjEosOpJxqUoLt3UVKpwjJm00O/XQ=; b=p5ITtHzg5ExXW0frcqx8w36ErM
	JBcae8mfKosEb/1GfQ0+OpPPXsZQdIWpSiKMGSBMuTNbYxdIrso/LM2H7ZXZp0zwSplwe/IiHdV/3
	oaInuM5WlAxGaxyIm/s8i99AUgcEbzc85W5/RlwTAjyvK0dlQaYaunhSVbkzd9U4EcZh1ysHmUkZ2
	CrkvFa/nwX/n1acanwJFoo4Ipz7BdBoNx9ymHbMPKx4lNZCPMxClHuxFbp1X5WYQB5S/IG5ZS2sOw
	6UpCFiGsBBW0SH+gWAMmVTaeJ4h86n8Cra6Z69BagZTEA6DKaH+X61N1e6URpdGuEFJeYn+2g8Fks
	5SN6kleQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfbAM-003svN-K6; Wed, 27 Oct 2021 05:07:58 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfbAJ-003stn-QA
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 05:07:57 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5837520007;
 Wed, 27 Oct 2021 05:07:45 +0000 (UTC)
Subject: Re: [PATCH] RISC-V: Make CONFIG_RELOCATABLE user selectable
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>
References: <20211026212847.43108-1-palmer@dabbelt.com>
From: Alexandre ghiti <alex@ghiti.fr>
Message-ID: <c538d656-cef0-728f-2722-2bcc41b8f947@ghiti.fr>
Date: Wed, 27 Oct 2021 07:07:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026212847.43108-1-palmer@dabbelt.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_220756_017862_233C5EEC 
X-CRM114-Status: GOOD (  18.78  )
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

Hi Palmer,

On 10/26/21 11:28 PM, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
>
> This should really be up to the user, as it trades off portability for
> performance.
>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  arch/riscv/Kconfig | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 5dea03549493..f8a36034d54b 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -212,18 +212,6 @@ config PGTABLE_LEVELS
>  config LOCKDEP_SUPPORT
>  	def_bool y
>  
> -config RELOCATABLE
> -	bool
> -	depends on MMU && 64BIT && !XIP_KERNEL
> -	help
> -          This builds a kernel as a Position Independent Executable (PIE),
> -          which retains all relocation metadata required to relocate the
> -          kernel binary at runtime to a different virtual address than the
> -          address it was linked at.
> -          Since RISCV uses the RELA relocation format, this requires a
> -          relocation pass at runtime even if the kernel is loaded at the
> -          same address it was linked at.
> -
>  source "arch/riscv/Kconfig.socs"
>  source "arch/riscv/Kconfig.erratas"
>  
> @@ -433,6 +421,18 @@ config CRASH_DUMP
>  
>  	  For more details see Documentation/admin-guide/kdump/kdump.rst
>  
> +config RELOCATABLE
> +	bool "Build a relocatable kernel"
> +	depends on MMU && 64BIT && !XIP_KERNEL
> +	help
> +          This builds a kernel as a Position Independent Executable (PIE),
> +          which retains all relocation metadata required to relocate the
> +          kernel binary at runtime to a different virtual address than the
> +          address it was linked at.
> +          Since RISCV uses the RELA relocation format, this requires a
> +          relocation pass at runtime even if the kernel is loaded at the
> +          same address it was linked at.
> +
>  endmenu
>  
>  menu "Boot options"


Agreed, you can add:

Reviewed-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>

Thanks for the patch,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
