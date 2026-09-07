Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6E7C79F89
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 07:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpBvv8okVOQ27AxNQIBXi8ukX0MwhuevJSGZtX3kpCc=; b=ZdlnrSrx3JsL1l
	cbf9pEQH0hJnmY5SbGrSWDGS+O8zbAar25pX31HJ5F2hjuIiLhFToO9fU9qM4OZ6cHzMCQhK9205c
	cc+5N5j2XF7FvICwAU8+MyNpBK8mAxcIldVOEoPpOWPR1BnLFFyBueIsjM41GwqK22zH17pqt54A+
	FFAUUBVw1fCD1lo59LZVoVmkZ99InLqRN1m709bmGGhC4J7aeIwkgVlPzM3sepAxO7AXIGdHfHl+L
	e4t+RSyU5i8+RqakyPlfp9B+XOCB5r2KzWQWZUlxVohhG76uldHtUrlLbUVnTadCtEBHU0S0HtVSg
	Gmvc6kfp38LYFWSE/akA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3U1h-00000006BG4-1YkS;
	Mon, 07 Sep 2026 07:44:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3U1g-00000006BFc-2Axh
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 07:44:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 494764040A;
	Mon,  7 Sep 2026 07:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962F71F00A3A;
	Mon,  7 Sep 2026 07:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788767064;
	bh=6iv+CaoP1NDRXPBD5zrkJNqyxtCMxrNtTEasdO12PNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NcLnmAz0hi7VC85mVR4FNbQyG73njKOVusDoroz9b6n4K+7kCSwM6cxPSrtzHQzE/
	 KIA51TUQO6cSfMqJMQoQORZgiCiSAJXyEUinrbQbLrB1MOI7Lkoebzn5QBkWoj8HOx
	 5oKyy6O92mpR0Wy/2liCTApG/WCC/zPVSY7GNGmhTp4YWxyIlHlXsEQ43uziZ1XZ6x
	 LqA8HsXVGXAzDHoTqJ8NzCNg0pbY+aOBoUz44f6fYiRFJjoEGdjWapREEXwQiGjVI9
	 MAxxSFOfoYEaWQLgXswGvJrNv0zQmjxnQvD5h96IHWnl++RsfLJEyQCbOfk+T9USHR
	 xUXpekM2dQK6g==
Date: Mon, 7 Sep 2026 07:44:21 +0000
From: Yixun Lan <dlan@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Drop guest properties from
 M-level IMSIC
Message-ID: <20260907074421-GKD2330@kernel.org>
References: <20260729-k3-mimsic-fix-v1-1-368c0aec04b9@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729-k3-mimsic-fix-v1-1-368c0aec04b9@pigmoral.tech>
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

On 00:40 Wed 29 Jul     , Junhui Liu wrote:
> The mimsic node describes the machine-level IMSIC, whose MMIO region is
> 0x10000 (64 KiB) for all 8 harts. However, the node also specifies
> riscv,guest-index-bits = <6>, and per the AIA specification the
> per-hart stride is 2^(guest-index-bits + 12) bytes when guest interrupt
> files exist, i.e. 2^(6 + 12) = 256 KiB per hart and 2 MiB for all 8
> harts. The described region cannot hold even a single hart's files, so
> the node contradicts itself. OpenSBI enforces exactly this constraint in
> imsic_data_check() and rejects the node with -EINVAL, preventing the
> M-level IMSIC from initializing:
> 
>   fdt_driver_init_by_offset: interrupt-controller@f1000000 (riscv,imsics) init failed: -3
>   init_coldboot: irqchip init failed (error -3)
> 
> Moreover, guest interrupt files exist to act as the supervisor-level
> interrupt files of virtual harts; there is no machine-level counterpart.
> riscv,num-guest-ids is equally meaningless for the machine-level IMSIC.
> 
> Drop both "riscv,guest-index-bits" and "riscv,num-guest-ids" properties
> from the mimsic node so the node matches the actual hardware layout.
> 
> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
