Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FECC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 04:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4o3ZhFQW5J1446MxpSJ1xgccG/aYZZ1yz/dOTmxGB8=; b=5D+sRUyb/t6p5m
	0lvKByI0eWBBB2VfemalLHGneQGrbCuGX8vb/JRR1YZwzIpqGbubNWmp7/YmAYYbxUBCqSMEjceZy
	y/3+7UEzhvIiCTjcIwi9xHcN34XaCvUCCTeLLTAZ/UXKwkzA26mgYNgWE2lNq4TQ6NhaRuNr0l0CS
	WHRmVjkTN2uzU7sG89Z1NtRdRxtepBRszv5wswcNpvu1BLnctzkUuJu4RFkdwxZzLisA2neh1FbO3
	sk+NnS8W4RPMrCrjNyp9YbdNpduOiA/RI5pcq8A4sxsf3UvGFkb/rznGTgryD6z0z48bS9VS2BHoe
	NSI5onM4YpO8jQTZ4J7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyOvq-008fvc-1N;
	Thu, 02 Nov 2023 04:03:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyOvk-008ftH-1x
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 04:03:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B82DDB81AC7;
	Thu,  2 Nov 2023 04:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13E5C433C7;
	Thu,  2 Nov 2023 04:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698897815;
	bh=z1CJVAu9bc078uGAGfkWMIJJMJkesFaxTcqS0804NqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HrkO3QQiEApYXLUZUDNMyQcaUcE9RB6RWC/n1riSwundUKbH73zf5u8Kc4P41ntFo
	 Jf6rQ/FT8nilsemPzXXxlfBgqcjSxf9uikItJ/61C/vUcNigHM+bAZVH5xzQ1Sb2Qn
	 bIrJQfS7+OW0ULduVofgmVHbtXtfOXeBCZR1kNvmuNGsXYw470TXixzzGxRBrUOJFq
	 GPEeKzGe8Hkmac7xNUxGK1IHinHBV8uJyKYF63Tsgii0QwwKR5IpaqrDV8J5do5cli
	 rfxnQw3fdupMIFcTku+txaWjCuXQMdSEsbhJZqnH8pWyzVM93hj1TCUXsf44/JdNxJ
	 qN8Bjq0tU0W8Q==
Date: Wed, 1 Nov 2023 21:03:33 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
Message-ID: <20231102040333.GC1498@sol.localdomain>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230914001144.GA924@sol.localdomain>
 <ZQJdnCwf99Glggin@ghost>
 <3A0F6A71-C521-44A5-A56C-076AF3E13897@gmail.com>
 <DD3113B1-AB9F-4D6D-BD6E-8F75A83DA45D@sifive.com>
 <20231006194741.GA68531@google.com>
 <AB98E114-A8DE-492E-B078-7394EE4FA83E@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AB98E114-A8DE-492E-B078-7394EE4FA83E@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_210340_960271_44207413 
X-CRM114-Status: GOOD (  23.50  )
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

Hi Jerry,

(Just so you know, you still need to fix your email configuration.  Your emails
have a bogus Reply-To header, which makes replies not be sent to you by default.
I had to manually set the "To:" address when replying.)

On Tue, Oct 31, 2023 at 10:17:11AM +0800, Jerry Shih wrote:
> 
> The RISC-V vector crypto OpenSSL pr[1] is merged.
> And we also sent the vector-crypto patch based on Heiko's and OpenSSL
> works.
> Here is the link:
> https://lore.kernel.org/all/20231025183644.8735-1-jerry.shih@sifive.com/
> 
> [1]
> https://github.com/openssl/openssl/pull/21923

Awesome, thanks!

> 
> > I'm also wondering about riscv.pm and the choice of generating the crypto
> > instructions from .words instead of using the assembler.  It makes it
> > significantly harder to review the code, IMO.  Can we depend on assembler
> > support for these instructions, or is that just not ready yet?
> > 
> > - Eric
> 
> There is no public assembler supports the vector-crypto asm mnemonics.
> We should still use `opcode` for vector-crypto instructions. But we might
> use asm for standard rvv parts.
> In order to reuse the codes in OpenSSL as much as possible,  we still use
> the `riscv.pm` for all standard rvv and vector-crypto instructions. If the asm
> mnemonic is still a better approach,  I will `rewrite` all standard rvv parts
> with asm mnemonics in next patch.

Tip-of-tree gcc + binutils seems to support them.  Building some of the sample
code from the riscv-crypto repository:

    $ riscv64-linux-gnu-as --version
    GNU assembler (GNU Binutils) 2.41.50.20231021
    $ riscv64-linux-gnu-gcc --version
    riscv64-linux-gnu-gcc (GCC) 14.0.0 20231021 (experimental)
    $ riscv64-linux-gnu-gcc -march=rv64ivzvkned -c riscv-crypto/doc/vector/code-samples/zvkned.s

And tip-of-tree clang supports them experimentally:

    $ clang --version
    clang version 18.0.0 (https://github.com/llvm/llvm-project 30416f39be326b403e19f23da387009736483119)
    $ clang -menable-experimental-extensions -target riscv64-linux-gnu -march=rv64ivzvkned1 -c riscv-crypto/doc/vector/code-samples/zvkned.s

It would be nice to use a real assembler, so that people won't have to worry
about potential mistakes or inconsistencies in the perl-based "assembler".  Also
keep in mind that if we allow people to compile this code without the real
assembler support from the beginning, it might end up staying that way for quite
a while in order to avoid breaking the build for people.

Ultimately it's up to you though; I think that you and others who have been
working on RISC-V crypto can make the best decision about what to do here.  I
also don't want this patchset to be delayed waiting for other projects, so maybe
that indeed means the perl-based "assembler" needs to be used for now.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
