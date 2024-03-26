Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392F1C54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 19:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/TYk2NnLZXgEt0Qq9oq0T/2kgWVpdv79R/DJJTiwpk=; b=RD7ok/l5hDdpTd
	JN6vOKTzrAN+z+beH7uJzxZAxO7iFObupNdxUj2zPMHl1xArfPj7V9WozX6G7CE8/nZyBvSwWToVc
	IufvweUpPL3egO2fbYgtSo0K1ummmuNkkORDBCkqtZZIxPsdTRebNyJ3GHOGTUs1g2AnYCOWZW0IT
	LPPAO3iOpTRxWewmWV2/veb5UDqiwGwUlH3c/0wqcxCamAn3UPQ1wKbvM42Vo8CB8/nF4CZXf4I5n
	hZmpn+VaUyI3xCsl/zhN9oQ4dJYosXBki/i1Rco2ZlzDCH4FYiUpV4TUwGZpduldzK5zryB8ak+FZ
	zZ/9rxRTohRll0weEXtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpCqO-00000006DCN-097e;
	Tue, 26 Mar 2024 19:52:24 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpCqL-00000006DAa-1cDm
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 19:52:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58212240005;
	Tue, 26 Mar 2024 19:52:15 +0000 (UTC)
Message-ID: <13eb7c38-68da-4635-a713-5791d5294df2@ghiti.fr>
Date: Tue, 26 Mar 2024 20:52:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: merge two if-blocks for KBUILD_IMAGE
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20240323113500.1249272-1-masahiroy@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240323113500.1249272-1-masahiroy@kernel.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_125221_814984_3EFB2BD6 
X-CRM114-Status: GOOD (  11.34  )
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

On 23/03/2024 12:35, Masahiro Yamada wrote:
> In arch/riscv/Makefile, KBUILD_IMAGE is assigned in two separate
> if-blocks.
>
> When CONFIG_XIP_KERNEL is disabled, the decision made by the first
> if-block is overwritten by the second one, which is redundant and
> unreadable.
>
> Merge the two if-blocks.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>   arch/riscv/Makefile | 19 ++++++++-----------
>   1 file changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 252d63942f34..a74e70405d3f 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -133,7 +133,15 @@ boot		:= arch/riscv/boot
>   ifeq ($(CONFIG_XIP_KERNEL),y)
>   KBUILD_IMAGE := $(boot)/xipImage
>   else
> +ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAAN),yy)
> +KBUILD_IMAGE := $(boot)/loader.bin
> +else
> +ifeq ($(CONFIG_EFI_ZBOOT),)
>   KBUILD_IMAGE	:= $(boot)/Image.gz
> +else
> +KBUILD_IMAGE := $(boot)/vmlinuz.efi
> +endif
> +endif
>   endif
>   
>   libs-y += arch/riscv/lib/
> @@ -153,17 +161,6 @@ endif
>   vdso-install-y			+= arch/riscv/kernel/vdso/vdso.so.dbg
>   vdso-install-$(CONFIG_COMPAT)	+= arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg:../compat_vdso/compat_vdso.so
>   
> -ifneq ($(CONFIG_XIP_KERNEL),y)
> -ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAAN),yy)
> -KBUILD_IMAGE := $(boot)/loader.bin
> -else
> -ifeq ($(CONFIG_EFI_ZBOOT),)
> -KBUILD_IMAGE := $(boot)/Image.gz
> -else
> -KBUILD_IMAGE := $(boot)/vmlinuz.efi
> -endif
> -endif
> -endif
>   BOOT_TARGETS := Image Image.gz loader loader.bin xipImage vmlinuz.efi
>   
>   all:	$(notdir $(KBUILD_IMAGE))


You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
