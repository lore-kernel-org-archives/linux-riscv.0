Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FA1CF043A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 19:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+VIhJ8GHuOJRv4SAZg0LitxrorOqt0oNhkSqlv4xgK0=; b=qh/fmMjKcNiD2w
	Vj9Ep8qnomaiPVjJ0sH9elF7UA6RBDnDxzKPawPysuYc8w1HG3VrKqsiNlm+jFA/s8eB/rV3gx9Gp
	1mtIjH+lO+PHEnKxSbTuUBoxvevJyL2nRgGBlIkX/88qgO52vvKGpZxgWA1JaoaMrWgranE9dqkhn
	RqFjuZ2FKVZUhDbFlT2fCy8oxGlMcr76chp5rKisB2IJqDUdEs6zvO2vks6RLxShPcB9lfgDsnPTZ
	LfMD9DPhkIQYth3TSCGJOpyiGbhBjqomdE4opVimZv8m1hKwF2gJmuFrMM8KY/dgkc9UuCgd/eV7R
	P/WPWTaJ/axSRwumYh8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szLd4-0000000HTCV-365y;
	Fri, 11 Oct 2024 19:48:50 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szLd1-0000000HTBq-250a;
	Fri, 11 Oct 2024 19:48:49 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71e1ed14105so210002b3a.3;
        Fri, 11 Oct 2024 12:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728676126; x=1729280926; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHR1pJM+yQAJRr+EhCLcm5xM2IPL3wNgQ41k9P8Ch74=;
        b=CqUeqF4B9S84wkuG3TgIVpEo7v+4FrZglCshE2k3TZGW6SewtkxAIZUsA/WmwjTYsw
         Dq/bF9rA4Ecuhxny9w7XX0IhuzcTW2cQ+st+yObtwYNeCTtXz2BuinWuGggL/aJGGLMe
         e5BfRgPY41+FlYq8fD9s5r7uGXuRsvI2MRV12AkU0YUL1KTTu8U23KOO0bF9vIOl8APf
         MyieAmGzCqMdbAIyKJ27fluGa4BugFwdPIIVm+05EboFgXzBrDiBF6KTJ99QCukC05Q6
         lDqN3mjO1ugXicvtlCaN4HBCh81TR3Z9f/ZtnF1iyQkHezWyXNRcTjPddVjNizYuh3L7
         DsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676126; x=1729280926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHR1pJM+yQAJRr+EhCLcm5xM2IPL3wNgQ41k9P8Ch74=;
        b=RRusAEQNmPagB+siOxPqusEZ4uMnlBRaK7Gcrj1VqKUHPDYl0wbdwAS9zhv/AHzTeq
         ld37KqHdeoLOgzuhtl6+FBUu7W5oHiFi/KzViTUkRYCeRBz3nm28Y0V96rD6MughabXB
         LdeYHkDAfVRWjQs2pq1J1LfaOc+GOmJ4qeuz8IN14lE3raA5n0auWnAf+aAeN/VUM6eI
         MzAfmkaCFTyaQi2J6P1O9KUbIuBwWCPm3UahGkCGomh9wJI6p3vtjgi8rVpWc0zqkrnl
         RGv8PD8/mSRK22PMYzr+YKSBgoxwLNAEPyOtVMBD2c5G7C7Leblh7M+122ERGTbl5jJ2
         X8bw==
X-Forwarded-Encrypted: i=1; AJvYcCVOS81w1R8rqbhv/FuKW3y5bqNXBkhYL/p6li95iyt16DVN572zQIX+A+9Hpstdpral6Xe6C6b9OkhWUjk=@lists.infradead.org, AJvYcCWnQyzkT1REjWuJbA9V8o4/hPsayi62W4IJ77qK222p55zjb3Sf/2sYyssB1t4jA9BkpilZsQNH4viscPihGeXI@lists.infradead.org
X-Gm-Message-State: AOJu0YxJfh+h/gO6/aqujFoRDYAfiSo6kbXZs8zMzsIFUD6FZRk/oVpq
	vZ23mhUdcnPT6F1UuJUoJTDLJi63sqWnyhaVcwBl+08YxPBtLwGwnqqhirMwFHyBb1k0ZvY+jm5
	pkrQ6BM2qvl7ILTqU7A5kaZJCSZA=
X-Google-Smtp-Source: AGHT+IFm+UwkG6WIg1AqvuqnbDwrR2uK/LvnAOy5vxbnvuoTMa/HQ5sfAKze/sYR1OTnuhhXIrv49b/1Hp/O75r3s04=
X-Received: by 2002:a05:6a00:9494:b0:71e:3ee6:f8a8 with SMTP id
 d2e1a72fcca58-71e3ee6f918mr1949743b3a.1.1728676125868; Fri, 11 Oct 2024
 12:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20241011-tracepoint-v10-0-7fbde4d6b525@google.com>
 <20241011-tracepoint-v10-1-7fbde4d6b525@google.com> <20241011131316.5d6e5d10@eugeo>
 <CABCJKuesYQWvfScFaqv_rW5ZqAJNn4zK9iOFAmyTaYKO3S5hgw@mail.gmail.com>
 <20241011171251.0bd53f01@eugeo> <CABCJKue7qT9drhgrXPEjBO=gPw79vYELAZxz747Z8WMF=vj2MQ@mail.gmail.com>
In-Reply-To: <CABCJKue7qT9drhgrXPEjBO=gPw79vYELAZxz747Z8WMF=vj2MQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 11 Oct 2024 21:48:32 +0200
Message-ID: <CANiq72nOCkzTyJCydHOrkz3MRizb27sDO_5Y_cKEv3oZDNNqqQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] rust: add static_branch_unlikely for static_key_false
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_124847_559897_4EB6CDDC 
X-CRM114-Status: UNSURE (   8.13  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBPY3QgMTEsIDIwMjQgYXQgNzo1MuKAr1BNIFNhbWkgVG9sdmFuZW4gPHNhbWl0b2x2
YW5lbkBnb29nbGUuY29tPiB3cm90ZToKPgo+IEl0J3MganVzdCBvbmUgbGluZSBwZXIgaGVscGVy
LCBidXQgc3VyZSwgSSBkbyBzZWUgeW91ciBwb2ludC4KCkkgZ3Vlc3Mgd2Ugd2lsbCBoYXZlIGEg
bG90IG9mIGhlbHBlcnMgYWRkZWQgb3ZlciB0aW1lLCBzbyBldmVuIGlmIGl0CmlzIG9uZSBsaW5l
LCBpdCBtYXkgZW5kIHVwIGJlaW5nIGEgbG90IG9mIGxpbmVzIGluIHRvdGFsLiBUaGUgcnVsZXMK
c2hvdWxkIHN0YXkgY29uc3RhbnQsIHdoaWNoIHdvdWxkIGJlIGJldHRlci4gSGF2aW5nIHNhaWQg
dGhhdCwgaXQgaXMKdHJ1ZSB0aGUgZXh0cmEgY29tcGxleGl0eSBvZiB0aGUgcnVsZXMgaXNuJ3Qg
Z3JlYXQgZWl0aGVyLgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
