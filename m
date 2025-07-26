Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754ADC83F17
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Jul 2025 07:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zbqeCmo7U14YwCjO8rc6wWu7ABh/qIBFqjH68iDCdUk=; b=P2tVywdAML2E4W
	O4BFfUObiFMLNbLYmKRyyrlHg566jonzEXUrKOMD6izK1J8TCbqVzhIHHbUrNcTaJy+wHju5/0TaE
	GhmsIwIV51HbTHTEbKDaAMgciOb8qcI/uHeGS3FwFwaaEcaBGXLY4LG0oRBWSeW9cvasYnGCaYaaA
	IiwQ1G3nXzl1wc4MCjqqPj/zK1zqvWmaX/lFDw602KiUrW0IWajpJM7UVQXgmf6HLyqhxh/qw2Eob
	uLs1uwxXrwehiR8AdXo/4eWyB2D+vEpJcCDyRiMHIfIOFcqm0B5h0zqoJSWg/K6eUFH8lXGr6Ghoe
	HM/h8/4fER+SwKgTjekQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufZXz-0000000BEhm-47DQ;
	Sat, 26 Jul 2025 07:42:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufZXx-0000000BEhL-0MRs
	for linux-riscv@lists.infradead.org;
	Sat, 26 Jul 2025 07:42:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3759EA522AC;
	Sat, 26 Jul 2025 07:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1BAC4CEED;
	Sat, 26 Jul 2025 07:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753515738;
	bh=JH80ui6HzMZrysAZcLLCGsZmU6VvUIi+CTfUhFaghYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gswPVrHk05CTmMSr0rmQsIvvtZGLK84sbkhG7vujS1AtdBJA3iUrxjWoNK98NMpda
	 ONzMzbP/rH/UKNn5AGjuowNFtCTTKJdWOGXj7+cXUBv4SjmXHMqXaZJ89BtyrLgtao
	 sSgrF+ZyPF68pEsFAuSeuuJQHuOzMAPxqSA19FKpb4XI3RynqKvZ9IPmNqv5FW9t1t
	 Itp5hGadOCbL7KVHwUT5/b25VhAxaXhNZif1/oxZZKHKJPwkfA8HoTwEF5HY7nWkCV
	 GGzrb4UeOALjgC2TLEYJIW4g8y91Wkoc30JITbnWHVGq3pXn4NFuyACkQGvB1r09oS
	 4LB9QaOFiYRwQ==
Date: Sat, 26 Jul 2025 10:42:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, samitolvanen@google.com,
	apatel@ventanamicro.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com,
	samuel.holland@sifive.com, bjorn@rivosinc.com, fweimer@redhat.com,
	jeffreyalaw@gmail.com, heinrich.schuchardt@canonical.com,
	andrew@sifive.com, ved@rivosinc.com
Subject: Re: [PATCH 06/11] mm: Introduce ARCH_HAS_KERNEL_SHADOW_STACK
Message-ID: <aISGypOAaDGaUZgd@kernel.org>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-6-04b8fa44c98c@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250724-riscv_kcfi-v1-6-04b8fa44c98c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_004221_263041_98C5D592 
X-CRM114-Status: GOOD (  15.03  )
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

On Thu, Jul 24, 2025 at 04:36:59PM -0700, Deepak Gupta wrote:
> commit bcc9d04e74 ("mm: Introduce ARCH_HAS_USER_SHADOW_STACK") introduced
> `ARCH_HAS_USER_SHADOW_STACK`. Introducing `ARCH_HAS_KERNEL_SHADOW_STACK`
> so that arches can enable hardware assistance for kernel shadow stack.
> 
> If `CONFIG_DYNAMIC_SCS` or `CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK` are
> selected, skip compiler flag `-fsanitizer=shadow-call-stack`.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  Makefile   | 2 +-
>  mm/Kconfig | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 35e6e5240c61..7e3ecca9353d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -987,7 +987,7 @@ LDFLAGS_vmlinux += --gc-sections
>  endif
>  
>  ifdef CONFIG_SHADOW_CALL_STACK
> -ifndef CONFIG_DYNAMIC_SCS
> +ifeq ($(or $(CONFIG_DYNAMIC_SCS),$(CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK)),false)
>  CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
>  KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
>  KBUILD_RUSTFLAGS += -Zsanitizer=shadow-call-stack
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 781be3240e21..f295ea611cdb 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1367,6 +1367,12 @@ config ARCH_HAS_USER_SHADOW_STACK
>  	  The architecture has hardware support for userspace shadow call
>            stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>  
> +config ARCH_HAS_KERNEL_SHADOW_STACK
> +	bool
> +	help
> +	  The architecture has hardware support for kernel shadow call
> +          stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).

nit: tab and two space for indentation of the help text

> +

I think both ARCH_HAS_USER_SHADOW_STACK and ARCH_HAS_KERNEL_SHADOW_STACK
belong to arch/Kconfig rather than mm/Kconfig

>  config ARCH_SUPPORTS_PT_RECLAIM
>  	def_bool n
>  
> 
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
