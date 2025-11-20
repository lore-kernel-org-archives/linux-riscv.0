Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAA6CF64A2
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 08:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PvADCyHV1sah5VfWXPfEV2gZX8hrKaeqHywlWiJEr4Q=; b=npFeb+ap1oBBo0
	egeOaXupKOI+11EstcuKcD+Kc7fSEJaSwSlB3ZUFtLzsxFJXKrLTpemZZreZaX0x1ACmuHtmN1B5x
	/11hVKynbNavkFdUI7jyuy84W805JKD9TsseUOVS485wGVHFQZckY6f7RbVpAFtdg34Kea9GLwjAq
	mS2QVMtLp2aewvMhadoGmFdeh6ajedHpXMd26cPOXND66MLmgLu2iiC6Ccp3HkOXmsv1CI8zRp8nx
	Zly/vrcsfO2NIP06VC1OB9NiuXg+LrKUlIBlOTIeu15LUB3zqP/vCHZCsO9EW8K15FyUd4xJjuhJP
	QEhokPl/jaaTk7lM8pTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLznf-00000006KuE-35In;
	Thu, 20 Nov 2025 08:13:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLzne-00000006Ku4-3nmD
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 08:13:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9BDD6014E;
	Thu, 20 Nov 2025 08:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1900CC4CEF1;
	Thu, 20 Nov 2025 08:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763626433;
	bh=G9LXGufG/UQP5AIT5n6OMpjuYpG4fsbv9VqINY8RA0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfBIh/CLPUJs1yji8DrwVkAbqqNquYxkEsAiaruEwtyGTpX8RHSMkqy6tz7+eSG+9
	 qVZSyMlbZlXXVOAOmDZfaSc8EKhiKsl1h5ukZFuLwEoI0kAxrrUowoIgqKn4XArJNS
	 n8/28GiFhfQvuHlPLf+qS4hVBvGt7+8br2iwXljjy4tD1YkoSalbuXXOgoETo5FGzB
	 nTZ0HqzKxwrhUWE+irWLxXVeq2YwQsyTd1ZssRfcQ71xTRfJNzNOKghuJ6BFimLMF1
	 a065bnFoRcf8ugfo6OOfAJS6VZXyib3OEyoqEi8QJ/Rmh3dJHz51cPk7S+bIQq3LP7
	 7xVr0pcnL+htg==
Date: Thu, 20 Nov 2025 09:13:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Encrow Thorne <jyc0019@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troymitchell988@gmail.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: spacemit: add optional resets
Message-ID: <20251120-warping-logical-skunk-0674f8@kuoka>
References: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
 <20251119-i2c-k1_reset-support-v1-1-0e9e82bf9b65@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251119-i2c-k1_reset-support-v1-1-0e9e82bf9b65@gmail.com>
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

On Wed, Nov 19, 2025 at 07:46:43PM +0800, Encrow Thorne wrote:
> Add optional reset property for the SpacemiT K1 I2C.

Why? You just repeated diff and we can read the diff. Please explain WHY
you are doing things in terms of hardware.

> 
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> index b7220fff2235..3d4faec41abe 100644
> --- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> @@ -27,6 +27,9 @@ properties:
>        - description: I2C Functional Clock
>        - description: APB Bus Clock
>  
> +  resets:
> +    maxItems: 1
> +

Completely misplaced. There are never random properties between xxx and
xxx-names.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
