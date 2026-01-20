Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3490D2ECEF
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 00:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pW6VOTJ0uZWP2uhwIRLk0Bv8dtXsXb+VhbrQf3wwxtQ=; b=RWwA6ZNuyHn18v
	U0RQL813NGIpbo86buKx7+NurOWpEot4yyUFROoCG5AHJW1tf+ATrOvaeqvainplzywIOLGXWnL05
	2SQbITRy/syQmCTQS90VoJkiVMgM9VBsNo+tkc+7MOtBJXDL6P7qWZ2tN+8LkEM1eQjOndxZieGBQ
	z2tiP88IMZv/06q/wOI69aISrPwulSjV2dAM4d4gGdEk82l0toBUUZlj65WL1W0OLdMXKtZRxurnx
	YZ3yjzEv40iuzgnBQ2A64wQLebs2PGuU31vIe+yl/KjWHN9IYCTGD+xW4fvipsaiPM45xAzMvcY6Z
	+9/purM3XGlCrs3A0AVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi02J-000000030jp-09RI;
	Tue, 20 Jan 2026 00:55:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi02G-000000030jV-4AEV
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 00:55:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7033A443BE;
	Tue, 20 Jan 2026 00:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76FA0C116C6;
	Tue, 20 Jan 2026 00:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768870551;
	bh=3zyNL3/FIY+mZyPvQXq5vPT94NxfNQkS1PoIxTMZBA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CqMPx+nXFdqzgkJ6/BmYEDZpcVNnAvO5jn7K1rupIlY5Cv/86ZB+SvUWtqrgpZsKA
	 VnW6qbamefjAhaxeAhnRQTza2p6u7LW6/6mEpzOPRQ9GQ4juOaUu3Slaz5Bl03BKNH
	 y+cnFZTmhBGHIAK9WbTrJI2tOZi3+39feFbduxJ1oTDGseU6pMOB7eNmn0BqikTRDS
	 xyVH0IVovSY2y+govtmxeFnffnyTJPC9w4EH525aG7KEnURHVKT3pXj8bC357NcoAX
	 VyQl05VvYwe/pKMaySXqnMKl3IVzovf9dBQfHB9rZqrZ1yyM5QVftexV16lFfLVPGf
	 WG+N2N3dNnigQ==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] pinctrl: spacemit: support I/O power domain configuration
Date: Tue, 20 Jan 2026 08:55:44 +0800
Message-ID: <176887046277.13634.6110722428776119722.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_165557_055299_8759486C 
X-CRM114-Status: UNSURE (   8.05  )
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


On Thu, 08 Jan 2026 14:42:37 +0800, Troy Mitchell wrote:
> This series adds support for configuring IO power domain voltage for
> dual-voltage GPIO banks on the Spacemit K1 SoC.
> 
> On K1, IO domain power control registers determine whether a GPIO bank
> operates at 1.8V or 3.3V. These registers default to 3.3V operation,
> which may lead to functional failures when GPIO banks are externally
> supplied with 1.8V but internally remain configured for 3.3V.
> 
> [...]

Applied, thanks!

[3/3] riscv: dts: spacemit: modify pinctrl node in dtsi
      https://github.com/spacemit-com/linux/commit/cf54626b0ecce137379d1a8f1e6f0fa5b36d0395

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
