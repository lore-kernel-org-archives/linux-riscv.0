Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B59C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 20:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQw6XxqSYdi+uIy4AWBEi1xQroSD1Yl+jX6TqdF9P34=; b=z3krLuezcGNDaA
	0PwEa0y2gD1W6hg1XO8M0cgqZ5cK4AUNVrg7kdjrmTyqcvw4B8nBWtcbIRec7ZhiZ9RGXrMb7wm1f
	zmuD8P2cqZtHAU9YJdXeAJ1eA4tNefYdJqp6kqrYw3eW858A6lyeljDCQvo5GAH/5N0igSZtWl9Xw
	UkY7L7ABhhuvJrL33Cema2v6pxuqWbMLAerM8sKS7PWoXgbh7PWwhgVwvi+smI9Ong6Q2+826+Aov
	hh7Qi8S9CRPKgplDmINAodDcWc31chidO+P4qUMJmJoys+uHbXuu4GPUHWvxSc9L5xhsVusROiNT4
	9gW36K4O+uvsGLcyRjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Qyf-009EOp-05;
	Wed, 29 Nov 2023 20:16:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Qyc-009EOR-1A
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 20:16:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DE0F6CE1FE5;
	Wed, 29 Nov 2023 20:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55CCC433CC;
	Wed, 29 Nov 2023 20:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701288963;
	bh=eJQhkQLzUwwUMvhzdNW9MAj6eRgcFa4pmRj/Q9yI5aQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A58xGnKFd8gNAc7MIbjqM3wnqSqhoDtxaRuCpIVWNjwFgXMRCDGM6O7s/U+F7yyFy
	 uFtlTSLv9XqLau5R0N9MPb/ciOx7gW1x9MGpmJazMX1Uc6uKlXrO3RbmCAX5n780PR
	 2eUFCyvP5Gzh8aThoQCLxK17xsQ8ddepch5wHQknLNhxoScaDKqgycFUV+18HhEWdO
	 ol489AUDXcxReKqC385IxnEAJZYsSKqGMRg0QmBKI3IptwV7XtJAvbsmrYxQkRsmD3
	 9y+DxI8Y04LoX9ALLe4ASJVkwTY8rfE0CI5Eap7J80HzqBpHxNXGWkB5u+TQkO4C8p
	 IsiMIOv1l6fsQ==
Date: Wed, 29 Nov 2023 12:16:01 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com,
	Albert Ou <aou@eecs.berkeley.edu>, herbert@gondor.apana.org.au,
	davem@davemloft.net, conor.dooley@microchip.com, ardb@kernel.org,
	heiko@sntech.de, phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 07/13] RISC-V: crypto: add accelerated
 AES-CBC/CTR/ECB/XTS implementations
Message-ID: <20231129201601.GA1174@sol.localdomain>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-8-jerry.shih@sifive.com>
 <20231128040716.GI1463@sol.localdomain>
 <7DFBB20D-B8D4-409B-8562-4C60E67FD279@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7DFBB20D-B8D4-409B-8562-4C60E67FD279@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_121606_788506_41D328CB 
X-CRM114-Status: GOOD (  25.31  )
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

On Wed, Nov 29, 2023 at 03:57:25PM +0800, Jerry Shih wrote:
> On Nov 28, 2023, at 12:07, Eric Biggers <ebiggers@kernel.org> wrote:
> > On Mon, Nov 27, 2023 at 03:06:57PM +0800, Jerry Shih wrote:
> >> +typedef void (*aes_xts_func)(const u8 *in, u8 *out, size_t length,
> >> +			     const struct crypto_aes_ctx *key, u8 *iv,
> >> +			     int update_iv);
> > 
> > There's no need for this indirection, because the function pointer can only have
> > one value.
> > 
> > Note also that when Control Flow Integrity is enabled, assembly functions can
> > only be called indirectly when they use SYM_TYPED_FUNC_START.  That's another
> > reason to avoid indirect calls that aren't actually necessary.
> 
> We have two function pointers for encryption and decryption.
> 	static int xts_encrypt(struct skcipher_request *req)
> 	{
> 		return xts_crypt(req, rv64i_zvbb_zvkg_zvkned_aes_xts_encrypt);
> 	}
> 
> 	static int xts_decrypt(struct skcipher_request *req)
> 	{
> 		return xts_crypt(req, rv64i_zvbb_zvkg_zvkned_aes_xts_decrypt);
> 	}
> The enc and dec path could be folded together into `xts_crypt()`, but we will have
> additional branches for enc/decryption path if we don't want to have the indirect calls.
> Use `SYM_TYPED_FUNC_START` in asm might be better.
> 

Right.  Normal branches are still more efficient and straightforward than
indirect calls, though, and they don't need any special considerations for CFI.
So I'd just add a 'bool encrypt' or 'bool decrypt' argument to xts_crypt(), and
make xts_crypt() call the appropriate assembly function based on that.

> > Did you consider writing xts_crypt() the way that arm64 and x86 do it?  The
> > above seems to reinvent sort of the same thing from first principles.  I'm
> > wondering if you should just copy the existing approach for now.  Then there
> > would be no need to add the scatterwalk_next() function, and also the handling
> > of inputs that don't need ciphertext stealing would be a bit more streamlined.
> 
> I will check the arm and x86's implementations.
> But the `scatterwalk_next()` proposed in this series does the same thing as the
> call `scatterwalk_ffwd()` in arm and x86's implementations.
> The scatterwalk_ffwd() iterates from the beginning of scatterlist(O(n)), but the 
> scatterwalk_next() is just iterates from the end point of the last used
> scatterlist(O(1)).

Sure, but your scatterwalk_next() only matters when there are multiple
scatterlist entries and the AES-XTS message length isn't a multiple of the AES
block size.  That's not an important case, so there's little need to
micro-optimize it.  The case that actually matters for AES-XTS is a single-entry
scatterlist containing a whole number of AES blocks.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
