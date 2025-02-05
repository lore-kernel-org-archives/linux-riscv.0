Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF174C02196
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 01:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jU0T5QkEr3232RN3yDhzbxX5XeNOIdmcHfVs2jzrTyQ=; b=GSKHXxoO7PdhNc
	Ld8Hi6ChlczaSKyGbFVkF9d3ZpM5XIUDubZgVdV11mWFSXtSOWHAIPBp93R8WWxPgYIclR4u52TyM
	5EX7vzd1smhecfCLlpJiTKCvqL0e7o5odD/W26OnGYjrj+xG3SgS4jFLI+1HCDHC9U0sCmzWJjeL7
	53ET4xnq3Ix35Ey6BFNieMY5YTQM6fF7HLoCYbZ2zo3yN5TxdaQgfON1VkZdISCWqNmFskSHwiaVp
	ucbiFRsNT7KtEzsk/lSXWNG2Eo8Ck8jWCQc9r8IZNRBRyvFbXci5LzIwECEF164W3UNY1ZNg811ex
	6BD6TakVXUcmbYE/CAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU77-0000000219y-0MX4;
	Wed, 05 Feb 2025 01:22:01 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU74-0000000217s-2Rzd
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:21:59 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21f0bc811dbso5059375ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718518; x=1739323318; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHEXIimjUTXAyC0fOzh8XAkym19Q72QcmDI6hc+cq4k=;
        b=KrmeEV05JiMwuDTLNjKE/zZ40CkxpRfQd9oAstPnTU6CxRMzbNp97Pr5Yv84GNXuCo
         Tx10bHr8rLf8yCpp61T51gpgP81pPff3SlDEXZA+zWXhR1kD1lVocht8BW3Nz5Rvdck7
         1mjfdp18GLSj3pZuvqRV9k+18JQBoGx/EXNJsOyZpmbqo6REXC0UYcbX68pxfyIdvpmW
         o9nmgeNMt6DPbYE+dvGPH5+Lr1kBH/Ww1Z2YRicPTU0eS7OcKCnuZyDITPz/+9BGMgL4
         dfANdjm/VQpOfFSyrYxFS7oJvj+w/KV1ZJ73BrqXDBtQo+ncqaYrh1AleJpzWJbXxjI8
         Aypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718518; x=1739323318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHEXIimjUTXAyC0fOzh8XAkym19Q72QcmDI6hc+cq4k=;
        b=wkAALu/cnBKu5lNyQBNUz9gCHQLVb8B0b9tKNyCMa96gjPnXflcveicNGajpvwG2+7
         VVhhixSp5QLF1GIm41GREMPd+JsAoW2xzew+kxWOP6nRJxZvC0JWIqxn0wf3LokZ5UXb
         4vlKUroNeOALIV34MluN5P37L+kHtHKckgsLoKLjs3gEIUmEdD4GSlRJIzTyHHWN/1MJ
         oVMAsiWk4E1LMXoRwbS8SeSJVzqsVwja3naPhBEawSmN1ffGhAnKbYOk5Dwbec7i9TmH
         j6YZvmvnAiy9tU1+uPgjmK+YzjYbdtZoKikp5ipPInWEbX7P+Y7MEpml4UvF9w0SW9hz
         6USQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXhCuGAZqL2Na60ymOEMlkbGVZXerGeYo6YQEWmnJYYrrQy9X6Rk3jdqlFq+q3Bhl/eGKVMYXJtode/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUHiHoTWtgFnpSaqBwh6M7+RGMLPNT3jUGsIgfnrcqI44mxo4A
	Eud7BDWHaXS0CIf/tGdQUiKqK4iqb4o74XFfeCfYnJntLqjO/TOSiONWMa7Kz+C6ZXM1gLEHzq8
	t
X-Gm-Gg: ASbGncsbTlSzYWUyeb7y0yBce3p5hK0EvF2n67pVzVN4eRrhuontqwmcg8i+qZZDVUC
	eoI2J2KqJtTFdOhAuSuoFWktGRnLULw79+4bot17+re9cafLe7p7QCwihlhiN1Z+H46qFpq4qVN
	oyCJQjm3YoFyemz7k9/z1XDDzcQS4wYC2/2gkIROUPUWgGFaTPY/JGST2w+AvWXLIwCzvnjPh+T
	EbZSI396wFrcN/Sgz8TPV/ujl8DQOHUpxYY3K3Ml0hsmdF11eR8NI+HwX+q+dybs/VHgP04VHlX
	8pVGIQ++LBDKNdvAURLqVHo85Q==
X-Google-Smtp-Source: AGHT+IHzHonQ1oXGudf3ZfMVrMZV3mKwGoRuXs9FutPohSBaJGIm20BPBEq9+EHRoF58EkXIbMe1gA==
X-Received: by 2002:aa7:888c:0:b0:726:a820:921d with SMTP id d2e1a72fcca58-7303523eaaamr1533935b3a.10.1738718517175;
        Tue, 04 Feb 2025 17:21:57 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:21:56 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:21:49 -0800
Subject: [PATCH v9 02/26] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-2-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250204_172158_627859_831D34CB 
X-CRM114-Status: UNSURE (   9.54  )
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
