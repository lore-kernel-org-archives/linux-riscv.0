Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223B0CD37AF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 May 2026 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADLOtE2Z7YNiv245rgbA8RRrlP/EETvOFG6J+AncC54=; b=knCxSNzooyOPvV
	J51n4/Js5sQ0O5AdY6TxiRcfJD+nYLBd6CJndii9FQWmU4dWzMlYAJtB814rRpqOB7yjOj0fL23C8
	Csvx9Bnpb8Ad/OUChcDwoW8OiLo6KEd8I1iIbXm6PmIV/gLt3UxWWw7Q6Yp1HSfhBfwNcsRuCBKvI
	LOk2rVlgwXxT5wEtzKyzf21A/7ZHF2HDyWLnRRm9aReyzmeTgzv/LLFM712qmHHZ9tT2OjW9H0fFo
	ZqijRCSwwxmRMDfVpSUSE76fWySLXu4dsAR+RkgOqlPoPcHapi2kIENKSXpexxOxsell+5z4ezZvb
	74xx4zzDLtPGMtHSV6cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3Jj-0000000AiJd-3Vwm;
	Sun, 10 May 2026 12:31:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3Jg-0000000AiI5-2gct;
	Sun, 10 May 2026 12:31:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19F7943CA8;
	Sun, 10 May 2026 12:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8A4C2BCB8;
	Sun, 10 May 2026 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416288;
	bh=Ff/B4KxNBZMQywpnIfxmpeNFZWzaDYfLmaF91BK2Y0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oDp+KODB/+gujPT1prT4mhlQ4OnHP3sFOj6iuiN8taPKf+wezG/cAAujkiwGujLIj
	 HQITdb5qdimBuShm2X/k9u1qjq+zBVn7RTIPhurXvn0XS7YirpuwYFwTY4rvr55p6i
	 uGHr/9GuUoVwXcLMg1drqaYL/WecLmJHTrZnYL+8Av8pJTD5r5BvQxtOtffHXkQsnV
	 BoRxRH0EJaJj3hgrBL3NGkbyQIF9PKknwufnZ6x7ad4rfe/eLPmR288XBiQfrjPJCr
	 sQwfucxIeRySRyihVxlCEyOh2rWP8quG3sA8wK1T1FpIh7yC9rPw8AvbFmw2r3k8sL
	 YgAv3mCu64Ccw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>, 
 Yixun Lan <dlan@kernel.org>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Yao Zi <me@ziyao.cc>
In-Reply-To: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
References: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
Subject: Re: [PATCH v4 0/2] phy: spacemit: Add USB2 PHY support for K3 SoC
Message-Id: <177841628298.434434.4061327159499259923.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:01:22 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_053128_740323_5D0BE714 
X-CRM114-Status: UNSURE (   6.41  )
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


On Thu, 05 Mar 2026 01:00:50 +0000, Yixun Lan wrote:
> The series trys to add USB2 PHY support for SpacemiT K3 SoC, while
> patch [1/2] implement a disconnect function which is needed during
> next connection.
> 
> No DTS part has been inclueded in this series, instead I plan to
> submit them later while adding USB host support.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: spacemit: k3: add USB2 PHY support
      commit: ad8fdebd40fd25e86331886f4fc6951531691319
[2/2] phy: k1-usb: k3: add USB2 PHY support
      commit: 056ee8b37bc91e3230afa11ec1018fa898b983b8

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
