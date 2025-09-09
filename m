Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14F1CA0FED
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 17:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1a2YMXNyX1UJEX6IzVSTmC8eq0dXPsIfUre1+PAUgG8=; b=0/uWqf9gIi4TMD
	FwLP+067HWWwK+v8KByarh6pNVbYMDMeu9Lr3XK6ANCoSMSSoxCX/ngfJ/lfPja3Ox4BBfx6boNGr
	DR65Bsyyav1iaNyoTWOFtzAqPpAuzPtM52u5041+tyfNdll0/czAfVfAjBOgUHU7MMZpxXf5H4rRy
	3GgNFlmfwQIp7Hf5ayj38b+/o0ifunMQkzUC2DsQFkEBZM5iG2jH5kzAOce+g1KwaH0vqGJLcbbn4
	gyfWtYvD6D9l7WefoTicIhfMKxCDwt0ltVhs0uXe7KbjrCGxAYJIpPnilcBOc64B5yOuWLhPgNquM
	5Pae5E4hMLkHV4SoLlNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw27e-000000097CI-1ruR;
	Tue, 09 Sep 2025 17:27:14 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1tx-00000008m6a-2miO
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 17:13:06 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-889b846c568so223357739f.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 10:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1757437984; x=1758042784; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CLUjg7yNG/ewQNg8kcK05UeNpGcVlJZKIKA/TtV5FkM=;
        b=k7L0v0UfTgH2LG7/EG8bG/Y5aArNx37LIU5Idv/puC8EfD3YApUYAdArde8g1nT8LZ
         1upnLbc9wfegrYfIbggKHOvxNW1sq0RQlK/aON9AETI5wq88RuweZb0Q39tpYqZzxQvZ
         wOS837M/S6cJwG57M71bbn7r6f8H3mGiOSTvEUQxgFQgB2T+mNikEjqd1ZAbYe9wLsIL
         K6pgnUTBvoMV4Tw2bG5ThqloFcbyQvUYDiH2hyJfz18A0y6vAWgkjX20hPgASctyB9Ks
         V+4s/Cylgz2fNGItOxRdMJnb1LsWjotWwle2sxZp/7y8OL3wR1UcZTRMPJRK9sUCKdQl
         zUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757437984; x=1758042784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLUjg7yNG/ewQNg8kcK05UeNpGcVlJZKIKA/TtV5FkM=;
        b=v0cLWXLQGal1Bvp3IpjUhcyPyq93eCvkaSxzxVTSEh+Yf+BzygwTUgaapzF+765ZNZ
         kZs42QAjBPhArelL0yFwURxXEUv7FM35PLli6mKlQKi+zlL/R/f9GtpBTfyAFw2/uk2Q
         UY4iB0LWKJ4Rvpc1i73OSMvGlg9TeAJbldCdb4lU23Dfc3anvffiZbQZQpAJbfKxQxqW
         nMAkNSM+9Yyi8m2xQupKc2kUxTVAk1BSEUEPcKf1aYlZE7FpdqZsFipWQG1yyWMYGVum
         e5R9x2VpZyHytDgpfnms2CBc1i8R/FG/8Sf8aRTNd4gK/PPebnG+dNJ1WYw/37RV4y3K
         U79g==
X-Gm-Message-State: AOJu0YwPZhhIem2t47/XVQNJdBGCxFFetjoctkZeQJS9jOn9GN5EgF3G
	EvIvulF8bmDb0EI+l0fejG/41HdbgV9QA8nl37M+K2TPBJm4+9LAmhy8YQVyVMp5MYY=
X-Gm-Gg: ASbGncuw7LosHqBRI7BnCazOelRewr487C5P7RfX4Fcd+cF+ScU63YxeKmGykj0R+an
	LLAktUXJgsCPaI1iIPf16cdA1g1SylNuTWLmT5LbZgaX1JLBwDBT/U7o5rt7I8lsR8GdyEfLGWO
	cdzGfOAva2/2GwaGDWbaaeBXblvaV0t9/miXfvq4XQw4CDAvb4lmaifA1KDG05NeuXSzzwZlF4R
	P8UEuF6xLZ1L6Ry4I7D0N9tcih1839Nh0BueRR64BzuQNRHSY65IxTxHYsziSqi0szQRZEuO+Fr
	1sNOXzfHUwIK2fS8q3JwIz6J7L9i6FPc2nhaC0Gim5Wg9k88PtNSLQGhjacisMnZHn1S39gQ9To
	m750JIa3D1CFJHLTfbjh4Vqp0rvokWusKn88=
X-Google-Smtp-Source: AGHT+IEMFpaj8bMLzDHV4JtX7+vWxYaXCZCBKZ479bbfT1RoejNAOJVpK28JUe1NbmGtyLq/mXgp8A==
X-Received: by 2002:a05:6e02:1a0c:b0:40a:e839:a2e4 with SMTP id e9e14a558f8ab-40ae839a49bmr96540285ab.30.1757437980965;
        Tue, 09 Sep 2025 10:13:00 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5104c5a4d0dsm5507495173.0.2025.09.09.10.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 10:13:00 -0700 (PDT)
Date: Tue, 9 Sep 2025 12:12:59 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Deepak Gupta <debug@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V10 3/5] riscv: Add RISC-V Svrsw60t59b extension support
Message-ID: <20250909-2130daabd7f57a8a357c677f@orel>
References: <20250909095611.803898-1-zhangchunyan@iscas.ac.cn>
 <20250909095611.803898-4-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250909095611.803898-4-zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_101305_705787_1FF494AA 
X-CRM114-Status: GOOD (  22.54  )
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

On Tue, Sep 09, 2025 at 05:56:09PM +0800, Chunyan Zhang wrote:
> The Svrsw60t59b extension allows to free the PTE reserved bits 60
> and 59 for software to use.
> 
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>  arch/riscv/Kconfig             | 14 ++++++++++++++
>  arch/riscv/include/asm/hwcap.h |  1 +
>  arch/riscv/kernel/cpufeature.c |  1 +
>  3 files changed, 16 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a4b233a0659e..d99df67cc7a4 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -862,6 +862,20 @@ config RISCV_ISA_ZICBOP
>  
>  	  If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_SVRSW60T59B
> +	bool "Svrsw60t59b extension support for using PTE bits 60 and 59"
> +	depends on MMU && 64BIT
> +	depends on RISCV_ALTERNATIVE
> +	default y
> +	help
> +	  Adds support to dynamically detect the presence of the Svrsw60t59b
> +	  extension and enable its usage.
> +
> +	  The Svrsw60t59b extension allows to free the PTE reserved bits 60
> +	  and 59 for software to use.
> +
> +	  If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
>  	def_bool y
>  	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index affd63e11b0a..f98fcb5c17d5 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -106,6 +106,7 @@
>  #define RISCV_ISA_EXT_ZAAMO		97
>  #define RISCV_ISA_EXT_ZALRSC		98
>  #define RISCV_ISA_EXT_ZICBOP		99
> +#define RISCV_ISA_EXT_SVRSW60T59B	100
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 743d53415572..de29562096ff 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -540,6 +540,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>  	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
> +	__RISCV_ISA_EXT_DATA(svrsw60t59b, RISCV_ISA_EXT_SVRSW60T59B),

svrsw60t59b should come before svvptc. See the ordering rule comment at
the top of the array.

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

>  };
>  
>  const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
