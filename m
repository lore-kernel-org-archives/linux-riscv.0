Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862B0C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgAqeEh9ABhGl8o2a4EJEGe+pRTiHm5a4jfy30zEZgs=; b=wgU3AF3+opLZsf
	jSivUwjnxI/OvBFd5m97BhlYlD2gjLg4kMHxh+QvNr1FQ++ec/VaY03qVOXW7eImceZx2U65m/0GM
	aVzalXTYAcGlS6Vozcn7z9WEAEivKLbK6xTfcDJVh3OkutFw5UgqlsRJnyqN+iTn69P0SDyNWNqHM
	oovFyrtFrFhSXTc+mwSPrS8NWJ5QQBja+n6oLJVyldg4LN+Dq7wol/fJ2q8u8UQALcdayowKowr/T
	rTQzqd8UXu8rZC4NkbYae7pnO8usHfQCbYIMox5jGznfNgGt0OR2cb1viiJ7UwYiybkUmcLzjBUnY
	hOlaR6wrRTSVr23eJWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL2a7-00BAtI-27;
	Wed, 03 Jan 2024 14:50:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL2a4-00BAsr-1M
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 14:50:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 472ED6132D;
	Wed,  3 Jan 2024 14:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BBCCC433C7;
	Wed,  3 Jan 2024 14:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704293448;
	bh=8ypxHIMeE1M2ORBhy1nGrxQtUOicK9rqmadKgZ02QBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IcgMEXFmchMYoWnvwQcWeMVlkOuMuAA1zW/pvPvPlq0PDKwJZVFOEuWVAJ7HlvpPb
	 3IibPUNyGwDJz5u3AoRuXR+nVrfP/8SaBxiwe6yhN8DxaKY/oylM4mOmMn8c/bA8/z
	 ymgBmqj2ylYj0NViC28iJjeZZe0LbqK9OnQL270KmIq8i/QKY1Dfg0V875JHbz3pdO
	 2k14DsNYPqZQuwcb7zk3CdilniEL7cuDXQmp/rOaU6AUcA2ynQTt597YTxm6hsvK+y
	 HPQMuZEEezbOd5ESA2U2OzQCi/YJatBf01QfWH2LH6txOVxOrGOnJ3gBqNmS0/gP8Q
	 Y464pVq4qVs6Q==
Date: Wed, 3 Jan 2024 08:50:43 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	Jerry Shih <jerry.shih@sifive.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Phoebe Chen <phoebe.chen@sifive.com>, hongrong.hsu@sifive.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [RFC PATCH 07/13] crypto: riscv - add vector crypto accelerated
 AES-{ECB,CBC,CTR,XTS}
Message-ID: <20240103145043.GB773@quark.localdomain>
References: <20240102064743.220490-1-ebiggers@kernel.org>
 <20240102064743.220490-8-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102064743.220490-8-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_065052_508583_B1D61BCF 
X-CRM114-Status: GOOD (  12.58  )
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

On Tue, Jan 02, 2024 at 12:47:33AM -0600, Eric Biggers wrote:
> diff --git a/arch/riscv/crypto/Makefile b/arch/riscv/crypto/Makefile
> index dca698c5cba3e..5dd91f34f0d52 100644
> --- a/arch/riscv/crypto/Makefile
> +++ b/arch/riscv/crypto/Makefile
> @@ -1,7 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>  # linux/arch/riscv/crypto/Makefile
>  #
>  
>  obj-$(CONFIG_CRYPTO_AES_RISCV64) += aes-riscv64.o
>  aes-riscv64-y := aes-riscv64-glue.o aes-riscv64-zvkned.o
> +
> +obj-$(CONFIG_CRYPTO_AES_BLOCK_RISCV64) += aes-block-riscv64.o
> +aes-block-riscv64-y := aes-riscv64-block-mode-glue.o aes-riscv64-zvkned-zvbb-zvkg.o aes-riscv64-zvkned-zvkb.o

A bug I noticed (which is also present in Jerry's patchset) is that some of the
code of the aes-block-riscv64 module is located in aes-riscv64-zvkned.S, which
isn't built into that module but rather into aes-riscv64.  This causes a build
error when both CONFIG_CRYPTO_AES_RISCV64 and CONFIG_CRYPTO_AES_BLOCK_RISCV64
are set to 'm':

    ERROR: modpost: "aes_cbc_decrypt_zvkned" [arch/riscv/crypto/aes-block-riscv64.ko] undefined!
    ERROR: modpost: "aes_ecb_decrypt_zvkned" [arch/riscv/crypto/aes-block-riscv64.ko] undefined!
    ERROR: modpost: "aes_cbc_encrypt_zvkned" [arch/riscv/crypto/aes-block-riscv64.ko] undefined!
    ERROR: modpost: "aes_ecb_encrypt_zvkned" [arch/riscv/crypto/aes-block-riscv64.ko] undefined!

To fix this, I think we should just merge the two modules and kconfig options
together so that there is one module that provides both the AES modes and the
AES single-block cipher.  That's how x86's aesni-intel works, for example.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
