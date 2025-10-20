Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AABCCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 20:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtfSEjPnoQjqMgzEPS7x6B0eIdu369LWiWb7nfJJrl4=; b=huj/YLMBxe5Vdk
	WSdzRswSkM3Lgy7Xz54lpuNcDfEslvl3cAo16UyK/kyIbOK6CQJtVh6F4Nhru7NV9Iufw0N69glU8
	b5v9D9wVyoxAjkHWa1iGlkvVcrI43FZLQ/lBGk5RCDCtgPNenvKjAwPmsP/fLy6cmJadP6XsehJ4S
	Igg1R8attbKfNXovlQ+zwYluGShOiWB5shqnUhcSEX+hz7MqYhhPqObCk5Q8hU3ekOYJz1T9DSbe+
	N1u64Yqacg/i1YR/l4MGQJtj1Ilvxi3VZ+GYGyq2FbqMPma9eCFJZo1detG9hhI9Kq/Sfi7i2cawV
	izcTp3GvvYA5gHgBvhOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwOz-0000000Esgm-1bZ2;
	Mon, 20 Oct 2025 20:22:45 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwOw-0000000Eseg-2Khh
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 20:22:43 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-781010ff051so3581230b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760991762; x=1761596562; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5X0eU5n70apxl8FByquMpjWi58YW7xT98Nr31GIt0Y=;
        b=BWIoQzWC4Fm+uea322K6FUOpCZieki349MrCx+h469CEA0jTxVfld81ZypoI41Jhbl
         HyYSJW1+4CgWSvDIepcW54pB1CEznxYA2SAiEyQVYAAAwaUVGmjZg5mvFtIHShCJlAFy
         6PoqKPfL2iuDK9AhenkJW6J5rnHUqNy75DylEoJQ+egph/1klsWZFF8ls6aKYMuTkmou
         YMr0kSiy0p2ZUdf8qZStYDkIWP3PpuGLp2Fh8iB7MQf3a7LVd2pd9+fhcwMRjzUxM2lk
         3BgVsz9gK2zZNiFwYlp7VL3gcZ1mUOyRulpPsNiBc266X+eoDAkQAhHZO1qiFgTpaicj
         8Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991762; x=1761596562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5X0eU5n70apxl8FByquMpjWi58YW7xT98Nr31GIt0Y=;
        b=Or6TjF6IwZ7vBy1Fc/elutX/dtBo++f1XofdwRIvAqhy9nNK1v75vDcT4Ydg+EJu+p
         ZEmZoXsWQ9ZlYCUBudo1IvGM46fJHqswleB0bS5eCfe1jySpz75kCnSt6EnRauA6IvtC
         +nRw+19O5++hwTnEua94NUFfT3mSslO6C7e7CGkQ3C7fLkS5UX6APEt3R2tCiwXLJYJJ
         /4cXos9K6epGdW1atLhbEpi+WhWdXI910K2nZhP0Q1xdZP8QpI2cHH0Qgzdm4J1xAPn8
         XO5JNJtVOVJSJvxzGcLE1BCnmErGSqKRsLKOo5Q+xRd/qjCcQXu0BK1HOYjwSh4uMHZE
         Cr3g==
X-Forwarded-Encrypted: i=1; AJvYcCV/E/ShDl+TPU9bRrgi5WCjepWoKGDsfs24cCJ7QaPPfuWdr4+w5DoF550L7lsXAFw8v1mQ17SqGZciuw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4SG3GCeonuVycWB/n79BU7gBzXbVDasm0cGZgrrUUI9ifHEHs
	GXzsfHJo4974O7RtH6AzlD4mg9cfzgS6YR0fD9wM+9/+pCHhqQevYxnI5y780gFyymY=
X-Gm-Gg: ASbGncuMMTsIbkVzYLlbcMutW+7c+xF+iO/dMmRweLmUYp6mERCGZu6kAmICsXAnoMo
	STnhihBTYwCAvoQdWUR4rJKd5QapbO1Zvvm+PdlEMGXCjuH/8b9Cfk1YwUnASdNnUpFbDaTtGS9
	b+6QUiCGG/3JePzK2ZBv4ecAxJRsD3++jQgPzf2MLil+2I+mjERo0DrNtS6hiidICq2971sD6lR
	fGf0BbP9n0aRVAIP70yLs3DZvVuDPopIhMKVn3PrPvECGE4eM/biXZakgS+XKcrnefABorVC0pO
	9/fczhLxqLYYhIq5L4+bl4QA8ROmvBs6Bm8ssUbmGk1MLUyK9HfMumK1TretiOpESsR33JnIyaR
	jEwLbmmX8z3yUQUDIylUwPOkYu1TY/ne/gi6Uh16cUOjVuHkiZvkRBp3cn3QcSu1GA3e14eyFWF
	Bnp5HOqbW1xA==
X-Google-Smtp-Source: AGHT+IHEvyI4J6sPrBxVlVCaHky5xMHxaAzs+PZxvL80WqSoNdemSVWitLZhoB4ljrrK9RkRoQOjQg==
X-Received: by 2002:a05:6a20:4309:b0:2f8:4558:ad9e with SMTP id adf61e73a8af0-334a860747emr20871921637.33.1760991761685;
        Mon, 20 Oct 2025 13:22:41 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a766745dasm8443240a12.14.2025.10.20.13.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:22:41 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:22:31 -0700
Subject: [PATCH v22 02/28] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20251020-v5_user_cfi_series-v22-2-66732256ad8f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
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
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_132242_609204_C7F531BC 
X-CRM114-Status: UNSURE (   9.40  )
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
