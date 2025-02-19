Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CB5C021B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 18:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybI6i12S/UCl/EEh+JmjJ4HTOegurTEdkuicBWyft0c=; b=t8gvZ6rp1pr+5S
	IL8XlJu9BvRmF3UpcxCRdCzJVobRjtVuiCU4NDwiRJetQOMlgOuCR5T6sgHgLWM6Gu/hS3R/mWsIw
	qj69Zj5oBhiqRlkoqEoC1F6jdd3nnJCesXX7ITQX62Wqq52OaZkrdW+KHAJM1WqpcxvQBIGdEmSd1
	Vw0uBd684lhWKN1lwB1wi8nhrwFMdKvDBVesEICZeqJwrdbSyML6YxJk+SeZSF2Jp0kUCUpb1+gQq
	G6qdfPYpxobPYTjcQRmgIkP9lUWcxRd43WUEfaO+xxR/1c+buJdY8SOTJNFpzIO5Uc2fGHDQQRnIm
	teTm3ps5dAeMMuNz3xHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkp0U-0000000EQHe-3GJt;
	Wed, 19 Feb 2025 18:41:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tko3M-0000000E8tr-0jnR
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 17:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A52A9A42828;
	Wed, 19 Feb 2025 17:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01BFC4CED1;
	Wed, 19 Feb 2025 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739986807;
	bh=7e64/5L6MTYJPbB9Fmi1eekyUsrDKLbg0aRRMYqYpc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YdxvxqnW1P/AncAt7m6XOxd8JCuA+52zJHPOSCtvwSZF8m58ZRnUQ/akVIb/gCjcQ
	 YLKc5g8sqOQATo5QJ96iLIC4otFSbzeliRutoVLPkATX1SR9m0BCpTO/FZfnG5gOEa
	 Rrc8MiJVWs4uolDRfFgs6D//mVricSqFGpUb21Y45ndiFimfqpsFZ3jj37036CEvsx
	 YHzcCO18oIn+8DIvwVJa+8yx6SASJeR3i/8DCaekujdsucqHwZYHO7fTyRRlqt2XFE
	 Rut6WyDcjHBrjEYa0uixeVBllxKbE6sB9hcolXOArgMocmoY6nwOgq+FUhKcatkA5m
	 mT6seqAYuuUhA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH] riscv: dts: starfive: fml13v01: enable pcie1
Date: Wed, 19 Feb 2025 17:39:56 +0000
Message-ID: <20250219-sudoku-brewery-196094c5a506@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250207093618.126636-1-sandie.cao@deepcomputing.io>
References: <20250207093618.126636-1-sandie.cao@deepcomputing.io>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=446; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=vxuzSktMxnzfKt2p1RVJeC5rLdC7Hwpf1ExvcuVO114=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOnbxHNKhE9Lrt12bMGu8hzXQxN6r0iGrNPeEZfk/9aDS +6wY41cRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZis4mRodOHdbF3tvr8S5la fx7Ux3JfOXwn0eFvStjSIjkph1jfmwx/BVobGy0nMmSa2886fzby4/bcLw6cHmLejM9SG1axqpV xAAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_094008_287327_D63427B3 
X-CRM114-Status: UNSURE (   5.16  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Fri, 07 Feb 2025 17:36:18 +0800, Sandie Cao wrote:
> Starfive Soc common defines GPIO28 as pcie1 reset, GPIO21 as pcie1 wakeup;
> But the FML13V01 board uses GPIO21 as pcie1 reset, GPIO28 as pcie1 wakeup;
> redefine pcie1 gpio and enable pcie1 for pcie based Wi-Fi.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: starfive: fml13v01: enable pcie1
      https://git.kernel.org/conor/c/57b5369f3668

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
