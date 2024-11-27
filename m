Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BF7D609AD
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/QSNFPEkdeBhfJhMPi6hgwTR1ikGkRv2+JDDt9hQHo=; b=UQ632PtmQnd5Bc
	BQtnGpMGeFJ/hImBYFVF2CuqCgr0JxYN6dBQxYJNzZe9EuJjhNJWRM0Aus+LWL9lvRABvEwrSmQbS
	70B55/LivoO9Cvh7tuPr8EleCe0l/9HoDy7Lz0Q+tJn2tsS92b9u4BtRbWFwpJ67E58hKVZ7O/rAT
	SLOcmD6FL+vv52S8a8qoMpBnBYip9aYzqWztUCkou1ygW8MP/OCCIOQxzlyPILH3xq+/zpI1aHUUj
	elZZOSJrV9XTeM/APaLISB41TMkZs52bXQLUEKgKGhxj0NdBz77gyU93QKu4CygWIQifnYmcwW2zv
	x0+D32MUoOaP/IOjBb3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGD5H-0000000CXAx-3eoE;
	Wed, 27 Nov 2024 08:07:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGD11-0000000CWNf-1t7J
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 08:03:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C31A5C5DFD;
	Wed, 27 Nov 2024 08:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCFC3C4CECC;
	Wed, 27 Nov 2024 08:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732694594;
	bh=hj4+4Ezmbqfp1vJnsXREN9jO7XtVqXtz2wnGr9Mc2kY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwqLy78ws32w5NA9fdKVRy0XL6UtXfSMQ1zuA3+KNZzfhomF0O3IrxfdauFhVzweL
	 d/LiFaHU6JfEwOPQom8SZt4B4fTtGzTSIQY1xJvVEO28bx5MWGOpjB39J5SGMLLiAq
	 MAKVWrdk2GUbBQCpYtgQIcmS3fZVcoG68wG1DVTjfbmjuRrX5aLD4/agvLXS+9F1bB
	 9K6w3jo6hfzX2E/VGvP70dZhm9RfB9SWwkUcB2IQ3qDuW71JHa5UwsTLTuXgIrnvhc
	 VUxq+p0LgxYhT6VlEb/u1564Lku77MLfkJ+ArRG8QaskwUfAofKMfBLPl8kzjfNa3p
	 f0THhjq75CDHg==
Date: Wed, 27 Nov 2024 09:03:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: spacemit: Add clock
 controllers of Spacemit K1 SoC
Message-ID: <hgtrinu32q2jtxb4z5nvjskjlkwwzxhymtf3alvaxlbqxrbzd3@2rw3uy2tqgnf>
References: <20241126143125.9980-2-heylenay@4d2.org>
 <20241126143125.9980-3-heylenay@4d2.org>
 <64bf96a3-e28c-4c47-b7b3-e227bbaa7aee@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64bf96a3-e28c-4c47-b7b3-e227bbaa7aee@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_000315_529738_A46EC369 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

On Tue, Nov 26, 2024 at 03:48:33PM +0100, Krzysztof Kozlowski wrote:
> On 26/11/2024 15:31, Haylen Chu wrote:
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - spacemit,k1-ccu-apbs
> > +      - spacemit,k1-ccu-mpmu
> > +      - spacemit,k1-ccu-apbc
> > +      - spacemit,k1-ccu-apmu
> > +
> > +  clocks:
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: osc_32k
> 
> osc
> 
> > +      - const: vctcxo_1m
> > +      - const: vctcxo_3m
> > +      - const: vctcxo_24m
> > +
> > +  spacemit,mpmu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the syscon managing "Main PMU (MPMU)" registers. It is used to
> > +      check PLL lock status.
> 
> Why your example does not have it? Example code is supposed to be complete.

I think I understand why - this is for only one variant? But then this
should be disallowed in your binding for others. Currently your binding
says that it is required for one and allowed for others.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
