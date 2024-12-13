Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6ABE7717D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 09:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixcwhJiH8uVs7HK7X7YBx95+dQM7p+6GZiaS+YG9avU=; b=SoHE61CWgbkBvT
	A19DibamL/ZoFsgD5qGODv30UTCgRONsIeW6fMTtnkJZScMJupXJ4nsiTfkstIGeTjXL3O7gi7QRG
	obtoyC775wW75dAZFdnNTDqWdSPjjIfw7a9dIUvfgomwN2AiZnnGnvlRfe37EPy2PKxZJI5nDJsz9
	JlKin0NsNLGNu1tSdmTi9q99NAmSGc9/8RP9Fl9xB/Yb18MkjVrCo5mfSQYmUFTwZ6LukMDW8fUEl
	efw3C1p3ZG9ndXmFXO1INqBTDy/oLI3yfSBktopC2mWs7EM0g4siZjudk0pbSFtg4ExTeU4hr3pye
	NFeYbOi3gzdxQ/zso9fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM26p-00000003HGN-2GN8;
	Fri, 13 Dec 2024 09:37:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM26n-00000003HFZ-2MfT
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 09:37:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AABBC5C582F;
	Fri, 13 Dec 2024 09:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F4FC4CED0;
	Fri, 13 Dec 2024 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734082636;
	bh=Ot+Keot2DSbDeQxxNeM9NIquE52Bf3AknFppl0pabGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bGyYqb3ysRMoR7UkMA1HPxEr/qT4ULL2oXJQ75QOUBd81afntfB+G4PHdVLh14Kdl
	 Uk194Gtiu8YgHfgLtUIkACzCApDCqhH6z/CAVswPAm/glOdGkeMIYRQ0L1zg/avv0w
	 yUPbMMATbj9yIfdhYR7DQmVsw15QzdPIsegvRHxPxs2tXN+SQMiGSs5FArgxZwPqEN
	 noFRwU6AljgYbP6mhZbDN13t9QoVt5oNaslnK0tIsvmItB6pgOHYmw59L4xbvP7Qq4
	 tumNVQRdzjaSsizGZi0e7mJp7/55Jq/9z65Zt4HzACzBAuK7oMiqJrwX9j7TX02FCz
	 ZPRblFu7tQ1xg==
Date: Fri, 13 Dec 2024 10:37:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Hal Feng <hal.feng@starfivetech.com>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: Fix a typo in StarFive JH7110 pin
 function definitions
Message-ID: <oacmcw5yvdlsmvqbt4dbdmsx6rvd6x43qv2ejmypw57jgraqu7@txhhsxdg2agq>
References: <20241210042002.165297-1-e@freeshell.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241210042002.165297-1-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_013717_643515_1E0E4FC1 
X-CRM114-Status: UNSURE (   6.62  )
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

On Mon, Dec 09, 2024 at 08:19:56PM -0800, E Shattow wrote:
> Fix a typo in StarFive JH7110 pin function definitions for GPOUT_SYS_SDIO1_DATA4
> 
> Fixes: e22f09e598d12 ("riscv: dts: starfive: Add StarFive JH7110 pin function definitions")
> Signed-off-by: E Shattow <e@freeshell.de>
> Acked-by: Hal Feng <hal.feng@starfivetech.com>
> ---

Why are you sending the same multiple times? Where is the changelog and
proper patch versioning?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
