Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C381C87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 23:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Li72VsHzurvFfzPcFf+v/Y+Ay7Chb35AH0wH1gQ+tHc=; b=swF+OP8fHqJLAe
	rahUn067xNLblBeC1oF35mxoUo8X6YnZmr7W2hT4529e/QNw32UEEoemUY7nP8wW0EPec04ndkN1C
	Fs25PRBcx5Lh2tG2pW7ItW5iMCxLToBeaR/p/aXXcQXSNx19NBh0Pun+3QAGZjRdChuvgJq5HQdh3
	zB9fwfPARDU7+4YlH7UAlfwRfT7zl5n/yxZtJThKWlmFpGPgAot62op1m77TQ5wkE4TVNSv/RXekd
	YgjCMiEghudTy25m34Cu0ad9pxWvM4sy4FEq0sByIkjDVtHVAFy52l6a3uZa36uRLg988jg3SORj0
	sMvB+o/vfNCLuT8zrkOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufReL-0000000AqVr-1G3p;
	Fri, 25 Jul 2025 23:16:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRba-0000000Aq1w-2yDl
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 23:13:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 094F6A5663D;
	Fri, 25 Jul 2025 23:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD4FC4CEE7;
	Fri, 25 Jul 2025 23:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753485213;
	bh=VMiBf86La07uA71P69SSBu20dwv5wdLYeyIG8LPdO70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=brFLpn258nANeZsjscyVyQJusRSEG8geEd5eNw1r1wso0K29DzqE7kx3DpwOh/4Mc
	 VraZWUIoYbB3WEIfA+A348iMoQls7kQZyA0MVuEpHbXWS7BXIQiRiI2Mop6SE/I/lb
	 Kqou3ucr7wg16H1RnzuP8NGWrBWdaQSTGf9WZSpqM1p2weoU+AdyQp0KWUs09tsaA9
	 n3Jqxwx4eE/HvCAS4arwOslerz84LgIUPnLwV1UKWjC36KAHlBbCocmddYepo+PnGm
	 MV+EvCI1xuX1hF6klmYBAhNF97fxbq+tNXhWIpUiE05dI5eFq9SpL6ogPBdCz+1blG
	 qgNx/kSu65tcQ==
Date: Fri, 25 Jul 2025 18:13:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Drew Fustini <drew@beagleboard.org>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 1/4] dt-bindings: riscv: starfive: add
 milkv,marscm-emmc
Message-ID: <175348521234.2010243.14522984982875660106.robh@kernel.org>
References: <20250724094912.253723-1-e@freeshell.de>
 <20250724094912.253723-2-e@freeshell.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250724094912.253723-2-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_161334_813294_6985D17C 
X-CRM114-Status: UNSURE (   7.35  )
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


On Thu, 24 Jul 2025 02:48:44 -0700, E Shattow wrote:
> Add "milkv,marscm-emmc" as a StarFive JH7110 SoC-based system-on-module.
> 
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
