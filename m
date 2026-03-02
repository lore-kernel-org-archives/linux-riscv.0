Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88D9D58E49
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 03:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oaff0tnjZu7xH38NTvIWRQ5A1VWF1liFh77V6mqntso=; b=gzpdBL8P3njyoM
	vsVsQ9JpbZJFuzSFqY6dwaS+BJHChtvcRlNOSEX95q/vDUYTwBHYS1ULq3/4oyFiySiqE6ntgS8ce
	68Nd3pzTzH/UvFOuPWuMIfWTLjvn3iEZauok5l1NbZApCWtkI6PllK1303PdjIG70dgYuN84FEpoI
	Bkv4UYIoeKvtEeGz/b1VXRVkIH+L06loP5vdlajL3vYY4FrGclEIO5osL2u4PbjFzIuUt8LerXi5j
	ObctaWZDS1jwU1F1sikidka/fcB5D/N3/20VGMBhvqz3wYgwJSqK8dijnrrpq8IJEj9KLK4C/ztqY
	SwCL0nOKVqPsYPdh0w+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwtgB-0000000CA33-2Pul;
	Mon, 02 Mar 2026 03:10:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwtg9-0000000CA2v-1G9O
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 03:10:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 237DA60008;
	Mon,  2 Mar 2026 03:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0603CC116C6;
	Mon,  2 Mar 2026 03:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772421039;
	bh=8piDJdEb2svg4illNkL4A8g7vlo1UGyKKu2McF1IevA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o7XfhUmBvLDeLHzdlssWu18VjgCZR2PTujFG9ySGUoGwiTUz+wZmawpVch0WHgNll
	 OsumX21hsPbyd7lgfd9c1kvcIrbHet4YlbBKvoWv4z/TU5nnVyHTM865cifRfc28xP
	 tyyPzELsyqOQc4I874jRlSMom7AW20iDttbfH5/x3+FrEaz519ZJJ/zjGRES5K0M8B
	 OAFR8lekHFd2RT8tKggumSUdzue66SStoF6EktHatEt0XH94d1q4k29+PW0YswuZCv
	 F0hC+U0fQuIt3qKnDO+lWAicUMbTlA3w4RH6UZInKZdKv0VPHazr3aX2MA/W9KOXxu
	 L2V3LKUCaObIw==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH] riscv: dts: spacemit: pcie: fix missing power regulator
Date: Mon,  2 Mar 2026 03:10:31 +0000
Message-ID: <177242077522.24322.7382117615305152301.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226-k1-pcie-fix-pwr-v1-1-94b493cd27e5@kernel.org>
References: <20260226-k1-pcie-fix-pwr-v1-1-94b493cd27e5@kernel.org>
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


On Thu, 26 Feb 2026 08:17:55 +0000, Yixun Lan wrote:
> The PCIe port require 3.3v power regulator for device to work properly, So
> explicitly add it to fix the DT warning:
> 
> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pcie@ca400000 (spacemit,k1-pcie): pcie@0: 'vpcie3v3-supply' is a required property
>         from schema $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml
> 
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: pcie: fix missing power regulator
      https://github.com/spacemit-com/linux/commit/8a9071299dec817a544c0fb48f7302396fafdc4b

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
