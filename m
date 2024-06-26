Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B5CC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 20:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E1aR0zC3/kJaHx4QGZfBImR9kPmCVwRyhV4xYsRITIE=; b=nw10XjT9bc03nU
	dceGpC8L/TCj/IRuetufxmwIxJ7AnPtPFceUln2IUPhPBejLmJ2fLjqdbnqPur9XD+li7W6mTK5EW
	exWuKzqWEMjaXvTNX7Ws2c9+FXArDsBCQ6fyvUy1WRy/4yhw9xx3WxMoqDlyoJGNrodwAtF1E0I7n
	cdQGf4lWgQFxmD7jI/1TRIRBLeINYFpJ//SGM8bDRtTFAOFeqjiG6bD9CQwXEKIrPOC0F7OMxvuD6
	iQQRvTrpunq+rRTHKozL/wqnQayPiChdntIYYcWuVfYqegNLgHpu1nuj6+IsgdxLjdy4bQIUQUkGD
	9tyKVeuW1hN59WiclRFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMYpe-000000088qj-0n4V;
	Wed, 26 Jun 2024 20:01:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMYpb-000000088qS-3Xq2
	for linux-riscv@bombadil.infradead.org;
	Wed, 26 Jun 2024 20:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=6g+Y6utb5DC8JgQiRrCjz2lxtjnI+3HJGGZQlA8xOB0=; b=lF49O1dJUfyOwwW9xnfAiRaCwP
	TLZsUe1BPDCE6+5XVPSrKiq/EHOQZFYMB2E55CN58/fnMu4mMYegZRBVooKJHI+1IK/ckc7XrTMNM
	p7JAOKKLjrSxQX/QUGLK0C7oqM2C0l7UHxkooznBYMYC8J4FWwDZgl5uk7+LGmcGgNrz1U2+E0cpO
	UYwpwlqxYjeAQiqVCYIHRa5cchvp9Bkb8ED5MOQ0ca84Kb465lMoeqyaRg+2m1W1X8BB4sCkcgxHK
	ucx0iJL8LkIPkjQN7uALuwQuGpqHl6nCLijt8ETUDT3PKDEPAb5aahTxVemwSn3ZMTtYjdJjhRe/X
	ccZ5wtjw==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMYpW-00000008eAj-3w1z
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 20:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 83642CE2C77;
	Wed, 26 Jun 2024 20:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5F4C116B1;
	Wed, 26 Jun 2024 20:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719432067;
	bh=glv0zhkfQDHpCeQyICpkcWEDMR/NtMSV3UI7HiOKrfA=;
	h=From:To:Cc:Subject:Date:From;
	b=mbCY+GjvPYn9u0y4yRIUYiIGnB1TbBPxdGuQgl3xW85bM1txvfRWY5ETsSLS+uQV4
	 t0wh5sANCRt5tWT8ESpmZz+NtYdH15jK4VbZ/xUiOuTMeUzdyKUUJtAYcEUMZfVFzk
	 VEyN73fmH9Zlv4VP3yeINy16qROxKC6x3/il46pP0i6xrZIGz6HrY90sts8NaxFB5I
	 I4OACUF78LXmD3iCxh6JKKoPfDHzbASonFfTprtZAUmB+nYChLouKwi9ZKQrrRrZ9w
	 KjAVfq95pvK2b1vEqATJiACDHm2TJwtlls+adCizoqDNfE844m5AWb2NTYjSZJXHlJ
	 uiroLScRaPgUQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: starfive: add pcie1 on the star64
Date: Wed, 26 Jun 2024 21:00:57 +0100
Message-ID: <20240626-traverse-excitable-a1d9be38a9da@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=fR3lsSSUrtI77PnMbXDKn8XXJOG9pY1FI0PcA96yBWE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGk1xVUuAhbKUYedL+iqbUvj8ps6rW7R/ukT/URCszZ/v /n5ZVFHRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbCEMbwi1kq7Jddg4v+h32T tk8R1Nq5yo+Lb7pd2an5U2OC2xhjTzIy/J+ftu3un2tqdyU8rtofLd/Vz3bsyon98/pkvy7w6vr Jxg4A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_210124_226926_3C263970 
X-CRM114-Status: UNSURE (   9.00  )
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

It was reported to me that the star64 actually /does/ have an exposed
PCIe port, despite the commit message there. In my original conversation
with Minda, they said that pcie1 was available there and pcie0 was not,
but the v2 patch didn't actually add pcie1 on the star64.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I think I'll just squash this in and fixup the commit message, since the
patch is still at the top of my branch.

CC: Minda Chen <minda.chen@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>,
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
---
 arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
index 2d41f18e0359..b720cdd15ed6 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -39,6 +39,10 @@ phy1: ethernet-phy@1 {
 	};
 };
 
+&pcie1 {
+	status = "okay";
+};
+
 &phy0 {
 	rx-internal-delay-ps = <1900>;
 	tx-internal-delay-ps = <1500>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
