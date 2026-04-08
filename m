Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7602DFD5F99
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FUei73Qk+4GJBfFVWyn2GPIGtzMNpc2QQwPM6Z/R8g=; b=JkjZ2bZOMaLSAb
	jTwxmIicjkOA1sFqYuxmFH0BTOyYU3ZSUl6eLTlZet+cr3rl9XDXX77x5XJ5GayXjbC5crwi/mIJn
	eUGbjPWAvOffl0Bt9Fk6uU/9mvRj/7rLlJDipxL9IBbqgCbADjN6ZybkhFjX7nS19wTzLB3WpGxO0
	F+BznNuC1Csrryk5OMmyxiMewx4YIR6118kHCEgoKwR2ByLt0DRESuXF0EC9hV6VmUs/QQaZSQdhC
	Yd4/OQ2SWe6mI/Tzy0vki0llnbFS6byI6fMrzqaT5WQJaAPKC2yWaHKlz02B0EbO2D7/5ofdwk/eH
	yLw0ANVsb989JpeT+KyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOx0-00000008a7W-0nBG;
	Wed, 08 Apr 2026 09:11:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOwx-00000008a6b-1d6Y
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 09:11:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0D7240311;
	Wed,  8 Apr 2026 09:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9ABC19424;
	Wed,  8 Apr 2026 09:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775639510;
	bh=DubMFWrX8TCwWcTFPYpU7j4CJPYnyqeFDt+DGM5/3Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tl334rL+Tt3W2rPqpLDxlfLdEXgmPa04Fw7pjCn2yO+AdTqKvYcrK7tT4iiHqDEeg
	 TAeW78hJqGXCcJ6LYEiAaUt356c0agqL83M2Sm+T4i8n50bLG/I3/C46s79XziaGYf
	 ZAHh6Ez3UPsZpkEIynGHVIGZYkcpMn/H1Ga19g5E1GCTph8+J1ZWmldSSyPWbc8GJn
	 ySkf7Xcclnev+Bu4U1uaxii6eUqNnxcib0cPX7B4nFmGJXBI8gMrjakc+R0tvBctiT
	 xR/LAjYL771+D7abCcrm6DllafjF2SCyHWh6sabXxynIHULZ54sBJzobJftqLG/Mmr
	 qNG/5x+hCsStg==
Date: Wed, 8 Apr 2026 11:11:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QWxlxaEgUGXEjW5paw==?= <ales.pecnik@skylabs.si>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: microchip: mpfs-ccc: fix out-of-bounds write
Message-ID: <20260408-spiritual-locust-of-foundation-595aeb@quoll>
References: <20260408-mpfs-clk-oob-write-v1-1-8b3b387f2a6f@skylabs.si>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260408-mpfs-clk-oob-write-v1-1-8b3b387f2a6f@skylabs.si>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_021151_475500_45C9522A 
X-CRM114-Status: GOOD (  20.20  )
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

T24gV2VkLCBBcHIgMDgsIDIwMjYgYXQgMDc6MDc6MzRBTSArMDIwMCwgQWxlxaEgUGXEjW5payB3
cm90ZToKPiBJc3N1ZSB3YXMgYWxsb2NhdGVkIGFycmF5IHNpemUgZm9yIGNsa19kYXRhLgo+IFdo
ZW4gY2xvY2tzIGFyZSBiZWluZyByZWdpc3RlcmVkIHRoZWlyIGluZGV4IGlzIHRha2VuIGZyb20g
ZGVmaW5lcyBpbgo+IGR0LWJpbmRpbmdzLiBUaGUgbGFzdCAyIGNsb2NrcyBoYWQgdGhlaXIgaW5k
ZXggb3V0c2lkZSBvZiBhbGxvY2F0ZWQgcmFuZ2UuCj4gVHdvIGRlZmluZXMgKENMS19DQ0NfRExM
MCwgQ0xLX0NDQ19ETEwxKSB3ZXJlIG5vdCB1c2VkIGFuZCBza2lwcGVkIG92ZXIKPiB3aGljaCB3
YXMgbm90IHRha2VuIGludG8gYWNjb3VudCB3aGVuIGFsbG9jYXRpbmcgdGhlIGFycmF5Lgo+IAo+
IFRoaXMgcGF0Y2ggaXMgbWluaW1hbCBjaGFuZ2UgdG8gcmVzb2x2ZSB0aGUgaXNzdWUuCj4gCj4g
SXNzdWUgd2FzIGZvdW5kIHVzaW5nIEtBU0FOIHdoZW4gZGVidWdnaW5nIHVucmVsYXRlZCB4ZG1h
IGRyaXZlciBpc3N1ZS4KPiBDb25zZXF1ZW50bHkgZml4aW5nIHRoaXMgaXNzdWUgYWxzbyByZXNv
bHZlZCB4ZG1hIGRyaXZlciBpc3N1ZS4KPiAKPiBSZWxhdGVkIGRtZXNnIG91dHB1dDoKPiBbICAg
IDAuMjkwNzAzXSBCVUc6IEtBU0FOOiBzbGFiLW91dC1vZi1ib3VuZHMgaW4gbXBmc19jY2NfcmVn
aXN0ZXJfb3V0cHV0cy5jb25zdHByb3AuMCsweGQwLzB4MWZhCj4gWyAgICAwLjI5MDk4NF0gV3Jp
dGUgb2Ygc2l6ZSA4IGF0IGFkZHIgZmZmZmZmZTdiZTZlM2NhOCBieSB0YXNrIHN3YXBwZXIvMC8x
Cj4gWyAgICAwLjI5MTI1M10gQ1BVOiAwIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50
ZWQgNi4xLjQzLWxpbnV4NG1pY3JvY2hpcCtmcGdhLTIwMjMuMDkgIzEKPiBbICAgIDAuMjkxNDgy
XSBIYXJkd2FyZSBuYW1lOiBTa3lsYWJzIEhQQyAoRFQpCj4gWyAgICAwLjI5MTYxMV0gQ2FsbCBU
cmFjZToKPiAuLi4KPiBbICAgIDAuMjkyOTk5XSBbPGZmZmZmZmZmODA4NTA4Yzg+XSBtcGZzX2Nj
Y19yZWdpc3Rlcl9vdXRwdXRzLmNvbnN0cHJvcC4wKzB4ZDAvMHgxZmEKPiBbICAgIDAuMjkzMjQ1
XSBbPGZmZmZmZmZmODA4NTBiNjY+XSBtcGZzX2NjY19wcm9iZSsweDE3NC8weDMwZQo+IFsgICAg
MC4yOTM0MzddIFs8ZmZmZmZmZmY4MDhkNGFmMj5dIHBsYXRmb3JtX3Byb2JlKzB4NzQvMHhiYQo+
IC4uLgo+IAo+IEZpeGVzOiBkMzlmYjE3Mjc2MGUgKCJjbGs6IG1pY3JvY2hpcDogYWRkIFBvbGFy
RmlyZSBTb0MgZmFicmljIGNsb2NrIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IEFsZcWhIFBl
xI1uaWsgPGFsZXMucGVjbmlrQHNreWxhYnMuc2k+Cj4gLS0tCj4gIGRyaXZlcnMvY2xrL21pY3Jv
Y2hpcC9jbGstbXBmcy1jY2MuYyAgICAgICAgICAgICB8IDMgKy0tCj4gIGluY2x1ZGUvZHQtYmlu
ZGluZ3MvY2xvY2svbWljcm9jaGlwLG1wZnMtY2xvY2suaCB8IDIgKysKClBsZWFzZSBydW4gc2Ny
aXB0cy9jaGVja3BhdGNoLnBsIG9uIHRoZSBwYXRjaGVzIGFuZCBmaXggcmVwb3J0ZWQKd2Fybmlu
Z3MuIEFmdGVyIHRoYXQsIHJ1biBhbHNvICdzY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1zdHJpY3Qn
IG9uIHRoZQpwYXRjaGVzIGFuZCAocHJvYmFibHkpIGZpeCBtb3JlIHdhcm5pbmdzLiBTb21lIHdh
cm5pbmdzIGNhbiBiZSBpZ25vcmVkLAplc3BlY2lhbGx5IGZyb20gLS1zdHJpY3QgcnVuLCBidXQg
dGhlIGNvZGUgaGVyZSBsb29rcyBsaWtlIGl0IG5lZWRzIGEKZml4LiBGZWVsIGZyZWUgdG8gZ2V0
IGluIHRvdWNoIGlmIHRoZSB3YXJuaW5nIGlzIG5vdCBjbGVhci4KCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2Nsay9taWNyb2NoaXAvY2xrLW1wZnMtY2NjLmMgYi9kcml2ZXJzL2Nsay9taWNyb2NoaXAv
Y2xrLW1wZnMtY2NjLmMKPiBpbmRleCAzYTNlYTJkMTQyZjguLjcxZmJiNjI2NWVhNCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2Nsay9taWNyb2NoaXAvY2xrLW1wZnMtY2NjLmMKPiArKysgYi9kcml2
ZXJzL2Nsay9taWNyb2NoaXAvY2xrLW1wZnMtY2NjLmMKPiBAQCAtMjM0LDggKzIzNCw3IEBAIHN0
YXRpYyBpbnQgbXBmc19jY2NfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAg
CXVuc2lnbmVkIGludCBudW1fY2xrczsKPiAgCWludCByZXQ7Cj4gIAo+IC0JbnVtX2Nsa3MgPSBB
UlJBWV9TSVpFKG1wZnNfY2NjX3BsbF9jbGtzKSArIEFSUkFZX1NJWkUobXBmc19jY2NfcGxsMG91
dF9jbGtzKSArCj4gLQkJICAgQVJSQVlfU0laRShtcGZzX2NjY19wbGwxb3V0X2Nsa3MpOwo+ICsJ
bnVtX2Nsa3MgPSBDTEtfQ0NDX05VTTsKPiAgCj4gIAljbGtfZGF0YSA9IGRldm1fa3phbGxvYygm
cGRldi0+ZGV2LCBzdHJ1Y3Rfc2l6ZShjbGtfZGF0YSwgaHdfZGF0YS5od3MsIG51bV9jbGtzKSwK
PiAgCQkJCUdGUF9LRVJORUwpOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Ns
b2NrL21pY3JvY2hpcCxtcGZzLWNsb2NrLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL21p
Y3JvY2hpcCxtcGZzLWNsb2NrLmgKPiBpbmRleCBiNTJmMTlhMmI0ODAuLjhkNTNmMmI4MWE1NCAx
MDA2NDQKPiAtLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL21pY3JvY2hpcCxtcGZzLWNs
b2NrLmgKPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL21pY3JvY2hpcCxtcGZzLWNs
b2NrLmgKPiBAQCAtNzMsNCArNzMsNiBAQAo+ICAjZGVmaW5lIENMS19DQ0NfRExMMV9PVVQwCTE0
Cj4gICNkZWZpbmUgQ0xLX0NDQ19ETEwxX09VVDEJMTUKPiAgCj4gKyNkZWZpbmUgQ0xLX0NDQ19O
VU0JCTE2CgpOb3QgYSBiaW5kaW5nLCBkcm9wIGZyb20gYmluZGluZ3MuIERyaXZlciBpcyB0aGUg
cGxhY2UgZm9yIHRoYXQuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
