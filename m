Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DB7C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 23:58:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 988DA61BFE
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 23:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 988DA61BFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMWdR1kggry6/rGCjxpsDP7ZApPXHukAolH3hOYBo/4=; b=H3rE8aRTYtllnb
	QLRTqnxiz+n/5tm2pC9nz00dawaS3JxlPClHvpIRA3IFRuC9gpeb2RksPwK16DKASZpcYOj0w31Th
	9hGnPul4G4rZ95aUy/H03RZSpomZkx+o1tl1mSY7Bpb8ZYwDT67Wdz6KNe0TjF6+w6hjFtPyEsIzL
	OF+amouB66oU5uxeqiivgiGxUai2jpKdoPRp0KOB3etAlx/xHBG9+JZZwCH0AP/d150DRz2ZTw86o
	YuaSsFYPn9XBQuNiNjefd4xxB0GOVmvIgTSKxez1CoyJjVStmJ6qYRZAvN8cEShLF2oU2XL4jmGJ0
	7owIMYJqGgqOj8cLcN9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn8Ku-00303j-OS; Tue, 16 Nov 2021 23:58:00 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn8Kk-002zxV-3Y
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 23:57:51 +0000
Received: by mail-pl1-x62f.google.com with SMTP id n8so586231plf.4
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 15:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XUCrKyTLcq/1tv958Xe+OYnTiafzr/ke4k2ZCljxbxE=;
 b=nIpoNX2NFe0P9pQwXDCPeRm7vuJlB0nJcfZGCWg42MzZqovIesWtQ2HMg35EiIpmZD
 kaKzT90w3R1traHXPurRgUxZQ4FLu30B+9MxDP6ENK3DsZz9YqTT//JJy0ggQieIZo/n
 F2OZjlTfT1aLHOxFEsPNtsQYViAK/J+GIyGHPhM8XOoVmL58cApR8HpP1EJpma/OLOZA
 AIxoZ4vW42h6Rrj38Dl2ZgNonjWd7+d1InLkC+4ploUfnEr2gZYjQZq+/QNdr2Cgwipq
 pjX6mnFVphxCCiCjwU166lLUXMLXqMFDRCf94+OiB40ZxV8n3nOx0Qbd8Ek2AqaAcpSh
 39AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XUCrKyTLcq/1tv958Xe+OYnTiafzr/ke4k2ZCljxbxE=;
 b=ZkpTTnorkf60qbrT4o6vxfq1kJa+pC7YpaNRsZ8zuNhhe1gueQ70F3057uyhadx4lr
 SKHRIcRUO7xYffPUNHrpfUg2dT1ZrrJw33byVj/3LdNsKEwXqKaZO84kgPLJDM8jfZ3l
 KW1q8cuV/80GKaDJsXZKJP/vIfWjmrY6yDy2e3ORZ95zJNXnSIh/8NW1HZ7FxlW5elbf
 dpo0tkMKFF6Eb2gn9fLbMqmmcTTAgxqlxCz96pnq+GqG+BTYZd/HgkNJ9ZcKnlhW4sDZ
 KAgqx7KNLFGonvOirbJwR2IgfMsxVZEIZJOwp1YdMlyIJ4cnvlqneALKPpxPDsdc4Beh
 nG7g==
X-Gm-Message-State: AOAM5337o88lmmm52hpzrYt0ExlO8mU0PEkaERNhND3yuWjxYBSjBC++
 9dxEOHgUwvbZqyPvfooKr0k=
X-Google-Smtp-Source: ABdhPJx7fvb5KT8Ue/UY6J2drUV3efeEbreHjWeTUERxIw+NKwH4x5GtwUctcnthxHO8ryXG9HbvKw==
X-Received: by 2002:a17:90a:ec05:: with SMTP id
 l5mr3976311pjy.68.1637107069377; 
 Tue, 16 Nov 2021 15:57:49 -0800 (PST)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
 by smtp.gmail.com with ESMTPSA id c17sm2327457pgw.83.2021.11.16.15.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 15:57:49 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id CB78990095A;
 Tue, 16 Nov 2021 23:57:44 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH v2 6/6] riscv: dts: sifive unmatched: Link the tmp451 with its
 power supply
Date: Tue, 16 Nov 2021 23:57:42 +0000
Message-Id: <147b278488cb66e6024fa648deacc2601e1dcbd2.1637107062.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <bb7e8e36425a2c243cfbf03a23af525499268822.1637107062.git.plr.vincent@gmail.com>
References: <bb7e8e36425a2c243cfbf03a23af525499268822.1637107062.git.plr.vincent@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_155750_172211_3E9B4FB6 
X-CRM114-Status: UNSURE (   9.22  )
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

Fixes the following probe warning:
  lm90 0-004c: Looking up vcc-supply from device tree
  lm90 0-004c: Looking up vcc-supply property in node /soc/i2c@10030000/temperature-sensor@4c failed
  lm90 0-004c: supply vcc not found, using dummy regulator

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>

--
Changes since v1:
- Remove trailing "." on subject line.
- Added a commit description.
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 1abad0eec02e..1a952dec74bb 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -59,6 +59,7 @@ regulator@1e {
 	temperature-sensor@4c {
 		compatible = "ti,tmp451";
 		reg = <0x4c>;
+		vcc-supply = <&vdd_bpro>;
 		interrupt-parent = <&gpio>;
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 	};
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
