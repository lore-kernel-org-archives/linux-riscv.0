Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10058C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 08:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGz095p4GyPw83QhOUBrgYdUay/E/rj9YScwUOu5O7E=; b=DS4ccD5iFBEc7c
	QJG1HU1PKRY2fYPGZ2JQNmYAbHdLx+GzhsDmajvFINqO6/jnpTAAWSel9ar0wU0kl7FPI5+MgXSED
	S9eb/zZJEmBWHdt06IlQbY4Dc45E2tKgqupoUboWkUyYoY6oJVcJePUz9wseykdrj25qShe93yQgn
	00Dm+zL25/pAU9uTUt530OSMcdWSxmQ8CIItqctRUxF3DBcG7rtB1R2rCirjrr80dw6/RFuT2XmPo
	dwxQsRg743y4naL2/1Gfd5o+ce1j8mnkI6dx35DHNxbOuMkt6RGxvzLQ+R/uX59B8NEBXk/8wg5Dj
	f2lqzih9i0FK7MQ4hKkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZG1-000000062Vn-0S5o;
	Tue, 02 Jul 2024 08:53:01 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZFy-000000062UI-2cMn
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 08:53:00 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-36743a79dceso2847158f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 01:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719910377; x=1720515177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBblSarVHgMFr1VSeSy1dk9YozNFS90bm9c7S+clMb8=;
        b=dugsokg8xB7rNAuPekuDrx7S5HeTDTQXgKvxbodXP89JyYDkx8b4K3zTk/ZIBC34rE
         GdertAjUYdXFyI1KoWLH/qpg50CoaCAndkDFRa3Gbz6+kAfMI5YASnncegxggQHK4fPJ
         EeikK204apQzwB70pN7ovQU6bXFTt3z+iIbD4glVGRy1HZB74ttdrjYozF9mK5BpOEUf
         14e34agmSZOuS3qOOmGDlnjCyG5a6cZodrYROdqODWRrKPosfuChaGB2p/3m4/K/CDED
         cyPBP223uT7Qa72oKKrnUqrjTU0IwP7Uk9T/EOl5x37BjkqS/ZsxWkA2VlMqBdKmPDxJ
         khZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719910377; x=1720515177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBblSarVHgMFr1VSeSy1dk9YozNFS90bm9c7S+clMb8=;
        b=dvEBV6iapcQDAVKfdNEFw3F4OOephgyG2s9cNKEwdf7VdjFHIBi+N7HBSyg/fXxbwr
         5IFAfFFIHjY/ZoQQG+iRKtfCOxEB/giLCpfZp81nn0tm5JadJkMrlXxm/CvI06VaJrmk
         8rToJqsmPPnmJGl5r6aHt0LCyLW8BgwbDZ9ngNtgUuVsWhMBvSvxC7KA9PiyXz/NTlW4
         fI90Ss0CExteZX7sePnICNph1s2Npd5JC5X1ZvIsDYCeVbW4/1nuf87dZ7mzTqSw7Dxg
         X6eKXKvPHHVSOUSWYkTFgGbZxXljD72xM/YqxnEzBnqtYQ2ZHL/ZXjl40H3YLi+16B3g
         AQuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnIrEzeutBb0oostBlBrXcHKRHNYP16kvO25L+8NlW5vVjRgRkk2H/eLWQSIuCdb2lWv0Ua1+9m0FHrdscdk5+x3LUkZSDmvxw9Hvg2vSn
X-Gm-Message-State: AOJu0Yycylqqc/IClILR5XHqptxX3dZA3lHTYuS2+3MKxNHwzSbP/eU5
	VjvPGvVQO/YrWK11n9JXgFNX2L9F1jO0kQZzdnpxNkdAsQIAjYB4IPJdiLS2JEw5DQQRIDo2EYD
	6
X-Google-Smtp-Source: AGHT+IFhEaBGka3Ti+hlZOEC6CfbyAu8S9sImqvjdSOCqz/0wRb9B50fIT/vKC7eV3aR2yOVb8VmLg==
X-Received: by 2002:a05:6000:2a7:b0:361:94d9:1e9f with SMTP id ffacd0b85a97d-36760a62e0dmr10948760f8f.7.1719910376818;
        Tue, 02 Jul 2024 01:52:56 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b09a828sm190852585e9.37.2024.07.02.01.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 01:52:56 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 2/4] dt-bindings: riscv: Add Svvptc ISA extension description
Date: Tue,  2 Jul 2024 10:50:32 +0200
Message-Id: <20240702085034.48395-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240702085034.48395-1-alexghiti@rivosinc.com>
References: <20240702085034.48395-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_015258_686612_EDD92351 
X-CRM114-Status: UNSURE (   8.42  )
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

Add description for the Svvptc ISA extension which was ratified recently.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..b52375bea512 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,6 +171,13 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: svvptc
+          description:
+            The standard Svvptc supervisor-level extension for
+            address-translation cache behaviour with respect to invalid entries
+            as ratified at commit 4a69197e5617 ("Update to ratified state") of
+            riscv-svvptc.
+
         - const: zacas
           description: |
             The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
