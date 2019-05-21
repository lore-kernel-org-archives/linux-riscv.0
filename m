Return-Path: <SRS0=Dqti=TV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DD1C072AF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 13:33:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF0912173C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 13:33:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m/RmeQMW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="f26zEdbO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF0912173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrIL9RhqTiWkMKOty/46MdiwVMFq0TCp1dDrofmWVDY=; b=m/RmeQMW74NwPG
	5AwP5lTdSGvRuvXkaXjJBXDDFBClrP7H09WnGBaZ5xSme7qRAnVrtAz8BjGalMOpWJxcPZlfPuLox
	AkbJrV4THI8TI69tsjZuT9IJyazwcgILsPksMoVPzDelAyI5hgVHd63Fhmb5G/uQ9zs7g4AXrjdtm
	t1bB+SKw+BmOQrRvXPveQRzSUhJ6C8deYExg+f5ej/nIwqpq1kfB4rrmgAMtEkA+zd3JOIUU/kGaf
	jvy1XDyqbKU+8KKIC45aX3QUMykq8GQyTmn+SecsiQvs+B//MiiKLFdaVOaPYRqxVwXXlslHzrT4r
	tX/34H8GfTM2lwo4ICCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT4tM-0008EP-Vf; Tue, 21 May 2019 13:33:20 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT4tK-0008Du-It
 for linux-riscv@lists.infradead.org; Tue, 21 May 2019 13:33:20 +0000
Received: by mail-pf1-x444.google.com with SMTP id g9so9078485pfo.11
 for <linux-riscv@lists.infradead.org>; Tue, 21 May 2019 06:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=1nncQI8i+UzrmjnlsMRQHRUYfFHMZeTgvwjX0KHzdBA=;
 b=f26zEdbOr6/dfMG4dZ18wDImXn+s/c9tAyneJjTEQ8q4wwuCQOoRV0s9WNWLE5TY/+
 6FPXNnznDxFmhxUkuG206BsU1sCn29p1+zIGX1OiapFO5QTKyhVUB7T9pxTo1gsoMxF2
 snSehzN5j/TwJbSUF0HFLSHe70+I34quFmDL9NC7ctWrpgKRM5kX9le0izOaUO0GdYXR
 mMkX6faXXaiQrFZAn4GgylFDFlhz239Tc/xJouGdAs3uTuibqre29yXkcDaro6ZLYGHQ
 xpC2SE/ixcmNRq47e4XR/hQxVwhh5a5TW2CE8szYNM5qHM1UgCbBRXhYawPXuRhmT061
 AogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=1nncQI8i+UzrmjnlsMRQHRUYfFHMZeTgvwjX0KHzdBA=;
 b=KtvppSk2f0BOG7yiUP3QGgAoLglHT73A4yMs4SCoKrBDB6wTtTPKXLT07hzfriGafe
 DN7ApESnQXGLjxi2gYDaBJeAiePUJfMArb5+loFzRidvz5Sx/CADK/hr52rR3HPQflyS
 Xf5gJlpxNYY1IVPKsNQgzXlNQg2x5yVM5uosxWM7rX7eEn/+V5NvAB7MSzUtBcSO64Om
 B8+MfdMKuibi3WZ5a0VxkgleEdVFBg3m0Mc3j1rZVhIJk4NRxeRSyIBEJkxJvYVkpp99
 wU2y+/vXQ4Sc6f7SlFG7Gkw8vd+7U4qRrfFumA15JhDWW0JmeYz/IvJpp/NZ9eCWzfZH
 I9Kg==
X-Gm-Message-State: APjAAAV4K9zgBbvLO5jLko3YZx9XtvHqH3tX9umnGz+Ylr2LZ9i98fSI
 M4DQA2ksgP69XWEvYhvao0Ncyg==
X-Google-Smtp-Source: APXvYqz+cNDOns4a+HlYUkMCadstIOBWgdjWKopWeJjmo4sMLBkDSX21RNmLsVKKcrIEMBu95K3+Og==
X-Received: by 2002:a65:628b:: with SMTP id f11mr78696250pgv.95.1558445597973; 
 Tue, 21 May 2019 06:33:17 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 d15sm65368906pfm.186.2019.05.21.06.33.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 21 May 2019 06:33:17 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
 andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
 sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: i2c: extend existing opencore bindings.
Date: Tue, 21 May 2019 19:02:52 +0530
Message-Id: <1558445574-16471-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558445574-16471-1-git-send-email-sagar.kadam@sifive.com>
References: <1558445574-16471-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_063318_646138_5B69021F 
X-CRM114-Status: GOOD (  11.11  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Reformatted compatibility strings to one valid combination on
each line.
Add FU540-C000 specific device tree bindings to already available
i2-ocores file. This device is available on
HiFive Unleashed Rev A00 board. Move interrupt under optional
property list as this can be optional.

The FU540-C000 SoC from sifive, has an Opencore's I2C block
reimplementation.

The DT compatibility string for this IP is present in HDL and available at.
https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/i2c/I2C.scala#L73

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
index 17bef9a..6ac062c 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
@@ -1,9 +1,13 @@
 Device tree configuration for i2c-ocores
 
 Required properties:
-- compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
+- compatible      : "opencores,i2c-ocores",
+		    "aeroflexgaisler,i2cmst",
+                    "sifive,fu540-c000-i2c","sifive,i2c0".
+		    For Opencore based I2C IP block reimplemented in
+		    FU540-C000 SoC.Please refer sifive-blocks-ip-versioning.txt
+		    for additional details.
 - reg             : bus address start and address range size of device
-- interrupts      : interrupt number
 - clocks          : handle to the controller clock; see the note below.
                     Mutually exclusive with opencores,ip-clock-frequency
 - opencores,ip-clock-frequency: frequency of the controller clock in Hz;
@@ -12,6 +16,7 @@ Required properties:
 - #size-cells     : should be <0>
 
 Optional properties:
+- interrupts      : interrupt number.
 - clock-frequency : frequency of bus clock in Hz; see the note below.
                     Defaults to 100 KHz when the property is not specified
 - reg-shift       : device register offsets are shifted by this value
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
