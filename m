Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20459CD37AC
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 23:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7umN2uqpIIXItyURUuNmRY/LO+HZO+UFa72KAwEASh4=; b=KQzr35ztU2z9jJ
	WcOHJxF+zdOSLS+JwrKhjUOI00XzNuaAPMQwLTZl1WIwaFCb5b/b2PDeBM970Nxlbb2OcpP7fGDfJ
	KkzaK3ZtGgKj1ml16yOJr7TaIrFRdugnldcG0CeYDcIT9LAcbzBsqqi9RChltZsOEjBunkMQPqMO+
	jZPMGiLG7imyaLX/cPzNtjDISDphl/BaPh3MH9yWsnzDw09o5tMcpkYaidvTD1B5453884Agy5bpu
	+z6fsKjAOpuz/DEhQKBWHiX8qa+BoGNOsb+IdbEdvKf1mUvrgGxUHmQHVQVvRGSfnJCUbYVmW6Msr
	W1gfnu9o5Nk3tz5CwcqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIhI-00000003zph-0z24;
	Wed, 13 May 2026 23:09:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIhF-00000003zp7-41oO
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 23:08:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29CF940A94;
	Wed, 13 May 2026 23:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43648C19425;
	Wed, 13 May 2026 23:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778713737;
	bh=D6bD9ihndQ7HnnIizWApF3388IXWv0B10nh9ibhu9wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h+u9yfW37hi1uHOXGYL36u4RWpfBvTDv/FOr7LqL5sg9XQ5+jb3eMMdtSLWATmAV6
	 GwZl/LO0jrxnI1OxgntQbXqh3OctiwORu+v47Ri5aq3IYs0LpJ6c498gn+7zMqzDiJ
	 NuWUlNCP13Z8olSU7fEVJ6lfz0Tbc7eytMK2YvgnU783Q4hvxHLfK8higCkHvikh0r
	 TeOLooV0sHJgqAtMqcRLKBw4+ZfWYtDTVRqGGXWRPqzeH5V1eMGR/ZEMxw0Mscit7t
	 gxUMVygeTm/Ok0tEqwyyT5yoX3Ajd1/Y+Cs28SDQUMuV4QP19kagMYcWbHBvU2xQCB
	 3dQ0VwLSibo+A==
Date: Wed, 13 May 2026 18:08:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	linux-hardening@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>, linux-clk@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, netdev@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v2 19/22] dt-bindings: clock: Add StarFive JHB100
 Peripheral-3 clock and reset generator
Message-ID: <177871373279.2278435.14464810348159113928.robh@kernel.org>
References: <20260508053632.818548-1-changhuang.liang@starfivetech.com>
 <20260508053632.818548-20-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508053632.818548-20-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_160858_021514_CE38A272 
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


On Thu, 07 May 2026 22:36:29 -0700, Changhuang Liang wrote:
> Add bindings for the Peripheral-3 clock and reset generator (PER3CRG)
> on the JHB100 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../clock/starfive,jhb100-per3crg.yaml        | 76 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jhb100-crg.h   | 35 +++++++++
>  .../dt-bindings/reset/starfive,jhb100-crg.h   |  9 +++
>  3 files changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-per3crg.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
