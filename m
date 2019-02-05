Return-Path: <SRS0=rZMy=QM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4498CC282CB
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Feb 2019 16:06:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1338A2080F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Feb 2019 16:06:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="adIoO28m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1338A2080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iogearbox.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrFX4+pNpn1jcHQGDtf5/D6vhMSc0817fxk44He0bqY=; b=adIoO28mGJPf/Q
	IclIaLj1ZFGX1MyTblHJRchln+tklpQK7tqDHMfz2lwSiw8gOC4wgFKedS6TkLn1+X08Cp3hwhZM8
	i1qMjK9mJ8kx1dhNdluT+QKPSxVUxlT5F2zbup5ZytIRbsrd+8VeyfJLVUhm+4oGEr09fqu6tCNhT
	6L0l7EXdhhRTec0hI6o6NYcb4p58mm4N3mldiBiiKtEKd74UryN78osoZ6xFozNKb3wPbSYNY4UtM
	rf49b4bxfuoOMkpasj3Mi3pYv1KCwEsWt1n84jHOKX/LQllX9e6HxNKDQdrt+3Z7f2GuTZdMw4euK
	ThQsDKCw+KRfwz6y7BZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr3ES-00032j-J2; Tue, 05 Feb 2019 16:05:56 +0000
Received: from www62.your-server.de ([213.133.104.62])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr3EP-00032Q-GD
 for linux-riscv@lists.infradead.org; Tue, 05 Feb 2019 16:05:55 +0000
Received: from [78.46.172.3] (helo=sslproxy06.your-server.de)
 by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <daniel@iogearbox.net>)
 id 1gr3EJ-0007X6-2M; Tue, 05 Feb 2019 17:05:48 +0100
Received: from [178.197.249.40] (helo=linux.home)
 by sslproxy06.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <daniel@iogearbox.net>)
 id 1gr3EI-0003Lv-R9; Tue, 05 Feb 2019 17:05:46 +0100
Subject: Re: [PATCH bpf-next v2 0/4] Add RISC-V (RV64G) BPF JIT
To: bjorn.topel@gmail.com, linux-riscv@lists.infradead.org, ast@kernel.org,
 netdev@vger.kernel.org
References: <20190205124125.5553-1-bjorn.topel@gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <8d1cb0d4-c781-3063-49f5-ce788f141b9f@iogearbox.net>
Date: Tue, 5 Feb 2019 17:05:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20190205124125.5553-1-bjorn.topel@gmail.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.100.2/25351/Tue Feb  5 11:35:19 2019)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_080553_539161_1ECD9E66 
X-CRM114-Status: GOOD (  17.36  )
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
Cc: hch@infradead.org, palmer@sifive.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDIvMDUvMjAxOSAwMTo0MSBQTSwgYmpvcm4udG9wZWxAZ21haWwuY29tIHdyb3RlOgo+IEZy
b206IEJqw7ZybiBUw7ZwZWwgPGJqb3JuLnRvcGVsQGdtYWlsLmNvbT4KPiAKPiBIaSEKPiAKPiBU
aGlzIHYyIHNlcmllcyBhZGRzIGFuIFJWNjRHIEJQRiBKSVQgdG8gdGhlIGtlcm5lbC4KPiAKPiBB
dCB0aGUgbW9tZW50IHRoZSBSSVNDLVYgTGludXggcG9ydCBkb2VzIG5vdCBzdXBwb3J0Cj4gQ09O
RklHX0hBVkVfS1BST0JFUyAoUGF0cmljayBTdMOkaGxpbiBzZW50IG91dCBhbiBSRkMgbGFzdCB5
ZWFyKSwgd2hpY2gKPiBtZWFucyB0aGF0IENPTkZJR19CUEZfRVZFTlRTIGlzIG5vdCBzdXBwb3J0
ZWQuIFRodXMsIG5vIHRlc3RzCj4gaW52b2x2aW5nIEJQRl9QUk9HX1RZUEVfVFJBQ0VQT0lOVCwg
QlBGX1BST0dfVFlQRV9QRVJGX0VWRU5ULAo+IEJQRl9QUk9HX1RZUEVfS1BST0JFIGFuZCBCUEZf
UFJPR19UWVBFX1JBV19UUkFDRVBPSU5UIHBhc3Nlcy4KPiAKPiBUaGUgaW1wbGVtZW50YXRpb24g
ZG9lcyBub3Qgc3VwcG9ydCAiZmFyIGJyYW5jaGluZyIgKD40S2lCKS4KPiAKPiBUZXN0IHJlc3Vs
dHM6Cj4gICAjIG1vZHByb2JlIHRlc3RfYnBmCj4gICB0ZXN0X2JwZjogU3VtbWFyeTogMzc4IFBB
U1NFRCwgMCBGQUlMRUQsIFszNjYvMzY2IEpJVCdlZF0KPiAKPiAgICMgZWNobyAxID4gL3Byb2Mv
c3lzL2tlcm5lbC91bnByaXZpbGVnZWRfYnBmX2Rpc2FibGVkCj4gICAjIC4vdGVzdF92ZXJpZmll
cgo+ICAgLi4uCj4gICBTdW1tYXJ5OiA3NjEgUEFTU0VELCA1MDcgU0tJUFBFRCwgMiBGQUlMRUQK
PiAKPiBOb3RlIHRoYXQgInRlc3RfdmVyaWZpZXIiIHdhcyBydW4gd2l0aCBvbmUgYnVpbGQgd2l0
aAo+IENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTPXkgYW5kIG9uZSB3aXRo
b3V0LCBvdGhlcndpc2UKPiBtYW55IG9mIHRoZSB0aGUgdGVzdHMgdGhhdCByZXF1aXJlIHVuYWxp
Z25lZCBhY2Nlc3Mgd2VyZSBza2lwcGVkLgo+IAo+IENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFM
SUdORURfQUNDRVNTPXk6Cj4gICAjIGVjaG8gMSA+IC9wcm9jL3N5cy9rZXJuZWwvdW5wcml2aWxl
Z2VkX2JwZl9kaXNhYmxlZAo+ICAgIyAuL3Rlc3RfdmVyaWZpZXIgfCBncmVwIC1jICdOT1RFLip1
bmtub3duIGFsaWduJwo+ICAgMAo+IAo+IE5vIENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdO
RURfQUNDRVNTOgo+ICAgIyBlY2hvIDEgPiAvcHJvYy9zeXMva2VybmVsL3VucHJpdmlsZWdlZF9i
cGZfZGlzYWJsZWQKPiAgICMgLi90ZXN0X3ZlcmlmaWVyIHwgZ3JlcCAtYyAnTk9URS4qdW5rbm93
biBhbGlnbicKPiAgIDU5Cj4gCj4gVGhlIHR3byBmYWlsaW5nIHRlc3RfdmVyaWZpZXIgdGVzdHMg
YXJlOgo+ICAgImxkX2FiczogdmxhbiArIGFicywgdGVzdCAxIgo+ICAgImxkX2FiczoganVtcCBh
cm91bmQgbGRfYWJzIgo+IAo+IFRoaXMgaXMgZHVlIHRvIHRoYXQgImZhciBicmFuY2hpbmciIGlu
dm9sdmVkIGluIHRob3NlIHRlc3RzLgo+IEFsbCB0ZXN0cyB3aGVyZSBkb25lIG9uIFFFTVUgZW11
bGF0b3IgdmVyc2lvbiAzLjEuNTAKPiAodjMuMS4wLTY4OC1nOGFlOTUxZmJjMTA2KS4gSSdsbCB0
ZXN0IGl0IG9uIHJlYWwgaGFyZHdhcmUsIHdoZW4gSSBnZXQKPiBhY2Nlc3MgdG8gaXQuCj4gCj4g
SSdtIHJvdXRpbmcgdGhpcyBwYXRjaCB2aWEgYnBmLW5leHQvbmV0ZGV2IG1haWxpbmcgbGlzdCAo
YWZ0ZXIgYQo+IGNvbnZlcnNhdGlvbiB3aXRoIFBhbG1lciBhdCBGT1NERU0pLCBtYWlubHkgYmVj
YXVzZSB0aGUgb3RoZXIgSklUcwo+IHdlbnQgdGhhdCBwYXRoLgo+IAo+IEFnYWluLCB0aGFua3Mg
Zm9yIGFsbCB0aGUgY29tbWVudHMhCj4gCj4gQ2hlZXJzLAo+IEJqw7Zybgo+IAo+IHYxIC0+IHYy
Ogo+ICogQWRkZWQgSk1QMzIgc3VwcG9ydC4gKERhbmllbCkKPiAqIEFkZCBSSVNDLVYgdG8gRG9j
dW1lbnRhdGlvbi9zeXNjdGwvbmV0LnR4dC4gKERhbmllbCkKPiAqIEZpeGVkIHNlZW5fY2FsbCgp
IGFzeW1tZXRyeS4gKERhbmllbCkKPiAqIEZpeGVkIGJyb2tlbiBicGZfZmx1c2hfaWNhY2hlKCkg
cmFuZ2UuIChEYW5pZWwpCj4gKiBBZGRlZCBhbGlnbm1lbnQgYW5ub3RhdGlvbnMgdG8gc29tZSBz
ZWxmdGVzdHMuCj4gCj4gUkZDdjEgLT4gdjE6Cj4gKiBDbGVhbmVkIHVwIHRoZSBLY29uZmlnIGFu
ZCBuZXQvTWFrZWZpbGUuIChDaHJpc3RvcGgpCj4gKiBSZW1vdmVkIHRoZSBlbnRyeS1zdHViIGFu
ZCBzcXVhc2hlZCB0aGUgYnVpbGQvY29uZmlnIGNoYW5nZXMgdG8gYmUKPiAgIHBhcnQgb2YgdGhl
IEpJVCBpbXBsZW1lbnRhdGlvbi4gKENocmlzdG9waCkKPiAqIFNpbXBsaWZpZWQgdGhlIHJlZ2lz
dGVyIHRyYWNraW5nIGNvZGUuIChEYW5pZWwpCj4gKiBSZW1vdmVkIHVudXNlZCBtYWNyb3MuIChE
YW5pZWwpCj4gKiBBZGRlZCBteXNlbGYgYXMgbWFpbnRhaW5lciBhbmQgdXBkYXRlZCBkb2N1bWVu
dGF0aW9uLiAoRGFuaWVsKQo+ICogUmVtb3ZlZCBIQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUND
RVNTLiAoQ2hyaXN0b3BoLCBQYWxtZXIpCj4gKiBBZGRlZCB0YWlsLWNhbGxzIGFuZCBjbGVhbmVk
IHVwIHRoZSBjb2RlLgo+IAo+IAo+IEJqw7ZybiBUw7ZwZWwgKDQpOgo+ICAgYnBmLCByaXNjdjog
YWRkIEJQRiBKSVQgZm9yIFJWNjRHCj4gICBNQUlOVEFJTkVSUzogYWRkIFJJU0MtViBCUEYgSklU
IG1haW50YWluZXIKPiAgIGJwZiwgZG9jOiBhZGQgUklTQy1WIEpJVCB0byBCUEYgZG9jdW1lbnRh
dGlvbgo+ICAgc2VsZnRlc3RzL2JwZjogYWRkICJhbnkgYWxpZ25tZW50IiBhbm5vdGF0aW9uIGZv
ciBzb21lIHRlc3RzCj4gCj4gIERvY3VtZW50YXRpb24vbmV0d29ya2luZy9maWx0ZXIudHh0ICAg
ICAgICAgICB8ICAgMTYgKy0KPiAgRG9jdW1lbnRhdGlvbi9zeXNjdGwvbmV0LnR4dCAgICAgICAg
ICAgICAgICAgIHwgICAgMSArCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgIDYgKwo+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgICAxICsKPiAgYXJjaC9yaXNjdi9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAgMiArLQo+ICBhcmNoL3Jpc2N2L25ldC9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgICAgfCAgICAxICsKPiAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wLmMg
ICAgICAgICAgICAgICAgIHwgMTYwMiArKysrKysrKysrKysrKysrKwo+ICAuLi4vc2VsZnRlc3Rz
L2JwZi92ZXJpZmllci9jdHhfc2tfbXNnLmMgICAgICAgfCAgICAxICsKPiAgLi4uL3Rlc3Rpbmcv
c2VsZnRlc3RzL2JwZi92ZXJpZmllci9jdHhfc2tiLmMgIHwgICAgMSArCj4gIHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2JwZi92ZXJpZmllci9qbXAzMi5jICB8ICAgMjIgKwo+ICB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9icGYvdmVyaWZpZXIvanNldC5jICAgfCAgICAyICsKPiAgLi4uL3NlbGZ0
ZXN0cy9icGYvdmVyaWZpZXIvc3BpbGxfZmlsbC5jICAgICAgIHwgICAgMSArCj4gIC4uLi9zZWxm
dGVzdHMvYnBmL3ZlcmlmaWVyL3NwaW5fbG9jay5jICAgICAgICB8ICAgIDIgKwo+ICAuLi4vc2Vs
ZnRlc3RzL2JwZi92ZXJpZmllci92YWx1ZV9wdHJfYXJpdGguYyAgfCAgICA0ICsKPiAgMTQgZmls
ZXMgY2hhbmdlZCwgMTY1NCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9uZXQvTWFrZWZpbGUKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcC5jCgpBcHBsaWVkLCB0aGFua3MhCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
