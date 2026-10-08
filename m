Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F125CA6007
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 01:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0itfSgLyKxbaxkFOfg8/ClQ3cCYYBP3ZXkZQChCjg8=; b=ZKbgYdTR4nX9iX
	jtbQI3VRdGPodirBRuz0MTKtzXuiD5/nTosFR3jGa6d8MTvZ1pfFK6Udgm4tnlCsbNeVYI9p856td
	mnj9UmM/5Pj+ffuLJBlouQBDDO94q0FysovsZt5uxtxg8QrN8ER/PN0+/+XZ8sFzQTkKxatjYLZdc
	WjxrvWiNNtwlY1J8SteZcUtMJQkFIIzmxMEfHwYErccpcgcZQT/VA1V0NEYXB8VFOTBoONrWmb6/V
	0WF6O9fONNXclraJnVA6LE1H3IcE1yL78IOWyxyHNSnmw1hTA/KIfdLrahlDDmcRA56BCommIxAVR
	gc2pdrXpx4xz+ciZDVnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEcfF-00000003LkR-20JU;
	Thu, 08 Oct 2026 01:11:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEcfD-00000003LkL-2NBl
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 01:11:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84E50400D9;
	Thu,  8 Oct 2026 01:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AD81F000FF;
	Thu,  8 Oct 2026 01:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791421874;
	bh=T/fObdeULtrpvP3s+VTgNAevGF6wTsfnk3IxmzRX1yE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mmzEpyfF8xyE+8gDekWzXECWKry27489yw5MqS9qjDgeZ12FKhkLdvpbE2Z91+J3J
	 CvgIjhpjBr5ruWwDhYmq1JmMV0RJrbsAHsXnXZgEYIPHwUxkHU3YrKfNLVOjefIvBq
	 pepyxfTAb5Lui/iJkpQ2N+kA+tjN1nC+0euG+2HJoDSdsaogD+Kg9oOasA9E9coJxU
	 zcmEtsNgvYMI5I+BOWvxVdvc5jgTxyiLo/Jm82Dt4S5H74b7C6gUwL/iN37nd/gwPG
	 hnwhtXBvFZ1BKdcXV4jHMAXoft0mdXhs7gNsffc6wWhzdCBzDbEhx1WtwCgId6YmKo
	 GoruSNCkm1mTw==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for OrangePi
Date: Thu,  8 Oct 2026 01:11:06 +0000
Message-ID: <179142184707.120056.3281782658169373620.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006100000.548264-1-amadeus@jmu.edu.cn>
References: <20261006100000.548264-1-amadeus@jmu.edu.cn>
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


On Tue, 06 Oct 2026 18:00:00 +0800, Chukun Pan wrote:
> The EEPROM on the OrangePi R2S and RV2 stores the MAC address.
> Assign it to Ethernet, with ethernet1 having a MAC offset of 1.

Applied, thanks!

[1/1] riscv: dts: spacemit: set ETH MAC from eeprom for OrangePi
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=d05c6236496071916e19012cda7149465f15e66e

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
