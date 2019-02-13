Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED748C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 09:26:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD535222C0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 09:26:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pALjw0Tg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="aEXA47NO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD535222C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QSk87IMjPIPRnhFiFYLphtWWAckFpDVC7AqPiPXXTFc=; b=pALjw0Tgd1RJG6cn5gw74L/pcD
	9qQcxbJDXS4J3i6D5ZRdfxK3kpBJaI7BnXXaBSE5v4uLTmG9DHru6u2opYBgU2h5DrJhubZVzrDVg
	MLmzSZcNzPHc0Qmwzuyr+eNuSCA9rz6SWpco9Yd+tYD+WwnMDzbefZrYRGwe98GWgH7xXsfW7/aVi
	szxbqkSkycFdtA6sYgxifbjqWv9226FTZ+fJN4a+h3K7a0OEy1grk/gfHaVJfN1CxuN1Z4+UDLNCa
	x0tJSNzPf6JrzBSr2f2WyU9pyj4zmNZ/pQvQHJYdf2xrqvNBj2bmgX6dpTzWTbeKseg3FKgz+TRjU
	0UflLXYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtqoS-0006V5-Vm; Wed, 13 Feb 2019 09:26:40 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtqoQ-0006U5-BC
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 09:26:39 +0000
Received: by mail-pf1-x444.google.com with SMTP id c123so895534pfb.0
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 01:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7HfAbF1OGZMXhqcW96klsMo8xb5zJKMak24RvfCSKmU=;
 b=aEXA47NOOXupF/+oe1euEBQpwlZjP7ua8ri4CbaCemkHQwLOit2Qu+VS+MqTdvODUo
 ipAIsY0QNZAExHmVnrGE+I6nx8GDmM3y6AviKEZTUkj+VC6+Kot1AdVT1rP0y2IbsOII
 b4kZ0XI91gu/UWcSJbwzxgdHBy2DY7qPAAlFL5tLzp17+JWMrmKgyBtf0TTaPwx+laGf
 jzRj8YHSa0abX7D7HNK+O7+FSwvZNFRLGi+rDkTSkV8bAplL9+XO1daIylZEwUIaCuuL
 QmRUfWrmrFtIszeBgbeQ2LezVFLgN5nksSRGYwgbIvq+Y/ecAtsvXBVwVpF3TTFozuWy
 KZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7HfAbF1OGZMXhqcW96klsMo8xb5zJKMak24RvfCSKmU=;
 b=H+FAqEYFquGOIFp5OfjIjHeFRtHWaxlhwhlAmyARR2qvYVILi5dpPaByYnv7RFU1G2
 YLYTvHD8vbeluSpc+khwqJm4GT8KbYXc0/7XiuAJ0EluDQezRHUCxw5h2cwzhhSdh/7L
 cRLDqnQL4gSqFSEpS9AJV3PDDCOYHxlnHyFYxIcyHQD6PWP55gKbd42TlMgKgguL2wBo
 eBNASUPfrdB5Hvz+Szw0bpEYvEhOAJSUP/vJFO3H+c7DOQI/7iUTDq8LqnsjDk3NR6Dq
 3P9fU7UKbwZS7CK1MrHAP3KT32q+oE8S/0d/4vPREwUoNTLHH/PsK3oSqGuXA5DqpmOl
 me1Q==
X-Gm-Message-State: AHQUAubQ1c0jjDrcEyztHepHp2Vj4HH3mMRz6410An7Bymgr7vWl+UVf
 aWwZHm6Dix33n1RShiQNZOOGYg==
X-Google-Smtp-Source: AHgI3IYiZYTquB1nbBmJispxpSWQvSYjO4O+QY5Wv/u/E1HF1fderjX1fgboTgLoVQr27hz9l2kVRA==
X-Received: by 2002:a62:c302:: with SMTP id v2mr8729772pfg.155.1550049997824; 
 Wed, 13 Feb 2019 01:26:37 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id v75sm188875pfa.164.2019.02.13.01.26.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 13 Feb 2019 01:26:37 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v6 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Date: Wed, 13 Feb 2019 14:56:17 +0530
Message-Id: <1550049978-20705-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1550049978-20705-1-git-send-email-yash.shah@sifive.com>
References: <1550049978-20705-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_012638_383771_FB52CDB4 
X-CRM114-Status: GOOD (  12.22  )
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
 .../devicetree/bindings/pwm/pwm-sifive.txt         | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt

diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
new file mode 100644
index 0000000..3b9c64c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
@@ -0,0 +1,30 @@
+SiFive PWM controller
+
+Unlike most other PWM controllers, the SiFive PWM controller currently only
+supports one period for all channels in the PWM. All PWMs need to run at
+the same period. The period also has significant restrictions on the values
+it can achieve, which the driver rounds to the nearest achievable period.
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
+- #pwm-cells: Should be 3. See pwm.txt in this directory
+  for a description of the cell format.
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
+	#pwm-cells = <3>;
+};
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
