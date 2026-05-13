Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B04CD4F21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 23:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6ipAtt0r7tghzwJPNYltvUZd8t9vhh0DX6zMQcLCNE=; b=LrJB9FDLpIIR52
	YqTZkgEaBic06SnLNs5G/6lhMujqDPGFwi6MU2qDVGetXrtdv4TizOBbTfOHstn9YqVYbI96lGoRm
	k2Sn8lX4mnpDzMs5m3v/tkoaPFr8GHOWm63nzn+OWB6BcIROBKJOALREy6ybB8ZHtTuH4GPQsz09v
	uDY2uf756bQTn85J38p/b0SCK56zot4hjRGUPIC3s2qvzvTkxvOKi7wr3EiQ6Y07DH7TLDqzh1sIt
	WrRZejxtPDCR2cz18QsNh3toPcXc9gBeOjNh/czOwuZoHfxe2EfMr1YaIHx4mgPbeaJTmq/h4DKMs
	+11f06o/2isEFGuD4uVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIj6-0000000408J-2r61;
	Wed, 13 May 2026 23:10:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIj4-0000000407k-34bC
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 23:10:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46D0043C53;
	Wed, 13 May 2026 23:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3BCC19425;
	Wed, 13 May 2026 23:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778713850;
	bh=Jk846MFiMF19m2CoB0SBGnaot+k8m6VFTT4plEW0qXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhExjy9di6rnxb1Y3sQJKNj4R08A4HGyIf/500AB0lswPEL17WmGwWGuDsfAEQBVx
	 lqrQzGweduY0XwHxArGVkfKm9K9N3ZF2dgcA9K7/XQdWx6E6Gmh8l+AtetZuaDR0L7
	 OHwEiyUC/8euQTY88pkmlPsSjDAQv+m7qW8IDoz9bJk/sFxeSqNRt37Y7sDDzu5JXa
	 nhOqD9V8Lg4nW1EhLRnfYG+RjT0n5liT/pP4ThG+bhmPWwPE072f9U7h9hHxns6xnX
	 73fJKmWnw6r4fM1dBrEHZN9CkmKYb5l+avrrY9Hox1V7ozKty1n7tu0ECOmk4w0z+V
	 +3eAzlNiey9dw==
Date: Wed, 13 May 2026 18:10:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, netdev@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-riscv@lists.infradead.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 11/22] dt-bindings: clock: Add StarFive JHB100
 Peripheral-0 clock and reset generator
Message-ID: <177871384136.2280607.13312069951345512196.robh@kernel.org>
References: <20260508053632.818548-1-changhuang.liang@starfivetech.com>
 <20260508053632.818548-12-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508053632.818548-12-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_161050_786340_2F074DF3 
X-CRM114-Status: UNSURE (   8.36  )
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


On Thu, 07 May 2026 22:36:21 -0700, Changhuang Liang wrote:
> Add bindings for the Peripheral-0 clock and reset generator (PER0CRG)
> on the JHB100 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../clock/starfive,jhb100-per0crg.yaml        |  70 +++++
>  .../dt-bindings/clock/starfive,jhb100-crg.h   | 281 ++++++++++++++++++
>  .../dt-bindings/reset/starfive,jhb100-crg.h   |  77 +++++
>  3 files changed, 428 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-per0crg.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
