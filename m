Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E7AC83F1B
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 20:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjmfLAyXP+13R4fYtCVLhSxhildOHDo82TfsOgaYcfQ=; b=xJtyBf0u8ZAIjy
	gLe4rzXGDVqw/ttNVHaTBuu+quvINgRxqn4hgm53ygFE+J8xYrPFuY8EQ7qIGjHqclsPjieKzxryS
	mmASZu2YnhPj2Y+DNXDhLFshs/ZgbKGpibXrH3TpXJAJVLMlfab+yuI+qjEILhIb+0VxlDQcI2wvt
	boyk5gOBGtRavlyL2BrGIieXSO0eF3WAEZfm746kXEg+GC5efTOZVxg3ONkvCTC4Z5R6s0QspVoo5
	GmpoHaBOohmbkS/+4ru2EaomEilj5uh72lr7kjXS0Y/3Vpfr2Lpa3s2hyoFdQ+psbUobRByvBoutr
	FAVOo4Gl0OY3JWI91pfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKeM-0000000FoPZ-3agb;
	Fri, 11 Jul 2025 20:47:18 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJhM-0000000Fg2B-2stR
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 19:46:21 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-748e81d37a7so1620627b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 12:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752263180; x=1752867980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AetdkWsxzLbheuZJ3kb+4mhEhv1uz8fN4NCKhkFj5X4=;
        b=nx0efZoynQsoa6oYjZl+sPfgZ+O5wOP4xmwifOyIRzfgUWDs7PpAYqzdPr78XFjo6m
         MYPR4+0VZyotE1j0i23gpvkqkEiv0/WnI462Wen/qubdDtry8J5gfTHajJSj8kETWzGy
         a7AhetBVkY/javI6WzKaAa/ePd1eKUQ+F6WnMYCY12B+VLYSNSnKUmIyuUrekaoc/FN0
         4AlX5tItxN6TU7Z80zQ2RU8JVJyBAtLjsoNK72MtvC5iB+T8zZRAILFObzgP50WO4A8B
         ouxdXJECS20KoaFslOrp+YIeI6TgeAdhZkWzOGPRMAOA3yoALYsEIRIztOKXdqFphYkw
         y+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263180; x=1752867980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AetdkWsxzLbheuZJ3kb+4mhEhv1uz8fN4NCKhkFj5X4=;
        b=SjEx2upXEcmtb7wA2W0juIXggdKRVUokQkpnLEleA8PvODPsM5FmZ7md/Qp9tCVoRH
         PnEomdjrcDz7z4e6XG3oI5tzp/jcAW6Qj3hPv1WMKgEmZ7X3Lg6NYcTz3aVXuxMUK3Rg
         xqAtsc9rILNymX7uyYuPdUzeTSuGdV9zfm3gq59sETb9aEDdhaQhYZdRMTFjftGjrUD+
         psewbgDCTzXBcplNvOX6FetCHSIqm3rcabpZ2Dno1lKLWLNYsDTUWOAADbbVrkxcodzP
         JMALxC8Hr6jDSuqmk48KZJJTqEGD9ajDtBqFUfXtUoL3CBoum/J9/H9/3IAcKab6CzJo
         HCZA==
X-Forwarded-Encrypted: i=1; AJvYcCV30VtslwMPG9Z9R2Pu21CX2swoYjb815CuaNw1khMcrK1rVMuJlXdU3Tal9L0tW6TlMx+m+TfU7+qD7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpP2pQFSyXG4fhtuDVov/IA76eQkLel/3Y9Qgj7B82kEyyQlwk
	s6wm0Cj7Cueslq2wZzkyT8f82KJ0OHEakW4v+RFc/O7mty1/usxM6d7rtRZPpz92DVU=
X-Gm-Gg: ASbGncslrfjc1VgywlQGUgmt5Qu2d8Xsmds8YpPQqU/8qenSK+vf4ilgFKsLECMqT8S
	lpcTYI8oHxnD/OI/bHVFFQvdXAWoxuIsfIrjKQ/+pTDaRjHsNwW+z3rh+Vm8SwUIphZXSezEgZ/
	fmkn4H2sVE6wlN+0WZD+wwJSMh4p109UkDk0DWTDlqNahyXLCRKIvAx2PFWIbrFNR/QXFJZG+o+
	ucNF1FL2VZMaLjuKfnxGYFisruXUoE9QvqNt9CTsRE1/OOtuq1V8U2Yrn1p+Kl4WCMudSvZU1ii
	qBkAecz0Rl+wEyHTizQ0eL00AKrllJHB+Rfk7PgwnSCVDzSBAC4Clb+aCrEK0kvAKB6ArSt9Wzh
	F5oMln4GQ6CMGmyfrkITpHMEh//WF1etY
X-Google-Smtp-Source: AGHT+IGG9zUveN+w+4yPj09VqnZk/eoU1QYfxfcvhNX9xjSOkBgHVVRYnM8aiNz4kJy5tfw7guLwGg==
X-Received: by 2002:a05:6a00:4644:b0:74c:e253:6c83 with SMTP id d2e1a72fcca58-74ee12977cemr5069378b3a.6.1752263180028;
        Fri, 11 Jul 2025 12:46:20 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06995sm5840977b3a.38.2025.07.11.12.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:46:19 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 11 Jul 2025 12:46:07 -0700
Subject: [PATCH v18 02/27] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20250711-v5_user_cfi_series-v18-2-a8ee62f9f38e@rivosinc.com>
References: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
In-Reply-To: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250711_124620_732527_7A21F226 
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
index ede6a58ccf53..9cfe4381f3cf 100644
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
