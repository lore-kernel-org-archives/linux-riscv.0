Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92850CD37B9
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 11:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9Cae9CHwrKiJOa9csbLIS8CVq6f/fuQF/vaFoK7Ki4=; b=NyL19CDyfuQF5M
	WxvGxZfGh81sbDJ0majL8/15uIe3gNC9sgoRpvOFItYYk13cdLlpyfL6FzPh+lctAD1aTcysXeNru
	iVuWY0kgA9cTr/lmrpnFSKr0YalGNzvx96jQdkKIcX68AiA46GHsvqYLyFflnLV6idiU3KUV23dtO
	8a9OCljNqG1Tpa1lTRZMzhONQfky44oQaGpQyUQawSRhdEEfWTrxDS04dzhGviD0sl80cV1Prih7n
	l75JBWR9U/+zKCjgtioxFH9G3Dg7cBLqLNVHsqI/3ZQPzzKM5li4Vz0cL0KbtVn3HuXpVDjbRbqdL
	pGXbQK3nVOTgwH7alDKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXy-0000000DFD6-336a;
	Mon, 11 May 2026 11:11:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXp-0000000DEzH-2nYB
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 11:11:30 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48374014a77so40176765e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 04:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497888; x=1779102688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgBb7+HyM/yF2DYP9WwoCarbZkeV4f+jLfQyPowzDrA=;
        b=ir+52SIp8WD310Wdav4WKoCOrPQhRKCvmyb94fCrDcJ9Bb2lUl3NYWxHweJWTEtzP1
         vd+R+fkdsxzYHWXodrTqGgAES6BtbcPrpn7wdn0K7ecYh41ec6hLO6Yi4oRKUCZIrEox
         pXCz7WWDU4+1dt8mWW59O80EW9ZPD6VpxUJWfNTWWrRtgJPaN0YWxNxP5QMml7aKyRxv
         vJszmqlFITMMg69OAwKUJC2W/l0P72ZravL5ED4786mJ7PbOwBsn40EFAJC0Xm7aPmRV
         9BnP+q/m/waxaqEgjcbgaMu3eIsQzQzVX1ykcd1KUvdq6Qh1b+wwLZ4AHiekRt/7jZg8
         kQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497888; x=1779102688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AgBb7+HyM/yF2DYP9WwoCarbZkeV4f+jLfQyPowzDrA=;
        b=iIOmYoy0apk9xjMgLAQbaATZE5FYsf+hU9SGvRQsNCAxvDFQQXh9gNybuxoVc5kk2A
         Dvo7BixidnUE735GuvPXUxmrCUzwJoOQvha8feR4LPGiW1jSCT8FoHfCftNOl+Un7v/7
         QyuHw5Ro7QXNWjtDSJxRpM+BD/2F2a5FK3+Hvt57emKBKIxzwNxPDuqJHrlywqDaueG8
         0yER8dV3S+IUPG7mCW4IqjLZeREWeu57f0YI4UmQqVD58jAMc1BxzKwQDhVP4Rpvj5Tn
         XORSmKBcs/aC+5eQOkir7sTj5tvroO2VS5K1y2JlrNmat3AXoT2nbRt/uK3GMDeME5CB
         aiCg==
X-Forwarded-Encrypted: i=1; AFNElJ+oE3YR44iwP/AiXel2/WJCZ+9h1ef/pAKUDVqlwwe+QjwAtT9hWMQ+Vn83DSwJVnxUUmEmFp5CwhDunQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMn6uMR1lxIxLhHHQ79lUSz2HFydJ+rf29iAYa2FtUOUcG23gq
	kTiGeKNw4TSYLwfzHaxYdtQw3dL+bZ0q9zUfkIqvqkwsuADsGEuphSOz
X-Gm-Gg: Acq92OGmbAcncR/YYP9mp4xU8EE3myGNeR890rwsvsVBFkO0Ww4sJlKSBJnhmCAltDT
	jnPIVN1Y1l+STaZdkmtkSTWImMqyFE8SA4xfEUG2iI6KEkRrB9riAEaOh2XxKHIUzv60x8qGf7n
	9r2MQr11TzvK79VOlezPha6XPOeijdE7YodGVKQH4m7sa3L83s7Nd+BWPvYgdX17TopoESfsSXH
	yhJH1MI4Or6sWVbBvfdLG3KH9tJguJqah/w6j/TAmx0u8jPh06byfNmnxF/bxH47PEi3esuUIVc
	hQB4+hzqkzlVCCrWJzw0mEYQnrpm9VpNLBityiKbubTfuB1cGpLkP8npneVHSgMyF990OWmEz0z
	Li4igHJsH3AuTrDRc6ptedt+knrXeF4TGS+wScGIOn7W1bvRgpy6HZi6y11rr+l1tZFV++5nX/W
	gzoaRNi5pGFZ8HPWdF/ho2BeZV9YRbZ4S6ug8jOGoG9l25vksJUFGFIW0GYCMCx3hIeg==
X-Received: by 2002:a05:600c:8287:b0:48a:52ee:5776 with SMTP id 5b1f17b1804b1-48e706c0827mr141592035e9.11.1778497887546;
        Mon, 11 May 2026 04:11:27 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:27 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] riscv: dts: spacemit: k1-musepi-pro: set default console baud rate
Date: Mon, 11 May 2026 13:11:13 +0200
Message-ID: <20260511111116.1109643-7-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041129_748266_476119AA 
X-CRM114-Status: GOOD (  10.35  )
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

Allow serial output with the same uboot/opensbi settings so the
console works without providing a cmdline.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 2d3e30f0bd806..c8bf776511c94 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -22,7 +22,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
