Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C7DC5478A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pILf6Sm00ZFquVz83VHZqA/TWE5c+3516smYPQgOylA=; b=C8FdTzpuklUVie
	nw2nrpmd0rH4taOlNsW89PyeURG3lUzQBTV5RuNJVFZpsq7AY06497cln5qPWw+MlCl+W3RtkozeK
	r5Yg4qLTWpFKpXN1RTBN1jt9OWB77xYmZ+Q4GkRd1rHo5Q8uwILbyDm3xQhPT/UW6sSgbsuNjiqyp
	OxiHxrgD7btODSxjzgAjkNQUhR7Z7nRlkSE89ypXlz6RJncrIy1mpdkJPiloObquOnFkG+/LJO3Bg
	jzjSBSivwOaxCsGLOt1ZkKOwzF3VJ2xWdgDLnhxFlLC/G1BZ0euCkzoN0qjAXBFDnq3Q+U926c4W8
	KrpCNgag6Up2DwOV//GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcrMx-000000026mI-0QWr;
	Wed, 21 Feb 2024 18:30:59 +0000
Received: from brightrain.aerifal.cx ([2001:19f0:5:42::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcrMe-000000026e8-2DaH
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 18:30:50 +0000
Date: Wed, 21 Feb 2024 13:30:55 -0500
From: "dalias@libc.org" <dalias@libc.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"musl@lists.openwall.com" <musl@lists.openwall.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>, "maz@kernel.org" <maz@kernel.org>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"will@kernel.org" <will@kernel.org>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"thiago.bauermann@linaro.org" <thiago.bauermann@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"sorear@fastmail.com" <sorear@fastmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [musl] Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS
 in userspace
Message-ID: <20240221183055.GT4163@brightrain.aerifal.cx>
References: <20240220185714.GO4163@brightrain.aerifal.cx>
 <9fc9c45ff6e14df80ad023e66ff7a978bd4ec91c.camel@intel.com>
 <20240220235415.GP4163@brightrain.aerifal.cx>
 <a57d6c7eada4b9a7c35addbc8556f5b53a0c3e6f.camel@intel.com>
 <20240221012736.GQ4163@brightrain.aerifal.cx>
 <d18f060d-37ac-48b1-9f67-a5c5db79b34e@sirena.org.uk>
 <20240221145800.GR4163@brightrain.aerifal.cx>
 <4a3809e8-61b2-4341-a868-292ba6e64e8a@sirena.org.uk>
 <20240221175717.GS4163@brightrain.aerifal.cx>
 <f4a54297767eb098d903404cbe8860d655d79bed.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4a54297767eb098d903404cbe8860d655d79bed.camel@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_103046_412513_B9C3E3E8 
X-CRM114-Status: GOOD (  44.51  )
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

T24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgMDY6MTI6MzBQTSArMDAwMCwgRWRnZWNvbWJlLCBSaWNr
IFAgd3JvdGU6Cj4gT24gV2VkLCAyMDI0LTAyLTIxIGF0IDEyOjU3IC0wNTAwLCBkYWxpYXNAbGli
Yy5vcmcgd3JvdGU6Cj4gPiA+IFRoaXMgZmVlbHMgbGlrZSBpdCdzIGdldHRpbmcgY29tcGxpY2F0
ZWQgYW5kIEkgZmVhciBpdCBtYXkgYmUgYW4KPiA+ID4gdXBoaWxsCj4gPiA+IHN0cnVnZ2xlIHRv
IGdldCBzdWNoIGNvZGUgbWVyZ2VkLCBhdCBsZWFzdCBmb3IgYXJtNjQuwqAgTXkgaW5zdGluY3QK
PiA+ID4gaXMKPiA+ID4gdGhhdCBpdCdzIGdvaW5nIHRvIGJlIG11Y2ggbW9yZSByb2J1c3QgYW5k
IGdlbmVyYWxseSB0cmFjdGFibGUgdG8KPiA+ID4gbGV0Cj4gPiA+IHRoaW5ncyBydW4gdG8gc29t
ZSBzdWl0YWJsZSBzeW5jaHJvbmlzYXRpb24gcG9pbnQgYW5kIHRoZW4gZGlzYWJsZQo+ID4gPiB0
aGVyZSwgYnV0IGlmIHdlJ3JlIGdvaW5nIHRvIGRvIHRoYXQgdGhlbiB1c2Vyc3BhY2UgY2FuIGhv
cGVmdWxseQo+ID4gPiBhcnJhbmdlIHRvIGRvIHRoZSBkaXNhYmxpbmcgaXRzZWxmIHRocm91Z2gg
dGhlIHN0YW5kYXJkIGRpc2FibGUKPiA+ID4gaW50ZXJmYWNlIGFueXdheS7CoCBQcmVzdW1hYmx5
IGl0J2xsIHdhbnQgdG8gbm90aWNlIHRoaW5ncyBiZWluZwo+ID4gPiBkaXNhYmxlZAo+ID4gPiBh
dCBzb21lIHBvaW50IGFueXdheT/CoCBUQkggdGhhdCdzIGJlZW4gaG93IGFsbCB0aGUgcHJpb3Ig
cHJvcG9zYWxzCj4gPiA+IGZvcgo+ID4gPiBwcm9jZXNzIHdpZGUgZGlzYWJsZSBJJ3ZlIHNlZW4g
d2VyZSBkb25lLgo+ID4gCj4gPiBJZiBpdCdzIHBvc3NpYmxlIHRvIGRpc2FibGUgcGVyLXRocmVh
ZCByYXRoZXIgdGhhbiBwZXItcHJvY2Vzcywgc29tZQo+ID4gdGhpbmdzIGFyZSBlYXNpZXIuIERp
c2FibGluZyBvbiBhY2NvdW50IG9mIHVzaW5nIGFsdCBzdGFja3Mgb25seQo+ID4gbmVlZHMKPiA+
IHRvIGJlIGRvbmUgb24gdGhlIHRocmVhZHMgdXNpbmcgdGhvc2Ugc3RhY2tzLiBIb3dldmVyLCBm
b3IgZGxvcGVuCj4gPiBwdXJwb3NlcyB5b3UgbmVlZCBhIHdheSB0byBkaXNhYmxlIHNoYWRvdyBz
dGFjayBmb3IgdGhlIHdob2xlCj4gPiBwcm9jZXNzLgo+ID4gSW5pdGlhbGx5IHRoaXMgaXMgb25s
eSBuZWVkZWQgZm9yIHRoZSB0aHJlYWQgdGhhdCBjYWxsZWQgZGxvcGVuLCBidXQKPiA+IGl0IG5l
ZWRzIHRvIGhhdmUgcHJvcGFnYXRlZCB0byBhbnkgdGhyZWFkIHRoYXQgc3luY2hyb25pemVzIHdp
dGgKPiA+IGNvbXBsZXRpb24gb2YgdGhlIGNhbGwgdG8gZGxvcGVuIGJ5IHRoZSB0aW1lIHRoYXQg
c3luY2hyb25pemF0aW9uCj4gPiBvY2N1cnMsIGFuZCBzaW5jZSB0aGF0IHN5bmNocm9uaXphdGlv
biBjYW4gaGFwcGVuIGluIGxvdHMgb2YKPiA+IGRpZmZlcmVudAo+ID4gd2F5cyB0aGF0IGFyZSBw
dXJlbHkgdXNlcnNwYWNlICh0aGFua3MgdG8gZnV0ZXhlcyBiZWluZyB1c2Vyc3BhY2UgaW4KPiA+
IHRoZSB1bmNvbnRlbmRlZCBjYXNlKSwgSSBkb24ndCBzZWUgYW55IHdheSB0byBtYWtlIGl0IHdv
cmsgd2l0aG91dAo+ID4gZXh0cmVtZWx5IGludmFzaXZlLCBoaWdoLWNvc3QgY2hlY2tzLgo+IAo+
IEZvciBnbGliYydzIHVzZSwgd2UgdGFsa2VkIGFib3V0IGEgY291cGxlIG9mIG9wdGlvbnMuCj4g
MS4gQSBtb2RlIHRvIHN0YXJ0IHN1cHByZXNzaW5nIHRoZSAjVUQncyBmcm9tIHRoZSBzaGFkb3cg
c3RhY2sKPiBpbnN0cnVjdGlvbnMKPiAyLiBBIG1vZGUgdG8gc3RhcnQgc3VwcHJlc3NpbmcgI0NQ
cyAodGhlIGV4Y2VwdGlvbiB0aGF0IGhhcHBlbnMgd2hlbgo+IHRoZSBzaGFkb3cgc3RhY2sgZG9l
c24ndCBtYXRjaCkuIFNvIHRoZSBzaGFkb3cgc3RhY2sgaW5zdHJ1Y3Rpb25zCj4gY29udGludWUg
dG8gb3BlcmF0ZSBub3JtYWxseSwgYnV0IGlmIHRoZSBzaGFkb3cgc3RhY2sgZ2V0cyBtaXNtYXRj
aGVkCj4gZHVlIHRvIGxhY2sgb2Ygc3VwcG9ydCwgdGhlIHJldCBpcyBlbXVsYXRlZC4gSXQgcHJv
YmFibHkgaXMgc2FmZXIgKGJ1dAo+IHN0aWxsIG5vdCBwZXJmZWN0KSwgYnV0IHRoZSBwZXJmb3Jt
YW5jZSBwZW5hbHR5IG9mIGVtdWxhdGluZyBldmVyeSBSRVQKPiBhZnRlciB0aGluZ3MgZ2V0IHNj
cmV3ZWQgdXAgd291bGQgYmUgYSBzaWduaWZpY2FudCBkb3duIHNpZGUuIFRoZXJlCj4gYWxzbyBu
ZWVkcyB0byBiZSBjbGVhbiBoYW5kbGluZyBvZiBzaGFkb3cgc3RhY2sgI1BGcy4KPiAzLiBQZXIt
dGhyZWFkIGxvY2tpbmcgdGhhdCBpcyB1c2VkIGFyb3VuZCBhbGwgc2hhZG93IHN0YWNrIG9wZXJh
dGlvbnMKPiB0aGF0IGNvdWxkIGJlIHNlbnNpdGl2ZSB0byBkaXNhYmxpbmcuIFRoaXMgY291bGQg
YmUgbWF5YmUgZXhwb3NlZCB0bwo+IGFwcHMgaW4gY2FzZSB0aGV5IHdhbnQgdG8gdXNlIHNoYWRv
dyBzdGFjayBpbnN0cnVjdGlvbnMgbWFudWFsbHkuIFRoZW4KPiBkdXJpbmcgZGxvcGVuKCkgaXQg
d2FpdHMgdW50aWwgaXQgY2FuIGNsZWFubHkgZGlzYWJsZSBzaGFkb3cgc3RhY2sgZm9yCj4gZWFj
aCB0aHJlYWQuIEluIGVhY2ggY3JpdGljYWwgc2VjdGlvbnMgdGhlcmUgYXJlIGNoZWNrcyBmb3Ig
d2hldGhlcgo+IHNoYWRvdyBzdGFjayBpcyBzdGlsbCBlbmFibGVkLgo+IAo+IDMgaXMgdGhlIGNs
ZWFuZXN0IGFuZCBzYWZlc3QgSSB0aGluaywgYW5kIGl0IHdhcyB0aG91Z2h0IGl0IG1pZ2h0IG5v
dAo+IG5lZWQga2VybmVsIGhlbHAsIGR1ZSB0byBhIHNjaGVtZSBGbG9yaWFuIGhhZCB0byBkaXJl
Y3Qgc2lnbmFscyB0bwo+IHNwZWNpZmljIHRocmVhZHMuIEl0J3MgbXkgcHJlZmVyZW5jZSBhdCB0
aGlzIHBvaW50LgoKVGhlIG9wZXJhdGlvbnMgd2hlcmUgdGhlIHNoYWRvdyBzdGFjayBoYXMgdG8g
YmUgcHJvY2Vzc2VkIG5lZWQgdG8gYmUKZXhlY3V0YWJsZSBmcm9tIGFzeW5jLXNpZ25hbCBjb250
ZXh0LCBzbyB0aGlzIGltcG9zZXMgYSByZXF1aXJlbWVudCB0bwpibG9jayBhbGwgc2lnbmFscyBh
cm91bmQgdGhlIGxvY2suIFRoaXMgbWFrZXMgYWxsIGxvbmdqbXBzIGEgaGVhdnksCm11bHRpLXN5
c2NhbGwgb3BlcmF0aW9uIHJhdGhlciB0aGFuIE8oMSkgdXNlcnNwYWNlIG9wZXJhdGlvbi4gSSBk
byBub3QKdGhpbmsgdGhpcyBpcyBhbiBhY2NlcHRhYmxlIGltcGxlbWVudGF0aW9uLCBlc3BlY2lh
bGx5IHdoZW4gdGhlcmUgYXJlCmNsZWFybHkgc3VwZXJpb3IgYWx0ZXJuYXRpdmVzIHdpdGhvdXQg
dGhhdCBjb3N0IG9yIGludmFzaXZlbmVzcy4KCj4gMSBhbmQgMiBhcmUgUE9DZWQgaGVyZSwgaWYg
eW91IGFyZSBpbnRlcmVzdGVkOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9ycGVkZ2Vjby9saW51eC9j
b21taXRzL3Noc3RrX3N1cHByZXNzX3JmYy8KCkknbSBub3QgY2xlYXIgd2h5IDIgKHN1cHByZXNz
aW9uIG9mICNDUCkgaXMgZGVzaXJhYmxlIGF0IGFsbC4gSWYKc2hhZG93IHN0YWNrIGlzIGJlaW5n
IGRpc2FibGVkLCBpdCBzaG91bGQganVzdCBiZSBkaXNhYmxlZCwgd2l0aAptaW5pbWFsIGZhdWx0
IGhhbmRsaW5nIHRvIHBhcGVyIG92ZXIgYW55IHJhY2luZyBvcGVyYXRpb25zIGF0IHRoZQptb21l
bnQgaXQncyBkaXNhYmxlZC4gTGVhdmluZyBpdCBvbiB3aXRoIGV4dHJlbWUgc2xvd25lc3MgdG8g
bWFrZSBpdApub3QgYWN0dWFsbHkgZG8gYW55dGhpbmcgZG9lcyBub3Qgc2VlbSB1c2VmdWwuCgpJ
cyB0aGVyZSBzb21lIHdheSBmb2xrcyBoYXZlIGluIG1pbmQgdG8gdXNlIG9wdGlvbiAyIHRvIGxh
emlseSBkaXNhYmxlCnNoYWRvdyBzdGFjayBvbmNlIHRoZSBmaXJzdCBTUy1pbmNvbXBhdGlibGUg
Y29kZSBpcyBleGVjdXRlZCwgd2hlbgpleGVjdXRpb24gaXMgdGhlbiBrbm93biBub3QgdG8gYmUg
aW4gdGhlIG1pZGRsZSBvZiBhIFNTLWNyaXRpY2FsCnNlY3Rpb24sIGluc3RlYWQgb2YgZG9pbmcg
aXQgcmlnaHQgYXdheT8gSSBkb24ndCBzZWUgaG93IHRoaXMgY291bGQKd29yaywgc2luY2UgdGhl
IFNTLWluY29tcGF0aWJsZSBjb2RlIGNvdWxkIGJlIHJ1bm5pbmcgZnJvbSBhIHNpZ25hbApoYW5k
bGVyIHRoYXQgaW50ZXJydXB0ZWQgYW4gU1MtY3JpdGljYWwgc2VjdGlvbi4KCj4gPiBJZiBmb2xr
cyBvbiB0aGUga2VybmVsIHNpZGUgYXJlIG5vdCBnb2luZyB0byBiZSBhbWVuYWJsZSB0byBkb2lu
ZyB0aGUKPiA+IHRoaW5ncyB0aGF0IGFyZSBlYXN5IGZvciB0aGUga2VybmVsIHRvIG1ha2UgaXQg
d29yayB3aXRob3V0IGJyZWFraW5nCj4gPiBjb21wYXRpYmlsaXR5IHdpdGggZXhpc3RpbmcgaW50
ZXJmYWNlcywgYnV0IHRoYXQgYXJlIGltcG9zc2libGUgb3IKPiA+IG5lYXItaW1wb3NzaWJsZSBm
b3IgdXNlcnNwYWNlIHRvIGRvLCB0aGlzIHNlZW1zIGxpa2UgYSBkZWFkLWVuZC4gQW5kCj4gPiBJ
Cj4gPiBzdXNwZWN0IGFuIG9wZXJhdGlvbiB0byAiZGlzYWJsZSBzaGFkb3cgc3RhY2ssIGJ1dCB3
aXRob3V0IG1ha2luZwo+ID4gdGhyZWFkcyBzdGlsbCBpbiBTUy1jcml0aWNhbCBzZWN0aW9ucyBj
cmFzaCIgaXMgZ29pbmcgdG8gYmUKPiA+IG5lY2Vzc2FyeS4uCj4gCj4gSSB0aGluayB3ZSBoYXZl
IHRvIHdvcmsgdGhyb3VnaCBhbGwgdGhlIGFsdGVybmF0aXZlIGJlZm9yZSB3ZSBjYW4KPiBhY2N1
c2UgdGhlIGtlcm5lbCBvZiBub3QgYmVpbmcgYW1lbmFibGUuIElzIHRoZXJlIHNvbWV0aGluZyB0
aGF0IHlvdQo+IHdvdWxkIGxpa2UgdG8gc2VlIG91dCBvZiB0aGlzIGNvbnZlcnNhdGlvbiB0aGF0
IGlzIG5vdCBoYXBwZW5pbmc/CgpObywgSSB3YXMganVzdCBpbnRlcnByZXRpbmcgInVwaGlsbCBi
YXR0bGUiLiBJIHJlYWxseSBkbyBub3Qgd2FudCB0bwplbmdhZ2UgaW4gYW4gdXBoaWxsIGJhdHRs
ZSBmb3IgdGhlIHNha2Ugb2YgbWFraW5nIGl0IHByYWN0aWNhbCB0bwpzdXBwb3J0IHNvbWV0aGlu
ZyB0aGF0IHdhcyBuZXZlciBteSBnb2FsIHRvIGJlZ2luIHdpdGguIElmIEknbQptaXNyZWFkaW5n
IHRoaXMsIG9yIGlmIG90aGVycyBhcmUgd2lsbGluZyB0byBwdXQgdGhlIGVmZm9ydCBpbnRvIHRo
YXQKImJhdHRsZSIsIEknZCBiZSBoYXBweSB0byBiZSBtaXN0YWtlbiBhYm91dCAibm90IGFtZW5h
YmxlIi4KClJpY2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
