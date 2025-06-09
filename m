Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD79C5B552
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 20:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZN01wHTV6nv0B/Hf6qHJMF9Xn+nIEjB6KuprRCjuTAo=; b=T9cRhIQkqSVB8x
	Xl/zV3qgo3eseoVo6wxAk0oJzwLHV2OPjWG5dRQqZWh4LOHvTVY/xu1Kk1enPB2CL0pT1iWpK/Aup
	e2DZTdpN6U42wCuL2ffVAelSpfiGUdIz314XQjvqKMNCW0UU60hLQySRkFW6P3V4Ucalx0yFFWMGV
	LCCnh1Jh/jECzm6Cwj0JGf6jbciSgTBtii5o/YdJ/2hr48MfVU1YferZ90Ra4daBn+jd3km4FFyCN
	vuOzKZZNtsiIziQRNBGFM9YJKrOgRK+Vfuf5Opb5xvojdsArw9ZfS52gxhVV+HtXD5xUzkJFWsmSC
	jZPcSmNFLIh88lyqVEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOis6-000000058UL-0qpa;
	Mon, 09 Jun 2025 20:13:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOis5-000000058U3-2qF3
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 20:13:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0656629E3;
	Mon,  9 Jun 2025 20:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36FE1C4CEEF;
	Mon,  9 Jun 2025 20:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749500008;
	bh=Us2N/NCViJOTrbWcEGQmIkQWyzzEmf6mDW8hu15e8a8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBHudaaA4FyOfGmwQqHtLG8mku9PBc/04nNV5565X0ECQOc6/j3+GtYTm0h5ay5r8
	 4jAHuJe0gk/ISOvQXzdHK/jxbyUkzJ8dOr9b5k7LiNtc4RSSP2HrkgZf4yvoUUxn4L
	 ksBPGzIjOGhje3qjTKwjtnzFK33r8FWf1Z45ze9VrZpVko2E95tCO7qUg1FVhx9vZR
	 CWvd8/sMzP5CXS1csIjR5bSlBvPkaPlbWF1H7KJ8kWstmlVGoUAtVvTj6nvmMEr0nF
	 IZSK9K5i7ejbuKqzyeNXcGa/QBE6hUr1ApP/gqGNdGYgbeqb32OIkHjASCSMYebRas
	 Ns84xPQ5yqd6A==
Date: Mon, 9 Jun 2025 13:13:06 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Zhihang Shao <zhihang.shao.iscas@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	herbert@gondor.apana.org.au, paul.walmsley@sifive.com,
	alex@ghiti.fr, appro@cryptogams.org, zhang.lyra@gmail.com
Subject: Re: [PATCH v3] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
Message-ID: <20250609201306.GD1255@sol>
References: <20250609074655.203572-3-zhihang.shao.iscas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250609074655.203572-3-zhihang.shao.iscas@gmail.com>
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

On Mon, Jun 09, 2025 at 03:46:57PM +0800, Zhihang Shao wrote:
> From: Zhihang Shao <zhihang.shao.iscas@gmail.com>
> 
> This is a straight import of the OpenSSL/CRYPTOGAMS Poly1305
> implementation for riscv authored by Andy Polyakov.
> The file 'poly1305-riscv.pl' is taken straight from this upstream
> GitHub repository [0] at commit 33fe84bc21219a16825459b37c825bf4580a0a7b,
> and this commit fixed a bug in riscv 64bit implementation.
> 
> [0] https://github.com/dot-asm/cryptogams

There are a couple minor differences between the CRYPTOGAMS file and the one in
this patch.  Please make sure those are documented.

> +config CRYPTO_POLY1305_RISCV
> +	tristate
> +	default CRYPTO_LIB_POLY1305
> +    select CRYPTO_ARCH_HAVE_LIB_POLY1305

Fix the indentation here.

> +void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
> +			  unsigned int len, u32 padbit)
> +{
> +	len = round_down(len, POLY1305_BLOCK_SIZE);
> +	poly1305_blocks(state, src, len, 1);
> +}
> +EXPORT_SYMBOL_GPL(poly1305_blocks_arch);

This is ignoring the padbit and forcing it to 1, so this will compute the wrong
Poly1305 value for messages with length not a multiple of 16 bytes.

chacha20poly1305-selftest still passes, so it must not test this case.  We need
to add a self-test for Poly1305 directly, ideally using KUnit.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
