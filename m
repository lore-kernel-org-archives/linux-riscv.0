Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70C3C0219B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 14:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rlWLSlv0YsdNFGQB9JJ8fTnlMLLK5D5zWu5sU3Od7Nk=; b=IQLEcgirB+dTRl
	uHTpKFQTI59jQ1uXIjOXHq7KUeOTOLdg8XR0MB+4z25pX3LscA6/R4QbXwFOpVVLdqv5lmI6nAOW/
	WXXrlcUdoNQrizST5cpd1/jtdJfPPpDQFPa1KaHHhRnqU7zvwppHTtPD3yNsQe7gzwQiad1BUWSGB
	m0rjKQbqT/J1e3F+8kkRXD7VAxD30YiLspYLLdQ20+XwLaA8yRWD3eW2anJM1b2MlSyGUKMfjvFY/
	QG05L+wYo9NJCkcT+Zr87acRhCTr1atZ+Y5mH0On/DMKR2GJ7HECGyzJTPaghAiCsr42LWHT5LHHf
	uPchQo4HeIH6u5Ns1v2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqwm-000000043ul-26V5;
	Tue, 11 Feb 2025 14:09:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqrD-000000042oX-275O;
	Tue, 11 Feb 2025 14:03:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D37F113D5;
	Tue, 11 Feb 2025 06:03:43 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE72E3F6A8;
	Tue, 11 Feb 2025 06:03:10 -0800 (PST)
Date: Tue, 11 Feb 2025 14:03:08 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	linux-arch@vger.kernel.org, rcu@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Rong Xu <xur@google.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Jinghao Jia <jinghao7@illinois.edu>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer
 flush_tlb_kernel_range() targeting NOHZ_FULL CPUs
Message-ID: <Z6tYnOEBkOlT_ehp@J2N7QTR9R3>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
 <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_060323_640473_D8885E67 
X-CRM114-Status: GOOD (  39.39  )
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

T24gVHVlLCBGZWIgMTEsIDIwMjUgYXQgMDI6MzM6NTFQTSArMDEwMCwgVmFsZW50aW4gU2NobmVp
ZGVyIHdyb3RlOgo+IE9uIDEwLzAyLzI1IDIzOjA4LCBKYW5uIEhvcm4gd3JvdGU6Cj4gPiBPbiBN
b24sIEZlYiAxMCwgMjAyNSBhdCA3OjM24oCvUE0gVmFsZW50aW4gU2NobmVpZGVyIDx2c2NobmVp
ZEByZWRoYXQuY29tPiB3cm90ZToKPiA+PiBXaGF0IGlmIGlzb2xhdGVkIENQVXMgdW5jb25kaXRp
b25hbGx5IGRpZCBhIFRMQmkgYXMgbGF0ZSBhcyBwb3NzaWJsZSBpbgo+ID4+IHRoZSBzdGFjayBy
aWdodCBiZWZvcmUgcmV0dXJuaW5nIHRvIHVzZXJzcGFjZT8gVGhpcyB3b3VsZCBtZWFuIHRoYXQg
dXBvbgo+ID4+IHJlLWVudGVyaW5nIHRoZSBrZXJuZWwsIGFuIGlzb2xhdGVkIENQVSdzIFRMQiB3
b3VsZG4ndCBjb250YWluIGFueSBrZXJuZWwKPiA+PiByYW5nZSB0cmFuc2xhdGlvbiAtIHdpdGgg
dGhlIGV4Y2VwdGlvbiBvZiB3aGF0ZXZlciBsaWVzIGJldHdlZW4gdGhlCj4gPj4gbGFzdC1taW51
dGUgZmx1c2ggYW5kIHRoZSBhY3R1YWwgdXNlcnNwYWNlIGVudHJ5LCB3aGljaCBzaG91bGQgYmUg
ZmVhc2libGUKPiA+PiB0byB2ZXQ/IFRoZW4gQUZBSUNUIHRoZXJlIHdvdWxkbid0IGJlIGFueSB3
b3JrL2ZsdXNoIHRvIGRlZmVyLCB0aGUgSVBJCj4gPj4gY291bGQgYmUgZW50aXJlbHkgc2lsZW5j
ZWQgaWYgaXQgdGFyZ2V0cyBhbiBpc29sYXRlZCBDUFUuCj4gPgo+ID4gVHdvIGlzc3VlcyB3aXRo
IHRoYXQ6Cj4gCj4gRmlyc3RseSwgdGhhbmsgeW91IGZvciBlbnRlcnRhaW5pbmcgdGhlIGlkZWEg
Oi0pCj4gCj4gPiAxLiBJIHRoaW5rIHRoZSAiQ29tbW9uIG5vdCBQcml2YXRlIiBmZWF0dXJlIFdp
bGwgRGVhY29uIHJlZmVycmVkIHRvIGlzCj4gPiBpbmNvbXBhdGlibGUgd2l0aCB0aGlzIGlkZWE6
Cj4gPiA8aHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2N1bWVudGF0aW9uLzEwMTgxMS8wMTA0
L0FkZHJlc3Mtc3BhY2VzL0NvbW1vbi1ub3QtUHJpdmF0ZT4KPiA+IHNheXMgIldoZW4gdGhlIENu
UCBiaXQgaXMgc2V0LCB0aGUgc29mdHdhcmUgcHJvbWlzZXMgdG8gdXNlIHRoZSBBU0lEcwo+ID4g
YW5kIFZNSURzIGluIHRoZSBzYW1lIHdheSBvbiBhbGwgcHJvY2Vzc29ycywgd2hpY2ggYWxsb3dz
IHRoZSBUTEIKPiA+IGVudHJpZXMgdGhhdCBhcmUgY3JlYXRlZCBieSBvbmUgcHJvY2Vzc29yIHRv
IGJlIHVzZWQgYnkgYW5vdGhlciIKPiAKPiBTb3JyeSBmb3IgYmVpbmcgb2J0dXNlIC0gSSBjYW4g
dW5kZXJzdGFuZCBpbmNvbnNpc3RlbnQgVExCIHN0YXRlcyAob2xkIHZzCj4gbmV3IHRyYW5zbGF0
aW9ucyBiZWluZyBwcmVzZW50IGluIHNlcGFyYXRlIFRMQnMpIGR1ZSB0byBub3Qgc2VuZGluZyB0
aGUKPiBmbHVzaCBJUEkgY2F1c2luZyBhbiBpc3N1ZSB3aXRoIHRoYXQsIGJ1dCBub3QgImZsdXNo
aW5nIGVhcmx5Ii4gRXZlbiBpZiBUTEIKPiBlbnRyaWVzIGNhbiBiZSBzaGFyZWQvYWNjZXNzZWQg
YmV0d2VlbiBDUFVzLCBhIENQVSBzaG91bGQgYmUgYWxsb3dlZCBub3QgdG8KPiBoYXZlIGEgc2hh
cmVkIGVudHJ5IGluIGl0cyBUTEIgLSB3aGF0IGFtIEkgbWlzc2luZz8KPiAKPiA+IDIuIEl0J3Mg
d3JvbmcgdG8gYXNzdW1lIHRoYXQgVExCIGVudHJpZXMgYXJlIG9ubHkgcG9wdWxhdGVkIGZvcgo+
ID4gYWRkcmVzc2VzIHlvdSBhY2Nlc3MgLSB0aGFua3MgdG8gc3BlY3VsYXRpdmUgZXhlY3V0aW9u
LCB5b3UgaGF2ZSB0bwo+ID4gYXNzdW1lIHRoYXQgdGhlIENQVSBtaWdodCBiZSBwb3B1bGF0aW5n
IHJhbmRvbSBUTEIgZW50cmllcyBhbGwgb3Zlcgo+ID4gdGhlIHBsYWNlLgo+IAo+IEdvdHRhIGxv
dmUgc3BlY3VsYXRpb24uIE5vdyBpdCBpcyBzdXBwb3NlZCB0byBiZSBsaW1pdGVkIHRvIGdlbnVp
bmVseQo+IGFjY2Vzc2libGUgZGF0YSAmIGNvZGUsIHJpZ2h0PyBTYXkgdGhlb3JldGljYWxseSB3
ZSBoYXZlIGEgZnVsbCBUTEJpIGFzCj4gbGl0ZXJhbGx5IHRoZSBsYXN0IHRoaW5nIGJlZm9yZSBk
b2luZyB0aGUgcmV0dXJuLXRvLXVzZXJzcGFjZSwgc3BlY3VsYXRpb24KPiBzaG91bGQgYmUgbGlt
aXRlZCB0byBleGVjdXRpbmcgbWF5YmUgYml0cyBvZiB0aGUgcmV0dXJuLWZyb20tdXNlcnNwYWNl
Cj4gY29kZT8KCkkgdGhpbmsgaXQncyBlYXNpZXIgdG8gaWdub3JlIHNwZWN1bGF0aW9uIGVudGly
ZWx5LCBhbmQganVzdCBhc3N1bWUgdGhhdAp0aGUgTU1VIGNhbiBhcmJpdHJhcmlseSBmaWxsIFRM
QiBlbnRyaWVzIGZyb20gYW55IHBhZ2UgdGFibGUgZW50cmllcwp3aGljaCBhcmUgdmFsaWQvYWNj
ZXNzaWJsZSBpbiB0aGUgYWN0aXZlIHBhZ2UgdGFibGVzLiBIYXJkd2FyZQpwcmVmZXRjaGVycyBj
YW4gZG8gdGhhdCByZWdhcmRsZXNzIG9mIHRoZSBzcGVjaWZpYyBwYXRoIG9mIHNwZWN1bGF0aXZl
CmV4ZWN1dGlvbi4KClRodXMgVExCIGZpbGxzIGFyZSBub3QgbGltaXRlZCB0byBWQXMgd2hpY2gg
d291bGQgYmUgdXNlZCBvbiB0aGF0CnJldHVybi10by11c2Vyc3BhY2UgcGF0aC4KCj4gRnVydGhl
cm1vcmUsIEkgd291bGQgaG9wZSB0aGF0IG9uY2UgYSBDUFUgaXMgZXhlY3V0aW5nIGluIHVzZXJz
cGFjZSwgaXQncwo+IG5vdCBnb2luZyB0byBwb3B1bGF0ZSB0aGUgVExCIHdpdGgga2VybmVsIGFk
ZHJlc3MgdHJhbnNsYXRpb25zIC0gQUlVSSB0aGUKPiB3aG9sZSB2dWxuZXJhYmlsaXR5IG1pdGln
YXRpb24gZGViYWNsZSB3YXMgYWJvdXQgcHJldmVudGluZyB0aGlzIHNvcnQgb2YKPiB0aGluZy4K
ClRoZSBDUFUgY2FuIGRlZmluaXRlbHkgZG8gdGhhdDsgdGhlIHZ1bG5lcmFiaWxpdHkgbWl0aWdh
dGlvbnMgYXJlIGFsbAphYm91dCB3aGF0IHVzZXJzcGFjZSBjYW4gb2JzZXJ2ZSByYXRoZXIgdGhh
biB3aGF0IHRoZSBDUFUgY2FuIGRvIGluIHRoZQpiYWNrZ3JvdW5kLiBBZGRpdGlvbmFsbHksIHRo
ZXJlIGFyZSBmZWF0dXJlcyBsaWtlIFNQRSBhbmQgVFJCRSB0aGF0IHVzZQprZXJuZWwgYWRkcmVz
c2VzIHdoaWxlIHRoZSBDUFUgaXMgZXhlY3V0aW5nIHVzZXJzcGFjZSBpbnN0cnVjdGlvbnMuCgpU
aGUgbGF0ZXN0IEFSTSBBcmNoaXRlY3R1cmUgUmVmZXJlbmNlIE1hbnVhbCAoQVJNIERESSAwNDg3
IEwuYSkgaXMgZmFpcmx5IGNsZWFyCmFib3V0IHRoYXQgaW4gc2VjdGlvbiBEOC4xNiAiVHJhbnNs
YXRpb24gTG9va2FzaWRlIEJ1ZmYiLCB3aGVyZSBpdCBzYXlzCihhbW9uZyBvdGhlciB0aGluZ3Mp
OgoKICBXaGVuIGFkZHJlc3MgdHJhbnNsYXRpb24gaXMgZW5hYmxlZCwgaWYgYSB0cmFuc2xhdGlv
biB0YWJsZSBlbnRyeQogIG1lZXRzIGFsbCBvZiB0aGUgZm9sbG93aW5nIHJlcXVpcmVtZW50cywg
dGhlbiB0aGF0IHRyYW5zbGF0aW9uIHRhYmxlCiAgZW50cnkgaXMgcGVybWl0dGVkIHRvIGJlIGNh
Y2hlZCBpbiBhIFRMQiBvciBpbnRlcm1lZGlhdGUgVExCIGNhY2hpbmcKICBzdHJ1Y3R1cmUgYXQg
YW55IHRpbWU6CiAg4oCiIFRoZSB0cmFuc2xhdGlvbiB0YWJsZSBlbnRyeSBpdHNlbGYgZG9lcyBu
b3QgZ2VuZXJhdGUgYSBUcmFuc2xhdGlvbgogICAgZmF1bHQsIGFuIEFkZHJlc3Mgc2l6ZSBmYXVs
dCwgb3IgYW4gQWNjZXNzIGZsYWcgZmF1bHQuCiAg4oCiIFRoZSB0cmFuc2xhdGlvbiB0YWJsZSBl
bnRyeSBpcyBub3QgZnJvbSBhIHRyYW5zbGF0aW9uIHJlZ2ltZQogICAgY29uZmlndXJlZCBieSBh
biBFeGNlcHRpb24gbGV2ZWwgdGhhdCBpcyBsb3dlciB0aGFuIHRoZSBjdXJyZW50CiAgICBFeGNl
cHRpb24gbGV2ZWwuCgpIZXJlICJwZXJtaXR0ZWQgdG8gYmUgY2FjaGVkIGluIGEgVExCIiBhbHNv
IGltcGxpZXMgdGhhdCB0aGUgSFcgaXMKYWxsb3dlZCB0byBmZXRjaCB0aGUgdHJhbnNsYXRpb24g
dGFibCBlbnRyeSAod2hpY2ggaXMgd2hhdCBBUk0gY2FsbCBwYWdlCnRhYmxlIGVudHJpZXMpLgoK
VGhlIFBERiBjYW4gYmUgZm91bmQgYXQ6CgogIGh0dHBzOi8vZGV2ZWxvcGVyLmFybS5jb20vZG9j
dW1lbnRhdGlvbi9kZGkwNDg3L2xhLz9sYW5nPWVuCgpNYXJrLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
