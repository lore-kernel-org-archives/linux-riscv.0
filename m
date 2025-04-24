Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A61C369D1
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 07:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wbIf4cfjZw+c1cll6NMsHWvutDV5Gqr+FPY2sNEI6ms=; b=lMUjmjT5pmv1Ob
	MkIBmIJZ0Cq/bFuBL+B3Bj/sQ1zTP6y+U4TjLoYjsPyyut2SnNCNNpxoD6jpaLTVoEERiyDTf330K
	onYH4qVBWZoEVLSLIfmVD/D55s7vwVmN+Piy4B32CQBuMxrhgO7n015TxTu/UzrGMJPu63dJXOD0R
	gy0VFbA2gY8dL6nVN/Bzh2/O158Rs7JZ/V0wT0NTFOKgMUKvrgm7Kmd0xbu08+wOHzJpAk6iabIvx
	qtN1vjBPLlPrsIKSb2k3yjFX3Gmp95yGTP1Bm8VZoNFQmHDbtg5yN4PUlgMI0KwNQKziz+PMOTMEJ
	q8Ee3HN9mBKAAgpwzaYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qhL-0000000D5ls-1iHa;
	Thu, 24 Apr 2025 07:08:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qN3-0000000D2zv-3VVl
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 06:47:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0BCBFA42F8A;
	Thu, 24 Apr 2025 06:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274A2C4CEEA;
	Thu, 24 Apr 2025 06:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745477260;
	bh=ET5XGuXWot7j4ph0bPMc5LmHK6iblfnXB0dSje/G3v4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E+lMwYXF0U4Drvo1iKXxccYk9NdGznYEi7EBKiXmaFQvzKBCfC/be+F+gCG4Sayi1
	 C8LpFh6Mu8z51/KJ3ZUxs8x1zjz9SIayZqk7bkAjwc+PKHwiTTWrLpOU3FoOaeoGVL
	 b3iB3uuXYgbGQBeOsxNfmtabIxtP3SpRKX6aHDMA9i3dHQ3+lVzL96Q1d2QaBWVT4Q
	 dj4BQzvyXwcPHTU+x0OHDlZ7EPxwf02FoRaaosk+1yH9pznPPXcsumPAb7YfwEze2h
	 R9ZqJB1+jFnbdBfYvOjjHWvyaKd3x1epLJWpufgfM2en3FjSUjpv1qDyqPcWm6j8Oj
	 NfEVq/ZES2c0g==
Date: Thu, 24 Apr 2025 08:47:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Longbin Li <looong.bin@gmail.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pwm: sophgo: add pwm controller for
 SG2044
Message-ID: <20250424-bright-vague-finch-57fc38@kuoka>
References: <20250424012335.6246-1-looong.bin@gmail.com>
 <20250424012335.6246-2-looong.bin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424012335.6246-2-looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_234741_935674_02A7E89F 
X-CRM114-Status: GOOD (  14.10  )
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

On Thu, Apr 24, 2025 at 09:23:26AM GMT, Longbin Li wrote:
> Add compatible string for PWM controller on SG2044.
> 
> Signed-off-by: Longbin Li <looong.bin@gmail.com>
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
