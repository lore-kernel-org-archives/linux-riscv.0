Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CFFC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 17:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Ak39ekGT809tMaNeXPQo/aHNYpeqy+SmvrWM7bwX9I=; b=SEddvkyaalpI2a
	QYU9PSleMPSmntam8vPje6lFa/MRhFWCujDoGcksu4c5IFVfiOpeaggH3tII0TdBwj2e3BoaNbLQT
	2wXHYqW0KUyvd0r7x+Vt5tbV9dgvPwnBlk+t0gxzmWhZdS/hAgb33hOkMchV0uvZWul7otHY9BKuL
	AyF+D9hZrAZeVC+Vltq3J3/1PpiHC5QCtnSysaxuPeN40Wkuk8BQXBtEDdhPfpmgisL6Xcz0tzdge
	c/y5FoIhy+e/uvQGdLZtJ/Xxm6vFvuVohB2WGgdS5yngAbqPTzPPukz8/R4dJKqNlfMbCU+wXFqnQ
	WL5MmF+tpWMV25eBRNuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvGL-00Apt1-1W;
	Wed, 06 Dec 2023 17:00:41 +0000
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvGJ-00Apsm-1J;
	Wed, 06 Dec 2023 17:00:40 +0000
Message-ID: <7b27e5db-16b8-400e-a94b-a36f65205654@infradead.org>
Date: Wed, 6 Dec 2023 09:00:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Support rv32 ULEB128 test
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Ron Economos <re@w6rz.net>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231122-module_fixup-v2-1-dfb9565e9ea5@rivosinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231122-module_fixup-v2-1-dfb9565e9ea5@rivosinc.com>
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

On 11/22/23 15:35, Charlie Jenkins wrote:
> Use opcodes available to both rv32 and rv64 in uleb128 module linking
> test.
> 
> Fixes: af71bc194916 ("riscv: Add tests for riscv module loading")
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/lkml/1d7c71ee-5742-4df4-b8ef-a2aea0a624eb@infradead.org/
> Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> ---
> Support module linking tests on rv32 toolchains with uleb128 support.

I'm still seeing build errors on this test module.

Can someone get this patch merged, please?

Thanks.

> ---
> Changes in v2:
> - Drop patch covered in different series
> - Link to v1: https://lore.kernel.org/r/20231117-module_fixup-v1-0-62bb777f6825@rivosinc.com
> ---
>  arch/riscv/kernel/tests/module_test/test_uleb128.S | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kernel/tests/module_test/test_uleb128.S b/arch/riscv/kernel/tests/module_test/test_uleb128.S
> index 90f22049d553..8515ed7cd8c1 100644
> --- a/arch/riscv/kernel/tests/module_test/test_uleb128.S
> +++ b/arch/riscv/kernel/tests/module_test/test_uleb128.S
> @@ -6,13 +6,13 @@
>  .text
>  .global test_uleb_basic
>  test_uleb_basic:
> -	ld	a0, second
> +	lw	a0, second
>  	addi	a0, a0, -127
>  	ret
>  
>  .global test_uleb_large
>  test_uleb_large:
> -	ld	a0, fourth
> +	lw	a0, fourth
>  	addi	a0, a0, -0x07e8
>  	ret
>  
> @@ -22,10 +22,10 @@ first:
>  second:
>  	.reloc second, R_RISCV_SET_ULEB128, second
>  	.reloc second, R_RISCV_SUB_ULEB128, first
> -	.dword 0
> +	.word 0
>  third:
>  	.space 1000
>  fourth:
>  	.reloc fourth, R_RISCV_SET_ULEB128, fourth
>  	.reloc fourth, R_RISCV_SUB_ULEB128, third
> -	.dword 0
> +	.word 0
> 
> ---
> base-commit: 9bacdd8996c77c42ca004440be610692275ff9d0
> change-id: 20231117-module_fixup-699787d9c567

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
