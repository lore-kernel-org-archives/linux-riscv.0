Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684DEC55184
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 16:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3VkNVTNd+ItI0yCRwEaLFt7LRuEd3tWXwgzXbUDvZ3g=; b=VGFIIemQY4C3Mn
	QWKoL84kHrW3DmCe6t0RPLr/ScS8PziYau7/4lbvjERhBG1cygAnv8wOBFPFuwksn128/pAVK4JPd
	ydbz0bUSlLR96+AYGZZb/pSNYqQxOUDfFfRPfp1yESPM3AMWirA8oOwZRkB+J24LPaGa58/BgFkiC
	snTzIA5a6BrmKRDnBJmSeeSzc5qlNmiZYDD0O0dhRp06q2RCRkowKPkJg2rfAdP6OsAxbd2kw292B
	h3aufU9Tbt4zqN23CBqcMHMUJ6HkPJFvDn/VG2QKEsPZFcuIMOXbAkXiOgFyIQATZasIuqkCakU1e
	M8VaUxdbUGi6nsdCJJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvbg-000000005d5-0J4y;
	Mon, 03 Aug 2026 16:33:40 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvbd-000000005cJ-3PlK
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 16:33:38 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84e2061eed9so490243b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 09:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785774816; x=1786379616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nFawlb/mI58C0kLJAoZYOhtyyWVaA7JzPyRY0wueT1M=;
        b=cEMqRHWGv9aOhsW1mj/EgF5bE6mvFycvekPNcOVfl3NALVrzAUyPykg58GtdU0Naek
         2XnGVMBD1e7gH1qHWwy/+gvahCaDYcTEe4Ap+pbpMBJLtBEvfW2dvaX5OX5uqVdeyBFp
         Zu+/CkPvrWKfsXkgPbXRsxJlo4Akll+DjdnSK8BJaLRFM1IK5kx4vXrH0T/B/sl0OB9Q
         ZGjjvkaC40oYk7m2aoxJDhWBMSOJRoUITJRyPL527i7H8YU2ZARJMWcDv+wrBzJts/l5
         jbTIjG1TZPBtolbMnyx3k7J/VGSfQt6HGSpAkvyZ+VZxLM0X/xou4yi0BSuskHmooiID
         Cvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785774816; x=1786379616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nFawlb/mI58C0kLJAoZYOhtyyWVaA7JzPyRY0wueT1M=;
        b=siNSaIV1Nf3XL249PD6vTOKQWQ6FN1ie2qpsu7Fmc4pKvWEpYziUPphh3jOZuOqhS2
         wl/BSpZDZxbbk3W1QSsNaTENx0uiEjs9YL1ifEkj72qURmerXE0sjlGsZwBRnZ7W507v
         +NN650bBbXkKc363A28yVcuEfEnwfqtDiB2oTBtdWcb+9ety4u7s3y7oTAd8y/L7VXq9
         PnC+D7/VRd1WPrJtZl5AltsrJfn6CLLy0Be0+ew/ve7+yhAuuM6Uv7A1wybyIIB3fz8A
         tKUjbDvr2oocqaN32vDN+TQrAJrEBzw+zEPLUvPH0tvjz4EjF2WC+cawzC8MYQNMLwMn
         n/7w==
X-Forwarded-Encrypted: i=1; AHgh+RpIfS/aai+yQN7HbH8xhWZhonlOZkYtqr/AF1Poei/UizZFacn9q13BlU0jRBgAdo3Otn+nw2JK5ocVTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAhl8FaExmJwtU9ci3Wn2EyyxQNNbqsdiC93g98jDJ8nNTRus+
	Me4KSHm0S3CpWDu86MC8CM41ODIFbhYUa9PTlH3p1TyO0iKj5IIXVPhsAiCGcNL3
X-Gm-Gg: AR+sD13geXYszeCUCaA5HahnCsNvnxHoEWscRLd8RyIfsVVmSgD1mpcMRrFGN8okIHP
	JKyLxaCgQa7nAwezvp9Rwx6xFicyk5Z3G7+ROLiKyW2KMYD7utleqLQrM/qArn+iMRz5zD9PKOj
	H8FIGFGDO0KVAi9OvXpkFAqwKUuje+VAkDGXuQ7oJVlkrxIMhzpLPTLBrmySUw5diH7RAdD5vVI
	bLYbnuPOmcYKzil1GSzJumiuh+6GlzUHcT804f3zqbZhpBiLXhNP7W1eq1mB4yVK1x4uf5obvD3
	eIC8kwYZCowm1gY+XhIfAVKmCPa4nNaBm4L+burIwB3Mk/Eb54gT338vf+gDq1i7ZEZbOsXUDTe
	DYnzVcMK8+ktxf1Cf8IJHypdWfH8DMGVlb5w/wh7pbWRsnY4OvI1lPmVnGWfIXBgGpZhH02eM6l
	3BZuqRg0eOoyv6hSx7kTo0iKlspr1H+TRNYIP68jIb7kXismaGjm4xwPCvG5KnMUi6OHbwxvNyy
	VT5AcY+BqDWwY78+oOsTZ1j//rCCOQNqdBfJa3KcXF3s4Mea0mugYDSwkcTK09VBbHFLgN69+54
	+fYpmCWxY/0KvHPa+ThtUgQ=
X-Received: by 2002:a05:6a00:4b08:b0:842:5a15:6fa6 with SMTP id d2e1a72fcca58-84ee495c2aemr12701073b3a.3.1785774816045;
        Mon, 03 Aug 2026 09:33:36 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe565d2sm4164845b3a.13.2026.08.03.09.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:33:34 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: chen.wang@linux.dev,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] riscv: dts: sophgo: Enable ethernet for Milk-V Duo 256M
Date: Tue,  4 Aug 2026 00:33:18 +0800
Message-ID: <20260803163323.74414-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_093337_857119_6FA9F14B 
X-CRM114-Status: UNSURE (   8.50  )
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

The SG2002 has an internal ethernet PHY, but on the Milk-V Duo 256M the
ethernet signals are only routed to the RJ45 connector of the optional
IO board.

Enable the GMAC and the MDIO multiplexer so that the interface is usable
when such a board is attached.

Tested on actual Milk-V Duo 256M hardware: the GMAC probes, the MDIO
multiplexer selects the internal bus and the internal EPHY is detected
at address 1:

  eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]

Link-up was not verified for lack of the IO board.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
index a2797c0bd767..1462a96a1c12 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -49,6 +49,14 @@ coprocessor_rtos: region@8fe00000 {
 	};
 };
 
+&gmac0 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
 &osc {
 	clock-frequency = <25000000>;
 };

base-commit: 11881041b745b444e4f6c87a2748f1951cf02742
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
