Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1340C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 11:37:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 855882085B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 11:37:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZyOIlsee";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FjD6LPwL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 855882085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CzjC8SZbqakeVLoB0bUziV0Qo2PUsfswChPFuTl+09E=; b=ZyOIlsee1J1k0w
	4g8znqmk752FGGVH46WbN7GjbOQWSTkIdf3Q4VpIbqxB5bxcHwpq9BvRm1XcPZ1ejJf2XQUg57hd3
	NIfRP3gOUV+5G6IdcWVykjsfqdDlQy01Y7JgdloxxZZLEQ4JO4iW8dfm1b5g6lylwttKNZyIDIdqN
	2rafmJx1d9xdCxpN2YtkMHHiQNn/pLLIIDV2YN5t8JH5adrRHv1+tFEL4jPyLLk98QIuEccbVGbPi
	DhXJDtQD5O9BsaCQXvWZdWXUG3TJDmX5EYr8zApAGifuulcOfJtbCWtDI5jbQaBtigGmZ3y4BvvwE
	E1HR8TBJvH/eXuzCrDiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJzg1-0007bt-AQ; Tue, 06 Nov 2018 11:37:45 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJzfz-0007bi-MG
 for linux-riscv@bombadil.infradead.org; Tue, 06 Nov 2018 11:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IazK/IZb52qNGx6kzrxZ6y0s3QIet3y5rw+W1JXEgus=; b=FjD6LPwLdVwm8U8HV/kxJeqZDF
 VVmG7To/cpvstvBBcig6NOKTsHtaVyeSxkx28Ye0IX+YBzxy3O7qQfCy0ySbWCuwkQceIiGI+N2uu
 btD5h2w35ei0zCMNTV3ElqMp7LycWfTs9hqmbvyHQnns/VY9ZI9Zui4s6VDYhBHOGUU5jwKz3Z/XW
 sEctbCfSRsfzt/wxyhYftX4cXdqnlWYowvqBs19xfurVg6SxAOOPGTRwvgRnMaBS/serlW7Ool2Si
 NfZ01xF5vHB/6lofiWFgj9aDZC61qj2PB5IUj/bxtPevj1KfJu1e449/rh+UmIEKMggOhdbDxIYmT
 Pc7hS07A==;
Received: from foss.arm.com ([217.140.101.70])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJzfw-0005iG-L4
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 11:37:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82838A78;
 Tue,  6 Nov 2018 03:37:28 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CEAA3F5CF;
 Tue,  6 Nov 2018 03:37:26 -0800 (PST)
Date: Tue, 6 Nov 2018 11:37:23 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
Message-ID: <20181106113723.j5k5f7ovehiupyid@lakrids.cambridge.arm.com>
References: <mhng-799bd6f4-e4af-481e-90d8-bdc0e30f2530@palmer-si-x1c4>
 <9e77989d6b868d914bc328401cd64557@mailhost.ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e77989d6b868d914bc328401cd64557@mailhost.ics.forth.gr>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_063740_889840_31C988C2 
X-CRM114-Status: GOOD (  45.88  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Damien.LeMoal@wdc.com, alankao@andestech.com,
 Christoph Hellwig <hch@infradead.org>, anup@brainfault.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 zong@andestech.com, atish.patra@wdc.com, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106113723.b22ovV91isTpFQkNAvtQcAe_1spUbcM83RgMMGknGLM@z>

T24gVHVlLCBOb3YgMDYsIDIwMTggYXQgMTI6MDM6MTdQTSArMDIwMCwgTmljayBLb3NzaWZpZGlz
IHdyb3RlOgo+IM6jz4TOuc+CIDIwMTgtMTEtMDUgMjE6MzgsIFBhbG1lciBEYWJiZWx0IM6tzrPP
gc6xz4jOtToKPiA+IE9uIEZyaSwgMDIgTm92IDIwMTggMDY6MDk6MzkgUERUICgtMDcwMCksIHJv
YmgrZHRAa2VybmVsLm9yZyB3cm90ZToKPiA+ID4gT24gVGh1LCBOb3YgMSwgMjAxOCBhdCA2OjA0
IFBNIEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPgo+ID4gPiB3cm90ZToKPiA+ID4g
PiAKPiA+ID4gPiBEZWZpbmUgYSBSSVNDLVYgY3B1IHRvcG9sb2d5LiBUaGlzIGlzIGJhc2VkIG9u
IGNwdS1tYXAgaW4gQVJNIHdvcmxkLgo+ID4gPiA+IEJ1dCBpdCBkb2Vzbid0IG5lZWQgYSBzZXBh
cmF0ZSB0aHJlYWQgbm9kZSBmb3IgZGVmaW5pbmcgU01UIHN5c3RlbXMuCj4gPiA+ID4gTXVsdGlw
bGUgY3B1IHBoYW5kbGUgcHJvcGVydGllcyBjYW4gYmUgcGFyc2VkIHRvIGlkZW50aWZ5IHRoZSBz
aWJsaW5nCj4gPiA+ID4gaGFyZHdhcmUgdGhyZWFkcy4gTW9yZW92ZXIsIHdlIGRvIG5vdCBoYXZl
IGNsdXN0ZXIgY29uY2VwdCBpbiBSSVNDLVYuCj4gPiA+ID4gU28gcGFja2FnZSBpcyBhIGJldHRl
ciB3b3JkIGNob2ljZSB0aGFuIGNsdXN0ZXIgZm9yIFJJU0MtVi4KPiA+ID4gCj4gPiA+IFRoZXJl
IHdhcyBhIHByb3Bvc2FsIHRvIGFkZCBwYWNrYWdlIGluZm8gZm9yIEFSTSByZWNlbnRseS4gTm90
IHN1cmUKPiA+ID4gd2hhdCBoYXBwZW5lZCB0byB0aGF0LCBidXQgd2UgZG9uJ3QgbmVlZCAyIGRp
ZmZlcmVudCB3YXlzLgo+ID4gPiAKPiA+ID4gVGhlcmUncyBuZXZlciBnb2luZyB0byBiZSBjbHVz
dGVycyBmb3IgUklTQy1WPyBXaGF0IHByZXZlbnRzIHRoYXQ/Cj4gPiA+IFNlZW1zIHNob3J0c2ln
aHRlZCB0byBtZS4KPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQXRpc2gg
UGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3RvcG9sb2d5LnR4dCAgICAgICAgIHwgMTU0Cj4gPiA+ID4g
KysrKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNTQgaW5zZXJ0
aW9ucygrKQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQKPiA+ID4gPiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvdG9wb2xvZ3kudHh0Cj4gPiA+ID4gCj4gPiA+ID4g
ZGlmZiAtLWdpdAo+ID4gPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jp
c2N2L3RvcG9sb2d5LnR4dAo+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L3RvcG9sb2d5LnR4dAo+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+
ID4gaW5kZXggMDAwMDAwMDAuLjk2MDM5ZWQzCj4gPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi90b3BvbG9neS50
eHQKPiA+ID4gPiBAQCAtMCwwICsxLDE1NCBAQAo+ID4gPiA+ICs9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiA+ID4gK1JJU0MtViBjcHUgdG9wb2xvZ3kgYmlu
ZGluZyBkZXNjcmlwdGlvbgo+ID4gPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Cj4gPiA+ID4gKwo+ID4gPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Cj4gPiA+ID4gKzEgLSBJbnRyb2R1Y3Rpb24KPiA+ID4gPiArPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4gPiA+ICsKPiA+ID4g
PiArSW4gYSBSSVNDLVYgc3lzdGVtLCB0aGUgaGllcmFyY2h5IG9mIENQVXMgY2FuIGJlIGRlZmlu
ZWQKPiA+ID4gPiB0aHJvdWdoIGZvbGxvd2luZyBub2RlcyB0aGF0Cj4gPiA+ID4gK2FyZSB1c2Vk
IHRvIGRlc2NyaWJlIHRoZSBsYXlvdXQgb2YgcGh5c2ljYWwgQ1BVcyBpbiB0aGUgc3lzdGVtOgo+
ID4gPiA+ICsKPiA+ID4gPiArLSBwYWNrYWdlcwo+ID4gPiA+ICstIGNvcmUKPiA+ID4gPiArCj4g
PiA+ID4gK1RoZSBjcHUgbm9kZXMgKGJpbmRpbmdzIGRlZmluZWQgaW4gWzFdKSByZXByZXNlbnQg
dGhlIGRldmljZXMgdGhhdAo+ID4gPiA+ICtjb3JyZXNwb25kIHRvIHBoeXNpY2FsIENQVXMgYW5k
IGFyZSB0byBiZSBtYXBwZWQgdG8gdGhlCj4gPiA+ID4gaGllcmFyY2h5IGxldmVscy4KPiA+ID4g
PiArU2ltdWx0YW5lb3VzIG11bHRpLXRocmVhZGluZyAoU01UKSBzeXN0ZW1zIGNhbiBhbHNvIHJl
cHJlc2VudAo+ID4gPiA+IHRoZWlyIHRvcG9sb2d5Cj4gPiA+ID4gK2J5IGRlZmluaW5nIG11bHRp
cGxlIGNwdSBwaGFuZGxlcyBpbnNpZGUgY29yZSBub2RlLiBUaGUgZGV0YWlscwo+ID4gPiA+IGFy
ZSBleHBsYWluZWQKPiA+ID4gPiAraW4gcGFyYWdyYXBoIDMuCj4gPiA+IAo+ID4gPiBJIGRvbid0
IHNlZSBhIHJlYXNvbiB0byBkbyB0aGlzIGRpZmZlcmVudGx5IHRoYW4gQVJNLiBUaGF0IHNhaWQs
IEkKPiA+ID4gZG9uJ3QgdGhpbmsgdGhlIHRocmVhZCBwYXJ0IGlzIGluIHVzZSBvbiBBUk0sIHNv
IGl0IGNvdWxkIHBvc3NpYmx5IGJlCj4gPiA+IGNoYW5nZWQuCj4gPiA+IAo+ID4gPiA+ICsKPiA+
ID4gPiArVGhlIHJlbWFpbmRlciBvZiB0aGlzIGRvY3VtZW50IHByb3ZpZGVzIHRoZSB0b3BvbG9n
eSBiaW5kaW5ncwo+ID4gPiA+IGZvciBBUk0sIGJhc2VkCj4gPiA+IAo+ID4gPiBmb3IgQVJNPwo+
ID4gPiAKPiA+ID4gPiArb24gdGhlIERldmljZXRyZWUgU3BlY2lmaWNhdGlvbiwgYXZhaWxhYmxl
IGZyb206Cj4gPiA+ID4gKwo+ID4gPiA+ICtodHRwczovL3d3dy5kZXZpY2V0cmVlLm9yZy9zcGVj
aWZpY2F0aW9ucy8KPiA+ID4gPiArCj4gPiA+ID4gK0lmIG5vdCBzdGF0ZWQgb3RoZXJ3aXNlLCB3
aGVuZXZlciBhIHJlZmVyZW5jZSB0byBhIGNwdSBub2RlCj4gPiA+ID4gcGhhbmRsZSBpcyBtYWRl
IGl0cwo+ID4gPiA+ICt2YWx1ZSBtdXN0IHBvaW50IHRvIGEgY3B1IG5vZGUgY29tcGxpYW50IHdp
dGggdGhlIGNwdSBub2RlCj4gPiA+ID4gYmluZGluZ3MgYXMKPiA+ID4gPiArZG9jdW1lbnRlZCBp
biBbMV0uCj4gPiA+ID4gK0EgdG9wb2xvZ3kgZGVzY3JpcHRpb24gY29udGFpbmluZyBwaGFuZGxl
cyB0byBjcHUgbm9kZXMgdGhhdAo+ID4gPiA+IGFyZSBub3QgY29tcGxpYW50Cj4gPiA+ID4gK3dp
dGggYmluZGluZ3Mgc3RhbmRhcmRpemVkIGluIFsxXSBpcyB0aGVyZWZvcmUgY29uc2lkZXJlZCBp
bnZhbGlkLgo+ID4gPiA+ICsKPiA+ID4gPiArVGhpcyBjcHUgdG9wb2xvZ3kgYmluZGluZyBkZXNj
cmlwdGlvbiBpcyBtb3N0bHkgYmFzZWQgb24gdGhlCj4gPiA+ID4gdG9wb2xvZ3kgZGVmaW5lZAo+
ID4gPiA+ICtpbiBBUk0gWzJdLgo+ID4gPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09Cj4gPiA+ID4gKzIgLSBjcHUtdG9wb2xvZ3kgbm9kZQo+ID4gPiAKPiA+
ID4gY3B1LW1hcC4gV2h5IGNoYW5nZSB0aGlzPwo+ID4gPiAKPiA+ID4gV2hhdCBJIHdvdWxkIGxp
a2UgdG8gc2VlIGlzIHRoZSBBUk0gdG9wb2xvZ3kgYmluZGluZyByZXdvcmtlZCB0byBiZQo+ID4g
PiBjb21tb24gb3Igc29tZSBnb29kIHJlYXNvbnMgd2h5IGl0IGRvZXNuJ3Qgd29yayBmb3IgUklT
Qy1WIGFzLWlzLgo+ID4gCj4gPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGdyZWF0IGlmIENQVSB0b3Bv
bG9naWVzIHdlcmUgbm90IGEgUklTQy1WIHNwZWNpZmljCj4gPiB0aGluZy4gIFdlIGRvbid0IHJl
YWxseSBkbyBhbnl0aGluZyBkaWZmZXJlbnQgdGhhbiBhbnlvbmUgZWxzZSwgc28KPiA+IGl0J2Qg
YmUgZ3JlYXQgaWYgd2UgY291bGQgYWxsIHNoYXJlIHRoZSBzYW1lIHNwZWMgYW5kIGNvZGUuICBM
b29raW5nCj4gPiBxdWlja2x5IGF0IHRoZSBBUk0gY3B1LW1hcCBiaW5kaW5ncywgSSBkb24ndCBz
ZWUgYW55IHJlYXNvbiB3aHkgd2UKPiA+IGNhbid0IGp1c3QgdXNlIHRoZSBzYW1lIHRoaW5nIG9u
IFJJU0MtViAtLSBpdCdzIG5vdCBxdWl0ZSBob3cgSSdkIGRvCj4gPiBpdCwgYnV0IEkgZG9uJ3Qg
dGhpbmsgdGhlIGRpZmZlcmVuY2VzIGFyZSB3b3J0aCBoYXZpbmcgYW5vdGhlcgo+ID4gaW1wbGVt
ZW50YXRpb24uICBNZWNoYW5pY2FsbHkgSSdtIG5vdCBzdXJlIGhvdyB0byBkbyB0aGlzOiBzaG91
bGQKPiA+IHRoZXJlIGp1c3QgYmUgYSAiRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2NwdS1tYXAudHh0Ij8KPiA+IAo+ID4gSWYgZXZlcnlvbmUgaXMgT0sgd2l0aCB0aGF0IHRoZW4g
SSB2b3RlIHdlIGp1c3QgZ28gYWhlYWQgYW5kCj4gPiBnZW5lcmljaXNlIHRoZSBBUk0gImNwdS1t
YXAiIHN0dWZmIGZvciBDUFUgdG9wb2xvZ3kuICBTaGFyaW5nIHRoZQo+ID4gaW1wbGVtZW50YXRp
b24gbG9va3MgZmFpcmx5IHN0cmFpZ2h0LWZvcndhcmQgYXMgd2VsbC4KPiA+IAo+IAo+IFBsZWFz
ZSBjaGVjayB0aGlzIG91dC4uLgo+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzExLzMvOTkK
PiAKPiBJdCdzIGFsc28gbm9uIGFyY2gtZGVwZW5kZW50IGFuZCBpdCBjYW4gaGFuZGxlIHRoZSBz
Y2hlZHVsZXIncyBjYXBhYmlsaXRpZXMKPiBiZXR0ZXIgdGhhbiBjcHUtbWFwLgoKQ291bGQgeW91
IGVsYWJvcmF0ZSBvbiB3aGF0IHRoaXMgZG9lcyBiZXR0ZXIgdGhhbiBjcHUtbWFwPyBJJ2QgYmUK
Y3VyaW91cyB0byBzZWUgaWYgd2UgY291bGQvc2hvdWxkIGF1Z21lbnQgY3B1LW1hcCB0byBjYXRl
ciBmb3IgdGhvc2UKZGV0YWlscy4KCkdlbmVyYWxseSwgd2UgZGVsaWJlcmF0ZWx5IGF2b2lkIHBs
YWNpbmcgc29mdHdhcmUgYWJzdHJhY3Rpb25zIGluIHRoZSBEVAooZS5nLiBzY2hlZHVsZXIgZG9t
YWlucyksIGJlY2F1c2UgdGhlIGRlc2lnbiBvZiB0aGVzZSBhYnN0cmFjdGlvbnMgYXJlCnNwZWNp
ZmljIHRvIGEgZ2l2ZW4gc29mdHdhcmUgc3RhY2sgcmF0aGVyIHRoYW4gdGhlIGhhcmR3YXJlLCBh
bmQgZXZlbiBpbgp0aGUgY29udGV4dCBvZiB0aGF0IHNwZWNpZmljIHNvZnR3YXJlIHN0YWNrIHRo
ZXNlIGFic3RyYWN0aW9ucyBjaGFuZ2UKb3ZlciB0aW1lLgoKUGxhY2luZyBzb2Z0d2FyZSBhYnN0
cmFjdGlvbnMgaW4gdGhlIERUIG1heSBzZWVtIHNpbXBsZXIgaW5pdGlhbGx5LCBidXQKbG9uZ2Vy
IHRlcm0gaXQgZW5kcyB1cCByZXF1aXJpbmcgdHJhbnNsYXRpb24gYW55d2F5IGFzIGFic3RyYWN0
aW9ucwpjaGFuZ2UsIGFuZCB0eXBpY2FsbHkgaXQgaW52b2x2ZXMgcGxhY2luZyBzb21lIHBvbGlj
eSBpbiB0aGUgRFQsIHdoaWNoCnJlc3RyaWN0cyB0aGUgYWJpbGl0eSBvZiBzb2Z0d2FyZSB0byBk
byBzb21ldGhpbmcgYmV0dGVyLgoKSGF2aW5nIHNvbWUgdHJhbnNsYXRpb24gYmV0d2VlbiB0aGUg
RFQgYW5kIHRoZSBMaW51eC1pbnRlcm5hbAphYnN0cmFjdGlvbiBpcyBob3cgd2UgZXhwZWN0IHRo
aW5ncyB0byB3b3JrIGdlbmVyYWxseSwgYW5kIGFsbG93cyBmb3IgYQptb3JlIG5hdHVyYWwgcmVw
cmVzZW50YXRpb24gaW4gdGhlIERUICh3aGljaCBtYXkgYmUgbW9yZSBvciBsZXNzCnBvd2VyZnVs
IHRoYW4gdGhlIGN1cnJlbnQgTGludXggYWJzdHJhY3Rpb24pLgoKVGhhbmtzLApNYXJrLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
