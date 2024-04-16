Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89F4C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 20:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjjzQfHqw0LS2uOZumAV0lRyKk3zbDKXjeFQump+6+U=; b=TPYY2cwzikG++o
	N/HPS/fC35afZ+jNUIxgYE6UjOSrXDFNg+WRAFDrjDb5V9jtVPpcr2n3xPS6RJ+mGz1DrgCx255y5
	G9mJBjcB0fcfwb5vVuBErDmWF2zViaspGER5lFApSQZZt0Wi+2YHhGaNis17qH48WNNtO1dSGjefV
	ojV6SZsXx6E5yJH+jZ8+WIHUQ7JywZl/WkscZXUqI5nzrQYsw9Yud06iKGpM8N5WcVfz2Gcp2sh/J
	Nt7yg4hDqCrRmAQHn5rVPXP7G7s9Ejl5I3eYmVRZJyznUgXzNsAg0YMSM7wuPOZvisXv+T0LnL6e6
	fi9h7XYYxpBjQo03sLzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwp9S-0000000De1T-2CXQ;
	Tue, 16 Apr 2024 20:11:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwp9M-0000000DdxV-0igD;
	Tue, 16 Apr 2024 20:11:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7AFA2CE113D;
	Tue, 16 Apr 2024 20:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 947A5C3277B;
	Tue, 16 Apr 2024 20:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1713298281;
	bh=vH93qz9QypmdrxTbfPnlMTMImwmxiAcyrlntd9a+0o0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cjZZt45zzFNVvRVLLkIaQ69+5t4zoCNBaDZANtTYyKIzGiPWX0wB/I6nLAB1CxgDP
	 LyDiexeqmuMVOpNvYwYTEYfDw/QqbKIpHEnEylNsfU0Nr6S5UXmnG60k+iAegOG4s6
	 wUvuXfyB5LNQoRUHmF5B7VHXvfaARZL14SvNsgdE=
Date: Tue, 16 Apr 2024 13:11:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Maxwell Bland <mbland@motorola.com>
Cc: linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
 <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Ard
 Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Yu Chien Peter Lin
 <peterlin@andestech.com>, Song Shuai <suagrfillet@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
Subject: Re: [PATCH 5/5] ptdump: add state parameter for non-leaf callback
Message-Id: <20240416131120.a801ff03a6d0bbec0e9151c8@linux-foundation.org>
In-Reply-To: <20240416122254.868007168-6-mbland@motorola.com>
References: <20240416122254.868007168-1-mbland@motorola.com>
	<20240416122254.868007168-6-mbland@motorola.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_131128_398798_F38DFE03 
X-CRM114-Status: GOOD (  16.86  )
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

On Mon, 15 Apr 2024 14:51:32 -0500 Maxwell Bland <mbland@motorola.com> wrote:

> ptdump can now note non-leaf descriptor entries, a useful addition for
> debugging table descriptor permissions when working on related code
> 
> Signed-off-by: Maxwell Bland <mbland@motorola.com>
> ---
>  arch/arm64/mm/ptdump.c          |  6 ++++--
>  arch/powerpc/mm/ptdump/ptdump.c |  2 ++
>  arch/riscv/mm/ptdump.c          |  6 ++++--
>  arch/s390/mm/dump_pagetables.c  |  6 ++++--
>  arch/x86/mm/dump_pagetables.c   |  3 ++-
>  include/linux/ptdump.h          |  1 +
>  mm/ptdump.c                     | 13 +++++++++++++
>  7 files changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> index 796231a4fd63..1a6f4a3513e5 100644
> --- a/arch/arm64/mm/ptdump.c
> +++ b/arch/arm64/mm/ptdump.c
> @@ -299,7 +299,8 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
>  			.range = (struct ptdump_range[]){
>  				{info->base_addr, end},
>  				{0, 0}
> -			}
> +			},
> +			.note_non_leaf = false
>  		}

It would be acceptable to omit all of these and rely upon the runtime
zeroing which the compiler will emit.

Documentation/arch/arm64/ptdump.rst might need updating.

Please include sample output in the changelog so we can better
understand the user's view of this change.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
