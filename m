Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005DEE64002
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 07:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFAXU5mIgRSWXdSuO65d1e+0LCECvrmpOHdhX3Hzj/k=; b=a5cmhAOa2UkSED
	yVBNz9SqaQLvsG/xF+E8umoHxGEe+lPolKajsrSWwpgZb4ZkXgqh0JE+foRzTUjUHekTiXRyp4b7m
	9lGhtfPNHNDLF/KGUYeY8R6NAqG2dpilJ8XHaZRKR1zJCzgC+5K5+pz1J2ZbiYLhBgYXty/MSOYEL
	07pj8ccrlphTDE3uZcZ2opzsJiY56YiBhsgE+lJZFoCyfybV4lnTZ4WWxpK47639RT6ddrnzMlMTj
	1tGQwXWj08ZboTUqVj1xVPFngvjCsxejXjd4jnypoyx5+JFNYMpzKgcu3TnLs1Z6L6apDRYdoaW4f
	Ai3U+n2hgiNLxibw67Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Hl7-000000041hx-2Bw1;
	Sun, 05 Apr 2026 07:19:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Hl5-000000041hj-2Oml
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 07:18:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09A9F60018;
	Sun,  5 Apr 2026 07:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3180EC116C6;
	Sun,  5 Apr 2026 07:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775373538;
	bh=sembIhwHWHesKkKOxQFV+/J4/sEb65hw4yDq+FpY858=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xqx4mayqvD26ucN9ZPO3b3m45iY0inJpy22eUCon49tpRExTBbbw9tO5nMTvzsq6u
	 v2DahNeqe7sVRh95pE99fAC5OXzqLX1YnZCNoPJhZ2p4IIKDKYcBp0SEKi4bFS6AsX
	 CgJaLlbL3kE5BDiOqMPg4D1AtnNIlkCiNq9zdSMPMiut4A929dnaJ5pvOVQOXOMm7G
	 TXchoeKzB9EHH6ij6gj5l9Prc1C/s/8iaHZY4wb8JTLfVN2K5hcVhCF/y4qvV0hHjI
	 Qo38DC+wBYcdO4JZIvi7F73VPPGA8NP3j2Dq6q28S/F0nAGa1M7joBBXOsCP+RLDfa
	 azCI8x7zpUALg==
Date: Sun, 5 Apr 2026 09:18:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Ley Foon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 00/13] Add StarFive JHB100 syscon modules
Message-ID: <20260405-thick-independent-okapi-abc771@quoll>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
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

On Thu, Apr 02, 2026 at 10:49:32PM -0700, Changhuang Liang wrote:
> StarFive JHB100 has many syscon modules, as listed below:
> - pcieep0_ecsr_syscon	(PCIe endpoint 0 externel syscon)
> - pcieep1_ecsr_syscon
> - host0_syscon		(Host0 syscon)
> - host1_syscon
> - husb0_syscon		(Host USB 0 syscon)
> - husb1_syscon
> - husbd0_syscon		(Host USB device 0 syscon)
> - husbd1_syscon
> - husbcmn_syscon	(Host USB common)
> - gpu0_syscon		(GPU0 syscon)
> - gpu1_syscon
> - b2h0_syscon		(BMC to Host0 syscon)
> - b2h1_syscon		(BMC to Host1 syscon)
> - h02b_syscon		(Host0 to BMC syscon)
> - h12b_syscon		(Host1 to BMC syscon)
> - vout_syscon		(Video output syscon)
> - pcierp_ecsr_syscon	(PCIe root port externel syscon)
> - pcierp_syscon		(PCIe root port syscon)
> - usb_syscon
> - npu_syscon
> - per0_syscon		(Peripheral 0 syscon)
> - per1_syscon
> - per2_syscon
> - per3_syscon
> - sys0_syscon		(System 0 syscon)
> - sys1_syscon
> - sys2_syscon
> - strap_syscon
> 
> Some syscon modules contain PLL, reset, and socinfo nodes
> This series will add these syscon modules, as well as the
> nodes under them.
> 
> -PATCH 1:	syscon binging
> -PATCH 2-7:	syscon PLL driver
> -PATCH 8-10:	syscon reset driver
> -PATCH 11-12:	syscon socinfo driver
> -PATCH 13:	syscon device tree
> 
> This series depends on the series:
> https://lore.kernel.org/all/20260402105523.447523-1-changhuang.liang@starfivetech.com/

So nothing is testable here and I am sure there are obvious build issues
(already spotted one).

I won't be reviewing it.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
