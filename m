Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A93C77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 16:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dk9U3w7b7ettBA0mg6KE6f4bNwnEUhv3MnKv9i9ay4I=; b=ILAacuBG7jcYC9
	ra4HWCSlYQ1RLpvUbHJAfjaeY4/IWS1EyQTtt5Nyrl32FgB3EhqSpzkbTWNtKUnPHBOenEwa4zZwU
	kXAPgSmrwlsMW2J7wHhdSVSBbR+4Ihfv1sT2yJ/qb3AIGidaDdPhJt8Wm5UwnwF7h/hvJX1eb3XVf
	1dMh+fRblwEs2O/mNirWn+s2znaRsBTgTD7AFxTm7CCSdOLSaP364TlTvHRuueCFOn6HoXK1YrFi+
	IHZV1TI+wcrr0b/lsE98xClWJA402D692rE/aUklRvIVqrngbXdgr3BG7DIcIfHYs0tNlwSdBJ0ik
	ElQnB9FLqMHlPSi5UuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pybLU-002oYx-1j;
	Mon, 15 May 2023 16:46:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pybLS-002oYB-0a
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 16:46:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 48F4562906;
	Mon, 15 May 2023 16:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4D8C433D2;
	Mon, 15 May 2023 16:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684169204;
	bh=eL6yi8hMio7duV0WcJ4yRmARZWgFYml5JEHbo9uWn+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ogeSGaFFFvjbPGqY4fxX+spkml9Sb//s1UTvN5ItUHwSUxdO19Y5JNiXhApeuaIVv
	 6Ah747zLCTDSMzxR5e4DFvTy9Ov3n6OqOlp1/n8d5LK5XLeX/mqqyhd60RXg+ICx/K
	 k2wMW9aREKv9ZfJyLnW84qtlqO/jQkDCdmamz0BPpCHkrFq8umU868A11jr3p2HO+i
	 6ak7XhVQk1Hp7/IZs6lqyoZjUsYg29t5Q/0WI9HoWZlxdSPVPqeHbNAAUr07AyEwl/
	 KTDKsaLAyD75obXfofZ3ZxAG00g+4tetgJSYhIaqN8cNq9gabfmYD4qCmd7osMDNFz
	 gf0A+oRXUzmmw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] Add watchdog nodes in StarFive JH7100/JH7110 DTS
Date: Mon, 15 May 2023 17:46:33 +0100
Message-Id: <20230515-tribesman-sloppily-658f86d776ac@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230509151723.84989-1-xingyu.wu@starfivetech.com>
References: <20230509151723.84989-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=610; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=q4UXWBBFSwrCUpZYR2X7bAvP0FrsLTRfFER3VBh/8+A=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClJic8TON0778U8FM7zuXNtguXjL/w2Yc9frHt/4tObj RN+cDx61lHKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJCLowMjx1+f/o2YmWU8IM bnd/X3b4XsazbNsawadR99e2h0u51MxmZLjSXnXh4eO8w5VLV6+qiSjkW35BJy612c95ukPdU83 z+9kA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_094646_277472_3CD80AEA 
X-CRM114-Status: UNSURE (   9.03  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 09 May 2023 23:17:21 +0800, Xingyu Wu wrote:
> and JH7110 SoCs. Patch 1 adds the node in JH7100 dts and Patch 2 adds it
> in JH7110 dts. This patch serises are based on Linux 6.4-rc1.
> 
> Xingyu Wu (2):
>   riscv: dts: starfive: jh7100: Add watchdog node
>   riscv: dts: starfive: jh7110: Add watchdog node
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/2] riscv: dts: starfive: jh7100: Add watchdog node
      https://git.kernel.org/conor/c/435ac3fbfbc6
[2/2] riscv: dts: starfive: jh7110: Add watchdog node
      https://git.kernel.org/conor/c/6361b7de262a

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
