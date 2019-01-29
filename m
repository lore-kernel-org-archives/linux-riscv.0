Return-Path: <SRS0=xvkM=QF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC273C282D0
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 11:43:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD042214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 11:43:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dhlmceHn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Wy2sTZRV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD042214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=c5lnNGGBM6n+Bt62imvHXgT3dbsMeNqLZ98ZEWYQLp4=; b=dhlmceHnx7oZ/BwMoF7FltR2Gd
	6dxKjbiMHqjQeujTOHVXF+G5De0Pd6i4nGw2Dlv4Tr1Z+Geg6DjpTvx8/LlKoSK75NP1u6f/alVzw
	zW2SwH1wZcnbMYXNkq/JMuaEejBKU0wm0GAl9REaBb3yLrw11XtMrmxE2yNXgzsElFT0EiZEpR6OL
	9n3N10DC5N6DLR1n+YjVhEekX27CAVrQ8GlDpIFy9u+sHAPPjiFzb9i7/HznQ1aC65QE11Cw0QwZ8
	y3B/Bue1f94GdVw7Y3P6e59uoDMrDtFS98noc9sNULmlYZDDM3yrKyxrKtDEs0GsduVP+Cyr6mmqF
	7xSNMACg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goRnu-00033f-VG; Tue, 29 Jan 2019 11:43:46 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goRnr-00032N-TL
 for linux-riscv@lists.infradead.org; Tue, 29 Jan 2019 11:43:45 +0000
Received: by mail-pg1-x541.google.com with SMTP id z11so8649993pgu.0
 for <linux-riscv@lists.infradead.org>; Tue, 29 Jan 2019 03:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=G7V3NEnt0RHAHgpKuQI6RBLlHxLKpOJpI6SzIqXmgoE=;
 b=Wy2sTZRVZCOrrhdnMBpeBh+ZkXMChwx3ZTSkwwSmjzAIhnToasM9qU9/eVcOgW4Bah
 KZIUXl5QCNEQZ26QsFf6r1km8mgNdwJ0T4Z5xggnJjbrWt/6CM7j9moN6sr2sb/5YXLf
 l2BbIt8iL5UmNJuVgtLs4kKy316Ott/akzKcTgSH0Whtt7hcmdyvTzhQckrsyL7FnTO6
 eO1m2PQzF1fsaVUI/BzVe8UaJhrRjNwHM7IGOEljVLCBfI+LCAfvkFKn8rTUlXagx3M8
 6+DHqXd15f7YsPBzJ5lV4Y0uRF/Lpt2vCblv07a5c3VOpPIz2gCx++LQtc7woByllYEE
 oV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=G7V3NEnt0RHAHgpKuQI6RBLlHxLKpOJpI6SzIqXmgoE=;
 b=tVZyMT6eNucWZLJm9cpIJkRUDG0iwbrrngl6IAiBmPeoCkgSK1kLxww9CsCX+wludp
 zL60i9T9mVEmvu952hdkemUDqh94wwksrYl8xEGGjQBZLQ8oX+f2AfJQ47vcjaFzj7lC
 Y9B6LtWA8Xd9utwqz3ksSUplehzhGN/BLOcz0Qh8Yj4yIqNR/hSEdTrvmUq0yNXkva02
 QqYkGyPg5mJsOo+caMg85z8YM9dgeZTpkUFERIrYwYejoh7vvca5915cinc2rgaFbmTu
 eF/wZ+6kFmhxDoCkvpk4Qg5mgHA/12qFBRFM5EPI0a1tSFVcbdVXWv89fD7TFgIaBYMB
 a08g==
X-Gm-Message-State: AJcUukcINeZkhwPpm2TKOAlHx8HQt4Zo/9/feBTW723fDn9DiRKJmuYv
 O50XK5qrK+Sl+d8zxm1uUvcedA==
X-Google-Smtp-Source: ALg8bN5UHWdDrQGuqQnVwIC6QqMaf6nFVvX9H79FBnBHAO8SOkmLwGLxSkuiHRPFCYWE6EX4e9JIoA==
X-Received: by 2002:a62:8a51:: with SMTP id y78mr25573066pfd.35.1548762223414; 
 Tue, 29 Jan 2019 03:43:43 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id p2sm48755717pfp.125.2019.01.29.03.43.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 29 Jan 2019 03:43:42 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v5 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Date: Tue, 29 Jan 2019 17:13:18 +0530
Message-Id: <1548762199-7065-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
References: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_034343_947508_D5BFE981 
X-CRM114-Status: GOOD (  13.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, thierry.reding@gmail.com,
 paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

DT documentation for PWM controller added.

Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
[Atish: Compatible string update]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 .../devicetree/bindings/pwm/pwm-sifive.txt         | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt

diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
new file mode 100644
index 0000000..8dcb40d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
@@ -0,0 +1,33 @@
+SiFive PWM controller
+
+Unlike most other PWM controllers, the SiFive PWM controller currently only
+supports one period for all channels in the PWM. This is set globally in DTS.
+The period also has significant restrictions on the values it can achieve,
+which the driver rounds to the nearest achievable frequency.
+PWM RTL that corresponds to the IP block version numbers can be found
+here:
+
+https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/pwm
+
+Required properties:
+- compatible: Should be "sifive,$socname-pwm" and "sifive,pwmX".
+  Please refer to sifive-blocks-ip-versioning.txt for details.
+- reg: physical base address and length of the controller's registers
+- clocks: Should contain a clock identifier for the PWM's parent clock.
+- #pwm-cells: Should be 2.
+  The first cell is the PWM channel number
+  The second cell is the PWM polarity
+- sifive,period-ns: the driver will get as close to this period as it can
+- interrupts: one interrupt per PWM channel
+
+Examples:
+
+pwm:  pwm@10020000 {
+	compatible = "sifive,fu540-c000-pwm", "sifive,pwm0";
+	reg = <0x0 0x10020000 0x0 0x1000>;
+	clocks = <&tlclk>;
+	interrupt-parent = <&plic>;
+	interrupts = <42 43 44 45>;
+	#pwm-cells = <2>;
+	sifive,period-ns = <1000000>;
+};
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
