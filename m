Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73036CD4F21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 18:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCLgr+bACzlaIrAvb4xcnZvjBEdkdAbhWoQzHYO6h74=; b=CFvNjAkIlK+oAc
	D0YyvdQAHYIOrU2om0pA5/FFd3hfshoajByfRHq7zeGaLqCth85/z16ciRqwIATuNM093bG2pMLQg
	6+8VG2aip9GCEWYEiXMtNlhQTmCoOBtKw0i6cRq7eyltdE7qTu5tJA/UgrKcFzNnXWpxpLlcpC+93
	jw/zky2IFNb6Ya4zFoM/sQl1ilmiFS+qwZgqe/2Gp2h4Mk7jZcVQ38Uh0SNfTn4sOosGIfLnkYZ8q
	Wn3sueMW0BmeRgPmcvyNwZv437EbNjnyZec5GJChlbZdddlhlF00PfiEV+9ENjDDAs2izgl3WkRUK
	9H45EFSv+NwhDOa4F3sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNE8s-00000003ReR-3FFO;
	Wed, 13 May 2026 18:17:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNE8r-00000003ReL-2cUQ
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 18:17:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5038600AE;
	Wed, 13 May 2026 18:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5907CC19425;
	Wed, 13 May 2026 18:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778696228;
	bh=8lUCpu13LdXETtCrAQtNDxFk7/U/7lAiLOcmxhV9DEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HSYyhl/1y9Fos0glEOGf3E3oIACLt7cJ7trO4QsSy89oUEVJoUAcSl3MQFahy9fq4
	 Jr1crEuWDRo4pF12pSAFrrm2q7LMPZ3p/yRomgk4TaYNkbLwldA5p5dvsopXom/rWt
	 eR5eZ5ZZ557udlPFgCt6OWt+O1MPPny2UqvEiabq5MJ4DYCMHy7rlrh0+JzjZZ/5/1
	 qv9QUMBCO+O53I9oqh80bKnbdpJQvn2jLWhp8X38QeqFtuHGgSFgsjgYuP5/sBdPNa
	 IMI2oXCGHeBq6Grb+PSC69bIFntyzZ1QyTwS41OK87Al6nSHBNmcJpxs/id/5QQZS8
	 YDvnb0Rb9eP8w==
Date: Wed, 13 May 2026 13:17:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: riscv: Add StarFive Dubhe-70
 compatibles
Message-ID: <177869622508.1560594.4871020257306916510.robh@kernel.org>
References: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
 <20260506085937.754808-2-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260506085937.754808-2-changhuang.liang@starfivetech.com>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Joel Stanley <jms@oss.tenstorrent.com>, Drew Fustini <dfustini@oss.tenstorrent.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, linux-riscv@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Hal Feng <hal.feng@starfivetech.com>, Guodong Xu <guodong@riscstar.com>, Yixun Lan <dlan@kernel.org>, Thomas Gleixner <tglx@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, E Shattow <e@freeshell.de>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Junhui Liu <junhui.liu@pigmoral.tech>, Daniel Lezcano <daniel.lezcano@kernel.org>, Michal Simek <michal.simek@amd.com>, Paul Walmsley <pjw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Michael Zhu <michael.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Wed, 06 May 2026 01:59:34 -0700, Changhuang Liang wrote:
> From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> 
> Add new compatible string for Dubhe-70.
> Dubhe-70 is a low power RISC-V cpu core from StarFive Technology.
> 
> Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
