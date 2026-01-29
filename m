Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9131D73E83
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 18:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C8kXy7SJ1HCtlnShPPuKlPXmqduS71+BQth0BTaJ23o=; b=yG843qr6mkBDfs
	AylRYKZ1yqBO4aYip3Wv3SlVIR5aXxkIH52IhMi/S/cwskzNvjslmo8sGrwmHzbMnxn+Up90BowfK
	Sy98lpuIq0sE8Bj+CUgLh+uH1JT947Dcs7B3rJKEh4/OvXn57Au4HbfSXitcnus/Imu9SQLmaHPCG
	kz+kOvXXOyPzZP+qj9tzVtlVn04LkwAb2BiiQLIV6M6hJQJrqtmWIygheia52ZnXWAeClOYZB8yf8
	a1OPs0nh/utnWsS/bVtppu1kYXxOezPLtiolh8WeyZ70ag5Gl7VVODmHybVO5cpiA8RuHKi/RFB94
	UOczCHmq9YtMU8huiiXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWYq-00000000UtC-2qLq;
	Thu, 29 Jan 2026 18:16:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWYo-00000000Usp-2Rrt
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 18:16:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D3D443E42;
	Thu, 29 Jan 2026 18:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43245C4CEF7;
	Thu, 29 Jan 2026 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769710565;
	bh=4DXQDhnPotjP+UKYn76hb5JpjbepnP01qbt9I5JvauM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=anB/Q/jbZNTJ+9hs9D5Hw+dbM8AF5A3/ahakg8HQK18cyX/ISdqRhjY56JdPSE7d8
	 z8tmnFZPr1sOAa1Ix1pEzt4IqsJTXA/fW9jB93ccEDojQbtc9RcO1XjAb2u834CE3v
	 5poZvGKmQkuXFZk+aS1Orib65norHrWzF3VK3ftyvc7vyoAEms/J9y1SEqcH8Fukw1
	 q/SrjR39Nvs/kxSKqmsQ5G3/6v2eZCIvSasGpVNMrL2BEa4/j5Btil28GUX/FzmMgy
	 bOffYtIGplJtqaHSlIZfGmWuYL8PcuG7lW93PU9hUdhQZrre1Z9uyL9blb1HHgiwmF
	 XgYMm5DwoUUrA==
Date: Thu, 29 Jan 2026 12:16:04 -0600
From: Rob Herring <robh@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
Message-ID: <20260129181604.GA1398997-robh@kernel.org>
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-2-2c86b06694ba@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260124-spacemit-p1-v2-2-2c86b06694ba@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_101606_642622_E0A86C38 
X-CRM114-Status: GOOD (  12.25  )
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

On Sat, Jan 24, 2026 at 08:20:17AM +0800, Guodong Xu wrote:
> Add supply properties that match the P1 PMIC's actual hardware topology
> where each buck converter has its own VIN pin and LDO groups share
> common input pins. Supply names are defined according to the pinout
> names in the P1 datasheet.
> 
> This allows different boards to describe their actual power tree
> connections in devicetree rather than hardcoding supply relationships
> in the driver.

You are breaking both forward and backwards compatibility changing both 
the dts and the driver. If that is fine to do, then explicitly say so. 

A secondary issue is the binding and dts go via differ trees and we end 
up with intermittent warnings.

> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: Remove providers from the dts example.
>     Pass the 'make dt_binding_check' test.
> ---
>  .../devicetree/bindings/mfd/spacemit,p1.yaml       | 49 +++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
