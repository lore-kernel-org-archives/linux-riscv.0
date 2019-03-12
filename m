Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5E2C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 11:24:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D005020883
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 11:24:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HiySVfkl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D005020883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWL/OO7m7sCwaRZIOv/UW9EO/rnTqMSqbWYCdRr6x3M=; b=HiySVfklUEDpsU
	DVSNW7e/eDr1wY2dePOwoqfvl9o0hYe3oXCWJLD2i0JABV/s4KAYEBaGmC8Nl03Rq5K7gn/amdqdq
	0IrNGAl6NBEAvirU/AOPTDqqqMn9RmDmZGWiSeyLId9aCD87mThopUB1VuH8TFUIkrvt0Uy0CcHPv
	0M6XlgMf0CC2Lht3PXoNYd08QzjeDi9S1dBelQyeITJxxfdvF9HXVFEeOFoGZduK5F4u99P9LGEkx
	ravXaBtrIQKrj9p5OLrq4rj4fG6OSlIobagm5NQApdV9WFD8OEEM8U7Tii44OH6tgwOth/AqugIWu
	O5sf0h1xUxxRdv7czw+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3fVz-000057-1W; Tue, 12 Mar 2019 11:24:11 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3fVo-0008Nq-OD; Tue, 12 Mar 2019 11:24:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BF5B374;
 Tue, 12 Mar 2019 04:23:59 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EAE03F59C;
 Tue, 12 Mar 2019 04:23:57 -0700 (PDT)
Date: Tue, 12 Mar 2019 11:23:50 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: per-cpu thoughts
Message-ID: <20190312112349.GA35803@lakrids.cambridge.arm.com>
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
 <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
 <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
 <20190311164837.GD24275@lakrids.cambridge.arm.com>
 <alpine.DEB.2.21.9999.1903111110520.11892@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1903111110520.11892@viisi.sifive.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_042400_799317_AE46A828 
X-CRM114-Status: GOOD (  24.33  )
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
Cc: Paul Walmsley <paul@pwsan.com>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, will.deacon@arm.com,
 catalin.marinas@arm.com, Nick Kossifidis <mick@ics.forth.gr>,
 Christopher Lameter <cl@linux.com>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXIgMTEsIDIwMTkgYXQgMTE6Mzk6NTZBTSAtMDcwMCwgUGF1bCBXYWxtc2xleSB3
cm90ZToKPiBPbiBNb24sIDExIE1hciAyMDE5LCBNYXJrIFJ1dGxhbmQgd3JvdGU6Cj4gPiBPbiBN
b24sIE1hciAxMSwgMjAxOSBhdCAwODoyNjo0NUFNIC0wNzAwLCBQYXVsIFdhbG1zbGV5IHdyb3Rl
Ogo+ID4gPiBPbiBNb24sIDExIE1hciAyMDE5LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+ID4gPiA+
IAo+ID4gPiA+IEJ1dCB0aGUgZ2VuZXJpYyBvbmUgZGlzYWJsZXMgaW50ZXJydXB0cywgcmlnaHQ/
Cj4gPiA+ID4gCj4gPiA+ID4gSSBiZWxpZXZlIHRoZSByYXRpb25hbCBmb3IgUlYgaXMgc2ltaWxh
ciB0byBBUk0nczsgQU1PK3ByZWVtcHRpb24KPiA+ID4gPiBkaXNhYmxlIHJlZ2lvbnMgaXMgKnNs
aWdodGx5KiBiZXR0ZXIgdGhhbiB0aGUgZ2VuZXJpYywgYnV0IG5vdCBhcyBnb29kCj4gPiA+ID4g
YXMgdGhlIElBIG9uZS4gT3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPiA+ID4gCj4gPiA+IFRo
ZXJlJ3MgYmVlbiBhIGRpc2N1c3Npb24gZ29pbmcgb24gaW4gYSBwcml2YXRlIHRocmVhZCBhYm91
dCB0aGlzIHRoYXQgSSAKPiA+ID4gdW5mb3J0dW5hdGVseSBkaWRuJ3QgYWRkIHlvdSB0by4gIFRo
ZSBkaXNjdXNzaW9uIGlzIHN0aWxsIG9uZ29pbmcsIGJ1dCBJIAo+ID4gPiB0aGluayBDaHJpc3Rv
cGggYW5kIG15c2VsZiBhbmQgYSBmZXcgb3RoZXIgZm9sa3MgaGF2ZSBhZ3JlZWQgdGhhdCB0aGUg
Cj4gPiA+IHByZWVtcHRfZGlzYWJsZS9lbmFibGUgaXMgbm90IG5lZWRlZCBmb3IgdGhlIGFtb2Fk
ZCBhcHByb2FjaC4gIFRoaXMgaXMgCj4gPiA+IHNpbmNlIHRoZSBhcHBhcmVudCBpbnRlbnRpb24g
b2YgdGhlIHByZWVtcHRpb24gZGlzYWJsZS9lbmFibGUgaXMgdG8gZW5zdXJlIAo+ID4gPiB0aGUg
Y29ycmVjdG5lc3Mgb2YgdGhlIGNvdW50ZXIgaW5jcmVtZW50OyBob3dldmVyIHRoZXJlIGlzIG5v
IHJpc2sgb2YgCj4gPiA+IGluY29ycmVjdG5lc3MgaW4gYW4gYW1vYWRkIHNlcXVlbmNlIHNpbmNl
IHRoZSBhdG9taWMgYWRkIGlzIGxvY2tlZCBhY3Jvc3MgCj4gPiA+IGFsbCBvZiB0aGUgY2FjaGUg
Y29oZXJlbmN5IGRvbWFpbi4gCj4gPiAKPiA+IFdlIGFsc28gdGhvdWdodCB0aGF0IGluaXRpYWxs
eSwgYnV0IHRoZXJlJ3MgYSBzYnV0bGUgcmFjZSB0aGF0IGNhbgo+ID4gb2NjdXIsIGFuZCBzbyB3
ZSBhZGRlZCBjb2RlIHRvIGRpc2FibGUgcHJlZW1wdGlvbiBpbiBjb21taXQ6Cj4gPiAKPiA+ICAg
ZjNlYWI3MTg0ZGRjZDQ4NiAoImFybTY0OiBwZXJjcHU6IE1ha2UgdGhpc19jcHUgYWNjZXNzb3Jz
IHByZS1lbXB0IHNhZmUiKQo+ID4gCj4gPiBUaGUgcHJvYmxlbSBvbiBhcm02NCBpcyB0aGF0IG91
ciBhdG9taWNzIHRha2UgYSBzaW5nbGUgYmFzZSByZWdpc3RlciwKPiA+IGFuZCB3ZSBoYXZlIHRv
IGdlbmVyYXRlIHRoZSBwZXJjcHUgYWRkcmVzcyB3aXRoIHNlcGFyYXRlIGluc3RydWN0aW9ucwo+
ID4gZnJvbSB0aGUgYXRvbWljIGl0c2VsZi4gVGhhdCBtZWFucyB3ZSBjYW4gZ2V0IHByZWVtcHRl
ZCBiZXR3ZWVuIGFkZHJlc3MKPiA+IGdlbmVyYXRpb24gYW5kIHRoZSBhdG9taWMsIHdoaWNoIGlz
IHByb2JsZW1hdGljIGZvciBzZXF1ZW5jZXMgbGlrZToKPiA+IAo+ID4gCS8vIFRocmVhZC1BCQkJ
Ly8gVGhyZWFkLUIKPiA+IAo+ID4gCXRoaXNfY3B1X2FkZCh2YXIpCj4gPiAJCQkJCWxvY2FsX2ly
cV9kaXNhYmxlKGZsYWdzKQo+ID4gCQkJCQkuLi4KPiA+IAkJCQkJdiA9IF9fdGhpc19jcHVfcmVh
ZCh2YXIpOwo+ID4gCQkJCQl2ID0gc29tZV9mdW5jdGlvbih2KTsKPiA+IAkJCQkJX190aGlzX2Nw
dV93cml0ZSh2YXIsIHYpOwo+ID4gCQkJCQkuLi4KPiA+IAkJCQkJbG9jYWxfaXJxX3Jlc3RvcmUo
ZmxhZ3MpCj4gPiAKPiA+IC4uLiB3aGljaCBjYW4gdW5leHBlY3RlZGx5IHJhY2UgYXM6Cj4gPiAK
PiA+IAo+ID4gCS8vIFRocmVhZC1BCQkJLy8gVGhyZWFkLUIKPiA+IAkKPiA+IAk8IGdlbmVyYXRl
IENQVSBYIGFkZHIgPgo+ID4gCTwgcHJlZW1wdGVkID4KPiA+IAo+ID4gCQkJCQk8IHNjaGVkdWxl
ZCBvbiBDUFUgWCA+Cj4gPiAJCQkJCWxvY2FsX2lycV9kaXNhYmxlKGZsYWdzKTsKPiA+IAkJCQkJ
diA9IF9fdGhpc19jcHVfcmVhZCh2YXIpOwo+ID4gCj4gPiAJPCBzY2hlZHVsZWQgb24gQ1BVIFkg
Pgo+ID4gCTwgYWRkIHRvIENQVSBYJ3MgdmFyID4KPiA+IAkJCQkJdiA9IHNvbWVfZnVuY3Rpb24o
dik7Cj4gPiAJCQkJCV9fdGhpc19jcHVfd3JpdGUodmFyLCB2KTsKPiA+IAkJCQkJbG9jYWxfaXJx
X3Jlc3RvcmUoZmxhZ3MpOwo+ID4gCj4gPiAuLi4gYW5kIGhlbmNlIHdlIGxvc2UgYW4gdXBkYXRl
IHRvIGEgcGVyY3B1IHZhcmlhYmxlLgo+IAo+IE1ha2VzIHNlbnNlLCBhbmQgdGhhbmsgeW91IHZl
cnkgbXVjaCBmb3IgdGhlIGRldGFpbGVkIHNlcXVlbmNlcy4gIAo+IE9wZW4tY29kZWQgcGVyLWNw
dSBjb2RlIHNlcXVlbmNlcyB3b3VsZCBhbHNvIGNhdXNlIFJJU0MtViB0byBiZSBleHBvc2VkIHRv
IAo+IHRoZSBzYW1lIGlzc3VlLiAgQ2hyaXN0b3BoIG1lbnRpb25lZCB0aGlzLCBidXQgYXQgdGhl
IHRpbWUgbXkgYXR0ZW50aW9uIAo+IHdhcyBmb2N1c2VkIG9uIHBlci1jcHUgY291bnRlcnMsIGFu
ZCBub3QgdGhlIGJyb2FkZXIgcmFuZ2Ugb2YgcGVyLWNwdSBjb2RlIAo+IHNlcXVlbmNlcy4KPiAK
PiA+IEkgc3VzcGVjdCBSSVNDLVYgd291bGQgaGF2ZSB0aGUgc2FtZSBwcm9ibGVtLCB1bmxlc3Mg
aXRzIEFNT3MgY2FuCj4gPiBnZW5lcmF0ZSB0aGUgcGVyY3B1IGFkZHJlc3MgYW5kIHBlcmZvcm0g
dGhlIHVwZGF0ZSBpbiBhIHNpbmdsZQo+ID4gaW5zdHJ1Y3Rpb24uCj4gCj4gTXkgdW5kZXJzdGFu
ZGluZyBpcyB0aGF0IG1hbnkgb2YgQ2hyaXN0b3BoJ3MgcGVyLWNwdSBwZXJmb3JtYW5jZSBjb25j
ZXJucyAKPiByZXZvbHZlIGFyb3VuZCBjb3VudGVycyBpbiB0aGUgVk0gY29kZSwgc3VjaCBhczoK
PiAKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2
YWxkcy9saW51eC5naXQvdHJlZS9tbS92bXN0YXQuYyNuMzU1CgpUaGUgbW9kXypfc3RhdGUoKSBm
dW5jdGlvbnMgYXJlIHRoZSBvbmx5IG9uZXMgd2hpY2ggbWVzcyB3aXRoCnByZWVtcHRpb24sIGFu
ZCB0aGF0IHNob3VsZCBvbmx5IG1hbmRhdGUgYSBmZXcgbG9jYWxseS12aXNpYmxlCm1vZGlmaWNh
dGlvbnMgb2YgcHJlZW1wdF9jb3VudC4KClNpbWlsYXIgY2FzZXMgYXBwbHkgd2l0aGluIFNMVUIs
IGFuZCBJJ2QgaG9wZWQgdG8gaW1wcm92ZSB0aGF0IHdpdGggbXkKdGhpcy1jcHUtcmVnIGJyYW5j
aCwgYnV0IEkgZGlkbid0IHNlZSBhIG1lYXN1cmVhYmxlIGltcHJvdmVtZW50IG9uCndvcmtsb2Fk
cyBJIHRyaWVkLgoKSGF2ZSB5b3Ugc2VlbiBhIG1lYXN1cmVhYmxlIHBlcmZvcm1hbmNlIHByb2Js
ZW0gaGVyZT8KCj4gYW5kIHByb2JhYmx5IGVsc2V3aGVyZSBieSBub3cuICBJdCBtYXkgYmUgd29y
dGggY3JlYXRpbmcgYSBkaXN0aW5jdCBBUEkgCj4gZm9yIHRob3NlIGNvdW50ZXJzLiAgSWYgb25s
eSBpbmNyZW1lbnQsIGRlY3JlbWVudCwgYW5kIHJlYWQgb3BlcmF0aW9ucyBhcmUgCj4gbmVlZGVk
LCB0aGVyZSBzaG91bGRuJ3QgYmUgYSBuZWVkIHRvIGRpc2FibGUgb3IgcmUtZW5hYmxlIAo+IHBy
ZWVtcHRpb24gaW4gdGhvc2UgY29kZSBwYXRocyAtIGFzc3VtaW5nIHRoYXQgb25lIGlzIGVpdGhl
ciBhYmxlIHRvIAo+IHRvbGVyYXRlIHRoZSBvY2Nhc2lvbmFsIGNhY2hlIGxpbmUgYm91bmNlIG9y
IHJldHJpZXMgaW4gYSBsb25nIExML1NDIAo+IHNlcXVlbmNlLiAgQW55IG9waW5pb25zIG9uIHRo
YXQ/CgpJJ20gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzIGNvZGUgd2VsbCBlbm91Z2gg
dG8gc2F5IHdoZXRoZXIgdGhhdAp3b3VsZCBiZSBzYWZlLgoKSXQncyBub3QgY2xlYXIgdG8gbWUg
d2hldGhlciB0aGVyZSB3b3VsZCBiZSBhIG1lYXN1cmVhYmxlIHBlcmZvcm1hbmNlCmRpZmZlcmVu
Y2UsIGFzIEknZCBleHBlY3QgZmlkZGxpbmcgd2l0aCBwcmVlbXB0X2NvdW50IHRvIGJlIHJlbGF0
aXZlbHkKY2hlYXAuIFRoZSBBTU9zIHRoZW1zZWx2ZXMgZG9uJ3QgbmVlZCB0byBlbmZvcmNlIG9y
ZGVyaW5nIGhlcmUsIGFuZCBvbmx5CmEgZmV3IGNvbXBpbGVyIGJhcnJpZXJzIGFyZSBuZWNlc3Nh
cnkuCgpUaGFua3MsCk1hcmsuCgo+ID4gRldJVywgSSBoYWQgYSBnbyBhdCBidWlsZGluZyBwZXJj
cHUgb3BzIHRoYXQgZGlkbid0IG5lZWQgdG8gZGlzYWJsZQo+ID4gcHJlZW1wdGlvbiwgYnV0IHRo
YXQgcmVxdWlyZWQgTEwvU0MgYXRvbWljcywgcmVzZXJ2aW5nIGEgR1BSIGZvciB0aGUKPiA+IHBl
cmNwdSBvZmZzZXQsIGFuZCBkaWRuJ3QgcmVzdWx0IGluIGEgbWVhc3VyYWJsZSBkaWZmZXJlbmNl
IGluIHByYWN0aWNlLgo+ID4gVGhlIHBhdGNoZXMgYXJlIGF0Ogo+ID4gCj4gPiBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tYXJrL2xpbnV4LmdpdC9jb21t
aXQvP2g9YXJtNjQvdGhpcy1jcHUtcmVnJmlkPTg0ZWU1ZjIzZjkzZDRhNjUwZTgyOGY4MzFkYTll
ZDI5YzU0NjIzYzUKPiAKPiBWZXJ5IGludGVyZXN0aW5nIGluZGVlZC4gIFRoYW5rIHlvdSBmb3Ig
c2hhcmluZyB0aGF0LAo+IAo+IC0gUGF1bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
