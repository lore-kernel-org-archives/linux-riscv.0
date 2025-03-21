Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55516C3600B
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 21:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDqHVQDN37ZH4RIFRA34clgk6F+Se1GfmCYgVN/TQrw=; b=Q9Bf06/cjU1dvL
	28jLUalZQsiANTdDaMkaphnf8JWgOvKJpMBtB/9QnOb9M0tftsahXpNlE/CpNIB++0FdY7rCS3EBA
	PcYWJk+TMLoqUMaE8wHBiQCuYJZmExkL7EswVEbWYKnrPeKCxpSyJtaA7PiGXwpfb8Wqx06f7cmSS
	Y5isFX0WqKbWwsHtj1l0zcpQYV5OJdpdEh9VGcFSnXMv7BHEEc+Zx8ZxvbbfPJkZJiEwghDxItY5Y
	4ZIpm54ol+OCGo0rja9bxaTAXRW0CUyn24sL4QtzTUoKWVgKSv+SqzO6mo/qsEY0Sy746c3yApBsU
	V9TrN37e4hc9YZA1+85A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvkKN-0000000GPuy-0JkZ;
	Fri, 21 Mar 2025 21:54:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvkKK-0000000GPtm-2K9W
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 21:54:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 46122A48B4B;
	Fri, 21 Mar 2025 21:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B452C4CEE3;
	Fri, 21 Mar 2025 21:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742594091;
	bh=ST89ptphulKjZHhKBjFlDo2o2KSI8FUPiuo7L/N9YQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArM5ztOW6vejfrtGII/jYjuX0RAXxiNjqlXEOAbD5FZJYGyOrb5eqfL/YkahlU9P7
	 r3PSG4nekLZAXEbpzTdwNiGcAuaZeutEuFhZlZ6WLX8xEgul9010c26IEJ39C4HwJM
	 JWDWvGAo/jGJKphL0O+Em8gdlBsaQGQd2RF6WSgvLgQq6xhUXjagaZ8tFU6Fb9ymzx
	 rIsizMoVNTghu3FmS+1iawjyNbTMtK6VqlFPUHjaZH04d9EUpoVfQbcePmZ+O/N8E5
	 9ZOkK+f0tkZausZH3skYBoR+7wzTnS7XQNhgveoHNL1Uat3nOr7hRXNfCY2StsJQJo
	 YEEwTMsfxcbmA==
Date: Fri, 21 Mar 2025 16:54:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Conor Dooley <conor@kernel.org>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-riscv@lists.infradead.org, Aradhya Bhatia <a-bhatia1@ti.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Min Lin <linmin@eswincomputing.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Albert Ou <aou@eecs.berkeley.edu>, rafal@milecki.pl,
	Heiko Stuebner <heiko@sntech.de>, Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>
Subject: Re: [PATCH v2 04/10] dt-bindings: riscv: Add SiFive HiFive Premier
 P550 board
Message-ID: <174259408740.4183990.13657262859263435933.robh@kernel.org>
References: <20250320105449.2094192-1-pinkesh.vaghela@einfochips.com>
 <20250320105449.2094192-5-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250320105449.2094192-5-pinkesh.vaghela@einfochips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_145452_658956_6880B537 
X-CRM114-Status: UNSURE (   8.77  )
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


On Thu, 20 Mar 2025 16:24:43 +0530, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
> 
> Add DT binding documentation for the ESWIN EIC7700 SoC and
> HiFive Premier P550 Board
> 
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@kernel.org>
> ---
>  .../devicetree/bindings/riscv/eswin.yaml      | 29 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
