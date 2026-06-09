Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81216CD98C6
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 19:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1xYbRVwUqlJr46S313TG1km2M0gQOMkVBU1tS7pCTaA=; b=EvjW2Y0scdCnaN
	NcRNZ0noLNx7Wd7Y8Ofbl6hs2ipJi+pAzwDp/z3mD9l9NAxK8b54oj5jLbB3hZlqkwkXwwy60CkFU
	o10V2sfYlVaet0t42BUyIkFPp48yJXo6XpwIqk3jl5HthYHQHXokqLTuwyyGTqSY67zHvxMHdOOdH
	GDMgrHHwzTTh3DRfn+dLmUQgwFQZlHw4E0R0qfxKDGt2YlW33qD5ywIXXt3S/ku3zerlpaopopNzE
	L6k2ZpmduaCIWvkxXoA+2X+D+4ZcGbeFT9x17M4KCRuC9dtuX7Dubh4L+b4LPb9sTmECs7ZKxnNd3
	SGUHhwjqKBlVI/O8GjsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2QC-00000006JPy-1mFH;
	Tue, 09 Jun 2026 19:47:36 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2Q9-00000006JPA-1XJf
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 19:47:34 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c858d69bde9so2498586a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 12:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781034452; x=1781639252; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpR6igjuZL+55NUetVLOlJ7WyoEDc1JskAO0eU1M5r0=;
        b=hKA2srBr41TmqVKatAqIKSvVgnV+p+QXqV81rxFXrRwmJWhihPy6qMNo+jp11dPJhA
         tdZuBFeW7mCINt/USUIThs0PIP+KB4897/EwDNDvZdCXrBhUKnA+s7aYU7Cp7CPYetlB
         eGT6P6n8M3UuO5QytgiseL0M6FcHIkwcwArw+TFdJp/gpYIB7bx9c8H0xQQF4xgDeLRc
         PU53EaDb1fDiHiZ87a/4+pVQsDC/Wg9CmOJtFtTXzHPKO3+/0cJ2tETzKyn4E8XAZE7m
         IYqjrF0GCULomzbrw8DJO1C+XiE9Fi85ayyqzcsMhC3dwTTVGfEDIZteg/3mZBXHmnwd
         H4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781034452; x=1781639252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MpR6igjuZL+55NUetVLOlJ7WyoEDc1JskAO0eU1M5r0=;
        b=lzWqjWzfpSNZIuwzSPXzq0HeGVa9D8wd+uOrxgEuYDGBuWuXY3t5R6/FdrrvMThsZg
         lFrmcHZ85MOHkiau8o/M71oZf525qLov+sNKvoxvq/Lhxg0b7CviRBmdxg2B9y7dy+6I
         XqHwfhH1gwOF69aEpgf2GtukHplqI4SYpqaGZYyb9ziSeGLteW7EqpARgnsgGzd0hfkO
         C0ch8CiHceop9uRhmSr5qtsQUptXvPCQy1PeCY0Gb3GXgaZXaICPI/vUiY3oahNs2bja
         4msBWLmXh0/DsdHr5A7lv7tH4mEqIWGrSSJEHELVgI68yqvS/cMJ4nJQ0KjzsdXWUMZO
         BJmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8StIahrDe0Z8Jgo5teVJuyY56V6aTGzYRqUvLuLqYOa/HkVjRHihlYtmOEgmwEQkY0EJJTmJXDxT5cKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZc/jESiZzqTA+ajFma2wVnG2jxSl/2MoC6ifxXcvfzMknqUV3
	43gKQr9puH5L9kBpXWtY+KCqt5Gs/SSHwH331mw+8OUUeCYUdilSwF4a
X-Gm-Gg: Acq92OFYzrdn0H7Rn5GqO5luWrjBHds9YuqUoRyf5Ac6tHe+Zz/VpobD/UlVEoPqLm+
	tjPOPIPLfJHNnT5FH5gJFCHeWV166+lXrE04+esYxMWoDMgL7r7h232Y51jt4pgXGa8ZzV2je2F
	jBmNLYbx0Rvjx2UhoLhWb3PgTgbtPmgkcK6L2C4Ew2v1RIZdMf8f+N0g7B0fGd6yCS7zppu/C90
	lGbg9hmXmKV6WBx3utZhnaZxGGiN6HIGT97Za/wKjZjNL6d89yUqPnAOVl5K07+K46uatXMAmRo
	kUlnRqn5hZQC6wIbHN0txjXTVXH/h7L/o7PT9EnFPL1Mr1QUh5E6TpMrZ2g8nLEqJz2cFDZH/Xl
	nypKu1CloSUit0Jr4Dw/vOEVarhWGVGTeP3Rs+oU8J6j5fSXnTESkZDywvG8N2AVoEUZZg6vhTP
	hU8PT0NmcJ
X-Received: by 2002:a05:6300:2213:b0:3b4:6026:6c78 with SMTP id adf61e73a8af0-3b4ccd45617mr26253003637.11.1781034452412;
        Tue, 09 Jun 2026 12:47:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3060])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19517121a12.14.2026.06.09.12.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:47:32 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Tue, 09 Jun 2026 15:46:39 -0400
Subject: [PATCH v2 2/2] riscv: dts: spacemit: Use symbolic PDMA request
 numbers on K1
MIME-Version: 1.0
Message-Id: <20260609-b4-k1-pdma-req-macros-v2-2-5d5d7b997b54@gmail.com>
References: <20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com>
In-Reply-To: <20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=H/kR+2HYwlqkml7voLWdHY49vUjyuP/Tsib1MnxQLD4=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiyN3GM9QkaZAY4pz7LmFC1dU6c9iz/tlMZKQ7fXVvMvK
 4nY+yd0lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwER+HmdkOHPhNCfP+fsPPTcn
 1nqfuZncluzK03QtbIry7o75tWsLqxgZztYqCf0tjHyftnB9yeSb33LSxM8wrTAwv3V5m/txgWc
 5/AA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_124733_416854_2B0A2645 
X-CRM114-Status: UNSURE (   9.08  )
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

The K1 SPI3 node's "dmas" property hard-codes its PDMA request numbers.
Include <dt-bindings/dma/spacemit,k1-pdma.h> and use the K1_PDMA_SPI3_RX/TX
macros instead, for better code readability and easy for future
maintenance.

No functional change.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
V2: No change.
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 08a0f28d011fe..c413a64d5560c 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
+#include <dt-bindings/dma/spacemit,k1-pdma.h>
 #include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
@@ -1094,7 +1095,7 @@ spi3: spi@d401c000 {
 				clock-names = "core", "bus";
 				resets = <&syscon_apbc RESET_SSP3>;
 				interrupts = <55>;
-				dmas = <&pdma 20>, <&pdma 19>;
+				dmas = <&pdma K1_PDMA_SPI3_RX>, <&pdma K1_PDMA_SPI3_TX>;
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
