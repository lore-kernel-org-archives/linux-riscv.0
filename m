Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AECC3601E
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Apr 2025 22:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaGHrudI2DtuKwJa81PKIsAUp7x9Lw3N6BUGjgQbGcA=; b=HCk5qhqWmOUqKe
	w2brgQaw6PF9tpgtGyw+Ifkw0hBnciYTN1NKttsW4d9iUkYav8ErUQBXliPDOENHQHayfmOuvbcU2
	3UnbOUI8dXtyG6FC4SPckLmQQEUkzcOuB8tNJeD/SGBBpYyoIygqeYacW0vqSVIZLTajw3yt9qV/l
	8GdlgtOv9VfMskpB6LovNke+QiHTSwArQcPHVZ++imRjDIx9S+XlDjv0I1Dx0Tpz+v10hsZ2E6lhK
	kIBp0qlkzC/JDC3NPjdoWz5PQHtQphWgqivDj6g+nSRUzNteKDKSffvhz68RQW4oqr/y/eWct1qvE
	MFScapYMtOQ/+i6h1uuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45vv-00000000GDC-1lJt;
	Sun, 13 Apr 2025 22:36:11 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45vs-00000000GAA-2JQj
	for linux-riscv@lists.infradead.org;
	Sun, 13 Apr 2025 22:36:09 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4767e969b94so66272931cf.2
        for <linux-riscv@lists.infradead.org>; Sun, 13 Apr 2025 15:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583767; x=1745188567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zd5Yp7mYzKhdmL1h2lCqbEU8oe0XDXYRUx64ZvpbCPQ=;
        b=F8rwX/vMvTuGSZ+xcUIUyqWzUvMJ3zvFqujklT/gXFB/A+xw32ujcs/rkMwqdQcSnA
         iiFjV51LPHgChxbQAt3jTtXzk7y0ur0nx62TNv97Nzsrm2Wnmy7TVhLJ45T4Azts/l5v
         IbD72JlhYaLHnxMQ6CaExRb0oDDm2glOD3ZAPcCNB2ga2oKXhvixzw8iQwplUVhHn+Xj
         /PGhvbH7JGONdMEE062vZOazxx8yX6REks4jOZe1vYlpTu4zyW0YVbnE43r7A/LvbJ96
         BT75MsmtDIvMATYsdvMEBkj9slb+VMZ3X6e0kFupkbPMIFxx4fnhMsokR+Jy2hVcb7Ro
         2Utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583767; x=1745188567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zd5Yp7mYzKhdmL1h2lCqbEU8oe0XDXYRUx64ZvpbCPQ=;
        b=i7Txglu8IzrWjIi4Uu1TF8jHdPRTnaYnas6JXbxfBvMAl9jxfecTdw1Faa4TPmPcfA
         MQrF0RWWABwYwI+TrUig+AvZ83o7rYP5OqIl/1Wd+WptvKexSdusZALdg4OxBIcmyU/8
         nEpIaLsXKo4YsNkEOFAn7tb6XweaWTE3P7BU0KHNIhV8xR23Heu8LegGyNgA+WawPNnO
         U9Ug1UkE/dbjkIZtv4k5B/6pO5jDokLGraVH/djAFdVAwCKZWpIkp3g5DuDmi21pdAjH
         pbyX2EOdjAUqqPttI5JyZfX9D1fxmseGPJgWFVs8C2oxZAAWY7BoeaCwbHREtmVmyLJK
         4z8A==
X-Forwarded-Encrypted: i=1; AJvYcCU414mQ+QdED4UGFybdCGHcoDLLimb6zeFTScOTbx1IErJWsLv9PWOpbVyp8CTHM1snN3XPPnJxYnUrww==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGqlhXwkwWdRZQmVUp7bKBJxyGZuthdewu5UHT+wrMSsJF7f6a
	TV7g5oDDZK8Y8MiKmSPf7zNGB90icH1kJtVl9SfPZgRAk0ya8YmE
X-Gm-Gg: ASbGncsxdZIjD18LKcxGj1GMxHtSCP0NVXxxtOxiJB28emcqK0ACXFA53mTKGl2CYVe
	KvBhE0XFrGHetv1Mdz94aki22p+hQuThLZ0hkI3scSzM2DhBd3J8OeFBfAIac+Mwa87ghR7EEtx
	8S3m1ZGG7gknKLFcJzMnyJ4aI6E+MRi8fKAqXFSocT94bcTPDC8iuFZtmsqpyRC+WWQ5aZF4dFj
	/4JL2grJ9g3MInPslo/FUV54QYBhZcuEr7GDkqtvanx1azzBEPQfXXnBcc+fgUOi3MSYT1fnmYq
	WuLTIKJ4R0IQYZg3cDSYKp9m9rU=
X-Google-Smtp-Source: AGHT+IHxIX17/RksehIAE9qWmRUC2wRTWJEDXIPk2oaDG1loYguyGUkNQnE+W3CfecxHYIg+ukOYeA==
X-Received: by 2002:ac8:5f09:0:b0:476:8f90:b5b5 with SMTP id d75a77b69052e-4797755ded3mr175591431cf.27.1744583767292;
        Sun, 13 Apr 2025 15:36:07 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796eb16693sm62351371cf.25.2025.04.13.15.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:06 -0700 (PDT)
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
Subject: [PATCH v2 05/10] dt-bindings: reset: sophgo: Add SG2044 bindings.
Date: Mon, 14 Apr 2025 06:34:59 +0800
Message-ID: <20250413223507.46480-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_153608_593257_F21D5AA2 
X-CRM114-Status: UNSURE (   9.71  )
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

The SG2044 shares the same reset controller as SG2042, so it
is just enough to use the compatible string of SG2042 as a
basis.

Add compatible string for the reset controller of SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
index 76e1931f0908..1d1b84575960 100644
--- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
@@ -11,7 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    const: sophgo,sg2042-reset
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2044-reset
+          - const: sophgo,sg2042-reset
+      - const: sophgo,sg2042-reset
 
   reg:
     maxItems: 1
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
