Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91945C001DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 05:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqpimvzIG71xNskhjQZobB7brnm/zyKzjnuSm6Gw6aA=; b=YmJ1zN1llABanb
	StgAy+LynCHeDYGbp65OXJppyTQlq9x9UDC2F6w0hYn57YdQmAc4ZLpv+XUvXhs5gIikiOqlmw96d
	ydfbd7jlrMDqIMsrhSIcgnqorjPs8KwJIZkPUDKSLL8eg29lJlvmowSDmmcvwoHGza5LjB8XNeba+
	8QclgEmfgvHURfQcNZLo/0lmEIuxVUZ0Hb5ZixOCGOm7T/kW8KSrgQ8U51FpaNbsGnYv8Q56hIz7G
	znWpOwyNqq+ro8Zw6mvlTNuHibuywn+Wc1z8Hx8kD7A7PEu1C/OfjOHChxbNnCjdzbbiWAo+9TXBb
	U5JDu+9AP+ppiHQVVW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMiRo-00Ctit-1J;
	Fri, 21 Jul 2023 05:13:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMiRk-00CtiB-2L
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 05:12:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C604860FE6;
	Fri, 21 Jul 2023 05:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD864C433C7;
	Fri, 21 Jul 2023 05:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689916375;
	bh=WPeEnFdfCBLOPdp6eea7RsY9spio4gTJNjv/KaXILgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HY5vQyF/dWt+90AINhxoO3ErLd9GcWTIakKly9JVxzWJ0C6zfFvrIe/DE0hJVGBOp
	 7wo6mQMj5x6B/ugcgr7Zb/sjR7+TbGiTkbgErOblnvpEyXzD3AjkAvwRUDKcxw4bhP
	 dpLezp7X3XoDMiejvCbms8dE37rmLI+6+4hyTKs6DkqtaHDO9AN7VGVe8h0ZEzxp6v
	 xQOjGmBsK/kATw1PlXfYOwlccNMrV4DbHIRncc2slu4yfgYp8hvo1qBwWCxOK5Gema
	 NN+N+GgT8Ls8JpZoAc/KiG7MbT58VMSK9Ax6zpR6fJBVi9lCojHOjKzCetqaXpPQmH
	 CGXcVEq1Nwm0w==
Date: Thu, 20 Jul 2023 22:12:53 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
Message-ID: <20230721051253.GC847@sol.localdomain>
References: <20230711153743.1970625-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230711153743.1970625-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_221256_884254_536D577B 
X-CRM114-Status: GOOD (  29.53  )
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

Hi Heiko,

On Tue, Jul 11, 2023 at 05:37:31PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> This series provides cryptographic implementations using the vector
> crypto extensions.
> 
> v13 of the vector patchset dropped the patches for in-kernel usage of
> vector instructions, I picked the ones from v12 over into this series
> for now.
> 
> My basic goal was to not re-invent cryptographic code, so the heavy
> lifting is done by those perl-asm scripts used in openssl and the perl
> code used here-in stems from code that is targetted at openssl [0] and is
> unmodified from there to limit needed review effort.
> 
> With a matching qemu (there are patches for vector-crypto flying around)
> the in-kernel crypto-selftests (also the extended ones) are very happy
> so far.
> 
> 
> changes in v4:
> - split off from scalar crypto patches but base on top of them
> - adapt to pending openssl code [0] using the now frozen vector crypto
>   extensions - with all its changes
>   [0] https://github.com/openssl/openssl/pull/20149
> 
> changes in v3:
> - rebase on top of 6.3-rc2
> - rebase on top of vector-v14 patchset
> - add the missing Co-developed-by mentions to showcase
>   the people that did the actual openSSL crypto code
> 
> changes in v2:
> - rebased on 6.2 + zbb series, so don't include already
>   applied changes anymore
> - refresh code picked from openssl as that side matures
> - more algorithms (SHA512, AES, SM3, SM4)
> 
> Greentime Hu (2):
>   riscv: Add support for kernel mode vector
>   riscv: Add vector extension XOR implementation
> 
> Heiko Stuebner (10):
>   RISC-V: add helper function to read the vector VLEN
>   RISC-V: add vector crypto extension detection
>   RISC-V: crypto: update perl include with helpers for vector (crypto)
>     instructions
>   RISC-V: crypto: add Zvbb+Zvbc accelerated GCM GHASH implementation
>   RISC-V: crypto: add Zvkg accelerated GCM GHASH implementation
>   RISC-V: crypto: add a vector-crypto-accelerated SHA256 implementation
>   RISC-V: crypto: add a vector-crypto-accelerated SHA512 implementation
>   RISC-V: crypto: add Zvkned accelerated AES encryption implementation
>   RISC-V: crypto: add Zvksed accelerated SM4 encryption implementation
>   RISC-V: crypto: add Zvksh accelerated SM3 hash implementation
> 
>  arch/riscv/crypto/Kconfig                     |  68 ++-
>  arch/riscv/crypto/Makefile                    |  44 +-
>  arch/riscv/crypto/aes-riscv-glue.c            | 168 ++++++
>  arch/riscv/crypto/aes-riscv64-zvkned.pl       | 530 ++++++++++++++++++
>  arch/riscv/crypto/ghash-riscv64-glue.c        | 245 ++++++++
>  arch/riscv/crypto/ghash-riscv64-zvbb-zvbc.pl  | 380 +++++++++++++
>  arch/riscv/crypto/ghash-riscv64-zvkg.pl       | 168 ++++++
>  arch/riscv/crypto/riscv.pm                    | 433 +++++++++++++-
>  arch/riscv/crypto/sha256-riscv64-glue.c       | 115 ++++
>  .../crypto/sha256-riscv64-zvbb-zvknha.pl      | 314 +++++++++++
>  arch/riscv/crypto/sha512-riscv64-glue.c       | 106 ++++
>  .../crypto/sha512-riscv64-zvbb-zvknhb.pl      | 377 +++++++++++++
>  arch/riscv/crypto/sm3-riscv64-glue.c          | 112 ++++
>  arch/riscv/crypto/sm3-riscv64-zvksh.pl        | 225 ++++++++
>  arch/riscv/crypto/sm4-riscv64-glue.c          | 162 ++++++
>  arch/riscv/crypto/sm4-riscv64-zvksed.pl       | 300 ++++++++++
>  arch/riscv/include/asm/hwcap.h                |   9 +
>  arch/riscv/include/asm/vector.h               |  28 +
>  arch/riscv/include/asm/xor.h                  |  82 +++
>  arch/riscv/kernel/Makefile                    |   1 +
>  arch/riscv/kernel/cpu.c                       |   8 +
>  arch/riscv/kernel/cpufeature.c                |  50 ++
>  arch/riscv/kernel/kernel_mode_vector.c        | 132 +++++
>  arch/riscv/lib/Makefile                       |   1 +
>  arch/riscv/lib/xor.S                          |  81 +++
>  25 files changed, 4136 insertions(+), 3 deletions(-)
>  create mode 100644 arch/riscv/crypto/aes-riscv-glue.c
>  create mode 100644 arch/riscv/crypto/aes-riscv64-zvkned.pl
>  create mode 100644 arch/riscv/crypto/ghash-riscv64-zvbb-zvbc.pl
>  create mode 100644 arch/riscv/crypto/ghash-riscv64-zvkg.pl
>  create mode 100644 arch/riscv/crypto/sha256-riscv64-glue.c
>  create mode 100644 arch/riscv/crypto/sha256-riscv64-zvbb-zvknha.pl
>  create mode 100644 arch/riscv/crypto/sha512-riscv64-glue.c
>  create mode 100644 arch/riscv/crypto/sha512-riscv64-zvbb-zvknhb.pl
>  create mode 100644 arch/riscv/crypto/sm3-riscv64-glue.c
>  create mode 100644 arch/riscv/crypto/sm3-riscv64-zvksh.pl
>  create mode 100644 arch/riscv/crypto/sm4-riscv64-glue.c
>  create mode 100644 arch/riscv/crypto/sm4-riscv64-zvksed.pl
>  create mode 100644 arch/riscv/include/asm/xor.h
>  create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
>  create mode 100644 arch/riscv/lib/xor.S
> 

Thanks for working on this patchset!  I'm glad to see that you and others are
working on this and the code in OpenSSL.  And thanks for running all the kernel
crypto self-tests and verifying that they pass.

I'm still a bit worried about there being two competing sets of crypto
extensions for RISC-V: scalar and vector.

However the vector crypto extensions are moving forwards (they were recently
frozen), from what I've heard are being implemented in CPUs, and based on this
patchset implementations of most algorithms are ready already.

So I'm wondering: do you still think that it's valuable to continue with your
other patchset that adds GHASH acceleration using the scalar extensions (which
this patchset is still based on)?  

I'm wondering if we should be 100% focused on the vector extensions for now to
avoid fragmentation of effort.

It's just not super clear to me what is driving the scalar crypto support right
now.  Maybe embedded systems?  Maybe it was just a mistep, perhaps due to being
started before the CPU even had a vector unit?  I don't know.  If you do indeed
have a strong reason for it, then you can go ahead -- I just wanted to make sure
we don't end up doing twice as much work unnecessarily.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
