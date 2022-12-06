Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B11AC352A1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 15:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrmqNH/6Boorri9qjWvhnREAIljni2Zr4/HdTMuW86o=; b=mC8vCHvRCnaCCz
	t41sB1J2p2goTgeqE1mAVzqsbQBkEdCX4tUIz2NkZONi2EJ5HFZ+dOsolNJwZQi0qmc10ovKGrajG
	il6+lch49EvU9FoG8b7y1RZytDEBiWEcX7X+590By04v5KQ9SRMImO4cpyrEVvPcf4VlUx9rBVeH6
	HMKPyiLvyF6zmtoNOLOR7MBFVdzt11ZSxtVyFE8n9wqKUavjBRFaQY2onwhXxG9jtfx0jIy35kdZZ
	LsTPn0ePfnmz4IjLe51TiFEcNKxOZoLsJWZkV+mYzY3qeOjRtlwNzt4nvo00utYTQeyzwZwTeHEBL
	imYjuh1cmhvPxihflEKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Zn5-00CIhh-2K; Tue, 06 Dec 2022 15:23:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Zcb-00C6F4-71; Tue, 06 Dec 2022 15:12:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6BC68B81A64;
	Tue,  6 Dec 2022 15:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBBDC433D6;
	Tue,  6 Dec 2022 15:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670339554;
	bh=mGtG2UCNLb8zhz3Q6ArNChI7VGb5eTZ5ueFrfVstXD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bo5y7lUSDSXWfZgfW+OZ4O8LIx502DSwi4Fm4epiyqnYf9KRbYyK7MM8P9H999BGY
	 6z46l9lxs+KnGbQSjen7JDqvNl4fDQfmIis5sRcSBT2AqRFjWYuGpZ3hSRBwVvmhCG
	 VyOsx743ycHsVK/LN54RaXYDyQo98XtoaWghHq8xYcZjS8pXmcGd0g3kJuwu1u/oxw
	 cJ7sIn8Xo3AsyiurYG6ZVzMgTNkj3Kw8zRGb6NOAzkwjPKrAIZt4WG/yCZ2DAhnjGy
	 FsZ7OMDupxLncDYgSkpRgoBaZOOLI0SD8Z+FQGrIh2FR4tt07STmbuRqCURjK4K53d
	 pAlD9Ibdsvxlw==
Date: Tue, 6 Dec 2022 23:02:35 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 01/13] riscv: fix jal offsets in patched alternatives
Message-ID: <Y49Zi2CNv8pZSAe5@xhacker>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <10190559.nUPlyArG6x@diego>
 <Y45LRu0Gvrurm5Rh@spud>
 <12207576.O9o76ZdvQC@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12207576.O9o76ZdvQC@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_071237_584315_95AD288C 
X-CRM114-Status: GOOD (  40.90  )
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

T24gVHVlLCBEZWMgMDYsIDIwMjIgYXQgMDE6Mzk6NTBBTSArMDEwMCwgSGVpa28gU3TDvGJuZXIg
d3JvdGU6Cj4gQW0gTW9udGFnLCA1LiBEZXplbWJlciAyMDIyLCAyMDo0OToyNiBDRVQgc2Nocmll
YiBDb25vciBEb29sZXk6Cj4gPiBPbiBNb24sIERlYyAwNSwgMjAyMiBhdCAwNzo0OTowMVBNICsw
MTAwLCBIZWlrbyBTdMO8Ym5lciB3cm90ZToKPiA+ID4gQW0gTW9udGFnLCA1LiBEZXplbWJlciAy
MDIyLCAxOTozNjo0NSBDRVQgc2NocmllYiBDb25vciBEb29sZXk6Cj4gPiA+ID4gSGVpa28sIEpp
c2hlbmcsCj4gPiA+ID4gT24gTW9uLCBEZWMgMDUsIDIwMjIgYXQgMTE6NDA6NDRQTSArMDgwMCwg
SmlzaGVuZyBaaGFuZyB3cm90ZToKPiA+ID4gPiA+IFllc3RlcmRheSwgSSBhbHNvIHdhbnRlZCB0
byB1bmlmeSB0aGUgdHdvIGluc3RydWN0aW9uIGZpeCBpbnRvCj4gPiA+ID4gPiBvbmUuIEJ1dCB0
aGF0IHdvdWxkIG5lZWQgdG8gcm9sbCBiYWNrIHRoZQo+ID4gPiA+ID4gcmlzY3ZfYWx0ZXJuYXRp
dmVfZml4X2F1aXBjX2phbHIoKSB0byB5b3VyIHYxIHZlcnNpb24uIEFuZCBJTUhPLAo+ID4gPiA+
ID4gaXQncyBiZXR0ZXIgaWYgeW91IGNhbiBzcGxpdCB0aGUgWmJiIHN0cmluZyBvcHRpbWl6YXRp
b25zIHNlcmllcwo+ID4gPiA+ID4gaW50byB0d286IG9uZSBmb3IgYWx0ZXJuYXRpdmUgaW1wcm92
ZW1lbnRzLCBhbm90aGVyIGZvciBaYmIuIFRoZW4KPiA+ID4gPiA+IHdlIG1heSBnZXQgdGhlIGFs
dGVybmF0aXZlIGltcHJvdmVtZW50cyBhbmQgdGhpcyBpbnN0IGV4dGVuc2lvbgo+ID4gPiA+ID4g
c2VyaWVzIG1lcmdlZCBpbiB2Ni4yLXJjMS4KPiA+ID4gPiAKPiA+ID4gPiBIZWlrbywgcGVyaGFw
cyB5b3UgY2FuIGNvcnJlY3QgbWUgaGVyZToKPiA+ID4gPiAKPiA+ID4gPiBMYXN0IFdlZG5lc2Rh
eSB5b3UgJiBQYWxtZXIgYWdyZWVkIHRoYXQgaXQgd2FzIHRvbyBsYXRlIGluIHRoZSBjeWNsZSB0
bwo+ID4gPiA+IGFwcGx5IGFueSBvZiB0aGUgc3R1ZmYgdG91Y2hpbmcgYWx0ZXJuYXRpdmVzPwo+
ID4gPiA+IElmIEkgZG8gcmVjYWxsIGNvcnJlY3RseSwgZ2l2ZXMgcGxlbnR5IG9mIHRpbWUgdG8g
c29ydCBvdXQgYW55Cj4gPiA+ID4gaW50ZXJkZXBlbmRlbnQgY2hhbmdlcyBoZXJlLgo+ID4gPiA+
IAo+ID4gPiA+IENvdWxkIGVhc2lseSBiZSBtaXNyZW1lbWJlcmluZywgd291bGRuJ3QgYmUgdGhl
IGZpcnN0IHRpbWUhCj4gPiA+IAo+ID4gPiBZb3Ugc2xpZ2h0bHkgbWlzcmVtZW1iZXJlZCwgYnV0
IGFyZSBzdGlsbCBjb3JyZWN0IHdpdGggdGhlIGFib3ZlIDstKSAuCj4gPiA+IAo+ID4gPiBJLmUu
IHdoYXQgd2UgdGFsa2VkIGFib3V0IHdhcyBzdHVmZiBmb3IgZml4ZXMgZm9yIDYuMS1yYywgd2Vy
ZSBQYWxtZXJzCj4gPiA+IHdpc2VseSB3YW50ZWQgdG8gbGltaXQgYWRkaXRpb25zIHRvIHJlYWxs
eSBlYXN5IGZpeGVzIGZvciB0aGUgcmVtYWluaW5nCj4gPiA+IGxhc3QgcmMsIHRvIG5vdCB1cHNl
dCBhbnkgZXhpc3RpbmcgYm9hcmRzLgo+ID4gCj4gPiBBaGggcmlnaHQuIEkgd2FzIDUwLTUwIG9u
IHdoZXRoZXIgc29tZXRoaW5nIGxpa2UgdGhhdCB3YXMgc2FpZCBzbyBhdAo+ID4gbGVhc3QgSSBh
bSBub3QgZ29pbmcgY3JhenkuCj4gPiAKPiA+ID4gQnV0IHlvdSBhcmUgc3RpbGwgY29ycmVjdCB0
aGF0IHdlIGFsc28gc2hvdWxkbid0IHRhcmdldCB0aGUgNi4yIG1lcmdlIHdpbmRvdwo+ID4gPiBh
bnltb3JlIDotKSAuCj4gPiA+IAo+ID4gPiBXZSdyZSBhZnRlciAtcmM4IG5vdyAod2hpY2ggaXMg
aW4gaXRzZWxmIHVuY29tbW9uKSBhbmQgaW4gaGlzIC1yYzcKPiA+ID4gYW5ub3VuY2VtZW50IFsw
XSwgTGludXMgc3RhdGVkCj4gPiA+IAo+ID4gPiAiWy4uLl0gdGhlIHVzdWFsIHJ1bGUgaXMgdGhh
dCB0aGluZ3MgdGhhdCBJIGdldCBzZW50IGZvciB0aGUKPiA+ID4gbWVyZ2Ugd2luZG93IHNob3Vs
ZCBoYXZlIGJlZW4gYWxsIHJlYWR5IF9iZWZvcmVfIHRoZSBtZXJnZSB3aW5kb3cKPiA+ID4gb3Bl
bmVkLiBCdXQgd2l0aCB0aGUgbWVyZ2Ugd2luZG93IGhhcHBlbmluZyBsYXJnZWx5IGR1cmluZyB0
aGUgaG9saWRheQo+ID4gPiBzZWFzb24sIEknbGwganVzdCBiZSBlbmZvcmNpbmcgdGhhdCBwcmV0
dHkgc3RyaWN0bHkuIgo+ID4gCj4gPiBZYWgsIG9mIGFsbCB0aGUgd2luZG93cyB0byBsYW5kIHBh
dGNoc2V0cyB0aGF0IGFyZSBiZWluZyByZS1zcHVuIGEgZmV3Cj4gPiBkYXlzIGJlZm9yZSBpdCBv
cGVucyB0aGlzIHByb2JhYmx5IGlzbid0IHRoZSBiZXN0IG9uZSB0byBwaWNrIQo+ID4gCj4gPiA+
IFRoYXQgbWVhbnMgbmV3IHN0dWZmIHNob3VsZCBiZSByZXZpZXdlZCBhbmQgaW4gbGludXgtbmV4
dCBfd2F5IGJlZm9yZV8gdGhlCj4gPiA+IG1lcmdlIHdpbmRvdyBvcGVucyBuZXh0IHdlZWtlbmQu
IFRha2luZyBpbnRvIGFjY291bnQgdGhhdCBwZW9wbGUgbmVlZAo+ID4gPiB0byByZXZpZXcgc3R1
ZmYgKGFuZCBtYXliZSB0aGUgc2VyaWVzIG5lZWRpbmcgYW5vdGhlciByb3VuZCksIEkgcmVhbGx5
IGRvbid0Cj4gPiA+IHNlZSB0aGlzIGhhcHBlbmluZyB0aGlzIHdlZWsgYW5kIGV2ZXJ5dGhpbmcg
ZWxzZSB3aWxsIGdldCB1cyBzaG91dGVkIGF0Cj4gPiA+IGZyb20gYXRvcCBhIGNocmlzdG1hcyB0
cmVlIDstKSAuCj4gPiA+IAo+ID4gPiBUaGF0J3MgdGhlIHJlYXNvbiBtb3N0IG1haW50YWluZXIt
dHJlZXMgc3RvcCBhY2NlcHRpbmcgc3R1ZmYgYWZ0ZXIgLXJjNwoKVGhhbmtzIGZvciB0aGUgaW5m
b3JtYXRpb24sIHRoZW4gd2UgaGF2ZSBtb3JlIHRpbWUgdG8gdGVzdCBhbmQgcmV2aWV3CnRoaXMg
c2VyaWVzLgoKPiA+IAo+ID4gQXllLCBpbiBSSVNDLVYgbGFuZCBtYXliZSB3ZSB3aWxsIGdldCB0
aGVyZSBvbmUgZGF5IDopCj4gPiAKPiA+IEZvciB0aGUgb3JpZ2luYWwgcXVlc3Rpb24gdGhvdWdo
LCBicmVha2luZyB0aGVtIHVwIGludG8gMyBvciA0IHNtYWxsZXIKPiA+IGJpdHMgdGhhdCBjb3Vs
ZCBnZXQgYXBwbGllZCBvbiB0aGVpciBvd24gaXMgcHJvYmFibHkgYSBnb29kIGlkZWE/Cj4gPiAK
PiA+IEJldHdlZW4geW91cnNlbHZlcywgRHJldyBhbmQgUHJhYmhha2FyIHRoZXJlJ3MgYSBjb3Vw
bGUgc2VyaWVzIHRvdWNoaW5nCj4gPiB0aGUgc2FtZSBiaXRzLiBDZXJ0YWlubHkgZG9uJ3Qgd2Fu
dCB0byBzZWVtIGxpa2UgSSBhbSBzcGVha2luZyBmb3IgdGhlCgpCZWNhdXNlIGFsdGVybmF0aXZl
IGlzIHRoZSBiZXN0IHNvbHV0aW9uIHRvIHJpc2N2IGV4dGVuc2lvbnMgd2hpbGUgc3RpbGwKa2Vl
cCBvbmUgdW5pZmllZCBrZXJuZWwgSW1hZ2UgOykKCj4gPiBIaWdoZXIgUG93ZXJzIGhlcmUsIGJ1
dCBzb21lIHNvcnQgb2YgbG9naWNhbCBvcmRlcmluZyB3b3VsZCBwcm9iYWJseSBiZQo+ID4gYSBn
b29kIGlkZWEgc28gYXMgbm90IHRvIGhvbGQgZWFjaCBvdGhlciB1cD8KPiA+IFRoZSBub24tc3Ry
aW5nIGJpdCBvZiB5b3VyIHNlcmllcyBoYXMgYmVlbiBmYWlybHkgd2VsbCByZXZpZXdlZCAmIHdv
dWxkLAo+ID4gaW4gdGhlb3J5LCBiZSBtZXJnZWFibGUgb25jZSB0aGUgdHJlZSByZS1vcGVucz8g
VGltaW5nIGFzaWRlLCBKaXNoZW5nJ3MKPiA+IGlkZWEgc2VlbXMgbGlrZSBhIGdvb2Qgb25lLCBu
bz8KCklNSE8sIGl0IHdpbGwgYmUgYmV0dGVyIGlmIFBhbG1lciBjYW4gbWVyZ2UgSGVpa28ncyBh
bHRlcm5hdGl2ZSBpbXByb3ZlbWVudHMKaW50byByaXNjdi1uZXh0IG9uY2Ugd2VsbCByZXZpZXdl
ZCBhbmQgdGhlIHdpbmRvdyBpcyByZW9wZW4uIFRoZW4gRHJldywKUHJhYmhha2FyIGFuZCBJIGNh
biByZWJhc2Ugb24gdGhhdCB0cmVlLgoKPiAKPiB5ZWFoLCBJIGhhZCB0aGF0IHNhbWUgdGhvdWdo
dCBvdmVyIHRoZSB3ZWVrZW5kIC0gd2l0aCB0aGUgZ2VuZXJpYwo+IHBhcnQgYmVpbmcgcHJldHR5
IGdvb2QgaW4gdGhlIHJldmlldyBhbmQgb25seSB0aGUgc3RyaW5nIHBhcnQgbmVlZGluZwo+IG1v
cmUgd29yayBhbmQgdGh1cyBpZGVhbGx5IHNwbGl0dGluZyB0aGUgc2VyaWVzIFswXSAuCj4gCj4g
SmlzaGVuZydzIHNlcmllcyBqdXN0IG1hZGUgdGhhdCBldmVuIG1vcmUgaW1wb3J0YW50IHRvIGRv
IDotKQo+IAo+IAo+IEhlaWtvCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
