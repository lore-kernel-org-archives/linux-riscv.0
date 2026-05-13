Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A4DCD37AC
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 23:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUkdJ0ESighH/msnQlHcnF8OI+TyNGKFh1vIiNquFzs=; b=CsWdyAsJl36aKD
	Yme3WjRrfe1Trvz4cUrfp2lKNZSrfz3G2yIHvTF/tPf8jCRLS/mmuJTTUbSE/QaGd1/tD8CMt917f
	N86bPqtluFeLiv9o6TWpV7x40h6xkaAF54z7y5F7hn0jMOTfvs1w2KJkuPCYgpXotp2Xh24n+QVJ0
	5WwtaHSvGYL9vcW2Atq08Y4DCeM0FfRXmrskHprzGH7MJPNcRpCXeSe4+B4C67m+P8xkuHeUXsh3n
	Pc6z1kQwBqObmzrt1NWqmJhMJqZrPYjU1Sr+L92b4AxrD8aIqKG54KSZ4ntwa18q77JUnwpb78URU
	grXyxeG8fuKpxi2NyoUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIdE-00000003yvq-2IgV;
	Wed, 13 May 2026 23:04:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIdC-00000003yvM-0KIO
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 23:04:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4491E4441C;
	Wed, 13 May 2026 23:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC899C2BCB8;
	Wed, 13 May 2026 23:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778713485;
	bh=1NCqOweC+UK62RewVsRZJmMrxaZ1Ds/R8sTtQ78tUsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lxGEMfLsm4v9Xu3yCSKa0H2Is1j0wcYV16m1h+VdgMBnVAwSXZMCqx7JhrPQr+7mt
	 XCc5oUBVJ7aTZ2vgWFuA0ObdGG3uX+ChenJbAtCZ69pNY7c4g0ZJbG/UvMUqzslk5Z
	 c/V33mTEXusHzPlGzOaB3PGU1p1kLwIS+ZKV1NQgsnJeV50ME6LvnX7yxZT1qUu4ll
	 pR7Ad+qw5FPk5rB8Tg8WeBy3JhCykE57Vx/r4/kZzIGWGwkZ87t1E9Z1BQxpHI2p1O
	 JVSW6ar5Qc1c0DyvelNI/POIurtJOBnOWCrdtPejS92ruv0pBcP3rferCwrO0An4/i
	 4NP4O5hii9u5Q==
Date: Wed, 13 May 2026 18:04:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>, linux-riscv@lists.infradead.org,
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org, Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-hardening@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 05/22] dt-bindings: clock: Add StarFive JHB100
 System-0 clock and reset generator
Message-ID: <177871348127.2268038.7602334271090264888.robh@kernel.org>
References: <20260508053632.818548-1-changhuang.liang@starfivetech.com>
 <20260508053632.818548-6-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508053632.818548-6-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_160446_136599_0B5DFF19 
X-CRM114-Status: UNSURE (   8.24  )
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


On Thu, 07 May 2026 22:36:15 -0700, Changhuang Liang wrote:
> Add bindings for the System-0 clocks and reset generator (SYS0CRG) on
> JHB100 SoC.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../clock/starfive,jhb100-sys0crg.yaml        | 63 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jhb100-crg.h   | 56 +++++++++++++++++
>  .../dt-bindings/reset/starfive,jhb100-crg.h   | 28 +++++++++
>  3 files changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-sys0crg.yaml
>  create mode 100644 include/dt-bindings/clock/starfive,jhb100-crg.h
>  create mode 100644 include/dt-bindings/reset/starfive,jhb100-crg.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
