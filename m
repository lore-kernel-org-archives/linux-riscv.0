Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0276C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 01:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6mj7YSshmFal4roqvrfbxj32nGJGp75/If8qPNbF9Y=; b=okc7dHbFaEdQCx
	kA//fjLMQwuRw8P8EBC5mxGYfFCxgvlVLl9+eiXS1/D9wHdV3JpRw5g3cDf28chDbtaX6XpBft1uD
	1jeqEBOPeeAYEj+9KvAWVgvk+bIDhuHxzoQpT73+y8Se4Exbx/FRksr7KV9IU5u4tXH5COey9k+mO
	0LvzKbsV/EirbONHF5hN8tAbim2VnZVpoKGK5HCAV53er59XCMXTG/1T+wYc/IROhSbsnO5SErGjh
	JbmQtIQ4WDVS8A8mJjS5072MEcWieFlr3NgKPzQZwSFI14XENGEstxMgu6L/TTpDTjahE+8TiTWNd
	k8TaoBCEwLzz5/pu5IRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni4mE-003AUD-Mh; Sat, 23 Apr 2022 01:41:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni4mC-003ASr-55
 for linux-riscv@lists.infradead.org; Sat, 23 Apr 2022 01:41:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 32779CE2E3C;
 Sat, 23 Apr 2022 01:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A52C385A9;
 Sat, 23 Apr 2022 01:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650678088;
 bh=jsDo2AinF74Ae7fo4jnv164sxB6sHihuJV6AmLjbYXM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=jsWHYvVDd8CGn3uuP2PvRfPKk24vxua4Zk+EjelC6rotUHxuZCfxGkpGTd96C2rS/
 TpBFFyBMykmwbXgQgw4rwjgAkvVl+PC9L+fZLr1o6lG63wA9yiVFxnye/OWFZQ8rEY
 LD8770fklOdHlYoyUYltaomOuf494Vo8yH273Uuar8M/SxrvS5HZh4smUnAcZknJDv
 dnBPGK+UA/tbnhtHeIvMirxzwQsUAXDIG/QVA4oh2XOmE3VyrCf/CgztiOrT0klBNW
 AOxG/s3tK3axH4sqXgWQ6gA0NerB/5P5yK647NsZkePBQ7vOFM6DJ6qYxYHpQdxppH
 9rj4iJHlFXWVA==
MIME-Version: 1.0
In-Reply-To: <20220413075835.3354193-5-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
 <20220413075835.3354193-5-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 4/9] dt-bindings: clk: mpfs document msspll dri
 registers
From: Stephen Boyd <sboyd@kernel.org>
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu, krzk+dt@kernel.org,
 mturquette@baylibre.com, palmer@rivosinc.com, paul.walmsley@sifive.com,
 robh+dt@kernel.org
Date: Fri, 22 Apr 2022 18:41:26 -0700
User-Agent: alot/0.10
Message-Id: <20220423014128.66A52C385A9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_184132_410237_417A09C7 
X-CRM114-Status: UNSURE (   7.95  )
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

Quoting Conor Dooley (2022-04-13 00:58:31)
> As there are two sections of registers that are responsible for clock
> configuration on the PolarFire SoC: add the dynamic reconfiguration
> interface section to the binding & describe what each of the sections
> are used for.
> 
> Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
