Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0209C369D1
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 07:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlUHsB2TNP3rZZV7ZPO82nfDRXtXYE2n7bDtrhbxce8=; b=rOOtnFUbx00b7N
	a6wphNVJX/R5jblvLjHheD6hLhtvhnE3sVICvGda1bvcrYDEG26LysAZ0D1aNkU1zNaHDBIhOwlA3
	QQdJ19DM4P2wanJbNyNnuZKZU+pmoB28smCxAI453zdB4I+h7ExIxoWSgiKpQ1vlegKmZNfWu/cJr
	dtx8qQbguNFCzI3Z8cPWAnZp1ujQ90QlRx5RVNdbZmYFpFTFp+DBAqMoJp+YGs8lTl4S6rvzHpWmp
	QG0fCe1RDswjnP3QZlL9gYXmv95b82h0cmayLqWhooyw0p7ohByuKcEl563ymLbZDkqNxMUJx4qEg
	3beQXLsvJ9UZ40xyGgTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qv8-0000000D8xi-41Qw;
	Thu, 24 Apr 2025 07:22:54 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qsm-0000000D7aF-2EfA
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:20:29 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2241053582dso9951315ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 00:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479228; x=1746084028; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnsN/FT6wHpekGZzdtp9zZaBWWGp9NhN+LtMYNwstuQ=;
        b=zJ/tY5PTQf7owCYGM9tQ85gHPd+DpGk+QXWS0YEXfFDaPRs1I/NqHvkCn7G99pfqOW
         Oa656ppYEwfFrKXaJ7q1DGF78ASTbQQ3X/cI9lH5Nw6Nj9BVHzY+CxIgw/Gs+Slakw4r
         QIZ7T2zhHG3rV+vTqp+ZFtrF1CwGux6pKPkkj21nQu8Tf2j5LxPStYeOF3V5m1W/pTKe
         c0hl8o5WnYkG12LyT4qWkvawRRHL+gsog6NX4d6APhWngE6eV/sg1e8LDtOP4+7IluSC
         8774c2cu98Wa9Yog6mxixDlvXx5gcrWLEbS5exzb+I0dp/kb7FFqwsjkOwd3zB4UDwXF
         1Okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479228; x=1746084028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnsN/FT6wHpekGZzdtp9zZaBWWGp9NhN+LtMYNwstuQ=;
        b=uf8qsaCCmM4Xw4oeQs0XhXWJ+rSO+W7Dzsap1JKC7w0YJUTlfuueCLCPq1cU0YxkxS
         smAK1J0mxtvcQsDr/tqNmHwSVvwvkbfWoIm5UKuK/2YUfAOrVpokeXz2mS+s+MKLKjPP
         v+ziwsqCOwt39BSldcXLj5w/qjE7jikvvjfmDd/PDGy2U04VfMVdUM55EfBOcrHwuuEc
         95zimRcDhVBMFdTSHKs7qphPqb1uMVbMdXa1KD7MvLzvrJuLcqn0RjM/6eH3KSyIjOax
         06IT4TQ45cDMcvQplrwpuqaW1vd5DyWjWbJqrQHyBux0xXENGlzIlFPhiPxFHxsG8kMg
         vF8A==
X-Forwarded-Encrypted: i=1; AJvYcCV2M0kOWTcHnbGsTfzaFnTM3s+NsTQ+r1A2K5pDIIjaGzuS7FFOHruxCrHHTelVgyITnU68TWgwoMG1Hg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRFpo5pJ7ep5yuKPHAhTQ8xgV1g9ejuysiZmZM3NRPArrbP4oJ
	2NbGjzCQowRT9CVWKqE1N/CLZEMOBIh3ZQF29r9XtgHBX1KMURhoq682P5THv7Y=
X-Gm-Gg: ASbGncvly6Un3kH5RuwIQi6TgvRfD2SSa6bxrOSfaP2JFgZ5fxR2ZK6as6dDmczpRmU
	MGSZElSpFX6/2rp8YjcsU8cNLzwv7PMynTb0cysrs30+Yn2+yPNgSlmtQkr3MnShKrAraZ2lP81
	e6SY5R2Fbgba0Wpv9hejACN4IP7BlPFnYETzjN/H6YEhkq+2zvVDHU9K8iIXe7pdbCjjYmi4NtG
	giw2qqrvfr29IQxrD4mo3O8lcHVw5qZa1jbt1bYE8Xvt7tKp9eAw0GI5ENFhQIwoEAd+dMYMCOx
	ZA4x5ar7OK4jZA8ZMO/eHZ+5dlah/nYHji/9p0yjFNy+IBuC2xhjrqMxdlZAoQ==
X-Google-Smtp-Source: AGHT+IEU+Y137gYRHLnOx26vSf7L3l2vsQIYY8+sFwtF+6f0KCB41T+GdLc1UUDDDmJfXYf+XxTPnw==
X-Received: by 2002:a17:902:ce0b:b0:21f:6c81:f63 with SMTP id d9443c01a7336-22db3bd0f4amr25027775ad.16.1745479227851;
        Thu, 24 Apr 2025 00:20:27 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:27 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:17 -0700
Subject: [PATCH v13 02/28] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20250424-v5_user_cfi_series-v13-2-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250424_002028_579319_C586467A 
X-CRM114-Status: UNSURE (   9.26  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
