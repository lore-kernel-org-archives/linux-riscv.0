Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EC9C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 01:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0PtZb6NpMEjC+eWIAYPTwo89YhowK7WFo+kgQb/d14=; b=A5kO7NPUaMg3o0
	MaTARx6qxreJSqBkgV6S4C50rwy7GMhs038GY7q79eK/p4kWrOO//PoXQzENkED+EjdlnVIQ1hs25
	Lgh7HURImIoz3BhFq2XYBxM2OnYq+h1MmccmJ4OJVrdntqsx2jSshk3MVAXQmvU5fT8Hrm78hf7co
	90Lui8RJC9GLxEEAjt0n8tp4+CsPZTi6RmLMgr/ifTYEcGSmSQ2c4mxYsVO6U0FojNuScT2JnIPnV
	Ze7nzGWinSwnYPC2WI06tvKhxIDB3kahZ5kXaY7n8/X8XfzE1DCRecKNFm/eWrQVtutYhEswrWBKw
	JgYYZECfZEjsCwX3MbUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni4ln-003ANh-Ih; Sat, 23 Apr 2022 01:41:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni4ll-003ANL-J3
 for linux-riscv@lists.infradead.org; Sat, 23 Apr 2022 01:41:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3203660FE9;
 Sat, 23 Apr 2022 01:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8574CC385A0;
 Sat, 23 Apr 2022 01:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650678063;
 bh=tuGqr6gU1mR99kcU7SKJ6rO0n2SxgGEXTouyCk2CgaU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=WT6vLbePq92qdTMMPpP1ABP8r+vcFSCAK0o47fmPsc6iX4YKTZYgz9ppRyjrv6d/I
 dUDRG/m/Hz/qwdk3HlIweANQiaA2YBV0yzNYUV0n4ULUbnj7thgkt2c5f5Sfcn+qPC
 7VEtTP62rdp+NsbJIgVuCLf3m/QogP7Fqlq0z0pTTOlh0y9kuoqitqUdamzA4p1Gda
 ddbYVL3JGqGDiC/FP1A2sVf4Dt1GdunnTVfE4X0UpmNgwZNtdKV5+WVyBrCoOQXmnK
 IiPGQlPV1JzV12YMNXjYLdsMNv7VjH9ZKJB69NzJ6v3ziJEgcpakOimc4J/q7oMEJd
 Yz3WYShCgs6mw==
MIME-Version: 1.0
In-Reply-To: <20220413075835.3354193-2-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
 <20220413075835.3354193-2-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/9] clk: microchip: mpfs: fix parents for FIC clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu, krzk+dt@kernel.org,
 mturquette@baylibre.com, palmer@rivosinc.com, paul.walmsley@sifive.com,
 robh+dt@kernel.org
Date: Fri, 22 Apr 2022 18:41:01 -0700
User-Agent: alot/0.10
Message-Id: <20220423014103.8574CC385A0@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_184105_705343_4F897F52 
X-CRM114-Status: UNSURE (   6.11  )
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

Quoting Conor Dooley (2022-04-13 00:58:28)
> The fabric interconnects are on the AXI bus not AHB.
> Update their parent clocks to fix this.
> 
> Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
