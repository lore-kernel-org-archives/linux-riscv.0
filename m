Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D364BC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 11:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+kkuXEgD6IxBon1EGrxG08ykX4CIhx/0FymPEOEkU00=; b=AQeFHFlr5zLvyT
	vhoAQlUdzPUUyh3q+5q2jLm/6269mJsu6+Bk7Fh/aGlrXsb5eVhLopyrByys1ui89AYNw02lpGRk9
	SlmsQXUl/h10hrXrOL6lDOywQ7xUAliVXScmksPXZNFdFI6d1v2YMgvRvAAjgp3nDw8LqMiUekC/1
	drFRi4OLAp93mvk8+uk5S6o2GojRU8xeVc2YmPR1TVUtyY47Hh9WM/ygS/v6EZ/Imb10gT4kM4Ctk
	wbvcBZwENbb4AtiVhqvDcIR+WBm8eeNKIVkIhte9v1ZK9OTtr1Y7vCqeIfHeJ9SWjfhCrG3CawzDr
	8Li6DafHDUx6raqXOnYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZqD4-00000008e3p-3qQQ;
	Fri, 02 Aug 2024 11:12:34 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZqD2-00000008e2s-0yao
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 11:12:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42817bee9e8so50135615e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 04:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722597151; x=1723201951; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NckEZuTbgzBxmHzYz0RgKDaRsejCSb0E4WOQCnSKCEw=;
        b=CPRagES8KdNfXz1zmhxvh5TAvDxGE+EvNNiOdR9zCi5R7spWTj5zLi+4lnnjPpoWuJ
         rouza9Pjg+5Jih+K4IkYUIB/bCKurQHyDXuJ6v3ULkAkJCytKhocng25FVQ2A21xiqY/
         VYWxNWAZ1/FPikDejHDxqli18IMVWNipeBx3h6jaIIXpGhiqZd+FPJcXqf5QoT2GHO9u
         FYnaf/44KAUaoRyzYwJWvoxUBPMIAZM0vC+WOX0HrAZJ6bbnkVVjWL5hUj2IMs0o440U
         1es8VFPtk2xvOlvfD3OzgHL2OCXt2tA1lyemgF/MSiwWLFqhz8coCVHrmRn0FCoyf4hx
         63CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722597151; x=1723201951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NckEZuTbgzBxmHzYz0RgKDaRsejCSb0E4WOQCnSKCEw=;
        b=Em19HIzSPZz2TkZ9VMK/2pbGD6cXZbLmdOzjTAac1aAt9Tn1yxXy/1kgUp5l2nGH6h
         ogl1JYVdorzfNtPGrYRE+8Ct6MZNkL4tKc+PJA07VOumWlaFQfIfqnIAsTRuU4XFdW77
         uWAb2EAU8gIcZcsb0ZJemuIhueix1wiiglgUZ4I31OQyes7b27pVQs+yMMrGIP0iFO+E
         hcWf3ZljGynCMWD4J1z1qYUD00umcANZjFOxuoa7HPoAYRc1m8Wsd4JgzlnM5yLZBZV2
         vCebnpRu9DdAUGIcXeHK+/ND4ZB/zhDrp0t+2hOWhMV21LStJ9U44tJ3ADg7UcH8pL6a
         LKNg==
X-Forwarded-Encrypted: i=1; AJvYcCVfhjUyVEGrM8oCsxLuaUx07c8NlcEYAEY8HZ8BJItwghlZ3jvRDMGjajjHOaUNxZFpTIe6aMSmNkrCGlMk8537RS2aQWsVvhfJ7Dc+eOwn
X-Gm-Message-State: AOJu0YyOmgcO2BEAEVFVNSY58qJU9V+/e8TOHkL42KAiLBgm3Rj085VE
	cuuKuUnYxMDynMu3C71v9GCDFSWsnVJumC2BfBjI5znN28WzN8deAxRDwpTjqI8JhSMp8QwsU2/
	BOgGspPg5qa9AOncfvzwYmDLAEOnwOGXDaxx3
X-Google-Smtp-Source: AGHT+IHG8YT0Tl3r67jSeYzzG/u+IjzVWq2bWRMReS90gVbkEE3+W7//BJg0NubXE694omwJobmhmLbd7NfxN4kakP4=
X-Received: by 2002:a5d:4003:0:b0:368:4edc:611e with SMTP id
 ffacd0b85a97d-36bbc0db7c9mr1721957f8f.14.1722597150322; Fri, 02 Aug 2024
 04:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240802-tracepoint-v5-0-faa164494dcb@google.com>
 <20240802-tracepoint-v5-1-faa164494dcb@google.com> <20240802093954.GH39708@noisy.programming.kicks-ass.net>
In-Reply-To: <20240802093954.GH39708@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 2 Aug 2024 13:12:17 +0200
Message-ID: <CAH5fLggBRBOrGb_2RLP=tFyGeiMmkH+86F-d0Pidv5z-shZ8Vg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: add static_key_false
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
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
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev, 
	WANG Rui <wangrui@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_041232_296641_875B4DEC 
X-CRM114-Status: GOOD (  30.64  )
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

T24gRnJpLCBBdWcgMiwgMjAyNCBhdCAxMTo0MOKAr0FNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEF1ZyAwMiwgMjAyNCBhdCAwOTozMToy
N0FNICswMDAwLCBBbGljZSBSeWhsIHdyb3RlOgo+ID4gQWRkIGp1c3QgZW5vdWdoIHN1cHBvcnQg
Zm9yIHN0YXRpYyBrZXkgc28gdGhhdCB3ZSBjYW4gdXNlIGl0IGZyb20KPiA+IHRyYWNlcG9pbnRz
LiBUcmFjZXBvaW50cyByZWx5IG9uIGBzdGF0aWNfa2V5X2ZhbHNlYCBldmVuIHRob3VnaCBpdCBp
cwo+ID4gZGVwcmVjYXRlZCwgc28gd2UgYWRkIHRoZSBzYW1lIGZ1bmN0aW9uYWxpdHkgdG8gUnVz
dC4KPiA+Cj4gPiBJdCBpcyBub3QgcG9zc2libGUgdG8gdXNlIHRoZSBleGlzdGluZyBDIGltcGxl
bWVudGF0aW9uIG9mCj4gPiBhcmNoX3N0YXRpY19icmFuY2ggYmVjYXVzZSBpdCBwYXNzZXMgdGhl
IGFyZ3VtZW50IGBrZXlgIHRvIGlubGluZQo+ID4gYXNzZW1ibHkgYXMgYW4gJ2knIHBhcmFtZXRl
ciwgc28gYW55IGF0dGVtcHQgdG8gYWRkIGEgQyBoZWxwZXIgZm9yIHRoaXMKPiA+IGZ1bmN0aW9u
IHdpbGwgZmFpbCB0byBjb21waWxlIGJlY2F1c2UgdGhlIHZhbHVlIG9mIGBrZXlgIG11c3QgYmUg
a25vd24KPiA+IGF0IGNvbXBpbGUtdGltZS4KPiA+Cj4gPiBPbmUgZGlzYWR2YW50YWdlIG9mIHRo
aXMgcGF0Y2ggaXMgdGhhdCBpdCBpbnRyb2R1Y2VzIGEgZmFpciBhbW91bnQgb2YKPiA+IGR1cGxp
Y2F0ZWQgaW5saW5lIGFzc2VtYmx5LiBIb3dldmVyLCB0aGlzIGlzIGEgbGltaXRlZCBhbmQgdGVt
cG9yYXJ5Cj4gPiBzaXR1YXRpb246Cj4gPgo+ID4gMS4gTW9zdCBpbmxpbmUgYXNzZW1ibHkgaGFz
IG5vIHJlYXNvbiB0byBiZSBkdXBsaWNhdGVkIGxpa2UgdGhpcy4gSXQgaXMKPiA+ICAgIG9ubHkg
bmVlZGVkIGhlcmUgZHVlIHRvIHRoZSB1c2Ugb2YgJ2knIHBhcmFtZXRlcnMuCj4gPgo+ID4gMi4g
QWxpY2Ugd2lsbCBzdWJtaXQgYSBwYXRjaCBhbG9uZyB0aGUgbGluZXMgb2YgWzFdIHRoYXQgcmVt
b3ZlcyB0aGUKPiA+ICAgIGR1cGxpY2F0aW9uLiBUaGlzIHdpbGwgaGFwcGVuIGFzIGEgZm9sbG93
LXVwIHRvIHRoaXMgcGF0Y2ggc2VyaWVzLgo+Cj4gWW91J3JlIHRhbGtpbmcgYWJvdXQgeW91cnNl
bGYgaW4gdGhlIDNyZCBwZXJzb24/CgpJJ20gbm90IHN1cmUgaWYgY29tbWl0IG1lc3NhZ2VzIGFy
ZSBzdXBwb3NlZCB0byBiZSBhIHBlcnNvbmFsIG1lc3NhZ2UKZnJvbSBtZSwgb3IgYW4gaW1wZXJz
b25hbCBkZXNjcmlwdGlvbiBvZiB0aGUgcGF0Y2guIEknbSBoYXBweSB0bwpyZXdvcmQuCgo+IFdo
YXQncyB0aGUgcnVzaCwgd2h5IG5vdCBkbyBpdCByaWdodCBmaXJzdD8KCldlbGwgZm9yIG9uZSwg
dGhpcyB2ZXJzaW9uIG9mIHRoZSBzZXJpZXMgbW9zdGx5IGp1c3QgbWFrZXMgY2hhbmdlcyB0bwp0
aGUgc2Vjb25kIHBhdGNoLgoKQnV0IGFsc28sIG1heWJlIEknbSBiZWluZyB0b28gYWdncmVzc2l2
ZSBhYm91dCBpdCwgYnV0IEkgaGF2ZSBsYXJnZQphbW91bnRzIG9mIG91dC1vZi10cmVlIGNvZGUg
dGhhdCBJJ3ZlIGJlZW4gd29ya2luZyBvbiB1cHN0cmVhbWluZywgYW5kCml0J3MgYSBsb3Qgb2Yg
d29yayB0byBrZWVwIGl0IGFsbCB1cC10by1kYXRlIGFuZCByZWJhc2VkLiBJIHdhbnQgdG8KcmVk
dWNlIGl0IGFzIG11Y2ggYXMgSSBjYW4uIEkgd2FzIGhvcGluZyB0aGF0IEkgY291bGQgZ2V0IHRo
ZSBjaGFuZ2VzCnRvIGluY2x1ZGUvbGludXgvdHJhY2Vwb2ludC5oIG9mZiBteSBwbGF0ZSwgZXZl
biBpZiBtb3JlIHdvcmsgaXMKbmVlZGVkIG9uIHRoZSBzdGF0aWNfa2V5IHNpZGUgb2YgdGhpbmdz
LgoKQWxpY2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
