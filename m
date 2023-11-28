Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D8EC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 04:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ORXPNIWKNpYglHOEuQqvmQXqxM2d9C0wUf7R0smVAZQ=; b=jhJWW2C1XnXNn0
	pLIC3+NTORYjh+DIOAI2fW08HNAvrzQN6Oic/6u81rCrlPRuTXiYX8jt6f2rdfF5aB8PRdH7Dt1Bb
	QH5bclEhvD1nSbjJWlxqE5HbYAdz646KHl3NVi3wxvQ/skWZ1q5Sn0ITr0M6FLUL/qcNsNzDb1fMY
	91AH3mhrTmGg56fSuOqrsPafHgKjAZ0x0KSVjokP8lFJdKdCF3MlmNZs/3UEzGWskXLdlmAcvNJoX
	l9vciG8+q0uG81KTpwEX2SqYlQJ16yeCPhpD6fmjPHoxVsnZ8JOpihc0K6Dd3ooG+CXWw1cZRc5zt
	gTBLIVMgp7Ma6snR/hyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7peo-0042mx-0I;
	Tue, 28 Nov 2023 04:25:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7pem-0042mF-0N
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 04:25:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5D410CE11BD;
	Tue, 28 Nov 2023 04:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FF1C433C8;
	Tue, 28 Nov 2023 04:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701145505;
	bh=393VLQEt4vyW6mXZn3SVeUaSptJZ9Z0HCv/6wrn7U2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgG2OmKRc5L3umGA0uU9/vhqiiWipuXcQGdSaRnR+puCrVVUEC51wtFrssi0XAK9W
	 1bRAhEun1WNkQ9xm5nTJ15vVcrcE1e5qh9blYfTrGiIeScvg5jU6TuNUjnv63Zx1Uv
	 rncPG5OqHI3hvL1nT+mJGiMpH79zyAl7PSgjPX3qBzVEKXBksyk0jYPOnaKObP7gwF
	 oPeauCSQYZqFW27/49jwsSwjqgvhnpRd+vPDCjHHW12QkU3zJF+fFSkSCkpbRYZUR0
	 aAjx54Ryy27Fmniq9u9DBrDyUFTa7R+Dpv72zMv/0XnbR/zZCJuUGBtu53m5LaR8/W
	 pYHN2UlnN+/dA==
Date: Mon, 27 Nov 2023 20:25:03 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, ardb@kernel.org, heiko@sntech.de,
	phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 13/13] RISC-V: crypto: add Zvkb accelerated ChaCha20
 implementation
Message-ID: <20231128042503.GL1463@sol.localdomain>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-14-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127070703.1697-14-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_202508_345730_9E208EFE 
X-CRM114-Status: GOOD (  11.75  )
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

On Mon, Nov 27, 2023 at 03:07:03PM +0800, Jerry Shih wrote:
> +config CRYPTO_CHACHA20_RISCV64

Can you call this kconfig option just CRYPTO_CHACHA_RISCV64?  I.e. drop the
"20".  The ChaCha family of ciphers includes more than just ChaCha20.

The other architectures do use "CHACHA20" in their equivalent option, even when
they implement XChaCha12 too.  But that's for historical reasons -- we didn't
want to break anything by renaming the kconfig options.  For a new option we
should use the more general name from the beginning, even if initially only
ChaCha20 is implemented (which is fine).

> +static int chacha20_encrypt(struct skcipher_request *req)

riscv64_chacha_crypt(), please.  chacha20_encrypt() is dangerously close to
being the same name as chacha20_crypt() which already exists in crypto/chacha.h.

> +static inline bool check_chacha20_ext(void)
> +{
> +	return riscv_isa_extension_available(NULL, ZVKB) &&
> +	       riscv_vector_vlen() >= 128;
> +}

Just to double check: your intent is to simply require VLEN >= 128 for all the
RISC-V vector crypto code, even when some might work with a shorter VLEN?  I
don't see anything in chacha-riscv64-zvkb.pl that assumes VLEN >= 128, for
example.  I think it would even work with VLEN == 32.

I think requiring VLEN >= 128 anyway makes sense so that we don't have to worry
about validating the code with shorter VLEN.  And "application processors" are
supposed to have VLEN >= 128.  But I just wanted to make sure this is what you
intended too.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
