Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B27C77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 11:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGpccJ8FOvEykvmIwkxFqUNsE4pjtczkWn8JTvwdxGk=; b=L1lJcCRH6NpxaL
	UVL8gAK550bpRk1/TtSHPF/P4yC6eYs/yyibnvmWW4bXVn07qZDPQ+nPN+kJL5qHC2npLJqHaSIUJ
	CrfB2re2SxGXj3e8W231Pj4ILCbyz5Cgj0XV9jxgsU/d0GAmYpo0iW8gBB9Quudj4AXcsbE25Qhap
	jlvyZJBw3n3Zxng7n2jo/UrZAR71iTaQAViHJ7ojSpfUy9DtQaypqnMlL6YDsD63QcBj33dWaaBC5
	SZnZnKuPBU6nwDcLjFrQZx0dlMRFK6uGQir7q5CmI4MlaCYney2CebVjtUsgO2JqmiLAyribl/vuj
	qjeGGhtzGej4Du45+uzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q13Xx-006ETl-0d;
	Mon, 22 May 2023 11:17:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q13Xt-006ESv-2E;
	Mon, 22 May 2023 11:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cQTiKEc/43ERh/RUjjvIJQkEsJdOq6qRkauNBfX0QXQ=; b=p9m/ILtgZZh20NKGMrXp1m9S79
	L3gjgt3hqJWh343H0TOYKs01/G2BPEuhvFC4TMuRPeU+MY+G/63vgoqDRNSKM39yVvKzOTaMjmZFK
	7LM8lsFJeYjGWosrrrGG5miTPAuK0YTizFt0WQTN+y4vi/M34EkH3zTVqOfVyGhSWIOf8ow6+E///
	7SsMn4KhRSRjr9A7KCnECWwdnNE+HTrXL6yLyaObfuKu+fRhMgUnrXcHYHyRgw+uyKRbUhZTX2eMd
	dspexsNkPMSmOqiOaZOzjcHaV7Or01naZ8gCOX7wKpbxrnL7eOBmMEZkr02uGpGm9yxIp2RZVNEOy
	4Up4YdGA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59006)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1q13XQ-0006UY-2o; Mon, 22 May 2023 12:17:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1q13XE-0007tn-CU; Mon, 22 May 2023 12:17:04 +0100
Date: Mon, 22 May 2023 12:17:04 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tglx@linutronix.de, James.Bottomley@hansenpartnership.com,
	arjan@linux.intel.com, arnd@arndb.de, boris.ostrovsky@oracle.com,
	brgerst@gmail.com, catalin.marinas@arm.com, deller@gmx.de,
	dwmw2@infradead.org, gpiccoli@igalia.com, guoren@kernel.org,
	jgross@suse.com, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, lucjan.lucjanov@gmail.com,
	mark.rutland@arm.com, mikelley@microsoft.com,
	oleksandr@natalenko.name, palmer@dabbelt.com,
	paul.walmsley@sifive.com, paulmck@kernel.org, pbonzini@redhat.com,
	pmenzel@molgen.mpg.de, ross.philipson@oracle.com,
	sabrapan@amazon.com, seanjc@google.com, thomas.lendacky@amd.com,
	tsbogend@alpha.franken.de, usama.arif@bytedance.com,
	will@kernel.org, x86@kernel.org, xen-devel@lists.xenproject.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] x86/apic: Fix use of X{,2}APIC_ENABLE in asm with older
 binutils
Message-ID: <ZGtPMHJM/TfklT+2@shell.armlinux.org.uk>
References: <20230512203426.452963764@linutronix.de>
 <20230522105738.2378364-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230522105738.2378364-1-andrew.cooper3@citrix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_041745_727209_59D6373C 
X-CRM114-Status: GOOD (  16.09  )
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

Hi,

Please can you tell me what the relevance of this patch is to me, and
thus why I'm included in the Cc list? I have never touched this file,
not in its current path nor a previous path according to git.

Thanks.

On Mon, May 22, 2023 at 11:57:38AM +0100, Andrew Cooper wrote:
> "x86/smpboot: Support parallel startup of secondary CPUs" adds the first use
> of X2APIC_ENABLE in assembly, but older binutils don't tolerate the UL suffix.
> 
> Switch to using BIT() instead.
> 
> Fixes: 7e75178a0950 ("x86/smpboot: Support parallel startup of secondary CPUs")
> Reported-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Tested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
>  arch/x86/include/asm/apicdef.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/apicdef.h b/arch/x86/include/asm/apicdef.h
> index bf546dfb6e58..4b125e5b3187 100644
> --- a/arch/x86/include/asm/apicdef.h
> +++ b/arch/x86/include/asm/apicdef.h
> @@ -2,6 +2,8 @@
>  #ifndef _ASM_X86_APICDEF_H
>  #define _ASM_X86_APICDEF_H
>  
> +#include <linux/bits.h>
> +
>  /*
>   * Constants for various Intel APICs. (local APIC, IOAPIC, etc.)
>   *
> @@ -140,8 +142,8 @@
>  #define APIC_BASE (fix_to_virt(FIX_APIC_BASE))
>  #define APIC_BASE_MSR		0x800
>  #define APIC_X2APIC_ID_MSR	0x802
> -#define XAPIC_ENABLE	(1UL << 11)
> -#define X2APIC_ENABLE	(1UL << 10)
> +#define XAPIC_ENABLE		BIT(11)
> +#define X2APIC_ENABLE		BIT(10)
>  
>  #ifdef CONFIG_X86_32
>  # define MAX_IO_APICS 64
> 
> base-commit: 0c7ffa32dbd6b09a87fea4ad1de8b27145dfd9a6
> -- 
> 2.30.2
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
