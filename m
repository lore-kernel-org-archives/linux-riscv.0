Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84786C369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 23:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XuorY0dSPNnDbki+anfVuozTPX138Qp1VhfgOYUZndY=; b=F7M7jRcoCQcPc9
	ATbsSLBO3v8ZMLr4NvWHnGHeBugE1GBUxQ/bHSuRsF39jZlOcJzOWu2A92TI4PrKZYOJfKDwZI7Fr
	zBXSO5cqKK+VjiyoZMyzOUgIDUxk5fjQMoxItBnCHB5vdaXhCxj6s4attW1LSUDUK3FVYwKSF+gP6
	7ELK2iT16GYaHD/YyNA4DkYw0iKTK+fRa6bVNHi2W5cvb5D9gZms2JZRnMswGAG2oeNnqQwDEy8gH
	C3nOnVb0YPtw+ZXgh54uK5tCpomnG8oraaOxfP7R/FzQ/X0Ln2uANV6P3LyHVjiFoUO88Crzt1Yug
	78ypzRZ86uRTUvoUbwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8SbK-000000018JI-19Gr;
	Fri, 25 Apr 2025 23:36:58 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8San-000000018E2-2P9G
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 23:36:26 +0000
Received: from localhost.localdomain (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BFFE6340A12;
	Fri, 25 Apr 2025 23:36:19 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>,
	Haylen Chu <heylenay@4d2.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] riscv: dts: spacemit: Add clocks to pinctrl and UART
Date: Sat, 26 Apr 2025 07:35:39 +0800
Message-ID: <174562390817.16593.734541789172552483.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424-05-dts-clock-v2-0-17d83a705c4c@gentoo.org>
References: <20250424-05-dts-clock-v2-0-17d83a705c4c@gentoo.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_163625_635323_7B6D0142 
X-CRM114-Status: UNSURE (   7.37  )
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


On Thu, 24 Apr 2025 15:48:07 +0800, Yixun Lan wrote:
> Populate clock property for pinctrl and UART controller.
> 
> The pinctrl's clock dt-binding patch is still waiting to be merged[1].
> 
> The UART's dt-binding and driver code has already been accepted[2],
> so we now are only sending the DT part patch.
> 
> [...]

Applied, thanks!

[1/2] riscv: dts: spacemit: Acquire clocks for pinctrl
      https://github.com/spacemit-com/linux/commit/1fa2b7dd8e3efb7b50a24d13f91dc04b25adc43d
[2/2] riscv: dts: spacemit: Acquire clocks for UART
      https://github.com/spacemit-com/linux/commit/fe066af241681269d809ece2ad663f334a0d8120

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
