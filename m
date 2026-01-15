Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87909D44C6F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 16:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VCKzCu1SP4dq1l0rxWneahdmM0HnSd492sSboX5r0g=; b=hIGRhzxGfilGUj
	ucvxN6h0uTvoNmJaqVlInvoIDG38CfJS9qV8ourvhTWvz7lkT/9E+OGKgFqaaUwDBzze/ZllSWf4i
	+r/C/cWfJvRunnpCTIAnAKsCFLYJ45Ayslv6EPYI0nmmSR15IePntdF/A1kOx2F1c/a10Vnh+G/EZ
	t/HeF/40JrasBbchR+jfgZWbomAWfSq4A3SAPjv4OQlcgC7CSNFEIuMqsnU5TdRH6PXUyO4sLwIZk
	kDSGRlUzunMhBqEiZh0G2czWNlgXvXI1tznec/CI5pPDToHPu6FKr1vKQbuggxt5XeJbHX8g0IGTY
	RLfAuiSZQH3D04ut9Nwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPo1-0000000CdIl-3oxS;
	Thu, 15 Jan 2026 16:02:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPnz-0000000CdIQ-2WP7
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 16:02:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AC2C40E14;
	Thu, 15 Jan 2026 16:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E9EC116D0;
	Thu, 15 Jan 2026 16:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768492958;
	bh=9jQK/KV36GdLIy4VOJJ7i40Wd+Nl5CXsDfIILMRvP5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=topd3R6wOUynel1xYRzH4WRx2OLdAR1bYlYlOzRCtqPc+Pc63QW3x5ob4So02xO/K
	 fe/xFZJ4GLcEyqjR1gsjJHiL5N8Bg43n9pYeeyhyNJ+caimEXW+qlxQnwjv1bL35w6
	 14pWcegAtBlbYkcvG1EqkokvHCUJF/YaWQQ5b23JV83jZSiQhNRDlcB8GT9bkefr+Q
	 byTx8/ANNkMdm2h80bp2KaUQ7ZFfaOOd4jE7DrCU2VMDV6+4z9qJMzuPY7PcpCG57l
	 NRYpmcbQvL9Ug5IFL4y6rWZGY+wphWmE3I+wUatyHTzHVcmsjSOkwdObq0t768XGyB
	 jA1WuTLpQ0dqg==
Date: Thu, 15 Jan 2026 10:02:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <pjw@kernel.org>,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: spacemit: add syscon
 property
Message-ID: <176849295668.693144.16118634517088023109.robh@kernel.org>
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
 <20260108-kx-pinctrl-aib-io-pwr-domain-v2-1-6bcb46146e53@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-1-6bcb46146e53@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_080239_677908_FBFDC424 
X-CRM114-Status: GOOD (  10.64  )
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


On Thu, 08 Jan 2026 14:42:38 +0800, Troy Mitchell wrote:
> In order to access the protected IO power domain registers, a valid
> unlock sequence must be performed by writing the required keys to the
> AIB Secure Access Register (ASAR).
> 
> The ASAR register resides within the APBC register address space.
> A corresponding syscon property is added to allow the pinctrl driver
> to access this register.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v2:
> - add `spacemmit` prefix in the subject
> - remove offset in syscon property
> - remove `spacemit,apbc` property in required
> - Link to v1: https://lore.kernel.org/spacemit/20260108042753-GYA2796@gentoo.org/T/#m2ab46cd63cbb1b110eb317ee5b9d540d39cbd82b
> ---
>  Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
