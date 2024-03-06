Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDB7C5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 20:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z26gz3u3/WKlvELKqGE5lZvPn+wF4i5CxeZAVFaZ6bk=; b=4Xz5TswF8leyq/
	5GdNTpG4HKv1g0sozyIL7SB74/WRiXZ3XqUaNWkDEPlCbWiJ5qhfaSeStM4TNvcWFg5mRGoAQ7dOk
	LzoHXowu/JHzzkS+sg8uDNK9+FehioqyjL4Ng32j3B2Gga/QG820LCb8IDCX0IP2THBQg67Fg8DxV
	mm/dk039eBUcRqgz+9n3/B945O2WZ73weK3h1QkXXhH/cZ68ZjM8YXfla8Fr+yLIe5B/yKZNehMoF
	gde9wTSSssLa0GlNYUzevfOY9QeybsDKMcdQCdiQ5rho4WsA4tUbZGhlD55X1a6i8zF/RsmaJRgM9
	JI6Y0+UuFTdHUUIt1Cfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhxRe-00000001j29-0NPc;
	Wed, 06 Mar 2024 20:00:54 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhxRb-00000001j0p-2BjD
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 20:00:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9C3620007;
	Wed,  6 Mar 2024 20:00:44 +0000 (UTC)
Message-ID: <048b4cff-9f3e-48aa-8c17-043261888ad5@ghiti.fr>
Date: Wed, 6 Mar 2024 21:00:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: compat_vdso: align VDSOAS build log
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20231117125843.1058553-1-masahiroy@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231117125843.1058553-1-masahiroy@kernel.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_120051_780613_4005B8CC 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

Hi Masahiro,

On 17/11/2023 13:58, Masahiro Yamada wrote:
> Add one more space after "VDSOAS" for better alignment in the build log.
>
> [Before]
>
>    LDS     arch/riscv/kernel/compat_vdso/compat_vdso.lds
>    VDSOAS arch/riscv/kernel/compat_vdso/rt_sigreturn.o
>    VDSOAS arch/riscv/kernel/compat_vdso/getcpu.o
>    VDSOAS arch/riscv/kernel/compat_vdso/flush_icache.o
>    VDSOAS arch/riscv/kernel/compat_vdso/note.o
>    VDSOLD  arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
>    VDSOSYM include/generated/compat_vdso-offsets.h
>
> [After]
>
>    LDS     arch/riscv/kernel/compat_vdso/compat_vdso.lds
>    VDSOAS  arch/riscv/kernel/compat_vdso/rt_sigreturn.o
>    VDSOAS  arch/riscv/kernel/compat_vdso/getcpu.o
>    VDSOAS  arch/riscv/kernel/compat_vdso/flush_icache.o
>    VDSOAS  arch/riscv/kernel/compat_vdso/note.o
>    VDSOLD  arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
>    VDSOSYM include/generated/compat_vdso-offsets.h
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>   arch/riscv/kernel/compat_vdso/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
> index 62fa393b2eb2..3df4cb788c1f 100644
> --- a/arch/riscv/kernel/compat_vdso/Makefile
> +++ b/arch/riscv/kernel/compat_vdso/Makefile
> @@ -74,5 +74,5 @@ quiet_cmd_compat_vdsold = VDSOLD  $@
>                      rm $@.tmp
>   
>   # actual build commands
> -quiet_cmd_compat_vdsoas = VDSOAS $@
> +quiet_cmd_compat_vdsoas = VDSOAS  $@
>         cmd_compat_vdsoas = $(COMPAT_CC) $(a_flags) $(COMPAT_CC_FLAGS) -c -o $@ $<


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
