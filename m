Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3EDC55172
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2026 01:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYySIcNy6nmToNeZ1TJoC1Z+8x4C5+f3tr5+kzXVvjE=; b=3tT822zCmY+Xus
	r9P/wqnNxBImBU12rdLHytO8yj4R+Pe9V84UGdeAKLgOzaV/RwTVCzIzJYqp4rBY+GlV29cBDRyBf
	mWF0FU2ETxQiTrKqD3aC2XhtzRjjYKITG5a7W9Fn0zEqQPHRGF2/hJqMid/66N1mOaYIB6nSXpygT
	TEjs+QvfuqMJSbfDx1XTE9iCUNptBHoPv1G0WhYgGSx/GmVQIaYr7emhyDSIFrYHPo1ePaOiKAY17
	MDME/PPbrJIwNYowY8ZyuzV/YqlnDJ/8mRLT/Ndm8dJqAuvddPbUkQOCCRG968NyceTnYzluuSf+l
	2SFVFDs3EncBWu0FT1kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqL2f-0000000FFYs-1eCF;
	Sun, 02 Aug 2026 01:31:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqL2e-0000000FFYh-1KmX
	for linux-riscv@lists.infradead.org;
	Sun, 02 Aug 2026 01:31:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C8FA414DE;
	Sun,  2 Aug 2026 01:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D9C1F00AC4;
	Sun,  2 Aug 2026 01:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785634263;
	bh=kF/jmHcAj/bSIW3njrcjP3ttcfjXyFDEpBH1tBCyzRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mikZ1883IUq3+1exW3KCr0FvI4UO2SWkwv5a7cduHXhtS3bE/4+wgIlm4qptjvf8x
	 IsDyPOvxfeY1g5PWcpgtBHvLng83oEzf7crjSL5cv3mkmvky3o97JEb11sKzQawZEq
	 tX+OVH8wcNGUVEcwd6FZyCEQ9y9qDwZU+TtB6l+4zrJQkf6RhqMM772jtD+RZpAP9p
	 aUelbLWnFbTGJZJy43X8kxEWopdhpzQWQCPGAaxhxg/fYCEVaLPnRWbSBV0QXktOl9
	 RSKmYr41TJ8t/18l5FM3XmsnD8fA6ANaoAwqDy5jHtX1ZMIxfde0V3zIknBsguPVmA
	 ixo5dxGFbCkTA==
From: Yixun Lan <dlan@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: spacemit: k3: fix i2s clock topology and divider rates
Date: Sun,  2 Aug 2026 01:30:55 +0000
Message-ID: <178563403274.1609232.15890573449451118017.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
References: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
MIME-Version: 1.0
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


On Fri, 17 Jul 2026 00:26:00 -0700, Troy Mitchell wrote:
> The K3 i2s clock tree was modelled on the K1 layout but does not match
> the actual K3 hardware topology, leading to incorrect clock rates being
> reported and programmed.
> 
> Three fixes are provided in dependency order:
> 
> First, the MPMU_ISCCR syscon register is renamed to MPMU_ISCCR1 to
> match the hardware register name, and MPMU_ISCCR0 (offset 0x0040) is
> added. This prepares the header for the clock topology corrections that
> follow.
> 
> [...]

Applied, thanks! Also fixed minor comments from sashiko bot

[1/3] dt-bindings: soc: spacemit: k3: add i2s_sysclk, i2s_bclk_factor and i2s1_sysclk_src IDs
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=cf59a8742581aa4a026b20c7a413be06f4fc9831
[2/3] clk: spacemit: k3: fix i2s clock topology
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=e6b17a690c2f920963d6a9328642bb090f3be587
[3/3] clk: spacemit: k3: fix missing /2 factor in i2s sysclk dividers
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=8a7d4b1924d2a424b1a6fe69de4f9464ee1fb485

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
