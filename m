Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070D7C531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 23:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+2i5SzljppiCY8JkPafPLt+orYbg/rKIyDeqTjxGyg=; b=heSznFQ0WBIvkY
	QXxvfRRfaL3PiPVb1dL+F927emitalcQDVjh+CcurcOXmD0CR9vxShtCwvp87FN2Wl5tpPi0dJUHG
	EaDQfyQpzbsIdDAeCyk2M6zQauY/QuhVVhwmhNHwkosgX80aVohLhRBqgJrryDQE8wEJuFxK2L6Fb
	S9tkxtEU0MWQYETbSBeHvMExBvwYO7HZ9+A4nEhVwlC0q3Fs4Kn6447c/PSVguyYOqzWEHmJgwcme
	ztUxuoQC6jQApeNV+Kqbe/YlpnZDiDKOoHyE73eZQf6tVp+XijO1bKt0IGUB5cQgfxvnQ7q+TXrN0
	93lOA/SYKVK0skXBLCig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnlsf-00000000lzw-1wzo;
	Sat, 25 Jul 2026 23:34:09 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnlsc-00000000lyt-3zq9
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 23:34:08 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cedda2ce6fso13474825ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 25 Jul 2026 16:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785022446; x=1785627246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8xAuZcDnYP1eURYO2Kgu2iqMh9+qGDBIHwuMtSJqYI=;
        b=MyLaWPKfA1l86iRj7G63ZFDrXjsSI58tg0gkLFSa0J0JG4bizK08Xc3X8lXqQWNc0D
         Ga51zgktj4poBSNq16wfXQVb5Bd/lvBx2pVtPcAzxPUFMZ03XQi/J21SgZfsevbXYKq4
         2LL1a3b80IoM26f5VlIfziJGTFgY+wp/59VdjszzwNXIa8lUZVYRq0kc1a8cqZx4eTgW
         skmrq8MxAb6TtFiNjDBB0TD4yX28Mw3JYwAYoH29Gmue9961WIB84bCe3BvqBw+pBeTA
         D+YOnrBDz4F+8ak3XvFt18Dp64GG5TN2ZsTkvqOOrUZIUyNX9Yd71HXTXO7HnGQBNoj5
         oJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785022446; x=1785627246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8xAuZcDnYP1eURYO2Kgu2iqMh9+qGDBIHwuMtSJqYI=;
        b=JPoAw0zGcJcprZv0o5cDhZepj2UfpMVYe30TtNQnYUia3Q271q5dKk4vg5+9NywWKR
         OaLeI+11t/v4w/6egNisnSmBTBc+fqjfsYS8LsgqgQplKqtgUogYlkN3tUX2fQjhI1JS
         RGPdhMSGlKCsXrr+3wcteKiAuMFPke4M62QcKu2FGa+iOto0UquX4cr2S4pLgbcZWpF/
         GZbIbZIlcYLyMvyBMJAYUnjR7hiNNjX6sw4wqPF/KrRg3LskyCH1Mk0n3EdtvWo800jn
         ro5NCa464UfsIwb6hIM4QJRsesONWjgx5Pls6KBV6fn4r7+1kM+UCxa3Sri0l4Lf4AZ8
         6KSA==
X-Forwarded-Encrypted: i=1; AHgh+Rrr3uJkwFNbFpajXRXxAsc+3qXo2QHQW60UR0n7ZJbDlGOd9XUDkdVMeGzETLOIkuxh9va9lLi4cz9+jQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfEro60ErHJVXBX08mKuzzIglDGBxf02Y1vozghlygiuNLRtH3
	g9Ys2N+26sBXRDFEgY0PADDRrcf1xpSnS5eRYelEhKHk5UZcIdXtWUyb
X-Gm-Gg: AR+sD121Uyd9V9bRSFLOTRbWcRPcO87V9whJpQ4uWk/g8qZO0t17FDHXbUsWl4ZQGMO
	PE3xqPlV8pOoMspMJF87pGzUbpZzw/kRHRbbiMMgnLTZP36yNF4FtOAUQTuFbXqgbiyQM316R6y
	41RSTRbWTGRTcnZVX5QMQ9spTGaDrbkOYi46L8RiUDamE5woUUQryQnIyOMDlo69V5Ui5WOsxgs
	QI+TNqWgu/6AcnkftBbCp+DBOx2QjPxx3/4Q8+/6UoSgY7vHRPadGZ9oQSd6qTX52k6xBF9VVR8
	Oo5yYx08WzddbzpS98UQpzGvNl6mnDXWZeT5yiXPRwmvef8j6Ct2PcWKCT42Gnd+3UczP4/V4sG
	dyxx5bwIfgbxA+mu4mmdoAPvSb5oQoYoqNikG+e1HHKGkHGF8rR6Voil8iuV7bsCGxgQW4DvbqW
	+V
X-Received: by 2002:a17:902:cf10:b0:2cc:85a7:36ee with SMTP id d9443c01a7336-2cfde862db4mr31827595ad.32.1785022445940;
        Sat, 25 Jul 2026 16:34:05 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc413sm13661365ad.44.2026.07.25.16.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 16:34:05 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/2] riscv: dts: spacemit: Fix phy id check for the phy on com260 board
Date: Sun, 26 Jul 2026 07:33:50 +0800
Message-ID: <20260725233351.55004-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260725233351.55004-1-inochiama@gmail.com>
References: <20260725233351.55004-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_163407_016681_704F0388 
X-CRM114-Status: GOOD (  10.75  )
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

Current phy framework can not re-initialize the phy correctly, as it will
assert the phy reset GPIO so the phy id can not be read. Setting the
phy id of board com260 manually so the phy id dectection can be skipped.

Fixes: cfe5c91cb73c ("riscv: dts: spacemit: k3: Initial support for CoM260-IFX board")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index b704b537385c..2a07cd8f2a56 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -174,7 +174,7 @@ &eth1 {
 
 	mdio {
 		phy1: phy@1 {
-			compatible = "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
 			reset-gpios = <&gpio 1 5 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
