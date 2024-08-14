Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DE6C52D7F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 08:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZ3WuH/Ox6X2sWiXsVHtAzG6M98apbLxs586whG/uDM=; b=YSBsB/MctW7q4r
	LLcZDB4DaLBQDQdl9cSUB2xPYpQwoxd/nFVxtGnkCGcJ0pG4dLNEgN+abvKqHX1xzW+cA9yqNfPwH
	QiVHWOFvlCTNkalrBC6fbha6lqcs1ooQWienHHaT0D9pZ50xU45k1EdhYvNPlGRMXiDGPaxLUCSeC
	4GmFF8rtjTYllkfsfPRJuwipuW8ycROyHUesIjKIH71NwPPTd3lzBI0LJ3s2tT3/+BsZdU9uJ03ek
	P70QDAhoC3L/WvUviGmtzPH+W2D47Hqa7w1LKBGW0v+r9KdqVTSY/OI46MDaz5TKxAo90dRQCR+o2
	dmzMMTvw+IWXFUZvFGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se99Z-00000006CaP-1OrW;
	Wed, 14 Aug 2024 08:14:45 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se99V-00000006CYy-40Wg
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:14:43 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1fd70ba6a15so49193825ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723623281; x=1724228081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C80mIDHR/SSEQvshL+evnKrl0xyN36hJKjVYwlCZpxo=;
        b=mYZ06nrjJufJzEnzKCW6zgPJF8aAaAgNYBnElCSdtRERfMsDnhzZmEnuR5gA/oVUci
         c+Hp2M38mJ18PJHkplNYTh231DCmx4FKSsNhJBWM+KZjPVQacGgVRu2v/qWlpEoQTJbD
         eXoFOg6MXzRvcb1i/TUKmaerS0UciEvLhZ2JNWKs5/9hJ1DTZnRpWGKemKVQYz0bfFZd
         reW/iNV4XQY4T6OvehcAl9lpbF4VR48+RIANKTA0t1yBGvWCIDN6+eQjxInuJtxfpeON
         Kpg+7erPeSgn97ZNntALn6IOtR+UyeBtVCyKCHAkCSqagOBL1tXMvhAvfI++XwQl7gB+
         dHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623281; x=1724228081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C80mIDHR/SSEQvshL+evnKrl0xyN36hJKjVYwlCZpxo=;
        b=eualoSRnDjk93qzTMo3V/AeygMSW+4q5n+bxinKfR/JEak92q457A4WHoLuXHm6b5t
         oWzBtCNWBX1kMEX92Y0hoC9kn/ootwHnMYJio9qMq2PAP+j8OIY/8HqniG03XAhLYLH8
         swnUaQxfsDYyVzmNI66kk22yU9NGZTv2asmT4sOVfwyeNUXQsFXczIe24wcBLTMe7y24
         32cdW36uID1KxDNmyAOH5REolzTbyxfMG7uZwa/+07MOLz0cm3oSZIj6Ev2hBrCuU5nm
         YNH6S46E15eHWe2IWwdFEWEXjuXFddypVoxCyB5isCAB6HJHCYe5vpg8BKpPyCmLEQx0
         msEA==
X-Forwarded-Encrypted: i=1; AJvYcCVkDbbWc32WkD0dWl9Q9LKfdXytlLMl/LETt+X7AbLIclaXl6qN5qe1U747zkdGBhrEwtlmuQouW9xxBOGaZM/oQAQpzjmV39la5S2StcEx
X-Gm-Message-State: AOJu0YyzeYrRWlUg/Zz8QaofJO1lQzTcr8JCEg7J6TvoNND63nvzMBoc
	R9uJx995RgCIClK/I5IfHrHT0ATVCSUNH0H7fnrvhc5LBsRLlDh5P2rbhApV5q4=
X-Google-Smtp-Source: AGHT+IGWd5aALk9iRQYfLQnu0uXb0Y/OpPlLQY90AVj4YNjDUrUlwY/SjzwpqXSSLSWsurvD0nsz1A==
X-Received: by 2002:a17:902:ec8a:b0:1fa:7e0:d69a with SMTP id d9443c01a7336-201d64b1542mr20521085ad.46.1723623280985;
        Wed, 14 Aug 2024 01:14:40 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd147ec4sm24868335ad.85.2024.08.14.01.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:14:40 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 01/10] dt-bindings: riscv: Add pointer masking ISA extensions
Date: Wed, 14 Aug 2024 01:13:28 -0700
Message-ID: <20240814081437.956855-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814081437.956855-1-samuel.holland@sifive.com>
References: <20240814081437.956855-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_011442_017877_5F291489 
X-CRM114-Status: UNSURE (   9.19  )
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

The RISC-V Pointer Masking specification defines three extensions:
Smmpm, Smnpm, and Ssnpm. Document the behavior of these extensions as
following the current draft of the specification, which is frozen at
version 1.0.0-rc2.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Note in the commit message that the ISA extension spec is frozen

Changes in v2:
 - Update pointer masking specification version reference

 .../devicetree/bindings/riscv/extensions.yaml  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a06dbc6b4928..a6d685791221 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,18 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smmpm
+          description: |
+            The standard Smmpm extension for M-mode pointer masking as defined
+            at commit 654a5c4a7725 ("Update PDF and version number.") of
+            riscv-j-extension.
+
+        - const: smnpm
+          description: |
+            The standard Smnpm extension for next-mode pointer masking as defined
+            at commit 654a5c4a7725 ("Update PDF and version number.") of
+            riscv-j-extension.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
@@ -147,6 +159,12 @@ properties:
             and mode-based filtering as ratified at commit 01d1df0 ("Add ability
             to manually trigger workflow. (#2)") of riscv-count-overflow.
 
+        - const: ssnpm
+          description: |
+            The standard Ssnpm extension for next-mode pointer masking as defined
+            at commit 654a5c4a7725 ("Update PDF and version number.") of
+            riscv-j-extension.
+
         - const: sstc
           description: |
             The standard Sstc supervisor-level extension for time compare as
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
