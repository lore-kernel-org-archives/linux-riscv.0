Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD9EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 01:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDxLEt14TR9gmp21NXPO7YKDUvW2NnI4CcW6rI2UUSc=; b=Yp9E8V49dZTbx4
	R5nyt1ygLFl4NtjiWPk/S4DG9tNRkIrjsHbMittGryj1w+3Akez9TSyXtu61N2gaIqM3Xhrwg4TEc
	pXHWUWjTe3yysqG2YtJ++Kk/i/jh6/sQqEnbIvMphJsaTL9kdqmlRWjono0rzFaeiD8NxsEQPkXJW
	hDAsWkJXD/ZScCYm5vVLnZD8KONzz1iZ4FZ7FeZ6jWs9FfLghjfC/ry18OpXjGdNlfb6fqwUKopal
	tLGmsyOpl9QjrHTbwXK1pwRKvXnihbXi5moODHUNgicKbsqaemFKjpVhr77ZgVpvox+j1qe8x4eXk
	HPmuLxZJCzoT80k4luKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzUQW-0057RR-HG; Tue, 21 Dec 2021 01:58:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzUQT-0057Oe-F0
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 01:58:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A3C6A61166;
 Tue, 21 Dec 2021 01:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D218BC36AE9;
 Tue, 21 Dec 2021 01:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640051928;
 bh=7NSsBaHXQMFfVoY4cW3RE40VwQv5+FRGo36d2V2oPwE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mKJMtDG614YL+Px8Qh6b4iqImdk4+CglMnHXnJBz004CP57uYnVcNJg3kMnJYt8Qn
 +FKUC9jq7ElIdfsmkvFdtjGmQDCUVxV03EisfSAbs1tKFCYZe+w12Mco421lTPVXTK
 sFECvFx+L9oT2W7/BxK1Q8KuQt/EA2JD4GK1mxyyp6zKQjgzHToVGuyJCMlEf2OGpV
 Dlxo95gD+iNatAyyjb6fo7ugHSGQxlH4LAM9TcSEeDFCI4QSeQS0ibPps6MhVrkARY
 lh5kTXpzDo2quj16/ldAlcS0BsE8i0rZGC8whlCx/MOGR8GqdzPzQav8+ey8FGHei9
 n57slcUqRGnjg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vincent Pelletier <plr.vincent@gmail.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Sasha Levin <sashal@kernel.org>,
 robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, qiuwenbo@kylinos.com.cn, yash.shah@sifive.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 24/29] riscv: dts: sifive unmatched: Name gpio
 lines
Date: Mon, 20 Dec 2021 20:57:45 -0500
Message-Id: <20211221015751.116328-24-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221015751.116328-1-sashal@kernel.org>
References: <20211221015751.116328-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_175849_578200_C93F9E28 
X-CRM114-Status: UNSURE (   8.63  )
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

[ Upstream commit ea81b91e4e256b0bb75d47ad3a5c230b2171a005 ]

Follow the pin descriptions given in the version 3 of the board schematics.

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 2e4ea84f27e77..a788b99638af8 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -250,4 +250,8 @@ &pwm1 {
 
 &gpio {
 	status = "okay";
+	gpio-line-names = "J29.1", "PMICNTB", "PMICSHDN", "J8.1", "J8.3",
+		"PCIe_PWREN", "THERM", "UBRDG_RSTN", "PCIe_PERSTN",
+		"ULPI_RSTN", "J8.2", "UHUB_RSTN", "GEMGXL_RST", "J8.4",
+		"EN_VDD_SD", "SD_CD";
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
