Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F15C369D5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 19:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUxl4BWniKCZxjPmQkoR4ocmk9lV9UKDM+J38kkEcts=; b=byGdpmshJyd9RT
	1wRV1Ylio7IwT1GPNUUBssaGf3E3WIIsjPlTkDEs02MQsrXfK0/Uou5cqjQj4aXStgMAMxVO8Yu60
	gMPTTkZnozHyxvnyrGw7VBsGgR1w6gbMPuFQQjoXMJu6inx4MO72mpos7rPg8JM5puYXsb5f4eyNs
	kVywI6bPDFrnq4VsTU1lhuNuaJYvw3glzyW627VBXX9Q5KiTM5H4a7kGc8iR6BQ2MlF66MljJ6Qga
	5T5lEr0BCsqLDpTGrB1P8vYxB6XE0X0b+5Y6E7+zLzsihQH8DKzfeFEY5vt8/KWNTAaLwJVhF+K2H
	8UV/OXx0I+zYwcBPHc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wY9-00000004zvV-0Rsb;
	Mon, 21 Apr 2025 19:11:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wY5-00000004zuN-33Ba
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 19:11:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D67DA43EF1;
	Mon, 21 Apr 2025 19:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF655C4CEE4;
	Mon, 21 Apr 2025 19:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745262681;
	bh=h7Ge3JqI2gUvZQ3tKqKvk1UQ6gAx76a/Wgupd8InyfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bbC0NnAizemZjXaq5L97y59y6hQNh6bjPjqf/2hSnifbBDjzWQaw1oFn8tBxaA+yU
	 ad5lMhd4r2JU1ZbjD0Xps/X2EB0fAmbj+umO45aoiza5/R048EkZ4XSvktgbyqe/nT
	 E1jieRne9VQDbWeWT2bWnTFRhW5/svlmVpordBRXe93kIWIHWRBENvN71qJ/Wj8YQ8
	 Nt7m5jHUwB9aukmeG/tXfpOJGfpQb7QO2KPLoTFqyWtinOJCfSmfqMzaR9u/yWqYGQ
	 Y43e2dcVQvNojJ06XC79rePdJn8EivPj/uv2ayDYD40b3OhA09+Nsd6Hdi++//CTzM
	 agu1CAVkTFGdQ==
Date: Mon, 21 Apr 2025 14:11:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Conor Dooley <conor+dt@kernel.org>, spacemit@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: spacemit: add clock and
 reset property
Message-ID: <174526267847.2645979.6771559999426063209.robh@kernel.org>
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
 <20250416-02-k1-pinctrl-clk-v2-1-2b5fcbd4183c@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-1-2b5fcbd4183c@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_121121_781374_DC593869 
X-CRM114-Status: UNSURE (   7.62  )
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


On Wed, 16 Apr 2025 08:15:27 +0800, Yixun Lan wrote:
> SpacemiT K1 SoC's pinctrl controller requires two clocks in order
> to work properly, also has one reset line from hardware perspective.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../bindings/pinctrl/spacemit,k1-pinctrl.yaml          | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
