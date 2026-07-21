Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B623C4451C
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 12:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4gKYq/LvdM4JrZj95BgJoCipIP0mRGi2upgSDBwFbA=; b=a3zz2f+WZpNdKK
	Pz7R3bg6vkQOHIhQ7vpIwCxyEK8JZ0rq9BngRmMc6BgKolbofKmuy9y23PfB054Ns6ARCgN8KKzbO
	JT1rmTSgYJ6SF3H0lJ6U0VkNfSqnJGCGtUtwf0FEzYKhcndDPQswoYynrzpLQcQzbjS1D+YiRzP2G
	+8MGqeThZKoHiPF8cwS1eMoM+qRHwBaLIJhJtysW5ttmHIcnxcrs3R56ZGlmLMwAe06OeodZ1d3IW
	rbWjlj88c54u349a4xOPlAcxOa/BQ2yqqV3DqeaE9SfIPCY8RGHxXE8PJIgJF9n+JHBYHx26KZd80
	yPl4xJPSMIZR+8+jl2ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9Eg-00000009NOt-3qmk;
	Tue, 21 Jul 2026 12:06:10 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9Ee-00000009NOJ-0uwa
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 12:06:09 +0000
Date: Tue, 21 Jul 2026 20:05:49 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784635564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A7dYAlxy/AmMUyH+MlvfhyBiS8Q0C6HxH/Mauukj/gQ=;
	b=eZwE3YxBH34e9tRiCPggwYdYaOw6NhkKu6BTNStYMe942ZxlIFt9cE8RPfN+rNf2WBfllB
	dRtZZhVUmLMxoo5O5g9KDUWfGfoIsGLousnSIDCtVH38WaSJPywwXrv5D8cF+wN4+r7uBQ
	iKjh+SXv0L25Chs5leSM8+RdGynHSSE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Baoquan He <baoquan.he@linux.dev>
To: Omar Sandoval <osandov@osandov.com>
Cc: Mike Rapoport <rppt@kernel.org>, Pnina Feder <pnina.feder@mobileye.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-debuggers@vger.kernel.org
Subject: Re: [PATCH 0/4] vmcore-tasks: export per-task metadata to vmcoreinfo
Message-ID: <al9gnbT5S0ALDieg@MiWiFi-R3L-srv>
References: <20260622211430.4008899-1-pnina.feder@mobileye.com>
 <akybBoCAm-kJbfHL@kernel.org>
 <20260720091927.GA1736709@horms.kernel.org>
 <al4X300UObXawEIJ@kernel.org>
 <al4yeHrkDHFoo6A0@MiWiFi-R3L-srv>
 <al5cbYMD18UbKe-6@telecaster>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <al5cbYMD18UbKe-6@telecaster>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_050608_603408_3C4A23CA 
X-CRM114-Status: GOOD (  43.33  )
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

T24gMDcvMjAvMjYgYXQgMTA6MzVhbSwgT21hciBTYW5kb3ZhbCB3cm90ZToKPiBPbiBNb24sIEp1
bCAyMCwgMjAyNiBhdCAxMDo0MDo0M1BNICswODAwLCBCYW9xdWFuIEhlIHdyb3RlOgo+ID4gT24g
MDcvMjAvMjYgYXQgMDM6NDNwbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiA+ID4gSGkgU2ltb24s
Cj4gPiA+IAo+ID4gPiBPbiBNb24sIEp1bCAyMCwgMjAyNiBhdCAxMDoxOToyN0FNICswMTAwLCBT
aW1vbiBIb3JtYW4gd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCBKdWwgMDcsIDIwMjYgYXQgMDk6MjE6
NThBTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiA+ID4gPiA+IE9uIFR1ZSwgSnVuIDIz
LCAyMDI2IGF0IDEyOjE0OjI2QU0gKzAzMDAsIFBuaW5hIEZlZGVyIHdyb3RlOgo+ID4gPiA+ID4g
PiBUaGlzIHNlcmllcyBleHRlbmRzIHZtY29yZWluZm8gd2l0aCBzdHJ1Y3Qgb2Zmc2V0cyBhbmQg
c2l6ZXMgbmVlZGVkIGJ5Cj4gPiA+ID4gPiA+IHRoZSB2bWNvcmUtdGFza3MgdXNlcnNwYWNlIHRv
b2wgdG8gZXh0cmFjdCBwZXItdGFzayBzdGF0ZSBmcm9tIGEgdm1jb3JlCj4gPiA+ID4gPiA+IGR1
bXAgd2l0aG91dCByZXF1aXJpbmcga2VybmVsIGRlYnVnIHN5bWJvbHMgKERXQVJGL0JURikuCj4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBUaGUgdm1jb3JlLXRhc2tzIHRvb2wgcmVhZHMgL3Byb2Mv
dm1jb3JlIChvciBhIHNhdmVkIHZtY29yZSBmaWxlKSBhbmQKPiA+ID4gPiA+ID4gcmVjb25zdHJ1
Y3RzLCBmb3IgZWFjaCB0YXNrOgo+ID4gPiA+ID4gPiAgIC0gdGFzayBuYW1lLCBwaWQsIHN0YXRl
LCBmbGFncwo+ID4gPiA+ID4gPiAgIC0gVk1BIGxpc3QgKHN0YXJ0LCBlbmQsIGZsYWdzLCBiYWNr
aW5nIGZpbGUpCj4gPiA+ID4gPiA+ICAgLSB1c2VyIHJlZ2lzdGVyIHN0YXRlIChzYXZlZCBvbiB0
aGUga2VybmVsIHN0YWNrIGF0IGtlcm5lbCBlbnRyeSkKPiA+ID4gPiA+ID4gICAtIHVzZXItc3Bh
Y2UgYmFja3RyYWNlIHdpdGggVk1BL2ZpbGVuYW1lIG1hcHBpbmcKPiA+ID4gPiA+ID4gICAtIGtl
cm5lbCBkbWVzZyBidWZmZXIKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFRoaXMgcHJvdmlkZXMg
YSBsaWdodHdlaWdodCBwb3N0LW1vcnRlbSBjcmFzaCBhbmFseXNpcyBjYXBhYmlsaXR5IGZvcgo+
ID4gPiA+ID4gPiBwcm9kdWN0aW9uIGVudmlyb25tZW50cyB3aGVyZSBmdWxsIGRlYnVnIGluZm8g
KERXQVJGL0JURikgaXMgbm90Cj4gPiA+ID4gPiA+IGF2YWlsYWJsZS4KPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+IFRoZSBjb21wYW5pb24gdXNlcnNwYWNlIHRvb2wgaXMgc3VibWl0dGVkIHRvIGtl
eGVjLXRvb2xzOgo+ID4gPiA+ID4gPiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2
MDYyMjIwNTU1MC4xMDg3MTYzLTEtcG5pbmEuZmVkZXJAbW9iaWxleWUuY29tLwo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBTb3JyeSBmb3IgdGhlIGRlbGF5LCB0aGlzIGZlbGwgYmV0d2VlbiB0aGUgY3Jh
Y2tzIHNvbWVob3cuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoZSBrZXJuZWwgc2lkZSBsb29rcyBm
aW5lIG92ZXJhbGwsIGJ1dCB0byBtZXJnZSBpdCB0aGVyZSBzaG91bGQgYmUgYW4KPiA+ID4gPiA+
IGFncmVlbWVudCBmcm9tIHRoZSB1c2Vyc3BhY2Ugc2lkZSBtYWludGFpbmVycyB0aGF0IHZtY29y
ZS10YXNrcyBpcwo+ID4gPiA+ID4gc29tZXRoaW5nIHRoZXkgYXJlIHdpc2hpbmcgdG8gYWNjZXB0
Lgo+ID4gPiA+IAo+ID4gPiA+IEhpIE1pa2UsIGFsbCwKPiA+ID4gPiAKPiA+ID4gPiBTb3JyeSBm
b3IgdGhlIGV4dGVuZGVkIGRlbGF5Lgo+ID4gPiA+IAo+ID4gPiA+IEkgd2lsbCBzZW5kIHNvbWUg
bWlub3IgZmVlZGJhY2sgdG8gdGhlIHVzZXItc3BhY2UgdG9vbCBwYXRjaHNldAo+ID4gPiA+IGJ1
dCBvdmVyYWxsLCB5ZXMsIHRoaXMgaXMgc29tZXRoaW5nIEkgd291bGQgYmUgaGFwcHkgdG8gYWNj
ZXB0Lgo+ID4gPiA+IAo+ID4gPiA+IEkgZG9uJ3Qgd2FudCB0byBjcmVhdGUgYSBjaGlja2VuLWFu
ZC1lZ2cgdHlwZSBwcm9ibGVtIGhlcmUuCj4gPiA+ID4gQnV0IGl0J3MgcHJvYmFibHkgd29ydGgg
bWVudGlvbmluZyB0aGF0IHVzdWFsbHkgZmVhdHVyZXMKPiA+ID4gPiBoaXQgdGhlIGtlcm5lbCBi
ZWZvcmUgdGhlIGNvcnJlc3BvbmRpbmcgY29kZSBpcyBhY2NlcHRlZAo+ID4gPiA+IGludG8ga2V4
ZWMtdG9vbHMuCj4gPiA+IAo+ID4gPiBTb3JyeSBpZiBJIHdhc24ndCBjbGVhci4gCj4gPiA+IAo+
ID4gPiBJIGRpZG4ndCBtZWFuIHRoYXQgdGhlIGZlYXR1cmUgc2hvdWxkIGJlIG1lcmdlZCBpbnRv
IGtleGVjLXRvb2xzIGJlZm9yZQo+ID4gPiBtZXJnaW5nIHRoZSBrZXJuZWwgYml0cy4gSSBqdXN0
IHdhbnRlZCB0byBtYWtlIHN1cmUgdGhlcmUncyBubyBmdW5kYW1lbnRhbAo+ID4gPiBpc3N1ZSBm
cm9tIGtleGVjLXRvb2xzIHBlcnNwZWN0aXZlLgo+ID4gPiAKPiA+ID4gPiBMZXQgbWUga25vdyBo
b3cgeW91IHdvdWxkIGxpa2UgdG8gcHJvY2VlZC4KPiA+ID4gCj4gPiA+IEknbSBnb2luZyB0byB3
YWl0IGZvciBCYW9xdWFuJ3MgcmV2aWV3IGFuZCBvbmNlIHRoYXQncyBkb25lIEknbGwgcGljayB1
cAo+ID4gPiB0aGUga2VybmVsIGJpdHMuCj4gPiAKPiA+IE9oLCBzb3JyeSwgSSBqdXN0IG5vdGlj
ZWQgdGhpcyBzZXJpZXMsIGJ1dCBhIHF1aWNrIGxvb2sgZ2l2ZSBtZSBhIGhpbnQKPiA+IG9mICdO
bywgSSBkb24ndCBsaWtlIGl0LicgV2UgaGF2ZSBoYWQgQ3Jhc2ggdXRpbGl0eSwgRHJnbiwgbm93
IGEgbmV3IG9uZQo+ID4gY29tZXMgdXAuIEkgaGF2ZSBzb21lIGNvbmNlcm5zIHRvIFBuaW5hOgo+
ID4gCj4gPiAxLiBFeHBvcnRpbmcgbWFwbGUgdHJlZSBpbnRlcm5hbHMgKG1hcGxlX25vZGUsIG1h
cGxlX3JhbmdlXzY0LAo+ID4gICAgbWFwbGVfYXJhbmdlXzY0LCBtYXBsZV9tZXRhZGF0YSkgYXMg
dm1jb3JlaW5mbyBBQkkgaXMgcHJvYmxlbWF0aWMuCj4gPiAgICBUaGVzZSBhcmUgcHJpdmF0ZSBp
bXBsZW1lbnRhdGlvbiBkZXRhaWxzLCBub3Qgc3RhYmxlIHN0cnVjdHVyZXMgbGlrZQo+ID4gICAg
dGFza19zdHJ1Y3QuIEFueSByZWZhY3RvcmluZyBvZiB0aGUgbWFwbGUgdHJlZSB3aWxsIHNpbGVu
dGx5IGJyZWFrCj4gPiAgICB0aGUgdXNlcnNwYWNlIHRvb2wuIAo+ID4gCj4gPiAyLiBXaXRob3V0
IERXQVJGL0JURiwgdGhlIGRlYnVnZ2luZyBzY29wZSBpcyBpbmhlcmVudGx5IGxpbWl0ZWQg4oCU
IG5vCj4gPiAgICBrZXJuZWwgc3RhY2sgYmFja3RyYWNlLCBubyBzeW1ib2wgcmVzb2x1dGlvbiwg
bm8gdmFyaWFibGUgYWNjZXNzLgo+ID4gICAgVGhhdCdzIGVzc2VudGlhbGx5ICJwcyArIC9wcm9j
L1BJRC9tYXBzIiBmcm9tIGEgdm1jb3JlLiBIYXZlIHlvdQo+ID4gICAgY29uc2lkZXJlZCBlbmFi
bGluZyBDT05GSUdfREVCVUdfSU5GT19CVEYgb24geW91ciBwbGF0Zm9ybXMgaW5zdGVhZD8KPiA+
ICAgIEJURiBpcyBjb21wYWN0ICh0eXBpY2FsbHkgPCAxIE1CKSBhbmQgd291bGQgZ2l2ZSBkcmdu
IGZ1bGwgYWNjZXNzCj4gPiAgICB3aXRob3V0IG5lZWRpbmcgdm1saW51eCBkZWJ1ZyBwYWNrYWdl
cy4gVGhhdCBzZWVtcyBsaWtlIGEgYmV0dGVyCj4gPiAgICByZXR1cm4tb24taW52ZXN0bWVudCB0
aGFuIG1haW50YWluaW5nIH40MCBuZXcgdm1jb3JlaW5mbyBleHBvcnRzLgo+ID4gCj4gPiAzLiBC
ZXlvbmQgdGhlIHRlY2huaWNhbCBjb25jZXJucywgSSB3b25kZXIgYWJvdXQgYWRvcHRpb24uIHZt
Y29yZS10YXNrcwo+ID4gICAgdGFyZ2V0cyBhIGZhaXJseSBuYXJyb3cgdXNlIGNhc2Ug4oCUIHBs
YXRmb3JtcyB3aXRob3V0IERXQVJGL0JURiwgd2hlcmUKPiA+ICAgIHlvdSBzdGlsbCBoYXZlIHZt
Y29yZSBidXQgY2FuJ3Qgc2hpcCB2bWxpbnV4LiBJcyBNb2JpbGV5ZSBjdXJyZW50bHkKPiA+ICAg
IHRoZSBvbmx5IGNvbnN1bWVyPyBBcmUgeW91IGd1eXMgYWxyZWFkeSB1c2luZyBpdCB3aWRlbHkg
YW5kIGZ1bGx5Pwo+ID4gICAgSWYgdGhpcyBsYW5kcyBidXQgZG9lc24ndCBzZWUgYnJvYWRlciB1
cHRha2UsIHRoZSB+NDAgZXhwb3J0cyByaXNrCj4gPiAgICBiZWNvbWluZyBkZWFkIHdlaWdodCBp
biB2bWNvcmVpbmZvIOKAlCBub2JvZHkgYWN0aXZlbHkgdXNlcyB0aGVtLCBidXQKPiA+ICAgIGtl
cm5lbCBjaGFuZ2VzIHN0aWxsIG5lZWQgdG8ga2VlcCB0aGVtIGNvbnNpc3RlbnQsIG9yIHRoZXkg
c2lsZW50bHkKPiA+ICAgIHJvdCBhbmQgZ2l2ZSB1c2VycyB3cm9uZyByZXN1bHRzLiAKPiA+IAo+
ID4gUmVnYXJkcywKPiA+IEJhb3F1YW4KPiAKPiAoQWRkaW5nIGxpbnV4LWRlYnVnZ2VycyBtYWls
aW5nIGxpc3QpLgo+IAo+IEkgYWdyZWUgd2l0aCBhbGwgb2YgQmFvcXVhbidzIHBvaW50cyBoZXJl
LCB3aXRoIGEgY291cGxlIG9mIG5vdGVzOgo+IAo+IDEuIGRyZ24ncyBCVEYgc3VwcG9ydCBpcyBj
dXJyZW50bHkgYSB3b3JrIGluIHByb2dyZXNzLCBidXQgaXQncyBzaGFwaW5nCj4gICAgdXAgd2Vs
bDogaHR0cHM6Ly9naXRodWIuY29tL29zYW5kb3YvZHJnbi9wdWxsLzYyNS4KPiAyLiBtYWtlZHVt
cGZpbGUgaXMgYWxzbyBnYWluaW5nIEJURiBleHRlbnNpb24gc3VwcG9ydDoKPiAgICBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA2MTcwNTE4MzQuOTU0MDQtMS1sdGFvQHJlZGhhdC5j
b20vLgo+ICAgIEl0J3MgbGlnaHRlci13ZWlnaHQgdGhhbiBkcmduIHdoaWxlIHN0aWxsIGJlaW5n
IG11Y2ggbW9yZSBnZW5lcmFsCj4gICAgdGhhbiB0aGlzIHNlcmllcy4KClRoYW5rcyBmb3IgYWRk
aW5nIHRoZSBpbmZvcm1hdGlvbiwgdmVyeSBoZWxwZnVsLgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
