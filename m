Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515A6CD4F3C
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 01:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPbS1UfTKFZdQHHLlRIk4cBZvMl6B2PhqHjvWhMyUY0=; b=KqJV20J0aXL1P/
	ZWPwo3CKzC8fDQKuVY9JrIXZRO570osprSqU515bpLiXXJCBN4Di7HYBz1enUZ+BJ3p0JSiunOMHo
	j5r3n+mzYHKcc7YiRQiPS8/ecBEhL1Zqrn4OQ9r0yCaUQ0ZSnV2zhN7Eq9I+KJKykSCj352cXFRqr
	aqFkc7hvbRD31nlLVP51QYAAB3oFodwV+opVxxcdJXq523FIx9ClEkUDbFu3zL47fnC+cAEQyW3u5
	ITrnAzgxJvCibq69ErhoW/zRzjGi5GG7XL5+lFbZTpyXUMeJG+scrxZFD+sz82tcOeOZVjVspNfK3
	UAk0r98tvaKHoPuXO0yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOQdA-0000000BsFR-3P9T;
	Sun, 17 May 2026 01:49:24 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOQd9-0000000BsEO-11N8
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 01:49:24 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so389704b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 16 May 2026 18:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778982562; x=1779587362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBf3UIF6lGXHsknt4Ghf3Tw97w9Ex+KKpzto98h8Prs=;
        b=JwZIOxFPNI0Rh1B7X6YZdS8mKX5KS6DA4g3D7KylHlaIwzgtlJEj+2TuTPG5MUYjA6
         89+NPqCUjHnwX+gm+Xs/t6O/K/cWr36iTR5NVvKGf+vmEG6qfZeOddVzSshbJsf6l3Mk
         RoOffC/KOfCgi5GWbQU5L67x1+7Qzl50Mk0/KMjIM5l2OfzMvzWs0QjKmk0lhquJR+xV
         ZNSUAVeCKhLCgAs/2kfqAYO1wR6QhP+clkmxjzRaaS3V2LtUnRfwSlHL+GHQE+QgjpZU
         nZTTkuP7FE3OANrG0O0wfWDISGpPxJTjyKaN9svQlX9+tncfYYDptFdTGlsfbyHK52Uz
         t3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778982562; x=1779587362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pBf3UIF6lGXHsknt4Ghf3Tw97w9Ex+KKpzto98h8Prs=;
        b=hzyMAKVVLMRhpW2XrjOqM799bo/hF6ukicKh39Q+JDm5a1NHDAjQ4qnFED7I3yBN6k
         W5yHzwR0kwgtSgNawGXbC6TVW5QWxBTXgL2ea+1VvjSlftXPEQKbvK1SWWtbxHQb2I26
         oSucBfZJFLyXMHfvyWQ+aabt5lzId4mf2OuGlf389IdejzVOdXF4HjqA/69sqKUAaIyn
         Toy9VXWZ62jX++6HNitPFBVfYCdw5PIT2/7ArQggjQyz05aYjJdIIgNB5CNzU410L5zJ
         ostYePIKM7H38LIb29mCJo4NtmTTD5yiyMN9Kqrtp8DeIM6GDAYuduoExGES5ACF2K8w
         H84w==
X-Forwarded-Encrypted: i=1; AFNElJ/lV5e5adGKnA7yphvPWFc0v5emFpirxup2Gl8H0kzn+iyVibHyyblJ8emW/m/LA9TT4Q3FJy17f8YMdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWxOBUOp1bLJlFqn/vLX9vQr6AawRTxFxTQ9d2P7WbVTOO1xCd
	TbJSaljF6EClnAmP2f323lrUaGwSYR/+KNStcrMqcjHBVWXTz1QOssvh
X-Gm-Gg: Acq92OFCrxS2mgJF+X0dw8rFkuW4hlbKaXUgYL+HtqUzbWzjn1JS6+WYBFqI+IKf6jM
	SORX1Ffv9ozFkBbAl4SO622kqxwXGAcC8CYNm4bsKhmqw4Ot/OMHJjmfV7kn0nwxZs0ZKitTCUY
	iKJRFZBG54k1Vm/apLdoPWxRghUtuD0f4LmuFqCzs3yWKFOPEyNon53JpwaJXeJGyiVEwyZEQNw
	hvgkeUX4FYJ0vPVawXMOemTwFfGWvB2mN1MVptFOuESJye63UgmJYEwhAg/Tl7ZX2RxEmDCAj5B
	g6Z8yvBdNbBFzFGlaB7QeNl0tubqSiGp/ktTIws8LEvBbeWNBqEvM49M+1MhNYccT5v92EEEzHq
	Zrj5ZM1wK/d/LcjWdsRGCuDbkY2utRlEdYqFTEFqtJKZD9EPh5vZ2ckSahWn++rxMDdG5ajQRVf
	qTNyMbC/geZtcimAma8fD9aOc=
X-Received: by 2002:a05:6a00:a20e:b0:82c:e1aa:21e3 with SMTP id d2e1a72fcca58-83f33bca81dmr10011080b3a.10.1778982562438;
        Sat, 16 May 2026 18:49:22 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cc8bsm10511314b3a.55.2026.05.16.18.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:49:22 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Alex Elder <elder@riscstar.com>,
	Nam Cao <namcao@linutronix.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/5] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Sun, 17 May 2026 09:48:38 +0800
Message-ID: <20260517014841.254085-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517014841.254085-1-inochiama@gmail.com>
References: <20260517014841.254085-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_184923_310853_47ED9488 
X-CRM114-Status: UNSURE (   8.97  )
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

The IMSIC device on RISC-V based system does not require ID
remapping for MSI. So this device only needs "msi-parent"
property for IMSIC-based SoC, and the "msi-map" is not a
necessary property.

Add new condition for MSI handling on IMSIC based SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
index b3216141881c..91bbbc8924f6 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
@@ -27,8 +27,11 @@ allOf:
   - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
   - if:
       not:
-        required:
-          - msi-map
+        anyOf:
+          - required:
+              - msi-map
+          - required:
+              - msi-parent
     then:
       properties:
         interrupt-names:
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
