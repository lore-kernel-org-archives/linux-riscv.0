Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584B6C53200
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 00:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ll8qMJBp0vvQUdDN/K3pHmB8Egf7vDoNBw5/hPpK1tQ=; b=Bf6nD+NnvE2zn/
	MP2JwJHhwqOUUuS993vctDy7b/oBHRMRMjm6wa7xwMeOJ137BIQZupeUCqmmJv1FzkmFE6s+maPrw
	7t6OVD28i6LKCqQ8B+PS1Itn/s4xB4vuBB/DuVlLMOXvIY7nlmI/sSDLOkDgu5tSKzwcqPqg8vJr8
	pITsD/CgWlW+OUUyDDlyVDvzDaN0eQgxy9fp8ZEbjPAmDt/Lq7ruoRHV6XB94QDWIzCyauXM5cLzt
	CI7uDoCHY2leAO0it+Mm6LKsdwNI6/9jGrYr+EQqSUvfKgEW0WdMqqRTKlF8qxt6r3MSbw7ZN12sr
	wVAmuTl5GrJEnl/El67A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQiY-0000000HQTM-3Als;
	Sat, 25 Jul 2026 00:58:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQiV-0000000HQSX-1jDl
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 00:58:17 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cf52d15d88so10416175ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 17:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784941094; x=1785545894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJzCpl1A9lMuSv16O58Xsv9A30hSmOZtX21l624BoiU=;
        b=jtfWvp3+jyXr8tGBum/P9myeLgHL3THafvRqNJy/viOtcW4gI0dyifSB2Ml/urZgTv
         DYrRVmc7+Fvxx+bjtBTNo8d4oiaXCblVJ7WdJFEuImdPo0j9TK+HE0D5ZTx360PMP3ld
         aZSRL5z2PyiK31mXDw4CDHxvyC65Hxw3Eh22PH5FP/BfVPZ3RK8urNMIEc59eQnAp6d4
         8KhnEc0RVYnWgYSdVbVe97yhKOJRS8g4WyFp1IxLTHdpDpqHi6f2Oq5C7v1uxanolV3o
         ZTo3DfJTgB6KmhTMjA1afVJtvjEEVtUefHanvK6HuVstO2RsI+QKEXTIj7+nAeijl0vH
         sPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784941094; x=1785545894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJzCpl1A9lMuSv16O58Xsv9A30hSmOZtX21l624BoiU=;
        b=q+MbiMxJA+fmVwadBOXCOGLZyysn7qPZZybFUPt/b+26TKSeo0xgANvYAr/75Dxh7+
         js7V/o0dH249+1wBbNH7nPubi5puPU3KN8okAYmoqFNRjrgn4YmngYANC3jiEHBeFS5h
         ncGm0X2C+w0RyFVkZHQUFftnFcZ8AdbfSpWGdrCZzHm7HqLVE7EOg3a51WVU07QeyAdU
         HLke6MqwLWhuyj1U+w6qBn8fznA0nog2raY9ME7NHqVPVngqnSqmicBIFjBJ4KJUHnlh
         qLBSJe1mQsdhEDmDyUTDbeNxvGFKJQ/h6P+/EESeT0cRs9XVExiHTxLAf/NNxGSf/r8C
         PFqg==
X-Forwarded-Encrypted: i=1; AHgh+RrZ+9eAOKTqq4KNbzUb1ROvput6Cp/mBToMekUtvt2tQn21/u57wGuJGvqAE/H/MjChBQ/vgmAG/WViJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRxExmkawqOGDcXkzgpQTmnFsGwISBg6GULRcvrc0JI1Xenty9
	4xTSZ/hBx7hM7VfmWLAJJScywPKsGFQfUg+NxNYUnVGoPoxoxuM9W4Fb
X-Gm-Gg: AR+sD12CBsNq6VPt/R5b4FH3vX6ZopTjLCQnIioq2sE/EnOr+Yn/aSf78qoX6lVLem2
	XdJgdqRv6VkhZRAfbMQwpA7mIhkc6kFpyve+eJwbqa+iyw3G7cnrRK9oa3BmfRcsOEIt7jZb3hY
	1RMpurJ6BGuN/OS6ieSc+zsweS5XOlEs7oRAxollPtHgTYd8lYe/MvYBYj0vQpRh7nhI6wStrU1
	BmqKW308SyTkr8yJ5ILS/C4vc/e1m/kflC4ywDwJz4s0vj3zk7Fn1qsMEcoDgUTsWkFvwWsIkM1
	FdWph/yqL6a4LfRYA6or52Vb7yQvX0HLuKlwV/jPcF1PxBf7DNaTbURbpFLiiP6220Ln8UPhHlv
	Y+eVmyYtilaEpz/7IeCfdTi2yWPCZT0kU8T6xbJnkp277KeIZ0DSnZB8p2whD8Q==
X-Received: by 2002:a05:6a21:6196:b0:3c1:d78:6457 with SMTP id adf61e73a8af0-3c67daecd72mr595029637.32.1784941094334;
        Fri, 24 Jul 2026 17:58:14 -0700 (PDT)
Received: from localhost ([2001:da8:7001:2000::1:5491])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66dc15asm654002a12.30.2026.07.24.17.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:58:14 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH 1/2] riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
Date: Sat, 25 Jul 2026 08:58:02 +0800
Message-ID: <20260725005804.373698-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260725005804.373698-1-inochiama@gmail.com>
References: <20260725005804.373698-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_175815_488065_530842D3 
X-CRM114-Status: GOOD (  10.10  )
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

Current phy framework can not reinit the phy correctly, as it will
assert the phy reset GPIO so the phy id can not be readed. Setting
the phy id of board pico-itx manually so the phy id dectection can
be skipped.

Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
Reported-by: E Shattow <e@freeshell.de>
Reported-by: Inochi Amaoto <inochiama@gmail.com>
Closes: https://lore.kernel.org/netdev/20260712045233.800748-1-inochiama@gmail.com
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b2a7d2d0d3a8..b9d2de878f38 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -196,7 +196,8 @@ &eth0 {
 
 	mdio {
 		phy0: phy@1 {
-			compatible = "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id001c.c916",
+				     "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
 			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
