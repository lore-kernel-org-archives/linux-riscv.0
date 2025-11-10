Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BB8CCFA1A
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 08:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+RiayB+y24rqmWhfF+9++iJZT6ud/gBeyPn3gb2mPUo=; b=X9dreUO2nrvOg4
	gtJ/RB6RaVXwxgxm74pAyswaM+QGAgsrd53NBNHB6Y6ezRDulGje/i258OuHhuh2F3Y8OSuo8jNED
	f1uPpMFM+qthb+YkhyX4qEg5I5jkpy+Kd6iZCj648u7srH2/ST5GuWMyvqEHW8SpM/WVtEj++I80t
	bossdXcDFTYnaY6UL0qAQFlnlUPD4lwYDhA5ty7aAhjU3XWkdfI/EQ9WCDnIspo0NoJlV1COzLZOM
	m0yOC9y6m8EVFzzs7Jdv63cat8uz3cv8kEJn+HQmovdKVUZ7JpHb6fvYYtrm3ORQlwhLA4SPW3kow
	dU2nQwenfP9Ai3RtNUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMsy-00000004wQW-2rXS;
	Mon, 10 Nov 2025 08:04:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMsw-00000004wPi-0DNU
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 08:04:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C24842DB3;
	Mon, 10 Nov 2025 08:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEC4C4CEF5;
	Mon, 10 Nov 2025 08:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762761861;
	bh=sm7lKsYQSj240hLyDGyoHHmqQuPH13OZrQ0UGfTRIdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNwblf9ktrEm5AF/sXmoCAMsfIZgK9ar0GmxMyEBA+gnYrwDgOuoo4MWpZOSOq1oe
	 Vocp91SIN7OGMcj42Xukbrky2AHLBhe9GWzLZ9hvmQeF4+ns4LNkqAynGjRDBgHuGu
	 TZFY0EHeFxfUmpqaLnL/47KMYzktVnPAu3vVc7IkH4w5ALmOB1n/ancBENQ1EAZR8I
	 7yON1OpwGGE9qAG+MjjRyFobSkeXz2rpFR9lka3+nYjBx4JkmJ4YMQ319RQnfLiD+K
	 sajtGat6eFHsqMnBbuWQ+W4R6ggcGjtWElH0HdqUuW84+r2vvrRgh1hVCzUjg0DT37
	 ptD+3X3zhz3vw==
Date: Mon, 10 Nov 2025 09:04:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: michael.opdenacker@rootcommit.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] riscv: dts: spacemit: add Gigabit Ethernet and PDMA
 to OrangePi R2S
Message-ID: <20251110-brilliant-spiritual-hound-048ced@kuoka>
References: <20251109222858.3085488-1-michael.opdenacker@rootcommit.com>
 <20251109222858.3085488-4-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251109222858.3085488-4-michael.opdenacker@rootcommit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_000422_104794_33C7DF92 
X-CRM114-Status: GOOD (  10.28  )
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

On Sun, Nov 09, 2025 at 10:30:09PM +0000, michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> The OrangePi R2S board includes two RGMII ethernet ports
> supporting Gigabit Ethernet operation.
> 
> They have an external Motorcomm YT8531C PHY attached,
> the PHY uses GPIO for reset pin control. Their description
> was reused from the DTS from the OrangePi RV2 board.
> 
> Enable PDMA for the SpacemiT K1-based SoC.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> ---
> 

Squash the patch. You just added this board. Adding board is one commit.
Why adding incomplete or even buggy code just to fix it immediately?

Best regards,
Krzysztof

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
