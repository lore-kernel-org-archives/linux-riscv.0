Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8A7C74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 18:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqBJV4q/PzZdBNLDuzgcAcmQrDvbpPhszX5a+H9walc=; b=xr8s/9pfrl0a5J
	S5xrRuI4O2EeDQjvFFOqgDHbixGMvGZwxfZRf7phzvP20y/Z5/tCuBbumiIpa1kTAnAA/TQm8IvUR
	bhKg0nVflkjlh+NJqZQ+WU4/bL1dEMk9DRKCsPNBp1xU7VlHa5CMzKyKeXs5h9qHe/NzVV2DPcwI8
	80ofSF2qjFz7ShVDUlN1uIIyW4IMIu0x+lYgiTz/bOONr9DONVgn+SFrKOeMBkiNrhT1KJqp5FgDY
	2JgZQAGlUcuwJl730CnvWWVt3NhxbZv3BhO26PvS031UmB0UVhh27xrK/62waaTDz5cOsriiDcjSI
	P9ZdC19M6LgTxE/iMd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phafh-001ULO-2Z;
	Wed, 29 Mar 2023 18:37:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phaff-001UKH-05
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 18:37:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44A4C61D7A;
	Wed, 29 Mar 2023 18:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71085C433D2;
	Wed, 29 Mar 2023 18:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680115037;
	bh=gtCGbqJ0FbcE4MHF5hlo02AxFG+1NLUpi8vGAbO82nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K99OoVJjrepIqcQhSEEt1tV5dFvZ2XNQq76XJFHC7YANN6yWN6UQshxWm2LTUtSWl
	 zrpPHxayptuZoplFym7EsCqJygCDMfst7ShEKZub4Tg/ordCEzTvRAEJn5QU0qtIG3
	 FUoOVfA+vETzZqrYartLnUycD+9P5AEaGWn2w9s98Bgjv3mxJ0BdgEiIIoqRBvnrdU
	 cf1gwWOhCoP4bC8sK00Z1T8Y4gSGK50rmIws15Xb6kRz+yzgPT/R8Y5AsTEXJPX5uE
	 cc8zTFjfglgqxsc947xTzgNJMSIvBRxPTX0RYCKF+J6sax9eH+PHH9CQTvx2k5WE9Q
	 8p6RPuPtCO6uw==
Date: Wed, 29 Mar 2023 18:37:16 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 4/4] RISC-V: crypto: add accelerated GCM GHASH
 implementation
Message-ID: <ZCSFXIAnl6LTVLJL@gmail.com>
References: <20230329140642.2186644-1-heiko.stuebner@vrull.eu>
 <20230329140642.2186644-5-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230329140642.2186644-5-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_113719_124958_C5750343 
X-CRM114-Status: GOOD (  16.77  )
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

On Wed, Mar 29, 2023 at 04:06:42PM +0200, Heiko Stuebner wrote:
> diff --git a/arch/riscv/crypto/ghash-riscv64-zbc.pl b/arch/riscv/crypto/ghash-riscv64-zbc.pl
> new file mode 100644
> index 000000000000..691231ffa11c
> --- /dev/null
> +++ b/arch/riscv/crypto/ghash-riscv64-zbc.pl
> @@ -0,0 +1,400 @@
> +#! /usr/bin/env perl
> +# Copyright 2022 The OpenSSL Project Authors. All Rights Reserved.
> +#
> +# Licensed under the Apache License 2.0 (the "License").  You may not use
> +# this file except in compliance with the License.  You can obtain a copy
> +# in the file LICENSE in the source distribution or at
> +# https://www.openssl.org/source/license.html

My understanding is that code that is licensed under (only) the Apache License
2.0 cannot be included in GPLv2 programs such as the Linux kernel.

Is this code written by Andy Polyakov?  What's been done in the past for his
code is that he re-releases it in CRYPTOGAMS at
https://github.com/dot-asm/cryptogams with a Linux kernel compatible license.
The Linux kernel then takes the code from there instead of from OpenSSL.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
