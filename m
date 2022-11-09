Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BE1C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 00:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zia740NWhmO5Ij1qGZqRWRpbZ154Zmw4lenCkGoMT/E=; b=IYh4ZWJjKYTBg+
	hpx9jCplJJ3QxIV+DT2eUy2ai/wfpGd8MpOAUM5k4DnEHPG/1SY/vf0B4w1U51013eTk5uWQqwx7f
	2bUai6huRZ0SIm9HjaAOfJEBudiWVAx0c8djjCvoVC9ll4ktcrdits0VvsCimvzti07g/6mI/aTG9
	enii3bEMaRmyjpKH7CDeh5BIijKlJluzKdNjNcpGgLDXbrmSn2yp7kbwo5W0NOQs3AVo7lh1fQGn4
	qU8aWsDD1opCQSt/1S/dv60Tok8RVqaHiZyFqCSHOHV9ZVod0K2DXpbgyd68QIQjvk0S3sbRTGLYy
	9XurJdvfCp+syyug8xvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osYYX-009N9Z-PE; Wed, 09 Nov 2022 00:03:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osYYV-009N9D-IZ
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 00:03:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 23BC9B81CAE;
	Wed,  9 Nov 2022 00:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178D0C433C1;
	Wed,  9 Nov 2022 00:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667952176;
	bh=1XAvvGmXAV0rKXk7VUNfUl0vYbJHJkoGa9C/F5unFa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B3RdZhRrtNmHZcJkbbQXYCwwKtvFCVjp+chtgcH50CK2NK+PAMBGwg4mfU7/edKXo
	 D4jAFh+f8uqDE6dm7QZ+IkkgaNnoSSt5rfsBVoyak8wPgEhTxviwNArwr+2CuGO+x4
	 TmO1bkgQGKIqV+qr3FOy8V1cfF3riga6jcgXdXDTpWwGDxLjHWuQqRQVLH3/w/kMFp
	 H7UQwVc7Na0O+6Wkgz9T2a29TgLl1h5IAlCaUeWpTUE2rcSGQiMaKT5oV3M6/TPLF6
	 QgVodkuMy2LIuMxhGg7CD3VN/GOWQjRhn4ZtaB+w7RS4R7FNl5xeJh3ueyddm3js7A
	 CFJpkjXLIBTDg==
Date: Wed, 9 Nov 2022 00:02:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH] RISC-V: vdso: Do not add missing symbols to version
 section in linker script
Message-ID: <Y2ruLKgi2D05YYfy@spud>
References: <20221108171324.3377226-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221108171324.3377226-1-nathan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_160259_940615_777765BB 
X-CRM114-Status: GOOD (  17.63  )
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

On Tue, Nov 08, 2022 at 10:13:23AM -0700, Nathan Chancellor wrote:
> Recently, ld.lld moved from '--undefined-version' to
> '--no-undefined-version' as the default, which breaks the compat vDSO
> build:
> 
>   ld.lld: error: version script assignment of 'LINUX_4.15' to symbol '__vdso_gettimeofday' failed: symbol not defined
>   ld.lld: error: version script assignment of 'LINUX_4.15' to symbol '__vdso_clock_gettime' failed: symbol not defined
>   ld.lld: error: version script assignment of 'LINUX_4.15' to symbol '__vdso_clock_getres' failed: symbol not defined
> 
> These symbols are not present in the compat vDSO or the regular vDSO for
> 32-bit but they are unconditionally included in the version section of
> the linker script, which is prohibited with '--no-undefined-version'.
> 
> Fix this issue by only including the symbols that are actually exported
> in the version section of the linker script.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1756

Fixed the build for me on 99fe3d266108 ("[mlir][sparse] 3-dimensional
sparse tensor insertion test")

Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/riscv/kernel/vdso/Makefile   | 3 +++
>  arch/riscv/kernel/vdso/vdso.lds.S | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index f2e065671e4d..82416ebf4cca 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -28,6 +28,9 @@ obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
>  
>  obj-y += vdso.o
>  CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
> +ifneq ($(filter vgettimeofday, $(vdso-syms)),)
> +CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
> +endif
>  
>  # Disable -pg to prevent insert call site
>  CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> index 01d94aae5bf5..150b1a572e61 100644
> --- a/arch/riscv/kernel/vdso/vdso.lds.S
> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> @@ -68,9 +68,11 @@ VERSION
>  	LINUX_4.15 {
>  	global:
>  		__vdso_rt_sigreturn;
> +#ifdef HAS_VGETTIMEOFDAY
>  		__vdso_gettimeofday;
>  		__vdso_clock_gettime;
>  		__vdso_clock_getres;
> +#endif
>  		__vdso_getcpu;
>  		__vdso_flush_icache;
>  	local: *;
> 
> base-commit: f0c4d9fc9cc9462659728d168387191387e903cc
> -- 
> 2.38.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
