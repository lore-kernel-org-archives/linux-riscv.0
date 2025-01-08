Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15539E77188
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 13:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWZXrolelkgzaYv6fJE/fiV8EmYBVehWtiEGUgo3I1k=; b=YduWCbr42D1LCz
	nrGOShptK1suw1BSW+7+0qF5h10QDQfTumBOnjY0h/n8f1sSiZuFwepTxfOjATcM+6V9SwdmKG5EG
	0Zhjs4xrAUEvfhumG6pzxY1Y4nJYhEfNofRLd0xQTYOdaRaG/TnQ++4tRYAKgKjBPD1o8xTmn1V+X
	m15bSXxKfeniR9y2cGtlSAcz2JKRfmLLSjFhf6xlcWYAWdHaRuLqs+J5Mep4aKFw70kuhoeldX6tF
	S6pZdvxVOILZGn33wmKxZ5PrkiRqZVaY4wZB5gbFlfjrMj+A/vO5A6oFk2dukp+H9VrZJk+cc+bzO
	MUPUomXmuXTY2bAG9AUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWNO-00000008enF-0AhU;
	Wed, 08 Jan 2025 13:45:38 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWF3-00000008dKR-0eGJ
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 13:37:02 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Yixun Lan <dlan@gentoo.org>
Subject: Re: (subset) [PATCH v5 0/3] riscv: spacemit: add pinctrl support to K1 SoC
Date: Wed,  8 Jan 2025 21:36:22 +0800
Message-ID: <173595809801.25800.8363611457846698976.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org>
References: <20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_053701_216979_4E942E40 
X-CRM114-Status: UNSURE (   9.82  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Wed, 16 Oct 2024 08:59:40 +0800, Yixun Lan wrote:
> This series adds pinctrl support to SpacemiT's K1 SoC, the controller
> uses a single register to describe all pin functions, including
> bias pull up/down, drive strength, schmitter trigger, slew rate,
> strong pull-up, mux mode. In patch #3, we add the pinctrl property of
> uart device for the Bananapi-F3 board.
> 
> You can find the pinctrl docs of K1 here[1], and the original vendor's
> pinctrl dts data here[2].
> 
> [...]

Thanks, Applied to SpacemiT's SoC tree:
 https://github.com/spacemit-com/linux/ (for-next)

[3/3] riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3
      commit: e7cd95ad8013bc232316bba0a52ea11ecd5c81bd

The for-next branch will be sent via a formal Pull Request to
the Linux SoC maintainers for inclusion in next merge window.

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
