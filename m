Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3E7C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 05:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8AQ9u4uZHeLmUc7Q+g/hAe2UlkABT25mPt/+nw3LYo=; b=Q5mdesOmzFf6nt
	l7h5lXfn/N3PWt45cfXVcjQBLU/Wuiou+l/XFnhQfKhdS0LLJXSh/83/ChEz1CmHcE81VquL5gDoB
	YG/Bju++P+9/ajmZ212xhDtu6BxGyJOvvIBlNrR177kLobhYM4p7vx85eBwGSWDqC3mjJZyceB3pf
	cLfVVp9iJoNmG8K7qpGei8Tj0lASup05yf9b1NlyBCjkUeDYvNrXuVNraGJVXKo6/A3BA1AoWQxKD
	9WouhRAEZMdbpP0DjJPH/Ao5uo0iLgX+1mV3+p6GhMLC8xcScAGWWXUv7ZNU2GU8JfSaQYBAXiIGb
	z+VceezOvlcbfXW5Pw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyQjH-008n4f-34;
	Thu, 02 Nov 2023 05:58:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyQjE-008n4F-1Z
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 05:58:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D1058B81B99;
	Thu,  2 Nov 2023 05:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3A4C433C8;
	Thu,  2 Nov 2023 05:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698904730;
	bh=oUrhkOmCghkLFx1zd+9/LkzSpQOub+y8mn4lj0eMIsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FoO7W5dP6rK5/nNsWQFdXanVXH0kpgIwBmFQhcebu/94h+pw+Df88gFyVNHm2/6kt
	 HCTKBZ+WN1QLpNa+TEpa8ELkFvYXXy5u8EJC6zSVau1NdLGyxgFMlWZpHm3VBMok0p
	 zcN2YsbEjYzTG92e9c7NC85r3m6Yc8MFaDQ0zQBcTWXIgmWnnkXiNYftONEjIVMU0Y
	 3wSys/hs8+bKMAgixXJuMsVQAoZyHFG37YJs9tYMKQJhhDUaZR3N7mENY90whleBkm
	 Fr7nnqJUTeYlso7zBFSVjz6/0bMj1M6CFYNFugI9M70COlsuq/IGq1/YexkDhNYPqn
	 DcLq41GcY+EEw==
Date: Wed, 1 Nov 2023 22:58:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andy.chiu@sifive.com, greentime.hu@sifive.com,
	conor.dooley@microchip.com, guoren@kernel.org, bjorn@rivosinc.com,
	heiko@sntech.de, ardb@kernel.org, phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 10/12] RISC-V: crypto: add Zvksed accelerated SM4
 implementation
Message-ID: <20231102055848.GI1498@sol.localdomain>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-11-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025183644.8735-11-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_225852_700661_6D26BFB0 
X-CRM114-Status: UNSURE (   6.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 26, 2023 at 02:36:42AM +0800, Jerry Shih wrote:
> +struct crypto_alg riscv64_sm4_zvksed_alg = {
> +	.cra_name = "sm4",
> +	.cra_driver_name = "sm4-riscv64-zvkb-zvksed",
> +	.cra_module = THIS_MODULE,
> +	.cra_priority = 300,
> +	.cra_flags = CRYPTO_ALG_TYPE_CIPHER,
> +	.cra_blocksize = SM4_BLOCK_SIZE,
> +	.cra_ctxsize = sizeof(struct sm4_ctx),
> +	.cra_cipher = {
> +		.cia_min_keysize = SM4_KEY_SIZE,
> +		.cia_max_keysize = SM4_KEY_SIZE,
> +		.cia_setkey = riscv64_sm4_setkey_zvksed,
> +		.cia_encrypt = riscv64_sm4_encrypt_zvksed,
> +		.cia_decrypt = riscv64_sm4_decrypt_zvksed,
> +	},
> +};

This should be 'static'.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
