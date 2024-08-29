Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E272FC7115A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 01:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MptCN6wWqJGu6BrkVR6eRr1uuWvtnSlHGl5aCLzbUQw=; b=0+xlXn/aD9xjx0
	9paQdEGZN7iKXyzmuUYg8IDy7Iw833PXZwFXCGaa3mLP6O1Es1Isk4+dzwMaEc7xSL1/3UcIue1jy
	jsLTg2RQdoOJy618pKhOcGxOn7dfpKY4WSSXqUwmqX7uXsV1qYEVmq3QCosrG1hanuTyZs9X9/s7V
	iMwIrQd2dJHa1q0oFkfrmG2UlQBz4Ltx7aWtVKImJSk1AZicIxlD9JnlxjXFYox5fneBhXe8REgrT
	lf99Z47IKa2cNmuYVvQUJtQjAaFUvLwg92NzSTyKiiVW4C9TWuEDBXXkcxlUc7cL95afcuwK0Jb41
	VqzCD60RMklnhbQYH//Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTY1-000000003cl-27OO;
	Thu, 29 Aug 2024 01:02:01 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTXw-000000003au-3wT3
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 01:01:58 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-714114be925so100263b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 18:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724893315; x=1725498115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHFcN3ChX0djp1RepjgsjW/fBWZ8xhYPoH7rbGZfY6g=;
        b=lD5dR5Zu3Kyz7qyFIIEnnM7KSu1Q+lj6MaHl3FYi2oMJekY1HKnXcFpn1WuKNI6m3J
         5LUILPRVskB34O0pshIMLaOMxwFKr5ZKR/R/sX42r6vJPjxKZ1UZ8tXeXG7uf7h1KNkV
         3OChtxBTa9peSSeeYN6cMS9q7T8mbIeHu6uRVmhH7zpugG/8u12pdrXPWf96trTGZ0IW
         er8JvIoxl5QTeN1KF3F7FqQB6Pq/7w97lZ6ogqKtqETz0DoLZ+P20+OBt4DWs6jj8Vn9
         aPhFeRYM5zz9K6l9Vn1LZ/sWy1JPw0ZgnMNFoiP4O4+/lSCUhdSngH7wnJXtsf7qWjS5
         t8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724893315; x=1725498115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHFcN3ChX0djp1RepjgsjW/fBWZ8xhYPoH7rbGZfY6g=;
        b=EdFYqPwgDcj8Cbm4NJcOhhYG5DjkN+s0G93dKq8OlmKz5Ed4vK6mZDES76A6go71Ly
         o2xpTcZcpdep/Xf6uTZMAJmowSOgs39igRnfY2wtaor5n62eIUApEefUgtleamUyZf2o
         5AY2XjN6GPbH31zeuBEC7gV/noNPBImPRU+2KK+eB5sO9keVvv204/t70flPBTJgKa8R
         1de1Qec1mxkNs6fefXySk0GUslo3SNJ460qSg5j0TRWV9tRBdhMUPMZWAXMKYJcWwV01
         ur0WLqrqfSnpeFXvvV5ROlj7dDcb+Ubv0L9fhP4+iYJRJ+chT77cQ+UI7Jaju/zXyM64
         YxnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjP701QI6yp8XhGTgBRl1knpDqQv1TsEHs7gtWWFJlrImREf/jq9f2VNHrIgtJtdcLgxeEBRYlJ+vSbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7GAa+sEMS8zcaiq/1RUaHXVt92sV8lE5kKo9klDpacacWgVHY
	d0ZgY3ZzvvGCbYqZEMB1MZcMbfnR623sZcNQozSfdtr1FsUxlEPBueaqdM3Jv6g=
X-Google-Smtp-Source: AGHT+IF8CbBSlekEoVPXOLT8SjVqvpI1Vr212Z+9HPZCWCL06zOdU0IItmLQYG4ajt+f+ix6KHKJ7w==
X-Received: by 2002:a05:6a20:d8b:b0:1c6:b45a:df51 with SMTP id adf61e73a8af0-1cce1022303mr974109637.30.1724893315562;
        Wed, 28 Aug 2024 18:01:55 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5576a4dsm89670b3a.17.2024.08.28.18.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 18:01:55 -0700 (PDT)
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
Subject: [PATCH v4 01/10] dt-bindings: riscv: Add pointer masking ISA extensions
Date: Wed, 28 Aug 2024 18:01:23 -0700
Message-ID: <20240829010151.2813377-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240829010151.2813377-1-samuel.holland@sifive.com>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_180157_006742_D3085835 
X-CRM114-Status: UNSURE (   9.22  )
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

(no changes since v3)

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
