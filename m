Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C017EC25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 06:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5n+ce/YicnzCoXycwklesjNxWoZ4hMqNMVyw3ezx08=; b=nvmnNjF6gGfE/J
	teGQ0FTT4IjHyOjaPtaMFGNIX/BNLZdK6G8OTeCiUaIB8YPwB5Y9XKj547X8bamU3+JRxhboGlCiD
	7ooyNKFMM8CEdy1j81cqnAsXHI7aBaCClYi+9IGYrT0zRVRIRnpai1rG8TykqATK1vWjXHbMtPih4
	EORpbxM/OiZ6AUCIwDGfknZUfeCc36L/yaMamidw7sJig6uGCJK7s0wDGTQwPNHY5XGp0EVhcVXZP
	U83TtVe3YZxpXYPv4d2D8haQfaxW0r/ezxsF8zD4oCL/HfOrQ/05k0e5GZLrL6k/X2kBKrepbBaDW
	Ks71HMsm/G4nmULYRLlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4xhU-00000000cn5-2SR7;
	Thu, 09 May 2024 06:56:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4xhO-00000000cmG-2Fgu
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 06:56:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EFC1ACE19F7;
	Thu,  9 May 2024 06:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D14C116B1;
	Thu,  9 May 2024 06:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715237771;
	bh=z009SwGATO5VeU0fNjTvQKeAOh6MCU05bzUy8sjDmKM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PIbi17wShJ5dwb06cysxVSJWO+wvqDWDdAXc4whnrLgQIW0sCM6plkkiU7FCcXbGH
	 aLZw18GZTwm4lCbyPd3WSkaib9nhQWZPq3tOuSg1vwOLWQ5VH4y3LTqGlwhzR2LfJK
	 cvMXndxO6FjNS5d/3/v4SBH8k5i1ocFEDA9GMz0MX7poYUq/HF+LDwhREVsImSpgu1
	 4N+dIixayWvit7tFD7TlVaXleo2G0/VSHJqYUUGKrTHihXlOjAMHPwa/a/BL1e8s0W
	 orOteflwKsswwjM8Tlq9J/i8U2xwfdKmfSRuKzZED2j4SuO3Pt14qgyExNp+GxSjrx
	 tvLPu2Rem/GOA==
Message-ID: <04db5556-a404-4fbf-aca8-3b8f066c1f47@kernel.org>
Date: Thu, 9 May 2024 15:56:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: canaan: Clean up serial aliases
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
References: <cover.1715163174.git.geert+renesas@glider.be>
 <ac93f18200c5e3f878907084a7c660ee60591db2.1715163174.git.geert+renesas@glider.be>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <ac93f18200c5e3f878907084a7c660ee60591db2.1715163174.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_235618_492765_937170EC 
X-CRM114-Status: UNSURE (   8.68  )
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

On 5/8/24 7:20 PM, Geert Uytterhoeven wrote:
> The SoC-specific k210.dtsi declares aliases for all four serial ports.
> However, none of the board-specific DTS files configure pin control for
> any but the first serial port, so the last three ports are not usable.
> 
> Move the aliases node from the SoC-specific k210.dtsi to the
> board-specific DTS files, as these are really board-specific, and retain
> the sole port that is usable.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
