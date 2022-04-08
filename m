Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F97C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 13:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZfSAJ2D8I6Xwn2eWnVOwNCQAUrOWKUUvsaeuktpbd8=; b=rW6jbE4qP/9u0j
	WQcKuKUtI6WB0sZRmCVPTCJSd9jemAMi6t0qek36+oQoLasmGJozDGz3bDSPvqVArPYztEs+Tfv8C
	qnjiubSqmWpI1SUdtgDTgFX1Lpi3QD7IbktWT7yfz6vprizp8AEWkps4LVgLzMGJ2BY0KavjV6irA
	9SoTpSrFkaUSNk6fLJDpmr868PhvortBQ6GLLdPQCnn6UbCvquicBdfWSRpiH+WUpmXmYPnQTPPT4
	yYgASCXPc49jcLKCQgw57DesxrwHNkbDP+ACuZZ8OrFXTFNZpgErf1yRC8lQHqUupGOOhhFW5PRnm
	UzrYuDnBMVqOuoGU8ODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncoR9-00HJ16-52; Fri, 08 Apr 2022 13:14:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncoR5-00HIyY-B2
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 13:14:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0D5FEB829FB;
 Fri,  8 Apr 2022 13:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2550C385A3;
 Fri,  8 Apr 2022 13:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649423635;
 bh=I/sH4Z0xGBHI7ug7PEjQLDL6PwxzNs+O40t2lamCdAg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=paAnEef7FXGw6SkN1DeZazjXUrTrWnlbuIJA94cEwMqCo1IXh+54ziV2wF9jVRxkh
 2rtH68RCh5WkgigE98L/t4ZJkq84YuezuRojX3GjZzmehMFAcbTmN2mdVhKZwF9Os9
 NI2WOlC5G0TEEzbflWsHJTOUqXReVfLCHZAzrmSwBzdpiQP4d72gD+3phSXPOnRjfU
 HrbYWXk/ZxNoD1MyIuRfJztA5O9b5uijKt4qrLAb1Q5AiGEvy/CAiE021Xd5D6+tva
 gZqPI2C763XA9HDx7EqiIlFTD0nReUXKhM7znAtF9MyX/BAxZajj5cmDGBPoBiNuJ2
 9pJ1Pl73QIyzw==
Date: Fri, 8 Apr 2022 18:43:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Zong Li <zong.li@sifive.com>
Cc: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org,
 bin.meng@windriver.com, green.wan@sifive.com,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 0/4] Determine the number of DMA channels by
 'dma-channels' property
Message-ID: <YlA1DwdIMoQ1dXZS@matsya>
References: <cover.1648461096.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1648461096.git.zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_061359_545273_FE2B16D0 
X-CRM114-Status: UNSURE (   9.18  )
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

On 28-03-22, 17:52, Zong Li wrote:
> The PDMA driver currently assumes there are four channels by default, it
> might cause the error if there is actually less than four channels.
> Change that by getting number of channel dynamically from device tree.
> For backwards-compatible, it uses the default value (i.e. 4) when there
> is no 'dma-channels' information in dts.

Applied patch 1 & 4 to dmaengine-next, thanks

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
