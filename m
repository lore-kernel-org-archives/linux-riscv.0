Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC77FF60C8
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 06:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nYWR+Bk8/XPd4gYfSXslFPCoQtaPpJWxkW/ccvCG6Ow=; b=gDHnYDEFf6ijLj
	yrVHN2MeT8kt5IcmhdkoHbejUpy08WlPzwT0HsxTvLGYuMwnoVWx1iz/IvChtAKZsYWLh43/V51SZ
	dmQJsIq4m4dDcNND3vOeJbeaOyR+8vi7YeBEBXRkhMCJbmzJ+66X3s2Mdxbwwdd6v3e6yPrErifou
	nBdTeuL+DxUloQ4YgBSWvsu14q4jaV7KqZvXdMe4KWQrDVnUrp8Zu9iU1GxaYYPWBUXuRU+Sl+mSS
	3mr5JC+S/RGbdNTX4hKbBFnD7p1A01LWAkVm4xDeOfRB9VlWnjrzbo1zO1SQbLQmQz9r0gMonWomU
	30JEsFTST+hVjmvpUuIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7SCb-0000000CKy1-2cPn;
	Tue, 31 Mar 2026 06:03:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7SCa-0000000CKxv-2d1U
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 06:03:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A3FA560103;
	Tue, 31 Mar 2026 06:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD93C19423;
	Tue, 31 Mar 2026 06:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774937027;
	bh=DXSCh/jt76xc1rZLMYsNc8cyKsm9+s2g5NNKgBvpYbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hmLZTzvdl1kjBuXUptV4s7PGvqZdu35s3e6KAIomjM4oF/acc23PjKYQgmIcojvFf
	 TEaq/LW0uZeJmVwQHHb5Sl7bXhF3no5hbBLKMmu7Gabu9CmbMUTaNI3Vf/TNdDaEXx
	 tRyNdZcCcveV4eRIIEF9+WFD/Cn9NQOUi6XQJiaOzbsVCWYZFKQcH7qV2mNtY7Ji54
	 MSjBIB6onOh5MX6GJ+RHgH1Tcp5RTLiBHWzaOkpPwMFPtcadQwcX+HX29fiFBOIJQg
	 Eh4IHwap67aMCBJmn/LsyLY1HINi7J3kG5zEuSFqio74V6e9zaNGv9NCumyN0rALLp
	 FT5V+0Lgc9jcQ==
Date: Tue, 31 Mar 2026 14:03:44 +0800
From: Yixun Lan <dlan@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Guodong Xu <guodong@riscstar.com>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Yangyu Chen <cyy@cyyself.name>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add
 deepcomputing,fml13v05
Message-ID: <20260331060344-GKA976850@kernel.org>
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
 <20260331034539.67167-1-sandie.cao@deepcomputing.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260331034539.67167-1-sandie.cao@deepcomputing.io>
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

Hi Sandie,
On 11:45 Tue 31 Mar     , Sandie Cao wrote:
> From: sandiecao <sandie.cao@deepcomputing.io>

Can you use more formal format for your name? which,
Sandie Cao <sandie.cao@deepcomputing.io>

> 
> Document the compatible string for the Deepcomputing fml13v05.
> It's based on the SpacemiT K3 RISC-V SoC and is designed for the Framework
> Laptop 13 Chassis, which has (Framework) SKU FRANHQ0001.
> 
> Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>
same here
> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> index b958b94a924d..af8030242bdc 100644
> --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> @@ -29,6 +29,7 @@ properties:
>            - const: spacemit,k1
>        - items:
>            - enum:
> +              - deepcomputing,fml13v05
>                - spacemit,k3-pico-itx
>            - const: spacemit,k3
>  
> -- 
> 2.43.0

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
