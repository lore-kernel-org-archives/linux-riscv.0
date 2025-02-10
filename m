Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A90C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 20:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jU0T5QkEr3232RN3yDhzbxX5XeNOIdmcHfVs2jzrTyQ=; b=U8YH5ukbUnaXjg
	UiG6xR1OuCr8XDquZsKgVL6TvzHUjxw1NtMYitlNNiblg1+xYelqJ7reEF91ymyfOgZumSy7ExE+a
	aWGm2IWIm4YS0mFW5NsShSV7JJe5P13E4cnShmk15e5fEfw57akDm+FN2yK4kCp0bluKMYLPRq8Le
	UsXbnTp/KT1U4DjjxrbaGjg7GSepelumNnRb04FN1t174LPDwHsbYYnS9OcCMXgxqCoZ7BQh46YUA
	5dfp17+vXI0CxK4eO92GhsgkMdCuUCJ6oaW+z8oNhTx9s3ao1eM97iTnbHNt6/dq6YauDX8f4Fc40
	MkQmV37TjICL4ExW5GUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thaMl-00000001JaM-08ZX;
	Mon, 10 Feb 2025 20:26:51 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaMh-00000001JWt-2UYD
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:26:49 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21f0444b478so68618965ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219207; x=1739824007; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHEXIimjUTXAyC0fOzh8XAkym19Q72QcmDI6hc+cq4k=;
        b=rXRESAb7rd8xxsqthYAtw774SPUzWyy1TU+e5+aQ+fLYULUUaDIQtR5EIxWNM0EjfQ
         6ldRFxdyd6ltOf99WHRHXAJb5yr01gpU2CsNZigksxahBiOLWW2FQHCICYYJSd8zy8fd
         wMcORbaFyYQTnxSDUWaBUKPPpSOzttM4mN8skPKgkcs+ghJaf+/At/1YPv4U4DcR+Dkv
         3Gg1gcjffYH+mS516KAUZ67CYZv0yRYYSQ6H0FKfBakO0af1bS3uuI9HNdllDjtPknlL
         1PYwswV4yG71BGDpoFrKNdafTODcHO+GVSztCf7+Y6KksqRI7apY8o0PsOiDQAsd5shP
         wHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219207; x=1739824007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHEXIimjUTXAyC0fOzh8XAkym19Q72QcmDI6hc+cq4k=;
        b=ApdWqk5R67xfwMCrMLyRnGzYN+y8pAaFayTw5R4ehfFBSgIQOOBa42o6i29iOvKdc7
         +zvEWAdtrVrXYjikk9YmIhwg0FFNZH2cZRzM1rzZg0YD3QoaclxpU8WQn0K3hLeqVo9K
         HaLIjZqg80nf5fxAuy4UzzmDAc47TV/ZTnZXvptaxkJszjadGdtv5k4yxl5Q1WTkIZEb
         Dq3pPwkpCBuT/xYvANZH3FHsE3OE81q7Hhny9+UbgUUUJnGzxrWJvT3NsRI941fAytd2
         e/vj8C2dY7fXlLSnw5ptLqMIoaeuoZuTi1L4gfAdfraWQe3fLfPEBJ+V8gu+3dPgX1RC
         qXyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw2N/YIop8+zQRpBezrO3HVVhyR4HNad4pYiVVyeqVn6mzkXnfLozUp6b1GTUcsg5ysBj25CmYwiV3Ng==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8aTbJaKIJUK0XOjfEccts7q/IbY12Js9XgHigoH6o299X41Pr
	WEddNFUN+LuwOUMSGU3cJ1qVsnFTFV1Faxv+fEG9J3FnrO3ChLGcMwXj0Ogn1gg=
X-Gm-Gg: ASbGncsEqrfEQ+hnGciRvaTg10iupiUBqGgY8Treo5lJ/lQR85G9b//jlfuaAZRbTIk
	2X6y4IR2/G9796U4YALxb+b8l4MKcxS9g++E2oHZ0peO/OXG0huXqMlubKABS6tLmRbsvCZY+Uz
	Iu+vTCJtpRsUD87wHeWo6pFnJfqEWgAsRsCAOwz/TaPSlAaCiD+nVJcBDfeRyBo2HQqglyS6fcH
	/cx04i2yRpAfpi/64ryr4ksumYbAk3Rp7gzqgQNXHQUt53dehbSwF1KQ2UYlhBqeuPuGAnQkFGE
	DASNa3MluqQu+y6U1hSe9V2TMA==
X-Google-Smtp-Source: AGHT+IGXqRpNguUrMSnJHDFrz3qQhRvvMy95jaGz8XHpdEECN7AcOh1dWxqC1mHx3x1SCoyBHua2rw==
X-Received: by 2002:a17:902:db0b:b0:21f:169d:9f39 with SMTP id d9443c01a7336-21f4e779cc3mr280440675ad.46.1739219206908;
        Mon, 10 Feb 2025 12:26:46 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:26:46 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:35 -0800
Subject: [PATCH v10 02/27] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20250210-v5_user_cfi_series-v10-2-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_122647_646027_B69CC5D7 
X-CRM114-Status: UNSURE (   9.58  )
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

Make an entry for cfi extensions in extensions.yaml.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a63b994e0763..9b9024dbc8d2 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -426,6 +426,20 @@ properties:
             The standard Zicboz extension for cache-block zeroing as ratified
             in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+        - const: zicfilp
+          description: |
+            The standard Zicfilp extension for enforcing forward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
+        - const: zicfiss
+          description: |
+            The standard Zicfiss extension for enforcing backward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
         - const: zicntr
           description:
             The standard Zicntr extension for base counters and timers, as

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
