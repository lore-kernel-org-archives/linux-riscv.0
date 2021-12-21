Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F10EC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 01:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czwTH5iNLpyZIqwpF6P+LqoD9WJi5/TxEKDhXLkMuZM=; b=mWL2lFkKEH4N4N
	pu5MVXzc/THdiQyv6cO+KCBLHqpDmEjayy6IxeI3bABTdhcE6JCCtJAsP2AbE58VmySYHF0RowYFr
	hmCF+xtakV31cebXBWeDct8Xk5jlQM7jwG/nXXNBDJnvC9mABqufxKdCmhiowlPScZ5Q6MVagb/bG
	QNyKCea7tQzxqH8mnO8y9nIF5SgqXfk2z8Y8NkuHREFCS0ueODnEvFE8O5x3W6mNEfFNf4bENmbna
	gyhRos6xeTDfXInj5RyX33U2ktRrejDb3RVEiSihdwz0FqyFc2nAeGdID5tofe24t3A0ogMti3OYQ
	22kCtMtzKSyMNXCKsc1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzUQc-0057Wo-Ix; Tue, 21 Dec 2021 01:58:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzUQZ-0057U7-FI
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 01:58:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 042C66136E;
 Tue, 21 Dec 2021 01:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2302AC36AE9;
 Tue, 21 Dec 2021 01:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640051934;
 bh=Afu9l4w/gvyA5c/feIE1na4rvdsZEWsBjcE5lry7ZvU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gK3KyxNY6yRzPPLOdD4vIvdSZRYfTLtJ3/LXLDtghEXSBtpnb7PVTKvNTfruuAh+r
 Hhb8gdMAtOUqQI6gEATZcSinOP9F2PhQXEe8R9KfQnHg81j8VrY8a52Ui7o6NFatfN
 9rPW2LF7bxEGMP8rBmGmgzqmQ+YBIQPHISCKn4l8DZDFNXiPeWKAlMJAZ9Sigjk9TC
 FN5UGqCr10EyKJI/oRpPTdNe8OzHNuG3eUvoQ8QRL/8OpP2M8hRIZNCvWCjqTU/BTd
 KY+Vm87Q+TjybJd3EzO9nXU7RP13b7x4w86tStD97W6bVruxlh12+jKziMiDSZ8yL5
 wzzXwVCkF1L9A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vincent Pelletier <plr.vincent@gmail.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Sasha Levin <sashal@kernel.org>,
 robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, qiuwenbo@kylinos.com.cn, yash.shah@sifive.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 25/29] riscv: dts: sifive unmatched: Expose the
 board ID eeprom
Date: Mon, 20 Dec 2021 20:57:46 -0500
Message-Id: <20211221015751.116328-25-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221015751.116328-1-sashal@kernel.org>
References: <20211221015751.116328-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_175855_610181_CA1644F8 
X-CRM114-Status: UNSURE (   9.52  )
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

From: Vincent Pelletier <plr.vincent@gmail.com>

[ Upstream commit 8120393b74b31bbaf293f59896de6b0d50febc48 ]

Mark it as read-only as it is factory-programmed with identifying
information, and no executable nor configuration:
- eth MAC address
- board model (PCB version, BoM version)
- board serial number
Accidental modification would cause misidentification which could brick
the board, so marking read-only seem like both a safe and non-constraining
choice.

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index a788b99638af8..7ea1c8da5fb2e 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -63,6 +63,16 @@ temperature-sensor@4c {
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 	};
 
+	eeprom@54 {
+		compatible = "microchip,24c02", "atmel,24c02";
+		reg = <0x54>;
+		vcc-supply = <&vdd_bpro>;
+		label = "board-id";
+		pagesize = <16>;
+		read-only;
+		size = <256>;
+	};
+
 	pmic@58 {
 		compatible = "dlg,da9063";
 		reg = <0x58>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
