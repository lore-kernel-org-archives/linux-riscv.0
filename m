Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54218C4451C
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 09:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIbUzvrkke3TTpUGZJ6rTZwquRnyyVw7NSP9aSNnqrI=; b=nBqoqv47HTcXqN
	sy9vsQ2V++R7QwkJQI2nYtokdXyDubtjAB1dFJkqe4yszUyXfb1BaVehtqc0Hers5gzg9HrU+bsfD
	ht/qs6T2TRvBJuToLMYK2uRpKfgA9Slp0p/LnZ73M/wQwhasS6KT1M68x3V3tSzcKbvITE42oeZVR
	rLNSSWtgrU53jXY8kNfwMLCcz0kynIYEtUwjzPBmlV4HXt21OHI72KqShBA0Bkvuk8Q2WD2hnKKa6
	CK2Jccqp1J40WeOQvyw99aA2UC/qAQQjbaxXk4Ko7gCzVOCEvGq1ZHnftpO8k3sJ6hD37dtsAm9C/
	kgJxKgSxXNOkewnePbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm760-000000090zU-0EVm;
	Tue, 21 Jul 2026 09:49:04 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm75x-000000090yw-3sFb
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 09:49:03 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784627338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yW0a7NecQZu8tgs68hPXWQu1JjvNLTiVMw9Gd5E5ZSk=;
	b=R1QVjBNObzrVZoAzzhS18ns7eQ/nfN83ZZsTluCtR6BUhNdVarBCKu+fVJz+IFNWbxPgbx
	mscmDr+wGMchsOyEpm3ro/TjSWACBQEWMPfp2fsOhS5GvH1p5IaNCeyFAl+XEza+xnJXPj
	XlE366aKqAdxlgAGcB/I4x8qdgLb2wk=
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 21 Jul 2026 02:48:27 -0700
Subject: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Sensylink
MIME-Version: 1.0
Message-Id: <20260721-ctl2301-v2-1-ef5fb342872a@linux.dev>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
In-Reply-To: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=841;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=612r3AG72QRyYEjk5fbNd5SB1mpMpgIAzo+3/vrc600=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnxDvkvkq8plZgnyf9e8OZEu6zaDOZXLhe/h6jLzbtns
 1/kfvm+jlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgImcu83IsEFLrD5uYQD/h5ts
 195rfLCLfOnwunTugjb3MxsfSaTZdjMynJR8//lJQO3LS4/sGLQ07K/M4vyt29fAt6Qmw/klY2c
 iAwA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_024902_117180_014A18C5 
X-CRM114-Status: UNSURE (   7.03  )
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
