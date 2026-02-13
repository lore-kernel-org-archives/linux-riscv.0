Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34E4EEA853
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 00:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zwG+m11N2Rw6TZUwQetAEoiLpFOJNCL6mW/Tvt/7Wr8=; b=yUd+bUlbS7yUjr
	IgRV5lEwaJzEPdssyJVeCfE8YpYT3vg1kfV1v6tc80nayqqRmqlaZ+FcWME4X6+iS+W/yvbw+p9Xv
	9XIy93VSm6J9OAYRRnTJpnFAySSuYlO2uXcNEvPQNUmAsawSbmIKKaVOBvFUDsS0i29LcEn50emZ8
	1cBYJ5gBLqgw6zBcjXcikoC/AjdPXTdNxKr6WTeKLYJz5wzjEz4zIdPNVAToWnHZCME//RlEtOKg5
	X63ht7a7LGQezUIzoo2f9V86OYCdmWt3b7HbAVgDMGRo5rXySgdAKbXYLxXL/HkniUZ1SAuBVRfx7
	YErCnTYjZWG8jbo90uYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgo2-00000002lCz-0YW9;
	Fri, 13 Feb 2026 00:13:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgo1-00000002lCI-2FPR
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 00:13:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E99860018;
	Fri, 13 Feb 2026 00:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27859C4CEF7;
	Fri, 13 Feb 2026 00:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770941588;
	bh=1xonqy6rQWMsq8NcxxbcLlRmc7tyrUvtsOJnFFNXEAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQeHNdh1yatVAxhlZ/GNFUV0lQXw4uiMS8Kw1AJEs0p6LYw2AHIhRwWe4GBy/1hOB
	 5D5otA8FbqDeO5FJt1YwWuZWSLUfFfdD45gEU51zslxsx3tJp4AdmkBcsqW4b4ETGg
	 +bN3aZe4raCfNuu3SHW3n3sO78rlEUtIIT4EaLCKpb02F1fBBk1tISdmDL/DZOu0BJ
	 +DCPkxNf78s0JObruXgai3qCFxLuAZL9Y4uT4FNIIT0qnQQSG+puaz0DJhNm4nrJyN
	 /J7CYDR6l4g24tD5o4IZT9/d6nTN7VPfp1iP7xsEpSCu1k/vOJQ3m3mJYQvj9K/hvp
	 5kbiw/sW69xlw==
Date: Thu, 12 Feb 2026 16:13:05 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"David S . Miller" <davem@davemloft.net>,
	linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V2] crypto: aegis128: Add RISC-V vector SIMD
 implementation
Message-ID: <20260213001305.GB2191@quark>
References: <20260126092411.243237-1-zhangchunyan@iscas.ac.cn>
 <aYW8XJk44phI3JSG@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYW8XJk44phI3JSG@gondor.apana.org.au>
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

On Fri, Feb 06, 2026 at 06:03:08PM +0800, Herbert Xu wrote:
> On Mon, Jan 26, 2026 at 05:24:11PM +0800, Chunyan Zhang wrote:
> > Add a RISC-V vector-accelerated implementation of aegis128 by
> > wiring it into the generic SIMD hooks.
> > 
> > This implementation supports vlen values of 512, 256, and 128.
> > 
> > Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> > ---
> > V2:
> > - Add config dependency of RISCV_ISA_V to fix the issue reported by kernel test robot;
> > - Add return value in preload_round_data() and aegis128_round().
> > 
> > V1: https://lore.kernel.org/all/20260121101923.64657-1-zhangchunyan@iscas.ac.cn/
> > ---
> >  crypto/Kconfig              |   4 +-
> >  crypto/Makefile             |   4 +
> >  crypto/aegis-rvv.h          |  19 +
> >  crypto/aegis128-rvv-inner.c | 762 ++++++++++++++++++++++++++++++++++++
> >  crypto/aegis128-rvv.c       |  63 +++
> >  5 files changed, 850 insertions(+), 2 deletions(-)
> >  create mode 100644 crypto/aegis-rvv.h
> >  create mode 100644 crypto/aegis128-rvv-inner.c
> >  create mode 100644 crypto/aegis128-rvv.c
> 
> In light of the recent move of aes from crypto to lib/crypto,
> perhaps the same should be done for aegis?

Yes, I'll be focusing on AES modes next, but it will make sense to move
AEGIS too.

Regardless of that though, this patch needs a proper review.  I'll try
to find time, but maybe others in the RISC-V community can help too.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
