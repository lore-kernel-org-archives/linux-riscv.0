Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A7BC19F2E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 19:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4uFIlVvDhe3T2TEKYNyXcyDTvFp1JBAXltAf41ZcaA=; b=vQibgegeQ3dZ7S
	/sX/9Tb+S0Vib5iamN2N6PPtJvjFnxzE4SNyy5mPkaJWLFBVhqE3aoD62hIhEIZ1wpDShTDhQIKwR
	G6Nwn8/3gzsL7/gKgxD9Z7lIx8LxrlPUkdci+jrkL9+0D1yJioDAvfw1zqDvZeHG8/+5HkhwTk6lp
	DLenYUZFfnpuGcy1gCH5R+b1G8mY8bxezylcg47GyTO2fRj5GkbLAvDVOqQzXwpRB91mA6DCbU0UO
	vZVrGVjyIdSNTr10HSRwVeby+QAoCw5FA+gWsrVk71ZryiWssozli5850Vork0XnQN4I618hrm6Cl
	2xK3Y0pbnBbTuczTa3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNVT-00000005Dzv-0LYz;
	Wed, 26 Feb 2025 19:55:47 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNT8-00000005Dc0-0OWt;
	Wed, 26 Feb 2025 19:53:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71699611F1;
	Wed, 26 Feb 2025 19:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EDBC4CED6;
	Wed, 26 Feb 2025 19:53:17 +0000 (UTC)
Date: Wed, 26 Feb 2025 19:53:15 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH V3 5/5] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
Message-ID: <Z79xK3xJWm0vH5jH@arm.com>
References: <20250226122404.1927473-1-anshuman.khandual@arm.com>
 <20250226122404.1927473-6-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250226122404.1927473-6-anshuman.khandual@arm.com>
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

On Wed, Feb 26, 2025 at 05:54:04PM +0530, Anshuman Khandual wrote:
> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
> index 6cf4aae05219..b2931d1ae0fb 100644
> --- a/arch/arm64/include/asm/ptdump.h
> +++ b/arch/arm64/include/asm/ptdump.h
> @@ -7,7 +7,7 @@
>  
>  #include <linux/ptdump.h>
>  
> -#ifdef CONFIG_PTDUMP_CORE
> +#ifdef CONFIG_PTDUMP

Do we need this #ifdef at all? I haven't tried but usually, if the
feature is not enabled, the header file on its own should be harmless.

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
