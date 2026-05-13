Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42D5CD4F21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 23:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wv9v4X1u4UeWSRo9qTGetHwFl+7gfRlMVWXap+ikNEc=; b=IHxyDIFJ5Qt64g
	Zyy6Mw3cPmixv0tJVaYxSfRnubINNk59FS7gF2i+JtmaMq0EP8c8nMnF9zsc/sVOhDbyDNUtMDwiI
	p3RrCIgL1ixw7BmXAVPEb4QIVr8mGY8Bnvwnm6TENnnzrGjKk0RfWDSVA1sMM13rWqj2uwFVX1uC7
	7+OMKtBLlqVPz+4nX2QTDkQRPQTbTwar90Nlk9vCQ79hAOcX8lbRmZkaJrbDu8WSIRiiSn3b762/g
	Sxtjg6Q7rI0Q3rm0Gs+1WTgkKW75Rphe+cQ2dJcWgvcs+tBgG/cus1sU+SgDkgMEuueGg3CiUdx99
	RSFmU9SlGEulrlk/KsZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIgS-00000003zh7-0PE6;
	Wed, 13 May 2026 23:08:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIgQ-00000003zgQ-2Tnh
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 23:08:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24E6D401A9;
	Wed, 13 May 2026 23:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA98C19425;
	Wed, 13 May 2026 23:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778713686;
	bh=YOx5S+WMlC2TiFkDOXGAXO69J0hp9pP8PzJFV3ILM6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sXLc7dTSbKXJC1jjz6deJLApBQj3vUvPUCCdX992sxhcVK+u2hxmG42CAL21gfEpB
	 vxJr1MkHpnloYFmsVHAra/jmlWTQHHYVwKh9C4Rr+O9MnQjU5YhhWqP2OS0TbGqMtz
	 61abOa61pSryxXjkgRtwFzFHN/V+sXvWLso536Ee37I0YeD2vlvaHux/sOsYL5ombS
	 X2vORTBVZ8bfsbj7bO2M/wCsYQQIljDdE/sJ3BiUXGvLu4ZycRxdPSAPbmWULfaNC8
	 8CvYgJ0uGaaimwfkkE6LNFfNfjvVY9unKJlMXEZgm5NT81IMZJqXTHAfD6yj1j/X+c
	 2ZKDmCftR2AvQ==
Date: Wed, 13 May 2026 18:07:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
	Kees Cook <kees@kernel.org>, linux-riscv@lists.infradead.org,
	linux-hardening@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor+dt@kernel.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-clk@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v2 09/22] dt-bindings: clock: Add StarFive JHB100
 System-2 clock and reset generator
Message-ID: <177871367651.2277166.1596733708637773220.robh@kernel.org>
References: <20260508053632.818548-1-changhuang.liang@starfivetech.com>
 <20260508053632.818548-10-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508053632.818548-10-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_160806_651254_3586448E 
X-CRM114-Status: UNSURE (   8.41  )
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


On Thu, 07 May 2026 22:36:19 -0700, Changhuang Liang wrote:
> Add bindings for the System-2 clocks and reset generator (SYS2CRG) on
> JHB100 SoC.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../clock/starfive,jhb100-sys2crg.yaml        | 64 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jhb100-crg.h   | 33 ++++++++++
>  .../dt-bindings/reset/starfive,jhb100-crg.h   | 25 ++++++++
>  3 files changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-sys2crg.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
