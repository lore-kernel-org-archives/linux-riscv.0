Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D06C36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 15:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2Lui34NA3vhZnS/M533Fuh9KEMObVeNZFGDlCoaKuk=; b=kmfw9UdVliAMDU
	pxuc9+Gd10ysqOFM3EOtWrLbHPudlpalCGy+2DfNaph9aUZ/H5Iq8V5gslEYIyx2/m9e9CvMSueWR
	1V7NtGKgWTxHFO0QsptNghVyfYV5QYzSnB6hLOK9XuyffHXyJ7gmzBSi0+xPUXS8FYxKAs/MlOH8c
	CvuuN0iX60c9Lbyfxf3O0NcKr7ihmu/Z8xZKhARnORj6mLU/qQcdxMX5y8Ta7MlKm0f9BYjlBohwM
	gAT0BRDFlnnjdva7i4KPhlt0JqMCkvzXUSLT5mD9WO4bh785e7L5jhQrx3s/eMgfBv2aiUwDvr4GY
	vmeYvun/iYmAAEmc8f9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3GI7-0000000EF1F-0Z5I;
	Fri, 11 Apr 2025 15:27:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3GI4-0000000EF0n-27SE
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 15:27:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 32739A4A94A;
	Fri, 11 Apr 2025 15:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDDCC4CEE2;
	Fri, 11 Apr 2025 15:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744385255;
	bh=jPLcZIwSzCWBcWi+cAhyZX59qPuiRtXIzL2gT2e6Iek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=REi8RDpTXZ9wO+D598QQgL0agVTfBW28JOt9Hukl0SQ7RUvHl5bIK6kUe+bOXSG/L
	 SNbrJ31tqs0OdCB5IXt62U+6cLGvSqL0vCzuwfU1mNOZ/8CN1/iL4DrTttX6+CyX47
	 PES+0FC8ASItpgCfezWj7/kGDoTl4qIUB2KC2obH8qaCjZgtgmTieKHBtWopaPBs8c
	 ko41nHTrz794nt2lqNU6oJ/TpkUt7xVYx2tkiiNSDC060PYRJgxNxE/krGQlQcm+28
	 /PC6QGf9E6+Q3k6UCyNRpjgjuC+fuZzSx30gfAcQzUN9EK+tOKJxHPQs+RQ8wOxKTw
	 LEcwmBB4+sarg==
Date: Fri, 11 Apr 2025 10:27:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Drew Fustini <drew@beagleboard.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: riscv: starfive: add Orange Pi RV board
 compatible
Message-ID: <174438525359.3278076.8626650371046097286.robh@kernel.org>
References: <20250409091801.855083-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409091801.855083-1-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_082736_604165_28D99FEE 
X-CRM114-Status: UNSURE (   7.90  )
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


On Wed, 09 Apr 2025 17:18:00 +0800, Icenowy Zheng wrote:
> Orange Pi RV is a newly released JH7110 board by Xunlong.
> 
> Add a compatible string to the starfive platform DT binding.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
