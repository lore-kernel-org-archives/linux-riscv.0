Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47E7EEB580
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jan 2026 11:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yhStmmFoMHpEFEJtpil2r78jZwKGVBMxGz33AnLsHKw=; b=tjJ/qIi2emqDHu
	Zigd1jmvHiXPHXC4sj1BHyNKkgKLp2WAGNXiNoAk9+5esHuRAN58AYxFCqpsxWboqUrHpoC74a8yi
	pCrp2yM3uvIf2KQ9+fr2Qen68aQY/z7DPX9rBybEeRg5dEaI5WWXr4CmPyh3DW2ezHKUzQ1x09SLa
	yHJr852QXUJTZiLmVzLdbN49aanFwt3SFQLfKFaQR7mM5KO2O/jQhBUpqSY9UIZkRL6KrYzZzqcCd
	51aux1pG87dgqrDT9iy7ceRSnniRA+nha2sU+2PcTsh/ndDUVG61XXJLJs6YEffRP0YtGtuLXqwIt
	x2yGxay321udfNORhTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbGXT-00000006nzJ-3u5w;
	Thu, 01 Jan 2026 11:08:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbGXS-00000006nyH-0Cf6;
	Thu, 01 Jan 2026 11:08:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99E37444AD;
	Thu,  1 Jan 2026 11:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C36BC4CEF7;
	Thu,  1 Jan 2026 11:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767265697;
	bh=3vaei/sb4rRmaAM32GbT3y9z3sM0igMG4DfOPhlluSU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HOIHDwpytqpPEntMiXTtTqNLwL/AWkk5lnVzoRTfToONZZoRUmf5lgO/goH9KYxdm
	 DmMwGeNNT7Xp0234TNJlVwAyFexDXn+42kz9noU3Hr51pXAVWDIg2HBgUwSXQIS4wR
	 FN3DYkYBXOvyX1dQiVlG3N4CXpzz4UwJzspZYcV0bJnWVt3t869+KgZAI3fB8LKF4D
	 7UzduxE6iPs7C8SH7lx1fKRrXr6DUx74UMFn1WYN7XG3dvNoIuZsPwDUs6O8yUibr6
	 ZlyALsDgUiyMY5TKd3Qe3Ob1eWfm+dC9KmFYA2jE0LR+FIqSKWLhxyZ1kmuYDmWujs
	 fR4K48mefwz+g==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Ze Huang <huang.ze@linux.dev>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <20251017-k1-usb2phy-v6-0-7cf9ea2477a1@linux.dev>
References: <20251017-k1-usb2phy-v6-0-7cf9ea2477a1@linux.dev>
Subject: Re: [PATCH v6 0/2] Add USB2.0 PHY support for SpacemiT K1
Message-Id: <176726569400.201416.7844610224983761844.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 16:38:14 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_030818_118774_566116B2 
X-CRM114-Status: UNSURE (   7.38  )
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


On Fri, 17 Oct 2025 22:49:51 +0800, Ze Huang wrote:
> This patch series introduces support for the USB2.0 PHY on the SpacemiT
> K1 SoC. The implementation has been tested on the Milk-V Jupiter and
> BananaPi-f3.
> 
> K1 includes three USB ports as follows[1]:
> - A USB2.0 OTG Port
> - A USB2.0 Host Only Port
> - A USB3.0 Port with a USB2.0 DRD interface
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: spacemit: add K1 USB2 PHY
      commit: 61b84d5b20af2a4c9944972202c1386026598928
[2/2] phy: spacemit: support K1 USB2.0 PHY controller
      commit: fe4bc1a08638309b6be1af37210930b856908eb7

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
