Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BB6CFD352
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 11:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9p9wJK/pukBrWmgCzIteNqGXpcoCGf7Y/B6Sn3sKp4=; b=QjJD2JI2fDo7ru
	ZaJauGLF/n0haRMY4/qSPJgqZm7JvvYQk+AYmaGM92gQ1k6KdqJXAmAfyb4yDn0gAcok7zLULF9/l
	EgN32CBsPeP7ecMSUNzNRoOkaAXR0lCHDaLHV6WYn4h/UyC8fBTsfOdIDSWeSWksGCxug6ULBdLZj
	K5UXnuP9cPoZXmdub1tzIEOCuh6JPUORO5+nQnQBQ5/Ka1TwD1htbbu3h8beXcfJH92jbM210Vmiv
	Piz4a0G1ejtd/cGPdTmUgvtNWab7lIBzbmhTS0vWGILbXC6m8XlYm3KiJchWEzdXNrixVo8ugGQod
	1fe5AyKEt6LEXn1UQRog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szDuZ-0000000G9H1-1ZXU;
	Fri, 11 Oct 2024 11:34:23 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szDtC-0000000G8zt-0vZ2;
	Fri, 11 Oct 2024 11:32:59 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7ea64af4bbbso12391a12.1;
        Fri, 11 Oct 2024 04:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728646377; x=1729251177; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=az4hS+NK8zBr5UCFhRFct2ksVmIL42/RJE4tgtHk2Hg=;
        b=bzoq1cOUlzYbIA4GCsn/vtuooddgfhCHtIIMmhkoO9aUThauGOOehCHs1OSbOooMrU
         Wnkh3Xx4/S/RUgTlra7nbs9c8cP8GyUrBcrJGk/r/Vfz60hgIXqvnguB6fdnyNAsIiXM
         FQ/b+wV1eaNTajlosfkU5cb3Y0yMhIv7rxspps66TUjhfkmZz4+Om+/SrBYAFiL5CBd6
         c2nzfg3Gm1sjmakbnX3+qwUPq63sRT7LbTt9oe0ZtG6x4zhrMJ381W4+VNg3rJv5nj+r
         fLs7uDUDZbkY/qtE2amHvpjIlqyS24mNtCydKSM4nnJjmjEqEfHwqyJyqUAinBYo33x1
         BpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728646377; x=1729251177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=az4hS+NK8zBr5UCFhRFct2ksVmIL42/RJE4tgtHk2Hg=;
        b=cUHgrogMhxfZTP0MOB8OOStOo27T/RPt+E1dxlnlIbPyMzsmIv4xzcoOgb6z2QDVGg
         bnf8Sxlu38BAjsByekReSgo1TWaHBGHRvySNbRB7pQpBnN/yklrPn9zwhIOPNChKDrBZ
         QqLubn7iCCmCw6bQX72KpDzWM0uVfqRNgzukcyTDr8cqJln7hqLEBFq7I6d+C4MCTxub
         t9Tbgf8HV6EfCsMrUoMTy97ehxKbMkaf/sV2S3uw/1N6XobvP6hgMGB7pidaD5fpgR1o
         KIgYuaFzKwnh62Zps19tpZ5ZhrbZvTCM5gikyxvCpTib7itDIaja92bLfJmAonAX+hHi
         /kRA==
X-Forwarded-Encrypted: i=1; AJvYcCUbQMEDQpYc9u/MaGkBeHQtMhCb36f1EqxVK0f9MQZaQE888jalzSIY8H2GZpDacJcKjGCTcjjfCmHxTrk=@lists.infradead.org, AJvYcCUtK8EAUGcD/WQBkK/p20lLxMkRdZcsEOENKqfXTyeVOXdAR7wC+bhP0up3RJ9oezmw478Rh+1UWuUny/OglKWX@lists.infradead.org
X-Gm-Message-State: AOJu0YzSVkFy126br5XWBK0gVwh6bu1VWqHIx44phJYUgXYv7COae0vP
	Y15/WpqAeP4FZddd/aSBW9tkY/+h3Zz5J5R5GlduB8/WNnTjQF0xPumPHEcw90lwEAIQEbTt0Qk
	P76yeafDfEX/1e+RgFqxSgMRPegs=
X-Google-Smtp-Source: AGHT+IECMXVvn0oo1MNjapLxNu2xErXjaCUcD29N0fsc68U7YJSRkD+W8Re/vBWLXWMsFfWDHfD0zZ1hSdE8Z8CiYOg=
X-Received: by 2002:a05:6a00:3e1d:b0:714:2051:89ea with SMTP id
 d2e1a72fcca58-71e37e25dedmr1609379b3a.1.1728646377173; Fri, 11 Oct 2024
 04:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
 <ZwbAvEnrzu6UUgGl@J2N7QTR9R3> <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
 <ZwewMw8jBh6OU-L_@J2N7QTR9R3> <20241010110344.GL14587@noisy.programming.kicks-ass.net>
 <20241010113748.GL33184@noisy.programming.kicks-ass.net> <CANiq72=kT9RFcQ3h5U+wAY0pDQQqGU7BTtiPJ-oiHNUG00z3=w@mail.gmail.com>
 <20241010130421.GG17263@noisy.programming.kicks-ass.net> <CANiq72kbApTtdLeow5L6G6t4Q_L-0zkDwfwyWcSb_e6P=kO06g@mail.gmail.com>
 <20241011105136.GP17263@noisy.programming.kicks-ass.net>
In-Reply-To: <20241011105136.GP17263@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 11 Oct 2024 13:32:44 +0200
Message-ID: <CANiq72mYEbGxFZHQ_vfHTybuYO62As-23VR9yASo-b4LcZ_pkg@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alice Ryhl <aliceryhl@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_043258_281586_0A97579C 
X-CRM114-Status: GOOD (  10.84  )
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

T24gRnJpLCBPY3QgMTEsIDIwMjQgYXQgMTI6NTHigK9QTSBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6
QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gU28geW91IGNvdWxkIGp1c3QgY29weSB0aGUgYml0
cyBmcm9tIGNvcmUgeW91IG5lZWQgaW50byB0aGUga2VybmVsIHRyZWUKPiBhbmQgbGVhdmUgb3V0
IHRob3NlIGJpdHMgeW91IGRvIG5vdCwgYW5kIG9jYXNzaW9uYWxseSB1cGRhdGUgdGhlbSB3aGVu
Cj4gbmVlZGVkLCByaWdodD8KClllcywgYnV0IGluIHByYWN0aWNlIGl0IGlzIGEgc3Vic3RhbnRp
YWwgYW1vdW50IG9mIG5vbi10cml2aWFsIGNvZGUgdG8KbWFpbnRhaW4gYW5kIHNvbWUgb2YgaXQg
aXMgdG9vIHRpZWQgdG8gdGhlIGNvbXBpbGVyIChlLmcuIHVzaW5nCmNvbXBpbGVyIGludGVybmFs
IGZlYXR1cmVzKSwgdGh1cyBpdCB3b3VsZCBsaWtlbHkgcmVxdWlyZSBtYWludGFpbmluZwpzZXZl
cmFsIHZhcmlhdGlvbnMgaW4tdHJlZSB0byBtYWtlIGl0IHdvcmsgYWNyb3NzIGNvbXBpbGVyIHZl
cnNpb25zLgoKTWF5YmUgd2hlbiBrZXJuZWwgaGFzIGJlZW4gY29tcGlsaW5nIHdpdGggc3RhYmxl
IFJ1c3QgZm9yIGEgd2hpbGUsIGFuZAplc3BlY2lhbGx5IGlmIGBjb3JlYCBpcyBzcGxpdCBpbnRv
ICJyZWFsbHkgdGllZCB0byB0aGUgY29tcGlsZXIiIGFuZAoidGhlIHJlc3QiLCB3ZSBjb3VsZCBj
b25zaWRlciBzb21ldGhpbmcgbGlrZSB0aGF0LiBQZXJzb25hbGx5IEkgd291bGQKbGlrZSB0byBi
ZSBpbiBhIHBvc2l0aW9uIHdoZXJlIHdlIGNhbiB0cnkuIFBlcmhhcHMgaXQgY291bGQgZXZlbiBo
ZWxwCnRvIHNpbXBsaWZ5IGdjY3JzJyBsaWZlIGNvbXBpbGluZyBhIHNtYWxsZXIgYGNvcmVgLgoK
RXZlbiB0aGVuLCB3ZSB3b3VsZCBuZWVkIHRvIHNlZSB3aGV0aGVyIHRoZSB0cmFkZW9mZiBpcyB3
b3J0aCBpdDogd2UKbWF5IGJlIGFibGUgdG8gY3VzdG9taXplIGBjb3JlYCBoZXJlIGFuZCB0aGVy
ZSwgeWVzLCBidXQsIGZvcgppbnN0YW5jZSwgd2UgY291bGQgbG9zZSB0aGUgYWJpbGl0eSB0byBl
YXNpbHkgaW1wb3J0IG90aGVyIGNvZGUgb3V0CnRoZXJlICh2aXJ0dWFsbHkgYWxsIFJ1c3QgY29k
ZSB1c2VzIGBjb3JlYCkuCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
