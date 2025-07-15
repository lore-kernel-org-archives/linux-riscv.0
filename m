Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A5EC83F17
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 10:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gMajovvHzwgHIZsHuxYBH2cUefiNJsnX3vc5DPtRxg=; b=FpVxpU6G0UuW08
	OSG3NdxZW6Q65raNwzuZw2m+4LL3VCC41Byi7os19bJ2+nDTidnySXUinAENJDkRJcNYbrFcekzwL
	rSNKPmFoHZ5QdvS7EXS+7MPx+MQC8hdVZsrrJQ4tAu4Etgptk7pCTcdebcbMLWdGP7oEJIKr6Zsak
	fdRVe5FtTfgO3QndYBExJmV0bASf5WSk5pEPdzN+iVEJp4PY2gNLkhcSwvNVC2ONirvsR4PGVuF3w
	VvyWXeBhrO50fSeREaRRZ751fYxY6+fAqYusd8u5eJrAsBiNIJfQvts0ACGtP9NbI62idP6v2td0i
	Mi/CCN+K7uUaP1qODKBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcyh-00000004qTH-0hrZ;
	Tue, 15 Jul 2025 10:33:39 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcvN-00000004q2b-38Xy
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 10:30:15 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8CB11340CE7;
	Tue, 15 Jul 2025 10:30:12 +0000 (UTC)
Date: Tue, 15 Jul 2025 18:30:06 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	palmer@dabbelt.com, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: dts: spacemit: Add initial support for
 OrangePi RV2
Message-ID: <20250715103006-GYA540303@gentoo>
References: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_033013_836828_1F14B650 
X-CRM114-Status: GOOD (  13.15  )
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

Hi Hendrik,

On 20:32 Fri 11 Jul     , Hendrik Hamerlinck wrote:
> This patchset adds initial device tree support for the OrangePi RV2 board.
> 
> The OrangePi RV2 [1] is marketed as using the Ky X1 SoC.
> However, after research and testing, it is in fact identical to the 
> SpacemiT K1 [2]. My proof:
> 
> - Similar integration in the Banana Pi kernel tree [3], which uses the 
>   OrangePi RV2 and identifies it as the SpacemiT K1.
> - Comparison of the device tree code showing a match to the OrangePi RV2 
>   Linux tree [4].
> - Locally tested the OrangePi RV2 with the SpacemiT K1 device tree, 
>   confirming it boots and operates correctly.
> 
> Patch #1 documents the compatible string for the OrangePi RV2, and 
> patch #2 adds its minimal device tree. This enables booting to a serial
> console with UART output and blinking a LED, similar to other K1-based 
> boards such as the Banana Pi BPI-F3 or the Milk-V Jupiter.
> 

The patch overall looks good, but I wouldn't pick it for this cycle,
as I've already sent out the PR [5], so let's target at v6.18 merge window
(Please remind me or respin a new version once v6.17-rc1 tagged)

Link: https://lore.kernel.org/spacemit/20250715014214-GYA540030@gentoo/ [5]

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
