Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2089FD4A609
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 08:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ueU6IA/yt026/zuUwPV+Yl1pmQsFfHPMNLzyTBa6o08=; b=c3CdT2BlG5NAy6
	Ygw3M2IpxwR9ejV1KaKFNmahcpO7vMehqHX9MmTf1IPgKuFtpse3IprXsCr25AH7HhaLki6kBG55R
	jW1/+eAzjwGeWOs9vGE2jh1JzexxysKpc2oUAy81v4u4zDzn5rNyA7siX0kpqBUtHBCrrNnSDHVbj
	Rvu7YDhRAIwLLtXOqBbCY3wliZWTBF3Oif7oSYXTkYpvNzUpg4B8HojBToknEGX3NL7KA2J8If59l
	I/8TXg8OiTJIZQnDHC7Jx7OAtrUCwNGYCfj68Ae3Vrbt0b6nQJf5hTkGIiVtUn0Z1n97UgcBNigLV
	92QFyMDqO+4nzIeyrH2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfdT-0000000Dndg-1zJl;
	Fri, 16 Jan 2026 08:56:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfdS-0000000DndC-1xbi
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 08:56:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E36526016F;
	Fri, 16 Jan 2026 08:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AD1C116C6;
	Fri, 16 Jan 2026 08:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768553809;
	bh=FGueoh0MEGyZiMBtIFEzwKwWYuqylyX82TgCw7GsZQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e4bO/bZfF3dn5MJcYGfb2Xp4kauPUYLI+laA9G9bu0uTo9vehX1LQYdj9iZsE53j2
	 OYedKTzxEMXSyl2fs091UXRyTgsgaUvSMQIdL2RebzNReLnlAjlrOkWHDw3dnCwYjr
	 Cg3qNif5qfY5PzncG1IVFnJRuWYLcFOO8HJAiQXZwNKV5YD1i8ZPJpIR9cTfvk4mdX
	 Pt2TgVAdzXJsI77XfB8O5yjazINwhGm4TBcclgw39ZQAHSq7dMuU49d9HFQkE1QrnW
	 9cBu3ddU30K1zz4Ki81gEpVx0hIVAAi5adMJpMoMMBRI9/kkvttyLLfwVxcwr+QGPb
	 IIAHo4OlFj/rA==
Date: Fri, 16 Jan 2026 09:56:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: i2c: add support for Andes I2C
 controller
Message-ID: <20260116-tasteful-white-hamster-c47e7c@quoll>
References: <20260115145244.435890-1-ben717@andestech.com>
 <20260115145244.435890-2-ben717@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115145244.435890-2-ben717@andestech.com>
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

On Thu, Jan 15, 2026 at 10:52:41PM +0800, Ben Zong-You Xie wrote:
> Document device tree bindings for Andes I2C controller.
> 
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../bindings/i2c/andestech,atciic100.yaml     | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml b/Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml
> new file mode 100644
> index 000000000000..dcbcafc8d6bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/andestech,atciic100.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Andes I2C controller on QiLai SoC and AE350 platform
> +
> +maintainers:
> +  - Ben Zong-You Xie <ben717@andestech.com>

You already sent it and you received review, so I am not going to do the
same work twice.

Version your patches correctly and provide detailed changelog with
rationale of changes.

b4 helps here a lot and you should be using it if all this process is a
bit too complicated.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
