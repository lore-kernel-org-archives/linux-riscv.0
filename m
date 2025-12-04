Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8B6D2A520
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 20:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/OYzUpqMUw08GMJv1SJi3fQC8c1dbYA636Oe5XqlBE=; b=V3ubbxHSz6MWh0
	PmWS9d9xrMHfFk8me5nIK6WxDoqE9JoSkE/rGE7M1AmPSdzbNkVHMQAMzh25m/gQhJU7OnaVPLpeg
	9beHE6pWwL7owPAfGJPHc5ovQJbHPu8k/9gzIGjLiOQfLTbJ8HrW8t7unL3uf0RWigsUQorK3KWSN
	LaaugVOJOYjK5Npn9xf2+sg26J4fPuQtjb9BWcD5U6U188u5a8rfKElo4yQJLoNFTAMj98dH+gt24
	JNPjhhE1/Vfnn8AdLyKaSt5/rEqU5ETdOi4oZ/7oa031zyksuSLRkuB39tf1uz4o3LxwPYlVNprwS
	gMy1msmRXTYICT3vwEfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFYb-00000008Y8U-3bbV;
	Thu, 04 Dec 2025 20:04:05 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFYZ-00000008Y7K-2Sfh
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 20:04:04 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7b9a98b751eso1140417b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 12:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878643; x=1765483443; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64xLkyzyDt+G7LhAFS7W5T4PZ7pgqwloJjIatj/cxJQ=;
        b=Co0Yq1A1b1GfU/hqbwM12lFNmmSJOrsaUbgosmFflhUzadiNH3NbfGlwuQtJdO/Djl
         v+UJXH+68FpBhJgdXP9YxJXxtwYbW0j8SVM8RLEM2iOf9dC+BEerNlYYlpzSiM7G2l7w
         9uLcSIIy7GNiQ3iutkWR0PI45y3F9pkRigVoNdh1i26eyys7wzgyGjYAB1VsFFFxEQ2k
         i+1IQI2PcZk/vwWw3MhtxE9qqO2Sd8ogxcdsIYmub532oF0AlGZ6cOXSTIujUVvCkZVb
         VqcB620Rt9wvGigw3pjPYWj49qjGunguDLnjconllQ2xLHEl3Z8/ylEvDwl0qH6zJZQR
         e/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878643; x=1765483443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=64xLkyzyDt+G7LhAFS7W5T4PZ7pgqwloJjIatj/cxJQ=;
        b=NR0oq1HiIYXhzDw3Ic3hm9MXuMYXBnvwDwtCqrZ0rx0t0S1XFLoMXH/jijcQeXvdu5
         4ChwpaYK8uH5j3FABMhTmeBcWTbi+mfqiDo1xpA0nDtfS1D8+FqNlecuGWQjGhX1ydYz
         PyxnSXvQx7vQFX/nEIsT/41cVzPb/ob2wsTPKkHsew1nVib/Iozebr8V4zewFHtAx3rs
         rty3LI1s+cYdX0toj4HrfMMbxCZ4+0C4uLjTX8hLsJYGMCd5OgPf/DJP1VK650tQqIC1
         rt2LyrE646rsN65RF88VAhNBFiE7mUASIeHdJpF9b057gHEjnv8128TZvzl+xE2e6KlZ
         UfrA==
X-Forwarded-Encrypted: i=1; AJvYcCWqkRGte+po8/tgdT6xoC2WoA50M/HZJWjHnxApQil3OyZqoLylOTkmJ2aJKpt3nMUdVN7HMBLEtMs82g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBvOVfKToqdxbmZ1oIqvaYFfF2JkVsmXaNi/YEzyL0Er5PMmU2
	sT1noxVL7PTTJc6wNneIOPSXd8B1ZNTvpu6N129slSaKFzzPzDpaXLWZLAzNrb5q+VQ=
X-Gm-Gg: ASbGnctYmAwt/S55QOAU1qEBSpyjqdlm/Rnsen3qvjwKnegY36261zq6JuoJklDh+Aa
	nzZ64AZDWU2WnXnA062Oos/XSqHSemVq20oMKCLqGTCd66fHC81VxfNN92/UdFatSWcDDVGXI7S
	iJ2oGSCN5L+q6zD/vJ+gMLI/6jJu4R8OgxCv5lSqd32JtTVYN3uA1wMra9ZcqjTCadim6mXXZKA
	oA+5vUR2E33yL/WfvhYCZ7UzamTlSD6eoWz5A4hxtMF35Tw/JLQJZfbPi8Z7WdJhKotY0dLEtxB
	zi1cSSNqwdWMisDxIvpFivNcHpGlasDEeh2SMLLEvseEkbcUjKhE0MaZhx6E5UMkr/K7FIa6QVI
	5UsPHGOea3bsSsqjXd48i1vjlohnAL67tHV/RpFeW7fZQnscbBf8YH5+XLC5zTlXtokp4DJalRH
	6vBS9hScOgBcGqeW9WfnMpHSbMtK9nmNU=
X-Google-Smtp-Source: AGHT+IEOhZnijBnNdOdOsVk4yoGiswhZ4mB9XbdEcOyRSW2OHSL2c0QLsA8JlQSctaVi4Fp5PYAbjg==
X-Received: by 2002:a05:7022:3c13:b0:11b:9e5e:1a66 with SMTP id a92af1059eb24-11df6457d6dmr1963954c88.14.1764878642636;
        Thu, 04 Dec 2025 12:04:02 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:04:02 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:03:51 -0800
Subject: [PATCH v24 02/28] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20251204-v5_user_cfi_series-v24-2-ada7a3ba14dc@rivosinc.com>
References: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
In-Reply-To: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
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
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878635; l=1566;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=vDVmmVGnkAFlfQ8sB5tmt1wB1lda3XmsatvedsLasmU=;
 b=xNldZE7ggkUY4ump/fCL/1LsAC7onHMyBUwvRbY47zCFtNRuwaSA06AgdswhMqiJ56F1mgWuR
 UeXTJ0gNxD5B010/yIJ2qjv+tHksoFDtsdJiXEDcLJhe2dg4MXf1BtQ
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_120403_633264_433365CC 
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

Make an entry for cfi extensions in extensions.yaml.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 543ac94718e8..3222326e32eb 100644
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
