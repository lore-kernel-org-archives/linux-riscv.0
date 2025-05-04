Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B673C369DC
	for <linux-riscv@archiver.kernel.org>; Sun,  4 May 2025 10:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/G/WYRh8Ru7t+v49WixPm2QfH3y+c5pbQV+205nQI7U=; b=a0im/jDzuX5Mr6
	p/sr+z9hdvtqqtMxWB/ibY+FaB1KRLDcSF424m86+dq5gZgrnPxK4UnyR7RjdpNzKwKwaoXIxAVfP
	0c6CXoe+VPz4PyA7QrE0qJMPZpBtwQo+cFiUBxvLnXip7k2Uupe9NzcYo2+Nzn0dr/nO1yNl5F0A6
	H1gsGH+AQvQK7WmtQ3UFzhL4ykWDZW9/o6wfyEy6FYZiHGHtI7gdx0nXlCUcAhWDLJpBHoXFL7vvx
	hb+XSr+LdkFMcPEpTvzFNT5pPPMJuqcKFUWGnzSKqTmzjXea6OyR7CgIJbOkyWtg6z79fHrmfLe0w
	pmgZmvVXSgf9uua447gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWrY-00000005C9M-1VBB;
	Sun, 04 May 2025 10:46:24 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWrW-00000005C8c-0b5Y
	for linux-riscv@lists.infradead.org;
	Sun, 04 May 2025 10:46:23 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7c7913bab2cso379561985a.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 May 2025 03:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746355581; x=1746960381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0dBNsRLfozNYsO2JqfQXy110W8bkOtUjtTaQB8elP4=;
        b=FB6B+26aMVxIUqxc4dij3tSxcuWkHjoMjQ7l/yMSWc0AEFcSAWSwyPcP7n+md6/Jhg
         JoFmXC24ajDV6mIGROKDtVSxyz+Au3BIuKzfHPeCPwbQWiReP9uOKdguUg+mra0B9NUK
         wnpCW6X8Ps77519QMLlDLXL0SWlOEQE/4CMtNGp05dGL717tB7ySl+6z0K1xaZKecUMl
         700ajXd4SovNXNBFZ3kZD9bebIvUiY3Q61Agt37YBDYmZMOhErmEucRAG+j+p+gBTDyN
         FNwQHN6+kiwXWahCBytmPkASeex11ODLBmZntpu3TU7gSjRb/QQXhoulW7QH14/yLZm0
         psaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746355581; x=1746960381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0dBNsRLfozNYsO2JqfQXy110W8bkOtUjtTaQB8elP4=;
        b=IvUu5zhL2HHkemn71gTKYFjJ5WyO3R29DFbmVfPfRa05IdKy7FJpjjZg74Zbr2rTpC
         K/mSwiRi3hoBpPdCXa4JfUzfgBeoK2e0pRwChqNwGqnVySxNCgJfT1d11jT7VyIDF4F4
         uvaZb1NdiS5oVYaqYdhYkHaGM+BFdvzEDgJywdgU6Dcb7l/+RkV8kfmIGD9fwaZnOmTb
         h0XvSKaQghVu14jF2VjU6y6E+dAebuBg15ha7wAGzd94rF9q7qGABHazHWRECt7nzr/f
         XtKvJhkMix3B5v67Syo77cmldr+lQkHztrZZ0Blld/l8gbC6UwVA4w1+vdtWTbFl+wFY
         OQkw==
X-Forwarded-Encrypted: i=1; AJvYcCVHrJJ6THjs3ESjep0aGPApR5V1cgD9PoU3RgmnOdBgpxHFL+1i69kKH7hEPFjKlpF51sSTTUu+Ln8lQg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yydguv/EGRnuo4frxvydct3/jFkjekf71PT5mfiqaEBnwvbbbjE
	RQIfVSOt/sbaz5RajraRyiKHGmEldGujIFocdXtKDN4sAFHw8Ht1
X-Gm-Gg: ASbGncun29X7Hk1daEqxMYnmgry/GE3FComWujstLjnFZHkexUoANQcyRsMdwtOsIOC
	e0J30+5xQMf42PBPLotOroP+gtgKURTCwT4NStjX+FoDyTtBQBGeCLLQh08t2uut+MhKi97UPnG
	Genstzb7t4eXWYUsFId/nd6KrbjCahVxCm3pARH1bZalQj1LFOkJaQfUnFLqqHNbYUWNao/JTTU
	K7z62tuju1BMhA4TRkFnszttB8b7LEyoNVEcWC+VlciWaVhWcRwFQBdh4GUGe3/9EelW7wJlrIN
	s9cIgrD+S9m12f62
X-Google-Smtp-Source: AGHT+IGYfcJI1KOo4mnYSm2aZ/wO68fNQbksb1q2N85JkbNZoHHGaOY6wCLzQBxd67wnG1djUIGKBQ==
X-Received: by 2002:a05:620a:2a10:b0:7c5:99f9:6ada with SMTP id af79cd13be357-7cae3b0a53cmr471104785a.50.1746355580956;
        Sun, 04 May 2025 03:46:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cad23b5f46sm429527585a.20.2025.05.04.03.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:46:20 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: clock: sophgo: Use precise compatible for CV1800 series SoC
Date: Sun,  4 May 2025 18:45:50 +0800
Message-ID: <20250504104553.1447819-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504104553.1447819-1-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_034622_179398_A3AB9AAF 
X-CRM114-Status: UNSURE (   9.24  )
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

As previous binding uses a wildcard compatible for existed clock device
of CV1800 series SoC, it is not suitable for existed requirement. The
only exception is sophgo,sg2000-clk, it does match a real device, so
keep it as is.

Add new precise compatible for existed clock devices of CV1800 series
SoCs and make old wildcard compatible deprecated.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/clock/sophgo,cv1800-clk.yaml        | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
index 59ef41adb539..379ce3e9e391 100644
--- a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
@@ -11,10 +11,18 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - sophgo,cv1800-clk
-      - sophgo,cv1810-clk
-      - sophgo,sg2000-clk
+    oneOf:
+      - enum:
+          - sophgo,cv1800b-clk
+          - sophgo,cv1812h-clk
+          - sophgo,sg2000-clk
+      - items:
+          - const: sophgo,sg2002-clk
+          - const: sophgo,sg2000-clk
+      - const: sophgo,cv1800-clk
+        deprecated: true
+      - const: sophgo,cv1810-clk
+        deprecated: true
 
   reg:
     maxItems: 1
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
