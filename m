Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0180E67487
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 23:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCeJOTxa8iv+1UkwQgaVi7uK8NHNPxE/DSmIWu+MTG0=; b=MnJqh/mGaGLGkD
	j/2OyD9L8ByreJOT6d17CcTfoSpoJX+ygp4qn1YWIm1eDKHM7wc+adElqcMLmk6qYapUQr1utUvzq
	SAz5K3pZ1OVEpWnZ7u9bV5TDzgEtrWkY3A352zxmliP4SVwHWWTPdcsZYnVqAErqqDK7mSAaraQm7
	+ekden+a1ik2c5wFAUXe6zjTLFvqlG0wMasc0XRoRw66jxAW/1GFfxKLrJBX3VfLRaoAmmhvvCdfP
	BJadcPJTs+O9EzVg4T+HfjAHgblA1xm8iLeZAqbzyWBpnHOfTiAMj/8U0bAEGzgzb4StpqT1Wtwmp
	ZCl70vr/uowX+qYab+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX6VE-0000000Bz23-45y0;
	Sat, 20 Dec 2025 23:36:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX6VD-0000000Bz1v-2oYS
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 23:36:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3958B60007;
	Sat, 20 Dec 2025 23:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98678C4CEF5;
	Sat, 20 Dec 2025 23:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766273774;
	bh=iiY7uGZhU8PM+EyETBd5Dq0Z6cb10ORJF5o1ZB4aU4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CH3ezA7Egf3Dpmrdai70Saj1XZ1pDz1nNKHcjnfO1CLWquUleT2Hu4FXebujyMilU
	 1B4Uo+NJnTZlZIwIFb85RRnYI9J6VeXesnVb4HAtH72/ajF17VFquFLswHhA8I3svL
	 yooNZlMNeHwQ6yRJ9DRtG1cufnPkWspTGYFsrHUHGB0niIwSQYsx/iW+TVfyqTv5dq
	 ujtur/TxP6sfsWOgQz9zdg33DZu1ZVSCgH6u9XJUhWWPBRMm3YLYQJ8Grw1HUzcTkx
	 RuIebiCBSpyrckNGnvUiilbamYc0WtSjSjfZ9Xn4fyRiekz5wmGgqgtvNJn8xcVCoY
	 IYelnCICIXCUQ==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] riscv: dts: starfive: Append starfive,jh7110 compatible to VisionFive 2 Lite
Date: Sat, 20 Dec 2025 23:34:41 +0000
Message-ID: <20251220-faceless-sedate-4053b07c5725@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251212211934.135602-1-e@freeshell.de>
References: <20251212211934.135602-1-e@freeshell.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=xFqiQeRPv1OHoeevUPaQHHXdpxwyUMvRPKwdQRmtyEc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnuRhPv1sWnMgceNr18KuHq8+shnXJv67y2x0+d4vyja W25nNrfjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEyEs5SR4eHb1DtvK/xfZspt XPdO2a2Nv+58ZDuTH1fM/cVtTP5Rlgz/Yw5LpPsdOnNh95fbxdEyzZF9lesbeRzNL7ZM/Fr2m3U KMwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

On Fri, 12 Dec 2025 13:19:17 -0800, E Shattow wrote:
> Append "starfive,jh7110" compatible to VisionFive 2 Lite and VisionFive 2
> Lite eMMC in the least-compatible end of the list.
> 
> Appending "starfive,jh7110" reduces the number of compatible strings to
> check in the OpenSBI platform driver. JH-7110S SoC on these boards is the same
> as JH-7110 SoC however rated for thermal, voltage, and frequency
> characteristics for a maximum of 1.25GHz operation.
> 
> [...]

Applied to riscv-dt-for-next, thanks! I dropped the Fixes tags in the end,
I just didn't feel like they were correct. I made the links into Link tags.

[1/3] dt-bindings: riscv: starfive: Append JH-7110 SoC compatible to VisionFive 2 Lite board
      https://git.kernel.org/conor/c/d2091990c5c1
[2/3] riscv: dts: starfive: Append JH-7110 SoC compatible to VisionFive 2 Lite board
      https://git.kernel.org/conor/c/7c9a5fd6bb19
[3/3] riscv: dts: starfive: Append JH-7110 SoC compatible to VisionFive 2 Lite eMMC board
      https://git.kernel.org/conor/c/4297ddbf1d14

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
