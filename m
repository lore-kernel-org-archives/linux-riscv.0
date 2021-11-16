Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE40C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 00:53:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB8461ABF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 00:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DB8461ABF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WP6tZPlQxvdZRxu4E5lMwfw6inV3xyFcx5xdl8YcGtQ=; b=bAq6t2qQPFMLRb
	mAGznxmSpRv/T7Xhxdrt+Yo3XQqcFi+gDDJovSfbhnJYhVCggKAqlscAj83JW5xo8qVTawNTjTHMH
	kI70hv9lcO+r7UyPwuLovN2eI2AEaetcjalewcPOvNUsREJAyu7l+5Y+4vtolPXXggt4TcfOsMW95
	s4EOoT/9/QOFNboFNcW67bUU243dIuQV8EN0yF4+i0Iw8gfVJN4zoK68wgYALKzQcl7iX9sjNtjVq
	ab+Qh2HCPzgR5K0sLmnBTsRd//+Kgd8dhLjD4wqq/42EAOpnNL4Gwe01JVbS+Y1RHH95go3a6jbvC
	OquU+BTLmWttRzKuGSog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmmj0-00HTwQ-FH; Tue, 16 Nov 2021 00:53:26 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmmik-00HTrK-7W
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 00:53:11 +0000
Received: by mail-pl1-x629.google.com with SMTP id o14so15926936plg.5
 for <linux-riscv@lists.infradead.org>; Mon, 15 Nov 2021 16:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jO8DHdz6ka/B1BYuotJwYwQ7xtBreOe1PucIcCXxUqM=;
 b=PCFfee0RLp2Y4um38Yr1zP4bxQnSYMojtp5EfSe1uMHuMo98S/96Ms6hC/yYD1Ey3j
 STl7g8a8j+pZfZFllwz/39ckoH0mQ8SBSFnG7Rt4Iij+GPYpuDf97da8pDiPhJT2+Kyo
 f5DyF81zQRd4HGW55J3X7yPwWiXbiXHpO/EEypOWkDbSEqgF4lG0ApLS/JPLXhC2wX91
 /cxO+YDqm0uBSNqSAjSFZNSbPvc0CCzvKpTBZtEQmeOejx61rampIVRDKPU8RuXRpQK7
 ye1yrx4A9zmantWqU6L9UWN+uLJlU0EYkP/xVvHcVYU20tDAVuLIBVG4cjgys24PEjg1
 1r4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jO8DHdz6ka/B1BYuotJwYwQ7xtBreOe1PucIcCXxUqM=;
 b=yAWdsiMQQa1dD6LawnEbA3wcfRJz7s37Wv/juNGg44m2pe1+BXCNvyowLQ+6k0CQW0
 vbJTFGSLbQQ3OVc4w9yuWndU/m87Y0DT3iiKW0u+NTVspmoXJcXHUR/sYHddFOZEgpI/
 jsATXM2qq1E6lbmNydOThD4H/frz7/i7TVA0fyRRGqnYRIZoD8xFSGXYEamt8cT3ex7h
 gVvoYG2VTEflqkz3sFfqYyun3VZqoNH3isD1/mxvesC48c5hLkLC+4tlFX9vDZbsLTPI
 wOjnA4jAjjxAbEvbctmBdNuJichsQO0C09gdblQmlBEMac4cmNHQ5G1WaS6s9q/R1pyH
 M/bA==
X-Gm-Message-State: AOAM531w6cBnxFMkd5xni5XAW/EWsCKcJN8HF4BMwqrNGd7luIvPixbw
 L/FjmHJ3R/IRjDDhTdQlASU=
X-Google-Smtp-Source: ABdhPJzNtsiLSYI0RPWPUWoD8tW+Hs4I+0ls35cXKOz5IZL2XwzBwwUsAtJUbVxmer1D+IiCFBWHww==
X-Received: by 2002:a17:90b:128d:: with SMTP id
 fw13mr3682017pjb.50.1637023986152; 
 Mon, 15 Nov 2021 16:53:06 -0800 (PST)
Received: from localhost.lan (p4899162-ipngn25301marunouchi.tokyo.ocn.ne.jp.
 [122.18.9.162])
 by smtp.gmail.com with ESMTPSA id k1sm16912060pfu.31.2021.11.15.16.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 16:53:05 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id 632C2900949;
 Tue, 16 Nov 2021 00:53:03 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Yash Shah <yash.shah@sifive.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH] riscv: dts: sifive unmatched: Name gpio lines.
Date: Tue, 16 Nov 2021 00:52:56 +0000
Message-Id: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_165310_296884_6B43BD90 
X-CRM114-Status: UNSURE (   8.55  )
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

Follow the pin descriptions given in the version 3 of the board schematics.

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 4f66919215f6..305a086e5207 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -245,4 +245,8 @@ &pwm1 {
 
 &gpio {
 	status = "okay";
+	gpio-line-names = "J29.1", "PMICNTB", "PMICSHDN", "J8.1", "J8.3",
+		"PCIe_PWREN", "THERM", "UBRDG_RSTN", "PCIe_PERSTN",
+		"ULPI_RSTN", "J8.2", "UHUB_RSTN", "GEMGXL_RST", "J8.4",
+		"EN_VDD_SD", "SD_CD";
 };
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
