Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD681D339B5
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 18:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWCMHKXREbui/pVKM6wTaV8KgKzFhdyfJs0bzIw28GM=; b=UKJF/1zaEPZwv1
	gvXWkBvncfkBE88leNM36tSgNYkfS/H4AEkFox7X/9HMbvcUY9tJ5IlSnQZG/bSx/ozY8Wcm5S/mn
	1SKOSTtFerjiG2D8gtNHgfGg2iujJm24qmDyoKrhRc0RXrULLq9aRFSObD3yPD4XXoKQ7LZmtdPhG
	jnuKXTUNrESKfUe0V2wMGCnLWFsY7nDhKw29X4KxoOSBiSKPg6vTCswI7Vk4OXwE98yk88I5UpaKz
	BwbjH1sr+aIm2RwRK4lkf5lxvsB+aTUEYtyBQiA/m9wnllMYWJxk8evMz/Acq5Eb1d+4qQPmqF+kN
	0wprRf54sVjeuC9tPKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRagN-00000009phC-1O0b;
	Fri, 05 Dec 2025 18:37:31 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRagI-00000009pYu-0GfN
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 18:37:28 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2a484a0b7cfso4133980eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 10:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764959845; x=1765564645; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7cVA4V+tsTGYh8faQvOG85ZxC8pPRVoW62aZwUk0L0=;
        b=V8O9143TreVgEF+GWMb5JpAPe/uPW6rQ6aW8M7Ng53cmh2Gx4OYX2874k7zLAS+zqY
         AMYWuV+07ZwajAqKEj6Vbfuv84j/okjN8kzNKs33vxqU0BGvEU+OPgWKM34tRIrcvFFG
         KSw4c+4XGFU7V7abEWlTRbN5mhY7pJozhbgf7EvrKc4Vf70STMIpeBkdYG/Nfbya2qKA
         3yF1TA+21msWyL9x2lgDMposKV5a+OMSW8FtGsDxHqPHo39C9SOHsv7FlM9UcXvyFWGI
         M5ZP8cX4jeaVjtDOHx8uQJAJqpj1wNQYj5naeOFdx+w0y95YOQ/CZQzxFSvrcR4Q+GiG
         BxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959845; x=1765564645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y7cVA4V+tsTGYh8faQvOG85ZxC8pPRVoW62aZwUk0L0=;
        b=vi51BmMO2nkn4cbjRb+VO2NTu8phIyZHm/AUj4o1bCS7DoC+9a/0GLlpG8e2EiMXir
         Y4RyvutViUCMRrCSeDp0UdU97Md4FjtOVK6p4cT88Vu5QHoxSFaqEGLQf9qSn82YMRWo
         wu7x3GgxxpqvmHAGqelTvmbdg8gqCcJ9NH2sCtxrvmVco9kc5wofCoOzK+JraSNDUZ3W
         NKw6iNLvz2ORFMe9fRz33Gm4yKCnCj+DjtpYLnL4lr3MSAZboZetKkpPvdleJc+iuSj2
         vkaae3ZIKU1+KkkjbsH0yqeeuQREft/pCKDlgy4MOrQ2qyeRNeun6uv4H93MWMdZOWgR
         M92w==
X-Forwarded-Encrypted: i=1; AJvYcCUawG8Kbd3mi4NNDQe9qzaNXw+aw4HJqnIu0ETOVi8sYY/kWKfRQhohvGWdiNgZarvZu72v7HUb/xhL2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzL2F/tlNY8/HrJv3uve26dzsVlQeJ5ELkVqCkSANZJGMIUuWLh
	WtmgiQQ1URBmBAvwhjglCOEyzWap3QJk9ZiHVlT3e2PpgVLJW2LLO9f0XjOaxSeWpyA=
X-Gm-Gg: ASbGnctVofrfs9xXnnOGBWciCIDGa64KM00YR5ap+VqO1WYQEKEjCieavFXPduMM7iQ
	JimtnyAMcnrwTADv7Aix6pNhaUstg8KrnogLGAd2gLz+tArw6O9NrUMxTKwgvcvZrf3wlqIq963
	EeuhGvGd0Eftv9XxTba724z7ggii9WXnTNEU/pHLBy7APJ4SKBZTn0QfZObTKXzlpOufJHxiBDr
	PGSO7CeQA/0/riR4fOy9SlJvQcnPwoF6McKyPwBHm0CGZHdHkO1cumOx9jHbuOI5KPDr+VHvTCH
	lb+QSygUXVltizgoXbtyZfGYkEz06wMJkc/9XzDK+YYlXANQYmVCtVESMzEXTLdC57YPBPlgeyy
	IwvA8FWpBDudnp8BjMZll3eheD5pMC6WvfahVHb/MYB/YJlMYj1MEabTsSW8ndmb4Hbl2PGiSSB
	PeMFq66YUDWFVKnljD8wPi
X-Google-Smtp-Source: AGHT+IHpgKa7H8AahzL7MXJDXATVAt8op9HJLZz6q1O1yZv7iAcmKoVC4X9a7AcjVimql64o0x0uoQ==
X-Received: by 2002:a05:7301:1e82:b0:2a4:5c33:ff7e with SMTP id 5a478bee46e88-2aba34e598cmr5659789eec.19.1764959844877;
        Fri, 05 Dec 2025 10:37:24 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm23933342eec.1.2025.12.05.10.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:37:24 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 05 Dec 2025 10:37:04 -0800
Subject: [PATCH v25 18/28] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20251205-v5_user_cfi_series-v25-18-8a3570c3e145@rivosinc.com>
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
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764959808; l=1182;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=5pCsCIMJf4iBOvf300q6+KPihTaIQ8ZBfY4WmoGUnLE=;
 b=YUOAVPCuxUM5Gbaa6opv1masEPHIuQa83DUGc+CGXyeJ5A4kfQSjMwPJRS+2ZDYG/CTYlt+hh
 XoV55OqqjBBArKRtE/ICcgJfxzIDFQra1KnJGP2v9aOA7JvRD/LcfRN
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_103726_166998_828F1F9B 
X-CRM114-Status: GOOD (  10.55  )
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

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 49f527e3acfd..aacb23978f93 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -93,8 +93,8 @@ void __show_regs(struct pt_regs *regs)
 		regs->s8, regs->s9, regs->s10);
 	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT " ssp : " REG_FMT "\n",
+		regs->t5, regs->t6, get_active_shstk(current));
 
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
