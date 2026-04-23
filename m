Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415AFF589CD
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2026 13:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLshwCowWqO/40hHdbiwNMPX3XCpch1fU8f0uHb/uuk=; b=YcI9+kux/bBWTq
	HZKghKjQAjUEDwUuzMwH1BkqawAohBa6Z7c8NhhkrWFltztlQHPl4kAnJIr1lAhvbLlWhRa3GfMdf
	XgO8KFtg254ChGcZO3JMWIxSnCbi+MnwEIGP3pW33t67tX2JHqQYVg7h+m7GDL9UnWXJyDzf8Raag
	MRN6bOY0oQVAevS6E+fcR6nK2EfIc734Mlaq7t4M+KNqw6c8EnmekS61xqxduanFp+Tc4OH4mv6X+
	KFkACx9cjlSlbrDygDokFPtL/pLISFA535Gd6hYH/HKhQFN7jZuW4M+doWPVptfIzCSsD7APdnnKK
	M8IQZM5wS9h0HU4GRzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtjc-0000000BiJY-42Kq;
	Thu, 23 Apr 2026 13:04:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtjV-0000000BiJ3-18B9
	for linux-riscv@lists.infradead.org;
	Thu, 23 Apr 2026 13:04:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FD4C416B5;
	Thu, 23 Apr 2026 13:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF96C2BCAF;
	Thu, 23 Apr 2026 13:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776949480;
	bh=3KN/9xYClnbKmpip1Kg4BXkQ4NkWlYtHiVbzGlXqlc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VsT448tl/xYct0rR1E+hiGErLn2sJSkpSyRWragF+IMTUwo2OtWo37yNvrKho8QZc
	 zEhJ7ISzM0SEdWfr3bHn407Km0B17u6GHQ/Ww67CO3ltIwZ9pjQ4wuv+w7LKWvuXZ3
	 RurIresRLswrN2rcUcIQKFH7fCA9BBithVDE53sj2o2A/aLf/g0oNyLRKFuDAI/H+b
	 1+yS1h289WEL5O8b/e8XJc+gPJJRMe4M5Y3yuz4QBX4WCo4OYbhavVefFYI39RFPm5
	 kBESXrfxirSFymO18VWKPW4WKRxJWsEkBR3A2jN4/jiCURPIny0dx2FEcab9SZNmWL
	 oR45LRdNOi7Qg==
Date: Thu, 23 Apr 2026 18:34:31 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] PCI: ultrarisc: Add UltraRISC DP1000 PCIe Root
 Complex driver
Message-ID: <yqxyjv2q4lp5ymb6mjzpldjp2folqsvu4qneaihapbchrcithl@tcj4gu3ez3wh>
References: <20260415-ultrarisc-pcie-v3-0-73f06e972616@ultrarisc.com>
 <20260415-ultrarisc-pcie-v3-3-73f06e972616@ultrarisc.com>
 <7n5b44ynbem2xve3twofaqunqlkw4aijatuuemujrfq5yd5mzq@5qnikt7ximd3>
 <177693928812.2917474.4251479012132866533.b4-reply@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <177693928812.2917474.4251479012132866533.b4-reply@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_060441_543434_4F5C8ED4 
X-CRM114-Status: GOOD (  22.41  )
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

T24gVGh1LCBBcHIgMjMsIDIwMjYgYXQgMDY6MTQ6NDhQTSArMDgwMCwgSmlhIFdhbmcgd3JvdGU6
CgpbLi4uXQoKPiA+ID4gKwlpbnQgcmV0Owo+ID4gPiArCj4gPiA+ICsJcGNpZSA9IGRldm1fa3ph
bGxvYyhkZXYsIHNpemVvZigqcGNpZSksIEdGUF9LRVJORUwpOwo+ID4gPiArCWlmICghcGNpZSkK
PiA+ID4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gPiA+ICsKPiA+ID4gKwlwY2kgPSBkZXZtX2t6YWxs
b2MoZGV2LCBzaXplb2YoKnBjaSksIEdGUF9LRVJORUwpOwo+ID4gPiArCWlmICghcGNpKQo+ID4g
PiArCQlyZXR1cm4gLUVOT01FTTsKPiA+ID4gKwo+ID4gPiArCXBjaS0+ZGV2ID0gZGV2Owo+ID4g
PiArCXBjaS0+b3BzID0gJmR3X3BjaWVfb3BzOwo+ID4gPiArCj4gPiA+ICsJLyogU2V0IGEgZGVm
YXVsdCB2YWx1ZSBzdWl0YWJsZSBmb3IgYXQgbW9zdCAxNiBpbiBhbmQgMTYgb3V0IHdpbmRvd3Mg
Ki8KPiA+ID4gKwlwY2ktPmF0dV9zaXplID0gU1pfOEs7Cj4gPiA+ICsJcGNpLT5tYXhfbGlua19z
cGVlZCA9IDQ7Cj4gPiAKPiA+IEdldCB0aGlzIGZyb20gRFQgcGxlYXNlLi4uIFRoaXMgY2FuIGNo
YW5nZSBiZXR3ZWVuIFNvQyByZXZpc2lvbnMuCj4gPgo+IAo+IER1cmluZyB0aGUgdjIgRFQgYmlu
ZGluZyByZXZpZXcsIEtyenlzenRvZiBwb2ludGVkIG91dCB0aGF0IHNpbmNlIHRoZQo+IHByb3Bl
cnRpZXMgYXJlIGZpeGVkIGZvciB0aGlzIGhhcmR3YXJlLCB0aGV5IGFyZSBkZWR1Y2libGUgZnJv
bSB0aGUKPiBjb21wYXRpYmxlIHN0cmluZyBhbmQgc2hvdWxkIGJlIGRyb3BwZWQgZnJvbSB0aGUg
RFQgYmluZGluZ3MuCj4gCj4gVGhlIHYyIGRpc2N1c3Npb24gaXMgaGVyZToKPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvYzYwYTcxMmUtZWNmMy00OTI2LTk5NDctMGU1OTNjZGI5MjFkQGtl
cm5lbC5vcmcvCj4gCj4gSSB0aGVuIG1vdmVkIHRoZW0gaW50byB0aGUgZHJpdmVyIGZvciB2My4g
SWYgZnV0dXJlIFNvQyByZXZpc2lvbnMgaW50cm9kdWNlCj4gdmFyaWF0aW9ucywgSSdsbCB1cGRh
dGUgdGhlIGRyaXZlciB0byBoYW5kbGUgdGhlbSBhY2NvcmRpbmdseS4KPiAKPiBEb2VzIHRoaXMg
bWFrZSBzZW5zZT8KPiAKClRoZXJlIGFyZSB0d28gdXNlcyBvZiB0aGlzIHByb3BlcnR5OgoKMS4g
VG8gcHJvdmlkZSBkZWZhdWx0IE1heCBMaW5rIFNwZWVkIG9mIHRoZSBSb290IFBvcnQocykgaWYg
dGhlIGhhcmR3YXJlIGRlZmF1bHQKdmFsdWUgaXMgd3JvbmcuJwoKMi4gVG8gb3ZlcnJpZGUgdGhl
IGhhcmR3YXJlIGRlZmF1bHQgdG8gd29ya2Fyb3VuZCB0aGUgaGFyZHdhcmUgaXNzdWVzIGxpa2UK
YnJva2VuIFBDQiByb3V0aW5nIGV0Yy4uLgoKRm9yIHRoZSBmaXJzdCB1c2VjYXNlLCB5b3UgbmVl
ZCB0byBjaGVjayBpZiB0aGlzIHZhbHVlIGRpZmZlcmVudCBmcm9tClBDSV9FWFBfTE5LQ0FQX1NM
UyBmaWVsZCBvZiBMTktDQVAgcmVnaXN0ZXI/IElmIG5vdCwgeW91IGRvbid0IG5lZWQgdG8gc2V0
IGl0CmluIHNvYy5kdHNpL2R0LWJpbmRpbmcgYW5kIHRoZSBEV0MgY29yZSB3aWxsIGV4dHJhY3Qg
dGhpcyB2YWx1ZSBmcm9tIHRoZSBEQkkKcmVnaXN0ZXIuCgpGb3IgdGhlIHNlY29uZCBjYXNlLCB5
b3UgZG9uJ3QgbmVlZCB0byBkZWZpbmUgaXQgaW4geW91ciBjb250cm9sbGVyIGR0LWJpbmRpbmcK
d2l0aCBhIGRlZmF1bHQgdmFsdWUgYW5kIGFsc28gaW4geW91ciBzb2MuZHRzaS4gU2luY2UgdGhp
cyBwcm9wZXJ0eSBpcyBkZWZpbmVkCmluIHRoZSBkdHNjaGVtYSBbMV0sIHlvdSBjYW4ganVzdCBp
bmNsdWRlIHRoZSBwcm9wZXJ0eSBpbiBib2FyZCBEVFMgZmlsZSB0bwp3b3JrYXJvdW5kIGhhcmR3
YXJlIGlzc3VlcyAoYm9hcmQgc3BlY2lmaWMpIGFuZCBkdGJzX2NoZWNrIHdpbGwgbm90IGNvbXBs
YWluLgoKTk9URTogRm9yIGJvdGggY2FzZXMsIHlvdSBkb24ndCBuZWVkIGRyaXZlciBjaGFuZ2Vz
LCBzaW5jZSBEV0MgY29yZSB3aWxsIGhhbmRsZQppdC4KCi0gTWFuaQoKWzFdIGh0dHBzOi8vZ2l0
aHViLmNvbS9kZXZpY2V0cmVlLW9yZy9kdC1zY2hlbWEvYmxvYi9tYWluL2R0c2NoZW1hL3NjaGVt
YXMvcGNpL3BjaS1idXMtY29tbW9uLnlhbWwjTDExNwoKPiA+ID4gKwlwY2llLT5wY2kgPSBwY2k7
Cj4gPiA+ICsKPiA+ID4gKwlwcCA9ICZwY2ktPnBwOwo+ID4gPiArCj4gPiA+ICsJcGxhdGZvcm1f
c2V0X2RydmRhdGEocGRldiwgcGNpZSk7Cj4gPiA+ICsKPiA+ID4gKwlwcC0+aXJxID0gcGxhdGZv
cm1fZ2V0X2lycShwZGV2LCAxKTsKPiA+ID4gKwlpZiAocHAtPmlycSA8IDApCj4gPiA+ICsJCXJl
dHVybiBwcC0+aXJxOwo+ID4gCj4gPiBXaG8gaXMgcmVxdWVzdGluZyB0aGlzIElSUT8KPiA+IAo+
IAo+IE5vdCBuZWVkZWQuIFdpbGwgcmVtb3ZlIGl0IGluIHY0Lgo+IAo+ID4gPiArCj4gPiA+ICsJ
cHAtPm51bV92ZWN0b3JzID0gTUFYX01TSV9JUlFTOwo+ID4gCj4gPiBBcmUgeW91IHN1cmUgeW91
ciBjb250cm9sbGVyIHN1cHBvcnRzIDI1NiBNU0lzIHdpdGggb25lIFNQSSBpbnRlcnJ1cHQ/IEl0
IGlzCj4gPiBwb3NzaWJsZSwgYnV0IHdhbnQgdG8gbWFrZSBzdXJlIGl0IGlzIHRoZSBjYXNlLgo+
ID4gCj4gCj4gWWVzLiBUaGUgY29udHJvbGxlciBpbXBsZW1lbnRzIDggTVNJIGNvbnRyb2wgYmxv
Y2tzIChpID0gMC4uNyksIGVhY2gKPiBwcm92aWRpbmcgMzIgdmVjdG9ycywgc28gMjU2IE1TSXMg
YXJlIHN1cHBvcnRlZC4gVGhpcyBpcyBkb2N1bWVudGVkIGluIHRoZQo+IGNvbnRyb2xsZXIgSVAg
c3BlY2lmaWNhdGlvbi4KPgoKT2ssIHRoYW5rcyBmb3IgY29uZmlybWluZy4KCi0gTWFuaQoKLS0g
CuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
