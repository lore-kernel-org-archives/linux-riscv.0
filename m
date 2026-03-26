Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102D7103A9A0
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 07:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1DbtSCV44qF7mB5H9ukyRmlr5WjEIx2zGMQ3nmNz70=; b=irkEUXcUCvrlui
	TDW5EDc82Y6LYZ16zqE1Vmdao7SeFqTXs4P1COzeP8YwsTcB0BDt2opIH67BNHxHqWkWj79wwpBcz
	kV68pdyequq0P20/g1U1n8Q481SAGiY5VJT/ntLeLCLkPIXilZX3XHTIn24AUfxCvsIuhhL8SC3Dq
	Yh3zfF3NzkqGRSJrxU/zfvszxktkPSr4TBYxXbCz7om+QOfqP/wSAsbN2TEu7QmPsupiT+6TrV97/
	WRhAmWBQ3PVr3YTPxe9GFVwzULUXjHZcVgX3zwY5WcpacC6T0h9+dqh2uatNgavTbVt88ITNjgWPP
	9+hUNoVmP3qy1IU9VpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5f6R-00000004v5T-1RLY;
	Thu, 26 Mar 2026 07:26:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5f6Q-00000004v5D-0qz4
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 07:26:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D38760121;
	Thu, 26 Mar 2026 07:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C30AC116C6;
	Thu, 26 Mar 2026 07:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774509930;
	bh=cj12Kja1BOAGu3Nk1rs+olrIuJVFqGiDXAjaY0Ktz3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIz0VaML7axJe9wrMWDR9ULbMHLjOmqpnxhnynzAjlDFl/5xpcPa4dUmV+0kW/uXl
	 8dBoLVNaAnO55y536ZTjpxyJ+gFZFXp446SCnnigeZBD4b+SNckLzndXHbbWimzP7p
	 lK+qP4BSIcLIRj/Aqzh1+pDL5CHcKecQBLomsaAgh1LFv2Md5VtDMnhwl2NiD7jXnY
	 cO03I5aiV87zWENGO172+FGdVof1YAiD6gWOcRWXpjLaC5xsfGd9Z9bMDksPAfgZfv
	 0H4vC/5OG1blR3t+nGqpmeQ7UfiZDmKLKtS52kTyqXakrvEdNO27I0VYHLbLgSoYQS
	 ZvdVhhnRkSOVA==
Date: Thu, 26 Mar 2026 15:25:28 +0800
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v6] riscv: dts: spacemit: Add ethernet device for K3
Message-ID: <20260326072528-GKF777612@kernel.org>
References: <20260326014617.1011732-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260326014617.1011732-1-inochiama@gmail.com>
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

Hi Inochi,

On 09:46 Thu 26 Mar     , Inochi Amaoto wrote:
> Add all ethernet device nodes for K3 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
> Require the following patch series:
> 1. Basic DT device patch
> https://lore.kernel.org/spacemit/20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org
> 2. Ethernet driver patch
> https://lore.kernel.org/spacemit/20260316010041.164360-1-inochiama@gmail.com
> 
> Changed from v5:
> 1. Fix DT warning cause by stmmac-axi-config.
> 

It would be great to let people know explicitly that you dropped the tag
they gave, but I can understand you wanna be cautious here, so again

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
