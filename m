Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F62C369D5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 06:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9dT6A82cLUmpnlgUyWdR4/75OMckFk8yi6/0c6rJe8=; b=Td8u5yey+wcb6R
	6CrAw90Uli4UDfe85fA8WRVpkqfxCpscTZ7O5v5I9LvavK3ZoIG1eW4dLUbzeufz5tN6Jyi0HhlcE
	OMKJY7BybPqHuXRtfPzeVQQXbfH5/RZedcIKAlBF96tnUQA4wI0GrLbmUfiDAkQvNJvd1VgDehb2W
	LrAn7n4Lz0Bq/t4E/n/GyboX1P+XoCuZ0on0xp1fh+odusisbvQiim4VU3WKv6ZYlDz/S0vStOfHj
	qoBWFauISoMScmW1+Yy15ryH0olq79zVBrtfl5By1yygL7wUZw+kRiskwOmmTPWYSVGzp6v7BTGrC
	9UfyTQ51G3gUJyq3tpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qC5-0000000D1VS-2ovg;
	Thu, 24 Apr 2025 06:36:21 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pyP-0000000CyWa-48sN
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 06:22:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745475729; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kDArssAjro99bi32ehmZfpQjev/z2RBPR3f4PwgXnYPpQjWPxuGrhX2gTQhwX6DeyIm9kTYxhi/klXB+pi+hwHPBx17ODPMIw2JS3r/E7K+0LtlLu9aknopkwB8NM2b3Fs1Sdr9sJFOlq9XbgsFP/+w9pC7SYN1eNwg6/zDSF2A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745475729; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xVNOvXEvdW6leQE28c3jHe0aUAqH+GUjgXBsNd/0dtY=; 
	b=Xbqexsx+Y827fYArushI327qEhT+N+Q32WMJPDdq94wAAWWWujOiHtONtYGU1LAP49Lp00f08EpXOVPkZwAnRrBaY+M2iNNlg+wtf1KJEm90dI+wdMo0Em49jYrE7Fx2c7FPOhFxJsanfBRvai6C+f7N+NgD0hZtSSmD3EeN7HU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745475729;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xVNOvXEvdW6leQE28c3jHe0aUAqH+GUjgXBsNd/0dtY=;
	b=aTmw7cA0A0R7yGwvidNysZ7lVbcK8j3iS0tYCpm6FjiTxXMnaR9ptnsGRb1kzUMC
	V3JtyIIZ1XuzwEuN7Gz0sHdJYzzGQb5T65nideQk+BM00P1mp292UrO9bVXvF9cwB5y
	Ihuc7dxMXSGibLBQJZpmBEV/2bXLS487kXHyYbj9P03roC7UYmkuxzU8Ji3dJsz9MCl
	uRogeAoqAEEvn6mBfxWIJTIgH3wm3VpcZakcs6QmT6gvhqVAlgalOYQy+EVWwCTELyI
	HhCyx1COuaqz6odjBcY9ScWA0CZEMssyVF1ylHqaI/Jf5TYtrqwKSgezprny/F0I7Qh
	bdIfjBFarA==
Received: by mx.zohomail.com with SMTPS id 1745475727228758.2441586398901;
	Wed, 23 Apr 2025 23:22:07 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 3/3] riscv: dts: starfive: jh7110-pine64-star64: force no USB overcurrent
Date: Thu, 24 Apr 2025 14:21:54 +0800
Message-ID: <20250424062154.655128-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424062017.652969-1-uwu@icenowy.me>
References: <20250424062017.652969-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_232214_085023_3EA898D7 
X-CRM114-Status: UNSURE (   9.11  )
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

The Star64 board has no GPIOs to indicate USB overcurrent, however the
USB controller would stop to work if the overcurrent_n signal it gets is
low (which means overcurrent situations happening because of the _n).

Use the pin controller to force the overcurrent_n signal to be high in
order to ensure stable behavior of the USB controller.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
This patch depends on [1] for including the necessary header file.

[1] https://lore.kernel.org/linux-riscv/20250424060605.638678-1-uwu@icenowy.me/T/#u

 arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
index 31e825be2065a..4fb522d127e21 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -91,6 +91,13 @@ GPOEN_ENABLE,
 			input-schmitt-disable;
 			slew-rate = <0>;
 		};
+
+		overcurrent-pins {
+			pinmux = <GPIOMUX(PAD_INTERNAL_HIGH,
+					  GPOUT_LOW,
+					  GPOEN_DISABLE,
+					  GPI_SYS_USB_OVERCURRENT)>;
+		};
 	};
 };
 
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
