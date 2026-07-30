Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51545C54FDF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 08:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0DgVaR8xYVF2dHsvSA2JEa4bgtrYv3tYAqWT4kpPvJw=; b=vFdkoRnfvHtL7s
	1hwr8JWGkZ6Gg10uoGG13Pu9itdKX2JVoD0gRXIuiOjO914NsJBRc9yKpw5VoDB/XJf+NV7070D9a
	xutC3C2bYo3Y0DGPPqE/lyckcqU/VeJPK0YZAZFlh2vFMEW32Z6TGAhG8kOdW3gIJMsaoMXKARY5U
	hve8dZ7/KK+cLduT22Fm5IQJHUbn4g0z5HNvDO6y+zC0pqzTRHNYWUgmyKal7vMGKWgQFAzBnD4Y9
	4szHOVLHQHRWIM3rQoK9HY+OhlfT4eBsVTW2kkQch4orWnr2+XakdpYITM/S4knIVEeDXUIozLuz/
	OHPz4c2ozKY4cRaXRJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpM45-00000009qqb-2hwy;
	Thu, 30 Jul 2026 08:24:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpM44-00000009qqK-1yGw
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 08:24:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 128234073F;
	Thu, 30 Jul 2026 08:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2851F00A3A;
	Thu, 30 Jul 2026 08:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785399868;
	bh=tcJa329W3/e6mUiBMBCdmFBaRvkhjOBRJYVoU6ghT5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T52BarienqBSQp1RDkFSz8cteddwXzZFIyji1BBlWcXWtG/f95dqPzuI2LiOnxKTw
	 gYGRtbUKScrl137mLfqJs+D6PmDbeCdeyzXz1cC0B8DWtj2t1MRJEV3ApVSiz9qT71
	 ipwnwlez/SESwfBCgZqpRZeImxqrUSX3RdNLzdKs1oTEMkoo93GJ5y+M1IYOpG80f8
	 bCXenr88Zs721qFkCZgSq00N5nED46PN2tUw6bKVjo67hh5tMSc6um5p+dHIk/0Jja
	 /HszVFGCO7fkpxv90QkcwNRRgT6hP7BAy1MkdQG+prk9tneBSMqmc42/66xNr9srE1
	 hkVrJ8NXVd6Aw==
Date: Thu, 30 Jul 2026 08:24:25 +0000
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 0/6] riscv: dts: spacemit: fix maximum CPU core voltage
 for K1 boards
Message-ID: <20260730082425-GKJ76518@kernel.org>
References: <20260729150722.1598630-1-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729150722.1598630-1-aurelien@aurel32.net>
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

On 17:02 Wed 29 Jul     , Aurelien Jarno wrote:
> The SpacemiT K1 based boards use the SpacemiT P1 PMIC. The buck1 and
> buck2 voltage regulators supply the CPU core voltage. They are
> configured with a maximum output voltage of 3.45V, while the highest
> operating point requires only 1.050V. This means that a kernel bug, OPP
> misconfiguration, or privileged userspace could request a voltage above
> the safe operating limit, causing possible permanent CPU damage.
> 
> This patch series set the maximum regulator voltage to 1.050V instead.
> There is one patch per board in order to ease backporting to older
> kernel versions.
> 
> Aurelien Jarno (6):
>   riscv: dts: spacemit: k1-bananapi-f3: fix maximum CPU core voltage
>   riscv: dts: spacemit: k1-milkv-jupiter: fix maximum CPU core voltage
>   riscv: dts: spacemit: k1-orangepi-rv2: fix maximum CPU core voltage
>   riscv: dts: spacemit: k1-musepi-pro: fix maximum CPU core voltage
>   riscv: dts: spacemit: k1-orangepi-r2s: fix maximum CPU core voltage
>   riscv: dts: spacemit: k1-bananapi-cm6: fix maximum CPU core voltage
> 
>  arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 4 ++--
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 4 ++--
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 4 ++--
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    | 4 ++--
>  arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  | 4 ++--
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  | 4 ++--
>  6 files changed, 12 insertions(+), 12 deletions(-)
> 

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
