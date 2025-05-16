Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094BFC2D0CD
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 03:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sS9Ng65pzMSRIY4vbPFciyAvHZ6JeZSX3MCf8mvyWZc=; b=PljV4Fu8z3Fb9i
	X/0VWS0NeOecN0DidyzIQiwwvFLMFo7lWjx0k3xPrdb1TeKJ6ar1RWBzLy/fFjFlKpLWzNSr9sbFr
	WOJcn/ySeUM/My6Br35zzD29nhyCKUoqLOts+z/JzZuxIZtmjRVVeaBsqhZ5+zFn2wPQMoRyNjOQR
	xzC9WowiWzxxLv1CusDj69RPqreYMU6GiJUoE4sTBjGFq1xl0bQ0tYDGBIZg87iaR8S0WF84zz98R
	j4S9ToyjTAFTM8PGvWSJHBH2f87GE6tMHCdJRJ9XYko4EwYSuCEl+nuy0WMltWzCtc22OFSzbwMoE
	qZbize4KfsmyoxLZVOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOI-00000002Jug-3D0b;
	Fri, 16 May 2025 03:05:42 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOG-00000002Jt5-0ylU
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 03:05:41 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-231e21d3b63so1656815ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 20:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364739; x=1747969539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zkq5aqcqgDyI2pIygo5ON8Kqr2pvfOAQO6NeyUgej+M=;
        b=Kd2VblbJBTVZ/9yA7evGqEGraAo5MBZzkuRcTcsbgA6++k3eCE/HgeJhCA7oW/WGlQ
         KiVen+jsSbQ4/0CvcwavyssDy+nT60lr2HEG3kTNC6tSpuBFIobAsIHidrgPC2c3cj5R
         ga7OUCMeUgfaEGrR0d4cv1SyKW3ejSb/WfBqxqppdvceAvLQnBXLi1uzxq1TDaFTdYBY
         wHIpDosc/IZoK7v56j+ezCJO7T1PQ+ZCvW6svRnxpRDkT3KldHB7Kg3VCQK5teDT4ajg
         nj2fZHGrALJ8A5Nla3nQBGlc49eUYUHyOSMDxQpTQ+SMh+88jrWmogGSJ+g3YV7gneV2
         e7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364739; x=1747969539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zkq5aqcqgDyI2pIygo5ON8Kqr2pvfOAQO6NeyUgej+M=;
        b=vGCM1PxOSMlCvF3QDkcFBZjOGjmSoTJH7QIelxtiFgojdBfauNWjpsdobjbo8LbesL
         Ql/3YQaFjdGc4AEgTzfuKuZQFIJ9aO9+bc8dFYfA084kOpIVg1wyRkkxlCgzfltdyvPW
         1c2ogsJ29M1E4eq5pcNFYZdAhDbGmDQ97n2SyUn5CgKSxpNS+ktNFrpSfAuZMmh2VtmC
         pInB+adRtQJl6+PclWnhDbIJbpfd71fOH+NU6gAWnWj0xTZdJauBQfU1ADsOxam45ljF
         w4ka7XZIVq0MwEYB4jNDI0M2zq38L75ipKvgMNHFn5zsob2PwIWUMIA+Mc2fNJTQeJU5
         mIvg==
X-Forwarded-Encrypted: i=1; AJvYcCV15K8zqXbNbOg7gjWHnspjgtZi6MCZnkegoPMJEPICxYpKlAl4DKHlEXDaJ17OtUYAZVY79yTpheGwaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIiBajSozhq+hwMbU74bsa5E3KAGLvmBPF52ED7pXLWXIqLrw7
	t4ZL5BPZn44LVlOklYHGtX/JiX0CpI81zfzRauiXUExDKlm3q2esm/FJm6MWRQwRkaA=
X-Gm-Gg: ASbGncvQx+u7i5SfWpObgGv/D1x9wavdHCyR9KUEd1OQ4S5r+2VgVPfCJdYeyurDtWV
	HLnO518UXELFcozfBHMftx4PIEMSZQBdWsFVoLOABiJrgIdFC7n2CGNH/LH1nBQV0AthH5cKYq6
	+LloemjFt5V+aOxAutCgqY03ZmQ+MwOb+WcxKDj46IEgz8rNvDqleMWy8Af9mDsEkUBJXlfiw8c
	tVDc2j1jHN8CsuW7AphnePN9ONjj8OAxOKnBBqiD9X0C1GoXVe1upByfyWsqegOHaKDUjuHzg25
	inOfkrcUSLqJZt+HMN+4j+RMvqJVDh6SW/nOSMlsn6RKbzijKxR5OMrO4W0vR4og34JsF3Ue/rY
	meCfwrfv818gML4vVRmZU9Q==
X-Google-Smtp-Source: AGHT+IGhn8VCzQ+upEiABqh6yMLEnwbq/fKp8JleBYzALUrKxgEFyJXQdx0bVgVT74oP9BQ13kZiGg==
X-Received: by 2002:a17:902:d543:b0:231:b7e1:c977 with SMTP id d9443c01a7336-231de3763abmr12204855ad.29.1747364739403;
        Thu, 15 May 2025 20:05:39 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:38 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 01/12] dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension description
Date: Fri, 16 May 2025 11:02:59 +0800
Message-Id: <20250516030310.16950-2-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_200540_295063_C01E8DBF 
X-CRM114-Status: UNSURE (   7.05  )
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

Add "xsfvqmaccdod" and "xsfvqmaccqoq" ISA extensions which are provided by
SiFive for int8 matrix multiplication instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index bcab59e0cc2e..d36e7c68d69a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -662,6 +662,19 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # SiFive
+        - const: xsfvqmaccdod
+          description:
+            SiFive Int8 Matrix Multiplication Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification
+
+        - const: xsfvqmaccqoq
+          description:
+            SiFive Int8 Matrix Multiplication Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification
+
         # T-HEAD
         - const: xtheadvector
           description:
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
