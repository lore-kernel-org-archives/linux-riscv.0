Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30692CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 22:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LSwmWyBjQ2e7dEKtvd5U84S3puvgsT3mIn+HnQPbwXs=; b=061oa3nz0LLLQh
	J+6UXjmFWPitAWzM0nR8LL9J8X3GNJM3Q0tdegQARiDiV641JXsB74Uwz6uOdViWUB/XG8CvBdrL3
	9Q5S4B9mSKcefhU9+skzSJbOoHjDYsiOVJCFUP6FRldy9NkHD2+c1pmnkMxuFkya56CKApEsbAcnQ
	35/uhB2nl+SX2gV8criqqbjX1RZ+yGnNxSmDBEHIc/zBPO3PJphstkUZMO4da4jA1mbyQGF2Bf8Cd
	D932rFilq9Jv/fQnLtl7HWJXefCtJGi3KpeIsMKw0uwlJ1r95KpqcqSp2SVdYb7hOqrS303+5DgT5
	JCWEQP/PfcsUZruxPbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBg6y-00000004fwT-044j;
	Tue, 29 Sep 2026 22:15:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBg6v-00000004fwI-223H
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 22:15:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 715F16022F;
	Tue, 29 Sep 2026 22:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8381F000FF;
	Tue, 29 Sep 2026 22:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790720139;
	bh=30VbeHI26M0iDF3RNsG6n++4Iu8TSb4QWiYPs2BLDBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A+yXq/aEAKAKi8zYNvjkSHZi61BXBaN1KMAyk/swb1dHMQEpyMCwQmsjW2KDWmkXx
	 bNHo6OTJw2OZ0Zkmx/CPKo372aa2pk7y+84DO0Nt0WeoKiKmm4DPVsIVrAiNOQFcVw
	 ertVhn2mB3xVkgF7EMyFUGu6sYy857qkbikyuFKkb8g6+j/lWolYtmEGOteLqtBnBi
	 +Mlj2HwasG7PyW1MxBSKgRMlrIy3B+MEP1YmeixppKx4FGzuI+qtVBaOI1uxK63gSC
	 TvTEJZLzy1P1vC+4GeWF9hLtpLqKXitdDYUpOgbPzNm96PuNjLl+s8dw6IZbWVGLD0
	 3nkI9YRy/aIpA==
Date: Tue, 29 Sep 2026 15:15:37 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: riscv: thead: add Milk-V Meles
Message-ID: <arw4icuirVisRnir@thelio>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-1-effdd14a76e8@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929-rv-meles-v1-1-effdd14a76e8@iscas.ac.cn>
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

On Tue, Sep 29, 2026 at 06:22:45PM +0800, Han Gao wrote:
> Document the Milk-V Meles board compatible with the TH1520 fallback.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/riscv/thead.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
> index 301912dcd290e60f816d380152591106de9415b4..5361021b8dcc9897803a5915665c6bb83309fe53 100644
> --- a/Documentation/devicetree/bindings/riscv/thead.yaml
> +++ b/Documentation/devicetree/bindings/riscv/thead.yaml
> @@ -21,6 +21,10 @@ properties:
>          items:
>            - const: beagle,beaglev-ahead
>            - const: thead,th1520
> +      - description: Milk-V Meles single board computer
> +        items:
> +          - const: milkv,meles
> +          - const: thead,th1520
>        - description: Sipeed Lichee Pi 4A board for the Sipeed Lichee Module 4A
>          items:
>            - enum:
> 
> -- 
> 2.47.3
> 

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
