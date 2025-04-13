Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31159C369B4
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Apr 2025 22:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJIiIdJFK63KjE3Sg0krHBXb+EsjMGvJpxUko101nQ8=; b=hTMCzkIcvSfucs
	FAUG7z2cMXh7sFIqm1zUnUT2Y637Vny+naGfikwVO680mxBRQo7/0dmC17Yz+IzdAgVSO1+Egk9wp
	2hpal7OX6hA0Fsj9cQ3G8DOcg1eH6dtkUWKueJMRf24U+WuxOYSPW/vIGiycf/pXZjipMMkLJJ+6w
	fhJKnG27AMcxkaf+FKDhk9ikxB8EsyEgN9BSpBUgYB8RWmjppr7V+suUlYano09RBVzDwjAUZZDly
	+LFVl15Dxo5U93yMJtwmHRC3TqrsPzcRGmxEyCnBPi6tnWj1Xxv9wBYOle2vEw0dLuEh71JX6uuY3
	OYJjWTPJV3pbc2LL4D+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45vs-00000000GAq-2q5j;
	Sun, 13 Apr 2025 22:36:08 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45vp-00000000G82-1UpB
	for linux-riscv@lists.infradead.org;
	Sun, 13 Apr 2025 22:36:07 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4767e969b94so66272611cf.2
        for <linux-riscv@lists.infradead.org>; Sun, 13 Apr 2025 15:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583764; x=1745188564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxIhm0hMBOl2X8srvjlQ1v903Cf3zvDJK3JKql1lGXo=;
        b=muLx+MsgtFQ7ZuLtRjN8XI1c3KB7d/t5qpJYmXaQDl5wzEnV0sebkUk1xSX/zLLwIm
         xGORcSRe1gyQ07bwyQszs0ZUcbBGYWxbCQnhgAXWtUmW0PNRzHFtqi9+BlVsWqgNHLV4
         bNSmYSgfB91qMLWviHWDkhx50NHhvaVDer1bPRQkvjH9Tybi38X9VuhXijYoGAU3G2ZY
         T87/Le3T4v7VN94q1W9/lwFRm/QaHz7CsUT94z4DMkn356zhkWYvZmWrfyN0KxE73h5r
         K0cKvLrHRh+UUhZUpeQd+CD4IR3A0DR3FsgcJwHLZOV0A+d9FYnKEqEwYiZx2hNuf3O1
         I8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583764; x=1745188564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxIhm0hMBOl2X8srvjlQ1v903Cf3zvDJK3JKql1lGXo=;
        b=kB8YvNKpgLmYD0uyjOpWceBMNcgg2eFDrDYqXO36cnC9E9E1ajkq5NmRO7vuz5qW9M
         orNMIITHgKETfke1kSRRHVky/bKW/4zQPXcxHxZa/R/1nevR4PuEvmhUv9SqDMVaroRB
         B94MuhT4SRXd2qGED44GTlDjqcdKNWcXeQP9iJF+B7hJLM6/f6hfwW6OYSeVJeI5fwDM
         VLJVX6FtvqjieFEO+hocyVTfxn6cCJY8vCxLmLXEwinS8WW2P55vo6gmDHDPKyu4ZAWA
         9Ksth2RqdStAw1MCBe0FyO0t6yGq17mwCWIQvxMyGAD/bzONkIUa8SddfOhntMHOLv19
         4ZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAQXJUhbhSjQfkOQGOadF2AUp/7HebaUr/gZ6lff0Gu/ZvLdj4nm83xJ0QxUvVABNKoUVOJZNpv5XWsw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj/e1aNKE6dkInCYAovLt1f6bniEcKPXXfCzowqOpgJHBpYMRE
	bKOMu3L0OEJYTBVLeDtn6JXa6FOtJUzlA59I/Z43m/HKabPMwoJi
X-Gm-Gg: ASbGncs4sxHkNAtfOq5xfx6JhyhzI/GN0FNuM2iFrQAdOwBEEqDqJuq4iQpApXepUtM
	52vzBTlC91PeQ/rBWYilQ7QHJ4QF7HaelIxtwMqSqwmtkQEVNLscPQSZ2sQOXjBZNTRgfESM/+L
	NHEmOkWWTQOjKYCsCCpvribjWnEBw0fGFh17vTkNoInz1HtNj8f09kKrgAG4VzOnTyXOqRG0qUH
	0H4sZ49o6t4PHdyicnkcCZ4AB3cJ+pkAjDrw5F+jH9zkH/RycIXzLe0uP1lRpygXPBwtH1N2PRV
	KJB1jh7ATPYAvh2J
X-Google-Smtp-Source: AGHT+IFo84woRciVkAQ2hF3obX7SVl65Hj+exFcnkwrsEEvc3GWg1aGSkIMkZ1v62wMhkdyNDFHSrw==
X-Received: by 2002:ac8:58c9:0:b0:476:60a1:3115 with SMTP id d75a77b69052e-479775d355amr169052091cf.33.1744583764114;
        Sun, 13 Apr 2025 15:36:04 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796eb2945bsm61605741cf.32.2025.04.13.15.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:03 -0700 (PDT)
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
Subject: [PATCH v2 04/10] dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
Date: Mon, 14 Apr 2025 06:34:58 +0800
Message-ID: <20250413223507.46480-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_153605_437027_1734D020 
X-CRM114-Status: UNSURE (   9.18  )
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

The SG2044 implement a standard T-HEAD C900 PLIC, which is
already supported by the kernel.

Add compatible string for Sophgo SG2044 plic.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 3dfe425909d1..ffc4768bad06 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -70,6 +70,7 @@ properties:
               - sophgo,cv1812h-plic
               - sophgo,sg2002-plic
               - sophgo,sg2042-plic
+              - sophgo,sg2044-plic
               - thead,th1520-plic
           - const: thead,c900-plic
       - items:
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
