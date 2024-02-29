Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9DAC54798
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 20:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCPsDu+uoPxN/Mm/0cbYHSLRc1Sz2PkPrUWCpOkBtEY=; b=JhLDvqqnfmGiW4
	7G8NdgEaIKTWitCk0SDUrWswaugK+8xOZ/7BuQmGHeM0I6bWYTxiJIomeiL0v14RiMkS3OpOSVuxB
	ZkSzKa1voFgbq1HIzvdfuLbzMY6wkYbivm48umCQquKPkwi/OgFKwiJZc2hf+Ic8jfk6mzfUH34RL
	5aedqSAPNOXgXES6doHfH7wik6wWwgM9zhwqZ06zvALNmSn0XfDZCqw0iwTsDH9X8lbiD7I0M/0VX
	BT5jnhQQ1D0r73ZwimpsK8CrcpRemk7y+p2+UWRgD5rYp20UqTqW657BgEPT8gPSZAmYlgCPBzsKP
	znu7lO9tIOYEIeiEKVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfnDQ-0000000F7ty-2aHr;
	Thu, 29 Feb 2024 20:41:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfnCw-0000000F7e7-1sQq
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 20:40:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E93E1612B4;
	Thu, 29 Feb 2024 20:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022D6C433F1;
	Thu, 29 Feb 2024 20:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709239245;
	bh=T/akRPi5ao0d12BmCz3WEgH+FPHY9KHNebOOEFBHkBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EFQol4sVU2+K8g+pqLmbEc0eSBftT1N/OQVdjBoQHD8OUWSy3KNVThXj4t/Iar+dY
	 lm9MvfkkypkxUdm7mJhSPsI6a3MF7ptGoteFFCSoVnJ57YudlGN72MVVItxStLqyen
	 JBzdEeKE8B29IiMX+tYc5RE8KzhCLf9i1Ctnr8s/1ItScvVHX2YPb+cgnjfWUpWKHg
	 +v+0kJaLIshKRyNcIEkuo56DoXTegBIJOm0kxd18v/Q3+II7V5V/4eF9rzlTqX/D/5
	 1C9f8lq8+bGSAeIyvt1lnvQgk2GmiEJ18wpwG7f6WAY9V80tirZJrP5pB0avoNTI5M
	 +F/nWzJ5crBBg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sasha Levin <sashal@kernel.org>,
	conor@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 04/12] riscv: dts: sifive: add missing #interrupt-cells to pmic
Date: Thu, 29 Feb 2024 15:40:26 -0500
Message-ID: <20240229204039.2861519-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229204039.2861519-1-sashal@kernel.org>
References: <20240229204039.2861519-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.79
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_124048_451394_D8C4C4CD 
X-CRM114-Status: UNSURE (   6.93  )
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

From: Conor Dooley <conor.dooley@microchip.com>

[ Upstream commit ce6b6d1513965f500a05f3facf223fa01fd74920 ]

At W=2 dtc complains:
hifive-unmatched-a00.dts:120.10-238.4: Warning (interrupt_provider): /soc/i2c@10030000/pmic@58: Missing '#interrupt-cells' in interrupt provider

Add the missing property.

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 07387f9c135ca..72b87b08ab444 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -123,6 +123,7 @@ pmic@58 {
 		interrupt-parent = <&gpio>;
 		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
+		#interrupt-cells = <2>;
 
 		onkey {
 			compatible = "dlg,da9063-onkey";
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
