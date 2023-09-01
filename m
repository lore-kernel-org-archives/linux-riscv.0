Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E88CA0FE8
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 20:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGe+XEP9J1wKHOCZiy7BqgibC7xMohRtqv82ydkE5qI=; b=b84hNWGt/lSJ20
	XTUcFYYMOJAlKLo5cc2CN6t/bYdlNrg2AnM1sgnkG0oLm09tLJKIUcHXVhzKpAT0rHzhbREvuwkLr
	InFSIRpf/NpYeq7NQ9WjFFzYHD8niwtaxAJZBfmpS9b8xJFN6HbSFdbgIXr5MTdhuNj/gKM7GW1Tq
	ze4Mc+Dr5IeWgNjtG9gNOxSjwXvq+qldEjqRqznr93zlJNe8Qi5d5o6UyM8hTggfnv6LJHObO3t3N
	saCctKOP36ti4TWBwJYSoOw022fGqMI0eii7ioUhFAfMVIie7xiNcWTk2o09JxsG6KF7m8vMOcWLq
	MgssrUqMJTS4dV5etqjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcAjn-000MYo-2S;
	Fri, 01 Sep 2023 20:27:27 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qcAjj-000MYd-0W;
	Fri, 01 Sep 2023 20:27:23 +0000
Message-ID: <c9da6ffe-7a58-1efa-f625-41d73346d6a2@infradead.org>
Date: Fri, 1 Sep 2023 13:27:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] riscv: Kconfig.errata: Add dependency for RISCV_SBI in
 ERRATA_ANDES config
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-riscv <linux-riscv@lists.infradead.org>
Cc: linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 kernel test robot <lkp@intel.com>
References: <20230901110320.312674-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230901110320.312674-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On 9/1/23 04:03, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Andes errata uses sbi_ecalll() which is only available if RISCV_SBI is
> enabled. So add an dependency for RISCV_SBI in ERRATA_ANDES config to
> avoid any build failures.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308311610.ec6bm2G8-lkp@intel.com/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/Kconfig.errata | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index bee5d838763b..566bcefeab50 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -2,7 +2,7 @@ menu "CPU errata selection"
>  
>  config ERRATA_ANDES
>  	bool "Andes AX45MP errata"
> -	depends on RISCV_ALTERNATIVE
> +	depends on RISCV_ALTERNATIVE && RISCV_SBI
>  	help
>  	  All Andes errata Kconfig depend on this Kconfig. Disabling
>  	  this Kconfig will disable all Andes errata. Please say "Y"


I'm still seeing build warnings/errors after applying all 3 RISC-V
Kconfig patches from today (2023 SEP 01).

WARNING: unmet direct dependencies detected for ERRATA_ANDES
  Depends on [n]: RISCV_ALTERNATIVE [=y] && RISCV_SBI [=n]
  Selected by [y]:
  - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]

../arch/riscv/errata/andes/errata.c: In function 'ax45mp_iocp_sw_workaround':
../arch/riscv/errata/andes/errata.c:29:23: error: storage size of 'ret' isn't known
   29 |         struct sbiret ret;
      |                       ^~~
../arch/riscv/errata/andes/errata.c:35:15: error: implicit declaration of function 'sbi_ecall' [-Werror=implicit-function-declaration]
   35 |         ret = sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
      |               ^~~~~~~~~
../arch/riscv/errata/andes/errata.c:29:23: warning: unused variable 'ret' [-Wunused-variable]
   29 |         struct sbiret ret;
      |                       ^~~

ARCH_R9A07G043 in drivers/soc/renesas/Kconfig selects ERRATA_ANDES and
ERRATA_ANDES_CMO even though RISCV_SBI is not set/enabled.

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
