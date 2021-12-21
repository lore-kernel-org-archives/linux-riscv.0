Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340F5C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 01:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BA21aDCvqPoF6ND+ChqHBig/8UHXJuA3N6gtn0TYeEU=; b=i9IGAzcgdU7o69
	BKpI3jBuui/tIuo+5pDsFMmu8e7I3feyLT1hC1YGXwQIc98xA8iuNHr0UpSY+2laGjhlCasIgyKj9
	6sDAf7fpC2/Oown+tx97czVi/6uqcmqwUDd8I4cgr64X/3G7OpkWggZGiRN0QOCYoLd8S0488LU04
	4QhZGq/aDUIVa8HYETg8TLxd1n9OqBgZWfGBuil2KNEAoFWTNVSkokbt3OdnItc2Y7zFaSdhy86mx
	G6jGIFW8V4RwL8TFlTiplNYHaJt6df5YxaMkwVywLd4bPAO2gIOlYb5gW0Gb0iy+Vib2sHUj61+PY
	0S+bEwuKdQ6d6lOKPKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzUQw-0057n1-UW; Tue, 21 Dec 2021 01:59:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzUQr-0057iR-1m
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 01:59:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D40961166;
 Tue, 21 Dec 2021 01:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC2EC36AEA;
 Tue, 21 Dec 2021 01:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640051952;
 bh=uYCQ1QCMzG/a71Xx9c4MuFbCz6l0SnV6hhcm1SSKeN8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GA/xJuXBZFyNnZmMoyygYK/6glGy9xIzuNifWDz6na/sbs9fKhwpAF2y+QqCfI0vp
 vCKC+h3VjsURqVk1SqAoAWuGJ4kGd/7YYXIfm9ilCtVxCd9csc8M+BhIOzr+7CqqJP
 VFZH4PyUvyaWJVTmhHieVAkpmIlOybQnugAv094Q6dd1ro8Xw6URcUfcdoSaIGPNcg
 CPiaK//IPKtlg7hGy4AdXFeji50/V+F/uPLZnFXO8Ag8bTVBgBxj2UkxWpZZDVJnuy
 bKvMvIb3Wk5AMvmqHJT9crxtBLwUTECmOz/RqGxWX8/JYC+bagIMJZU36GG6Hk7iR0
 2BCGUn2ej7eKA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vincent Pelletier <plr.vincent@gmail.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Sasha Levin <sashal@kernel.org>,
 robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, qiuwenbo@kylinos.com.cn, yash.shah@sifive.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 28/29] riscv: dts: sifive unmatched: Link the
 tmp451 with its power supply
Date: Mon, 20 Dec 2021 20:57:49 -0500
Message-Id: <20211221015751.116328-28-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221015751.116328-1-sashal@kernel.org>
References: <20211221015751.116328-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_175913_177349_724EC880 
X-CRM114-Status: UNSURE (   8.46  )
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

[ Upstream commit f6f7fbb89bf8dc9132fde55cfe67483138eea880 ]

Fixes the following probe warning:
  lm90 0-004c: Looking up vcc-supply from device tree
  lm90 0-004c: Looking up vcc-supply property in node /soc/i2c@10030000/temperature-sensor@4c failed
  lm90 0-004c: supply vcc not found, using dummy regulator

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 09d9342282339..0c4a508869059 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -59,6 +59,7 @@ &i2c0 {
 	temperature-sensor@4c {
 		compatible = "ti,tmp451";
 		reg = <0x4c>;
+		vcc-supply = <&vdd_bpro>;
 		interrupt-parent = <&gpio>;
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 	};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
