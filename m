Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFA9CCF9E3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=242+DlPqr38vyxlDWhSGCEP2RUiXOoAOU/x7GkdAHnk=; b=l9LY8m4JppR2Eh
	v+JuJsxdCKkcVQj2PENOyrZq9dP0x4C2XqxTXgA69H8Dw/b/ZeOue/s1TP4j9hhjzMDbv6jr3FarX
	aJzbM+llCmD+5iQu+GOq058ujieEiowQP+YqK6lu1DmdYfbU9M/CZ/v6MPlrge7otX7zVbRVL7YIM
	WZ5uEH0cA89xfZwBkgVe39Upe0AF1LrbNd0np+vYs+i95Nv8wBoRgMJKUjIWwkzGm1s6QqN+1ayQ5
	eVzm/qY6DKB6tksonBSla3Gd9fDTqVlaJocTmVQEjPyo+kXMCE9bjxBxh3fEpCkZLSvx00UMFUP2/
	MVd+6f93nss+Iw9Rt9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIReu-00000005Sp4-3MkD;
	Mon, 10 Nov 2025 13:10:13 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIReq-00000005Sod-4ASw
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 13:10:11 +0000
Received: from localhost (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8221C340DB0;
	Mon, 10 Nov 2025 13:10:06 +0000 (UTC)
Date: Mon, 10 Nov 2025 21:10:01 +0800
From: Yixun Lan <dlan@gentoo.org>
To: michael.opdenacker@rootcommit.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: spacemit: Add OrangePi R2S
 board
Message-ID: <20251110131001-GYB1651402@gentoo.org>
References: <20251110101110.948198-1-michael.opdenacker@rootcommit.com>
 <20251110101110.948198-2-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251110101110.948198-2-michael.opdenacker@rootcommit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_051009_066995_5916527D 
X-CRM114-Status: GOOD (  12.24  )
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

Hi Michael,

On 10:11 Mon 10 Nov     , michael.opdenacker@rootcommit.com wrote:
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
with Krzysztof's comment, you should put this new compatile before
 xunlong,orangepi-rv2, see

https://lore.kernel.org/all/20251110-impressive-dalmatian-of-luck-4d1441@kuoka/

>            - const: spacemit,k1
>  
>  additionalProperties: true

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
