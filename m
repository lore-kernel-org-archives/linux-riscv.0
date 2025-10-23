Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A60CCF9E3
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 13:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIlt2CNg0VXwZW3+RJ+sl9tlKN619kGHlt2OEkJq2/w=; b=r6c8CSO6dU0RSm
	mPrTrDup9gb9byEXyr3dZqMFwybwLvMV0+zed3zI4apWGEB2ugIaUfb+tAlTRCeWT+owWnaohUeQo
	c3GaAAgH+8VXBoWgQBfLXSsaig5S9/8yhkqYJPTzTpM7uHdVEmFjGWgllwbzN9vAVmiWXTOLaoLYR
	yONrWRETc6+JYqjO0FvxcdUqyo2S8ou0NiYHs+MFC7FlMhqPGCZc6I6Uw9yTNTK578roykSN+elbV
	4bk9BpVcP3r/3oOLvLXi+2Bb40dqpD5RcmOJKAPIdQL8NyzqOdiyRwT8F1jgtZCDzbmBNYC+o803C
	njoZCJKRC1fEBIZ0OAcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvK5-00000006Mr8-0Tsk;
	Thu, 23 Oct 2025 13:25:45 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvK1-00000006MoE-3kAL
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 13:25:43 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-290b48e09a7so10112495ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761225941; x=1761830741; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Vc18KrWuMNfUoArR2DO1WTDm9aMJ2VnekXi8RaYkOI=;
        b=KdOPLP1pVUMF0SsMjktYt90tz/U7txq8auoOFlbHFCGnNqa+uPiRKpe7N35JN6HnYf
         q35CPIAPO39UalTgRfzsimppYakmoZFjw3pCH3NfJOirnrNTyr5BNC/paEqaJ7zKIMyw
         GG7DyUututVtVs7oXJBT9ESfGnOuYrNYtBPHOOR8bjf91czT/FXwZkzKIEls5h+TgPvD
         NQhu8m5WpciybyUF3uNXDQxPHbP78I4ZYMzADq/0ToYp1n3WVnLRTpcTwrOv1s+oCFnR
         f2YMQQ8DLTatske8PimQQsth2091uPBZlqWJSBjbKrTDBOxQG6FyXTzT9B0WpeufNjeP
         xKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761225941; x=1761830741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Vc18KrWuMNfUoArR2DO1WTDm9aMJ2VnekXi8RaYkOI=;
        b=BLHRfMsqvJluUcDKw4yUQ62KNSfktpaymWJ9zZopud46Ivir1gqHdCVlhh71m9t4Uc
         GkWU2dxQiCsQC9rKnUj7anub8wilqlXaV9a+jmIl042lq5F18NEgOxpBK6r9C+mqpU1d
         4oTxUNIX3cIMIzDRxIFZOhCcRfb6XhkEAhR81avRDrl4MMOa7QF09CZIfAMeKZ8luYfj
         b1iWgMFYRitQoIEQzq9tk7+dzaHzDX7NZ9baZwNZn7L83cMYU4sB/E91/t8FZHnDLaSh
         IQcYtQBIIPhziIXQgok52w1V0ypcqlIyspLFYFdIdz4Nf/LZLEC1Cit8U277b1gTS5TQ
         /Hog==
X-Forwarded-Encrypted: i=1; AJvYcCXLXdj1D1Z+aG/JrxJTdK2WuWcDXQNmOyQjI2OuMBd4v6RiX6sUj53bTJt+NCPcZPsJT0kZ3BGSxLcvbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaJcI/b/y4+kGQeSh8tkHaKQj36AoJxJRmDk4J2EMqBIaOIe23
	1pvZ61FEiNmjoe5uYm/kobBy5B/Y0fd1p91Ewg5lX+fwycZu1s/mI7dH1XoHvbieJ5Y=
X-Gm-Gg: ASbGncutltNjTu37QgjLKjNeLc4E0AfDhJuoEa1eOagP+g4m1GzuMfTdWdLIzWgvbLg
	uu/awYUkHcPWg4DUJBtvLgpXcZIwI3yREy6hm4N9BPE30q1lQ2n9z4ZcJrVOz0Iu6lagK2zvovq
	tSUk8tj9YIBKU475fDbMoPW1YZ0PUyaj3qLEzJnmW7KAvYJUrIP+UBx9DDZll0nDIzItShOj8Fa
	gCUF0hX3fvMw/06Tj2GuUOIOIXgcIv1cKMIusoQ71Sa4avM0oc16OsArpG/o3gtihDW5Kh1Vu1q
	kYljBWpm8+/XGZ2/GEiXDV+ERB48hVIkzLE9ob8H4nmA+1e2oSwrcx8wN6vmmHHUPdva7hiXjEo
	1vWk9Q4VWHJzogSq411rqiu/LuCPnUXnxAOxUe0CzRe/cByDLWiJkBcyxlncFsYb5bY3/aBC63/
	i+w7I+yUclXLlSkEToRbuJ
X-Google-Smtp-Source: AGHT+IGl4K3EWqXzwvKFEGfUV31SHiJxvtb202KqFHfU8YvsQJIOKEaNW7S6Y9DyIV9G23eYEwYAmQ==
X-Received: by 2002:a17:903:41c6:b0:25d:37fc:32df with SMTP id d9443c01a7336-290cb65c914mr349494795ad.47.1761225941004;
        Thu, 23 Oct 2025 06:25:41 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e23e4b3sm23432035ad.103.2025.10.23.06.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:25:40 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 23 Oct 2025 06:25:31 -0700
Subject: [PATCH v22 02/28] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20251023-v5_user_cfi_series-v22-2-1d53ce35d8fd@rivosinc.com>
References: <20251023-v5_user_cfi_series-v22-0-1d53ce35d8fd@rivosinc.com>
In-Reply-To: <20251023-v5_user_cfi_series-v22-0-1d53ce35d8fd@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251023_062541_928608_BCA699C8 
X-CRM114-Status: UNSURE (   9.13  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
