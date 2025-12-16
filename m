Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D062DD5B87C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 06:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2efi/g60FIip4Vc5GgKaYil8sP1liaoRS8gJG2LpBY=; b=Dd8KsGa+rK3mO3
	UKTndEtTszpZrQByqONT/Uln0nzntYu9cKXg+H3ORwHx/xxUuG9IgHWtpy4bTX5FjekmFZtU+vhQ2
	ZU34s0iGjDsATzNcKWW8YLnEG5LCIJHb4DbohTxXTuHDkVM2xDm9V4iA2SDbiHx94Ex8nNLIaoCYd
	WN7vLe5QZyNowvycjMBlU0JKkQuPa/WowjPy74f2HagyIW78BHDrXtX/JnLmIUN0D0hMTEhKf6nzV
	lP/ibV6XgsxUIhsr2G/QZLdGJJzA7GeBIT7WpR1/cmD6zElseNq56M9xXdF1HAovLJZ+CTk/QYGXC
	nzqMq5M9wsZypcyaagOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOBp-00000004kNj-0gtZ;
	Tue, 16 Dec 2025 06:05:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOBl-00000004kNO-3TEi
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 06:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DF0D443EE;
	Tue, 16 Dec 2025 06:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6E8C4CEF1;
	Tue, 16 Dec 2025 06:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765865137;
	bh=V5gOKNwy2Cgs06XOGM36oTcpuMAd+KlFS0OFCz1ulMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MeDG3XLHn64TA6hrpx6tdbuiWFGkCN6yRJweXTk5ODGW8E7toAENXgOtGOLF/MjYC
	 IfjhOQPSuqSu3Tlkkuft7tNx75dF0zl37jVPDuFTpeBJ0b6EoG/CJaTTk0SOdIsYIs
	 PO10ZeKp/vyHAktK9gyZTDDTmvbwPrdmgS3fHY9LyiZh6yhdGIi/4ktYUn94Kxxle6
	 TkuD4VjDZlzZsdyYD5h/INqmf5hHchcYFSkdD/Z3BC/E3b3DLqSbASbVqC+E4DMwAf
	 MNHAhR0/cPVmrhJ4lxjHvp9Xzb1KWjcnc69te3nMIb7sfdzRKKizdj4iVB0Lc6BaGg
	 wTGWFK5QKBD2Q==
Date: Tue, 16 Dec 2025 07:05:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Michael Zhu <michael.zhu@starfivetech.com>, Drew Fustini <drew@beagleboard.org>, 
	Hal Feng <hal.feng@starfivetech.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: starfive: Append JH-7110 SoC
 compatible to VisionFive 2 Lite board
Message-ID: <20251216-rustling-remarkable-eel-c8bca9@quoll>
References: <20251212211934.135602-1-e@freeshell.de>
 <20251212211934.135602-2-e@freeshell.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251212211934.135602-2-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_220538_813724_57F4DC3F 
X-CRM114-Status: GOOD (  11.44  )
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

On Fri, Dec 12, 2025 at 01:19:18PM -0800, E Shattow wrote:
> Append "starfive,jh7110" compatible to VisionFive 2 Lite and VisionFive 2
> Lite eMMC boards in the least-compatible end of the list.
> 
> Appending "starfive,jh7110" reduces the number of compatible strings to
> check in the OpenSBI platform driver. JH-7110S SoC on these boards is the
> same as JH-7110 SoC however rated for thermal, voltage, and frequency
> characteristics for a maximum of 1.25GHz operation.
> 
> Link to previous discussion suggesting this change:
> https://lore.kernel.org/lkml/1f96a267-f5c6-498e-a2c4-7a47a73ea7e7@canonical.com/

Just use Link tag. That's what it is for.

> 
> Fixes: 7a1e15b248d6 ("dt-bindings: riscv: Add StarFive JH7110S SoC and VisionFive 2 Lite board")

You would need to describe the bug first. Optimizing your openSBI driver
is not a bug, so I don't see what is supposed to be fixed.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
