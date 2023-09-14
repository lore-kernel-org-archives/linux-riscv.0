Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5800AEE0212
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 00:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2rSC8sTxvcbDFPwgaITZTJQ//dQkcJdEhBVbxSjz/d8=; b=PPQ2OpNAChbZ7x
	C2E3aNk1k+mO1kNzPcN2gpezOJxKEkW6NU1M/4R/63k/kfmZCpWBQTXyJuiOjNR523Rv+faDbQx5k
	FIFzhlWhC2CqY957/UEqtiha43QyHAGNcohHXPvzNTVR9+J29/2YK7jLSaAKFLOxdASbcNKNENciz
	KB+pPoGSRke8EHf3dhW3DvGokIRnn/CH0YkUq85brdFRp0/9ZD1v6IhDfCyreIDk2EhWXnkjBppsw
	39+IWvS1OKI6Eb2UsnEjFaMsD4WfpUbw2s525CHV0m8Zi8XYb/vID9cZjFR+5AIyDD9g7Ast4msOg
	if1c+b4PpIn2x+gPovwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgZxZ-006w1i-3B;
	Thu, 14 Sep 2023 00:11:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgZxW-006w0y-0h
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 00:11:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C5D1DB82758;
	Thu, 14 Sep 2023 00:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C0EC433C8;
	Thu, 14 Sep 2023 00:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694650306;
	bh=Q33a+2wWr7dpJ3gAuG87/40VlteSBLIbhhTUJrzO1p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=plTcQBaw9+qFIJyZ3nYgpJcQc1IqLi5pV6NFEvC0Jefi81qUcXvBV8xRPTUkXVKCE
	 poPupPhVF3c11ThThzdvEbk/4bFSy26ic/RhIqwWb6fBaoBAw/WDqaVg09hG3lB4Av
	 N8/Shpsg5BbPV4FgnnDQ2jtOJn5Sj4a2KQd0q5IJzaBwkxxppyQ/GZrL4yj2MNeM9s
	 yR/Mde3Mex0YexAjnmd9NIeBJ748VeEThqZGNnBPa4nzVZg1ia+EnLfciUnNvcD/V8
	 yEwd+mRaibHbAc7bf4s0wXgPqE1vsnBwUug2PPyBXCZeEv4eYA0bp4PYYFkWg6TDL0
	 XQ4GgV0GEZ3ug==
Date: Wed, 13 Sep 2023 17:11:44 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
Message-ID: <20230914001144.GA924@sol.localdomain>
References: <20230711153743.1970625-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230711153743.1970625-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_171150_413680_DCFCC0D4 
X-CRM114-Status: GOOD (  14.01  )
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

Hi Heiko!  Are you still working on this patchset?  And which of its
prerequisites still haven't been merged upstream?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
