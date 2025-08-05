Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F486C87FCB
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 16:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cvoJei8TgEz1xMcr8TB0UfosV/TlV9c5OhO5wuaNt2E=; b=DwRS39+S0dLtzU
	L9beRBms8vLtgFD1K3p62ZeO+08sbA5E7wVf6tOeYnbPqg0i0irlvKf4IiFw6yPp7tFoZPSm/vd7l
	sAfPN01C/3n1hxkLIFaahvdq34wpdK5wHnHTR/vE7Yw/cp5umdFbenfTexH2zNksMcvrX4KN40a72
	UPX5N8E62FhsrHRBBpn3h+dL0wZvjteID4U8HGJ0Qkey+SZJhZ+ooouFtD0sgPtFWPHctcON+WZz6
	4vIWSRHG62/doqlAxr3rvZvtQH0HhC7dSbv04Mv8E7Ybxm3i49t2qxgaTiQL4Dip5PPpBc4ktbVza
	PI+6MOMyeQqNmY1Dny9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKT5-0000000DHFF-12wx;
	Tue, 05 Aug 2025 16:24:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJHc-0000000D6eC-3zSK
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 15:08:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-459e20ec1d9so7789785e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Aug 2025 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1754406534; x=1755011334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H1NFToLTMCBICwkF2bXpGG3zLl1KYY37VeQX64wTwe4=;
        b=DmXsP8d2e+AXrI1U2hmhp3jU1rSliokP9zrYl6YvLhN2YGLiqMNdpOnu/5hFu4bBod
         CbDLNYhoGZ44qFdwzGE80lhv54TiN0l2Bjdk9unfEhwinD2+SnxR4cvH0ITymxkDuSWP
         HbMEVraCaUegUL6uufZrQZ5MEU4aRVNDe2mDox3we9pajcz25mM3a7Ib/QpbLado71EL
         J535MqSBDsgq50KEsqzylyWuR5kTcZbjpD0CInw1qdEChj6P+gmSWtFdLuoOZTDKL6cs
         fbxDdHPd1h4cBewl2Ydangp3YnZvoHUvdmqIpiJTt62LECxZe1x61BzwwhKQKdctTaIf
         PGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754406534; x=1755011334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1NFToLTMCBICwkF2bXpGG3zLl1KYY37VeQX64wTwe4=;
        b=qEEl1UNeFXdrCWkinza20+5OA99/PHs8kydoJOuK2treCFT7Z/nOI8qlwkjWoS8Nfi
         7UdnFQCYoEDwZEhCqhPBbIsufJF8x7BW3c0yXsB2lmqyew52VH+77iMAoCwaikGh6gXr
         a8+DawAAMRy9K+0G4JPrjRe/UPq17FJgpTh4uAEiliF9lT5ObAvbgj068kHdeuKdHQx5
         T0fvth+K+EKdfKrlvE0kLpXQZeGsmE8IRj643qJbeSLwpbSPAIj1cFFqCi5I7+u4lZt4
         2KjFmyQXJ+zFYBRsExfrOgdQvGIx7WQD2jaqSrkAjVo4IGihyCAvj2X/+oZmAx08Knna
         4fjg==
X-Forwarded-Encrypted: i=1; AJvYcCWQkTCZNc1wX/YQlDW0HmDx79K3Av9srGvBCotSwKghwjF9hVK5/LN/Z3BKbmnoaJS4KbBpMtoeVhZPsw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8GBQhk2SSflQmgj4MYjww3ueKfnxeJcV05c+4kYU6ryFhFApc
	lzU0biupTKXmJ2S/k2vNuPIqvZN3NRLxMgmndNl1jsPFh0dBuP2Z/+lhsNrbzbi8j0w=
X-Gm-Gg: ASbGncsBlTrSC5vpD8qetZZp/3YwFa42jkcPONfYZFvRKPC/tGjIbkgY8kEtrgIrkxO
	9M3SJAVl6uqG9NN9bNQII6afFezpC0QSh/944ry8v3sTgdNed/3JlUyRgOC6Y8qpb0U7jrqjUlv
	OhN26h/33n5DGFjb/nCycW0a0zYFGH7d/L4mdA2kSC4YqMBg1IPqf4QIL8y/TAzLTV5YyGBIEys
	iOTKPdPGxTYWzaSULNUG/hrBaXGfqYR5slzeqv6JSN3X9T3VJbMAWtFG6LUL++FNeCxCgWQ/OAN
	SNzodl4PJ5MraP/csozz0AhyxKME2pASXd2IgtAzCqnvSAHBDmipgh1FAEEn7MHuJO4cp8Zjyu8
	q803h2YOdEtaR/m5IGFrOScMxd4XHvktSw3dPVcXsV9dcUcyM
X-Google-Smtp-Source: AGHT+IFxn5pLwK5DhH3KCFQWy4nsv5vsgTiDMhFW15HhwD65qkQk4OJb8IifzI8vS1mm024ju4SDkg==
X-Received: by 2002:a05:600c:1c98:b0:459:d8c2:80b2 with SMTP id 5b1f17b1804b1-459d8c2833amr66948015e9.7.1754406534167;
        Tue, 05 Aug 2025 08:08:54 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:e77f:3816:a0b:2c4d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c469582sm19264199f8f.52.2025.08.05.08.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 08:08:53 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: linus.walleij@linaro.org,
	dlan@gentoo.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] pinctrl: spacemit: remove extra line in debug output
Date: Tue,  5 Aug 2025 17:07:01 +0200
Message-ID: <20250805150701.129113-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_080857_247257_DFD885EE 
X-CRM114-Status: GOOD (  10.80  )
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

The debug output for spacemit_pinconf_dbg_show() prints an extra newline
at the end. This is redundant as pinconf_pins_show() in pinconf.c already
adds a newline in its for loop.

Remove the newline to avoid the extra line in the output.

Example current output:
$ cat /sys/kernel/debug/pinctrl/d401e000.pinctrl/pinconf-pins
Pin config settings per pin
Format: pin (name): configs
pin 0 (GPIO_00): , bias pull disabled, io type (Fixed/1V8), drive strength (32 mA), register (0x1041)

pin 1 (GPIO_01): slew rate (0x0), bias pull disabled, io type (Fixed/1V8), drive strength (32 mA), register (0x1041)

pin 2 (GPIO_02): slew rate (0x0), bias pull disabled, io type (Fixed/1V8), drive strength (32 mA), register (0x1041)

...

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 9996b1c4a07e..fb361f2acb54 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -707,7 +707,7 @@ static void spacemit_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 			   spacemit_get_drive_strength_mA(IO_TYPE_1V8, tmp),
 			   spacemit_get_drive_strength_mA(IO_TYPE_3V3, tmp));
 
-	seq_printf(seq, ", register (0x%04x)\n", value);
+	seq_printf(seq, ", register (0x%04x)", value);
 }
 
 static const struct pinconf_ops spacemit_pinconf_ops = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
