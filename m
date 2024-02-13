Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE03FC48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 03:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dEhj0s3fY9J42KaDjlaPWEU/ZXnpvuNu4AvgWvKA57E=; b=c86p0mQM9z8o/d
	SwAkHLJPdi2uZx9HYeQULrH6awNgL2Wj4igQi83UwNjjhyTEtFY2gQ3sMKZAnSB+5+/2veKh47yyN
	pSGoXkdDISQuwWd2ohLYeVjzyGlYL/U5wK5jp7gjSnZ2n3u0cKZrhhAnvqEC0fMZ/f0dzbq0iGIYg
	YVxwH47//bV73eAfTbCndAC4fN8/AuipqEbyeedd8QCtab8IJUSrFLHWPPxEWOinlXWH2EQKGUPC2
	1ZjdkGor/uHguh7o+X1FuEk7fgbBtPVqPyfBHhbCIr4AV1di3ydyxIXchrjph4kb5AR4CjwgYFzWG
	/lgBfbr54qukh84JsU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZjcH-00000007rMV-3n5k;
	Tue, 13 Feb 2024 03:37:53 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZjcD-00000007rKF-0q3U
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 03:37:50 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6da6b0eb2d4so2798831b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 19:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707795468; x=1708400268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jim7Yvb6VmY6JIh3NrVmUpVFosXkDK31kcFuWFcbExg=;
        b=cYsGx2fTJZe7d5DtyagBX+WM2SKSvnh6rmNJLnb9x3qZFoP65w+wMtKTL/Q+WdCLxg
         JmQdQirs2iK2N9v5JjG2g4oPlCDqU8raggdh5vaV4Ov+jWzycIL94SdS3aIrGPATFpFl
         chio1kgVWyesMLUe9eMza0GVWWa3ofDBGgy/WAR/kRh74QSrYhuwXUYaLfORJsT9b5iQ
         f8H9Kj7Ffvk7XIfBFjBqBVf7kr4vI9jgw4UCzcoh3OB2ESy/q9xlyQmRhhn4TeksMz6C
         7o01mpbAFHIyJ9BS8okcntmIOh3tevjYVDXTt/4Qft5Cy3Z7iYFeATPvFxoKlSwypvbB
         pyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707795468; x=1708400268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jim7Yvb6VmY6JIh3NrVmUpVFosXkDK31kcFuWFcbExg=;
        b=ASKTOykB4XKkv1VSM1hjvI5f3qd+FI8NA4q9EMJSTmMO+ybatrzjoc/mAVJGDT2aHl
         HZg6c4pcFuZh22/AQ0s5vrV9W2jgWqtrL90SEqQpC3h6yv35mRw3fEB+aBUIzSUkBEr5
         J9TmKARE6z75uNAluDB/RiNVHTxVn7kKJ5+ONWYX/4fK87znmD5/wNMT/eADmC07P5xe
         0KdT3Y7ITo2kCQAOV5aChAczAyQXPr5V+VKYhgdiV3ZWVypN7yZKnqTXS7JkrRj47N1T
         h5xSIjh/bmUaJl5lXx93f6bQ1CcBNuBIujZmj1Lb5Qd0SOHHq7V0q+//vNgOlaKaGLvR
         t+ug==
X-Gm-Message-State: AOJu0YxpMgpXMsZ1MiW4xDhF33eLB4l4m720b6muENDur1G/bxODZFPc
	t36z19TmkFnQxpzcdz1vAlQFb2IZQOMs095cXVSZi8tQlb5eqrdoqQLaqtzFSBA=
X-Google-Smtp-Source: AGHT+IFbg2lMISlaKKUl+aHHxXR8JKhjEYDdVh8gzIjglnj+bxXQjxbQ6rcFpTy0yXOTe8Cd48dVAQ==
X-Received: by 2002:aa7:8685:0:b0:6e0:5317:6772 with SMTP id d5-20020aa78685000000b006e053176772mr6713708pfo.1.1707795468162;
        Mon, 12 Feb 2024 19:37:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtDxXelkbmm+CM8OLoo8WM4giaZcxrKGw5FC1up94u0V6jYFdJloVUPvWRQ0Omxq/n9YRlGpQXAYGpmEIR7+klWd8162GgnV8tbjfr9NG9RNhsxttq1+vCK9foEoC0wKl6LWJ+VJ9OhaR6eZRwNvpqxF3p8xEUSYrb8ksnc2H07sCCYQfJvwH5l0u3YCp2Z9mi1xR2N69GDslZW7YF
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id v11-20020a056a00148b00b006e0334e3dd9sm6188633pfu.76.2024.02.12.19.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 19:37:47 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan O'Rear <sorear@fastmail.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH -fixes v2 2/4] dt-bindings: riscv: Add ratified privileged ISA versions
Date: Mon, 12 Feb 2024 19:37:33 -0800
Message-ID: <20240213033744.4069020-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213033744.4069020-1-samuel.holland@sifive.com>
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_193749_258544_2FA36FDB 
X-CRM114-Status: UNSURE (   9.27  )
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

The baseline for the RISC-V privileged ISA is version 1.10. Using
features from newer versions of the privileged ISA requires the
supported version to be reported by platform firmware, either in the ISA
string (where the binding already accepts version numbers) or in the
riscv,isa-extensions property. So far two newer versions are ratified.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 .../devicetree/bindings/riscv/extensions.yaml | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 63d81dc895e5..7faf22df01af 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -121,6 +121,16 @@ properties:
             version of the privileged ISA specification.
 
         # multi-letter extensions, sorted alphanumerically
+        - const: sm1p11
+          description:
+            The standard Machine ISA v1.11, as ratified in the 20190608
+            version of the privileged ISA specification.
+
+        - const: sm1p12
+          description:
+            The standard Machine ISA v1.12, as ratified in the 20211203
+            version of the privileged ISA specification.
+
         - const: smaia
           description: |
             The standard Smaia supervisor-level extension for the advanced
@@ -134,6 +144,16 @@ properties:
             added by other RISC-V extensions in H/S/VS/U/VU modes and as
             ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
 
+        - const: ss1p11
+          description:
+            The standard Supervisor ISA v1.11, as ratified in the 20190608
+            version of the privileged ISA specification.
+
+        - const: ss1p12
+          description:
+            The standard Supervisor ISA v1.12, as ratified in the 20211203
+            version of the privileged ISA specification.
+
         - const: ssaia
           description: |
             The standard Ssaia supervisor-level extension for the advanced
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
