Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7148C5B555
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 17:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2rz3W3NRyqckDdZcsjOoJ14Hf9w06DLDTEsR+XB0S4=; b=iKdtBOAOc5hpn7
	s2U+oGIncDVSafc7c1CZgTpB/5ES8bE05d6mBSRKAwwrJ/U2sPCV+ltK+GmPsCS5G5MIHoGcMY7Lq
	U2CtX8em3mO/UaueK//jYKVR/4rkxnQGU5/ieqoyOT+19WkBO0S/2jpgaBHzny73tW7zUyKAkUU1w
	ELR0LhbV3g+1+esWVkSOtABU2EFiyZoZJK84PLSwsnMs9+QcVqCCaIHg9yGS9twjWPHKXzjIuUwzr
	tJeKDyvPrGW/jgBCsk32Z/RjKWnAD8u0jEHRUkeaCXsgACNnGVfCIMLQKk0KmpeadaNIzXW86CgcH
	48uOIwZdUOZV9oFmY6HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMriw-0000000DsAU-0fAd;
	Wed, 04 Jun 2025 17:16:22 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMriu-0000000Ds8c-0iiM
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 17:16:21 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3114560d74aso106826a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749057379; x=1749662179; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHp8skVfcDwQ99Y8qvuLL+UOu6n4/KmOGLmf3JbJ7iE=;
        b=nJObssNUAE0+ECFqVHOTsMzL0eor066+wnOkrYL24pt71yBfnZUexLVoE2vx0lSvkr
         BqgWJIAn/YT7waVnYPY8eVQ4hOZ5+HjNxybTs3LCAKdBQSb8LnuKiqHD1nU6rWMZleos
         kRYmesPMJu4bfL3q7Dj2n5IfOJ+OzGUFzn0Eu62SW6LwlKf736EgfcNvrAU42muovXuv
         PL3IODOLgi3tKcMlXfX7vhNfSOKgJkyX9Xxk8WSXTZsdGMB191qk0Op2jFJaxA5lxVbi
         7fsICArTLZE0xCO59AYQu+ldBXJx4CvihVevWP1dz/cp5g2ltBjgQCbgdiwm4tzY0J3V
         rvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057379; x=1749662179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHp8skVfcDwQ99Y8qvuLL+UOu6n4/KmOGLmf3JbJ7iE=;
        b=TF079ygc8pA4cO8OqBmck0hGOqfViOnzUl9mvvRA9j0cEWLU4ueiUxCdyuzJBvKrVg
         zh8L/vmlbGG8AFjIZwewJQ/2G+evsBnAzD0RfOuwYalaWkr83sDppmSnDRu4UbD+UqFo
         BDHspJPITdSgIrnUx/5v7mD8wULBptB+I2SdI1G+LjTLMiDpaAn5bZhLfPo7z2524n7H
         IVqfjFwDh6t+U7nvgbQSWnQI4hvAOntuQLyhpFJ5gtZRLbIZ4qORSChxPJUwg2dKoK4g
         SWn50+/ZR0XIk4jy6N0s/m/EcHyOye2t2o4NGTmzXgKHCx1skSfN+1/Y1CX/9cBNTO+g
         d7VQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0pl0Pc66R8BcfdEMorclPtSOSlVOh6y4GctM0tdxqboR+sDF+rIZe3xqJi44XYw4VQaA/U0d9PGhCtA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDBQyciaJIyk6A+QlUZ7SZoj/jdpkj6PArkzTXGVvPPWq2ADWG
	gBlCgIgqFRSjyLmVVT1huMIVC0SGxMuFzZig89wo+b5ZWGA1CvhURgexDvSk8TME9r8=
X-Gm-Gg: ASbGncs1+innn6rPVHIPJgubfAcwhdb+6qPRaNDgjYhPdEvDTvh0+IemKdyOA7EH3Ca
	wyzOEJM9bBETOhPwHtjbJH7kW8WY8PF10PpBqaVdlsDpRaWjyxB7b8iEMdfCtjx1VDbJ2/a5RjO
	bYJAj1SR9ioHHiWiwyGmZdaH8gwEp2eqmSIpboboOCcsZ+n7+OxB3jluzFvO/MMvutzPU+BqVR0
	BNkjw0rBodLV/NE8so2nqSdWBXkBATQB7DGe15fqEPe4WyeWARr084Zg0m3eCK5AMS3Ougn3egy
	+4r6pobjTbZf8XWlpxM7ViUSYlHUaRgit3yLtuFqVh542lW8MMxA1AZdBPepRwTMVabmv2zb
X-Google-Smtp-Source: AGHT+IGkexVwRd4MBugt686K9ooA6BwNW7BY3mlzIvdhU2r4+d354fip8huOwZDJ0pdHlmWrSOoHpw==
X-Received: by 2002:a17:90b:2692:b0:313:279d:665c with SMTP id 98e67ed59e1d1-313279d6ba1mr1336750a91.7.1749057379093;
        Wed, 04 Jun 2025 10:16:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9c9fsm9178972a91.30.2025.06.04.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:16:18 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 04 Jun 2025 10:15:26 -0700
Subject: [PATCH v17 02/27] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20250604-v5_user_cfi_series-v17-2-4565c2cf869f@rivosinc.com>
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
In-Reply-To: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250604_101620_214614_9C66438F 
X-CRM114-Status: UNSURE (   9.63  )
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
