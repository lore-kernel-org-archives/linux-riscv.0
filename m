Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BD9C001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 18:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgZ9wxFJYyoR1BYH6sVSQM6YjA/6zvtkaMbSrVgJJWU=; b=QFXH9TPi32pMw0
	+drPLTmanOGusoWqrYazNUIYJZfivuJb0vuUCPQNcr1LTuq5n8sdgTdEMg9q1bM2WZm9YIPYWwc4y
	VIJkqAuXUmIpWyzsTLRlSkKrA7IsUdltYn9SL7D+ikacvlIR0l8UaM3o8wUlzTTVc1N2dPXk6Cgrw
	b7wdL2YClwYNCPEV47epvfR6keh5PFxnix6WsxARYKXDfWEYs8uZdPXmAFsfZYX+I5+m8nBWnJcj3
	MR9EUmi3/hQ48fsZ/P1kxG5atWnQmqhM+Nb4b8j96kzaSFL9Z/a86xRU5AOlsO2Ojdt1CTX/c/0QB
	AIo4Lt49jnlScJaoARXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVz2t-002CsH-1X;
	Tue, 15 Aug 2023 18:45:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVz2r-002Crf-37;
	Tue, 15 Aug 2023 18:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CJcYMi6QPasa4lP67RrbUqXLIASUuiOpkeCi2FMXBCU=; b=prPdqNkkAMeUikDRLvOoB3f6qa
	hEwQ58HeHQkTEAHKzQn1zXHjzB6GKvaaplIU2TYCYRImt9bZTMfVdaEkVHMKN3b23HPAbR02VwB5D
	DlRAKu1kHwKOzUnq0jlxwULGozlqEqXYtYt8dLLGNrQo7Y/bH6uV4B/Go0XOGIyjwWUo3EkOG+toV
	6pWf/OX3ovZhguxpkXZPQsawrP+U8F/y0bCSUpcAqzbPIXAMeePDMpBtBjmRMs6nQLSNHq63Emiiu
	jmiYt75mPkY6QVLycZpSwzKoNiauCbt6/742v5oX9/6rWOJuOR8oK8PFPttYnZMffbe+zcu1ektDQ
	uvflAB9w==;
Received: from [179.97.37.151] (helo=quaco.ghostprotocols.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qVz2p-00C2Bq-3C;
	Tue, 15 Aug 2023 18:45:32 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id EE356404DF; Tue, 15 Aug 2023 15:45:27 -0300 (-03)
Date: Tue, 15 Aug 2023 15:45:27 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Leo Yan <leo.yan@linaro.org>, John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>, James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ming Wang <wangming01@loongson.cn>, Eric Lin <eric.lin@sifive.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Ivan Babrou <ivan@cloudflare.com>,
	Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/6] perf parse-regs: Refactor architecture functions
Message-ID: <ZNvHx+KxIL6JzEl/@kernel.org>
References: <20230606014559.21783-1-leo.yan@linaro.org>
 <CAP-5=fV1m440mKc0R=m5C4N2NtoiixchtnpX2eR3PA_5hXbqEQ@mail.gmail.com>
 <ZNvCxM/ULdUfzHtR@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNvCxM/ULdUfzHtR@kernel.org>
X-Url: http://acmel.wordpress.com
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

RW0gVHVlLCBBdWcgMTUsIDIwMjMgYXQgMDM6MjQ6MDRQTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIGVzY3JldmV1Ogo+IEVtIFdlZCwgSnVsIDEyLCAyMDIzIGF0IDAzOjM3OjM2UE0g
LTA3MDAsIElhbiBSb2dlcnMgZXNjcmV2ZXU6Cj4gPiBPbiBNb24sIEp1biA1LCAyMDIzIGF0IDY6
NDbigK9QTSBMZW8gWWFuIDxsZW8ueWFuQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBU
aGlzIHBhdGNoIHNlcmllcyBpcyB0byByZWZhY3RvciBhcmNoIHJlbGF0ZWQgZnVuY3Rpb25zIGZv
ciByZWdpc3Rlcgo+ID4gPiBwYXJzaW5nLCB3aGljaCBmb2xsb3dzIHVwIHRoZSBkaXNjdXNzaW9u
IGZvciB2MToKPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDUyMDAyNTUz
Ny4xODExOTg2LTEtbGVvLnlhbkBsaW5hcm8ub3JnLwo+ID4gPgo+ID4gPiBDb21wYXJlZCB0byBw
YXRjaCBzZXJpZXMgdjEsIHRoaXMgcGF0Y2ggc2VyaWVzIGludHJvZHVjZXMgbmV3IGZ1bmN0aW9u
cwo+ID4gPiBwZXJmX2FyY2hfcmVnX3tpcHxzcH0oKSwgc28gdGhpcyBjYW4gYWxsb3cgdGhlIHRv
b2wgdG8gc3VwcG9ydCBjcm9zcwo+ID4gPiBhbmFseXNpcy4KPiA+ID4KPiA+ID4gVG8gdmVyaWZ5
IHRoZSBjcm9zcyBhbmFseXNpcywgSSB1c2VkIGJlbG93IHN0ZXBzOgo+ID4gPgo+ID4gPiAtIEZp
cnN0bHksIEkgY2FwdHVyZWQgcGVyZiBkYXRhIG9uIEFybTY0IG1hY2hpbmU6Cj4gPiA+Cj4gPiA+
ICAgJCBwZXJmIHJlY29yZCAtLWNhbGwtZ3JhcGggZnAgLS0gLi90ZXN0X3Byb2dyYW0KPiA+ID4K
PiA+ID4gICBPciAuLi4KPiA+ID4KPiA+ID4gICAkIHBlcmYgcmVjb3JkIC0tY2FsbC1ncmFwaCBk
d2FyZiAtLSAuL3Rlc3RfcHJvZ3JhbQo+ID4gPgo+ID4gPiAgIFRoZW4sIEkgYWxzbyBhcmNoaXZl
ZCBhc3NvY2lhdGVkIGRlYnVnIGRhdGE6Cj4gPiA+Cj4gPiA+ICAgJCBwZXJmIGFyY2hpdmUKPiA+
ID4KPiA+ID4gLSBTZWNvbmRseSwgSSBjb3BpZWQgdGhlIHBlcmYgZGF0YSBmaWxlIGFuZCBkZWJ1
ZyB0YXIgZmlsZSBvbiBteSB4ODYKPiA+ID4gICBtYWNoaW5lOgo+ID4gPgo+ID4gPiAgICQgc2Nw
IHBlcmYuZGF0YSBwZXJmLmRhdGEudGFyLmJ6MiBsZW95QElQX0FERFJFU1M6L3RhcmdldC9wYXRo
Lwo+ID4gPgo+ID4gPiAtIE9uIHg4NiBtYWNoaW5lLCBJIG5lZWQgdG8gYnVpbGQgcGVyZiBmb3Ig
c3VwcG9ydCBtdWx0aS1hcmNoIHVud2luZGluZzoKPiA+ID4KPiA+ID4gICAkIGdpdCBjbG9uZSBo
dHRwOi8vZ2l0LnNhdmFubmFoLmdudS5vcmcvci9saWJ1bndpbmQuZ2l0Cj4gPiA+ICAgJCBjZCBs
aWJ1bndpbmQKPiA+ID4gICAkIGF1dG9yZWNvbmYgLWkKPiA+ID4KPiA+ID4gICAjIEJ1aWxkIGFu
ZCBpbnN0YWxsIGxpYnVud2luZCBhYXJjaDY0Ogo+ID4gPiAgICQgLi9jb25maWd1cmUgcHJlZml4
PS9ob21lL2xlb3kvV29yay90b29scy9saWJ1bndpbmQvaW5zdGFsbC8gXAo+ID4gPiAgICAgICAg
IC0tdGFyZ2V0PWFhcmNoNjQtbGludXgtZ251IENDPXg4Nl82NC1saW51eC1nbnUtZ2NjCj4gPiA+
ICAgJCBtYWtlICYmIG1ha2UgaW5zdGFsbAo+ID4gPgo+ID4gPiAgICMgQnVpbGQgYW5kIGluc3Rh
bGwgbGlidW53aW5kIHg4NjoKPiA+ID4gICAkIC4vY29uZmlndXJlIHByZWZpeD0vaG9tZS9sZW95
L1dvcmsvdG9vbHMvbGlidW53aW5kL2luc3RhbGwvIFwKPiA+ID4gICAgICAgICAtLXRhcmdldD14
ODZfNjQtbGludXgtZ251IENDPXg4Nl82NC1saW51eC1nbnUtZ2NjCj4gPiA+ICAgJCBtYWtlICYm
IG1ha2UgaW5zdGFsbAo+ID4gPgo+ID4gPiAtIEJ1aWxkIHBlcmYgdG9vbCBmb3Igc3VwcG9ydCBt
dWx0aS1hcmNoczoKPiA+ID4KPiA+ID4gICAkIGNkICRMSU5VWC90b29scy9wZXJmCj4gPiA+ICAg
JCBtYWtlIFZGPTEgREVCVUc9MSBMSUJVTldJTkRfRElSPS9ob21lL2xlb3kvV29yay90b29scy9s
aWJ1bndpbmQvaW5zdGFsbAo+ID4gPgo+ID4gPiBBdCB0aGUgZW5kLCBJIHZlcmlmaWVkIHRoZSB4
ODYgcGVyZiB0b29sIGNhbiBkbyBjcm9zcyBhbmFseXNpcyBmb3IgYWFyY2g2NCdzCj4gPiA+IHBl
cmYgZGF0YSBmaWxlLgo+ID4gPgo+ID4gPiBOb3RlLCBJIHN0aWxsIHNlZSB4ODYgcGVyZiB0b29s
IGNhbm5vdCBkaXNwbGF5IHRoZSBjb21wbGV0ZSBjYWxsZ3JhcGgKPiA+ID4gZm9yIGFhcmNoNjQs
IGJ1dCBpdCBzaG91bGQgbm90IHRoZSBpc3N1ZSBjYXVzZWQgYnkgdGhpcyBzZXJpZXMsIHdoaWNo
Cj4gPiA+IHdpbGwgYmUgYWRkcmVzc2VkIGJ5IHNlcGFyYXRlIHBhdGNoZXMuCj4gPiA+Cj4gPiA+
IEkgYWxzbyBidWlsdCB0aGlzIHBhdGNoIHNlcmllcyBvbiBteSBBcm02NCBhbmQgeDg2IG1hY2hp
bmVzLCBib3RoIGNhbgo+ID4gPiBjb21waWxlIHBlcmYgdG9vbCBzdWNjZXNzZnVsbHk7IGJ1dCBJ
IGhhdmUgbm8gY2hhbmNlIHRvIGJ1aWxkIG90aGVyCj4gPiA+IGFyY2hzIG5hdGl2ZWx5Lgo+ID4g
Pgo+ID4gPiBDaGFuZ2VzIGZyb20gdjE6Cj4gPiA+IC0gRm9yIHN1cHBvcnQgY3Jvc3MgYW5hbHlz
aXMgZm9yIElQL1NQIHJlZ2lzdGVycywgaW50cm9kdWNlZCBwYXRjaCAwMDAyCj4gPiA+ICAgKEph
bWVzIENsYXJrLCBJYW4gUm9nZXJzKS4KPiA+ID4KPiA+ID4KPiA+ID4gTGVvIFlhbiAoNik6Cj4g
PiA+ICAgcGVyZiBwYXJzZS1yZWdzOiBSZWZhY3RvciBhcmNoIHJlZ2lzdGVyIHBhcnNpbmcgZnVu
Y3Rpb25zCj4gPiA+ICAgcGVyZiBwYXJzZS1yZWdzOiBJbnRyb2R1Y2UgZnVuY3Rpb25zIHBlcmZf
YXJjaF9yZWdfe2lwfHNwfSgpCj4gPiA+ICAgcGVyZiB1bndpbmQ6IFVzZSBwZXJmX2FyY2hfcmVn
X3tpcHxzcH0oKSB0byBzdWJzdGl0dXRlIG1hY3Jvcwo+ID4gPiAgIHBlcmYgcGFyc2UtcmVnczog
UmVtb3ZlIHVudXNlZCBtYWNyb3MgUEVSRl9SRUdfe0lQfFNQfQo+ID4gPiAgIHBlcmYgcGFyc2Ut
cmVnczogUmVtb3ZlIFBFUkZfUkVHU197TUFYfE1BU0t9IGZyb20gY29tbW9uIGNvZGUKPiA+ID4g
ICBwZXJmIHBhcnNlLXJlZ3M6IE1vdmUgb3V0IGFyY2ggc3BlY2lmaWMgaGVhZGVyIGZyb20gdXRp
bC9wZXJmX3JlZ3MuaAo+ID4gCj4gPiBTb3JyeSBmb3IgdGhlIHNsb3cgcmV2aWV3LiBGb3IgdGhl
IHNlcmllczoKPiA+IEFja2VkLWJ5OiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+Cj4g
PiAKPiA+IFNvbWUgdGhvdWdodHM6Cj4gPiB1aW50NjRfdCBfX3BlcmZfcmVnX2lwX2FybSh2b2lk
KQo+ID4gdWludDY0X3Qgc2VlbXMgbGlrZSB3ZSdyZSBnaXZpbmcgYSBsb3Qgb2Ygc3BhY2UgZm9y
IGZ1dHVyZSByZWdpc3Rlcgo+ID4gZW5jb2RpbmdzLiBJIHRoaW5rIHNvbWUgb2YgdGhlIG90aGVy
IGZ1bmN0aW9ucyB1c2UgdGhpcyBzaXplIG9mIHZhbHVlCj4gPiBkdWUgdG8gcmV0dXJuaW5nIGEg
Yml0bWFwL21hc2ssIGJ1dCBoZXJlIGl0IGlzbid0IGNsZWFyIGFuZCBqdXN0IGZlZWxzCj4gPiBl
eGNlc3NpdmUuCj4gPiAKPiA+IERvIHdlIG5lZWQgdGhlICJfXyIgcHJlZml4IG9uIGFsbCB0aGUg
ZnVuY3Rpb25zPwo+ID4gCj4gPiBJbiBNYWtlZmlsZS5jb25maWcgdGhlcmUgYXJlIE5PX1BFUkZf
UkVHUyBhbmQgQ09ORklHX1BFUkZfUkVHUyB0aGVuCj4gPiB0aGUgZGVmaW5lIEhBVkVfUEVSRl9S
RUdTX1NVUFBPUlQuIElzIHRoaXMgc3RpbGwgcmVsZXZhbnQ/IElmIHdlIGhhZAo+ID4gYW4gYXJj
aGl0ZWN0dXJlIHdpdGggbm8gc3VwcG9ydCwgY291bGRuJ3QgaXQgc3RpbGwgcmVhZCBhIHBlcmYu
ZGF0YQo+ID4gZmlsZSBmcm9tIGEgc3VwcG9ydGVkIGFyY2hpdGVjdHVyZT8gSXQgd291bGQgYmUg
bmljZSB0byByZW1vdmUgYXQKPiA+IGxlYXN0IE5PX1BFUkZfUkVHUyBhbmQgSEFWRV9QRVJGX1JF
R1NfU1VQUE9SVC4KPiA+IAo+ID4gVGhpcyBjaGFuZ2UgaXMgdmVyeSB3b3J0aHdoaWxlIGZpeCBh
bmQgY2xlYW51cCwgaXQgZGlkbid0IGludHJvZHVjZQo+ID4gd2hhdCBpcyBwb25kZXJlZCBhYm92
ZSwgaGVuY2UgdGhlIGFja2VkLWJ5Lgo+IAo+IEFncmVlZCwgYXBwbGllZCB0byBwZXJmLXRvb2xz
LW5leHQsIHNvcnJ5IGZvciB0aGUgZGVsYXkuCgpIYWQgdG8gYWRkIHRoaXMgdG8gbWFrZSAncGVy
ZiB0ZXN0IHB5dGhvbicgdG8gd29yay4gUGxlYXNlIHJ1biAncGVyZgp0ZXN0JyBiZWZvcmUgc2Vu
ZGluZyBwYXRjaGVzLgoKLSBBcm5hbGRvCgpkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi91dGlsL3B5
dGhvbi1leHQtc291cmNlcyBiL3Rvb2xzL3BlcmYvdXRpbC9weXRob24tZXh0LXNvdXJjZXMKaW5k
ZXggZDRjOWI0Y2QzNWVmYTU1Ni4uMjZlMWM4ZDk3M2VhMGI5NSAxMDA2NDQKLS0tIGEvdG9vbHMv
cGVyZi91dGlsL3B5dGhvbi1leHQtc291cmNlcworKysgYi90b29scy9wZXJmL3V0aWwvcHl0aG9u
LWV4dC1zb3VyY2VzCkBAIC00MCwzICs0MCwxMiBAQCB1dGlsL3J3c2VtLmMKIHV0aWwvaGFzaG1h
cC5jCiB1dGlsL3BlcmZfcmVncy5jCiB1dGlsL2ZuY2FjaGUuYwordXRpbC9wZXJmLXJlZ3MtYXJj
aC9wZXJmX3JlZ3NfYWFyY2g2NC5jCit1dGlsL3BlcmYtcmVncy1hcmNoL3BlcmZfcmVnc19hcm0u
YwordXRpbC9wZXJmLXJlZ3MtYXJjaC9wZXJmX3JlZ3NfY3NreS5jCit1dGlsL3BlcmYtcmVncy1h
cmNoL3BlcmZfcmVnc19sb29uZ2FyY2guYwordXRpbC9wZXJmLXJlZ3MtYXJjaC9wZXJmX3JlZ3Nf
bWlwcy5jCit1dGlsL3BlcmYtcmVncy1hcmNoL3BlcmZfcmVnc19wb3dlcnBjLmMKK3V0aWwvcGVy
Zi1yZWdzLWFyY2gvcGVyZl9yZWdzX3Jpc2N2LmMKK3V0aWwvcGVyZi1yZWdzLWFyY2gvcGVyZl9y
ZWdzX3MzOTAuYwordXRpbC9wZXJmLXJlZ3MtYXJjaC9wZXJmX3JlZ3NfeDg2LmMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
