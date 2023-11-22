Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C5AC61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 12:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLiz8KAaF9ZDhvEDi6hqTYqnbgS9KHfuDwoVFNrO9U8=; b=cNx+EX4EeQnalm
	xn0FreTxkdNXqJ4WYdlM7eWC8Ce3mY8t9ZqDYLP14l07cZUES+LGonPiAduKh7kw5mCe2WdANGkzN
	ozgxq6TOIqo707i10rMDAFukKBPBAOEgNMIpKPOqujeDStCzMPYdl1rbNPYWWDuq3JgwZHtoJCAUy
	6gbM//U0iJgj/HxcC2VieI/7PE30ZMq60wIr7Spr+8rZGNdtx+HzrOtJ4yDdCNNl+Ird5gwFHMJcX
	SPOeNPNCPLYu9KJQ+EkUSOHm6qRkLirXO+t2Iwr3wwSC2NQpv97B2tRR2KjuM+0R60jlG0kbz/ArH
	XmgsLAvZ9eKVBPRSmZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5luA-001jDK-2u;
	Wed, 22 Nov 2023 12:00:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lu7-001jCP-1w
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 12:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 406F6B80DCB;
	Wed, 22 Nov 2023 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C4AC433C7;
	Wed, 22 Nov 2023 12:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700654423;
	bh=yLbsIndVEu9nwXZGIk3y4ZbcjJ+wx0rGSOC9LYLvqkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LLv9C4UHg1F32f03vhMzZZoVyMETeNhdIkamILbfGRdlfAsC3UXIrJ4JoERKSfODc
	 3foeqgG6MUhB7falkOPj5do7txjUSJs66D4jh58XmjwmuOyLDvqdsInRnkopMmMh/E
	 OE3YCMv2VbMW4qAr3LpbNqWSFvJLVOa0ymYYahhah1j1FpiG8vcSGwgjxAh979rElW
	 UDoi2FtRbOYQ8oJiF27nx6MH0g7zYrOrd77z7RhFvYxvdw3nlE8AJoZFq38y86oVj6
	 UQQGAC9F+sWpNkpdl3PZflHsc6oZm8VGQcMC3gtoDH5JlucBOSztUXuyepO3Q4Vmrg
	 pzrnzWOP0FTYQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v2 0/2] soc: sifive: ccache: Add StarFive JH7100 support
Date: Wed, 22 Nov 2023 11:59:22 +0000
Message-Id: <20231122-vocalize-splotchy-1cb4f171dda0@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031141444.53426-1-emil.renner.berthing@canonical.com>
References: <20231031141444.53426-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=763; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=WfkmwEoyD3fGvlSTinUXdzHlQ+oJRv+XCNHDd7CpSRc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmxbyXCdY+2Tj9huPV1j/BlK0/bKVnmcz9OCj63a1G72 rJD3mxGHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiIaSDDX6nPkj3iTawJCyMm CfMvTM0vmSW4SJed65blKyGH3kPnFjL8s1mWFZ6Z/JFT/vzL6YysWsn2pZzG0WH6MsJb3p7onVn IAwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_040027_818143_22755BE2 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 31 Oct 2023 15:14:42 +0100, Emil Renner Berthing wrote:
> This series adds support for the StarFive JH7100 SoC to the SiFive cache
> controller driver. The JH7100 was a "development version" of the JH7110
> used on the BeagleV Starlight and VisionFive V1 boards. It has
> non-coherent peripheral DMAs but was designed before the standard RISC-V
> Zicbom extension, so it neeeds support in this driver for non-standard
> cache management.
> 
> [...]

Applied to riscv-cache-for-next, thanks! I still need to figure out how
I want to put things into linux-next as Arnd wants these cache driver
things in a PR of their own.

[1/2] dt-bindings: cache: sifive,ccache0: Add StarFive JH7100 compatible
      https://git.kernel.org/conor/c/3d70b9853b44
[2/2] soc: sifive: ccache: Add StarFive JH7100 support
      https://git.kernel.org/conor/c/0d5701dc9cd6

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
