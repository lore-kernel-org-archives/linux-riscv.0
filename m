Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8DDC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 21:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajJuG6BuxlsqFU+2QTWP5oCDpAWmK0DN+GiTAy8n3/c=; b=XrlU71LNb6J1mv
	B/vz+7HfSYNW7VicHcqGWigNvQAIjifLbaRj8OU/VYyMJSjm5ow+Hpl9p3IuMGsKHjJwCUJVHdt3v
	H37iJ8IwiiLc850qAEbi2FBjtKAubh4OJkARthIksxe8rDRnaoVITN0YeeSRlu5hwnTzigbIdRDig
	5N2+uZyXE4mra/7j65ctLKs6MAhmASMV3egllK8Liu4Fa/0Fu+1H9p1AHem71ItEdDv81cDQmajFR
	aWK2XuSokteDNYqzZBQhj9bjatuq1Vs4nqjz7tXEFu9VoL3evFfxsCS5PhnwApQpJhZFObCHe+5Ls
	9L7Sg3PmDthV5LlgY4Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0T8n-0000000E3d4-0Fb3;
	Fri, 26 Apr 2024 21:29:57 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0T8X-0000000E3Nf-35z3
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 21:29:45 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e2c725e234so29787295ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 14:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714166967; x=1714771767; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=lkSKn3a2kzaG0ORGJ0p7s+b6mIsykfO3Ve4orJ9TBxFPfquRC7+7l3rx5vtyoxhkYD
         4rv66Ee5RJFAwqrulbAFL4xVQLRi0B3sPUWB5c9f+ncOs+PrqcCDa3yOlokq9p1K+pjk
         3KEfpftfm/0FRqDPMogfDf3jc5KMzKV8IppXkPYRVj5z0Glfj7PbUfdBqIxxUmT9HeW8
         xPLGr7Jbl+LcFiMFvLnlMR0HwwuQA9cAo2YqfBt93NUhWPpyZ4OOrsaUmpSwBkiPTlM6
         Q8koNCxgsORyV6Hdl1c+pqwVEYM3obdo8YsyPjb+uTDUCnrQOYrbSX7rk6GAk5/iVc0a
         D0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714166967; x=1714771767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=KapFeBSehxQUKZ+tgGSl1vlid/8YWhoyLX3RtPjsVMRKlorHSBJJrPP3E83j0+VFNP
         3Cm6BEeex5f8RjXUIlWMb1Bqpm8uzzcUPtQow2vRH+Eq20JYr5C1zRpWpbRWZwJiR8pe
         4NAaG45QfbTuRkGEDT6JhWF/JvEQ+CcGrCC4I3cHHk1F8/IrEb05FGmC7qfkFPOKNwI6
         W8zCgoW9e8Fv6ctsILQOp4FLI76M5l9lIPPV3ibkpyagU6+ifF9/f9lLTRKQ9mJArfGi
         30X/C8C6PeLpeLT+I6mBjr0MWrT9419NPVnFaJJHU2OVxtO1WMXB7Oi4eqZoGRnn/qGx
         CL6Q==
X-Gm-Message-State: AOJu0Yyc2up/wuyuKX8L64fQYsq7VZI7FSpVVSQWo9rWoit+4D71nzc8
	N7HsoKdIALpUhLzdCDmpIkD/e8p73vqzRhw4iVlPtxste4E0duH0MUHBF5ruw8Q=
X-Google-Smtp-Source: AGHT+IGlFC+sWiATjVjZyM4a9iGh03bCS1scNN9odduG8zCHHGW5Sw4IJWA1IOO67MT5kUm71sQ0lg==
X-Received: by 2002:a17:903:32ca:b0:1e4:320b:4311 with SMTP id i10-20020a17090332ca00b001e4320b4311mr1056710plr.34.1714166966802;
        Fri, 26 Apr 2024 14:29:26 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902650300b001ea2838fa5dsm7226720plk.76.2024.04.26.14.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:29:26 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:29:15 -0700
Subject: [PATCH v4 01/16] dt-bindings: riscv: Add xtheadvector ISA
 extension description
MIME-Version: 1.0
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-1-b692f3c516ec@rivosinc.com>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714166962; l=1767;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
 b=jaORPILErFSO7xhvXfnnGlYnBmdAg6gEwE/qRdqy/WriwYfivrW0a/1HQ1UTuoOhAsFWym1gt
 hQyMCiyz9YsCarHlzfwDbmsyF9vDjGzGdZM+K2GgLhFFCqM2TyXd6RI
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_142941_838366_707BE84B 
X-CRM114-Status: UNSURE (   7.62  )
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

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..99d2a9e8c52d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -477,6 +477,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -484,5 +488,11 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
 additionalProperties: true
 ...

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
