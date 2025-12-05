Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DABBD339B8
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 18:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/OYzUpqMUw08GMJv1SJi3fQC8c1dbYA636Oe5XqlBE=; b=O7y4XOx0ns91ve
	zHt8DhOkIovI9YpQdNghANa1xNPgaqzwmNiwkdMiq3wFb/cNAxvtkbQRKJEmMPJjKsPXs+lw7+p2G
	WfICHRoX4/ZYRUc0rQfEJiQwY2rq1ZOkPvOQQkHBR8648sEWDOLzO3ANPldLBLYb4sNDN3lt6ChOB
	ZoJPcoKbjk+J10cMuVjD7+iAgkdAm7lNOqzmtOqd2yRPx9seFBGhyxVeOm7Dw5ijyorioUi5oAq3Z
	foTrvwn8lXCFKk6NUsK52B99RFmQcx8lk/MrGp67rak/v6lZp0vRy0q3+Cpu3QPVkfBzUmaqLT4P9
	awM8gQOgTiKjy6G44Rmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRafq-00000009p4U-2sNL;
	Fri, 05 Dec 2025 18:36:58 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRafn-00000009p34-2WPi
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 18:36:57 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-29558061c68so29710055ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 10:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764959815; x=1765564615; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64xLkyzyDt+G7LhAFS7W5T4PZ7pgqwloJjIatj/cxJQ=;
        b=PJ6do/FZl9lvjU0EcjtxQEtYZZyno1XO0d/APcvR6/Uy3o3BX7Ty4Td0vRqmdbRhvL
         9zAbS2iaWucua3wZiXFrXZUTf9b6oINMeSXZnngnDuDKuSXMt3ryyU5rKQcYJsa9HhEl
         EDbZbLt9l1C8AdRdPvTSZCutqgZ5KL9lfTL8F9i1M3V2H9HIyRU17Ms3TJTQfO8L58XI
         p+ugknrW/tlYEzkpFtMbcKC/4FMkg9fmRjpEXTo2iheMUsD/LKMM5Wgv5rduV3spGk2K
         XjN0/bYjUCzqJkArBWW/zwgkkbugnwAGccd0oXpNMEE9nKtbYatgkYCB6kLzJBuSEXKa
         4WRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959815; x=1765564615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=64xLkyzyDt+G7LhAFS7W5T4PZ7pgqwloJjIatj/cxJQ=;
        b=s8UiCh6MrOs8C10g3elyVbimFWNlx7zEidLt2xdURlVoDYiduNMFd0NNB7ax2/zb/0
         61u2X8WHhtl9Il61PdqaN0NgcTriig8Q+bopMQBqdj9xvSv1Dor5clqj2LaRC6Frcz+q
         w1AHM3OlkLoLC7tpZVjopuq8H2rJF091esBVuspxfVVel9dnkWqRw+l3IPpeBrUcY3Z7
         KjJP5+bjfQTpno4l+s0Ui7jvOYkjqG3PryJT8cNsR28SXA3FLVtR9HpNXshTpMOIi1O+
         fqHYfF+SJbTlUJG6aTwVp2ZN/2o+6b/1aRzU0i/tdkFKO/r+AGkw8x7nLc3X6H+M9SCN
         5G4A==
X-Forwarded-Encrypted: i=1; AJvYcCUhKsrw24+YOqvsC9OLpythR3zsHOD/lmSTvPVcD8kSklFTmdK8lFY7DoahOscXBVt/etC5N+8PYiIA8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFRotkDfuOh5rCYqlf9mdDgSTJwTbX9KULK8D6RKEn0BNrzBPu
	IvgeFsW/uj+d+xJ7AH/cPUNjEuNRmobhf18wJCCzXZNDGyGfWyzo2bSfAwAEN6ufxmc=
X-Gm-Gg: ASbGncv+TBKN4TDy5Jdl6Vxc2IDDdLISVnmsuEeN6qbouRL+MegeTWtsEuWLsekftk4
	J8MrL7DgnqG6N2oG/lDicyQAf9PLChDB3ZWoaJKI/ScstbGb2n9UaA3ydyHhPfpgyrS67XPYcy+
	+AzQmoMMKzOKgLT3dwAF/4KtTSJAptlFF5y919YbYyuXzaBm2IJ6wZxavplsvEJutc8tauIytLw
	FkCqHA754Fqfzdoxt7ayL99gTdNB4BGwvH/Sb0QSvppZPUzhAOYdpIKoRhj9EH54CQIhJa+iPnC
	CFrOUwRGAxm+zzPUUfBIWfmOmbWF4rAC3iUPv+DrwA9lOLHuZmXkuStL444ord2n5913+QpPm93
	7Wc1kldCDeN1/o57XgrEv1M3HXQBXI/hfKP+ooR+McmtFyL1699RPHkgzJYscmW+4Ye1kwnHG1d
	iHSY/wkWtvkiORLz6i8uts
X-Google-Smtp-Source: AGHT+IGU2sLP85/lJ1hQVHbc76Oe28ZFP7QFL3n7WXxEEBaxhaqoxKiUM68PA0g4YWByoTPd/kSlLw==
X-Received: by 2002:a05:7300:cc8f:b0:2a4:3593:9699 with SMTP id 5a478bee46e88-2abc71f7ee3mr78452eec.22.1764959814725;
        Fri, 05 Dec 2025 10:36:54 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm23933342eec.1.2025.12.05.10.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:36:54 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 05 Dec 2025 10:36:48 -0800
Subject: [PATCH v25 02/28] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20251205-v5_user_cfi_series-v25-2-8a3570c3e145@rivosinc.com>
References: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
In-Reply-To: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764959808; l=1566;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=vDVmmVGnkAFlfQ8sB5tmt1wB1lda3XmsatvedsLasmU=;
 b=FTcBrsY29zH4CGwlbVTm1o8uVBkzLWVuJZRVdzWSvyaLQ+YCd1ACncy30R/KVfqxKm8RGhxIK
 fyUsZ0gvoQPAEuPbkBJtPN+hiBZ+Driu1BfYy5W9om0F5sqYa2IMOjY
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_103655_636740_D346642A 
X-CRM114-Status: UNSURE (   8.83  )
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
