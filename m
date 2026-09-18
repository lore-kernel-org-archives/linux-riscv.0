Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC1BC982D7
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 23:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8VfljXc9LPOBBvv95qWB5GcwaXbPf7VeVWfPvIi1YE=; b=QkWWbCaR3goF9n
	fGChf7Fa/s36Wjbg5mABLp7/lQY0m4qo8MLZQNSddRnUSnxZDcT21waRUwX88te0CLrT5Jqu/VTgo
	6lC9apLmW9MXGhw2sKGUuBTphVr5OlrxJKAAKkqmDa8PmSNnidF0Bc253WfhWx0xIFOTWhcuCIAGL
	60lKHserCStY+bd/p2ld78b+rmzT+Vope3UdhBS67kqm0iLquC2BT8sCUbt8b0IHylCV5GdHMd1bT
	vLa/YHyqZVZwk0gVOgMUZxt9eyifNRsv/lvyLZ3nuNDGSzpBBYdhEbP5DljvV1gMHy0unFUDNX938
	qHWY4fUzB6TxNf5vYIjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7iNo-0000000Fina-0Voj;
	Fri, 18 Sep 2026 23:52:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7iNm-0000000FinT-1Tln
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 23:52:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD6F84368D;
	Fri, 18 Sep 2026 23:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDF81F0089E;
	Fri, 18 Sep 2026 23:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789775561;
	bh=p5jg7mO714tQeOGzdfz+HH8eCZQZ4oyz3UFgjTI5s8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ec5aex/8BjNcHpwxRDRttia3QcbJNGP0M33Q7WIzdxztvzrd3IpsIPGmqy5omgXdy
	 VSXVCPetOu312DL7vuYYtTBCDYvi4L06pE0eGZ73CuH9RW+1FF1TBcktlp4eLuxsSO
	 Yo+31zQCFPW1cno0hRsw5BZ6GrbGxDPnERvLatuXKgMZ8OH9VztvvVr5a8iHHfrjbS
	 ucm2Nm2J10FvVj3qCRY0lWauXEt2Vnut90krqihqGXKwfAstkntQQ+iTtsrM0r/6X3
	 yTYN0jmLY2rxzkpcTSARshUS1MXKmSfneCg2UaTsT29p+KRK5TO3Zj2lmSS7VRX7QX
	 1w74NmOcPHpng==
Date: Fri, 18 Sep 2026 23:52:39 +0000
From: Yixun Lan <dlan@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>,
	Bo Gan <ganboing@gmail.com>
Subject: Re: [PATCH v3 0/6] spacemit: k3: Replace bad CLINT node with ACLINT
 nodes
Message-ID: <20260918235239-GKE297024@kernel.org>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
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

Hi Junhui,

On 00:29 Fri 18 Sep     , Junhui Liu wrote:
> When testing OpenSBI with the upstream Device Tree, the CLINT controller
> failed to function properly with the irqchip.riscv_imsic_noipi boot
> parameter:
> 
>   Platform IPI Device         : aclint-mswi
>   Platform Timer Device       : aclint-mtimer @ 24000000Hz
>   
>   Domain0 Region03            : 0x00000000e081c000-0x00000000e081ffff M: (I,R,W) S/U: ()
>   
>   [    0.091014] smp: Bringing up secondary CPUs ...
>   [   10.104917] CPU1 failed to report alive state
>   [   20.118689] CPU2 failed to report alive state
>   [   30.132288] CPU3 failed to report alive state
>   [   40.145953] CPU4 failed to report alive state
>   [   50.159604] CPU5 failed to report alive state
>   [   60.173212] CPU6 failed to report alive state
>   [   70.186981] CPU7 failed to report alive state
>   [   70.191411] smp: Brought up 1 node, 1 CPU
> 
> Through exploring and testing, I discovered that the K3 actually
> provides all three complete ACLINT components, and subsequent
> confirmation with the vendor yielded the following information:
> 
> The ACLINT register space is mapped at two base addresses: a secure
> window at 0xf1810000 and a non-secure window at 0xe0810000. The
> secure window exposes all three components, while the non-secure
> window only exposes SSWI; the MSWI and MTIMER offsets are reserved
> there:
> 
> +---------+--------+-----------------------+-----------------------+
> | Offset  | Module | Secure Window         | Non-Secure Window     |
> +---------+--------+-----------------------+-----------------------+
> | +0x0000 | MSWI   | 0xf1810000-0xf1813fff | 0xe0810000-0xe0813fff |
> |         |        |                       | (Reserved)            |
> +---------+--------+-----------------------+-----------------------+
> | +0x4000 | MTIMER | 0xf1814000-0xf181bfff | 0xe0814000-0xe081bfff |
> |         |        |                       | (Reserved)            |
> +---------+--------+-----------------------+-----------------------+
> | +0xc000 | SSWI   | 0xf181c000-0xf181ffff | 0xe081c000-0xe081ffff |
> +---------+--------+-----------------------+-----------------------+
> 
> MSWI and MTIMER reside in the secure ACLINT space, which is only
> accessible through the secure window; their offsets in the non-secure
> window are reserved. SSWI resides in the non-secure ACLINT space,
> which is aliased in both windows. However, depending on the eFuse
> configuration, the whole non-secure window can be inaccessible, while
> the secure window remains available.
> 
> Taking these constraints into account, we use the secure window
> (0xf1810000-0xf181ffff) consistently for all three ACLINT components,
> as it is accessible regardless of the eFuse configuration. OpenSBI
> protects the MSWI and MTIMER ranges from Supervisor-mode access via PMP,
> leaving the SSWI range available to S-mode.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
> Changes in v3:
> - Correct the accessibility description of secure and non-secure windows
> - Drop spacemit,k3-clint from sifive,clint.yaml entirely
> - Move SSWI to its secure-window alias
> - Link to v2: https://patch.msgid.link/20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech
> 
> Changes in v2:
> - Drop the generic riscv,aclint-* fallback compatibles and use only
>   SpacemiT K3-specific compatibles.
> - Match spacemit,k3-aclint-sswi directly in the SSWI driver.
> - Squash the ACLINT MSWI and MTIMER DT additions into the patch that
>   replaces the incorrect CLINT node.
> - Link to v1: https://patch.msgid.link/20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech
> 
> ---
> Junhui Liu (6):
>       dt-bindings: timer: thead,c900-aclint-mtimer: Add SpacemiT K3
>       dt-bindings: interrupt-controller: thead,c900-aclint-mswi: Add SpacemiT K3
>       dt-bindings: interrupt-controller: thead,c900-aclint-sswi: Add SpacemiT K3
>       dt-bindings: timer: sifive,clint: Remove spacemit,k3-clint
>       irqchip/aclint-sswi: Add support for SpacemiT K3
>       riscv: dts: spacemit: k3: Replace incorrect CLINT node with ACLINT nodes
> 
>  .../thead,c900-aclint-mswi.yaml                    |  1 +
>  .../thead,c900-aclint-sswi.yaml                    |  5 ++-
>  .../devicetree/bindings/timer/sifive,clint.yaml    |  1 -
>  .../bindings/timer/thead,c900-aclint-mtimer.yaml   |  1 +
>  arch/riscv/boot/dts/spacemit/k3.dtsi               | 43 +++++++++++++++-------
>  drivers/irqchip/irq-aclint-sswi.c                  |  1 +
>  6 files changed, 36 insertions(+), 16 deletions(-)
> ---

For the series, with my

Reviewed-by: Yixun Lan <dlan@kernel.org>


-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
