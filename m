Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F15C0218A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 15:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCmVJHLR2nF6lPDmqGuSKX4k/tfB4OGtm27OIJ16NUw=; b=dEsn4SOPR+tWP2
	Yb510xfnU7D/hIG7RkKyWW1y9UElOe6QRkoPYfgLdQiNmFQ181v/Uuofg8WZIJ4H5c/PCciYNGl/+
	9+iEu5d1/CIzhvg6xGUSvvflJpF6uRZhUsgyM4yAB5IcroTijWtdidbriy8yqy7nILfGc/G3skrF+
	iAn3lcPcHVNviLfLaWDm2+UKp8QZOHbxciO9FmbPlnWn6si+0d7P4XKva8KKxr6V1YP/To1x1XJaq
	L5c6QBMwYCRycx2/ferpn6KdyxrJ0j5eheoVZ9/LO6vvH/0fe1LbMx/Kl67FZNTNYXrXbIXtJX0FT
	GiL1G0BGa5ZJgZqhIiHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcRPG-00000002eSz-2S5V;
	Mon, 27 Jan 2025 15:52:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcRPB-00000002eNo-3Vso;
	Mon, 27 Jan 2025 15:52:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B5CFFA41826;
	Mon, 27 Jan 2025 15:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87519C4CED2;
	Mon, 27 Jan 2025 15:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737993124;
	bh=lKShl/TiOp2ZoXo/jImChQXPJ2hMZLXx2pOut7WiptI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Opi/ZOMV/zfLovkaRrjcFN22SaJmB+XJGtnDJ/cIoGIjT25SkYRyAorU+UjcclWyd
	 6DePEaUZ/QK4W0yHLc5Kb3ieU/uOi+zRZdhIrfh5zorrG9bSfVDQc9h0dR9gO+3bHq
	 ul1VD9PJ3iJuekF+lfnqBztVCR/WhUeMwXxaqNSwUyFJREhVmoO8Vtntzw4FAiTB00
	 00OvDbjpP1jbVZyUSglO9BK2uxJ3fZYicWL3MsWiS1eDM68OxCFUf3tPPbIQwtET/k
	 cGteI6qIszlohfI51re4Bs3hb3htIsly4LrqymlfAEdhSawB5JdAEcLJmnZm2zRPZn
	 N7W92SLp2WhHA==
Date: Mon, 27 Jan 2025 15:51:47 +0000
From: Will Deacon <will@kernel.org>
To: Jann Horn <jannh@google.com>
Cc: Valentin Schneider <vschneid@redhat.com>, linux-kernel@vger.kernel.org,
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
	Huacai Chen <chenhuacai@kernel.org>,
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
	Mark Rutland <mark.rutland@arm.com>,
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
Message-ID: <20250127155146.GB25757@willie-the-truck>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_075206_004727_B30D792D 
X-CRM114-Status: GOOD (  37.73  )
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

T24gRnJpLCBKYW4gMTcsIDIwMjUgYXQgMDQ6NTI6MTlQTSArMDEwMCwgSmFubiBIb3JuIHdyb3Rl
Ogo+IE9uIEZyaSwgSmFuIDE3LCAyMDI1IGF0IDQ6MjXigK9QTSBWYWxlbnRpbiBTY2huZWlkZXIg
PHZzY2huZWlkQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gT24gMTQvMDEvMjUgMTk6MTYsIEphbm4g
SG9ybiB3cm90ZToKPiA+ID4gT24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgNjo1MeKAr1BNIFZhbGVu
dGluIFNjaG5laWRlciA8dnNjaG5laWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+PiB2dW5tYXAo
KSdzIGlzc3VlZCBmcm9tIGhvdXNla2VlcGluZyBDUFVzIGFyZSBhIHJlbGF0aXZlbHkgY29tbW9u
IHNvdXJjZSBvZgo+ID4gPj4gaW50ZXJmZXJlbmNlIGZvciBpc29sYXRlZCBOT0haX0ZVTEwgQ1BV
cywgYXMgdGhleSBhcmUgaGl0IGJ5IHRoZQo+ID4gPj4gZmx1c2hfdGxiX2tlcm5lbF9yYW5nZSgp
IElQSXMuCj4gPiA+Pgo+ID4gPj4gR2l2ZW4gdGhhdCBDUFVzIGV4ZWN1dGluZyBpbiB1c2Vyc3Bh
Y2UgZG8gbm90IGFjY2VzcyBkYXRhIGluIHRoZSB2bWFsbG9jCj4gPiA+PiByYW5nZSwgdGhlc2Ug
SVBJcyBjb3VsZCBiZSBkZWZlcnJlZCB1bnRpbCB0aGVpciBuZXh0IGtlcm5lbCBlbnRyeS4KPiA+
ID4+Cj4gPiA+PiBEZWZlcnJhbCB2cyBlYXJseSBlbnRyeSBkYW5nZXIgem9uZQo+ID4gPj4gPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+ID4+Cj4gPiA+PiBUaGlzIHJlcXVp
cmVzIGEgZ3VhcmFudGVlIHRoYXQgbm90aGluZyBpbiB0aGUgdm1hbGxvYyByYW5nZSBjYW4gYmUg
dnVubWFwJ2QKPiA+ID4+IGFuZCB0aGVuIGFjY2Vzc2VkIGluIGVhcmx5IGVudHJ5IGNvZGUuCj4g
PiA+Cj4gPiA+IEluIG90aGVyIHdvcmRzLCBpdCBuZWVkcyBhIGd1YXJhbnRlZSB0aGF0IG5vIHZt
YWxsb2MgYWxsb2NhdGlvbnMgdGhhdAo+ID4gPiBoYXZlIGJlZW4gY3JlYXRlZCBpbiB0aGUgdm1h
bGxvYyByZWdpb24gd2hpbGUgdGhlIENQVSB3YXMgaWRsZSBjYW4KPiA+ID4gdGhlbiBiZSBhY2Nl
c3NlZCBkdXJpbmcgZWFybHkgZW50cnksIHJpZ2h0Pwo+ID4KPiA+IEknbSBub3Qgc3VyZSBpZiB0
aGF0IHdvdWxkIGJlIGEgcHJvYmxlbSAobm90IGFuIG1tIGV4cGVydCwgcGxlYXNlIGRvCj4gPiBj
b3JyZWN0IG1lKSAtIGxvb2tpbmcgYXQgdm1hcF9wYWdlc19yYW5nZSgpLCBmbHVzaF9jYWNoZV92
bWFwKCkgaXNuJ3QKPiA+IGRlZmVycmVkIGFueXdheS4KPiAKPiBmbHVzaF9jYWNoZV92bWFwKCkg
aXMgYWJvdXQgc3R1ZmYgbGlrZSBmbHVzaGluZyBkYXRhIGNhY2hlcyBvbgo+IGFyY2hpdGVjdHVy
ZXMgd2l0aCB2aXJ0dWFsbHkgaW5kZXhlZCBjYWNoZXM7IHRoYXQgZG9lc24ndCBkbyBUTEIKPiBt
YWludGVuYW5jZS4gV2hlbiB5b3UgbG9vayBmb3IgaXRzIGRlZmluaXRpb24gb24geDg2IG9yIGFy
bTY0LCB5b3UnbGwKPiBzZWUgdGhhdCB0aGV5IHVzZSB0aGUgZ2VuZXJpYyBpbXBsZW1lbnRhdGlv
biB3aGljaCBpcyBzaW1wbHkgYW4gZW1wdHkKPiBpbmxpbmUgZnVuY3Rpb24uCj4gCj4gPiBTbyBh
ZnRlciB2bWFwcGluZyBzb21ldGhpbmcsIEkgd291bGRuJ3QgZXhwZWN0IGlzb2xhdGVkIENQVXMg
dG8gaGF2ZQo+ID4gaW52YWxpZCBUTEIgZW50cmllcyBmb3IgdGhlIG5ld2x5IHZtYXBwZWQgcGFn
ZS4KPiA+Cj4gPiBIb3dldmVyLCB1cG9uIHZ1bm1hcCdpbmcgc29tZXRoaW5nLCB0aGUgVExCIGZs
dXNoIGlzIGRlZmVycmVkLCBhbmQgdGh1cwo+ID4gc3RhbGUgVExCIGVudHJpZXMgY2FuIGFuZCB3
aWxsIHJlbWFpbiBvbiBpc29sYXRlZCBDUFVzLCB1cCB1bnRpbCB0aGV5Cj4gPiBleGVjdXRlIHRo
ZSBkZWZlcnJlZCBmbHVzaCB0aGVtc2VsdmVzIChJT1cgZm9yIHRoZSBlbnRpcmUgZHVyYXRpb24g
b2YgdGhlCj4gPiAiZGFuZ2VyIHpvbmUiKS4KPiA+Cj4gPiBEb2VzIHRoYXQgbWFrZSBzZW5zZT8K
PiAKPiBUaGUgZGVzaWduIGlkZWEgd3J0IFRMQiBmbHVzaGVzIGluIHRoZSB2bWFwIGNvZGUgaXMg
dGhhdCB5b3UgZG9uJ3QgZG8KPiBUTEIgZmx1c2hlcyB3aGVuIHlvdSB1bm1hcCBzdHVmZiBvciB3
aGVuIHlvdSBtYXAgc3R1ZmYsIGJlY2F1c2UgZG9pbmcKPiBUTEIgZmx1c2hlcyBhY3Jvc3MgdGhl
IGVudGlyZSBzeXN0ZW0gb24gZXZlcnkgdm1hcC92dW5tYXAgd291bGQgYmUgYQo+IGJpdCBjb3N0
bHk7IGluc3RlYWQgeW91IGp1c3QgZG8gYmF0Y2hlZCBUTEIgZmx1c2hlcyBpbiBiZXR3ZWVuLCBp
bgo+IF9fcHVyZ2Vfdm1hcF9hcmVhX2xhenkoKS4KPiAKPiBJbiBvdGhlciB3b3JkcywgdGhlIGJh
c2ljIGlkZWEgaXMgdGhhdCB5b3UgY2FuIGtlZXAgY2FsbGluZyB2bWFwKCkgYW5kCj4gdnVubWFw
KCkgYSBidW5jaCBvZiB0aW1lcyB3aXRob3V0IGV2ZXIgZG9pbmcgVExCIGZsdXNoZXMgdW50aWwg
eW91IHJ1bgo+IG91dCBvZiB2aXJ0dWFsIG1lbW9yeSBpbiB0aGUgdm1hcCByZWdpb247IHRoZW4g
eW91IGRvIG9uZSBiaWcgVExCCj4gZmx1c2gsIGFuZCBhZnRlcndhcmRzIHlvdSBjYW4gcmV1c2Ug
dGhlIGZyZWUgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGZvcgo+IG5ldyBhbGxvY2F0aW9ucyBhZ2Fp
bi4KPiAKPiBTbyBpZiB5b3UgImRlZmVyIiB0aGF0IGJhdGNoZWQgVExCIGZsdXNoIGZvciBDUFVz
IHRoYXQgYXJlIG5vdAo+IGN1cnJlbnRseSBydW5uaW5nIGluIHRoZSBrZXJuZWwsIEkgdGhpbmsg
dGhlIGNvbnNlcXVlbmNlIGlzIHRoYXQgdGhvc2UKPiBDUFVzIG1heSBlbmQgdXAgd2l0aCBpbmNv
aGVyZW50IFRMQiBzdGF0ZSBhZnRlciBhIHJlYWxsb2NhdGlvbiBvZiB0aGUKPiB2aXJ0dWFsIGFk
ZHJlc3Mgc3BhY2UuCj4gCj4gQWN0dWFsbHksIEkgdGhpbmsgdGhpcyB3b3VsZCBtZWFuIHRoYXQg
eW91ciBvcHRpbWl6YXRpb24gaXMgZGlzYWxsb3dlZAo+IGF0IGxlYXN0IG9uIGFybTY0IC0gSSdt
IG5vdCBzdXJlIGFib3V0IHRoZSBleGFjdCB3b3JkaW5nLCBidXQgYXJtNjQKPiBoYXMgYSAiYnJl
YWsgYmVmb3JlIG1ha2UiIHJ1bGUgdGhhdCBmb3JiaWRzIGNvbmZsaWN0aW5nIHdyaXRhYmxlCj4g
YWRkcmVzcyB0cmFuc2xhdGlvbnMgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KClllcywgdGhhdCB3
b3VsZCBkZWZpbml0ZWx5IGJlIGEgcHJvYmxlbS4gVGhlcmUncyBhbHNvIHRoZSBtb3JlIG9idmlv
dXMKaXNzdWUgdGhhdCB0aGUgQ25QICgiQ29tbW9uIG5vdCBQcml2YXRlIikgZmVhdHVyZSBvZiBz
b21lIEFybSBDUFVzIG1lYW5zCnRoYXQgVExCIGVudHJpZXMgY2FuIGJlIHNoYXJlZCBiZXR3ZWVu
IGNvcmVzLCBzbyB0aGUgd2hvbGUgaWRlYSBvZiB1c2luZwphIENQVSdzIGV4Y2VwdGlvbiBsZXZl
bCB0byBwcmVkaWNhdGUgaW52YWxpZGF0aW9uIGlzIGZsYXdlZCBvbiBzdWNoIGEKc3lzdGVtLgoK
V2lsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
