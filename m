Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65BAC624A4
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 13:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pa0B4qkArDr7VC4jZCFBLDqOBF/D0GCmURoc6PbdQJw=; b=ZeKT7+Gx7BPEUD
	qEd9z7mjVOevTcH9ngZLRQzmLNNdLNggr2m0fS5NP9KbEhNNuJAj1JKpCVSSLmBT+TrKM16xc+1s4
	+BqjCObPfzorri7PJt1Rs1hAw5z1MuM8hLtqsclWx5+4n2xdkAEerlUUqXxYhhSbeVRbFXlGkFqf9
	gWZ8N/gDV81yI2sBCaYhRoZ6q6TfIdZFALKxoGgweY8QhZ0u8BuZzYwoj9eqvxylwTH+Rx7b/NaEs
	s9+42rQMtx0EwzVpbvV79O3FgcleJAsoMfpYPdHZoz1sV8ODWxfxOfpHQzbm8vQKejcKLNrBoU4/G
	wfSh8iAcRVK5a5OWS9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12LC-00000009VhM-07ku;
	Mon, 31 Aug 2026 13:46:26 +0000
Received: from out-92.mta0.migadu.com ([2001:41d0:1004:224b::5c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12L8-00000009Vch-0ZsZ
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 13:46:24 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=scBtiNDuToM2DtBv3G6lWHXNT3gA4Po3qt4MWXFmDe4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788183979; v=1; x=1788788779;
 b=URUqwe6x4gxi8rdjYpq6jwS9Veg9DbKLiyHLU5MiT79NJU7Lzjz4pyj755D79YxGi8BNdQ3W
 gjA+6XFfjZE1DCPUuP2NVjHLyLp8+dOVDebhBwoN5ReCAqiG/ykPShRSsIWvylYLYI/61u02WCs
 PIZGMqo6BLpY5xeo/2KbMhMM=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id 2c159e777dd25be3;
	Mon, 31 Aug 2026 13:46:19 +0000
X-Mizu-Trace-ID: 2c159e777dd25be3
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 31 Aug 2026 21:45:35 +0800
Subject: [PATCH v4 1/6] dt-bindings: vendor-prefixes: Add Sensylink
MIME-Version: 1.0
Message-Id: <20260831-ctl2301-v4-1-b335d52a0570@linux.dev>
References: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
In-Reply-To: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=944;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=scBtiNDuToM2DtBv3G6lWHXNT3gA4Po3qt4MWXFmDe4=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlTW2der51/u3bLjp9vfNcWsbYUOs8uPJSgaF6qtfH1z
 pSLfqZ3OkpZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACYS28jwP+TRgQ6eHBcL2w8N
 SqvfSLl+29dy8Ude9cZIoei3fF/2CjL8M9vl8rniTNTZnb+y2zy2uPQwd1pk5xV0fz347MGK/T2
 XWQE=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_064622_337488_F68A93E8 
X-CRM114-Status: UNSURE (   6.81  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..4a5cf436eb14 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1495,6 +1495,8 @@ patternProperties:
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
