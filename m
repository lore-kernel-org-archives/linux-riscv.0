Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCE8105F7A6
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSBud2hgrr1gJmbVsAEb5Uhjlju3S0YjHOM/c2PCue8=; b=brJTmThZvGWzIH
	ys2ziWPiXotwwnn87fd3AOTNKnGZNCMgsg/nP57k5m8si8p7tDhw4dbYBGWaUMK8bfMokxmQ5uToL
	C45iEYhR2owAUy5+udEI7M1z50KPfN+0PdGwBrouGPOoZMtyjNVOJmWFuDBeLjLFY1NXmEHeLiwwH
	TD7rpMXY6GSOYeuhU282G9/AD1aTPWyGZcIDLOFDh4A3FJ0Ir8545hB0Y3qQ6sK3GRoj2zwgnPwM7
	w08pXKeNUVpDZywy2Na9NQpJxj0k1BL4m89Sy3It10UxgnupVXRGjRX+5frqyQVu4h3rneSVgAk7y
	RDUb88NRyTRp8qeAFrkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Xf-00000000ESx-3RcG;
	Fri, 13 Mar 2026 13:27:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Xe-00000000EQS-0zs3
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:27:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FA6D6012B;
	Fri, 13 Mar 2026 13:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A818BC19421;
	Fri, 13 Mar 2026 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408421;
	bh=p2HNkolfJH3glufT8VRymQsTTu1495N3oyZW+nfzmGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BxE6tkrGV17EN94KsD0hkeNViAZRQiRst5bZ7+z98IIrwk6VXp5KFlLwnx8drW1LC
	 lTxlGmPMHy7sc4ITE23/M776GpiqKVt0RElPikVynnMIeirF5a2KBlMjApOAcNbCMI
	 UORlZG8LWbRXqCvyfkovODpPXpmnnNQ7VTb6sJddRZRXMisgEQR0cnRSGAGTI5gsTE
	 W1ixG9kVUSe68DsM81jBtceBLjgv4IpjlEGqaZM24FEHApkoKzhXX4pMeKxzH/EEt1
	 MA7tp21mbCg+RCXFEwdCMINFIFt48drIO0wImAzt2LRvZc7BmfupPFx7X8sdqVOno2
	 EoeM1lxgJqPvA==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] riscv: spacemit: k3: Add more resource to UART
Date: Fri, 13 Mar 2026 13:26:55 +0000
Message-ID: <177340832523.17050.323606076175943251.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org>
References: <20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org>
MIME-Version: 1.0
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


On Wed, 04 Mar 2026 07:36:41 +0000, Yixun Lan wrote:
> This series try to add more resource (clock, pinctrl, reset) to UART driver,
> So it will not reply on external bootloader for initialization. While doing
> this, I've tried to break these patchse into more fine pieces, adding clock,
> pinctrl+gpio, reset separately, then UART.
> 
> 

Applied, thanks!

[1/4] riscv: dts: spacemit: k3: add clock tree
      https://github.com/spacemit-com/linux/commit/67072c8cd48c1fbb95cea39239eba5526395fcf5
[2/4] riscv: dts: spacemit: k3: add pinctrl support
      https://github.com/spacemit-com/linux/commit/d8944577496b5b99061d3b2020704fc86ab1f9e6
[3/4] riscv: dts: spacemit: k3: add GPIO support
      https://github.com/spacemit-com/linux/commit/20b77926864203e10b85af5276b17c2812d92ec1
[4/4] riscv: dts: spacemit: k3: add full resource to UART
      https://github.com/spacemit-com/linux/commit/28a7f755d7c9a4b9c41c12620fb4885f39b554ad

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
