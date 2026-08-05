Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24589C55822
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 09:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ni75AASCcvH8KE7BSWk4GBOM5nvXhmd0IuTgKiD4k7U=; b=dkVRQjQk5Uek8r
	2Y8rU9HYyiB4SNCNIDzb7ZvVJVRrWYJTTi6wBoZ+9+PEHCcZhR4/Lzz7Jjb1uzKHfhHGBHyPL3Zhl
	bQj6Jgi6fw+NTnKaf2O2diD8c+YgmiaGUQcVFJCdXKpoG3iwWnBz88Qc1RKG7v7gzn+L6xxqlQz8m
	rWwMJ7St6feFLGt3g08h/k4A/60+nMiwnpZlEAysYVqLqKuNryBhj6snwh2TG50IZJgKNT0mgvCBq
	Ucrw+lgBiJ6pHNoBwiEWKUSW1wesac8jiI+0LWo0wNusln0E8NpIya6LY0iD97gzMQ73sHB+piN4K
	2DB09iXIXHGW1LeR/4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXfQ-00000003aWk-196v;
	Wed, 05 Aug 2026 09:12:04 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXfM-00000003aW3-27qu
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 09:12:02 +0000
X-Mailbox-Line: From troy.mitchell@linux.dev  Wed Aug  5 02:03:29 2026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785921115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sLTSEYfRh/OPcBA2Yh6WL4PX3iP/fJj9kbntKv+PhPk=;
	b=o+Ch8Hg7SEZ6tA+UIYwDO52d3OZ9y/06osXf/k6PR3UuHaTecNDho4mX25T4NUOqMV4Anm
	WUVsMQza4qeIUedeKKaRWvUOGXyxWUuU3Q97Cqu5G5uB1ddh4w2/AdpLxb620Ikik5Szll
	pNngT6WaDxwc6pDwtbLfCp78MuG9Tfg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Wed, 05 Aug 2026 02:00:51 -0700
Subject: [PATCH v3 1/6] dt-bindings: vendor-prefixes: Add Sensylink
MIME-Version: 1.0
Message-Id: <20260805-ctl2301-v3-1-b86c75d1c552@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=874;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=Po1kGrx5EeIEP6xmiLoDE4sxhUkiA/m5kFmOQAaZHUc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlFv4/IX02XPafwbUus3LGUd1XNzBd4Wc4sXlrj0rRde
 afOU/c9HaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABOxy2T4Z/zqaLj+oQvmq1YI
 lSmqKqb5ME59stOveMXy5jXqbfcOODIyrLj3ebGu91Gz5mLR32wLni7wrpjgV3FSNPGpVSif+BN
 /fgA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
In-Reply-To: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_021200_755824_6F998D2E 
X-CRM114-Status: UNSURE (   6.57  )
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

Add the vendor prefix for Sensylink Microelectronics.

Link: https://en.sensylink.com/
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..22d0d26f1bbd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1467,6 +1467,8 @@ patternProperties:
     description: Sensirion AG
   "^sensortek,.*":
     description: Sensortek Technology Corporation
+  "^sensylink,.*":
+    description: Sensylink Microelectronics Technology Co., Ltd.
   "^sercomm,.*":
     description: Sercomm (Suzhou) Corporation
   "^sff,.*":

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
