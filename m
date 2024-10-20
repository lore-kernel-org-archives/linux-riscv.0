Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3D3D3C927
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 06:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bl6r/ia8byYh/e1CvWrquynEftmSpHjK4bkCm/L07aA=; b=H7V6uBq3xlVASs
	NRwz+phBoUT02fkABo4TGrjdlJ5pVMOUExRa0O7k/D35jgqaMcrT/3gNcNNPsDzK7CY8MmUbA2q0X
	arBLcATqz8s50ehxm3hBuBhqdxL9Q8JSSUibGP3LMTe6xp2RhFx+JY3+TTWTNY8faas7d//1T3bm9
	qkP5A0mNC/6pCUdJZjrt7jQih/nEqj9bY7N2CRP0r23Z9oV3hojKI0Y0RnegWLQuFyL3gta7GY5te
	06zILE/7+FPTWLEPg1dyeGOIhSmzksv4o7ya9qxaQt7C7xE+twHPeEvd1lYJoBZpBxB9nuCdT7f+z
	2+gewfF2Kl/eR0N4AIjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2PK5-00000004VNz-1GJr;
	Sun, 20 Oct 2024 06:21:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2PK2-00000004VNY-26V9
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 06:21:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3A7A4A40142;
	Sun, 20 Oct 2024 06:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50149C4CEC6;
	Sun, 20 Oct 2024 06:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729405308;
	bh=e7xRo9gmhueeLOjCCKxAJGpcvRvhQjI8rltTlifZ1+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QzlDjAg68fhoOHL13QmA3c+PVqWW/APS1QFGL7zIIGtK6G3i4B+deiUjZO9xeaCIN
	 sC7skAuM2qNBWXUp4ZchhJoBW3lPnrfpiexxxfmy8X80tjQ2kJiagUEB+yj9YBWD9B
	 +hlDjLyrogovK+p7w306k6e7LLxsUIrf/Fs3Fp/Y=
Date: Sun, 20 Oct 2024 08:21:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, rafal@milecki.pl,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandru Stan <ams@frame.work>, Daniel Schaefer <dhs@frame.work>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Yuning Liang <yuning.liang@deepcomputing.io>,
	Huiming Qiu <huiming.qiu@deepcomputing.io>,
	Alex Elder <elder@riscstar.com>, linux@frame.work,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: vendor: add deepcomputing
Message-ID: <2024102029-populate-footage-755a@gregkh>
References: <20241019162605.308475-1-guodong@riscstar.com>
 <20241019162605.308475-2-guodong@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241019162605.308475-2-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_232150_627493_3DE9D6AB 
X-CRM114-Status: UNSURE (   5.83  )
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

On Sun, Oct 20, 2024 at 12:26:03AM +0800, Guodong Xu wrote:
> From: Sandie Cao <sandie.cao@deepcomputing.io>
> 
> From: Sandie Cao <sandie.cao@deepcomputing.io>

Nit, for some reason this shows up twice, same for patch 2/3 :(


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
