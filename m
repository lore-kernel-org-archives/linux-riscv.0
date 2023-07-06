Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000C7EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 22:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=iPubb2p8aKuni9Zl9zwcrszfcOc382568ofKOGfB734=; b=rksDE1CIas4ftHVLx6rAf1ACTM
	Tjb27nr73TVNrMYTIkYzXckp0EKI/iN0UYL6zw+6uGNIeu59+JGex4RA8ZH+t7hIAlYClN9/Vq76y
	o+JNljWlqqGcDXSP2eaMfVU7BSzBuPDfsWuoveCJEDeKIseR5qgVwwfRaRo+nrtwJ29u+atRs0KdN
	00qRQDG1G1oFYsVDIdsmdW3i+Lh0Mzw4mRwejCzQzPyTTIGGMAWUaGcV1P0oe1F3KbNJes130oFdO
	hGjoznK7RggiHhSwngorztPH4RY+jKY5uPQCEVN/5h7OZMtVVb57V9PMLAKll2oT6BmteN9qj8xsf
	4MvxPCGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHXWo-002rSV-0V;
	Thu, 06 Jul 2023 22:32:46 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHXWj-002rRR-3A
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 22:32:43 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-26307d808a4so976653a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 15:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688682761; x=1691274761;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0I9jMQ+vOGGYxfcUxVDPVdkj3AkI/uMxWS/xRQpRdI=;
        b=JNsFpKffPwcMV5c6xXSLYavf5b5+EGJksAxRUQKoNvWLjgtnQc1hNtwYLg6+EX34qZ
         +vVBTlPPDiVRrcvywH8v7OhdyFYFpiuXYP81AoOqv/Q40DHzh/Ccqmrg7Yc6sEtR2z+M
         hosh01784Q/g87EjyuLRu+nFDjKBvWWfiE3Z3aV1Pp7c6VD6gcmJ3gJwWPrvPel8XXY1
         Mk96wPh70sWOFBN6Eh73gYCVuF/zgktmGmWRCK+TM+s4gsulN1RbLYfNTnGC9WtGzl80
         XO9r8KdThZ1ESa6xuR5HIEUZbWlwcfKMobMVNTGH1GmfbSZcY4YSfELIS/B9INadWhi+
         HLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688682761; x=1691274761;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0I9jMQ+vOGGYxfcUxVDPVdkj3AkI/uMxWS/xRQpRdI=;
        b=eJaKRrOgTswrwO4MHZaecsRNZpNbupgLE+HZ5tKKgG9jQlEEpq7n2o/7E0JMk8fFUq
         JfyOp6UkZj5EoORO7Okq61ziH+qa2tkTdcKFZ0QD2iFi9hAfM3UPh34EtHQvTs5wQmU7
         G0QVxFW9zknh9H64KTZv3jd4IfbVG5Bdh76iv61ALooswcSVAoLr65cu3SGJz42nLHNL
         ULdlf2KKNaaAZ7uYSDdvwnaEmqpgnSrG2XJTmPpcXNXXeJ4hyCoiAc8M99N9OR9ju2B7
         C+maujjMJ/9goI0MraOA3Kaysz8eB2itJEvY2dmmSRs63HFRqqHHdXmmXZBu0FjfDI7+
         qGvQ==
X-Gm-Message-State: ABy/qLYU22jj46w/Nfqyo/EYO0whLFvfA94dU1LGqgbodOXG58BOoiiw
	ApwF0rL4vw3Qn0kSLbWsb1F/lw==
X-Google-Smtp-Source: APBJJlHrAPqoYnXyVV7hXvAq2LJAfh1k9BS/GZkN4dxKZDzzO/g5a2uMVaTMYVGNMwD2ph3kKrViJA==
X-Received: by 2002:a17:90b:23c7:b0:263:7d57:16e9 with SMTP id md7-20020a17090b23c700b002637d5716e9mr3210557pjb.21.1688682760697;
        Thu, 06 Jul 2023 15:32:40 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id m8-20020a17090a34c800b00263fd82106asm282941pjf.35.2023.07.06.15.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 15:32:39 -0700 (PDT)
Date: Thu, 06 Jul 2023 15:32:39 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 15:31:47 PDT (-0700)
Subject: Re: [PATCH v5 11/13] riscv/kexec: refactor for kernel/Kconfig.kexec
In-Reply-To: <20230706222027.189117-12-eric.devolder@oracle.com>
CC: linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>,
  Will Deacon <will@kernel.org>, chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
  James.Bottomley@HansenPartnership.com, deller@gmx.de, ysato@users.sourceforge.jp, dalias@libc.org,
  glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
  dave.hansen@linux.intel.com, x86@kernel.org, linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
  linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  linux-sh@vger.kernel.org, kernel@xen0n.name, mpe@ellerman.id.au, npiggin@gmail.com,
  christophe.leroy@csgroup.eu, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
  svens@linux.ibm.com, hpa@zytor.com, keescook@chromium.org, paulmck@kernel.org, peterz@infradead.org,
  frederic@kernel.org, akpm@linux-foundation.org, Ard Biesheuvel <ardb@kernel.org>,
  samitolvanen@google.com, juerg.haefliger@canonical.com, Arnd Bergmann <arnd@arndb.de>,
  rmk+kernel@armlinux.org.uk, linus.walleij@linaro.org, sebastian.reichel@collabora.com, rppt@kernel.org,
  kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com, ziy@nvidia.com, masahiroy@kernel.org,
  ndesaulniers@google.com, mhiramat@kernel.org, ojeda@kernel.org, thunder.leizhen@huawei.com,
  xin3.li@intel.com, tj@kernel.org, Greg KH <gregkh@linuxfoundation.org>, tsi@tuyoix.net,
  bhe@redhat.com, hbathini@linux.ibm.com, sourabhjain@linux.ibm.com, eric.devolder@oracle.com,
  boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: eric.devolder@oracle.com
Message-ID: <mhng-c1c5d9c4-b2c8-45c4-ac0a-084cfecb3833@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_153242_040349_C3EC5618 
X-CRM114-Status: GOOD (  28.61  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 06 Jul 2023 15:20:25 PDT (-0700), eric.devolder@oracle.com wrote:
> The kexec and crash kernel options are provided in the common
> kernel/Kconfig.kexec. Utilize the common options and provide
> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
> equivalent set of KEXEC and CRASH options.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  arch/riscv/Kconfig | 44 +++++++++++++-------------------------------
>  1 file changed, 13 insertions(+), 31 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b49793cf34eb..8a3af850597a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -647,48 +647,30 @@ config RISCV_BOOT_SPINWAIT
>
>  	  If unsure what to do here, say N.
>
> -config KEXEC
> -	bool "Kexec system call"
> -	depends on MMU
> +config ARCH_SUPPORTS_KEXEC
> +	def_bool MMU
> +
> +config ARCH_SELECTS_KEXEC
> +	def_bool y
> +	depends on KEXEC
>  	select HOTPLUG_CPU if SMP
> -	select KEXEC_CORE
> -	help
> -	  kexec is a system call that implements the ability to shutdown your
> -	  current kernel, and to start another kernel. It is like a reboot
> -	  but it is independent of the system firmware. And like a reboot
> -	  you can start any kernel with it, not just Linux.
>
> -	  The name comes from the similarity to the exec system call.
> +config ARCH_SUPPORTS_KEXEC_FILE
> +	def_bool 64BIT && MMU
>
> -config KEXEC_FILE
> -	bool "kexec file based systmem call"
> -	depends on 64BIT && MMU
> +config ARCH_SELECTS_KEXEC_FILE
> +	def_bool y
> +	depends on KEXEC_FILE
>  	select HAVE_IMA_KEXEC if IMA
> -	select KEXEC_CORE
>  	select KEXEC_ELF
> -	help
> -	  This is new version of kexec system call. This system call is
> -	  file based and takes file descriptors as system call argument
> -	  for kernel and initramfs as opposed to list of segments as
> -	  accepted by previous system call.
> -
> -	  If you don't know what to do here, say Y.
>
>  config ARCH_HAS_KEXEC_PURGATORY
>  	def_bool KEXEC_FILE
>  	depends on CRYPTO=y
>  	depends on CRYPTO_SHA256=y
>
> -config CRASH_DUMP
> -	bool "Build kdump crash kernel"
> -	help
> -	  Generate crash dump after being started by kexec. This should
> -	  be normally only set in special crash dump kernels which are
> -	  loaded in the main kernel with kexec-tools into a specially
> -	  reserved region and then later executed after a crash by
> -	  kdump/kexec.
> -
> -	  For more details see Documentation/admin-guide/kdump/kdump.rst
> +config ARCH_SUPPORTS_CRASH_DUMP
> +	def_bool y
>
>  config COMPAT
>  	bool "Kernel support for 32-bit U-mode"

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
