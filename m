Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E88BC25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 11:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=055WM5lqD3yoObCAIQSE3ZBYSY9B6LrjUI5Ca+9MCgM=; b=egtkx5AZN0CiGz
	ZlY/rgBeMXIZm3PLjBfZIvSqumDkwOZ92MRalJueSNiQqSfR0m8HSc6XIqWUIM6frwBwv+9afczdW
	Y7z5L6UNrcp9gudEH99MwUZGEnctnveEfAiuIU1d6JVnTOyEg4/CLvDeoxoxq2dlEgeg+yazeNCov
	5ieqS/gFrf7r3riaIWtqJDry+ZGR7dfG7VmvRG0zM6f+qabMj3pXHFw1dYHxb68BIXGqLVRWB1le7
	oWAmGOG5JEggyL5ISPr4SbXBR5Ls3E664nV0cqTU46voaTN/H2momk9lik/0OzLO4jj+oCokuGI9r
	q6KJZr58N6d9ihIug75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNuJr-001HLp-05; Tue, 16 Aug 2022 11:01:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNuJj-001HG1-Nn
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 11:01:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0A2E113E;
	Tue, 16 Aug 2022 04:01:01 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2960F3F70D;
	Tue, 16 Aug 2022 04:00:59 -0700 (PDT)
Date: Tue, 16 Aug 2022 12:00:50 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Heiko =?UTF-8?B?U3TDvGJuZXI=?=
 <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Message-ID: <20220816120050.07dc2416@donnerap.cambridge.arm.com>
In-Reply-To: <b5401052-e803-9788-64d6-82b2737533ce@linaro.org>
References: <20220815050815.22340-1-samuel@sholland.org>
	<5593349.DvuYhMxLoT@jernej-laptop>
	<3881930.ZaRXLXkqSa@diego>
	<2249129.ElGaqSPkdT@jernej-laptop>
	<b5401052-e803-9788-64d6-82b2737533ce@linaro.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_040108_351087_59E196B2 
X-CRM114-Status: GOOD (  24.74  )
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

T24gVHVlLCAxNiBBdWcgMjAyMiAxMjo0MjozOSArMDMwMApLcnp5c3p0b2YgS296bG93c2tpIDxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKSGksCgo+IE9uIDE2LzA4LzIw
MjIgMTI6MjUsIEplcm5laiDFoGtyYWJlYyB3cm90ZToKPiA+IERuZSB0b3JlaywgMTYuIGF2Z3Vz
dCAyMDIyIG9iIDExOjEyOjA1IENFU1QgamUgSGVpa28gU3TDvGJuZXIgbmFwaXNhbChhKTogIAo+
ID4+IEFtIERpZW5zdGFnLCAxNi4gQXVndXN0IDIwMjIsIDA5OjQ5OjU4IENFU1Qgc2NocmllYiBK
ZXJuZWogxaBrcmFiZWM6ICAKPiA+Pj4gRG5lIHRvcmVrLCAxNi4gYXZndXN0IDIwMjIgb2IgMDk6
NDE6NDUgQ0VTVCBqZSBLcnp5c3p0b2YgS296bG93c2tpICAgCj4gPiBuYXBpc2FsKGEpOiAgCj4g
Pj4+PiBPbiAxNS8wOC8yMDIyIDA4OjA4LCBTYW11ZWwgSG9sbGFuZCB3cm90ZTogIAo+ID4+Pj4+
ICsKPiA+Pj4+PiArCWRlOiBkaXNwbGF5LWVuZ2luZSB7Cj4gPj4+Pj4gKwkJY29tcGF0aWJsZSA9
ICJhbGx3aW5uZXIsc3VuMjBpLWQxLWRpc3BsYXktZW5naW5lIjsKPiA+Pj4+PiArCQlhbGx3aW5u
ZXIscGlwZWxpbmVzID0gPCZtaXhlcjA+LCA8Jm1peGVyMT47Cj4gPj4+Pj4gKwkJc3RhdHVzID0g
ImRpc2FibGVkIjsKPiA+Pj4+PiArCX07Cj4gPj4+Pj4gKwo+ID4+Pj4+ICsJb3NjMjRNOiBvc2My
NE0tY2xrIHsgIAo+ID4+Pj4KPiA+Pj4+IGxvd2VyY2FzZQo+ID4+Pj4gIAo+ID4+Pj4+ICsJCWNv
bXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOwo+ID4+Pj4+ICsJCWNsb2NrLWZyZXF1ZW5jeSA9IDwy
NDAwMDAwMD47ICAKPiA+Pj4+Cj4gPj4+PiBUaGlzIGlzIGEgcHJvcGVydHkgb2YgdGhlIGJvYXJk
LCBub3QgU29DLiAgCj4gPj4+Cj4gPj4+IFNvQyBuZWVkcyAyNCBNSHogb3NjaWxsYXRvciBmb3Ig
Y29ycmVjdCBvcGVyYXRpb24sIHNvIGVhY2ggYW5kIGV2ZXJ5IGJvYXJkCj4gPj4+IGhhcyBpdC4g
SGF2aW5nIGl0IGhlcmUgc2ltcGxpZmllcyBib2FyZCBEVCBmaWxlcy4gIAo+ID4+Cj4gPj4gSSBn
dWVzcyB0aGUgb3NjaWxsYXRvciBpcyBhIHNlcGFyYXRlIGNvbXBvbmVudCBvbiBlYWNoIGJvYXJk
LCByaWdodD8gIAo+ID4gCj4gPiBDb3JyZWN0Lgo+ID4gICAKPiA+PiBBbmQgRFQgb2J2aW91cyBp
cyBtZWFudCB0byBkZXNjcmliZSB0aGUgaGFyZHdhcmUgLSBpbmRlcGVuZGVudGx5IGZyb20KPiA+
PiBpbXBsZW1lbnRhdGlvbi1zcGVjaWZpYyBjaG9pY2VzLiAgCj4gPiAKPiA+IFRoZXJlIGlzIG5v
IGNob2ljZSBpbiB0aGlzIGNhc2UuIDI0IE1IeiBjcnlzdGFsIGhhcyB0byBiZSBwcmVzZW50Lgo+
ID4gCj4gPiBGV0lXLCBpbmNsdWRpbmcgY3J5c3RhbCBub2RlIGluIFNvQyBzcGVjaWZpYyBEVFNJ
IGlzIGFscmVhZHkgY29tbW9uIHBhdHRlcm4gaW4gCj4gPiBBbGx3aW5uZXIgQVJNIFNvQyBEVFNJ
IGZpbGVzLgo+ID4gICAKPiA+Pgo+ID4+IFN0YXJ0aW5nIHRvIGRpc2N1c3Mgd2hpY2ggZXhjZXB0
aW9ucyB0byBhbGxvdyB0aGVuIG1pZ2h0IGxlYWQgdG8gZXZlbiBtb3JlCj4gPj4gZXhjZXB0aW9u
cy4KPiA+Pgo+ID4+IEFsc28gaGF2aW5nIHRvIGxvb2sgZm9yIGEgYm9hcmQtY29tcG9uZW50IGlu
IHRoZSBzb2MgZHRzaSBhbHNvIGlzIHN1cnByaXNpbmcKPiA+PiBpZiBvbmUgZ2V0cyB0byB0aGUg
cGFydHkgbGF0ZXIgb24gOi0pIC4gIAo+ID4gCj4gPiBBcyBJIHNhaWQsIGlmIG9uZSBpcyBhY2N1
c3RvbWVkIHRvIEFsbHdpbm5lciBBUk0gRFQgZGV2ZWxvcG1lbnQsIGl0IHdvdWxkIGJlIAo+ID4g
bW9yZSBzdXJwcmlzaW5nIHRvIGluY2x1ZGUgMjQgTUh6IGNyeXN0YWwgbm9kZSBpbiBlYWNoIGFu
ZCBldmVyeSBib2FyZCBEVC4gIAo+IAo+IEl0J3Mgc2FtZSBldmVyeXdoZXJlLiBBbGx3aW5uZXIs
IEV4eW5vcywgaU1YLCBRdWFsY29tbS4gRXZlcnl3aGVyZSB0aGlzCj4gaXMgYSBwYXJ0IG9mIHRo
ZSBib2FyZCwgc28gZXZlbiBpZiBvc2NpbGxhdG9yIGZyZXF1ZW5jeSBpcyBmaXhlZCAoYXMgaW4K
PiA5OSUgb2YgY2FzZXMgYWx0aG91Z2ggc29tZSBTb0NzIEkgdGhpbmsgbWlnaHQganVzdCBhbGxv
dyB0byBpbXBsZW1lbnQKPiBvbmUgb2YgZmV3KSwgc3RpbGwgdGhpcyBpcyBhIHByb3BlcnR5IG9m
IHRoZSBib2FyZC4gQmVjYXVzZToKPiAxLiBEVFNJIGRlc2NyaWJlcyB0aGUgU29DIHBhcnQsIG5v
dCBib2FyZC4KPiAyLiBTbyB0aGUgRFRTIGRldmVsb3BlciBpcyBhIGJpdCBtb3JlIGNvbnNjaW91
cyBhYm91dCBoaXMgZGVzaWduLgoKMSkgaXMgY2VydGFpbmx5IHRydWUsIGJ1dCBpbmRlZWQgbW9z
dCBwbGF0Zm9ybXMgcHV0IHRoZSBiYXNlCmNyeXN0YWwgb3NjaWxsYXRvciBpbiB0aGUgU29DIC5k
dHNpOiBJIGp1c3Qgc2FtcGxlZCBSb2NrY2hpcCAocmszMzk5LmR0c2ksCnJrMzU2eC5kdHNpLCBy
azMzMjguZHRzaSksIEFtbG9naWMgKG1lc29uLWcxMi1jb21tb24uZHRzaSksIEFjdGlvblNlbWkg
KHNbNzldMDAuZHRzaSksClF1YWxjb21tIChtc204OTE2LmR0c2ksIHNtODQ1MC5kdHNpLCBzYzcx
ODAuZHRzaSksIEZyZWVzY2FsZSAoaW14OG1tLmR0c2ksCmlteDhxeHAuZHRzaSksIFJlYWx0ZWsg
KHJ0ZDEyOXguZHRzaSksIEJyb2FkY29tIChiY20yODN4LmR0c2kpLCBNZWRpYXRlawoobXQ4MTgz
LmR0c2ksIG10ODUxNi5kdHNpKS4gVGhlIGxpc3QgcHJvYmFibHkgZ29lcyBvbiAoSSBqdXN0IHN0
b3BwZWQKaGVyZSkuCgpJIHRoaW5rIG9uZSByZWFzb24gbWlnaHQgYmUgdGhhdCB0aGlzIGlzIHNv
IGNlbnRyYWwgdG8gdGhlIHdob2xlIFNvQwpvcGVyYXRpb24sIHRoYXQgaXQncyBhbHJlYWR5IHJl
ZmVyZW5jZWQgbXVsdGlwbGUgdGltZXMgaW4gdGhlIGJhc2UgLmR0c2kuCkFuZCBoYXZpbmcgYSB5
ZXQgdW5yZXNvbHZlZCByZWZlcmVuY2UgaW4gdGhlIC5kdHNpIGxvb2tzIGRvZGd5LgoKTlZpZGlh
IHNlZW1zIHRvIG9taXQgYSBiYXNlIG9zY2lsbGF0b3IgKG1heWJlIGl0J3MgaW1wbGljaXQgaW4g
dGhlaXIKYmluZGluZyBkZXNpZ24pLCBNYXJ2ZWxsIGRvZXNuJ3QgdXNlIGEgZml4ZWQtY2xvY2sg
KGJ1dCBzdGlsbCBwdXRzIHRoZWlyCmJhc2UgY2xvY2sgaW4gYXJtYWRhLTM3eHguZHRzaSkuCgpF
eHlub3MgYW5kIFJlbmVzYXMgcHV0IGEgKnN0dWIqIGZpeGVkLWNsb2NrIGluIHRoZSAuZHRzaSwg
YW5kIHNldCB0aGUKZnJlcXVlbmN5IGluIHRoZSBib2FyZCAuZHRzIGZpbGVzLiBXb3VsZCB0aGlz
IGJlIGEgY29tcHJvbWlzZT8KCkNoZWVycywKQW5kcmUKCj4gS2VlcGluZyB0aGluZ3MgaW4gU29D
IERUU0kganVzdCBiZWNhdXNlIGl0IHNpbXBsaWZpZXMgRFRTIGlzIG5vdCBjb3JyZWN0Cj4gSU1I
Ty4gU28gYWdhaW4gLSBsaWtlIGluIHNldmVyYWwgb3RoZXIgY2FzZXMgLSBtaW5pbXVtIHRoZSBm
cmVxdWVuY3kgaXMKPiBwcm9wZXJ0eSBvZiB0aGUgYm9hcmQsIG5vdCB0aGUgU29DIERUU0kuCj4g
Cj4gRXZlcnl3aGVyZS4gQWxsd2lubmVyIGlzIG5vdCBzcGVjaWFsIHRvIHJlY2VpdmUgZXhjZXB0
aW9ucy4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
