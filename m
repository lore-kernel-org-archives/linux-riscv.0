Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD146C61DE1
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVaRbQeWbUZb+Zk//xEcnwzM5qaRMzcmUe509nldNI4=; b=IlQimtuFKIGyQ+
	iNpIff6BqWkCNi2jxS+TQi3kRq0ij46qCPeiuYroWomL8tePcQT1Ko7gWn30Kn6bDub3jmXhBxisf
	ZY8crnDMnsFt+pIP4Td/w/ejmRyX6muDJOk5FFReSRG18GRk9L552s0sjYHUIzx466mQi2fE4EZb5
	NCGmsPrpoieDNkLnARNCnq/MuSTDEdGc1Khx6qPcAgR9BNWSRMKScJrn6oV6Xo/OfJ2yxh2q+gVim
	BME1aZLFyCkOGgjk3F96J5wv4VmzZKVrusslHjNVUBNt+atIn5NFX2wLWd8nxet6yMwXQOXFqqJ+r
	u3b0HMIdFw4p+549Ejmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0k0o-00000007ybZ-3cgo;
	Sun, 30 Aug 2026 18:12:10 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0k0l-00000007ybF-3RG0
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 18:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=63q7KWBMMKfdpLCByy632p3117VO9cL13L0VjuNmpXY=; b=IUqju8NuF+y1DWb4nUmKzJWfQ3
	N0m1q9iCHezmZbicx5R39zA2YYDvI2YBN56wDD/ArDPkJE3t8+HWIj8Dp1xagBj/TUiYg2DK8umVk
	6c/G3kXmtGtIDL5XnEyIaOlk1o7mFYNtKEZJ64oh9uug6TV6XriyCzelJ9k6F+eUX/EdXi8LwGaU7
	LYy26CgZD3ilHCtmFys5LmHLT8qIgHdkdELF1iJVnHxw3N2aaqcG+7oWQXKvL9dNSteXH3KokOJv1
	A44YcpT8KuXsp3Sv5f1owBZxpWmOGbPfpnwkEG1dLS3Mgyspau+SduFH6dZ9SwEzySSDXODSVWTwo
	2eLmUORA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0k0f-0000000AF5E-3gxL;
	Sun, 30 Aug 2026 20:12:01 +0200
Date: Sun, 30 Aug 2026 20:12:01 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, stable@kernel.org,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH] clk: spacemit: k3: add 2.0 GHz PLL3 and PLL4 rates
Message-ID: <apRyccJsMjI8Qc4z@aurel32.net>
Mail-Followup-To: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, stable@kernel.org,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260830172925.3245444-1-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260830172925.3245444-1-aurelien@aurel32.net>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_111207_864078_D63F0540 
X-CRM114-Status: GOOD (  13.31  )
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

On 2026-08-30 19:28, Aurelien Jarno wrote:
> Starting with version k3-br-v1.0.7, the vendor U-Boot configures the C0
> and C1 CPU clock domains (X100 cores) to 2.0 GHz instead of 2.2 GHz.
> PLL3 feeds C0 and PLL4 feeds C1, but their rate tables currently contain
> only the 2.2 GHz overclocking operating point. This causes the linux
> kernel to hang at boot.
> 
> Add the 2.0 GHz configuration in both tables to fix the issue. Tested
> with both k3-br-v1.0.5 (X100 running at 2.2 GHz) and k3-br-v1.0.7 (X100
> cores running at 2.0 GHz).
> 
> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Cc: stable@kernel.org
> Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  drivers/clk/spacemit/ccu-k3.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> The related U-Boot change is available at:
> https://github.com/spacemit-com/uboot-2022.10/commit/274f664150dade144df265baf7dc8e15dd9cce52

FYI, this is the Sashiko review:
https://lore.kernel.org/20260830173644.193B21F000E9@smtp.kernel.org

While I agree we can fix the SpacemiT clock driver, we'll need to add 
this rate anyway, and it immediately fixes the issue. Fixing the clock 
driver is more work and this will take more time to fix.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
