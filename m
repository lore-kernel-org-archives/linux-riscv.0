Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41E8CCD1AF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 20:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIlt2CNg0VXwZW3+RJ+sl9tlKN619kGHlt2OEkJq2/w=; b=cNlvWrbRJOY0oB
	tS0/Roy/k0ZjyeqYM7080SK6oxn+wWIuq+SzJm4nWGXY8WuNBcJCqu0c9va1po9pah9RoE43vPvHK
	wmY16CG8jKeP+sg0X7k/F1kOtDR/OLrIZVonEm7gbrqeqYFD5iNY9o008KuT1IURibFubi4TBbDWG
	N8WffupZteJHMqykTH4e4ZKUJxhZAvJwMFy1bsuNzfHt0BbkrWqWhfDQCNkk6glYegT4JZItp97J4
	qwWcC+h8mYFOMq26I5ThJKuA/gH6hI7xUfQLeA+O1IiRvRPqaORI/Ilzt9SXHrKJfI4laKB665YFp
	9dtSb9UJsFZPa2XgUkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwsz-0000000ExaT-1hao;
	Mon, 20 Oct 2025 20:53:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwsy-0000000ExZt-2l4D
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 20:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=7Vc18KrWuMNfUoArR2DO1WTDm9aMJ2VnekXi8RaYkOI=; b=Dkut2r9iZeeaNbnUyQiHfbY/An
	M5iTQKj0f4IfqIQcp2QpsSVjc0qs6HyjYh6Ht6TVmAJh0GtcLN7dnxEeRPfiGJV+I4AWLz55A9L0g
	95HTKrgCrFJ/ti5WztY7gYHNIMQstX9jbyieouYRxfzADUThqTMe5CZ4KYfINGz8hlcV0+IaQ49Jg
	tFHrYy5h4TWjWaWn2a+CC2dAWG7tLv74XjAU+FdleOZgkU1Hud3WhYYrZ8VMgDmL9xBtS5aDtVmsW
	3ELnOW2dAXrYpoNPeovBApmscaVWFtdw4uGsuwcEWL4OKnyfYyfGiQeCx3OBeh7vn4VMVstQ/hGOp
	+wJ0165w==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwsu-00000001e9y-1B35
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 20:53:43 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-781001e3846so4456596b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760993619; x=1761598419; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Vc18KrWuMNfUoArR2DO1WTDm9aMJ2VnekXi8RaYkOI=;
        b=e4oOuJsBsKKM31RpReRHW5i6HDPtwlyec+Zn8si/tbCPPWJIUgXHJXixljTrApt7o0
         4NfhhB452i96Ivy+Y1lwXyBEYEJlk245c5KUcUOvLhde15+c9YJAp4tr7ny3Vv9gynvO
         jXp5BCJPnwH29IKBDbmOKVT1aoCI0cQnHAWZK4FaNz+Sv3JUi4U4YZB5vMSxDbHHTH1r
         g7Wk4Z2xVls23gFi6/aPwG3GM5KdaBZbQQKfbHI9SIOSBHVI7CwaB+0+48gOERKWFzKh
         lHFphB5TwERjV1L2+lwG5JWGr/CdhWx1M11NgmwlIDFSCrLbZtBA7TOZyyJTSUIQG47w
         5JGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993619; x=1761598419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Vc18KrWuMNfUoArR2DO1WTDm9aMJ2VnekXi8RaYkOI=;
        b=FULJwlxgQecHv3f3+Yge9TcHilvE8IXf1O2d0DnxsnRGVaQFnFyXOA7Fi5Zoit46aP
         5b24iIkAX92vXpFySK+r2ymbq90YNn/87WTETOtjCBkZvt+0iHGLkSvCP9xuubNGRP82
         oYJ9nh0WzSuKhK+6hJlL44I3Hqs/vjPAqZHEQXtb8N2AqUOAwDO+LFhLbBPBP1p9BBj+
         zsIJMesoYQHOqV+DzX+ZFcTVRYJOaeorgL1P0pHlwjzvC70p8hiJrf9m99ibGi9G19+r
         WnfsXW2h1JBmBLQYYr5R6u+3I70EalCEKs+yg3dv6NuqURhwqqEOw7J8M8tKqufEXKEO
         l6gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXKm/xw4tFrnQaGXh62HFwibd1rG8J5XNvxxzmObkVfjW5euruabv8oKExZgfAQZeyZAcGTADsIAEe7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYxnPlk6JaQRCyJrdvluHAyDWwkTP1mF8cnlx/1FJM5BfaJgdL
	revrZ+/lJaN2DsEDG5Smo9Mkc0HjauT99FdOnNq2SO5ElBuH8F1o6jynQUEzAk4cmRk=
X-Gm-Gg: ASbGncuN+xGm3GXmjwoWkFlV89fQZl+ykJ59RDGcqQu13PfDfoOan+7RLtcGDlVONJ+
	ZV0KK52OJb9CKFE+CnTbE9AV+STJ8PveUzgx0O+3dBwNvT23f738RDDZ6M7wuRTrHBsWz3B+jCJ
	tsmy5miD8bA/QEaojRId9NN4w5fdyjfqynIicpy7fFkXU9inqMijkIovO+DHqa6F63aSi8E4Iag
	/lu5PMeF0VeHbB3sWcfXHTNVLZWnA3sy/FFay02SMiO8hgQCLdORkQ396GicPZ/KslXl3GfVPVJ
	elX+wwV7jU8eVtlgft7DGvPqBXKLgwbXL41DLy0tpxYbyWAWoRGrOvPDgSIqc+EmajRuaii4xcD
	7n3QfVtOR3r845ruZAnRGHMXFytj5XEmNOUzLYutL8QwcvcdGh0ea+RjrDise9xXtVGEI3i9SXZ
	JL13FfRAWc6XeZlRCqSJ2O
X-Google-Smtp-Source: AGHT+IGL4wpVGpFAR6+71Q3uMu9smAAvPQjPoICYz6gHBaftPyajfTVLLzLP1i70rrv4AcCHkeSJkA==
X-Received: by 2002:a05:6a00:acc:b0:781:1b4c:75fb with SMTP id d2e1a72fcca58-7a220b0719cmr19998820b3a.18.1760993618646;
        Mon, 20 Oct 2025 13:53:38 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1591dsm9453867b3a.7.2025.10.20.13.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:53:38 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:53:31 -0700
Subject: [PATCH v22 02/28] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20251020-v5_user_cfi_series-v22-2-9ae5510d1c6f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251020_215341_554645_D91A0366 
X-CRM114-Status: GOOD (  10.29  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
