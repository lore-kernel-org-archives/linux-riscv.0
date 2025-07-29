Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860A8C83F26
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 09:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGBU9f5J1xPO020MQ0JzyUFfKa/VZcE98VIM9CNmZNs=; b=jnneo7hSkKdzcX
	0n+BHm04PN/xsnKRTeq5lgrOe9ipFodV7uRiHojpW897gDXPKau5LMyw9/Hme3mSuliipYZBKDJNx
	D1435JGpY7AFrOmlmxLeJM8lYGpkd9QDh3coiKO+LRkwbJZJOGX4k8W9tA5XGedfeI9aMvKZELciJ
	QcHySUTNqYuswhtkMp3BU87BgYCmvpDJy/buS+xonO7B2rxgqdMYJCcuV2v91Zq5YEoEDztcuVyUN
	hLGe4e5zePmjjVj+1EBT+b8io5sRIPJXP+ndIgTUfKQf3d5uBtyJ+7r2VT6E2n2k09U+q3/bolRTs
	5A8GI48+mpv2cqAouRQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggCB-0000000GJop-3urZ;
	Tue, 29 Jul 2025 09:00:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggC8-0000000GJnF-3ia9
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 09:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40D9A5C5920;
	Tue, 29 Jul 2025 09:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B44EC4CEF5;
	Tue, 29 Jul 2025 09:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753779623;
	bh=NqJOUVSnRAuwlsdCgD7CCgnH8jeSEv6tZOvVIi96fe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9/ONf1Q+KuJNq6cweFcLhJ18FPRsgO8u0mQMekNt0xpmNy793rHy0kQ+DdM5HYC6
	 2UzUNmYpjbNGQgiUrH1v8kBq+w+ymTb4f3ng10d8eO7F+yPPbS1qmfo6FkYRcwGL8u
	 7H0k6BBIsLziLN2niIlGUNTkOOC2tvslr367DVjbiRUGcvQiIABCHOObjB4PpyYpCf
	 yzlLmNk1je9ZKfwLmQtdonw6uEBeX1ngP8M9R8Nuclo3KHyYV9pCsglI02dZPQCq3y
	 iobG/xREiel0brKSIRkZkYqIF5ApsV7K0GhKXkgxuGjo4b2zTEst4UFKSDqLuFr7lZ
	 gcDlvw0zhiDwQ==
Date: Tue, 29 Jul 2025 11:00:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
	Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@outlook.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK
 for SSPA
Message-ID: <20250729-stylish-antique-cassowary-4e3c4c@kuoka>
References: <20250728-k1-clk-i2s-v3-0-5d7579f02227@linux.spacemit.com>
 <20250728-k1-clk-i2s-v3-1-5d7579f02227@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250728-k1-clk-i2s-v3-1-5d7579f02227@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_020024_966745_EB991E61 
X-CRM114-Status: UNSURE (   9.54  )
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

On Mon, Jul 28, 2025 at 10:20:15PM +0800, Troy Mitchell wrote:
> In order to use the virtual clock SSPAx_I2S_BCLK in the device tree and
> register it in the driver, this patch introduces the macro definition.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Your SoB does not match from.

> ---
>  include/dt-bindings/clock/spacemit,k1-syscon.h | 2 ++
>  1 file changed, 2 insertions(+)

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
