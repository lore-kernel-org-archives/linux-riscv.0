Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44557C7115A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 00:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=evUma6A0SwdAs25cDkHBjwu7XYSFgUpKNysG1C7cue0=; b=YfDkqMraJFBbpD
	zCZl4bM1qxFNfAQ8LpCoW0psAygWvSnYg/qMihIF87CxUEV5x+0W3nXuf4MLo3qVDUfLEbEbr5FuX
	cnjxnU7JkaszrpCfxpAZD4nmSRxip6qn+tpHJ0CwQLlcjZwsYIepzC0oGFu9mnaOZCksj99O2ALjC
	ews8Ov75Ls8iy1HaEuHqz0Rnea/lNdZ9suU2tnK3d3jabT+kpbRQunnZEl53tVjtK1LB9Nks+pXEW
	qBJ0oWt5lPgJhpSNk0pwspqFCsa4cHWW92Eqk1T2B+U6HSylHfQPxuAyYEW53039RiRLSr22cWrCo
	yHwTrpqKhi/SQ098Nz4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTV5e-00000001M5S-2vG0;
	Mon, 23 Jun 2025 00:31:14 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTV5b-00000001M4R-3MpV
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 00:31:14 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-747ef5996edso2653011b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jun 2025 17:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750638671; x=1751243471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Q1kf9zD36m1QpyUUwIQ0WQq+s6bZAcLbbdo0D4u+Fw=;
        b=b0tT4enJ7nVd81O0QJ/Cw2emsUItYvVDztRNKvVEDE7h2HTWlRWRo6eDF7OAFprjvY
         itoaXTziPnKUrwtFDJ9zV4g+0iWzc9LzSlmmEY45/cFEQXgqkgu/E/QKtnQsrcbfr9Ws
         uogx04m+cq2ExHqy/nV4jh0Ho4/lpa86O1M1tcp6309iTSG6lyxxY+4aAiBu3Qi/l4Mi
         DQlE0OBQKHfGcuCDZQfe85uit/LQSPQH4d4Qpq85fNcuoZqkYcdrEvj/Ax80Bp+hHFeB
         8N8k3ANWIeFP7ixFwh8qvlrS7N3MBw2CxYmnpONgGjYMnisGbELf3NrtbCoNyF7RfouZ
         loxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750638671; x=1751243471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Q1kf9zD36m1QpyUUwIQ0WQq+s6bZAcLbbdo0D4u+Fw=;
        b=oaIljKD8uWdZ7ZXhNvEW4Ndabv5DooKCCWCG2zx5UFPaLFNvHXHJ0jx7uPMQxUM7Q1
         s3C1qwLQzpDldpHkvJzb/Hn1MwcESoPtu5GIy/bBqJyZBHXaHt55mfL758Ksy5TTmc9T
         lGoMSbV1Mp8tLTNkER/EPggWZZTAWIGFarwlTAA0R81tadz4HeJK0LaMnk2cUGkker45
         7Owi3CPPE8W6CS1MIYCZ8pWdTLki10XjUybZbgIf9iLh8zMqhbkVGC5wkej6Us4zDNws
         BppM6QtSAJq+q+919CV3PJuxnoCYoDXKPG9OnEpFYoAaJjVOdZSsmdV5vktGWov3Pto6
         1vqg==
X-Forwarded-Encrypted: i=1; AJvYcCW9b7p+3a2NFVdy+Tuc2ioz3kuajrafDk1MKyW9r9dPQ4ycQ3QLQNIHUi8yP9QdHaY/Q8wuNuAhoBvXjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMEXW+eEXXL1nPuq7V6Qyod7vAjL98QkunqiU+3B9kv8Z9hJXt
	qdiJGDs4kFfhZsmNXyFWtby8FRNhjTcWwQwCt/EbeY9x8GchEmGFAGEi
X-Gm-Gg: ASbGnctSJ8RWVawxJ1DgoCii6LUqTC2zUVAnSDdQoW9bQRuBERH+q38DwY+Jc4ad5Tq
	gC2m8Ixf3ki3UF84PBKkq0ccGhUa54iZuvvdcJj8mILhic+4lNG+Dbsx2F2n60yEYLN1SC6h2Oq
	Nr7GLaKQyfvM/BKNiM54dDd28x9/nTdvAWUAOl1/CJUSy+EEtrt0ItjNmKnHOoMIHQMKIQ5cMEl
	Wb7NAAo14rjjs2t19+jA4QRBkq3NZ9sQ2mjmAXJpOuRFGnSMOvnJM0L0EaVe+9PXvna+SfzvBtG
	I2tDLAUE67yM49ULTe9mJebERu9YjMkxEDjAo9njERfbZ1OYvFWXIoPqkxdF/g==
X-Google-Smtp-Source: AGHT+IE7SWkZKqmzCTcflynbcCf+Hta3Lb9CcCnLa9th5SlsVN06IHYW3V9tm1bawfDuAzKPJuJUoQ==
X-Received: by 2002:a05:6a20:258a:b0:21a:bfb6:1c74 with SMTP id adf61e73a8af0-22026fa6a92mr17872987637.34.1750638670941;
        Sun, 22 Jun 2025 17:31:10 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7490a66a763sm7193835b3a.141.2025.06.22.17.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 17:31:10 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v2 4/4] riscv: dts: sophgo: Add ethernet configuration for Huashan Pi
Date: Mon, 23 Jun 2025 08:30:46 +0800
Message-ID: <20250623003049.574821-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623003049.574821-1-inochiama@gmail.com>
References: <20250623003049.574821-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_173111_840140_5E55E2D0 
X-CRM114-Status: UNSURE (   8.23  )
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

Add configuration for ethernet controller on Huashan Pi.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index 26b57e15adc1..86f76159c304 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -55,6 +55,16 @@ &emmc {
 	non-removable;
 };
 
+&gmac0 {
+	status = "okay";
+	phy-handle = <&internal_ephy>;
+	phy-mode = "internal";
+};
+
+&mdio {
+	status = "okay";
+};
+
 &sdhci0 {
 	status = "okay";
 	bus-width = <4>;
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
