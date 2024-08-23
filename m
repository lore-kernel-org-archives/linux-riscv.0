Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D86C52D7C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 09:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiE2m2v+41y+YGSR7d00THuW2+CSTQdKiajDbByty3A=; b=MIWl911AOqCn5M
	ETdrJRr+3q89bY7e0xT6eI77GZBi0TTpIsSna6KQHQgXo7+nAsiuvmqCvYTlQ3j1mgcDUuqHTtvyn
	Fsm1FhvWzrowhv0Yx/3jnE0ICeFKS2+83sXiUkdh+NbYembhKK3cM8AtF7YghnsT/bkoHRKbcdHK7
	CXzGbanZGL4LQek7ZwBdZIjAskEVA8Uo0dXeGvn+Syp1qC7Lk7SB9e8YPMfzBGZBQRPNDIHHnBGMD
	OKqtNsn4pIhEKxrjXBq3/UbCt5f4V+B1aZBjR6DiC8Tf5noSKvX0Rb7Ar/bktECHr10PST0Erfon8
	SqcxMhcJQyVSFRQWC9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQw8-0000000GCGK-1wgL;
	Fri, 23 Aug 2024 09:50:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQuf-0000000GBqr-1BYf;
	Fri, 23 Aug 2024 09:48:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 74FB1A42641;
	Fri, 23 Aug 2024 09:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6993C32786;
	Fri, 23 Aug 2024 09:48:49 +0000 (UTC)
Date: Fri, 23 Aug 2024 10:48:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 27/39] arm64: Add Kconfig for Guarded Control Stack
 (GCS)
Message-ID: <Zsha_58Y2nkOC35v@arm.com>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
 <20240822-arm64-gcs-v11-27-41b81947ecb5@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822-arm64-gcs-v11-27-41b81947ecb5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_024857_408920_0ABC697B 
X-CRM114-Status: GOOD (  18.54  )
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

On Thu, Aug 22, 2024 at 02:15:30AM +0100, Mark Brown wrote:
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index a2f8ff354ca6..772f9ba99fe8 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2137,6 +2137,26 @@ config ARM64_EPAN
>  	  if the cpu does not implement the feature.
>  endmenu # "ARMv8.7 architectural features"
>  
> +menu "v9.4 architectural features"
> +
> +config ARM64_GCS
> +	bool "Enable support for Guarded Control Stack (GCS)"
> +	default y
> +	select ARCH_HAS_USER_SHADOW_STACK
> +	select ARCH_USES_HIGH_VMA_FLAGS
> +	help
> +	  Guarded Control Stack (GCS) provides support for a separate
> +	  stack with restricted access which contains only return
> +	  addresses.  This can be used to harden against some attacks
> +	  by comparing return address used by the program with what is
> +	  stored in the GCS, and may also be used to efficiently obtain
> +	  the call stack for applications such as profiling.
> +
> +	  The feature is detected at runtime, and will remain disabled
> +	  if the system does not implement the feature.
> +
> +endmenu # "v9.4 architectural features"

BTW, as Mark R spotted we'd also need to handle uprobes. Since that's
off in defconfig, I think it can be done separately on top of this
series. In the meantime, we could make this dependent on !UPROBES.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
