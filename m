Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9D6C55172
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2026 02:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLPIr0XmO9fVLTKjmTgBtf4ZIBOwszrTmuD9XlqmMC0=; b=WUqZ7Ma8tm2NTX
	cgCUWC02AIt8zZ61AerldDSVmzygfmBC+poF1adLb79sXi/pKyUcPKRjidsxyHSzTkFv2Nu15TFLa
	Rk/E53jKJ2oG+0tGmndB//vL1vyshjElQuuhxVyATZPHUMIuwItVFlAboyMQopXRyXlM+c9WcSd+Q
	tPoNGi0FJtxA3HO5Jtbu1BP11+7caHvhJbIe5iDIY9/567q7ws9bm3OxuEnmyHVDB2VTdKYIEmyZO
	oo6K0T7F4/eyPnx4MWvWQckobd6l5dxv+VXV/UBYEMpmKDN4egZBYktX0U6ZjM6M1o0hAy7h1U3io
	5Qfr+HbGSFKbjzsrDBVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLkX-0000000FH5R-1Ark;
	Sun, 02 Aug 2026 02:16:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLkT-0000000FH54-1C37
	for linux-riscv@lists.infradead.org;
	Sun, 02 Aug 2026 02:16:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 158206057A;
	Sun,  2 Aug 2026 02:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DB71F00AC4;
	Sun,  2 Aug 2026 02:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785636979;
	bh=syTg1fcwNfbi5+9+/wIzUNXHYtBnQxYX3VE0DS+A3yM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iedqZAwMc67Unz1NKNbs3pjfc6ntATb0mD+5gQSbtCr3/MeW3rRrM4tP+fY+bqXID
	 4sv9hy25kl997Ug3SHLaPjQBsCgj1za/p8Gc6XiKrDgHU1/e1hoAdHZ87Pc9aA+pcT
	 jKevLgeC60evxsHw14vK9NpYD4k/4cWSuK7NU+AMcHezVcboGaSvZN1qFRhhkzXnGX
	 StvbwQPIforqEWnsk0YeKczJbTmYoquQw7Orf6qCj+VvpFsXzI135ms0seLQbiU7sn
	 6ojiaNcd5cAi6P07YwwvAcZVeMUT1rBEqqxS3rz8UqKrX0D44hoGGe1Jz5ZcFU4cIG
	 Y4cs4DSfIyhGQ==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v2 0/2] riscv: dts: spacemit: k3: Add USB/PCIe devices
Date: Sun,  2 Aug 2026 02:16:14 +0000
Message-ID: <178563688035.1615748.14235029725495774606.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727094726.890179-1-inochiama@gmail.com>
References: <20260727094726.890179-1-inochiama@gmail.com>
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


On Mon, 27 Jul 2026 17:47:22 +0800, Inochi Amaoto wrote:
> DTS for series:
> https://lore.kernel.org/linux-pci/20260709040027.958400-1-inochiama@gmail.com
> https://lore.kernel.org/linux-phy/20260703021024.495433-1-inochiama@gmail.com
> 
> Changed from v1:
> 1. Fix clock of usb3d_u2phy.
> 
> [...]

Applied, thanks!

[1/2] riscv: dts: spacemit: k3: add USB controller and USB phy support
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=46380e4b1534c1626cecd7f4d0abb5e0cce09af6

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
