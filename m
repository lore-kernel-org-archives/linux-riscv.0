Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427E5CFD352
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 11:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9f1uaYPA6SPXwJ/FPDNzAYIpe7tMylNLRD1HPVf+jG4=; b=rZR3l2dBhID9oc
	1rzF3x4/8ibtpgXKIXV1TsLKfo6cbhwMOqXmiDd2DO3c0OB8wuMrTU4OqTqcyrESAryEXcKP3h54A
	k8MYA4MEaRklWdongFsHDpjUkunApAI3K499VkwypWJtGUwVIYQ9334GAI1KQnCMG0sEbLgm//pr+
	Z6RZSaaPwNsYAZjcnke57fNJ7AKBcH9nAOtPsg8/LJKDuGRRRS0xrbUbwdC4SlisQAN1bRQSAI1ds
	53xQAYinEzmd6KtNQTar64xQRaG50mGcJBcYq76cb2zdR34CrMJNfDxgXEWTD4RpkCoOzDXQoGrwg
	YVdI7iP04KrNIqtwXW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szDrq-0000000G8rJ-3F3S;
	Fri, 11 Oct 2024 11:31:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szChE-0000000Fwpy-1GVD
	for linux-riscv@bombadil.infradead.org;
	Fri, 11 Oct 2024 10:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VnRcOvG00eDk9unXV1hgFBknglSVE5O1qDH//99Y1Rw=; b=enyK9gF9DTL6l2xJQNmFId7tOw
	cW9QqnBwex0Nhe31X85Zmg2DqTVHaY5ao7jH09JNRp3s4iX2FWGRHdnfSKYTG28Y3/L8zIQmsFrrk
	KlH3+xka4ywrxBh4Bp7dBi83KUV3fPTRI03ydmzJph/iR2+PC7oqh7n3wcyyDDkQHn2AGzyriqktY
	yneqbMl4N0G7tH0oA+FYI+p1Jpy6+B5glsgm3gH5ZMBjuLQolmBJPgJj0T57yQVnSptMGn4JwmlNU
	hiXRPMToWfdUOFBq/nR6YUSE9sPG97OSUbidhMiocXwqTL41EAj0rHkQ/JJXZaMluLhSfySpwqhpX
	A6yqmvLA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szCh9-00000005qEz-2ArW
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 10:16:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43057f4a16eso16115795e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 03:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728641785; x=1729246585; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnRcOvG00eDk9unXV1hgFBknglSVE5O1qDH//99Y1Rw=;
        b=FAhhRFaex3mONWZ7eniIdp0W4Hwf+ZlMqxxJ1tV/SmvScZ9DMz41wFMSvo8ES3vK5H
         rzE4QJpv/IKyz8xajNXJFWpa+ZVjgA2yGlqaI891zCCLhFyZRxaY6AFFzYSOEegffDd9
         rN/JyX6gnQIWB7+Qz7gek6L0mOo6HKtI+UJbqP/pMgI6wt+53KvFhykWOG8N3vX5sK/T
         wNgR+b0pJn5KUa7Gqt0MSQ+Gr052GGm71VeA8xaBeFK9jvUqUNf7uBI9+zY5zteSCZqY
         6EDPFFnoSsmseLqFEIY7jk3QHHddmfUyxyqXgWSdEvMdqEFKqkQR0cb4KSApqduWcmyc
         Xhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728641785; x=1729246585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnRcOvG00eDk9unXV1hgFBknglSVE5O1qDH//99Y1Rw=;
        b=fvjz6dRXXqWSEyY4CtFZl7v2ebu+r2muAR5Po0yjZgSk1NYDb1r1CZrxea+u/lKaF0
         7p0i3o3Eb0bmP7K2L3wrbQoaor8SGAZfVUI2gdLHTP3fVU5aWCcZbl2a/8H2K2xHEljp
         78LeqX1hXtBACLNo64aGtjzVDN5kk7eJhb2CDpSAw0NmbxNMrp41mPka2gFYE55s3z4A
         SCl7caU9KvyGJxfh7WAjY396/UWg7eUJ0CvLTrDqSNjTlwDLtu/s0EqFOFGhmwR8Gu0o
         Kg0h0/5yzcgJg+sXRP+UZHnTRYPM2hJ00SAn8/XKYNBJM1iieEfxpERmxegDs/e47/TJ
         bCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhPcvcH0sQYOMwS6cTBDrPnegqC4mnUbFBQryF3ruZZ/vz0BKhU5Q22SENdODhwSYkqdeN+k89TQGpmA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5RmF2yF/xkax1j3cmDLqMRkaYlO12dsyiwsOiCTcoTnnt0n6g
	YE2Um2QRr7dvJOTG1l1PXow27Qay3rB3GXHjJFPThTj/mMNYQSu17XW8gGM1JBxxObB3UBASzwv
	PKyNKCEw253kdBc1NeepV2YzmKIo7VcajrNVZ
X-Google-Smtp-Source: AGHT+IGMNjtCG9rpECyAAco9DzsrUijuUFkuK2ogFVx/VRCgWggYYygWbJym2kgBDSGBNFLXnFb7cUmfBa/gllnaBLs=
X-Received: by 2002:a05:600c:4e8a:b0:42c:af06:718 with SMTP id
 5b1f17b1804b1-4311df435e7mr16515715e9.28.1728641784578; Fri, 11 Oct 2024
 03:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
 <20241001-tracepoint-v9-1-1ad3b7d78acb@google.com> <20241001211543.qdjl4pyfhehxqfk7@treble>
 <20241010154320.6d17ba69@gandalf.local.home>
In-Reply-To: <20241010154320.6d17ba69@gandalf.local.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Oct 2024 12:16:10 +0200
Message-ID: <CAH5fLgiW-AEN-YN3YoW66hV2w6eEP03OC4oefg0N-tdwyLx8cA@mail.gmail.com>
Subject: Re: [PATCH v9 1/5] rust: add generic static_key_false
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
X-CRM114-CacheID: sfid-20241011_111627_697357_6FE06A6F 
X-CRM114-Status: GOOD (  19.60  )
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

T24gVGh1LCBPY3QgMTAsIDIwMjQgYXQgOTo0M+KAr1BNIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0
QGdvb2RtaXMub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgMSBPY3QgMjAyNCAxNDoxNTo0MyAtMDcw
MAo+IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUBrZXJuZWwub3JnPiB3cm90ZToKPgo+ID4gT24g
VHVlLCBPY3QgMDEsIDIwMjQgYXQgMDE6Mjk6NThQTSArMDAwMCwgQWxpY2UgUnlobCB3cm90ZToK
PiA+ID4gQWRkIGp1c3QgZW5vdWdoIHN1cHBvcnQgZm9yIHN0YXRpYyBrZXkgc28gdGhhdCB3ZSBj
YW4gdXNlIGl0IGZyb20KPiA+ID4gdHJhY2Vwb2ludHMuIFRyYWNlcG9pbnRzIHJlbHkgb24gYHN0
YXRpY19rZXlfZmFsc2VgIGV2ZW4gdGhvdWdoIGl0IGlzCj4gPiA+IGRlcHJlY2F0ZWQsIHNvIHdl
IGFkZCB0aGUgc2FtZSBmdW5jdGlvbmFsaXR5IHRvIFJ1c3QuCj4gPgo+ID4gSW5zdGVhZCBvZiBl
eHRlbmRpbmcgdGhlIG9sZCBkZXByZWNhdGVkIHN0YXRpYyBrZXkgaW50ZXJmYWNlIGludG8gUnVz
dCwKPiA+IGNhbiB3ZSBqdXN0IGNoYW5nZSB0cmFjZXBvaW50cyB0byB1c2UgdGhlIG5ldyBvbmU/
Cj4gPgo+ID4gL21lIG1ha2VzIGEgbm90ZSB0byBnbyBjb252ZXJ0IHRoZSBvdGhlciB1c2Vycy4u
Lgo+ID4KPiA+IEZyb206IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUBrZXJuZWwub3JnPgo+ID4g
U3ViamVjdDogW1BBVENIXSB0cmFjZXBvaW50czogVXNlIG5ldyBzdGF0aWMgYnJhbmNoIEFQSQo+
ID4KPiA+IFRoZSBvbGQgc3RhdGljIGtleSBBUEkgYmFzZWQgb24gJ3N0cnVjdCBzdGF0aWNfa2V5
JyBpcyBkZXByZWNhdGVkLgo+ID4gQ29udmVydCB0cmFjZXBvaW50cyB0byB1c2UgdGhlIG5ldyBB
UEkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9lQGtlcm5l
bC5vcmc+Cj4KPiBBbGljZSwKPgo+IENhbiB5b3Ugc2VuZCBhIHYxMCB3aXRoIHRoZSBhZGRlZCBh
Y2tzIGFuZCB3aGl0ZXNwYWNlIGZpeGVzIGFzIHdlbGwgYXMKPiB1c2luZyBzdGF0aWNfYnJhbmNo
X3VubGlrZWx5KCksIGFuZCBJJ2xsIHB1bGwgaXQgaW50byBteSB0cmVlLgo+Cj4gQmFzZSBpdCBv
ZmYgb2YgdjYuMTItcmMyLgoKSGVyZSB5b3UgZ286Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI0MTAxMS10cmFjZXBvaW50LXYxMC0wLTdmYmRlNGQ2YjUyNUBnb29nbGUuY29tLwoKQWxp
Y2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
