Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9449FB3D03
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 10:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=McOXVFi+FAQ4Se+EFPq28o0RAehcsarqtHNVtoSuA64=; b=G47hGsBq0SF/hc
	nTx4e21K9zQYIQV3Sq6kYq/1Kruoj69slS8svgap1iiRcym07JVyuKE+Q4J5WlX16l2bkaocc/gqS
	e7v5mtXLWiVUHWw2fftaIVqHbGLgF7cgn0fg7kPQWaErTPMCA3MQmCYnZGYeBWvieOcAyluapIB+b
	h6SMxNLSA0gHi7riSyZkH60FkzLU4y3v3CyvWMnd3HZ7wHch3S5i/kO/+99i1PjOoLX9AtP0g5sKK
	7PQehxeODGv7P441BJ8ZZoOfckZKse0cEUjFN60ubwFeVgT72qrXS9yozjfyAZVWbOAh0hr1Mr4Bk
	XYpRgC3Ac+maG9c/Tuug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7A1B-0000000B51r-3TUz;
	Mon, 30 Mar 2026 10:38:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7A19-0000000B50U-1uiH
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 10:38:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C725743C7E;
	Mon, 30 Mar 2026 10:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78123C2BCB1;
	Mon, 30 Mar 2026 10:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774867126;
	bh=Up2jSL42UaI/x/7sZuYAASmrStypwv5klvrtpgOj6Tc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LAsYXpaPQU8s0/0/r5BVU1VyflN60Ib28AvHL7Z0UP1tsU7+y7TXWL0S+cyhKLIV5
	 bcLKML+0309w5N1OVqszb4td+g5E/RLBzulS0opvYqP7iTwequom5MTuH4jl8w2dFY
	 4qtvLDpJs1hJFAf7q6zliGdOfrqM8nXEpUop653D4Yj3N4UzrxL17ncsBqfQrPwZiU
	 NDNSRy1KHVnMLTNtGXILkb/CNPDhsQfabqHBKM+sFHHw0zvsgwWVfr/8u938t7xzCb
	 bEtJACkZoPqCwhmchB1LtLSGQNft4cW/OnEcJhijk1xqci6y8xCny/atBBzBbrWU1z
	 dVtEm2x+dr9oA==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dts: riscv: spacemit: k3: Add i2c nodes
Date: Mon, 30 Mar 2026 10:38:40 +0000
Message-ID: <177486686484.1895179.11451358903582402960.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327-02-k3-i2c-v2-1-2119c0918868@kernel.org>
References: <20260327-02-k3-i2c-v2-1-2119c0918868@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_033847_517621_D4DC9D36 
X-CRM114-Status: UNSURE (   7.93  )
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


On Fri, 27 Mar 2026 11:40:40 +0000, Yixun Lan wrote:
> Populate all I2C devicetree nodes for SpacemiT K3 SoC. The controller of
> i2c3 is reserved for secure domain, and not available from Linux. The
> controller of i2c7 simply doesn't exist from hardware perspective, as
> vendor directly name the i2c controller used for PMIC as i2c8.
> 
> 

Applied, thanks!

[1/1] dts: riscv: spacemit: k3: Add i2c nodes
      https://github.com/spacemit-com/linux/commit/cb322cbffb1e70b4ca1be7955ed19fe486de8295

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
