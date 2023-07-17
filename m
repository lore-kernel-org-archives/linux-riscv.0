Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF1AC0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvCYlKf8UwJnZ9D2ZVtSddZwHQkffLVX4UmrzmmQfIY=; b=g/yFdKf8kmC4JS
	4XD+o6Vrpm8ytrhAxYpaW3cJM/TVPtIGmGMChCXowPYLE7mv60B/iymYgTFIoT+P1LmtGefMqQo9/
	YcttHMrlIDAoupacYihAMqKwbON4HNdn5/mg8Cjl+oRQOV253q2btxwolqIIvLY/nPAqmwPRiptTR
	InzNMYDJixYPpWwB3K+LEI+jjhlgocMkSVbOR5czo5ZRL0dGklH5kW0NU30a8Ef1Q5w5qLv808heF
	4LwbnFCQJmOfLZGfk9VrdzhX6ysea6f/S16ZkbBf5YyJvhonDIpBTyphFXrS65sru4aEu0cXfCQ/R
	0tUP1U3NFFaqpWRENMLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLNPo-003zzG-2e;
	Mon, 17 Jul 2023 12:33:24 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLNOy-003zoE-0x;
	Mon, 17 Jul 2023 12:33:22 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4R4Lxz5Rfsz6J6nS;
	Mon, 17 Jul 2023 20:29:59 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 17 Jul
 2023 13:32:26 +0100
Date: Mon, 17 Jul 2023 13:32:25 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mark Brown <broonie@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, James
 Morse <james.morse@arm.com>, "Suzuki K Poulose" <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, "Oleg Nesterov" <oleg@redhat.com>, Eric
 Biederman <ebiederm@xmission.com>, "Kees Cook" <keescook@chromium.org>, Shuah
 Khan <shuah@kernel.org>, "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs
 Nagy <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <kvmarm@lists.linux.dev>,
	<linux-fsdevel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 26/35] arm64: Add Kconfig for Guarded Control Stack
 (GCS)
Message-ID: <20230717133225.00000ce7@Huawei.com>
In-Reply-To: <20230716-arm64-gcs-v1-26-bf567f93bba6@kernel.org>
References: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
	<20230716-arm64-gcs-v1-26-bf567f93bba6@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_053232_680626_DE3A1094 
X-CRM114-Status: GOOD (  17.27  )
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

On Sun, 16 Jul 2023 22:51:22 +0100
Mark Brown <broonie@kernel.org> wrote:

> Provide a Kconfig option allowing the user to select if GCS support is
> built into the kernel.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/Kconfig | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 7856c3a3e35a..e1aeeda13c52 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2091,6 +2091,25 @@ config ARM64_EPAN
>  	  if the cpu does not implement the feature.
>  endmenu # "ARMv8.7 architectural features"
>  
> +menu "v9.4 architectural features"
> +
> +config ARM64_GCS
> +	bool "Enable support for Guarded Control Stack (GCS)"
> +	default y
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
> +endmenu # "2022 archiectural features"

Inconsistent naming and spelling mistake.

> +
>  config ARM64_SVE
>  	bool "ARM Scalable Vector Extension support"
>  	default y
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
