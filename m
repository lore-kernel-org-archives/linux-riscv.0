Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F175CA0FE9
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 08:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpBhL1h57DDpEKPtES9DcA82wg8R8RzicMy/eXVB6vw=; b=zbtWVFjUsDMw0U
	zRhtG/+rS88klBcqNVkRsB7JkPxA7GvTVgdnLTmv1HmYPe4sjOh8xx30tiSiwtNDqeD2asOLTajGY
	oySSAaSDaN0WqnG/d3FHXKh0ef8sTXjP0cT51s+zEzZUW5TmlcsgVGy5YD4OtMMCWSV8TiTIc6pH6
	bI+XUfz/k/melnOs3nNWEZabdD57kV50KRekxFMWhT+ZkX2HLvybB6ZKtoM0xMsqPKIfVWI4yuLgw
	ptQL+9+oT3xzCb+8UPaXojQ5BH2qhtfn3W14ifgkyD/PSFE4e41tlLy6bnJjxM8EMopw0VMxY/jsz
	EkAWMfA9+N879kHwhqBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTJ-00000004KZu-2scq;
	Sat, 23 Aug 2025 08:19:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upXST-00000003Nh3-2cqU
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 19:29:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C598060203;
	Fri, 22 Aug 2025 19:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E07C4CEED;
	Fri, 22 Aug 2025 19:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755890991;
	bh=vdJq0q+my1ci9w+fJXlyPSjDXSOdjzeQy/4dcrw9iVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f26JL4hTa2a+spujmu83Fj2J4dNM7QAdh3rEmzH/rlz2A87QacngV0QCB8l7wyEuD
	 GdTi0XaZe2yM60aDYFa52UaxKkmaC2ccDHBimuM8mTOhK19NDKlU7lpWl9l5G6nXGT
	 RDrirbrVpwy1pX8Ew9i/5AAWW9+aQtUGNewov6uVXKTTEy8/tV/9fcPOprw52Q4f6s
	 uvb93Gxu41v4Z7u3Etr80ugzjXqRDXDqxF8rzjbv5cgJBRdsShJ/3d2x/7whiTemDT
	 XoURB8jY01XfNHQa9aFBH0fii/4wkOa5zQfsiC12epXAqcXcZ2R7HpKfIWLViEXDOJ
	 yZa/s2dw4AiiA==
Date: Fri, 22 Aug 2025 14:29:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-riscv@lists.infradead.org, Andi Shyti <andi.shyti@kernel.org>,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	linux-i2c@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: i2c: spacemit,k1-i2c: Minor whitespace
 cleanup in example
Message-ID: <175589099015.179539.7406634421042380290.robh@kernel.org>
References: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>
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


On Thu, 21 Aug 2025 10:32:06 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
