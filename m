Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FA4C3ABAC
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+NRyYPWKRi1LpkOsHWgWwWSbrIBTWjokKs80wZ54Rus=; b=IHKRCPoSBjFcaQ
	P4Kyo/7bA6mSMt8OYOs1SLTkenXcH6XWJCmC1Wbq8d4OMopXUk/ehAYM+4ty0vQC2QD26BA6sOwqD
	KUgE8XR+8GU3/vTCY0cgFw8qDhCnl3/vkhQnWHp1Lgv0fHMF2+tvQxw0gHJ/LXhfQT+QP/kiWdyrB
	GrE3YPki6wrgrpL0NaGQMPBh4Qk524C9zYc71VfGBWOr6bdrPQ49g0OogAiaRUyIY/tSVxbItgeBj
	ShvHtrilv9SINu3CuVbNeyqE0gYde0vuvOpb3IZ6N3QYxOHbt7tsUfO2omFWBvQffLwzLZ48BX1Zs
	PpDyEFLoMWhZyhuLfVJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsSL-00000002MCQ-0Ry1;
	Fri, 02 May 2025 15:37:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsDi-00000002JuW-48L5;
	Fri, 02 May 2025 15:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=el7AZkw1ZRKHIxRciQGDkRJRuJhHBYcxb7Lx2vUA2VY=; b=VLicN+ptqmmrlGpkHyenbaJkO3
	UKl1u4ZcqZ7oWPbRw6dMMUxn72FaEy0WJ3uleLDo46IZAmhsK1s6PzstYFLXVCoeTFAELrE5DCXZV
	2a3xjeJXk3jd+MNSv440/ctFcN/2lRBE7zBjIvFKJhZ8qlHasISVIsAF7PhbVmOI9sTPnfKtBF/j0
	T5ii54POjzNHVsJRtQ6Eurq9+2ni0YwiVd6GYbIqODtfs42ci2vCC2IhgLIcfyKRhIXKA+++xBeTX
	7vzCcTdWbJuGqjLYTRZaDRmsGTt0uypAIK5VRc3biSMOf5Mo2j4U1WGyzwr0huO9Ilv8zAyVG14w8
	3oLsV5eQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsBP-00000004E1V-1rsm;
	Fri, 02 May 2025 15:20:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D6C5B30057C; Fri,  2 May 2025 17:20:02 +0200 (CEST)
Date: Fri, 2 May 2025 17:20:02 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
	kvm@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	rcu@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>,
	Nicolas Saenz Julienne <nsaenz@amazon.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Naveen N Rao <naveen@kernel.org>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rong Xu <xur@google.com>, Rafael Aquini <aquini@redhat.com>,
	Song Liu <song@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Brian Gerst <brgerst@gmail.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	John Stultz <jstultz@google.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v5 00/25] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
Message-ID: <20250502152002.GX4439@noisy.programming.kicks-ass.net>
References: <20250429113242.998312-1-vschneid@redhat.com>
 <fefcd1a6-f146-4f3c-b28b-f907e7346ddd@intel.com>
 <20250430132047.01d48647@gandalf.local.home>
 <019f6713-cfbd-466b-8fb5-dcd982cf8644@intel.com>
 <20250502112216.GZ4198@noisy.programming.kicks-ass.net>
 <6c44fa0e-28ed-400e-aaf2-e0e0720d3811@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c44fa0e-28ed-400e-aaf2-e0e0720d3811@intel.com>
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

T24gRnJpLCBNYXkgMDIsIDIwMjUgYXQgMDc6MzM6NTVBTSAtMDcwMCwgRGF2ZSBIYW5zZW4gd3Jv
dGU6Cj4gT24gNS8yLzI1IDA0OjIyLCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiA+IE9uIFdlZCwg
QXByIDMwLCAyMDI1IGF0IDExOjA3OjM1QU0gLTA3MDAsIERhdmUgSGFuc2VuIHdyb3RlOgo+ID4g
Cj4gPj4gQm90aCBBTUQgYW5kIEludGVsIGhhdmUgaGFyZHdhcmUgdG8gZG8gaXQuIEFSTSBDUFVz
IGRvIGl0IHRvbywgSSB0aGluay4KPiA+PiBZb3UgY2FuIGdvIGJ1eSB0aGUgSW50ZWwgaGFyZHdh
cmUgb2ZmIHRoZSBzaGVsZiB0b2RheS4KPiA+IFRvIGJlIGZhaXIsIHRoZSBJbnRlbCBSQVIgdGhp
bmcgaXMgcHJldHR5IGhvcnJpZmljIPCfmYEgRGVmaW5pdGVseQo+ID4gc3ViLXBhciBjb21wYXJl
ZCB0byB0aGUgQU1EIGFuZCBBUk0gdGhpbmdzLgo+ID4gCj4gPiBGdXJ0aGVybW9yZSwgdGhlIHBh
cGVyIHN0YXRlcyBpdCBpcyBhIHVhcmNoIGZlYXR1cmUgZm9yIFNQUiB3aXRoIG5vCj4gPiBndWFy
YW50ZWUgZnV0dXJlIHVhcmNocyB3aWxsIGdldCBpdCAoYW5kIHRvIGJlIGZhaXIsIEknZCBwcmVm
ZXIgaXQgaWYKPiA+IHRoZXkgZGlkbid0KS4KPiAKPiBJIGRvbid0IHRoaW5rIGFueSBvZiB0aGF0
IGlzIHNldCBpbiBzdG9uZSwgZndpdy4gSXQgc2hvdWxkIGJlIGVudGlyZWx5Cj4gcG9zc2libGUg
dG8gb2J0YWluIGEgbG9uZ2VyIHByb21pc2UgYWJvdXQgaXRzIGF2YWlsYWJpbGl0eS4KPiAKPiBP
ciBhc2sgdGhhdCBBTUQgYW5kIEludGVsIHB1dCB0aGVpciBoZWFkcyB0b2dldGhlciBpbiB0aGVp
ciBmYW5jeSBuZXcKPiB4ODYgYWR2aXNvcnkgZ3JvdXAgYW5kIGZpZ3VyZSBvdXQgYSBzaW5nbGUg
d2F5IGZvcndhcmQuIAoKVGhpcyBtaWdodCBiZSBhIGdvb2QgdGhpbmcgcmVnYXJkbGVzcy4KCj4g
PiBGdXJ0aGVybW9yZSwgSSBzdXNwZWN0IGl0IHdpbGwgYWN0dWFsbHkgYmUgc2xvd2VyIHRoYW4g
SVBJcyBmb3IgYW55dGhpbmcKPiA+IHdpdGggbW9yZSB0aGFuIDY0IGxvZ2ljYWwgQ1BVcyBkdWUg
dG8gcmVkdWNlZCBwYXJhbGxlbGlzbS4KPiAKPiBNYXliZSBteSBicmFpbiBpcyBjcnVzdHkgYW5k
IEkgbmVlZCB0byBnbyBiYWNrIGFuZCByZWFkIHRoZSBzcGVjLCBidXQgSQo+IHJlbWVtYmVyIFJB
UiB1c2luZyB0aGUgbm9ybWFsIG9sZCBBUElDIHByb2dyYW1taW5nIHRoYXQgbm9ybWFsIG9sZCBU
TEIKPiBmbHVzaCBJUElzIHVzZS4gU28gdGhleSBoYXZlIHNpbWlsYXIgcmVzdHJpY3Rpb25zLiBJ
ZiBpdCdzIGluZWZmaWNpZW50Cj4gdG8gcHJvZ3JhbSBhIHdpZGUgSVBJLCBpdCdzIGFsc28gaW5l
ZmZpY2llbnQgdG8gcHJvZ3JhbSBhIFJBUiBvcGVyYXRpb24uCj4gU28gdGhlICh0aGVvcmV0aWNh
bCkgcHJvIGlzIHRoYXQgeW91IHByb2dyYW0gaXQgbGlrZSBhbiBJUEkgYW5kIGl0IHNsb3RzCj4g
aW50byB0aGUgSVBJIGNvZGUgZmFpcmx5IGVhc2lseS4gQnV0IHRoZSBjb24gaXMgdGhhdCBpdCBo
YXMgdGhlIHNhbWUKPiBsaW1pdGF0aW9ucyBhcyBJUElzLgoKVGhlIHByb2JsZW0gaXMgaW4gdGhl
IHJlcXVlc3Qgc3RydWN0dXJlLiBTZW5kaW5nIGFuIElQSSBpcyBhbiBhc3luYwphY3Rpb24uIFlv
dSBkbywgZG9uZS4KCk9UT0ggUkFSIGhhcyBhIHJlcXVlc3QgYnVmZmVyIHdoZXJlIHBlbmRpbmcg
cmVxdWVzdHMgYXJlIHB1dCBhbmQgJ3BvbGxlZCcKZm9yIGNvbXBsZXRpb24uIFRoaXMgYnVmZmVy
IGRvZXMgbm90IGhhdmUgcm9vbSBmb3IgbW9yZSB0aGFuIDY0IENQVXMuCgpUaGlzIG1lYW5zIHRo
YXQgaWYgeW91IHdhbnQgdG8gaW52YWxpZGF0ZSBhY3Jvc3MgbW9yZSwgeW91IG5lZWQgdG8gZG8g
aXQKaW4gbXVsdGlwbGUgYmF0Y2hlcy4KClNvIHdoZXJlIElQSSBpczoKCiAtIElQSSBhbGwgQ1BV
cwogLSBsb2NhbCBpbnZhbGlkYXRlCiAtIHdhaXQgZm9yIGNvbXBsZXRpb24KClRoaXMgdGhlbiBi
ZWNvbWVzOgoKIGZvciAoKQogICAtIFJBUiBzb21lIENQVXMKICAgLSB3YWl0IGZvciBjb21wbGV0
aW9uCgpPciBzbyBJIHRob3VnaHQgdG8gaGF2ZSB1bmRlcnN0b29kLCB0aGUgcGFwZXIgaXNuJ3Qg
dGhlIGVhc2llc3QgdG8gcmVhZC4KCj4gSSB3YXMgYWN0dWFsbHkgY29uY2VybmVkIHRoYXQgSU5W
TFBHQiB3b24ndCBiZSBzY2FsYWJsZS4gU2luY2UgaXQKPiBkb2Vzbid0IGhhdmUgdGhlIGFiaWxp
dHkgdG8gdGFyZ2V0IHNwZWNpZmljIENQVXMgaW4gdGhlIElTQSwgaXQKPiBmdW5kYW1lbnRhbGx5
IG5lZWQgdG8gZWl0aGVyIGhhdmUgYSBtZWNoYW5pc20gdG8gcmVhY2ggYWxsIENQVXMsIG9yIHNv
bWUKPiB3YXkgdG8ga25vdyB3aGljaCBUTEIgZW50cmllcyBlYWNoIENQVSBtaWdodCBoYXZlLgo+
IAo+IE1heWJlIEFNRCBoYXMgc29tZXRoaW5nIHN1cGVyIGR1cGVyIGNsZXZlciB0byBsaW1pdCB0
aGUgYnJvYWRjYXN0IHNjb3BlLgo+IEJ1dCBpZiB0aGV5IGRvbid0LCB0aGVuIGEgc21hbGwgcmFu
Z2UgZmx1c2ggb24gYSBzbWFsbCBudW1iZXIgb2YgQ1BVcwo+IG1pZ2h0IGVuZCB1cCBiZWluZyBw
cmV0dHkgZXhwZW5zaXZlLCByZWxhdGl2ZWx5LgoKU28gdGhlIHdheSBJIHVuZGVyc3RhbmQgdGhp
bmdzOgoKU2VuZGluZyBJUElzIGlzIHNlbmRpbmcgYSBtZXNzYWdlIG9uIHRoZSBpbnRlcmNvbm5l
Y3QuIE1vc3RseSB0aGlzIGlzIGEKY2FjaGVsaW5lIGluIHNpemUgKGJlY2F1c2UgTUVTSSkuIFNw
YXJjICh2OT8pIGhhcyBhIGZ1biBmZWF0dXJlIHdoZXJlCnlvdSBjYW4gYWN0dWFsbHkgcHV0IGRh
dGEgcGF5bG9hZCBpbiBhbiBJUEkuCgpOb3csIHdlIGNhbiB0YXJnZXQgYW4gSVBJIHRvIGEgc2lu
Z2xlIENQVSBvciB0byBhIChsaW1pdGVkKSBzZXQgb2YgQ1BVCm9yIGJyb2FkY2FzdCB0byBhbGwg
Q1BVcy4gSW4gZmFjdCwgdGFyZ2V0ZWQgSVBJcyBtaWdodCBzdGlsbCBiZQpicm9hZGNhc3QgSVBJ
cywgZXhjZXB0IG1vc3QgQ1BVcyB3aWxsIGlnbm9yZSBpdCBiZWNhdXNlIGl0IGRvZXNuJ3QgbWF0
Y2gKdGhlbS4KClRMQkkgYnJvYWRjYXN0IGlzIGxpa2Ugc2VuZGluZyBJUElzIHRvIGFsbCBDUFVz
LCB0aGUgbWVzc2FnZSBnb2VzIG91dCwKZXZlcnlib2R5IHNlZXMgaXQuCgpNdWNoIGxpa2UgaG93
IHNub29wIGZpbHRlcnMgYW5kIHRoZSBsaWtlIGZ1bmN0aW9uLCBhIENQVSBjYW4gcHJvY2Vzcwp0
aGVzZSBtZXNzYWdlcyBhc3luYyAtLSB5b3VyIENQVSBkb2Vzbid0IHN0YWxsIGZvciBhIGNhY2hl
bGluZQppbnZhbGlkYXRlIG1lc3NhZ2UgZWl0aGVyIChleGNlcHQgb2Zjb3Vyc2UgaWYgaXQgaXMg
YWN0aXZlbHkgdXNpbmcgdGhhdApsaW5lKS4gU2FtZSBmb3IgVExCSSwgaWYgdGhlIGxvY2FsIFRM
QiBkb2VzIG5vdCBoYXZlIGFueXRoaW5nIHRoYXQKbWF0Y2hlcywgaXRzIGRvbmUuIEV2ZW4gaWYg
aXQgZG9lcyBtYXRjaCwgYXMgbG9uZyBhcyBub3RoaW5nIG1ha2VzCmFjdGl2ZSB1c2Ugb2YgaXQs
IGl0IGNhbiBqdXN0IGRyb3AgdGhlIFRMQiBlbnRyeSB3aXRob3V0IGRpc3R1cmJpbmcgdGhlCmFj
dHVhbCBjb3JlLgoKT25seSBpZiB0aGUgQ1BVIGhhcyBhIG1hdGNoaW5nIFRMQiBlbnRyeSAqYW5k
KiBpdCBpcyBhY3RpdmUsIHRoZW4gd2UKaGF2ZSBvcHRpb25zLiBPbmUgb3B0aW9uIGlzIHRvIGlu
dGVycnVwdCB0aGUgY29yZSwgYW5vdGhlciBvcHRpb24gaXMgdG8Kd2FpdCBmb3IgaXQgdG8gc3Rv
cCB1c2luZyBpdC4KCklJVUMgdGhlIGN1cnJlbnQgQU1EIGltcGxlbWVudGF0aW9uIGRvZXMgdGhl
ICdpbnRlcnJ1cHQnIHRoaW5nLgoKT25lIHRoaW5nIHRvIGNvbnNpZGVyIGluIGFsbCB0aGlzIGlz
IHRoYXQgaWYgd2UgVExCSSBmb3IgYW4gZXhlY3V0YWJsZQpwYWdlLCB3ZSBzaG91bGQgdmVyeSBt
dWNoIGFsc28gd2lwZSB0aGUgdS1vcHMgY2FjaGUgYW5kIGFsbCBzdWNoIHJlbGF0ZWQKc3RydWN0
dXJlcyAtLSBBUk0gbWlnaHQgaGF2ZSBhbiAnaXNzdWUnIGhlcmUuCgpUaGF0IGlzLCBJIHRoaW5r
IHRoZSBUTEJJIHByb2JsZW0gaXMgdmVyeSBzaW1pbGFyIHRvIHRoZSBJIGluIE1FU0kgLS0KZXhj
ZXB0IHBvc3NpYmx5IHNpbXBsZXIsIGJlY2F1c2UgRSBtdXN0IG5vdCBoYXBwZW4gdW50aWwgYWxs
IENQVXMKYWNrbm93bGVkZ2UgSSBldGMuIFRMQkkgZG9lcyBub3QgaGF2ZSB0aGlzLCBpdCBoYXMg
dW50aWwgdGhlIG5leHQKVExCU1lOQy4KCkFueXdheSwgSSdtIG5vdCBhIGhhcmR3YXJlIHBlcnNv
biwgYnV0IHRoaXMgaXMgaG93IEkgdW5kZXJzdGFuZCB0aGVzZQp0aGluZ3MgdG8gd29yay4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
