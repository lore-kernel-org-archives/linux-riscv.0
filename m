Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17E5E7B615
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 13:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a69wtdcYV7oxXfrsce3hzIHl+S0qO+d7ZNGILt9dvio=; b=RNSgSFOXTv6+Ak
	sU+y+7TJfpSb7+fIm38B49tmVi4QKEb783l+ndOw4Q50098AxPDcA0+F08KLBT9mRqTBqY+h0+HQj
	IFT8RLuGswziSPuIri6naJD5wiAR7lXDtHDy0xutUpcHjUzh1jLQoTVbETWgQg2/1Anlh1sWOSuVl
	qE2JZIwGuqi+FMsTFvDlZkei1CNfBH/qyLG28DM86KFQ7IqnMua5KQsvvVBBNIgEF1rwpdpEa3ET6
	SHeTjqt++dQoF14s/LiCl3bFZuJsyB7EWAREHYcx1X7uINPZWbITUBVd5/DUmft+tdw7pd+gjIP1r
	f3Kvkd3nCHNZif5ZXPsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo209-0008Qe-2R;
	Wed, 04 Oct 2023 13:33:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo206-0008Oe-1S
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 13:33:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 896AD61556;
	Wed,  4 Oct 2023 13:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6A3C433C8;
	Wed,  4 Oct 2023 13:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696426395;
	bh=nUcn/SlnQa7X885HtLaaj+Ehd4Cyq5smiyYTDJ4O40Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IYEXDVerwn8gbQaZr8uT9xcS9c3Qc/reUSTFLxs1Bqu28thOJ3w5dYndFwZQTGkUw
	 ep2ha8cryDL+wXVEHO6OCQfTZhlUMIcyHL8Ef5m6stL+evB4pnTYf4Cag6eq6z/hUl
	 eYLswZBEdCCNVe9T8E8nKxEvP/rQL+VGSG840n0sL4z0ytlX8uCX/l7HtrytJQE9bT
	 T+RLjk0pQK0aq3H5L72gQRuH3zxIxGKBdWj/ehxdxZlkshTqyodo/w2gbMRK7XsvJH
	 aVh/lsZsc9Nc+Rmrz87zw6KdltOwdJLT4VIxw+zWfvieS7vTSG7qD5bEjWDHvbQXg7
	 z+Fu/BlgnsdsQ==
Received: (nullmailer pid 2758981 invoked by uid 1000);
	Wed, 04 Oct 2023 13:33:13 -0000
Date: Wed, 4 Oct 2023 08:33:13 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>, linux-renesas-soc@vger.kernel.org, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cache: andestech,ax45mp-cache: Fix unit
 address in example
Message-ID: <169642639171.2758908.6583867428160039532.robh@kernel.org>
References: <7b93655219a6ad696dd3faa9f36fde6b094694a9.1696330005.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b93655219a6ad696dd3faa9f36fde6b094694a9.1696330005.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_063318_532986_C81073E4 
X-CRM114-Status: GOOD (  11.03  )
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


On Tue, 03 Oct 2023 12:47:59 +0200, Geert Uytterhoeven wrote:
> The unit address in the example does not match the reg property.
> Correct the unit address to match reality.
> 
> Fixes: 3e7bf4685e42786d ("dt-bindings: cache: andestech,ax45mp-cache: Add DT binding documentation for L2 cache controller")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/cache/andestech,ax45mp-cache.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
