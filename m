Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E16EC3ABAC
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 23:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2rz3W3NRyqckDdZcsjOoJ14Hf9w06DLDTEsR+XB0S4=; b=C4X7tvlZ+9SGCK
	yuK1TmuBHLu6Yj0l//gV5cjUagKXYjMYJVkBrI6AwK+k7ZPDu83jrHqwgN++BgiuVwnCig9tmUC/r
	qt5AjHGRE27UNXMrD+o6qZS5ABHew6O4XTTAR0dW9lJ662UFIr18xiUf9jfqD2D5uTFPZD50HCoff
	VCQnINOEkO2e2o7ClzIrjTjdNvSRQCjQYZfmbGsCPBI9dwWyM7vANSfiD9I392J0/tK5kAzk4irc9
	f0kD4I5vEgK+N4gepFstm4kDGllVfcLJU9sMbXeT+r3ySWgmp2oCaLb5JdGpkhlwM3cmFgJLGCoyg
	Al3v1ALxTba8xeQNkK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzqK-00000003EHy-0QQo;
	Fri, 02 May 2025 23:30:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzqB-00000003EBh-3SDw
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 23:30:54 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22c33ac23edso31060575ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 16:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746228647; x=1746833447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHp8skVfcDwQ99Y8qvuLL+UOu6n4/KmOGLmf3JbJ7iE=;
        b=GnlYtwKbQxH9sJKGbMDNo3rLCqt9zBVjs2hWdDnE0702odoXX1yE8r1CkmVFPvIH8q
         SLwqaJsYWl8GL25LsSFuqPRchk22k5Uo3mka4wlBXqmICcFQTYP7NABNORAZODxc/uCC
         5gcj+xkdUZA7RIY9ip2XnsEl3QOGG5DHylnqV/WrwAl1wSKQy7/7filPxkVrimmmWEYC
         50gk13n6hZVg9+GmdqabePdOVq5OBua2w9Bjek+CMfMvSEAJwFObCbv6+E35778AcKSV
         fDPSZ4tKPd+gX7fTSq7LUnWEftAl4oPaOXgjOJ56+Wk8ZJMwHudU70IHhzTZEZOBiyvt
         rZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746228647; x=1746833447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHp8skVfcDwQ99Y8qvuLL+UOu6n4/KmOGLmf3JbJ7iE=;
        b=GnZ+0roKf6Hks6VPQOXqykdCp5sji3klC/B3HbLNWcKX1vpoaQSQLrl9nhwxdoIH+P
         vlJ7JdgVaJVO8cK/bLrfDMrThkdOHqCkmVqo8BJ5zRMSpoHcBnsXhEcTWQlSTibC1kSo
         PLnpkgaWidY/QnjWTCH53w0v/eE5Ag/cv3s3d5gXmlAYGJQ/d7Fnw9w6S8hs9r1JpIvC
         yZfVluwa/BeJWaampQuYof0F96iX+5pt+6vVGSkJjtKHaKtDAJICyOX9yyIe1ezpMXzq
         5+c6TB9txdl7qzM/in432M6PQhIHeTr8y9rBUZnPjePOtmmG811Ro62qWu0OSDR1mO8g
         KzLA==
X-Forwarded-Encrypted: i=1; AJvYcCUMtlL+P55MM8wOPVulmcyoibCaGyOoZzJnPdzxoGfBCLGma8hLq+EOZU3FVTWS4gW7bynH9LZkPe/k2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmwUcdEKhQGLYqllnvc0kJsAVmASR6OATt6CZ/8ZYqnHlk5jet
	f/7FCijIFGNxHGOImcuEMBfytU1vVbpUm1E3sK+EnteKksB/DUMrJSGjX9D9uFg=
X-Gm-Gg: ASbGnctPmGH9E0wpvNefGfsudi3t6HVb0780fDAnTnqx6yGDmlkSIPKeAeVDVWBbI9E
	aAi+cTZPH//Pa1ziCVdomAqe+eAiygG4u+6998h2s2GZdFa6Hzh7Rmpv9hUR4VSAtip98XOoJT7
	GykFQUengxxSJFNUTsMkWo9Rjjcmg9lsQef5TKcaCnNv/9RsaIbE+C7cQUHWXCvuK45CIjggSz/
	RUAR7QNuzUygCNyxDJHDoB8ppEGJpNLCp8KRQ9ekOBol5L4Uw645Wb/9r6PM3E0UBQu8Ud5BtA+
	bLJa8W/huGctOpNCaGXEg2rVvdlqZt1LDaRgWDZNsDauDh4vHCUX7J/Foqg5Hg==
X-Google-Smtp-Source: AGHT+IE7dZgo/vpzWfqm3CX3dsTr88XWeuxnKV7R1SeEHd0BNwvl70GJFY+aLiGFC3AULLyuCpB9mw==
X-Received: by 2002:a17:902:e88c:b0:224:3c6:7865 with SMTP id d9443c01a7336-22e1030c76amr65218425ad.3.1746228646876;
        Fri, 02 May 2025 16:30:46 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:30:46 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:33 -0700
Subject: [PATCH v15 02/27] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20250502-v5_user_cfi_series-v15-2-914966471885@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250502_163047_860394_B255FEA8 
X-CRM114-Status: UNSURE (   9.59  )
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
