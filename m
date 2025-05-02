Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703DEC3ABAC
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 14:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03s7BNMboOs8da03K5C/ory0ZO/Z476bbMSoTGtndmI=; b=SMn1GSqKMX28a9
	dk1visxeX0OsQkANNG6eDT9l4UXbY1HiOh0aWCLxF6KUm5DlYoJFHhsuXiY7dLTaIHQLZYX2hnDOt
	F5g/KjUPBp7rXqW5KvDLnMFewHy2BTvWlEfwBxwGkWpy+sHH7I9U3vdI/OLJ7r7BHaUSd+FwSUEmc
	QWhW9gu7a+v+Y6czh25H3nQcFX24XLESQSWh1HRoi5DuQk6OsnqpGJ7clG06kABPRMeHaVJxVPyXc
	HxgiSdefIpdpoDGABbt0Ll9JoVQm8NxdGQEmIK3n7x1UtSei2w2HCzXNKiP9wJcNH5Kz866U+P0Aa
	l677fsaHIBarrlW5uJFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArWE-00000002DFR-3fHa;
	Fri, 02 May 2025 14:37:38 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArSn-00000002Cgd-2ShX;
	Fri, 02 May 2025 14:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746196446; x=1777732446;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6xpTcm5i9h8w6CwoFRxZPxtoKJJ3BBCKGnmNa7Z2kh4=;
  b=Npe5tFXNWCE2ydv1+lpRhtikkivi/XAwMXnMIKPnPQ5wuM+WFF8b4lqU
   PXfISgifALZahW+OrIsEOUfaVmUCVxLtVp0+KxI1O3P2oiQSw6k882tyq
   g4PfyRHulvqm9LF0l+I1uKpfeRX2D0+kjDDyy1u6m+7LK7zR/gU3/f7zA
   2q9aWVRUMxxxu2OtWQR4o+uXLuGHP1nICenJJW7H+ZtArzbjGcUjsq4Cg
   VyaT5fn+pxkTqrGHSggUb08MdL8nwgkjgS8dZ9HZsFKNkxz4mYpoKoLFf
   b3KuGJ/wZkkcKVuXroOyTpLCDFoqcjecZjcKJotUuF848QheFn2yFf9le
   Q==;
X-CSE-ConnectionGUID: PILMhY7FRMa7vnlhX/jIHg==
X-CSE-MsgGUID: CYgrstfTRIivPbMLjKYt0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47762482"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47762482"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:34:04 -0700
X-CSE-ConnectionGUID: VxHvVA4GR1yhOEAvPb47UQ==
X-CSE-MsgGUID: rx5pPAMZTRORyTUWVz/hDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135634956"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO [10.124.220.153]) ([10.124.220.153])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:33:59 -0700
Message-ID: <6c44fa0e-28ed-400e-aaf2-e0e0720d3811@intel.com>
Date: Fri, 2 May 2025 07:33:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/25] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Valentin Schneider <vschneid@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-perf-users@vger.kernel.org, kvm@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, rcu@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Daniel Wagner <dwagner@suse.de>,
 Petr Tesarik <ptesarik@suse.com>, Nicolas Saenz Julienne
 <nsaenz@amazon.com>, Frederic Weisbecker <frederic@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Juergen Gross <jgross@suse.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.amakhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Naveen N Rao <naveen@kernel.org>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>, Rong Xu <xur@google.com>,
 Rafael Aquini <aquini@redhat.com>, Song Liu <song@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, Brian Gerst <brgerst@gmail.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Benjamin Berg <benjamin.berg@intel.com>,
 Vishal Annapurve <vannapurve@google.com>,
 Randy Dunlap <rdunlap@infradead.org>, John Stultz <jstultz@google.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20250429113242.998312-1-vschneid@redhat.com>
 <fefcd1a6-f146-4f3c-b28b-f907e7346ddd@intel.com>
 <20250430132047.01d48647@gandalf.local.home>
 <019f6713-cfbd-466b-8fb5-dcd982cf8644@intel.com>
 <20250502112216.GZ4198@noisy.programming.kicks-ass.net>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20250502112216.GZ4198@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_073405_656109_32F666E3 
X-CRM114-Status: GOOD (  23.40  )
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

T24gNS8yLzI1IDA0OjIyLCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiBPbiBXZWQsIEFwciAzMCwg
MjAyNSBhdCAxMTowNzozNUFNIC0wNzAwLCBEYXZlIEhhbnNlbiB3cm90ZToKPiAKPj4gQm90aCBB
TUQgYW5kIEludGVsIGhhdmUgaGFyZHdhcmUgdG8gZG8gaXQuIEFSTSBDUFVzIGRvIGl0IHRvbywg
SSB0aGluay4KPj4gWW91IGNhbiBnbyBidXkgdGhlIEludGVsIGhhcmR3YXJlIG9mZiB0aGUgc2hl
bGYgdG9kYXkuCj4gVG8gYmUgZmFpciwgdGhlIEludGVsIFJBUiB0aGluZyBpcyBwcmV0dHkgaG9y
cmlmaWMg8J+ZgSBEZWZpbml0ZWx5Cj4gc3ViLXBhciBjb21wYXJlZCB0byB0aGUgQU1EIGFuZCBB
Uk0gdGhpbmdzLgo+IAo+IEZ1cnRoZXJtb3JlLCB0aGUgcGFwZXIgc3RhdGVzIGl0IGlzIGEgdWFy
Y2ggZmVhdHVyZSBmb3IgU1BSIHdpdGggbm8KPiBndWFyYW50ZWUgZnV0dXJlIHVhcmNocyB3aWxs
IGdldCBpdCAoYW5kIHRvIGJlIGZhaXIsIEknZCBwcmVmZXIgaXQgaWYKPiB0aGV5IGRpZG4ndCku
CgpJIGRvbid0IHRoaW5rIGFueSBvZiB0aGF0IGlzIHNldCBpbiBzdG9uZSwgZndpdy4gSXQgc2hv
dWxkIGJlIGVudGlyZWx5CnBvc3NpYmxlIHRvIG9idGFpbiBhIGxvbmdlciBwcm9taXNlIGFib3V0
IGl0cyBhdmFpbGFiaWxpdHkuCgpPciBhc2sgdGhhdCBBTUQgYW5kIEludGVsIHB1dCB0aGVpciBo
ZWFkcyB0b2dldGhlciBpbiB0aGVpciBmYW5jeSBuZXcKeDg2IGFkdmlzb3J5IGdyb3VwIGFuZCBm
aWd1cmUgb3V0IGEgc2luZ2xlIHdheSBmb3J3YXJkLiBJZiB5b3UncmUgcmlnaHQKdGhhdCBSQVIg
c3RpbmtzIGFuZCBJTlZMUEdCIHJvY2tzLCB0aGVuIGl0J2xsIGJlIGFuIGVhc3kgdGhpbmcgdG8g
YWR2aXNlLgoKPiBGdXJ0aGVybW9yZSwgSSBzdXNwZWN0IGl0IHdpbGwgYWN0dWFsbHkgYmUgc2xv
d2VyIHRoYW4gSVBJcyBmb3IgYW55dGhpbmcKPiB3aXRoIG1vcmUgdGhhbiA2NCBsb2dpY2FsIENQ
VXMgZHVlIHRvIHJlZHVjZWQgcGFyYWxsZWxpc20uCgpNYXliZSBteSBicmFpbiBpcyBjcnVzdHkg
YW5kIEkgbmVlZCB0byBnbyBiYWNrIGFuZCByZWFkIHRoZSBzcGVjLCBidXQgSQpyZW1lbWJlciBS
QVIgdXNpbmcgdGhlIG5vcm1hbCBvbGQgQVBJQyBwcm9ncmFtbWluZyB0aGF0IG5vcm1hbCBvbGQg
VExCCmZsdXNoIElQSXMgdXNlLiBTbyB0aGV5IGhhdmUgc2ltaWxhciByZXN0cmljdGlvbnMuIElm
IGl0J3MgaW5lZmZpY2llbnQKdG8gcHJvZ3JhbSBhIHdpZGUgSVBJLCBpdCdzIGFsc28gaW5lZmZp
Y2llbnQgdG8gcHJvZ3JhbSBhIFJBUiBvcGVyYXRpb24uClNvIHRoZSAodGhlb3JldGljYWwpIHBy
byBpcyB0aGF0IHlvdSBwcm9ncmFtIGl0IGxpa2UgYW4gSVBJIGFuZCBpdCBzbG90cwppbnRvIHRo
ZSBJUEkgY29kZSBmYWlybHkgZWFzaWx5LiBCdXQgdGhlIGNvbiBpcyB0aGF0IGl0IGhhcyB0aGUg
c2FtZQpsaW1pdGF0aW9ucyBhcyBJUElzLgoKSSB3YXMgYWN0dWFsbHkgY29uY2VybmVkIHRoYXQg
SU5WTFBHQiB3b24ndCBiZSBzY2FsYWJsZS4gU2luY2UgaXQKZG9lc24ndCBoYXZlIHRoZSBhYmls
aXR5IHRvIHRhcmdldCBzcGVjaWZpYyBDUFVzIGluIHRoZSBJU0EsIGl0CmZ1bmRhbWVudGFsbHkg
bmVlZCB0byBlaXRoZXIgaGF2ZSBhIG1lY2hhbmlzbSB0byByZWFjaCBhbGwgQ1BVcywgb3Igc29t
ZQp3YXkgdG8ga25vdyB3aGljaCBUTEIgZW50cmllcyBlYWNoIENQVSBtaWdodCBoYXZlLgoKTWF5
YmUgQU1EIGhhcyBzb21ldGhpbmcgc3VwZXIgZHVwZXIgY2xldmVyIHRvIGxpbWl0IHRoZSBicm9h
ZGNhc3Qgc2NvcGUuCkJ1dCBpZiB0aGV5IGRvbid0LCB0aGVuIGEgc21hbGwgcmFuZ2UgZmx1c2gg
b24gYSBzbWFsbCBudW1iZXIgb2YgQ1BVcwptaWdodCBlbmQgdXAgYmVpbmcgcHJldHR5IGV4cGVu
c2l2ZSwgcmVsYXRpdmVseS4KCkkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhIGJpZyBwcm9ibGVtIGlu
IFJpaydzIHNlcmllcyBiZWNhdXNlIGhlIGhhZCBhCmZsb29yIG9uIHRoZSBzaXplIG9mIHByb2Nl
c3NlcyB0aGF0IGdldCBJTlZMUEdCIGFwcGxpZWQuIEFsc28sIGlmIGl0CnR1cm5zIG91dCB0byBi
ZSBhIHByb2JsZW0sIGl0J3MgZGlydCBzaW1wbGUgdG8gcmV2ZXJ0IGJhY2sgdG8gSVBJcyBmb3IK
cHJvYmxlbWF0aWMgVExCIGZsdXNoZXMuCgpCdXQgSSBhbSBkZWVwbHkgY3VyaW91cyBob3cgdGhl
IHN5c3RlbSB3aWxsIGJlaGF2ZSBpZiB0aGVyZSBhcmUgYQpib2F0bG9hZCBvZiBwcm9jZXNzZXMg
ZG9pbmcgbW9kZXN0bHktc2l6ZWQgSU5WTFBHQnMgdGhhdCBvbmx5IGFwcGx5IHRvIGEKaGFuZGZ1
bCBvZiBDUFVzIG9uIGEgdmVyeSBsYXJnZSBzeXN0ZW0uCgpBTUQgYW5kIEludGVsIGNhbWUgYXQg
dGhpcyBmcm9tIHZlcnkgZGlmZmVyZW50IGFuZ2xlcyAoZ28gZmlndXJlKS4gVGhlCmRlc2lnbnMg
YXJlIHByaW9yaXRpemluZyBkaWZmZXJlbnQgdGhpbmdzIGZvciBzdXJlLiBJIGNhbid0IHdhaXQg
dG8gc2VlCmJvdGggb2YgdGhlbSBmaWdodGluZyBpdCBvdXQgdW5kZXIgcmVhbCB3b3JrbG9hZHMu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
