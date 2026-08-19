Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E8EC5DF6D
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 08:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Bzd/n/zC+729tRD06AaDjmh+WB4XitoT4m+TU9lUo0=; b=pEhnMLUs7wEBwS
	av5jN72YU/zaIGHAO0jTVtHWD4AzirktdsFYAlX06KV671A2htmPZ0u7oOpczDk25hgsXSEAF6cYn
	0loB/uLSZbEa1ISg5ppX9QWYz/oaRGIrXMAibRDAqIfLJy0nAQqqr315GGfiOhzvex3jdjCQ/3pb8
	p/n3WcAKZfkKLDz5u/pDxxf+eXquY7e56NRKqps68lICISi0FmZ+Rbfant1WUd92NMV8riy++MbJU
	UTPYnMOQkgC+xQyxvUGIqu4KtySMVUz/ZOf9Edv5NftOxBy5aEqLh6Ui5w0YMIuoaHqxnuiPmJgle
	fSWz1yMkMtzOFqtmlIJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbmp-00000009JvS-1ESm;
	Wed, 19 Aug 2026 08:36:39 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbmm-00000009Jue-30LK
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 08:36:38 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2cc80544c74so2321555ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Aug 2026 01:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787128596; x=1787733396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Rj3sKjI+D/fIhnx0uthKRhFeAN0smVlqCx7Jkpt/N4=;
        b=W+wbGxSZa6ZEqH0E/HYU1xWQwO30q6Y3N6p2ZJ/D5Nms7kCB/DVzNovRkaPur8g6+3
         noe7ZSTbbR3PyBmkoIL5/bh5b+LvkYjhw+ZpkgV60M+I/Tlgee990U9hh1Ymib46OOq5
         Xc0fmuyk9umLDKK/frHR/1HXZhnhTKK8Sz6kvBo1IJGyNtDAokh/7QfRjUj6JPZuy43a
         qosNktj9A2gAcaGQBC3yrYIIi2kJYl1BoQd4gAeSoBtVWqj/sNqVohw9QLCX5abTA29m
         Cb+TZyKUuSlrmX2rTggnJRchU3JPMHjM2m47Z4W0YONH5SpO9hUBbUDvBDoefbatz4cj
         9fIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128596; x=1787733396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Rj3sKjI+D/fIhnx0uthKRhFeAN0smVlqCx7Jkpt/N4=;
        b=P/7+jfp+b2mU4LdUTJaHjVfcBSZjayDYy6qVwLLMf6QKBkNf50hGnxfZqE5DmSg9VG
         ko3Ny3vUSZs6jfw6wClurOMArNlZcDGoYz3I3zv6sbSupVTD8fYNUP102l8BavRUyPbn
         HHWxLyJsgJcJYuj5J94UK3KPbpjIxio5ibS1ES8euJyqBC1n3Q+IR2h/MuSrpTyAL42l
         2JHN17mST8ghHfkjs3o5qiwy9y4sgOKYTGtFW30lYAIb3Qn7ijYN7gbb3JkcFEhFkY0C
         VR+R2XLUl0krl4Vb4iIhTY1H0299q9k+s9miejgClz7/BTNunCxzpmgKza4gz11COkUQ
         OarQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLyUu72itOcsB49szvafHPzKqLG8D9Tg2BpSsLIipDN8k5Uygv4I8emnmmfuvtwvkIJHR8LpnMHW6Xew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg2CdDHFVsgL3vD4R51/F/9WjgqBdQGZo9CzogiGb+gRKKpZae
	fuIMj62Uskr5/kB/wzvZK+hFrAuJbMJsDP4tQUZ+J3T2Uhe48WLHIOdT
X-Gm-Gg: AR+sD11evH6gjAMGjsZrBB9Y2t2EOOajeBj2z0yYOOQEMmMH35Bm5acVcpg+X1YESxo
	uHabDfcNVc78OBba1MNjefcAXycC20uIvGMod6uxKB/MqnuSZQb0KccCxq+L1Ew32nWytshVOD1
	MdNVMMbkMZqjUtjeHEGxVOLQ47lbi2e2iuuwOmLTn0uWDOjy9TVuURxHGwUs6NvKmKSY5oOOZYQ
	QJ1AQFQFCKQ1/7Fd23wsTYv7M3knSZ1PbapTJ7eFt0h3IdcoJ+QNEtoRRPmvRBp8sefdG5Z7ecV
	sIUVzJrr1MF02opW92ax0GzKILcKISLJgDTcMYHFVVQ0K77JMH6zZeJacNU39NG1by+VZp/93t7
	U4JwAWub4EHEouyNbcEPdMYfDt5Txo7BaxQdMrs4Bmr9+qqhCihTUm00y6xgOCc4AJJFtYVQLrt
	qbvq9khxUdqSVeXTkHzdWz1B417n8YHeFWwjeZibpH66CNfMgL7ux+BuHyATRPBo4=
X-Received: by 2002:a05:6300:67c8:b0:3c3:76a8:c0f with SMTP id adf61e73a8af0-3cd00dcaa72mr6006921637.4.1787128595459;
        Wed, 19 Aug 2026 01:36:35 -0700 (PDT)
Received: from ubuntu24.. ([85.149.220.152])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc155464a0asm332268a12.14.2026.08.19.01.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:36:33 -0700 (PDT)
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jenswi@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xing Loong <xing.xl.loong@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add mbedtee
Date: Wed, 19 Aug 2026 16:35:57 +0800
Message-ID: <20260819083559.1303348-2-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819083559.1303348-1-xing.xl.loong@gmail.com>
References: <20260819083559.1303348-1-xing.xl.loong@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_013636_761890_67937623 
X-CRM114-Status: UNSURE (   8.18  )
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

Register the "mbedtee" vendor prefix for the MbedTEE Trusted
Execution Environment project (https://github.com/mbedtee).

Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d6..fd032a3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1011,6 +1011,8 @@ patternProperties:
     description: Maxtor Corporation
   "^mayqueen,.*":
     description: Mayqueen Technologies Ltd.
+  "^mbedtee,.*":
+    description: MbedTEE Trusted Execution Environment project
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
