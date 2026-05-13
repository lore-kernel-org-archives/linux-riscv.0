Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851A5CD4F21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 23:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cISshR87kFLdS5apv4aFNgM58ZJgVrxGh7F3lBgg24g=; b=bZcrRojPmMLNLV
	pJ+4k4NBRhJBWt7KHUZkBKFvEDbrzpGXlYAx85q2ZiCmPYot3kKvsqfVRVpBANVQoDQVBfoBxiTpH
	A30Ezyv7aT4Tykk1VqU9KSDyA8iY1PawrN7mjGvF4FFY/+iAyzsPHHzjlxAHHBvpW5nianUkzl+Qu
	zx4IujpNyGRpqPZnbm1ycSicMuMqHF/arq00vUcPJa+o/DhNm6FySTT/tRfkPts7Ip6+VpILQOAAl
	I4M81eACBfZ7/NddKksbBhV/HeNqK4lvTpeIKAJaS9BML3t332VhxCmazcgwZ5vBxejFYETYNrtnq
	LTDsRFlH0mudaCGAiacg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIf7-00000003zL8-3F8O;
	Wed, 13 May 2026 23:06:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIf4-00000003zKX-3Umc
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 23:06:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7855942B62;
	Wed, 13 May 2026 23:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0992C19425;
	Wed, 13 May 2026 23:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778713602;
	bh=DlAbAtOk3x6I8PGdX/PgiHRv4Qup6WPVLeUY8Disf1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTkbeQaNHGC1BPlEuISVj2AdP8A07sxaIuOHKiy8+87z1XAT2ZbbLEhclWFKSeG8P
	 /Hd/O5EcpHx2Rc5S3WxjRhg7fm7mIne9ylGYKejlFAb6H9R5oiUz1lMiU6l5NkToHn
	 wIf+z6lkmRWrxRozLu9/DR4JaMvQspjvfuU/WShks54qYOq+etKrPCTLXAE8eWbVOe
	 L3Fmh/tS4OIBQ+WgfRIZG26asLwEJDEquPjaU2snHLKMuJC7iYFsPcSawowTjspCQc
	 1a8gW++rd682Fj0LZ1bG2UCOfbkkjH6E6zeSIJA8pgBRdW4PPKoggCyz9gzVFMHn9x
	 qa5d5OaFNwfUA==
Date: Wed, 13 May 2026 18:06:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: linux-hardening@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
	netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	linux-clk@vger.kernel.org,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v2 07/22] dt-bindings: clock: Add StarFive JHB100
 System-1 clock and reset generator
Message-ID: <177871356173.2271810.4990360775235090390.robh@kernel.org>
References: <20260508053632.818548-1-changhuang.liang@starfivetech.com>
 <20260508053632.818548-8-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508053632.818548-8-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_160642_897321_B5496C37 
X-CRM114-Status: UNSURE (   8.52  )
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


On Thu, 07 May 2026 22:36:17 -0700, Changhuang Liang wrote:
> Add bindings for the System-1 clocks and reset generator (SYS1CRG) on
> JHB100 SoC.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../clock/starfive,jhb100-sys1crg.yaml        | 71 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jhb100-crg.h   | 20 ++++++
>  .../dt-bindings/reset/starfive,jhb100-crg.h   | 11 +++
>  3 files changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-sys1crg.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
