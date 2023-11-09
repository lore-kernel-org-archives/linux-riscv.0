Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AA4C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 08:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqTLknYeyYQ/qSJdorfHJgKyc1qWO9rwpBOQeMwDkJo=; b=jbXXEsJzQAqZzY
	Ggi3laN9Gv6OGd9NfPi6ye4JL6U2S10lEytIwISaDXDl8c4tMcVE6E5rhfNVLJt0qOjaPVWyqBXDk
	R1mKTjHJQeBEzL7LYAx6lLrKlYQ5OJ4cH679Urtd4jjD1T7/ppv0AUQxvlZcnxCmkqdGIKIpAZoqC
	I+G/W/6dE6JExRKTSpFmhSNfaTL/Oe7pDoBx+IGCGYpBrrmY34Y7D5JFshKl2bereWQt3V0IHlO6J
	zqaryE9FhgaUpvQBRrNEZU/xqHbl8GT+AiSryqBPSoiqAILFsVYoBehda1o1NPMvnkMLVKdXKpZIz
	7XIVFyzDqOc/yyhQxltA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1033-005ZNv-2D;
	Thu, 09 Nov 2023 08:05:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r102z-005ZNZ-2k
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 08:05:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 47403B81897;
	Thu,  9 Nov 2023 08:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C00C433C7;
	Thu,  9 Nov 2023 08:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699517151;
	bh=4KAQB4Wpla32XTpJALIgLJy2ciB1pEC384jhuNFgK+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9N819J2K0NWZLwJPTFGyvwa5otCJ6W5svAs9pDSaWppP6MTKUGIwUfmlf7LSA9U6
	 ZavbgthqdS33/iBwjm4jR5a0npnZAEL1FmjpC7CWq9aNfoILljmsNgozGUVCXJgqne
	 dAbMBLmczhgrn1q21qgXbaBHM0g1LHfVB0MTcMlU/qCSYIg9J/zmSFnvIcg13LSoE2
	 E4r9AJx+X+0qEOuycZUKHJ/ZtxjtFD00NI5uje7T5acrFBBgu7j971Dl4LjpFur0B8
	 VFMiFmESewu9VBr2iO26i7SKBi5y9IoyTTVuwj4dRkbEzGSWIWwJVbEcSCZHvGsGhi
	 jvrtNlurh4g5w==
Date: Thu, 9 Nov 2023 00:05:49 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andy.chiu@sifive.com, greentime.hu@sifive.com,
	conor.dooley@microchip.com, guoren@kernel.org, bjorn@rivosinc.com,
	heiko@sntech.de, ardb@kernel.org, phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 06/12] RISC-V: crypto: add accelerated
 AES-CBC/CTR/ECB/XTS implementations
Message-ID: <20231109080549.GC1245@sol.localdomain>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-7-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025183644.8735-7-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_000554_041862_60BB7868 
X-CRM114-Status: UNSURE (   9.44  )
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

On Thu, Oct 26, 2023 at 02:36:38AM +0800, Jerry Shih wrote:
> +# prepare input data(v24), iv(v28), bit-reversed-iv(v16), bit-reversed-iv-multiplier(v20)
> +sub init_first_round {
> +    my $code=<<___;
> +    # load input
> +    @{[vsetvli $VL, $LEN32, "e32", "m4", "ta", "ma"]}
> +    @{[vle32_v $V24, $INPUT]}
> +
> +    li $T0, 5
> +    # We could simplify the initialization steps if we have `block<=1`.
> +    blt $LEN32, $T0, 1f
> +
> +    # Note: We use `vgmul` for GF(2^128) multiplication. The `vgmul` uses
> +    # different order of coefficients. We should use`vbrev8` to reverse the
> +    # data when we use `vgmul`.
> +    @{[vsetivli "zero", 4, "e32", "m1", "ta", "ma"]}
> +    @{[vbrev8_v $V0, $V28]}
> +    @{[vsetvli "zero", $LEN32, "e32", "m4", "ta", "ma"]}
> +    @{[vmv_v_i $V16, 0]}
> +    # v16: [r-IV0, r-IV0, ...]
> +    @{[vaesz_vs $V16, $V0]}
> +
> +    # Prepare GF(2^128) multiplier [1, x, x^2, x^3, ...] in v8.
> +    slli $T0, $LEN32, 2
> +    @{[vsetvli "zero", $T0, "e32", "m1", "ta", "ma"]}
> +    # v2: [`1`, `1`, `1`, `1`, ...]
> +    @{[vmv_v_i $V2, 1]}
> +    # v3: [`0`, `1`, `2`, `3`, ...]
> +    @{[vid_v $V3]}
> +    @{[vsetvli "zero", $T0, "e64", "m2", "ta", "ma"]}
> +    # v4: [`1`, 0, `1`, 0, `1`, 0, `1`, 0, ...]
> +    @{[vzext_vf2 $V4, $V2]}
> +    # v6: [`0`, 0, `1`, 0, `2`, 0, `3`, 0, ...]
> +    @{[vzext_vf2 $V6, $V3]}
> +    slli $T0, $LEN32, 1
> +    @{[vsetvli "zero", $T0, "e32", "m2", "ta", "ma"]}
> +    # v8: [1<<0=1, 0, 0, 0, 1<<1=x, 0, 0, 0, 1<<2=x^2, 0, 0, 0, ...]
> +    @{[vwsll_vv $V8, $V4, $V6]}
> +
> +    # Compute [r-IV0*1, r-IV0*x, r-IV0*x^2, r-IV0*x^3, ...] in v16
> +    @{[vsetvli "zero", $LEN32, "e32", "m4", "ta", "ma"]}
> +    @{[vbrev8_v $V8, $V8]}
> +    @{[vgmul_vv $V16, $V8]}
> +
> +    # Compute [IV0*1, IV0*x, IV0*x^2, IV0*x^3, ...] in v28.
> +    # Reverse the bits order back.
> +    @{[vbrev8_v $V28, $V16]}

This code assumes that '1 << i' fits in 64 bits, for 0 <= i < vl.

I think that works out to an implicit assumption that VLEN <= 2048.  I.e.,
AES-XTS encryption/decryption would produce the wrong result on RISC-V
implementations with VLEN > 2048.

Perhaps it should be explicitly checked that VLEN <= 2048?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
