Return-Path: <SRS0=rW/4=OB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7F8C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Nov 2018 01:07:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C802206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Nov 2018 01:07:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dtiM4BJl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="X976QnPF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C802206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FP9LgVyJUdnBt+hAyrSNYO4/Oov2N0CxV155K9NHB1A=; b=dtiM4BJl1k44ut
	QeF9QCfkRqMxAkFXtnlELEZYq8vCYlfVDJIsNmN58sscMIAVAcsgD1pDa24AcExsNjxKDJ9uyVQG3
	z08jrL+otlGa3Xkclb0nsizXaq4QE1Nh5F3ZfIcXnuNwzn+NAfv8t+BwKqc1KFwYL7VTAW9ifgv8W
	393Eulb4OT5ANEN9uCqBKSwlK+D4TQ2c7vKRzZlb4zwyvxJ2nNnvtZqtfYj/fSfD4NOgmhsOFNmQL
	PJMWVKUmnME868WRV8WOiH1g2nsuXlerQ4O7gkiu+cZI4ecNlaZzfVHQMS331j10W9qxIbNcPnuCN
	tCD0qFHv6Vm/SXVDZC/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPdSa-0007Iz-4y; Thu, 22 Nov 2018 01:07:12 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPdSX-0007Hs-8B
 for linux-riscv@lists.infradead.org; Thu, 22 Nov 2018 01:07:10 +0000
Received: by mail-pl1-x642.google.com with SMTP id a14so7873758plm.12
 for <linux-riscv@lists.infradead.org>; Wed, 21 Nov 2018 17:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:message-id:user-agent:mime-version;
 bh=mmYitqJ/Zox8bJAkxiDoh3xH7YY9MHO4cNepwjP4x0A=;
 b=X976QnPFfIpL3DIJAb1vzf1c+/eGCHKL1ONtI2Dgrx2PVp6HM1SZcwBc36D3vl0CBo
 F5OpdQX653N1Wzhr/4JHMYdwEOvL8/uunqLGuA21TeV4P34+ySZvpKTu5aAKLEtbzb6+
 pm2pFhk+n9vUDUr1fX9plh0Ado/+VIHgACeMG/EpfXH6e3K1JZ3ZrignwzQcr3WFUhpv
 +Yi9jJgLARznTcps0O8PlhFrnuHSGMeIfzfrnPTOd1oT8Tr3eGiUG8z0P7qFTNK53+kP
 WASIU38xRVMDECc0Kwaxi9CkqiNOzsvQFev2AYwA7zdg/eYWI/2MVi5uLsHDalopolSr
 E8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=mmYitqJ/Zox8bJAkxiDoh3xH7YY9MHO4cNepwjP4x0A=;
 b=GGe02+k464rlOCYIB39BmjwX2lGZ2AxaPe9IBnpqsigt+r0kHPS/w8W5E32+/GzuUL
 fnfTyzWxxX3Sso1l8noEYf+tT5/NVviWIVpTAUawMwSBw2nGN1K91Klq/THRwyj1N3rC
 gyWSfHT9DuAsger+i2ZNDAb8vmXWlDQ2dTSnBYLWdZK+3rlPJI4Bi8ipQFyNpRH4L1hC
 YIQ66oK/qF7FHyncy3aqNXWrUpT8L32PIhMk5X3sEnyybGWBgWW7+Eplx/AN0YqVI0K5
 NiDqA1bEO+vUpiMZgmsxyc/aifDJyeDNzfrYoPC32y01BLJrblBD4p3Y/CQjX37DSD6T
 0Ktg==
X-Gm-Message-State: AA+aEWaTsNEvAm02E4yi5iKyV87L/1iICM0IX7MgfTDbme76uXtVCjd9
 LEPuRDcQq8t7MSM6jWy74qJz/g==
X-Google-Smtp-Source: AFSGD/Xqt6mZlf4jp353uPu8viMDnnN9heXTh6lHKIrscPrGtlQDaXICdn6Lj3mz9tYli5ps5sETNw==
X-Received: by 2002:a17:902:4c08:: with SMTP id
 a8mr9219265ple.74.1542848818261; 
 Wed, 21 Nov 2018 17:06:58 -0800 (PST)
Received: from localhost (97-120-243-143.ptld.qwest.net. [97.120.243.143])
 by smtp.gmail.com with ESMTPSA id m9sm43230248pgd.32.2018.11.21.17.06.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Nov 2018 17:06:57 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Wed, 21 Nov 2018 17:06:56 -0800 (PST)
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: sifive: describe sifive-blocks versioning
Message-ID: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181121_170709_291074_B33991B0 
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 paul@pwsan.com, Megan Wachs <megan@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Wesley Terpstra <wesley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181122010656.2Cf15zSBhaxKLDEWSX90C2qtpNExBlNjCkZwlRGihN8@z>


For IP blocks that are generated from the public, open-source
sifive-blocks repository, describe the version numbering policy
that its maintainers intend to use, upon request from Rob
Herring <robh@kernel.org>.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Megan Wachs <megan@sifive.com>
Cc: Wesley Terpstra <wesley@sifive.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---

Hi Rob, please let me know if this document works with your
requirements, or if some changes are needed.  - Paul

 .../sifive/sifive-blocks-ip-versioning.txt    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt

diff --git a/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt b/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
new file mode 100644
index 000000000000..b899e5c6e00c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
@@ -0,0 +1,38 @@
+DT compatible string versioning for SiFive open-source IP blocks
+
+This document describes the version specification for DT "compatible"
+strings for open-source SiFive IP blocks.  HDL for these IP blocks
+can be found in this public repository:
+
+https://github.com/sifive/sifive-blocks
+
+IP block-specific DT compatible strings are contained within the HDL,
+in the form "sifive,<ip-block-name><integer version number>".
+
+An example is "sifive,uart0" from:
+
+https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/uart/UART.scala#L43
+
+Until these IP blocks (or IP integration) support version
+autodiscovery, the maintainers of these IP blocks intend to increment
+the suffixed number in the compatible string whenever the software
+interface to these IP blocks changes, or when the functionality of the
+underlying IP blocks changes in a way that software should be aware of.
+
+Driver developers can use compatible string "match" values such as
+"sifive,uart0" to indicate that their driver is compatible with the
+register interface and functionality associated with the relevant
+upstream sifive-blocks commits.  It is expected that most drivers will
+match on these IP block-specific compatible strings.
+
+DT data authors, when writing data for a particular SoC, should
+continue to specify an SoC-specific compatible string value, such as
+"sifive,fu540-c000-uart".  This way, if SoC-specific
+integration-specific bug fixes or workarounds are needed, the kernel
+or other system software can match on this string to apply them.  The
+IP block-specific compatible string (such as "sifive,uart0") should
+then be specified as a subsequent value.
+
+An example of this style:
+
+    compatible = "sifive,fu540-c000-uart", "sifive,uart0";
-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
