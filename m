Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834A4C35FFA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 22:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hO5Do/2BcWPNv1htePxKOGjep2iYQqGu3jlhnAfrZKE=; b=l9CI/qyk1YIQrg
	cK8Mu9jEDNsDUZ4BB/N7X5Nx0pvPCQp+Mlr5KZwza+0XYIJc057ByGQ2nQcEgJaWcB8kWi4mc7E0G
	pQrM/RCwgt9zHyhB2tgDfR2Yk3N2xmh1KKuIq9GHe/U8ILV1VoqrN8Q3MF8SFmHB9Zhx+C9/4i8V3
	wak4Ie+Qe/N4zPwA/tQc1dO7i6Lcaoge/1JwgtZtdFOKGLsuzZiO/Sk3cNlszB0GRENOkyad3D/v0
	1XSIuOqHX2GE1dlwDdX1LaI+qsFFay5xpz1y6sfwbXYJwhxxeuZxVrz/EvHon9ptCsqVPIWAVL4IS
	nRHjFgCW6K5jIqpXy3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv20Q-0000000AIkt-0hzB;
	Wed, 19 Mar 2025 22:35:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv20N-0000000AIkW-2zFH
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 22:35:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1FC0434B0;
	Wed, 19 Mar 2025 22:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3E6C4CEE4;
	Wed, 19 Mar 2025 22:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742423719;
	bh=A3iFvLtzRQh3dCCRxhX6u7YQ8Gd1PwoaAxY//GmR/TU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VHURJnhCKSyrVQ20KD3r0sewq8kKaaO367PBbxMkBo9SGGZ8/1Mjl2vcTss/1dENx
	 C6g1t6n8dEZxREdpemXmfcs4lQUcHsq/z1FR/0Y+3uE5ZPGaM3jRIxQvpjtSeeIeK6
	 L2ZKXw0ViST+8qX4SlyBRJAww+EiMFSgF/nG4ACH92iTQm5RstBdIxM8he1u/VnYai
	 eS+gh+LTJv2QyYaY0R7OO7JJzWmmwPZviIX0l6+tnGC7rRfeHmDN1CllPSeHpwI6F4
	 pYuNSq9k284eA6rDy78Gwzu8iTSsL87hU9uyfOtQvqGuwy4E8dnh7LlFOpSLcEt/r9
	 LlSHIEnR8MAJg==
Date: Wed, 19 Mar 2025 23:35:16 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v8 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <iyefoqhlel7dwupjiidn2hcibkk6ooxcwpyjrb53f4tzup7r4v@2pl42nbgifof>
References: <20250319-k1-i2c-master-v8-0-013e2df2b78d@gmail.com>
 <20250319-k1-i2c-master-v8-2-013e2df2b78d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250319-k1-i2c-master-v8-2-013e2df2b78d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_153519_768033_D10DC79D 
X-CRM114-Status: GOOD (  10.21  )
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

Hi Troy,

On Wed, Mar 19, 2025 at 05:29:00PM +0800, Troy Mitchell wrote:
> This patch introduces basic I2C support for the SpacemiT K1 SoC,
> utilizing interrupts for transfers.
> 
> The driver has been tested using i2c-tools on a Bananapi-F3 board,
> and basic I2C read/write operations have been confirmed to work.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Link: https://lore.kernel.org/all/20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org [1]

please, next time don't add the Link: tag here, I will add it
myself via b4. The link is not even correct.

I think this confuses b4 as well.

Anyway, I merged the two patches to i2c/i2c-host.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
