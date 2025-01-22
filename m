Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E87C02182
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 01:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Cg7rLAaG8qFRQMQm9sqWDnjfXuRtwZRX5LX9R0Fmf/8=; b=D17h3oEzZNuIVK620SHRLnWBri
	iQ2t6ebfzp1DZrQjmjPpAClBOaIqmbOy39IjaZ/DsvQ4Td4mcDrBCLEuwNNfKZodVKqsUdCS1d/2s
	LAufoDh69C2cHD6LdNLJQVGTMhjppO23xfQmuh8TQrdFjIbwKaNpB7o+n8Rs17mHs4IdzWUJe2Jqb
	lcsyiogdu1sAextgOy5tCIc7kKlfCzvEaAxRy/WSZTSf5t9J+PJQstVzF+VE9YwGIMnmYzPkvSiev
	WCppqKMVIrqBhFzdmNo/X6/nIUvnhy0YUUUsUQCu0BdUftiMX1m0tztdwzNMpRbQvAFZRwWZ8aEAT
	QsWZvQKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taPAA-000000098aX-2QGe;
	Wed, 22 Jan 2025 01:04:10 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taPA6-000000098Ya-3waC
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 01:04:09 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2163dc0f5dbso122788405ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jan 2025 17:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737507846; x=1738112646; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGAInSW7+q0vU97QD0HUaaeZu0zheatXMugXZrnQnto=;
        b=Bhvb220YA9Fp/M7mLaExeFxWWsvYqEDrbluIN0t9WhmcmRCnGaJynh7nQwAQpTigdD
         xfDaxDfRBB/267oNho4xieeMV9xtHO/AJxXyZ2lGIYKtH+rlcMjqBlZXn61obVoC93qp
         DnBPyRgYLCsOrKiuoDdUEz49d1Fu87FAYtnILCO34qwk8EzeDDiG2jYVlDi8BrzmKL0w
         hZ1D/x9XX03Do8hU++2TPZfGIt0ASf/L6SXAdSCvVT4pgdMJ6j9y8K18M5Nsp3Tqtm8j
         KukN/8ahEqAaPaa2+cDui6yoVeSmlq7ZE1508p0cjBR1NfeDW/Jv0FWdeK30J4hEjv8I
         8jBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737507846; x=1738112646;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HGAInSW7+q0vU97QD0HUaaeZu0zheatXMugXZrnQnto=;
        b=KlPIxIWTarcK/2MMG3l3PNGNgcRQNi/jJADxxvnlqFnabs05DtOpK17BE/pDHKQCmR
         L83l5Rcu/SHrXjOvFHUmIGHGfqYvX+BB7mm+q2wtqeEiKlU6VmxwKxlmRAUiE0RvxobA
         4bC9tiSeXLPXm0kTV+oGF7+jHfXH1sai9al9dc7EnaS4kBnihDfLFMH8/cmY+uQ+xRy3
         1RSD/AZnlqGwKWgpxCkqNRSiMNYEGPoASJmuthTa2gKRuZyJ39AoT8O8roPZd7ZOkncU
         wnPSa5R5sjcfEERb8F0Yt/oLJtJAeDP0NDYvEkTIIg1YnDT2Pk8JE56o3pfSJoH/Vux9
         aYVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1jBiIYpx8YmxiW3FDewOEaOlDu8Wu1NouHD5XcWZSJqJlviRurDkNCSPVKQqYs27QG/F6uRQESKljyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4LKxONSN+AReHawsxWehXA0UMFM9/S37wNjIKypPwgm2RvzUr
	4gizp+SzUcgPUMXSQCJ8IL5NlRV44O8w5+we9NKs4/yDNACwRP11tD1kSmP4tIPKWi6VKwzO5Eh
	fXA==
X-Google-Smtp-Source: AGHT+IH6F+XmsAOl9kzgOVOxBLRRXT62oJJbonrrKhR+qzEndDJ3UWVtcgPMx5PJJKXl4IX7nvimBDDp9aQ=
X-Received: from pfau14.prod.google.com ([2002:a05:6a00:aa8e:b0:72d:b2a2:bed7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6088:b0:72a:a9b5:ed91
 with SMTP id d2e1a72fcca58-72daf99ed03mr26365241b3a.13.1737507845610; Tue, 21
 Jan 2025 17:04:05 -0800 (PST)
Date: Tue, 21 Jan 2025 17:04:04 -0800
In-Reply-To: <Z5A6NPqVGoZ32YsN@pavilion.home>
Mime-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-23-vschneid@redhat.com>
 <Z5A6NPqVGoZ32YsN@pavilion.home>
Message-ID: <Z5BEBCWVWP_fq2zY@google.com>
Subject: Re: [PATCH v4 22/30] context_tracking: Exit CT_STATE_IDLE upon
 irq/nmi entry
From: Sean Christopherson <seanjc@google.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Valentin Schneider <vschneid@redhat.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, Juergen Gross <jgross@suse.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.amakhalov@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joel@joelfernandes.org>, 
	Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, 
	Yair Podemsky <ypodemsk@redhat.com>, Tomas Glozar <tglozar@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>, 
	Nicolas Saenz Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Yosry Ahmed <yosryahmed@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_170406_969974_7024F272 
X-CRM114-Status: GOOD (  20.73  )
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

T24gV2VkLCBKYW4gMjIsIDIwMjUsIEZyZWRlcmljIFdlaXNiZWNrZXIgd3JvdGU6Cj4gTGUgVHVl
LCBKYW4gMTQsIDIwMjUgYXQgMDY6NTE6MzVQTSArMDEwMCwgVmFsZW50aW4gU2NobmVpZGVyIGEg
w6ljcml0IDoKPiA+IGN0X25taV97ZW50ZXIsIGV4aXR9KCkgb25seSB0b3VjaGVzIHRoZSBSQ1Ug
d2F0Y2hpbmcgY291bnRlciBhbmQgZG9lc24ndAo+ID4gbW9kaWZ5IHRoZSBhY3R1YWwgQ1Qgc3Rh
dGUgcGFydCBjb250ZXh0X3RyYWNraW5nLnN0YXRlLiBUaGlzIG1lYW5zIHRoYXQKPiA+IHVwb24g
cmVjZWl2aW5nIGFuIElSUSB3aGVuIGlkbGUsIHRoZSBDVF9TVEFURV9JRExFLT5DVF9TVEFURV9L
RVJORUwKPiA+IHRyYW5zaXRpb24gb25seSBoYXBwZW5zIGluIGN0X2lkbGVfZXhpdCgpLgo+ID4g
Cj4gPiBPbmUgY2FuIG5vdGUgdGhhdCBjdF9ubWlfZW50ZXIoKSBjYW4gb25seSBldmVyIGJlIGVu
dGVyZWQgd2l0aCB0aGUgQ1Qgc3RhdGUKPiA+IGFzIGVpdGhlciBDVF9TVEFURV9LRVJORUwgb3Ig
Q1RfU1RBVEVfSURMRSwgYXMgYW4gSVJRL05NSSBoYXBwZW5uaW5nIGluIHRoZQo+ID4gQ1RfU1RB
VEVfVVNFUiBvciBDVF9TVEFURV9HVUVTVCBzdGF0ZXMgd2lsbCBiZSByb3V0ZWQgZG93biB0byBj
dF91c2VyX2V4aXQoKS4KPiAKPiBBcmUgeW91IHN1cmU/IEFuIE5NSSBjYW4gZmlyZSBiZXR3ZWVu
IGd1ZXN0X3N0YXRlX2VudGVyX2lycW9mZigpIGFuZAo+IF9fc3ZtX3ZjcHVfcnVuKCkuCgpIZWgs
IHRlY2huaWNhbGx5LCB0aGV5IGNhbid0LiAgT24gU1ZNLCBLVk0gY2xlYXJzIEdJRiBwcmlvciB0
byBzdm1fdmNwdV9lbnRlcl9leGl0KCksCmFuZCByZXN0b3JlcyBHSUY9MSBvbmx5IGFmdGVyIGl0
IHJldHVybnMuICBJLmUuIE5NSXMgYXJlIGZ1bGx5IGJsb2NrZWQgX29uIFNWTV8uCgpWTVggdW5m
b3J0dW5hdGVseSBkb2Vzbid0IHByb3ZpZGUgR0lGLCBhbmQgc28gTk1JcyBjYW4gYXJyaXZlIGF0
IGFueSB0aW1lLiAgSXQncwppbmZlYXNpYmxlIGZvciBzb2Z0d2FyZSB0byBwcmV2ZW50IHRoZW0s
IHNvIHdlJ3JlIHN0dWNrIHdpdGggdGhhdC4gIFtJbiB0aGVvcnksCktWTSBjb3VsZCBkZWxpYmVy
YXRlbHkgZ2VuZXJhdGUgYW4gTk1JIGFuZCBub3QgZG8gSVJFVCBzbyB0aGF0IE5NSXMgYXJlIGJs
b2NrZWQsCmJ1dCB0aGF0IHdvdWxkIGJlIGJleW9uZCBjcmF6eV0uCgo+IEFuZCBOTUlzIGludGVy
cnVwdGluZyB1c2Vyc3BhY2UgZG9uJ3QgY2FsbCBlbnRlcl9mcm9tX3VzZXJfbW9kZSgpLiBJbiBm
YWN0Cj4gdGhleSBkb24ndCBjYWxsIGlycWVudHJ5X2VudGVyX2Zyb21fdXNlcl9tb2RlKCkgbGlr
ZSByZWd1bGFyIElSUXMgYnV0Cj4gaXJxZW50cnlfbm1pX2VudGVyKCkgaW5zdGVhZC4gV2VsbCB0
aGF0J3MgZm9yIGFyY2hzIGltcGxlbWVudGluZyBjb21tb24gZW50cnkKPiBjb2RlLCBJIGNhbid0
IHNwZWFrIGZvciB0aGUgb3RoZXJzLgo+IAo+IFVuaWZ5aW5nIHRoZSBiZWhhdmlvdXIgYmV0d2Vl
biB1c2VyIGFuZCBpZGxlIHN1Y2ggdGhhdCB0aGUgSVJRcy9OTUlzIGV4aXQgdGhlCj4gQ1RfU1RB
VEUgY2FuIGJlIGludGVyZXN0aW5nIGJ1dCBJIGZlYXIgdGhpcyBtYXkgbm90IGNvbWUgZm9yIGZy
ZWUuIFlvdSB3b3VsZAo+IG5lZWQgdG8gc2F2ZSB0aGUgb2xkIHN0YXRlIG9uIElSUS9OTUkgZW50
cnkgYW5kIHJlc3RvcmUgaXQgb24gZXhpdC4KPiAKPiBEbyB3ZSByZWFsbHkgbmVlZCBpdD8KPiAK
PiBUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
