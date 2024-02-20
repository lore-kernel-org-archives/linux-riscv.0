Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABAFC48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 20:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYUNt59CweEaVGqFi0Y+AMJ9ODiI/gvjk7gmX4sZG5U=; b=XxLl40Wn7d1EjJ
	Ls81PxvrbrJroguS7umBVAsukl7X3U1dWl8QsBS1+HbbfEz78cw2di2MlfwDXxZrEflJv8ewVQ8/t
	/Baf5t80ztsCygF7CUJZilisd1+w5jzDfYFss2ALLTE2dr0j4twh+/8pmShszjQhLOgqaTW23geYE
	l3YcttV+Uif6VRwXDkqohMWSe+KiCIQi6SzD2pLQE05u/AeYeWXPHDsRgqiP11QEs+F7NYYvMW/Nk
	VMgibCo6kgm8XH/jPvZdgKc2meRyOtcK/aKHDxVqKyNOq+3K3J8QqHCTApjxIo9dXu8yNUuI0pANn
	gum+DxphfLkT1gDC89FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcWnS-0000000G7zN-1UH7;
	Tue, 20 Feb 2024 20:32:58 +0000
Received: from brightrain.aerifal.cx ([2001:19f0:5:42::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcWnP-0000000G7wu-0lwS
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 20:32:56 +0000
Date: Tue, 20 Feb 2024 13:57:15 -0500
From: Rich Felker <dalias@libc.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "ardb@kernel.org" <ardb@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"will@kernel.org" <will@kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"sorear@fastmail.com" <sorear@fastmail.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"thiago.bauermann@linaro.org" <thiago.bauermann@linaro.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"musl@lists.openwall.com" <musl@lists.openwall.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [musl] Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS
 in userspace
Message-ID: <20240220185714.GO4163@brightrain.aerifal.cx>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <22a53b78-10d7-4a5a-a01e-b2f3a8c22e94@app.fastmail.com>
 <4c7bdf8fde9cc45174f10b9221fa58ffb450b755.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c7bdf8fde9cc45174f10b9221fa58ffb450b755.camel@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_123255_544827_34C33D69 
X-CRM114-Status: GOOD (  41.03  )
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

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgMDY6NDE6MDVQTSArMDAwMCwgRWRnZWNvbWJlLCBSaWNr
IFAgd3JvdGU6Cj4gSGksCj4gCj4gSSB3b3JrZWQgb24gdGhlIHg4NiBrZXJuZWwgc2hhZG93IHN0
YWNrIHN1cHBvcnQuIEkgdGhpbmsgaXQgaXMgYW4KPiBpbnRlcmVzdGluZyBzdWdnZXN0aW9uLiBT
b21lIHF1ZXN0aW9ucyBiZWxvdywgYW5kIEkgd2lsbCB0aGluayBtb3JlIG9uCj4gaXQuCj4gCj4g
T24gVHVlLCAyMDI0LTAyLTIwIGF0IDExOjM2IC0wNTAwLCBTdGVmYW4gTydSZWFyIHdyb3RlOgo+
ID4gV2hpbGUgZGlzY3Vzc2luZyB0aGUgQUJJIGltcGxpY2F0aW9ucyBvZiBzaGFkb3cgc3RhY2tz
IGluIHRoZSBjb250ZXh0Cj4gPiBvZgo+ID4gWmljZmlzcyBhbmQgbXVzbCBhIGZldyBkYXlzIGFn
bywgSSBoYWQgdGhlIGZvbGxvd2luZyBpZGVhIGZvciBob3cgdG8KPiA+IHNvbHZlCj4gPiB0aGUg
c291cmNlIGNvbXBhdGliaWxpdHkgcHJvYmxlbXMgd2l0aCBzaGFkb3cgc3RhY2tzIGluIFBPU0lY
LjEtMjAwNAo+ID4gYW5kCj4gPiBQT1NJWC4xLTIwMTc6Cj4gPiAKPiA+IDEuIEludHJvZHVjZSBh
ICJmbGV4aWJsZSBzaGFkb3cgc3RhY2sgaGFuZGxpbmciIG9wdGlvbi7CoCBGb3Igd2hhdAo+ID4g
Zm9sbG93cywKPiA+IMKgwqAgaXQgZG9lc24ndCBtYXR0ZXIgaWYgdGhpcyBpcyBzeXN0ZW0td2lk
ZSwgcGVyLW1tLCBvciBwZXItdm1hLgo+ID4gCj4gPiAyLiBTaGFkb3cgc3RhY2sgZmF1bHRzIG9u
IG5vbi1zaGFkb3cgc3RhY2sgcGFnZXMsIGlmIGZsZXhpYmxlIHNoYWRvdwo+ID4gc3RhY2sKPiA+
IMKgwqAgaGFuZGxpbmcgaXMgaW4gZWZmZWN0LCBjYXVzZSB0aGUgYWZmZWN0ZWQgcGFnZSB0byBi
ZWNvbWUgYSBzaGFkb3cKPiA+IHN0YWNrCj4gPiDCoMKgIHBhZ2UuwqAgV2hlbiB0aGlzIGhhcHBl
bnMsIHRoZSBwYWdlIGZpbGxlZCB3aXRoIGludmFsaWQgYWRkcmVzcwo+ID4gdG9rZW5zLgo+IAo+
IEhtbSwgY291bGQgdGhlIHNoYWRvdyBzdGFjayB1bmRlcmZsb3cgb250byB0aGUgcmVhbCBzdGFj
ayB0aGVuPyBOb3QKPiBzdXJlIGhvdyBiYWQgdGhhdCBpcy4gSU5DU1NQIChpbmNyZW1lbnRpbmcg
dGhlIFNTUCByZWdpc3RlciBvbiB4ODYpCj4gbG9vcHMgYXJlIG5vdCByYXJlIHNvIGl0IHNlZW1z
IGxpa2Ugc29tZXRoaW5nIHRoYXQgY291bGQgaGFwcGVuLgoKU2hhZG93IHN0YWNrIHVuZGVyZmxv
dyBzaG91bGQgZmF1bHQgb24gYXR0ZW1wdCB0byBhY2Nlc3MKbm9uLXNoYWRvdy1zdGFjayBtZW1v
cnkgYXMgc2hhZG93LXN0YWNrLCBubz8KCj4gPiDCoMKgIEZhdWx0cyBmcm9tIG5vbi1zaGFkb3ct
c3RhY2sgYWNjZXNzZXMgdG8gYSBzaGFkb3ctc3RhY2sgcGFnZSB3aGljaAo+ID4gd2FzCj4gPiDC
oMKgIGNyZWF0ZWQgYnkgdGhlIHByZXZpb3VzIHBhcmFncmFwaCB3aWxsIGNhdXNlIHRoZSBwYWdl
IHRvIHJldmVydCB0bwo+ID4gwqDCoCBub24tc2hhZG93LXN0YWNrIHVzYWdlLCB3aXRoIG9yIHdp
dGhvdXQgY2xlYXJpbmcuCj4gCj4gV29uJ3QgdGhpcyBwcmV2ZW50IGNhdGNoaW5nIHN0YWNrIG92
ZXJmbG93cyB3aGVuIHRoZXkgaGFwcGVuPyBBbgo+IG92ZXJmbG93IHdpbGwganVzdCB0dXJuIHRo
ZSBzaGFkb3cgc3RhY2sgaW50byBub3JtYWwgc3RhY2sgYW5kIG9ubHkgZ2V0Cj4gZGV0ZWN0ZWQg
d2hlbiB0aGUgc2hhZG93IHN0YWNrIHVud2luZHM/CgpJIGRvbid0IHRoaW5rIHRoYXQncyBhcyBi
aWcgYSBwcm9ibGVtIGFzIGl0IHNvdW5kcyBsaWtlLiBJdCBtaWdodCBtYWtlCnBpbnBvaW50aW5n
IHRoZSBzcG90IGF0IHdoaWNoIHRoaW5ncyB3ZW50IHdyb25nIHRha2UgYSBsaXR0bGUgYml0IG1v
cmUKd29yaywgYnV0IGl0IHNob3VsZCBub3QgYWRtaXQgYW55IHdyb25nLWV4ZWN1dGlvbi4KCj4g
QSByZWxhdGVkIHF1ZXN0aW9uIHdvdWxkIGJlIGhvdyB0byBoYW5kbGUgdGhlIGV4cGFuZGluZyBu
YXR1cmUgb2YgdGhlCj4gaW5pdGlhbCBzdGFjay4gSSBndWVzcyB0aGUgaW5pdGlhbCBzdGFjayBj
b3VsZCBiZSBzcGVjaWFsIGFuZCBoYXZlIGEKPiBzZXBhcmF0ZSBzaGFkb3cgc3RhY2suCgpUaGF0
IHNlZW1zIGZpbmUuCgo+ID4gwqDCoCBJbXBvcnRhbnQ6IGEgc2hhZG93IHN0YWNrIG9wZXJhdGlv
biBjYW4gb25seSBsb2FkIGEgdmFsaWQgYWRkcmVzcwo+ID4gZnJvbQo+ID4gwqDCoCBhIHBhZ2Ug
aWYgdGhhdCBwYWdlIGhhcyBiZWVuIGluIGNvbnRpbnVvdXMgc2hhZG93IHN0YWNrIHVzZSBzaW5j
ZQo+ID4gdGhlCj4gPiDCoMKgIGFkZHJlc3Mgd2FzIHdyaXR0ZW4gYnkgYW5vdGhlciBzaGFkb3cg
c3RhY2sgb3BlcmF0aW9uOyB0aGUKPiA+IGZsZXhpYmlsaXR5Cj4gPiDCoMKgIGRlbGF5cyBlcnJv
ciByZXBvcnRpbmcgaW4gY2FzZXMgb2Ygc3RyYXkgd3JpdGVzIGJ1dCBpdCBuZXZlcgo+ID4gYWxs
b3dzIGZvcgo+ID4gwqDCoCBjb3JydXB0aW9uIG9mIHNoYWRvdyBzdGFjayBvcGVyYXRpb24uCj4g
Cj4gU2hhZG93IHN0YWNrcyBjdXJyZW50bHkgaGF2ZSBhdXRvbWF0aWMgZ3VhcmQgZ2FwcyB0byB0
cnkgdG8gcHJldmVudCBvbmUKPiB0aHJlYWQgZnJvbSBvdmVyZmxvd2luZyBvbnRvIGFub3RoZXIg
dGhyZWFkJ3Mgc2hhZG93IHN0YWNrLiBUaGlzIHdvdWxkCj4gc29tZXdoYXQgb3BlbnMgdGhhdCB1
cCwgYXMgdGhlIHN0YWNrIGd1YXJkIGdhcHMgYXJlIHVzdWFsbHkgbWFpbnRhaW5lZAo+IGJ5IHVz
ZXJzcGFjZSBmb3IgbmV3IHRocmVhZHMuIEl0IHdvdWxkIGhhdmUgdG8gYmUgdGhvdWdodCB0aHJv
dWdoIGlmCj4gdGhlc2UgY291bGQgc3RpbGwgYmUgZW5mb3JjZWQgd2l0aCBjaGVja2luZyBhdCBh
ZGRpdGlvbmFsIHNwb3RzLgoKSSB3b3VsZCB0aGluayB0aGUgZXhpc3RpbmcgZ3VhcmQgcGFnZXMg
d291bGQgYWxyZWFkeSBkbyB0aGF0IGlmIGEKdGhyZWFkJ3Mgc2hhZG93IHN0YWNrIGlzIGNvbnRp
Z3VvdXMgd2l0aCBpdHMgb3duIGRhdGEgc3RhY2suCgo+ID4gMy4gU3RhbmRhcmRzLWRlZmluZWQg
b3BlcmF0aW9ucyB3aGljaCB1c2UgYSB1c2VyLXByb3ZpZGVkIHN0YWNrCj4gPiDCoMKgIChtYWtl
Y29udGV4dCwgc2lnYWx0c3RhY2ssIHB0aHJlYWRfYXR0cl9zZXRzdGFjaykgdXNlIGEgc3VicmFu
Z2UKPiA+IG9mIHRoZQo+ID4gwqDCoCBwcm92aWRlZCBzdGFjayBmb3Igc2hhZG93IHN0YWNrIHN0
b3JhZ2UuwqAgSSBwcm9wb3NlIHRvIHVzZSBhCj4gPiBzaGFkb3cKPiA+IMKgwqAgc3RhY2sgc2l6
ZSBvZiAxLzMyIG9mIHRoZSBwcm92aWRlZCBzdGFjayBzaXplLCByb3VuZGVkIHVwIHRvIGEKPiA+
IHBvc2l0aXZlCj4gPiDCoMKgIGludGVnZXIgbnVtYmVyIG9mIHBhZ2VzLCBhbmQgcGxhY2UgdGhl
IHNoYWRvdyBzdGFjayBhbGxvY2F0aW9uIGF0Cj4gPiB0aGUKPiA+IMKgwqAgbG93ZXN0IHBhZ2Ut
YWxpZ25lZCBhZGRyZXNzIGluc2lkZSB0aGUgcHJvdmlkZWQgc3RhY2sgcmVnaW9uLgo+ID4gCj4g
PiDCoMKgIFNpbmNlIHBhZ2UgdXNhZ2UgaXMgZmxleGlibGUsIG5vIGNoYW5nZSBpbiBwYWdlIHBl
cm1pc3Npb25zIGlzCj4gPiDCoMKgIGltbWVkaWF0ZWx5IG5lZWRlZDsgdGhpcyBtZXJlbHkgc2V0
cyB0aGUgaW5pdGlhbCBzaGFkb3cgc3RhY2sKPiA+IHBvaW50ZXIgZm9yCj4gPiDCoMKgIHRoZSBu
ZXcgY29udGV4dC4KPiA+IAo+ID4gwqDCoCBJZiB0aGUgc2hhZG93IHN0YWNrIGdyZXcgaW4gdGhl
IG9wcG9zaXRlIGRpcmVjdGlvbiB0byB0aGUKPiA+IGFyY2hpdGVjdHVyYWwKPiA+IMKgwqAgc3Rh
Y2ssIGl0IHdvdWxkIG5vdCBiZSBuZWNlc3NhcnkgdG8gcGljayBhIGZpeGVkIGRpcmVjdGlvbi4K
PiA+IAo+ID4gNC4gU0lHU1RLU1ogYW5kIE1JTlNJR1NUS1NaIGFyZSBpbmNyZWFzZWQgYnkgMiBw
YWdlcyB0byBwcm92aWRlCj4gPiBzdWZmaWNpZW50Cj4gPiDCoMKgIHNwYWNlIGZvciBhIG1pbmlt
dW0tc2l6ZWQgc2hhZG93IHN0YWNrIHJlZ2lvbiBhbmQgd29yc3QgY2FzZQo+ID4gYWxpZ25tZW50
Lgo+IAo+IERvIGFsbCBtYWtlY29udGV4dCgpIGNhbGxlcnMgZW5zdXJlIHRoZSBzaXplIGlzIGdy
ZWF0ZXIgdGhhbiB0aGlzPwo+IAo+IEkgZ3Vlc3MgZ2xpYmMncyBtYWtlY29udGV4dCgpIGNvdWxk
IGRvIHRoaXMgc2NoZW1lIHRvIHByZXZlbnQgbGVha2luZwo+IHdpdGhvdXQgYW55IGNoYW5nZXMg
dG8gdGhlIGtlcm5lbC4gQmFzaWNhbGx5IHN0ZWFsIGEgbGl0dGxlIG9mIHRoZQo+IHN0YWNrIGFk
ZHJlc3MgcmFuZ2UgYW5kIG92ZXJ3cml0ZSBpdCB3aXRoIGEgc2hhZG93IHN0YWNrIG1hcHBpbmcu
IEJ1dAo+IG9ubHkgaWYgdGhlIGFwcHMgbGVhdmUgZW5vdWdoIHJvb20uIElmIHRoZXkgbmVlZCB0
byBiZSB1cGRhdGVkLCB0aGVuCj4gdGhleSBjb3VsZCBiZSB1cGRhdGVkIHRvIG1hbmFnZSB0aGVp
ciBvd24gc2hhZG93IHN0YWNrcyB0b28gSSB0aGluay4KCkZyb20gdGhlIG11c2wgc2lkZSwgSSBo
YXZlIGFsd2F5cyBsb29rZWQgYXQgdGhlIGVudGlyZWx5IG9mIHNoYWRvdwpzdGFjayBzdHVmZiB3
aXRoIHZlcnkgaGVhdnkgc2tlcHRpY2lzbSwgYW5kIGFueXRoaW5nIHRoYXQgYnJlYWtzCmV4aXN0
aW5nIGludGVyZmFjZSBjb250cmFjdHMsIGludHJvZHVjZWQgcGxhY2VzIHdoZXJlIGFwcHMgY2Fu
IGdldAphdXRvLWtpbGxlZCBiZWNhdXNlIGEgbGF0ZSByZXNvdXJjZSBhbGxvY2F0aW9uIGZhaWxz
LCBvciByZXF1aXJlcwphcHBsaWNhdGlvbnMgdG8gY29kZSBhcm91bmQgdGhlIGV4aXN0ZW5jZSBv
ZiBzb21ldGhpbmcgdGhhdCBzaG91bGQgYmUKYW4gaW1wbGVtZW50YXRpb24gZGV0YWlsLCBpcyBh
IG5vbi1zdGFydGVyLiBUbyBldmVuIGNvbnNpZGVyIHNoYWRvdwpzdGFjayBzdXBwb3J0LCBpdCBt
dXN0IHRydWVseSBiZSBmdWxseSBub24tYnJlYWtpbmcuCgo+ID4gX1dpdGhvdXRfIGRvaW5nIHRo
aXMsIHNpZ2FsdHN0YWNrIGNhbm5vdCBiZSB1c2VkIHRvIHJlY292ZXIgZnJvbQo+ID4gc3RhY2sK
PiA+IG92ZXJmbG93cyBpZiB0aGUgc2hhZG93IHN0YWNrIGxpbWl0IGlzIHJlYWNoZWQgZmlyc3Qs
IGFuZCBtYWtlY29udGV4dAo+ID4gY2Fubm90IGJlIHN1cHBvcnRlZCB3aXRob3V0IG1lbW9yeSBs
ZWFrcyBhbmQgdW5yZXBvcnRhYmxlIGVycm9yCj4gPiBjb25kaXRpb25zLgo+IAo+IEZXSVcsIEkg
dGhpbmsgdGhlIG1ha2Vjb250ZXh0KCkgc2hhZG93IHN0YWNrIGxlYWtpbmcgaXMgYSBiYWQgaWRl
YS4gSQo+IHdvdWxkIHByZWZlciB0aGUgZXhpc3RpbmcgbWFrZWNvbnRleHQoKSBpbnRlcmZhY2Ug
anVzdCBkaWRuJ3Qgc3VwcG9ydAo+IHNoYWRvdyBzdGFjaywgcmF0aGVyIHRoYW4gdGhlIGxlYWtp
bmcgc29sdXRpb24gZ2xpYmMgZG9lcyB0b2RheS4KCkFJVUkgdGhlIHByb3Bvc2FsIGJ5IFN0ZWZh
biBtYWtlcyBpdCBub24tbGVha2luZyBiZWNhdXNlIGl0J3MganVzdAp1c2luZyBub3JtYWwgbWVt
b3J5IHRoYXQgcmV2ZXJ0cyB0byBub3JtYWwgdXNhZ2Ugb24gYW55Cm5vbi1zaGFkb3ctc3RhY2sg
YWNjZXNzLgoKUmljaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
