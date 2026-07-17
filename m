Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01D4C44507
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 04:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsPLo19HYqHhXuEs5ABOOBcN5b/LUCVs2/8uqDrsUns=; b=urX3m9s4zgZSQV
	hbAS3cyPQOPI4kenFgGwYgLImTHfn4i8M8R21a9XcxYSk7eBua7Dbb9VXW82acyCvSe5CqUKzlHF3
	qqEQEh3GOl23fZFrpXtTUxe8JYhPa0LamlLoE27L5/Q1VPKRtNrPiuK5LgeHPbAsOW48yYla6bTWp
	kO7XGafOAlV6bOBmSmOpgmFK+oqPtH9aggOWIDj/2oqfLfreZmfgpWwR//PB079zzU/do1en9DS2A
	3KQbQDrb2rq9ksSkMUPZy9jzhLl2nKg44oMRt3VN4uZNapCgAtYnwlQTsQAtNQ8hF5R+PBdy8M7yy
	RRpv8Q3qljovEZe1ScOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZvN-000000016ek-2LvC;
	Fri, 17 Jul 2026 04:11:45 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZvL-000000016eE-2kpM
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 04:11:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784261497; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XfzPhh/hPJPWjFvAzqiu6IIg1xWuNiRGWhV4c6MCaP7vZtzs4ieYFlI6pgdI+9QpUGpthxyAyPtVOetKMT6rOjmRR1nJ9YvFneIPPj9LG/8P1yHfvNDoFxkHSM1oYOBQJx3nPD1ycSGQqsVOUj69HJ49M+60DaqfCS3wGNZquFg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784261497; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Cg2f+UuUSNP7C/YEPxihEcuoxaaMP084bVnG9R6gApE=; 
	b=UxJusN0W+mWYGwvvj2hXF+T63Dgs9CJQQ66/tTRAGW9EkEi/erLkXuMarvS0neHKrAxW02qZgEeylItIF/G2i25JbMjMOC8cST5N5mX0HiK1+13Ia0tuMI6LNcSVbM/wCeeUvw1cUatyuOUIikNO/cme+Nck9CCdqsfYSCWTmpM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784261497;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=Cg2f+UuUSNP7C/YEPxihEcuoxaaMP084bVnG9R6gApE=;
	b=dNNhj4V3CQG35nNkE400CvH3F46vXMkc1/NV8cmGaNseXmrQyyrG+5UWuTpX02w4
	GYgZ7+hdgyKrjMUbtKfNPE2U2t31D0QkhaO0fCb6RNceswIkXqj7i2P99JQ/BtHLa0p
	xn+sz7dBYyfAhDsLYwBxVSQ4MMwO9t4M5Lda5/m8gpvFj/TKywf6G3XzlV+sLgiwApn
	mz95SSnuPtvO5p4iBOX4cV2DX+lZj1Ru7eKEZfZ3wgOa3e4XKvtEThgZ/eoTbM1uI2M
	HfQQhBEu6GCLVMtqO+gMEV3pCjnGjNiqcR+vz0o96DqWrWcTh+XdjalVwjMDnnvLU8a
	1cJPneMdNA==
Received: by mx.zohomail.com with SMTPS id 1784261492979721.9219173375741;
	Thu, 16 Jul 2026 21:11:32 -0700 (PDT)
Date: Fri, 17 Jul 2026 12:11:23 +0800
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
CC: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, MoeLeak <i@leak.moe>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_4/5=5D_riscv=3A_dts=3A_thead=3A_Ad?=
 =?US-ASCII?Q?d_IO_labels_for_the_IO_expansion_on_I2C1?=
User-Agent: K-9 Mail for Android
In-Reply-To: <allEg/A+Gt/em0Hs@x1>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn> <20260714074515.1959352-5-zhengxingda@iscas.ac.cn> <allEg/A+Gt/em0Hs@x1>
Message-ID: <1E3154C2-B5BE-46FD-BBFC-87E56FAE3AFE@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_211143_788893_B2A637B1 
X-CRM114-Status: GOOD (  12.01  )
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

Cgrkuo4gMjAyNuW5tDfmnIgxN+aXpSBHTVQrMDg6MDAgMDQ6NTI6MTnvvIxEcmV3IEZ1c3Rpbmkg
PGZ1c3RpbmlAa2VybmVsLm9yZz4g5YaZ6YGT77yaCj5PbiBUdWUsIEp1bCAxNCwgMjAyNiBhdCAw
Mzo0NToxNFBNICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+PiBGcm9tOiBFbWlsIFJlbm5l
ciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4KPj4gCj4+IEFk
ZCBsYWJlbHMgZm9yIEdQSU9zIG9uIHRoZSBJTyBleHBhbnNpb24gY2hpcCBvbiB0aGUgSTJDMSBi
dXMuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5u
ZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4KPj4gW0ljZW5vd3k6IFNwbGl0dGVkIG9mZiB0aGUg
cGF0Y2ggYWRkaW5nIGFsbCAzIElPIGV4cGFuc2lvbnNdCj4+IFNpZ25lZC1vZmYtYnk6IEljZW5v
d3kgWmhlbmcgPHpoZW5neGluZ2RhQGlzY2FzLmFjLmNuPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3Yv
Ym9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdHMgfCA4ICsrKysrKysrCj4+ICAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0cyBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdHMKPj4gaW5kZXggNzRiMTIwYzZi
MDYzYS4uNzhmNTk3OWE1NmMxNCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy90
aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0cwo+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3RoZWFkL3RoMTUyMC1saWNoZWUtcGktNGEuZHRzCj4+IEBAIC0xMjgsNiArMTI4LDE0IEBAIGlv
ZXhwMjogZ3Bpb0AxOCB7Cj4+ICAJCXJlZyA9IDwweDE4PjsKPj4gIAkJZ3Bpby1jb250cm9sbGVy
Owo+PiAgCQkjZ3Bpby1jZWxscyA9IDwyPjsKPj4gKwkJZ3Bpby1saW5lLW5hbWVzID0gIiIsCj4+
ICsJCQkJICAiY2FtMF9yZXNldCIsCj4+ICsJCQkJICAiY2FtMV9yZXNldCIsCj4+ICsJCQkJICAi
Y2FtMl9yZXNldCIsCj4+ICsJCQkJICAid2xfaG9zdF93YWtlIiwKPgo+SSBhbSBub3Qgc3VyZSB0
aGUgbGluZSBuYW1lIHJlYWxseSBtYXR0ZXJzIGFsbCB0aGF0LCBidXQgaXQgc2VlbXMgdGhhdAo+
cGluIDQgaXMgYWxzbyB1c2VkIGFzIGEgcmVzZXQgZ3BpbzoKClRoZSAiaG9zdCIgaGVyZSBpcyBz
dWJqZWN0LCB3aGljaCBtZWFucyAidGhpcyBwaW5zIGlzIHVzZWQgYnkgdGhlIGhvc3QgdG8gd2Fr
ZSB0aGUgd2wiLgoKTWF5YmUgSSBzaG91bGQgdGFrZSB0aGUgc2NoZW1hdGljcyBuYW1lLCAid2xf
aG9zdF93YWtlX2RldiI/IE9yIHVzZSBhbm90aGVyIG5hbWUgb24gdGhlIHBhZ2UgZm9yIFdpLUZp
LCAid2xfcmVnX29uIj8KClRoYW5rcywKSWNlbm93eQoKPgo+ICB3aWZpX3B3cnNlcTogd2lmaS1w
d3JzZXEgewo+ICAgICAgY29tcGF0aWJsZSA9ICJtbWMtcHdyc2VxLXNpbXBsZSI7Cj4gICAgICBy
ZXNldC1ncGlvcyA9IDwmaW9leHAyIDQgR1BJT19BQ1RJVkVfTE9XPjsKPiAgICAgIHBvc3QtcG93
ZXItb24tZGVsYXktbXMgPSA8MjAwPjsKPiAgfTsgICAgICAgCj4KPkRpZCB5b3Ugbm90aWNlIHRo
YXQgdG9vPwo+Cj5UaGFua3MsCj5EcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
