Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A262ACD4F21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 23:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFxmAE3utiwsgrBR2UpLfqocjlUxE9kkqvwnyhlO7zg=; b=Enar0fpsqeiQag
	O5/gmIFMdcrRMBZMN1yPajr8R65FBIzNM8CWhc1jaLMtHS8u539Oj3x/9Bc6h45lsXyFi+FXh9itC
	sloeHSbv3tb01+v63rFxBeCbkDDkujDiy3IpyIPwhwTET8u24tvosD11cWKBiqbLp5J6flnKshfVL
	NmszmipZ25DUeOQg3xtMZmi6I/ygbRt0r5OmM++Lb399e9sN9oji6ZZH1l21XiG1dnkB3IMAlg8U7
	ssAYBDwP90l02liQNw7Sw3GrOdq8BEiYgdh/LjKgdFDTteW6jdVaYFVtwAQy9RiyvJx5sCwvck31M
	+4iJiGqH1iVLZUKlui1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIi6-00000003zx0-1rHY;
	Wed, 13 May 2026 23:09:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIi4-00000003zwe-2FJo
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 23:09:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9E80403B4;
	Wed, 13 May 2026 23:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE03C19425;
	Wed, 13 May 2026 23:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778713787;
	bh=kjUAo1uOW2Oo49mudYiNDfnQY4SZr8+1RxA78MbMIyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c6TPnAKzFqcyGd7Z0pRJZ77LleZGuZ0fwo6JJqE0tYkIUyk5pwr+PIf8W2mGNjiH7
	 3GHXZj7XJuvTPT+pxtAy6+aLj7wKS0iStVX2HerLhyPbEOH3ib34zX/SkCI/wocCJk
	 sfOPZJCI/9YdwlmbeHyvQEVUPwe4xxi8tsO502rYQX6FmlU/k/1pW6TsB+/rv1thxZ
	 rVjFob4zEBSPQcIAeCUs5XniAU+185asL8Ev0hpvdkrl3knht6Q9bQvLhNKAIBdJfm
	 Ei7WT9k3uYGG3aNOBBgrLcNceRaqOm43oF9YjSP4pTO9eZrcHqSQhQMcxwI5XSPyv6
	 TxLhLJxInm1pQ==
Date: Wed, 13 May 2026 18:09:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Kees Cook <kees@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	linux-clk@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>
Subject: Re: [PATCH v2 15/22] dt-bindings: clock: Add StarFive JHB100
 Peripheral-1 clock and reset generator
Message-ID: <177871378355.2279463.2890936397180596400.robh@kernel.org>
References: <20260508053632.818548-1-changhuang.liang@starfivetech.com>
 <20260508053632.818548-16-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508053632.818548-16-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_160948_593225_8F97E0E6 
X-CRM114-Status: UNSURE (   8.28  )
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


On Thu, 07 May 2026 22:36:25 -0700, Changhuang Liang wrote:
> Add bindings for the Peripheral-1 clock and reset generator (PER1CRG)
> on the JHB100 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../clock/starfive,jhb100-per1crg.yaml        | 70 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jhb100-crg.h   | 60 ++++++++++++++++
>  .../dt-bindings/reset/starfive,jhb100-crg.h   | 19 +++++
>  3 files changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-per1crg.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
