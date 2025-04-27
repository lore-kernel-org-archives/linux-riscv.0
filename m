Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060CAC369AB
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Apr 2025 05:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sANBzy7ne32hzpjwa3UM25MUf7XT/K8u8XVH69itFIM=; b=CRdlA/MMYRuw0Q
	Z5fuXMmzTogIHxA7gP2mdp7STLhrU1Cg6v9luVaOxXsJnpgOhq/xPZnKEwxszu0coGOcnYY2t2hQr
	DGnU3jLUCOyEFb1LG4tmGgMEqb5JRNxq1vDjdoTST9eAcNX4meEL8BpHuez0jnQbhETp9H3KG+1kr
	68CnHfL3R/2pp0wKdQGFUv6AiD7vE34GwEDGMKzho1ytY5B7zk/c8p6Geso0HCtOikpjwe5LyVYZc
	jiMb3hlyuECImSeRFPrr4JzndmuKoGQ1vOMgaH5rwE++J1hhixXUlYGwS8lAzzH0STEBUL09JJQ0A
	cEabsJR7iOrSLHFhhT3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8uU6-00000002urU-0jhQ;
	Sun, 27 Apr 2025 05:23:22 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8uS8-00000002ufL-1wb4;
	Sun, 27 Apr 2025 05:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Pl2+iJoLEKyoEY1+QMbzNQxE4vs1/OpqeGo2MbFswoc=; b=dGnaoUBgwG+MFM/UgCXPevwWE5
	1SBPXmQTDAAc/9iOYOSD/BlyZtCEk3qq8qm0xiPTxGOsP0Dv0Cw7NIlflY5pITkraHSwdkFx7tBEu
	kNOVMTuERLnZjhJ97P/WUb5iDMqM7BFVuNjR2p1i8CPh29AUn0QzldJUQHx63UY9Gtj4dZFw+4J60
	7EAM3fs081VqfaaOkty5cnDU3lpHYiWRncdhaPEG3RRHmegrSfjx8TOlUtTKeao0saw22Kz+s2kbK
	iDNll0edL8bDHDIHJMTq0JiEhdzcGql3p4Was7EPbmHmk5EEwlBqueiaFepnGV2nfCTSxBFlxEi4C
	UTWU99PQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8uRz-001KyE-1U;
	Sun, 27 Apr 2025 13:21:12 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 13:21:11 +0800
Date: Sun, 27 Apr 2025 13:21:11 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 11/13] crypto: x86/sha256 - implement library instead of
 shash
Message-ID: <aA2-x-grUfoulkDf@gondor.apana.org.au>
References: <20250426065041.1551914-1-ebiggers@kernel.org>
 <20250426065041.1551914-12-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250426065041.1551914-12-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_222120_504138_461FB97F 
X-CRM114-Status: UNSURE (   8.81  )
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

On Fri, Apr 25, 2025 at 11:50:37PM -0700, Eric Biggers wrote:
>
> +void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
> +			const u8 *data, size_t nblocks)
> +{
> +	if (static_branch_likely(&have_sha256_x86) && crypto_simd_usable()) {
> +		kernel_fpu_begin();
> +		static_call(sha256_blocks_x86)(state, data, nblocks);
> +		kernel_fpu_end();
> +	} else {
> +		sha256_blocks_generic(state, data, nblocks);
> +	}
> +}
> +EXPORT_SYMBOL(sha256_blocks_arch);

Because of the back-reference to sha256_blocks_generic, I get
this with a fully modular build:

depmod: ERROR: Cycle detected: libsha256 -> sha256_x86_64 -> libsha256
depmod: ERROR: Found 2 modules in dependency cycles!

I'm going to split libsha256 up into the block function and the
lib API.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
