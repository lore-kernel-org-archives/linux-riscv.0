Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6322C369D1
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 23:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XxS82ouTSroMY+zRGrnwPDV8vVU4Dhg+l4RppbP4EYs=; b=qhxfRodjqn+8E1
	4m01oZpVAcHwK/jJPBYyk6L4eVnm5D/N+LiEMHtlII9fRlHDeH7WrUB4xLVSXLmVhIxCqNx1ZyDd0
	anGEsrQJSRtQcooQ/RFwKusVwJrDRmUdBmWgM31K5pbyToYWi+aRuO8HVzO6BlwZI1Q6nc+yE1dyj
	q0vzR3cA6huEhAjptTGgtCkItEOUwOi61OHses4fap1p9XxAugwD+OMKvY+zCWyoaGIjpERs1kgTG
	1rFRzxmm3E7VmBhSD1ps2H9i/h+mh7MUzJRhKIVMmM6ozP1fo8mJHrZk7MK00m1rUZr67Nm57rYso
	b8pWadmO/yQeqMi1wAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8SbK-000000018Jm-3SQv;
	Fri, 25 Apr 2025 23:36:58 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Say-000000018F5-2X6F
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 23:36:37 +0000
Received: from localhost.localdomain (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4556C340BDE;
	Fri, 25 Apr 2025 23:36:30 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>
Subject: Re: (subset) [PATCH v9 0/3] riscv: spacemit: add gpio support for K1 SoC
Date: Sat, 26 Apr 2025 07:35:40 +0800
Message-ID: <174562390823.16593.8457766773146505593.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
References: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_163636_665545_C6D4C363 
X-CRM114-Status: UNSURE (   7.53  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Thu, 24 Apr 2025 17:40:48 +0800, Yixun Lan wrote:
> The gpio controller of K1 support basic GPIO functions,
> which capable of enabling as input, output. It can also be used
> as GPIO interrupt which able to detect rising edge, falling edge,
> or both. There are four GPIO ports, each consisting of 32 pins and
> has indepedent register sets, while still sharing IRQ line and clocks.
> The GPIO controller request the two clock sources from APBC block.
> 
> [...]

Applied, thanks!

[2/3] riscv: dts: spacemit: add gpio support for K1 SoC
      https://github.com/spacemit-com/linux/commit/39efc98da7c60cad066a18049a98d41b8542f44a
[3/3] riscv: dts: spacemit: add gpio LED for system heartbeat
      https://github.com/spacemit-com/linux/commit/cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
