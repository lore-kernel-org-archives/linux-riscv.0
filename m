Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565F8C3DA6D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 06:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2rz3W3NRyqckDdZcsjOoJ14Hf9w06DLDTEsR+XB0S4=; b=XI23bQ0l7ArjXD
	yUST46mkv9g9xoC4pHTOSlnejq5MLF5O2SQYnoidgGhwF7k/O3bDrOWuvQyANjRED/DNCobnviu1b
	LfeTCt12FNeA8Q8zzFEAJpWMwvHaEkDijmLThCWIou+KBPqwHqm6AktMp7pjDrJWRrJxoWf6eL75F
	EAHY/yDm30vT6eT4d6Ae8sc6+0h7Mc/GV9N6yaIedFz2ZRgpaLBD3VtSFbWytz6Te1f5A3AsZ2Apb
	htv2ODVqLHriU765kElP3ACX8Rj3FSz50HOKnCcoDo3AvLtpZDbsVuVjIddPLPuvpQZCz2i1YtNiV
	O6RbxXAZ1xMvpDM+mZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIM2u-000000037QU-3XSQ;
	Fri, 23 May 2025 06:38:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL09-00000002ztU-18yy
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 05:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yHp8skVfcDwQ99Y8qvuLL+UOu6n4/KmOGLmf3JbJ7iE=; b=WvqHT4OLcCxLp7JYU/vvdbsiOo
	MXCH88MqxpF8mFxPSMSJnHNVIVys8sCVLErvD3T1dqocOGINxBO9RxjyBteEGCpcdQUprTWBihplL
	vwOpEjlcpUQpi/w89Mznu45/oEHzQFBCJNuc0twy+wMg+70Q2nAh19SVu/b7sEdAvt7li42hmTL/I
	KTtg9Lqsc0vjbTRZkG2iGYbzWDTepwlas7isfPlvxXv9yenAPe0+JdYE6YlSzj3iQo51Gdn1lyXg3
	74MaIGlFSSJt+2a14nSHJPymzJoUl9znHPFRlGYAIYtySxoa9Uv8nc8oEUiecZsTdW0miqtsEIEWS
	lMbAbdqw==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIL05-000000018S8-3geA
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:31:24 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-742c5eb7d1cso7410832b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 22:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978279; x=1748583079; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHp8skVfcDwQ99Y8qvuLL+UOu6n4/KmOGLmf3JbJ7iE=;
        b=tY+irv85s3Rz/t2z6lFJvmlbj1m29Jn1BvdgbsPupPq0EMg3MM5GnjxjDnCL1qAplU
         yDEcjy2C6CRava+06yHmO4pNUyKzsJ/JyYgiPsSItfCBBUmLiU+MrlToVioLe6ewJ8Lm
         5xsVGZFQmwkmx4MVgHP/CfaoYvByMmlVdPI0OQuZ4LTdgNJGWz7EmuezLAFcOAz/xuhA
         TGX8Wcb9wkQYaimUxh4sEzGQObE/fy3vQiFS2hFiuU9cKaCpLy+U88ho68xJ6zsI5c3G
         0ZEGHTk/rPJKNK1BnrJfypkrFWc17sFZeEADj5i34x3BR/iMLJCpHy4ZOtG6fOI9qSvY
         5krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978279; x=1748583079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHp8skVfcDwQ99Y8qvuLL+UOu6n4/KmOGLmf3JbJ7iE=;
        b=SsYhYYEtqOluMhchcBFBHn0Vc2EJseMInRKKYtGwF1k5Ju+btqII1vTR4YEB5RIAHp
         9csOIbM/GaWmyA2xNCQgmE2jUCF/6Kdz/1Q7oc9+/bRuf68Obg/wR2R1hn6XAAy+vKTe
         2Iu99FOeppYiDkHup9c/R6EpSae4+Jr8fk0Kb8LLadHG44OE2E4SiqG+da5IKqro+w9v
         PSDFl0Wzu5BJmyR2uODLPpQyP3ds5Qje/dXQ9f7e4vYPCpsmpJGoqrYW8825Vj1ciuri
         BlTLnLt+mhc8KcXPvnp0p/eOyYuXpjE9kXyt+lXk4tXP3Xf/qb0r/acGS8qOWNUyNlAr
         id1g==
X-Forwarded-Encrypted: i=1; AJvYcCWYAoKh+j2BG+d3vMssKBbpFyPxsMbpEINghnwwg504gY+3YffuZHG6foRkKUMcI4VkMRNYE8y38/6ENQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuorhRpvagU71dzjHbJKSna52+RUO4wDQzGf9QJoLwIOKjG065
	CE7l+GB5fkJBbiyLlnBMdZcRs6y9tLMts2b5mLUf6bWUFhxbkBizvEpP4ymT2ZlCJ6g=
X-Gm-Gg: ASbGncuwkiWwxAMgL9QspK2AEFM6iRKPJvvKQwfiGSC8kCM2cikSA9Ins0ZEOzObe9k
	AjyALnX2kDEQxQrVnEbYkOw+q2w2uvcwH+h9dhhJfN6lTS61MfV1BpJf6u8JHfxoGvOwjwGM1IG
	p8Lt+TNTRaKDD9nROhpBomcxuRRK0r+hZcGlJrjEAmd96Rnrl03Yu8A4+eCQxP1w3ySlNnkStSu
	54i9iegWvDavipVnCK4GFcHiUIwJQuUbCrrNSRxrEf4S5cDbuMDiraR7SdOK+ex1UDXd/p2BU+u
	Ap6PEqLwazohfZ/7KSBwlj1Xe9GNgIbOmhCgZ74yQ5+NqrdHvCUbj5RplebYFg==
X-Google-Smtp-Source: AGHT+IHlKP4UZxn2X0unpKyk2s34DfMIrhFXaYoYHN8A+/APpLh1k93lfGM8cFGfaP7h7sD51xUlFw==
X-Received: by 2002:a05:6a21:a341:b0:1f5:6f95:2544 with SMTP id adf61e73a8af0-216219b25a5mr40768503637.33.1747978279402;
        Thu, 22 May 2025 22:31:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:31:18 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:05 -0700
Subject: [PATCH v16 02/27] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20250522-v5_user_cfi_series-v16-2-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250523_063122_084754_BF0AC5EB 
X-CRM114-Status: UNSURE (   9.42  )
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
