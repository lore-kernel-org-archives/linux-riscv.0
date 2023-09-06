Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC0BEB8FAF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 06:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0T5FubVtQFJRkmiYB7iAIIyfcNPUC/H+VH+8O1ImbrM=; b=nuyxcxTEMRzK5e
	yAPjJCouW+hIq8rmxz/A+sFRSd6eKsvYfBYqaKCPKGkEn8dOFe8YdAkElJ5O6mK7ybNljmXivqMp9
	5nr54wsy+21SQNG8pE6WKPHAKPyDKeF06kNpkhIPKmTCYDMx5ZV1v3cDVCMxYZCdw9ywc/ujuEAZT
	69vShito3Ct5yNqtcrZaS/2NXl/GzkL1/vlP/kudwb6LyNEnQpx2pXtaUZpbFbHwB/jiGndQOfheO
	C7jCxSwFqhh7xlK4H1QEOq/wQnffuv2KGE1GQy/6bqhVRkrmgyffe8QrqQdvlVQUMO6YhpxIkqIs+
	nIgDwNMBzDlWacpS7+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdm0D-007MXj-3A;
	Wed, 06 Sep 2023 06:27:01 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdm0C-007MWO-0q
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 06:27:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qdlzh-0003BQ-Jy; Wed, 06 Sep 2023 08:26:29 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qdlzf-004MiR-BI; Wed, 06 Sep 2023 08:26:27 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qdlze-0003WN-36;
	Wed, 06 Sep 2023 08:26:26 +0200
Message-ID: <a0894d3dece496f6d2d8bf4e5379794369d48a9e.camel@pengutronix.de>
Subject: Re: [RFC PATCH 0/3] Introduce reset driver for T-HEAD th1520 SoC
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Kwanghoon Son <k.son@samsung.com>, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jszhang@kernel.org,
  guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com,  aou@eecs.berkeley.edu, inki.dae@samsung.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Wed, 06 Sep 2023 08:26:26 +0200
In-Reply-To: <20230904042559.2322997-1-k.son@samsung.com>
References: <CGME20230904042603epcas1p40f732a0ac7871371126d229945cc0849@epcas1p4.samsung.com>
	 <20230904042559.2322997-1-k.son@samsung.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_232700_300966_E04B3A46 
X-CRM114-Status: UNSURE (   8.40  )
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

Hi,

On Mo, 2023-09-04 at 04:25 +0000, Kwanghoon Son wrote:
> This patchset adds initial support for reset driver.

what is meant by "initial support"? Are there just more resets than the
two watchdog resets, or is there other functionality that might require
describing in the device tree? Is the dt-binding document complete?
Is this the only reset controller on TH1520? In the thead-kernel.git it
looks like there are at least two different ones.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
