Return-Path: <SRS0=53Iy=OY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C124C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 01:34:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F5B460F6B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 01:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F5B460F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:Cc:References:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f4SsHoXEhPcg0RIdnk+PXCHI9s2OIkEG61bj/hmcvVk=; b=2/TG2LCIAe/QClrYyx/HiyX7ig
	pcZOrbVqBf6VSqWUQiGlcub0L0lhwTnENbkif1IKqw1Q/tXV8x9dk08Hd+ntOn7xZqfagDpoXVYGe
	uAVbNoAsa+/zTYtZoEDTkWpUp6sqFTCXnBN2VFolDPnqHKhwuX8VO5zNkdpmSqw3t3tbYK/9S4eln
	DuYXl3LNkHAXL+Kxis7u5pNTbdsjxJYy1k0uXP8Hg8FlcBrWFWnyHcdxKb40Q90MtX7LD/svhnF6+
	fciMIYVDeR0hjbzujRVBVW/wmoYPlJOjLIEkHLIV1UmuoEL6E9uN58BslAUVeiho1q7SrBAGsRBvQ
	zkKvHEHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXCrz-004q6t-6W; Mon, 04 Oct 2021 01:34:19 +0000
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXCrw-004q5Z-4j
 for linux-riscv@lists.infradead.org; Mon, 04 Oct 2021 01:34:17 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 2F73A2B012EA;
 Sun,  3 Oct 2021 21:34:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 03 Oct 2021 21:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:references:cc:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=j
 08sh6m6YgSaQWXZPVhA3JZmyLlucPN/yEkWrIr4Uc0=; b=EjcmciBXjpLqcxflb
 q67yJ8hPxQ7VhDsjMltDPGQ6TKPw3oXAka4cymfenw2sFcV9+2PTBeher17PCAD2
 M6kswA7faR1slq6kLy2stdcmNk43Ug5Y/blYZYKVehffZqdi97PQLbDn+i08lhu0
 R1Nw3jJV+fHekXVYRNjfLsXHARse30X4sfAhXuboH83q7h8DENnKPSyQ3ZquWrGF
 5DC67sDh2lR1epjdB+SZQdnwQZeNv6yuUKyisZqodz2BaCLXbYXJmLYm5onSbfhx
 9lJe4gEJ81Ss/4NKGdLUt/Ac87r9I7vEUA4I7zUodSoSLIIyTskdzmCpsycMsdA1
 WnqcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=j08sh6m6YgSaQWXZPVhA3JZmyLlucPN/yEkWrIr4U
 c0=; b=YC6izWu0Kjo1Qb7rA1jiEuQZsbWP7DEtCGykjlcvbxyEmTy4uAgmF5TLz
 B89QY7KF5+IKB9q/Zbca/ipkMjn0sRE5vXT3outSaz83cwUcq0HR3iERRstMCD3w
 agf+naermuxGMRvEqS2+2REWjPbdOSUqAg6UtQ+cSYAznbVZtMbmltU+dRM8bBvx
 FwbZjY0dWnFzr+vjBUuLWvqzCH6mcMG1nO5mNCGT+OZpTdOMn39MhLdSQX9vW7rC
 HE7ul4pQxxnzjZK5RYwgGepJBZkmWB0H6kk4DdMKC1vTY+eIWAw6UQHF0Se4T7jh
 dpNa63nAbcPFEZdPaNrjsxgDOPZqg==
X-ME-Sender: <xms:E1paYc1__yfUYN85tBFlf72T7I1jqtG8d0yBiLWQrQMdN5ebn0lL3w>
 <xme:E1paYXG0jXORCRdVxXIEoUldnVdUZ9-NV51DGwmp2RrYQVPV-S9EsUpoF9cL3SLMn
 gt6mI6pVunQPNUD8A>
X-ME-Received: <xmr:E1paYU6y_9AKaPRO0DydJIqpi-eNzSWzNyW2C_hfAiQvd2upjRqNZFzsJVVOgS314Xr9ZcJDQ7PIZSb0EGAsL0X8wTYe6yY_Kx6a2kunrTpjL-l3aqWRS2V8MA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeluddggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepgfevffetleehffejueekvdekvdeitdehveegfeekheeuieeiueet
 uefgtedtgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:E1paYV1r3P_dvbSWePjc29cvvEWXFXN_ST5zIbpEPxJBZKODWiJg5g>
 <xmx:E1paYfEIT9WVE1jLcCr3siueJ7uhD9Jjw7DJRQzmJNQs8z1hFiummw>
 <xmx:E1paYe_wwZGRhioAsm199qxDzvYAafosWWiaQjXxjiQ7BlJUzHNBfQ>
 <xmx:FFpaYemw4ofYc9WS4pEaHrrRkD84RolIzYf9F3aJI6S2r_8jmQPaT8zgwwo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 Oct 2021 21:34:10 -0400 (EDT)
Subject: Re: [PATCH v2 04/10] riscv: Implement sv48 support
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
References: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
 <20210929145113.1935778-5-alexandre.ghiti@canonical.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <Atish.Patra@wdc.com>,
 Christoph Hellwig <hch@lst.de>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Kees Cook <keescook@chromium.org>, Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
 linux-arch@vger.kernel.org
From: Samuel Holland <samuel@sholland.org>
Message-ID: <748a2c58-4d69-6457-0aa5-89797cb45a5c@sholland.org>
Date: Sun, 3 Oct 2021 20:34:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210929145113.1935778-5-alexandre.ghiti@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_183416_299969_8147D417 
X-CRM114-Status: GOOD (  18.20  )
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

On 9/29/21 9:51 AM, Alexandre Ghiti wrote:
> By adding a new 4th level of page table, give the possibility to 64bit
> kernel to address 2^48 bytes of virtual address: in practice, that offers
> 128TB of virtual address space to userspace and allows up to 64TB of
> physical memory.
> 
> If the underlying hardware does not support sv48, we will automatically
> fallback to a standard 3-level page table by folding the new PUD level into
> PGDIR level. In order to detect HW capabilities at runtime, we
> use SATP feature that ignores writes with an unsupported mode.
> 
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>  arch/riscv/Kconfig                      |   4 +-
>  arch/riscv/include/asm/csr.h            |   3 +-
>  arch/riscv/include/asm/fixmap.h         |   1 +
>  arch/riscv/include/asm/kasan.h          |   2 +-
>  arch/riscv/include/asm/page.h           |  10 +
>  arch/riscv/include/asm/pgalloc.h        |  40 ++++
>  arch/riscv/include/asm/pgtable-64.h     | 108 ++++++++++-
>  arch/riscv/include/asm/pgtable.h        |  13 +-
>  arch/riscv/kernel/head.S                |   3 +-
>  arch/riscv/mm/context.c                 |   4 +-
>  arch/riscv/mm/init.c                    | 237 ++++++++++++++++++++----
>  arch/riscv/mm/kasan_init.c              |  91 +++++++--
>  drivers/firmware/efi/libstub/efi-stub.c |   2 +
>  13 files changed, 453 insertions(+), 65 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 13e9c4298fbc..69c5533955ed 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -149,7 +149,7 @@ config PAGE_OFFSET
>  	hex
>  	default 0xC0000000 if 32BIT
>  	default 0x80000000 if 64BIT && !MMU
> -	default 0xffffffe000000000 if 64BIT
> +	default 0xffffc00000000000 if 64BIT
>  
>  config ARCH_FLATMEM_ENABLE
>  	def_bool !NUMA
> @@ -197,7 +197,7 @@ config FIX_EARLYCON_MEM
>  
>  config PGTABLE_LEVELS
>  	int
> -	default 3 if 64BIT
> +	default 4 if 64BIT
>  	default 2
>  
>  config LOCKDEP_SUPPORT
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 87ac65696871..3fdb971c7896 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -40,14 +40,13 @@
>  #ifndef CONFIG_64BIT
>  #define SATP_PPN	_AC(0x003FFFFF, UL)
>  #define SATP_MODE_32	_AC(0x80000000, UL)
> -#define SATP_MODE	SATP_MODE_32
>  #define SATP_ASID_BITS	9
>  #define SATP_ASID_SHIFT	22
>  #define SATP_ASID_MASK	_AC(0x1FF, UL)
>  #else
>  #define SATP_PPN	_AC(0x00000FFFFFFFFFFF, UL)
>  #define SATP_MODE_39	_AC(0x8000000000000000, UL)
> -#define SATP_MODE	SATP_MODE_39
> +#define SATP_MODE_48	_AC(0x9000000000000000, UL)
>  #define SATP_ASID_BITS	16
>  #define SATP_ASID_SHIFT	44
>  #define SATP_ASID_MASK	_AC(0xFFFF, UL)
> diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
> index 54cbf07fb4e9..58a718573ad6 100644
> --- a/arch/riscv/include/asm/fixmap.h
> +++ b/arch/riscv/include/asm/fixmap.h
> @@ -24,6 +24,7 @@ enum fixed_addresses {
>  	FIX_HOLE,
>  	FIX_PTE,
>  	FIX_PMD,
> +	FIX_PUD,
>  	FIX_TEXT_POKE1,
>  	FIX_TEXT_POKE0,
>  	FIX_EARLYCON_MEM_BASE,
> diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
> index a2b3d9cdbc86..1dcf5fa93aa0 100644
> --- a/arch/riscv/include/asm/kasan.h
> +++ b/arch/riscv/include/asm/kasan.h
> @@ -27,7 +27,7 @@
>   */
>  #define KASAN_SHADOW_SCALE_SHIFT	3
>  
> -#define KASAN_SHADOW_SIZE	(UL(1) << ((CONFIG_VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
> +#define KASAN_SHADOW_SIZE	(UL(1) << ((VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))

Does this change belong in patch 1, where you remove CONFIG_VA_BITS?

Regards,
Samuel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
