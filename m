Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDF1CCD1A2
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 20:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QvtxightdoH4nlDF8ffGe5AWAG2kfD0XCcF2iJcA6Q=; b=jNd3HLIKH27zeg
	RkfspK7CQJ+J0zcKRY2o/PTj6Cn8fpP7mt+dhqSv533SGeh1yaZS3XQ/Ym+VPdR0WiiLNTVMMCLXE
	tcDDmMaCcGnFsUQ8MpE4+ACFpk5/TeLq692yoJFrsIDzZpcYGR/rYVjpXxRGx5oP/ilcigdbN2Wfp
	I0n8ZCyPK+58H2mdIws61WZCmQWBgOUJRwN9Jt848E9yDBeF4WqgcGCITCd299SU9y/Jwd2WfyBt1
	qKNWFtGvBOz0z6Da7cUqwQHasrXcpTbDYKXH8WT6C9YS5EcNyLaX0O6S4I1IvvLnrl0TN3FjG6Gr8
	dDqcj2/N7S67HYQbSJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwtE-0000000ExkM-06E6;
	Mon, 20 Oct 2025 20:54:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwtC-0000000ExiA-1nZP
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 20:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=aU5JHaPOPUGgukhD3bad891ElerIE5ocm+VeTPJz1C8=; b=oc539042YdoKc3ou3v2e28gwx6
	I5ecjujWzTSDZSTENhla0H/2vjTpHJCLOWaRKaqNnCj9wpwhQijXczMmwJyDlgKAP7gSAnTrI+GOd
	avbUhE4aggtQ6H/e6DzIKHhvimM59o3i4kR2y62tccNg0NsK51vA14OjCNZtg9jBjvEsnWQLqKxX6
	MT2tmSAaIcyWvMYRe/9m/k/dmTQXraNjhYDhP8A/bl+zbDgzXjUxh+wevU/KH+dhnPkj+an4D8jXO
	VupbLIJbrP3Zi8yOAt2f7S0YHRYUmjz00GsoZtzsvZvFtHUwmGbqQoorbLnC9KaDFh3PQ6gpJWiAS
	szmhFTLQ==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwt7-00000001eZR-23Ah
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 20:53:57 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-781010ff051so3600586b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760993632; x=1761598432; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aU5JHaPOPUGgukhD3bad891ElerIE5ocm+VeTPJz1C8=;
        b=OP0D70+HF4tcNIb5fMFjDSQw7mB6t5mAUbNZ/W4N5fWUqNLP1Fkzl1Yh7os8X3s9Us
         6aZ6O66HrimM8QLhZUIDBhb6grh/sgTbgub4XruoTI24BMztuwE0ZA2q1xVkjcLa9pHU
         +fWC3LTBb1GZLAaZECMWNPr2G/LF2NNw5oRwMYxpuQmCSzj8WaHi6J0osNUNBbSyMAK0
         f9YJiva5pwSak8NKJG/BntT2c6r1/d/gZiWjNafXmmcfengBE74kye+89NuG02pGfrNC
         v5guuNNt9PqmQfu0Pwrae7SFP2YlwsZzYXNHV0J/bsCNnEQiCzWa9RnuOMdrUjyu68iM
         M+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993632; x=1761598432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aU5JHaPOPUGgukhD3bad891ElerIE5ocm+VeTPJz1C8=;
        b=TpIlPIATuOuB0l/2XTVeBjUga93oYbFQCIVBp/o7gs16yO120Hn53IAl+3U6Q465Fx
         iPUtClDFLDpuSDjk3FpvPBFzMIIhG9u8NnQKRTJc+uBGmmn0mUp2A3ndsN+lR2BXdL2x
         Eo+TgQarl+oVVTHR1Ur5J9zR6vDQSohwhzm02EFeagU6ae8eLxoGzA9H3oQY2WbNLU2F
         FfSnABQ484stS22vLGKbVHppgTGjcSwtc//2MGRM06rHVZITWfsog8+xeqTcCQaF7HMv
         wmE36FoNCHWhWo8U7pjScZZOQZ6P7Nx2yMCjLccmjjgbyQzgtEVkkQi23jdgQWuPVarP
         zBhg==
X-Forwarded-Encrypted: i=1; AJvYcCUOa8AOFxffXCyqMIwoQxgQ1ZS0Z96OqfLOr3vt0l9B5cV1JCgNps7UdsUYAGxJuWIZH3mkJNEjW2Ycmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMvp7g0UADb4a2v8SqlQWKlS3oL+UnJbp/fwdv4o7vuksCzOKJ
	qZvQY5oDqttftwxJehU1lnB6r1pyUwIzlRTHqn+aCNWM9xJ3kGrjo593ifYMRB81fDQ=
X-Gm-Gg: ASbGncvxarUZ4tcZoY4CKRmRy5N9le9GDM/5slaIUff3BvnuWVKbrp+OSi/0OSgge/r
	zekoOXEE1RLJH4ISs2fd3i6Pt1D1bX7xKpH6sd0wc04yIq4RS6WlR9gHAnRqCmYboBoSk6SD7WG
	TjESnHPVgeFgC8J5Y/HyVrwwS2Ot1iCZa/5O/YnVIK1dAwR6NO5uQtLWpq0Q7Q4RMWlYntXJgS8
	JZFK2rqBnIxvFwR3JZVsM/z/IjlWzlGA1ucVkMKljWeaVdn266dHtAJRuPf9iJtq4NHGY6YNrZK
	TrZtDiWH0EXQ0jyIzxnqzrElri4JZqoZeMqtPyMIDepfbYC1VbwKcTR3Zqi5AXglIa9NYYqm2bh
	q+aXIt5boTQk+k1OujkDIg8bPNBxVObfHfTlGrF5Hi8xsUKzBY1+BrxGvH8CUulh058gA2sLNxU
	tZRcjKt6rzhMRs8WWDcfpZKQdYXrdyHvA=
X-Google-Smtp-Source: AGHT+IEnU9JmJAW6XUEpBFCvWbUt/eXN7ETKyltouGiw8zgeBwTW8/YUcqQ1OslTqOfhR53w2pN6Cg==
X-Received: by 2002:a05:6a20:7353:b0:2ca:1b5:9d45 with SMTP id adf61e73a8af0-334a8607501mr19932803637.32.1760993632128;
        Mon, 20 Oct 2025 13:53:52 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1591dsm9453867b3a.7.2025.10.20.13.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:53:51 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:53:37 -0700
Subject: [PATCH v22 08/28] riscv/mm: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20251020-v5_user_cfi_series-v22-8-9ae5510d1c6f@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_215354_818187_5551D469 
X-CRM114-Status: GOOD (  12.01  )
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

pte_mkwrite creates PTEs with WRITE encodings for underlying arch.
Underlying arch can have two types of writeable mappings. One that can be
written using regular store instructions. Another one that can only be
written using specialized store instructions (like shadow stack stores).
pte_mkwrite can select write PTE encoding based on VMA range (i.e.
VM_SHADOW_STACK)

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h |  7 +++++++
 arch/riscv/mm/pgtable.c          | 16 ++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e4eb4657e1b6..b03e8f85221f 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -420,6 +420,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -765,6 +769,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 	return pte_pmd(pte_mkyoung(pmd_pte(pmd)));
 }
 
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
+#define pmd_mkwrite pmd_mkwrite
+
 static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 {
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 8b6c0a112a8d..17a4bd05a02f 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -165,3 +165,19 @@ pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
 	return old;
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
+{
+	if (vma->vm_flags & VM_SHADOW_STACK)
+		return pte_mkwrite_shstk(pte);
+
+	return pte_mkwrite_novma(pte);
+}
+
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
+{
+	if (vma->vm_flags & VM_SHADOW_STACK)
+		return pmd_mkwrite_shstk(pmd);
+
+	return pmd_mkwrite_novma(pmd);
+}

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
