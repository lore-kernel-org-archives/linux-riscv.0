Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1B8C4452A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 14:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fW0XvTTimesZ5K4ibubO5GGlrNS/swd2DYyZ2j82nuY=; b=LwrSKokNd6kTRE
	RXdCobraEftvZBfDDbokkT6xDv+vR38RbPrSyMHWKS0Up4kOoSSXcJRhVuez+0KO1k3GbNpFI+ZlO
	bqnX5Rx5hpWAw5vDySCRW8GUVFPdWH2P+wDaPzDo7koQGqiTYZMXE8o/ZGzUCYhdHoSm0c2etbxEK
	Jf9+A5JR9vz8iy94Rxrc+SlMQNrw+R0HYpw2rHkrH7lnb9h+7BlTzKqhhwSZOjoYVR45m1OGD/QOR
	VQ3d4+57El7sGVNUHOsH6xlggFwHi8cdwxgG581gEFClnL8YEDWfEdPxZDFSo6BL4g3X9odbzNETt
	lMN4EVuMRlHOUs9rR+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpB7-000000070iQ-0KVq;
	Mon, 20 Jul 2026 14:41:09 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpB1-000000070dp-1fzJ
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 14:41:07 +0000
Date: Mon, 20 Jul 2026 22:40:43 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784558454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4gSt9cswUv2DtOGtLXPRqtGUR2VcGmgfvQCElRP9mg=;
	b=Pqo2xgJ5RDdj6NXs/jgeISfkdIg7i7qMUGkyZrTO/p1VM+BbXJW/RIUSk3umeDw8GfcuOR
	BQyPX9vHf6jSgJDsYezil7V5AOtFS0ol0tf8WF9flnT6iDNrezuc4gIkTJvqvd/XeVKzlm
	rjkJqxcCecDN47qIrUxa/KE9LXp2OPA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Baoquan He <baoquan.he@linux.dev>
To: Mike Rapoport <rppt@kernel.org>, Pnina Feder <pnina.feder@mobileye.com>
Cc: Simon Horman <horms@kernel.org>,
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
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/4] vmcore-tasks: export per-task metadata to vmcoreinfo
Message-ID: <al4yeHrkDHFoo6A0@MiWiFi-R3L-srv>
References: <20260622211430.4008899-1-pnina.feder@mobileye.com>
 <akybBoCAm-kJbfHL@kernel.org>
 <20260720091927.GA1736709@horms.kernel.org>
 <al4X300UObXawEIJ@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <al4X300UObXawEIJ@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_074103_862741_28C57397 
X-CRM114-Status: GOOD (  34.05  )
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

T24gMDcvMjAvMjYgYXQgMDM6NDNwbSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBIaSBTaW1vbiwK
PiAKPiBPbiBNb24sIEp1bCAyMCwgMjAyNiBhdCAxMDoxOToyN0FNICswMTAwLCBTaW1vbiBIb3Jt
YW4gd3JvdGU6Cj4gPiBPbiBUdWUsIEp1bCAwNywgMjAyNiBhdCAwOToyMTo1OEFNICswMzAwLCBN
aWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gPiBPbiBUdWUsIEp1biAyMywgMjAyNiBhdCAxMjoxNDoy
NkFNICswMzAwLCBQbmluYSBGZWRlciB3cm90ZToKPiA+ID4gPiBUaGlzIHNlcmllcyBleHRlbmRz
IHZtY29yZWluZm8gd2l0aCBzdHJ1Y3Qgb2Zmc2V0cyBhbmQgc2l6ZXMgbmVlZGVkIGJ5Cj4gPiA+
ID4gdGhlIHZtY29yZS10YXNrcyB1c2Vyc3BhY2UgdG9vbCB0byBleHRyYWN0IHBlci10YXNrIHN0
YXRlIGZyb20gYSB2bWNvcmUKPiA+ID4gPiBkdW1wIHdpdGhvdXQgcmVxdWlyaW5nIGtlcm5lbCBk
ZWJ1ZyBzeW1ib2xzIChEV0FSRi9CVEYpLgo+ID4gPiA+IAo+ID4gPiA+IFRoZSB2bWNvcmUtdGFz
a3MgdG9vbCByZWFkcyAvcHJvYy92bWNvcmUgKG9yIGEgc2F2ZWQgdm1jb3JlIGZpbGUpIGFuZAo+
ID4gPiA+IHJlY29uc3RydWN0cywgZm9yIGVhY2ggdGFzazoKPiA+ID4gPiAgIC0gdGFzayBuYW1l
LCBwaWQsIHN0YXRlLCBmbGFncwo+ID4gPiA+ICAgLSBWTUEgbGlzdCAoc3RhcnQsIGVuZCwgZmxh
Z3MsIGJhY2tpbmcgZmlsZSkKPiA+ID4gPiAgIC0gdXNlciByZWdpc3RlciBzdGF0ZSAoc2F2ZWQg
b24gdGhlIGtlcm5lbCBzdGFjayBhdCBrZXJuZWwgZW50cnkpCj4gPiA+ID4gICAtIHVzZXItc3Bh
Y2UgYmFja3RyYWNlIHdpdGggVk1BL2ZpbGVuYW1lIG1hcHBpbmcKPiA+ID4gPiAgIC0ga2VybmVs
IGRtZXNnIGJ1ZmZlcgo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgcHJvdmlkZXMgYSBsaWdodHdlaWdo
dCBwb3N0LW1vcnRlbSBjcmFzaCBhbmFseXNpcyBjYXBhYmlsaXR5IGZvcgo+ID4gPiA+IHByb2R1
Y3Rpb24gZW52aXJvbm1lbnRzIHdoZXJlIGZ1bGwgZGVidWcgaW5mbyAoRFdBUkYvQlRGKSBpcyBu
b3QKPiA+ID4gPiBhdmFpbGFibGUuCj4gPiA+ID4gCj4gPiA+ID4gVGhlIGNvbXBhbmlvbiB1c2Vy
c3BhY2UgdG9vbCBpcyBzdWJtaXR0ZWQgdG8ga2V4ZWMtdG9vbHM6Cj4gPiA+ID4gICBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA2MjIyMDU1NTAuMTA4NzE2My0xLXBuaW5hLmZlZGVy
QG1vYmlsZXllLmNvbS8KPiA+ID4gCj4gPiA+IFNvcnJ5IGZvciB0aGUgZGVsYXksIHRoaXMgZmVs
bCBiZXR3ZWVuIHRoZSBjcmFja3Mgc29tZWhvdy4KPiA+ID4gCj4gPiA+IFRoZSBrZXJuZWwgc2lk
ZSBsb29rcyBmaW5lIG92ZXJhbGwsIGJ1dCB0byBtZXJnZSBpdCB0aGVyZSBzaG91bGQgYmUgYW4K
PiA+ID4gYWdyZWVtZW50IGZyb20gdGhlIHVzZXJzcGFjZSBzaWRlIG1haW50YWluZXJzIHRoYXQg
dm1jb3JlLXRhc2tzIGlzCj4gPiA+IHNvbWV0aGluZyB0aGV5IGFyZSB3aXNoaW5nIHRvIGFjY2Vw
dC4KPiA+IAo+ID4gSGkgTWlrZSwgYWxsLAo+ID4gCj4gPiBTb3JyeSBmb3IgdGhlIGV4dGVuZGVk
IGRlbGF5Lgo+ID4gCj4gPiBJIHdpbGwgc2VuZCBzb21lIG1pbm9yIGZlZWRiYWNrIHRvIHRoZSB1
c2VyLXNwYWNlIHRvb2wgcGF0Y2hzZXQKPiA+IGJ1dCBvdmVyYWxsLCB5ZXMsIHRoaXMgaXMgc29t
ZXRoaW5nIEkgd291bGQgYmUgaGFwcHkgdG8gYWNjZXB0Lgo+ID4gCj4gPiBJIGRvbid0IHdhbnQg
dG8gY3JlYXRlIGEgY2hpY2tlbi1hbmQtZWdnIHR5cGUgcHJvYmxlbSBoZXJlLgo+ID4gQnV0IGl0
J3MgcHJvYmFibHkgd29ydGggbWVudGlvbmluZyB0aGF0IHVzdWFsbHkgZmVhdHVyZXMKPiA+IGhp
dCB0aGUga2VybmVsIGJlZm9yZSB0aGUgY29ycmVzcG9uZGluZyBjb2RlIGlzIGFjY2VwdGVkCj4g
PiBpbnRvIGtleGVjLXRvb2xzLgo+IAo+IFNvcnJ5IGlmIEkgd2Fzbid0IGNsZWFyLiAKPiAKPiBJ
IGRpZG4ndCBtZWFuIHRoYXQgdGhlIGZlYXR1cmUgc2hvdWxkIGJlIG1lcmdlZCBpbnRvIGtleGVj
LXRvb2xzIGJlZm9yZQo+IG1lcmdpbmcgdGhlIGtlcm5lbCBiaXRzLiBJIGp1c3Qgd2FudGVkIHRv
IG1ha2Ugc3VyZSB0aGVyZSdzIG5vIGZ1bmRhbWVudGFsCj4gaXNzdWUgZnJvbSBrZXhlYy10b29s
cyBwZXJzcGVjdGl2ZS4KPiAKPiA+IExldCBtZSBrbm93IGhvdyB5b3Ugd291bGQgbGlrZSB0byBw
cm9jZWVkLgo+IAo+IEknbSBnb2luZyB0byB3YWl0IGZvciBCYW9xdWFuJ3MgcmV2aWV3IGFuZCBv
bmNlIHRoYXQncyBkb25lIEknbGwgcGljayB1cAo+IHRoZSBrZXJuZWwgYml0cy4KCk9oLCBzb3Jy
eSwgSSBqdXN0IG5vdGljZWQgdGhpcyBzZXJpZXMsIGJ1dCBhIHF1aWNrIGxvb2sgZ2l2ZSBtZSBh
IGhpbnQKb2YgJ05vLCBJIGRvbid0IGxpa2UgaXQuJyBXZSBoYXZlIGhhZCBDcmFzaCB1dGlsaXR5
LCBEcmduLCBub3cgYSBuZXcgb25lCmNvbWVzIHVwLiBJIGhhdmUgc29tZSBjb25jZXJucyB0byBQ
bmluYToKCjEuIEV4cG9ydGluZyBtYXBsZSB0cmVlIGludGVybmFscyAobWFwbGVfbm9kZSwgbWFw
bGVfcmFuZ2VfNjQsCiAgIG1hcGxlX2FyYW5nZV82NCwgbWFwbGVfbWV0YWRhdGEpIGFzIHZtY29y
ZWluZm8gQUJJIGlzIHByb2JsZW1hdGljLgogICBUaGVzZSBhcmUgcHJpdmF0ZSBpbXBsZW1lbnRh
dGlvbiBkZXRhaWxzLCBub3Qgc3RhYmxlIHN0cnVjdHVyZXMgbGlrZQogICB0YXNrX3N0cnVjdC4g
QW55IHJlZmFjdG9yaW5nIG9mIHRoZSBtYXBsZSB0cmVlIHdpbGwgc2lsZW50bHkgYnJlYWsKICAg
dGhlIHVzZXJzcGFjZSB0b29sLiAKCjIuIFdpdGhvdXQgRFdBUkYvQlRGLCB0aGUgZGVidWdnaW5n
IHNjb3BlIGlzIGluaGVyZW50bHkgbGltaXRlZCDigJQgbm8KICAga2VybmVsIHN0YWNrIGJhY2t0
cmFjZSwgbm8gc3ltYm9sIHJlc29sdXRpb24sIG5vIHZhcmlhYmxlIGFjY2Vzcy4KICAgVGhhdCdz
IGVzc2VudGlhbGx5ICJwcyArIC9wcm9jL1BJRC9tYXBzIiBmcm9tIGEgdm1jb3JlLiBIYXZlIHlv
dQogICBjb25zaWRlcmVkIGVuYWJsaW5nIENPTkZJR19ERUJVR19JTkZPX0JURiBvbiB5b3VyIHBs
YXRmb3JtcyBpbnN0ZWFkPwogICBCVEYgaXMgY29tcGFjdCAodHlwaWNhbGx5IDwgMSBNQikgYW5k
IHdvdWxkIGdpdmUgZHJnbiBmdWxsIGFjY2VzcwogICB3aXRob3V0IG5lZWRpbmcgdm1saW51eCBk
ZWJ1ZyBwYWNrYWdlcy4gVGhhdCBzZWVtcyBsaWtlIGEgYmV0dGVyCiAgIHJldHVybi1vbi1pbnZl
c3RtZW50IHRoYW4gbWFpbnRhaW5pbmcgfjQwIG5ldyB2bWNvcmVpbmZvIGV4cG9ydHMuCgozLiBC
ZXlvbmQgdGhlIHRlY2huaWNhbCBjb25jZXJucywgSSB3b25kZXIgYWJvdXQgYWRvcHRpb24uIHZt
Y29yZS10YXNrcwogICB0YXJnZXRzIGEgZmFpcmx5IG5hcnJvdyB1c2UgY2FzZSDigJQgcGxhdGZv
cm1zIHdpdGhvdXQgRFdBUkYvQlRGLCB3aGVyZQogICB5b3Ugc3RpbGwgaGF2ZSB2bWNvcmUgYnV0
IGNhbid0IHNoaXAgdm1saW51eC4gSXMgTW9iaWxleWUgY3VycmVudGx5CiAgIHRoZSBvbmx5IGNv
bnN1bWVyPyBBcmUgeW91IGd1eXMgYWxyZWFkeSB1c2luZyBpdCB3aWRlbHkgYW5kIGZ1bGx5Pwog
ICBJZiB0aGlzIGxhbmRzIGJ1dCBkb2Vzbid0IHNlZSBicm9hZGVyIHVwdGFrZSwgdGhlIH40MCBl
eHBvcnRzIHJpc2sKICAgYmVjb21pbmcgZGVhZCB3ZWlnaHQgaW4gdm1jb3JlaW5mbyDigJQgbm9i
b2R5IGFjdGl2ZWx5IHVzZXMgdGhlbSwgYnV0CiAgIGtlcm5lbCBjaGFuZ2VzIHN0aWxsIG5lZWQg
dG8ga2VlcCB0aGVtIGNvbnNpc3RlbnQsIG9yIHRoZXkgc2lsZW50bHkKICAgcm90IGFuZCBnaXZl
IHVzZXJzIHdyb25nIHJlc3VsdHMuIAoKUmVnYXJkcywKQmFvcXVhbgoKCgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
