Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB751C36008
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 18:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZpAdNHGoHZ26s2nmOm7IJ+c8ppQxwtyMqhOCqePWMXc=; b=K8YPD8GF52B/xA
	4VEmHPO7mjAGvIBOqFLtoW9sKgDnMB47lDlTDQ4pqipu0LIciyfS4KC5h32SaOS5qyGshK3JbiTI3
	vYikY0uLOo7OYy456pEeiC2N3DzyasICciBUl4ZYmOEFNgW4eF7Pi1eewPIaB3tGfhJTZCTPm5K5o
	z2DpHBEIgrALMpMZOx3z3fHkIe4WBGYGY5ZAe33/yw2P7v7pCZZr2DU7yJAon8EM7xQ9tPi95Gty2
	AY8IDaHyh/+mZZ2lNzL95hCXfab+P8s3y1XIi723ceCIrgOXP2mWGh04GKq41dnLuusT1JdEXs3T6
	d2zYBEcLyC8fe2Ja6OcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9Fn-00000006kdd-0cl3;
	Tue, 25 Mar 2025 18:43:59 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9EL-00000006kMh-0cYs
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 18:42:31 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e50bae0f5bso2012a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 11:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742928147; x=1743532947; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohWbm/UuIc3MDUKHoYt0YitrpdOZotQW09VJZwN6f+A=;
        b=BdxUkCnSO6TLKuDnIUsW/ujTe7WuMSsH/L1C0xRaAPzxv2cdqXgFUDXDxj1DJk9S+v
         hRb/Y9hpZc70Zoq41u8gpu/Aekl+s3IV7ZWfTtfMDva0fSwaDc95M7yhhCh/YLz7pM+u
         b+63JLdeGJcyxRRMXpXhEnsFEY5G9qqaIXwOf/fzZxw8YFYz0VbQv3FrA+uVp7Nzurtn
         OxSQLac7ADrpZ4egQeub7BywDfxUWYs6qSKnK9cEFNLv+HhBJIQ6b5apQd5LkBktxM9V
         cLw9gKTbu0S5zeIA1rRReRBhmt1ze8h9RodlRLsUKcITQbWH5hzWVI8VopYkaLVgQdvn
         b2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742928147; x=1743532947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohWbm/UuIc3MDUKHoYt0YitrpdOZotQW09VJZwN6f+A=;
        b=oBbM4FzvOA99aqLh4WZBQcH43SERlYVNwivH2wk91IjwIie225B5tdRUdQ0SU4QW6u
         GqELR/KX9/hEm6yfqyQ275M7DjSvE9SQ2rktktHGdrF7B3udEpy6U0RLjj/X+M7+NUWB
         plZKH5BnfHd1ks3IBwp2n/FNkhO63wOpz2SY8HIWmo1KCpJZyUbdU/ht/zdHfjilIY7d
         75JKEnECmWv89B/9fdfIyJkYB/smtJPD9WvMANeRDkgjh3/6yzPrh8XL7LX6/beOdCpt
         FYwiVKEnk+DBfdpKjclXHb/Y6gQOMd7Gzp689j2XDRyVxQPfTTt2NEgbaEJV3FxYTqF6
         HQbA==
X-Forwarded-Encrypted: i=1; AJvYcCVO8ojNYQlmmbrULKejTymmHkN0FSWnlLRUS+GJ22Yko+d1bSVUFR4IBgHoSLTAf4lj0Fnz3RIhlxB/0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRDFqP/skMUP7q20LXEfASSWBwgPV/ICNIEGKwisPflAdysrjs
	hNzF5iDH0s44ghC6vve2w3GtXbXI0s4qt9DRO/HsCFWcnyAuqatw3C8ZFtT5Qnwvo0cnclxdmid
	FC9DpiHjd25vE3EdkG0iG6Qpt4cq09I01LMZX
X-Gm-Gg: ASbGncupJG7kIhCx2V9S1ZfxLfmnM++gktllBDXGCls6n0lNS6oh2RuOAbBWSxEnQjS
	fMgnqcQqhoE0KxrEsZCD8Ztr+QRE9fAEofLLlVvLDQrkVlEOHZQ6MusnuZoI36Ot2aFssngXXVB
	W0Z706zn70iGlVYOcgEOV5O/c6X6v8Qvv8O+/Z7w1wsLQTEWu8P5dgpmrDUQM914Q5
X-Google-Smtp-Source: AGHT+IG/oxMHsUwCe/Pv38c6tGHW1E+mjtkA7yC/Fgzn+9xwryPNKquWqjWfGFAmY6c6RcrvuYp4RqLtrV1djsqY7q0=
X-Received: by 2002:a50:ed83:0:b0:5dc:ccb4:cb11 with SMTP id
 4fb4d7f45d1cf-5ed53ee96e9mr10451a12.4.1742928147101; Tue, 25 Mar 2025
 11:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
 <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <352317e3-c7dc-43b4-b4cb-9644489318d0@intel.com> <xhsmhjz9mj2qo.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <d0450bc8-6585-49ca-9cad-49e65934bd5c@intel.com> <xhsmhh64qhssj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <eef09bdc-7546-462b-9ac0-661a44d2ceae@intel.com> <xhsmhfrk84k5k.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <408ebd8b-4bfb-4c4f-b118-7fe853c6e897@intel.com> <xhsmhy0wtngkd.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
In-Reply-To: <xhsmhy0wtngkd.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
From: Jann Horn <jannh@google.com>
Date: Tue, 25 Mar 2025 19:41:49 +0100
X-Gm-Features: AQ5f1Jo2l3CP6X5vd0V2T3oskBTdoXupZsoP0HqqqOWE1sDQ_J5UAMa3wCMvDAw
Message-ID: <CAG48ez2bSh6=J8cXJhqYX=Y8pXcGsFgC05HsGcF0b1sJK2VH7A@mail.gmail.com>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer flush_tlb_kernel_range()
 targeting NOHZ_FULL CPUs
To: Valentin Schneider <vschneid@redhat.com>, Rik van Riel <riel@surriel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
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
	"Liang, Kan" <kan.liang@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, 
	Tomas Glozar <tglozar@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, Kees Cook <kees@kernel.org>, 
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
X-CRM114-CacheID: sfid-20250325_114229_232502_EC5117E8 
X-CRM114-Status: GOOD (  23.17  )
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

T24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgNjo1MuKAr1BNIFZhbGVudGluIFNjaG5laWRlciA8dnNj
aG5laWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gT24gMjAvMDIvMjUgMDk6MzgsIERhdmUgSGFuc2Vu
IHdyb3RlOgo+ID4gQnV0LCBob25lc3RseSwgSSdtIHN0aWxsIG5vdCBzdXJlIHRoaXMgaXMgd29y
dGggYWxsIHRoZSB0cm91YmxlLiBJZgo+ID4gZm9sa3Mgd2FudCB0byBhdm9pZCBJUElzIGZvciBU
TEIgZmx1c2hlcywgdGhlcmUgYXJlIGhhcmR3YXJlIGZlYXR1cmVzCj4gPiB0aGF0ICpETyogdGhh
dC4gSnVzdCBnZXQgbmV3IGhhcmR3YXJlIGluc3RlYWQgb2YgYWRkaW5nIHRoaXMgY29tcGxpY2F0
ZWQKPiA+IHBpbGUgb2Ygc29mdHdhcmUgdGhhdCB3ZSBoYXZlIHRvIG1haW50YWluIGZvcmV2ZXIu
IEluIDEwIHllYXJzLCB3ZSdsbAo+ID4gc3RpbGwgaGF2ZSB0aGlzIHNvZnR3YXJlICphbmQqIDk1
JSBvZiBvdXIgaGFyZHdhcmUgaGFzIHRoZSBoYXJkd2FyZQo+ID4gZmVhdHVyZSB0b28uCj4KPiBT
b3JyeSwgeW91J3JlIGdvaW5nIHRvIGhhdmUgdG8gZGVhbCB3aXRoIG15IGlnbm9yYW5jZSBhIGxp
dHRsZSBiaXQgbG9uZ2VyLi4uCj4KPiBXZXJlIHlvdSB0aGlua2luZyB4ODYgaGFyZHdhcmUgc3Bl
Y2lmaWNhbGx5LCBvciBzb21ldGhpbmcgZWxzZT8KPiBBSVVJIHRoaW5ncyBsaWtlIGFybTY0J3Mg
VExCSVZNQUxMRTFJUyBjYW4gZG8gd2hhdCBpcyByZXF1aXJlZCB3aXRob3V0IGFueQo+IElQSToK
Pgo+IEM1LjUuNzgKPiAiIiIKPiBUaGUgaW52YWxpZGF0aW9uIGFwcGxpZXMgdG8gYWxsIFBFcyBp
biB0aGUgc2FtZSBJbm5lciBTaGFyZWFibGUgc2hhcmVhYmlsaXR5IGRvbWFpbiBhcyB0aGUgUEUg
dGhhdAo+IGV4ZWN1dGVzIHRoaXMgU3lzdGVtIGluc3RydWN0aW9uLgo+ICIiIgo+Cj4gQnV0IGZv
ciAoYXQgbGVhc3QpIHRoZXNlIGFyY2hpdGVjdHVyZXM6Cj4KPiAgIGFscGhhCj4gICB4ODYKPiAg
IGxvb25nYXJjaAo+ICAgbWlwcwo+ICAgKG5vbi1mcmVlc2NhbGUgOHh4KSBwb3dlcnBjCj4gICBy
aXNjdgo+ICAgeHRlbnNhCj4KPiBmbHVzaF90bGJfa2VybmVsX3JhbmdlKCkgaGFzIGEgcGF0aCB3
aXRoIGEgaGFyZGNvZGVkIHVzZSBvZiBvbl9lYWNoX2NwdSgpLAo+IHNvIEFGQUlDVCBmb3IgdGhl
c2UgdGhlIElQSXMgd2lsbCBiZSBzZW50IG5vIG1hdHRlciB0aGUgaGFyZHdhcmUuCgpPbiBYODYs
IGJvdGggQU1EIGFuZCBJbnRlbCBoYXZlIHNvbWUgZmFpcmx5IHJlY2VudGx5IGludHJvZHVjZWQg
Q1BVCmZlYXR1cmVzIHRoYXQgY2FuIHNob290IGRvd24gVExCcyByZW1vdGVseS4KClRoZSBwYXRj
aCBzZXJpZXMKPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDIyNjAzMDEyOS41MzAz
NDUtMS1yaWVsQHN1cnJpZWwuY29tLz4KYWRkcyBzdXBwb3J0IGZvciB0aGUgQU1EIGZsYXZvcjsg
dGhhdCBzZXJpZXMgbGFuZGVkIGluIHRoZSBjdXJyZW50Cm1lcmdlIHdpbmRvdyAoaXQncyBwcmVz
ZW50IGluIHRoZSBtYWlubGluZSBnaXQgcmVwb3NpdG9yeSBub3cgYW5kIHNob3VsZApiZSBwYXJ0
IG9mIDYuMTUpLiBJIHRoaW5rIHN1cHBvcnQgZm9yIHRoZSBJbnRlbCBmbGF2b3IgaGFzIG5vdCB5
ZXQKYmVlbiBpbXBsZW1lbnRlZCwgYnV0IHRoZSBsaW5rZWQgcGF0Y2ggc2VyaWVzIG1lbnRpb25z
IGEgcGxhbiB0byBsb29rCmF0IHRoZSBJbnRlbCBmbGF2b3IgbmV4dC4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
