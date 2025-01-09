Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E45E77197
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 09:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/pveI1MGi5FxCFS/LD0RzOrVjzYk0NGw3zAJhkVGPrs=; b=b5QQ/uhBwQ6nSr
	L/KJCS/+w1PFE7WZc6K70rKz9bNRpHgwmBJEuDfz40SweqnZMa0NdZpHENsISfV1jt524fd5FrENm
	PqCMXbITGPpnS7oeGXkp9uWEv1RSmpP8QtO0aoz+r8DueqS72y/TcGZoNwnZQHGljLy/br7anTYnY
	5vPjCq5msEGDgVCCBibim/x9Q84nXhMGuMa0vfcfAMPInU6rQTjYjUnGnvWVzyFi49Qz+dtW5gpqP
	qJ+2E8STMxWsNqCFaiKTWkjEZaZMCMZnMG35TLq5D1Dro76ekfU4dDwcx8nS0SqtOww4fCOiRBhlT
	0dh62kPtyc5RjK7IP3cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoQe-0000000BFim-0LJq;
	Thu, 09 Jan 2025 09:02:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoQc-0000000BFhe-22xh
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 09:02:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 084BC5C473E;
	Thu,  9 Jan 2025 09:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF23C4CED2;
	Thu,  9 Jan 2025 09:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413329;
	bh=LbMP1cxyodyElRexu6bEYIVYMSructjCAywnIpRXVfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANd84GOGtxe66kPVbYuxrO0yRLa5gmhb8R7mKAxzbEjLcbNebETKpPmcMQePUcQdM
	 Kw+7DtrTySPlcrK5QEcI/RV5qSWjAw+FgjiooIi6IUsaTZtmOdlYc9f7C4FU4aX0pa
	 NuqLURUzOa779wC8GOY7R0Va3VDrDaTkMGLJUahvb87RH37xORdLDPelxhHLIAZQrd
	 WtAkvfKQiBSimYHdAMye6LODhNh/jsJKp0kFMVECcK/oPxsQFvUBZBpnm3jn/iPyZq
	 /hsqKgmXC/qYvqNErThm+Cda24+vny/l33xzESibjyWzQaHo3U/2sJfDwAZHYS3RfG
	 t9rJ6JREvCZrw==
Date: Thu, 9 Jan 2025 10:02:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
Message-ID: <nvfvyy7vajbskfn542lxbvfkxuhasmnyni2uudy3cdybzlddiu@u46fcydzgxsw>
References: <20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com>
 <20250108-b4-k230-clk-v2-1-27b30a2ca52d@zohomail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250108-b4-k230-clk-v2-1-27b30a2ca52d@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_010210_564349_13CFAA1A 
X-CRM114-Status: UNSURE (   8.33  )
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

On Wed, Jan 08, 2025 at 07:53:07PM +0800, Xukai Wang wrote:
> +properties:
> +  compatible:
> +    const: canaan,k230-clk
> +
> +  clocks:
> +    maxItems: 1
> +
> +  reg:
> +    items:
> +      - description: PLL control registers.
> +      - description: Sysclk control registers.
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks

If there is going to be any new version, then keep the same order in
required: as in properties:

In any case:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
