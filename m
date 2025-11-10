Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6850CCF9E3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 08:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zoKu9ifD+PQh4nF4UsZFKDDgbvXPlLwVa7zDB+cHev4=; b=WOx5j51kiaOOuA
	y4JmYXG+Nt3gi1/a0pSBSbKVmAPj885WDW2azfjmz2EUBCx2bANM52/pE5Plr4JfBRDLm8Ia6KCGu
	3BtE0z9CrfzkgZMVgl7wOdGFbmkkL+lEVNCQvFnmaLe7S7vx/mXTqkfdEoWYlIM2LF+SPPaLvz3mH
	lXaD1BhbDxBTUKmn+03dqtJZ975YfdvVLJ4Qcc5xqRZb5F9PFzAfNYo0mpXBC/+338zxJeAcBJ0uv
	D0hhoq9cv0YuN0QKJXMS+BykHFCcb+xMnZ+EYH3GcP+dgrl1ANIUjCwcxDIxK2RpKCCcyNde8EZpF
	8VLVtDyo/zC6Ssot7YdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMrZ-00000004wCR-2h4v;
	Mon, 10 Nov 2025 08:02:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMrX-00000004wCC-2CIx
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 08:02:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FB8960142;
	Mon, 10 Nov 2025 08:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C099C4CEF5;
	Mon, 10 Nov 2025 08:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762761773;
	bh=Mjf/udNQvIHvbjf5mPBHq7ehCEM72149U5Hh1Lrz5ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GBMrRrlRgxK97/xHqRY3xPElLV3ZBVHtIgd85mJgW+cVB7zEhaGbQL4RL+Vr+r9nG
	 epRumM9yhggPC7tzZ8295w2DkXrcAH9Z11iLsiHGqFRdQN6xRTukNlaqD090LFCpvw
	 I8s1vFxvExNnAtg39YD8xz5l8QxDiqILzJXtTGttkY6/aa6ordtM4OF7tsRH597LN/
	 /Pff4IoKUbiVs1FiDnMPko8lpkm9Iqv3u3Fw5eMzgSenXd3aqssqztltbU0dYREbu4
	 pGCm+F48PrLWayTWT6msy0vgZcAmFDiiBmRIcehuFEEIWOhfPAk5BALh5fRsMcHqby
	 /vzLfCrcfQ/ww==
Date: Mon, 10 Nov 2025 09:02:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: michael.opdenacker@rootcommit.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: riscv: spacemit: Add OrangePi R2S board
Message-ID: <20251110-impressive-dalmatian-of-luck-4d1441@kuoka>
References: <20251109222858.3085488-1-michael.opdenacker@rootcommit.com>
 <20251109222858.3085488-2-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251109222858.3085488-2-michael.opdenacker@rootcommit.com>
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

On Sun, Nov 09, 2025 at 10:29:57PM +0000, michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> Document the compatible string for the OrangePi R2S board [1], which
> is marketed as using the Ky X1 SoC but is in fact identical to
> the SpacemiT K1 SoC [2].
> 
> Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html [1]
> Link: https://www.spacemit.com/en/key-stone-k1 [2]
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> index 52fe39296031..1b2f279d31f9 100644
> --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> @@ -24,6 +24,7 @@ properties:
>                - milkv,jupiter
>                - spacemit,musepi-pro
>                - xunlong,orangepi-rv2
> +              - xunlong,orangepi-r2s

2 < v.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
