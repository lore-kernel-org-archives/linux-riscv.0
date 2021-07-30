Return-Path: <SRS0=Eoui=MW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A22C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jul 2021 10:48:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B066D60462
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jul 2021 10:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B066D60462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMqFGGjj/Zh4oo1RS/ro6OLi0TcNGGeFvmPSUkqf4X4=; b=sA0p4fH5V4O4fs
	cC/ERGsETGichd0V6zKgaJHbePAYeJQ3JhafDvAosf+anQJ1Xv1to4Jt92yvG+eW4E9Syvdn3kFeL
	ftZh2AXDM0aFALpI7s+habTxkl/EMMshmlkIVbA+iffi70le+U2iv7nxBSWX5QkOsTPvytMuTGCJ3
	vMTOIjNb1D8VOuWzVYRvdZkk0Yl8ojX65/EMFqgAWrBvMisi2KnGmLkVLu8ybusoSNI5lKPJ8EdJZ
	es8SOlred7y2Lg4tlPTJ7mwlVVpcx0+KZzi03ai+Iv5i7xr4WOEHjA7xNTett61Z9wNVQ92AVvA9L
	Ik5Oh0wV9EmW8c8tg2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Q3e-008BTh-9u; Fri, 30 Jul 2021 10:48:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Q3Q-008BRi-0m; Fri, 30 Jul 2021 10:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WD2Ag4JED4QIsvoIQN/gUdEl19MyG+gX26ckt/2TnRM=; b=wNjsq2UUJjLuncBCL1YsnTrm0
 YXYmurFWsXKUm2L2J6I/ypUlXwg6ahaMW1adauhejdybPNoV1znnmnxnBQE7zBZc3hiHNA70er0TI
 QnYpssBHkV8KBet2y5hmFMhE39l0DvuwgvbgZ0fqc5k0GCfAVD82AU47p5lagEFMKX6EwrPmcUuQf
 0RzJNbNT94GC9OKKBbbhwI8Po+HCAFRODBNYzP5zCse901ce9un9gcI6vTyY548AnZny/xjNRDv6s
 Lb108Ee4PLeZUMVJX0zUdAchyPz3c4fqfDYw0Cckeo3R8jGRFEZmHnrutm/pKoieeyzfQfhmhr16V
 0fey8HIUw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46754)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1m9Q2U-0002GT-LV; Fri, 30 Jul 2021 11:46:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1m9Q2N-0008Nd-T1; Fri, 30 Jul 2021 11:46:43 +0100
Date: Fri, 30 Jul 2021 11:46:43 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Len Brown <lenb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] memblock: make memblock_find_in_range method private
Message-ID: <20210730104643.GG22278@shell.armlinux.org.uk>
References: <20210730104039.7047-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730104039.7047-1-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_034748_106944_7DF9CCAF 
X-CRM114-Status: GOOD (  19.00  )
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

On Fri, Jul 30, 2021 at 01:40:39PM +0300, Mike Rapoport wrote:
> diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> index f97eb2371672..1f8ef9fd5215 100644
> --- a/arch/arm/kernel/setup.c
> +++ b/arch/arm/kernel/setup.c
> @@ -1012,31 +1012,25 @@ static void __init reserve_crashkernel(void)
>  		unsigned long long lowmem_max = __pa(high_memory - 1) + 1;
>  		if (crash_max > lowmem_max)
>  			crash_max = lowmem_max;
> -		crash_base = memblock_find_in_range(CRASH_ALIGN, crash_max,
> -						    crash_size, CRASH_ALIGN);
> +
> +		crash_base = memblock_phys_alloc_range(crash_size, CRASH_ALIGN,
> +						       CRASH_ALIGN, crash_max);
>  		if (!crash_base) {
>  			pr_err("crashkernel reservation failed - No suitable area found.\n");
>  			return;
>  		}
>  	} else {
> +		unsigned long long crash_max = crash_base + crash_size;
>  		unsigned long long start;
>  
> -		start = memblock_find_in_range(crash_base,
> -					       crash_base + crash_size,
> -					       crash_size, SECTION_SIZE);
> +		start = memblock_phys_alloc_range(crash_size, SECTION_SIZE,
> +						  crash_base, crash_max);
>  		if (start != crash_base) {
> -			pr_err("crashkernel reservation failed - memory is in use.\n");
> +			pr_err("crashkernel reservation failed - No suitable area found.\n");

This change to the error message is incorrect. In this code block, we
are trying to get the exact specified memory block - it is not about
there being "no suitable area" - the requested memory block is not
available. So, the original message carries the exact correct meaning.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
