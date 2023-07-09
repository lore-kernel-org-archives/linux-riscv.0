Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C40DEB64DC
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8hmBRGztDryoeNfMVtKVYLi8ylunQ3bBKkRxLvjoVc=; b=AZUfTFINjxMJdl
	sNHl6ugJzDF4aulK5eSD3CmK+qL/mEG/tNSa7DiySMMkuN1mUkttNP/3VH8QNsDicC7Hn4jl+GRhv
	hy0vgh+YexnUF2UpRP+PDWXetihCz+u+meVR5Tb7mTu4lceIFJKwpGRNVSHaMKxSnj6aa7sp4Z5Yz
	ldjh/7GuJLjNCcvfNARwBeWvTEI22zRqEQP6pFKjFpSb1bEXUcCiCrixGoDF0Qc6okNEyxFBUmENv
	tg7l8fCcUcVQgLU6bPnTPQYDfvqE2qi8rQTNbstbrW9WW0uKLWckpZCzIoZxAsiGDwgDcTiSwWHMW
	XHNMYoqhfES2rfUr+HfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIV3P-009DI0-0i;
	Sun, 09 Jul 2023 14:06:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIV3L-009DHO-2e
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 14:06:21 +0000
Received: from i53875a50.versanet.de ([83.135.90.80] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko.stuebner@vrull.eu>)
	id 1qIV3J-0002bh-B1; Sun, 09 Jul 2023 16:06:17 +0200
From: Heiko Stuebner <heiko.stuebner@vrull.eu>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: Samuel Ortiz <sameo@rivosinc.com>, linux@rivosinc.com,
 Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>,
 linux-kernel@vger.kernel.org, "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Guo Ren <guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
 Evan Green <evan@rivosinc.com>, devicetree@vger.kernel.org,
 Samuel Ortiz <sameo@rivosinc.com>
Subject: Re: [PATCH v3 4/4] RISC-V: Implement archrandom when Zkr is available
Date: Sun, 09 Jul 2023 16:06:16 +0200
Message-ID: <3566075.R56niFO833@phil>
In-Reply-To: <20230709115549.2666557-5-sameo@rivosinc.com>
References: <20230709115549.2666557-1-sameo@rivosinc.com>
 <20230709115549.2666557-5-sameo@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_070619_875554_43B8DAA6 
X-CRM114-Status: GOOD (  13.62  )
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

Am Sonntag, 9. Juli 2023, 13:55:46 CEST schrieb Samuel Ortiz:
> The Zkr extension is ratified and provides 16 bits of entropy seed when
> reading the SEED CSR.
> 
> We can implement arch_get_random_seed_longs() by doing multiple csrrw to
> that CSR and filling an unsigned long with valid entropy bits.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
> ---

> +static inline size_t __must_check arch_get_random_seed_longs(unsigned long *v, size_t max_longs)
> +{
> +	if (!max_longs)
> +		return 0;
> +
> +	/*
> +	 * If Zkr is supported and csr_seed_long succeeds, we return one long
> +	 * worth of entropy.
> +	 */
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZKR) && csr_seed_long(v))

While this whole thing looks really nice, I don't think you can only
check the ZKR existence though.

To access the seed csr from supervisor-mode, it looks like the SSEED
bit in the mseccfg register also needs to be set by firmware.
And in the kernel we will likely need to check this setting somehow
before enabling access.

At least my qemu fails with an illegal instruction otherwise during the
early random seed initialization.


Heiko




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
