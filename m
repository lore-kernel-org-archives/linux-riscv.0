Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8273DC369DC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 00:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2rz3W3NRyqckDdZcsjOoJ14Hf9w06DLDTEsR+XB0S4=; b=dRLmIYvGQ1ImDP
	DigbCOBnI8xXtfXlSUOr3hteUvZy0BMYcmlNaaRuHJNYddhEkrjEDIzFOLoV77xq8ztuMCrus0LqB
	nR28JeLR6EilLmM+r7IfBC+N/Q1/HeGPDnXL7Ugl4QcHpVS2O2mDIbqoyLosgzSZCbqT5YFdS9Lbk
	yk9Utjv7CSUeQFuh9j/5I8XrxLxLY2NWwwIgMq7UjwalmS9iQ0ZjLc75wYMS2+/yb6s7hQJs/e5KE
	PpW4HtTg+VSmjKcoyvo7FQOk9lBoGwCmLzGyT30fwEVZe00tfxeLI/FopC9t6IzLrgtHf+6mrdvyk
	wc4tEeomZtVcVxPMpbMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v7r-0000000BFye-3cka;
	Wed, 30 Apr 2025 00:16:35 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v7p-0000000BFx2-1FGE
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:16:34 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-73bb647eb23so5564555b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972192; x=1746576992; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHp8skVfcDwQ99Y8qvuLL+UOu6n4/KmOGLmf3JbJ7iE=;
        b=y07fuCTeGQnxMTup1suErJOiaRizfeq3o80Q0djBH46U28U8InHZKkb0CScvld1Rnz
         hQH3Xf98xhkjv05Rs6k5fZljF1LL/+CUCuWmebZxddD/rvdU34ijAhdesi4bUQ2R8xAW
         pgfR/WhKLBTt/o0gvj56Lfrge6NuwY6lrL9phICD97mwS9sgqub9G+Nj9XrdBPTtHju1
         RiRVeWvJWfou/3+oVNF175X8AunGzSUt5oUGDuQ656u978AmnvmUZKH3sZNJgAmYVCVb
         cpILU+yZm2dVZLG8Wh19Jx6nYgZBd79oKFWh48+oUzbR0ErsUNT80faX7f5sifLD670e
         13mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972192; x=1746576992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHp8skVfcDwQ99Y8qvuLL+UOu6n4/KmOGLmf3JbJ7iE=;
        b=o8eH1zk0WEDu2DPe0GUQc/K+Of7XOPtw3ygNX5IQ7RypGLqaoiumxZq4Be66M5pPzU
         m9/49Gvq2SjOK0qdjmU3aS5z5h9I69em6NAWyFOJFKfjO9nKeXKj0WDfcoMYDuIZUGnP
         m+nuMaKKXZ40Ekc9E6yvQTXclgugHuLIgrMcu+IUQl0cbzAYOQMrHG4Qb8nlCLUiQo7i
         Z2YOlQQltEblIHPWsgISLyuIWxDsGwCyXBF+/rImONLRDYWhWVHM4QQLfl6bb4HDuDkR
         YRIfZTSH0EFkxF+YgnlJyFvOyAP5Rk0zxxcrNRUHEW5hcazCk0PVapcFeA/6PmxFrvec
         zeHA==
X-Forwarded-Encrypted: i=1; AJvYcCUN4ZHRSINZXeN50bA6KFrUx4Kw/rV5zy0YsOZXNSasWcNWKSXHG7qaJBVHcYOU+jumad5q5AOcL5tFKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMPao9NFejJpQyOxYLwSpFCfeqi/LR7nlBLSRomcCPYkanErVe
	ZsFEWGKpPSOk/Mqa0lqBa3gZox1JzrDlWqQXvbNvDA9gzX94NxFwlZOqrfUGKSA=
X-Gm-Gg: ASbGncuMf/YF8BrxR9Mj97/wxzUWY1n0KqGnk+TZvngLiAT979jnLqI4wfeGPysITDO
	NWDM8noqkKvBnp7nLMtrn+Jb1gSTWJwIZqhSI9G3FQpyr8wwJVxipTwQdrd+gNUvGFT38jW3Rra
	zbd+ApaDdqpruMbfVPlbcy2TxPLZEtP7HXOvuAf6cLKrMygCkFLQ7eeTUmzAmtM1a2XEVLqeHaf
	zWNNAv4F8HZJ03GgzYH2BzY5eaICeAd3ZdNhuYnnRz0s37gHwYJZ0Tm2ohvJCjR2OBWegia26LO
	bfraRQc6OF78a0zmqICKPNo/48tlAjnbK9zN3ieZ7zk6wYQ5p4g=
X-Google-Smtp-Source: AGHT+IFZqq9MjhSqj6zWUKle5rqAOmKZksHCBhGRQygZlDXBwlT0hJq0zTG/U4jkXRf2orxlgxORVA==
X-Received: by 2002:a17:90b:3d84:b0:309:f5c6:4c5c with SMTP id 98e67ed59e1d1-30a34450c14mr888187a91.25.1745972192207;
        Tue, 29 Apr 2025 17:16:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:16:31 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:19 -0700
Subject: [PATCH v14 02/27] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20250429-v5_user_cfi_series-v14-2-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_171633_352867_E5AEC279 
X-CRM114-Status: UNSURE (   9.93  )
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
index bcab59e0cc2e..c9e68bdbf099 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -444,6 +444,20 @@ properties:
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
