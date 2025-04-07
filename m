Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0426C36002
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 01:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyBOu21gwrWqvGxPPIE776i5DnnW26PX+SAAPm8IIcU=; b=BdVdUKQ/rMY35G
	Etyz9Y0cM4cINvDrBJSKMGIDC5CQDGJm/bIHVFyleTSOTa+bDPxwjNxv8Bl/NSH3Yy/r+f6C43BSb
	lRs8TIm6X4AlpcLTc338ZRuREcjFtdpHyMM7Nq6qSUAwoxLVs1a/OvbzwW8ELmhgD8BSFm4/GM/mO
	BiRxyP8c9+ac/HeIHoU8PK/8gpL1p5xWlp3V/sTYQ1+uJA0fo9K40yatXOUr0dELPawNFBLimEI2f
	LsEchbLZ3lDNdq2Jjl6m2BGiAI2kpZNRm+omc9ytnzqsWec3XVMwpQmQ+A1xTr5VLjTLhjxvqmkBV
	Oc9NsVwfJ8xx0+HhtSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1axS-0000000G5Uk-1nuB;
	Mon, 07 Apr 2025 01:07:26 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1axQ-0000000G5S1-1292
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 01:07:25 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so47157256d6.0
        for <linux-riscv@lists.infradead.org>; Sun, 06 Apr 2025 18:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988043; x=1744592843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fgr0LN814PpxiHyiT7OJDCs0PtpZxoE4k4904FmXN1A=;
        b=OwWfUkTgQVl0g+vP4zbIwBRnRToxXRksL7AQxn+oGDudBKIYrjL7u4NXfwIsqbb2cp
         4pgLDY2i9F/9f17TfwKTWEgYUIWC+Dgbf3P0Yvdzn5jFexPuYRFIowoIz5ZRroTRqTp6
         RQUqayvHycTtmgpLy+wmJDYYEydogzFRobDl1yeB1hlPVkIh3b4fpq78/l444dX1ZlxE
         5Ce8lfYPKgpY9B1NvVnaRA9oZHDJNHNgRAXd7WuXQ9Cv4QgUWNtJPxtrXj2yBNDCpek1
         GSHk8NfyweMXiv3IypkpiPYXyB3RXj1HLU2mM+27+kIB5RsFfbX47+lmwjnMiRgI4QpB
         RTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988043; x=1744592843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fgr0LN814PpxiHyiT7OJDCs0PtpZxoE4k4904FmXN1A=;
        b=oXM6Br8uZfrYZ/PNqe0jgpEUqtJo756GTDpSviuL+n1RWYmNknGBnuWJgj7K3yW6iM
         qb7vjnElE6STyth0Glop51KQPYcypQV+iP5JkwWGf5rPIjPTZlHbeOm9Lm+FodKWNgvi
         y/Gs5oc5OA+CTVM7gcKcJYAz1UhX5uR49FevIM65nDYzFiMvfC0P00+3otBRKvhNIy4Y
         8wkL36YG6FJtfwZ0EAmFSnerpKbDouq5LJOodKNiSM1EuUv2O2vucjsll4sdun+6p3bx
         gdUZOfcbRw8s2M/wbvIAbM4BrCEUAd9gle/dv1ULEW4Ypw8FI0YIFLFq8i/1Xg5wnbmB
         Ts0w==
X-Forwarded-Encrypted: i=1; AJvYcCWQgyuIeAOBj4PzFuPIYv4w72mfki79luwMfFOIiWVVbrGmbpem7cAj+lD/QDAd1noU/QcbzR5wnCMxfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfcazjqRXufJKQ2nMJhviAbxQpMGoCkRF8xnfDaPNRh3XfPbjn
	45WDgmGt3jbD0NerDAbP7wfaVesg8tKOmcwo7/x4r9vj5lNNtN2r
X-Gm-Gg: ASbGnctqg51MHfhsUq+Ll7ZEjVA2kG8yY9Vs1dq5whTJgM3KlxsOYDq8ujJUD+MuJpJ
	pcX0z4hY17iZxqRVu/HOCYZtzGDlx/Z31PnREhEPXCE0gVcj51GH9+Cx/kgr82K34SirA3VfMJw
	9dtfe0tk3NVeJYS4Mg5ucUsqfkkH4keGr3FDf0ihW8Tg4wTx2vTuugdh6QgwYeblStIOSXnL8iv
	JTcrvyULmmEkrDgDx6j3GBwcO1UnSN2S+STR20tP7qYLJybpUFixZUZZvk3PHBvARODqwYnj08w
	9hbkOQ/iw0eLaZKrNQZ4
X-Google-Smtp-Source: AGHT+IHUbWneKrGAUPwQnZkxyFwqsL7dFlvzrPr8w+sNokg1K3CrLnlYjlNIEnDh2HEVz8EqSTmwBQ==
X-Received: by 2002:ad4:574a:0:b0:6e4:2dcb:33c8 with SMTP id 6a1803df08f44-6f01e794739mr119268666d6.29.1743988042941;
        Sun, 06 Apr 2025 18:07:22 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f047c9asm51783546d6.59.2025.04.06.18.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:22 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 8/9] dt-bindings: riscv: sophgo: Add SG2044 compatible string
Date: Mon,  7 Apr 2025 09:06:13 +0800
Message-ID: <20250407010616.749833-9-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_180724_313556_7F571181 
X-CRM114-Status: UNSURE (   8.44  )
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

Add compatible string for the Sophgo SG2044 SoC and the SRD3-10
board.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index a14cb10ff3f0..b4c4d7a7d7ad 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -35,6 +35,10 @@ properties:
           - enum:
               - milkv,pioneer
           - const: sophgo,sg2042
+      - items:
+          - enum:
+              - sophgo,srd3-10
+          - const: sophgo,sg2044
 
 additionalProperties: true
 
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
