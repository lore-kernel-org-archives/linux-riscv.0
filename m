Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1782E732C0
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 11:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/1jNHNju0iP0vK/6099AVb1WXdIvSGDx+Tij0Z4CFc=; b=kyig2N2Mgx+4U7
	K52C3Djf9Sw6MH72CEhc9mWPcffG4/YJ/ggeVuhYb97IRgctvENV9qc8CvdNz/3GMfKDs7hNa1Scq
	DuG2spjWqKBy9B+GFaNbGk6QPlh+Hzjo+jeVuFLTgY8xsCtt2hiVNVsJtqNsspBedHzmxHIG2yNvu
	njryW0CfV2Tq37cmBXYAlnz0r92yhMOSlCDTzjXtzqSVO87GDnH7aRoXG848CtISF6Ag4pCupmMW9
	ThxbZBYQEHPDe6zU1RECcE2aeecYNoRu4lT0bnwp+d6u92AH72GavsW2USdRJjVG3zF9ZGXe2jNAS
	jnZxcWL02oEWhNE1+vpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlosV-0035bw-06;
	Thu, 28 Sep 2023 11:08:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlosR-0035a0-2I
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 11:08:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4DB8CB81BC2;
	Thu, 28 Sep 2023 11:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2766EC433C9;
	Thu, 28 Sep 2023 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695899293;
	bh=0sL8RCBSm5AJGYaXOgQaGuqOaK3gCtO5ozWYMZg9Syc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qJcJYfprelsc2r0GYWq1Jaa3nLRh/GYED6eLIgjfyn0rxDT8+VZjOvYs2ZZu6LjE1
	 VRShZmZMQ7R1QKZP6BWkfWLeLjlKyknxplXOBavJNZP7besHqEL4LF8eXcxT2lZdLE
	 lYrg5KlR5UICZWe6B+SiMtzDLAYeAZWlRo0rw6UyI5UEu/5ybj5LVzp/5s6rHrJHGA
	 3Cuh52pWs1qLeZfLJnuGSjvxY+KOMQH9OSgevp42Iq9enHQy/KNvCBoiKnBydYDkYc
	 HdwDCXNDowk+QvhzSvLIWRojTyH6CIK6hW8TpAohB4tbmoPA1yEwSGDwL2QTZQMRRZ
	 +8ywwdKWidcMQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next v2 6/6] riscv, bpf: Optimize bswap insns with
 Zbb support
In-Reply-To: <20230919035839.3297328-7-pulehui@huaweicloud.com>
References: <20230919035839.3297328-1-pulehui@huaweicloud.com>
 <20230919035839.3297328-7-pulehui@huaweicloud.com>
Date: Thu, 28 Sep 2023 13:08:10 +0200
Message-ID: <87pm22mu79.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_040816_082002_F18CC2E1 
X-CRM114-Status: GOOD (  12.46  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEZyb206IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBPcHRpbWl6ZSBic3dhcCBpbnN0cnVjdGlvbnMg
YnkgcmV2OCBaYmIgaW5zdHJ1Y3Rpb24gY29uYmluZWQgd2l0aCBzcmxpCj4gaW5zdHJ1Y3Rpb24u
IEFuZCBPcHRpbWl6ZSAxNi1iaXQgemVyby1leHRlbnNpb24gd2l0aCBaYmIgc3VwcG9ydC4KPgo+
IFNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGFy
Y2gvcmlzY3YvbmV0L2JwZl9qaXQuaCAgICAgICAgfCA2NyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDUwICstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKyks
IDQ4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQu
aCBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaAo+IGluZGV4IDk0NGJkZDZlNC4uYTA0ZWVkNjcy
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaAo+ICsrKyBiL2FyY2gvcmlz
Y3YvbmV0L2JwZl9qaXQuaAo+IEBAIC0xMTM1LDEyICsxMTM1LDc5IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBlbWl0X3NleHR3KHU4IHJkLCB1OCBycywgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgp
Cj4gIAllbWl0X2FkZGl3KHJkLCBycywgMCwgY3R4KTsKPiAgfQo+ICAKPiArc3RhdGljIGlubGlu
ZSB2b2lkIGVtaXRfemV4dGgodTggcmQsIHU4IHJzLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0
eCkKPiArewo+ICsJaWYgKHJ2emJiX2VuYWJsZWQoKSkgewo+ICsJCWVtaXQocnZ6YmJfemV4dGgo
cmQsIHJzKSwgY3R4KTsKPiArCX0gZWxzZSB7Cj4gKwkJZW1pdF9zbGxpKHJkLCBycywgNDgsIGN0
eCk7Cj4gKwkJZW1pdF9zcmxpKHJkLCByZCwgNDgsIGN0eCk7Cj4gKwl9Cj4gK30KPiArCgpQcmVm
ZXIgZWFybHktZXhpdC4KCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBlbWl0X3pleHR3KHU4IHJkLCB1
OCBycywgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCj4gIHsKPiAgCWVtaXRfc2xsaShyZCwg
cnMsIDMyLCBjdHgpOwo+ICAJZW1pdF9zcmxpKHJkLCByZCwgMzIsIGN0eCk7Cj4gIH0KPiAgCj4g
K3N0YXRpYyBpbmxpbmUgdm9pZCBlbWl0X2Jzd2FwKHU4IHJkLCBzMzIgaW1tLCBzdHJ1Y3QgcnZf
aml0X2NvbnRleHQgKmN0eCkKPiArewo+ICsJaWYgKHJ2emJiX2VuYWJsZWQoKSkgewo+ICsJCWlu
dCBiaXRzID0gNjQgLSBpbW07Cj4gKwo+ICsJCWVtaXQocnZ6YmJfcmV2OChyZCwgcmQpLCBjdHgp
Owo+ICsJCWlmIChiaXRzKQo+ICsJCQllbWl0X3NybGkocmQsIHJkLCBiaXRzLCBjdHgpOwo+ICsJ
fSBlbHNlIHsKPiArCQllbWl0X2xpKFJWX1JFR19UMiwgMCwgY3R4KTsKPiArCj4gKwkJZW1pdF9h
bmRpKFJWX1JFR19UMSwgcmQsIDB4ZmYsIGN0eCk7Cj4gKwkJZW1pdF9hZGQoUlZfUkVHX1QyLCBS
Vl9SRUdfVDIsIFJWX1JFR19UMSwgY3R4KTsKPiArCQllbWl0X3NsbGkoUlZfUkVHX1QyLCBSVl9S
RUdfVDIsIDgsIGN0eCk7Cj4gKwkJZW1pdF9zcmxpKHJkLCByZCwgOCwgY3R4KTsKPiArCQlpZiAo
aW1tID09IDE2KQo+ICsJCQlnb3RvIG91dF9iZTsKPiArCj4gKwkJZW1pdF9hbmRpKFJWX1JFR19U
MSwgcmQsIDB4ZmYsIGN0eCk7Cj4gKwkJZW1pdF9hZGQoUlZfUkVHX1QyLCBSVl9SRUdfVDIsIFJW
X1JFR19UMSwgY3R4KTsKPiArCQllbWl0X3NsbGkoUlZfUkVHX1QyLCBSVl9SRUdfVDIsIDgsIGN0
eCk7Cj4gKwkJZW1pdF9zcmxpKHJkLCByZCwgOCwgY3R4KTsKPiArCj4gKwkJZW1pdF9hbmRpKFJW
X1JFR19UMSwgcmQsIDB4ZmYsIGN0eCk7Cj4gKwkJZW1pdF9hZGQoUlZfUkVHX1QyLCBSVl9SRUdf
VDIsIFJWX1JFR19UMSwgY3R4KTsKPiArCQllbWl0X3NsbGkoUlZfUkVHX1QyLCBSVl9SRUdfVDIs
IDgsIGN0eCk7Cj4gKwkJZW1pdF9zcmxpKHJkLCByZCwgOCwgY3R4KTsKPiArCQlpZiAoaW1tID09
IDMyKQo+ICsJCQlnb3RvIG91dF9iZTsKPiArCj4gKwkJZW1pdF9hbmRpKFJWX1JFR19UMSwgcmQs
IDB4ZmYsIGN0eCk7Cj4gKwkJZW1pdF9hZGQoUlZfUkVHX1QyLCBSVl9SRUdfVDIsIFJWX1JFR19U
MSwgY3R4KTsKPiArCQllbWl0X3NsbGkoUlZfUkVHX1QyLCBSVl9SRUdfVDIsIDgsIGN0eCk7Cj4g
KwkJZW1pdF9zcmxpKHJkLCByZCwgOCwgY3R4KTsKPiArCj4gKwkJZW1pdF9hbmRpKFJWX1JFR19U
MSwgcmQsIDB4ZmYsIGN0eCk7Cj4gKwkJZW1pdF9hZGQoUlZfUkVHX1QyLCBSVl9SRUdfVDIsIFJW
X1JFR19UMSwgY3R4KTsKPiArCQllbWl0X3NsbGkoUlZfUkVHX1QyLCBSVl9SRUdfVDIsIDgsIGN0
eCk7Cj4gKwkJZW1pdF9zcmxpKHJkLCByZCwgOCwgY3R4KTsKPiArCj4gKwkJZW1pdF9hbmRpKFJW
X1JFR19UMSwgcmQsIDB4ZmYsIGN0eCk7Cj4gKwkJZW1pdF9hZGQoUlZfUkVHX1QyLCBSVl9SRUdf
VDIsIFJWX1JFR19UMSwgY3R4KTsKPiArCQllbWl0X3NsbGkoUlZfUkVHX1QyLCBSVl9SRUdfVDIs
IDgsIGN0eCk7Cj4gKwkJZW1pdF9zcmxpKHJkLCByZCwgOCwgY3R4KTsKPiArCj4gKwkJZW1pdF9h
bmRpKFJWX1JFR19UMSwgcmQsIDB4ZmYsIGN0eCk7Cj4gKwkJZW1pdF9hZGQoUlZfUkVHX1QyLCBS
Vl9SRUdfVDIsIFJWX1JFR19UMSwgY3R4KTsKPiArCQllbWl0X3NsbGkoUlZfUkVHX1QyLCBSVl9S
RUdfVDIsIDgsIGN0eCk7Cj4gKwkJZW1pdF9zcmxpKHJkLCByZCwgOCwgY3R4KTsKPiArb3V0X2Jl
Ogo+ICsJCWVtaXRfYW5kaShSVl9SRUdfVDEsIHJkLCAweGZmLCBjdHgpOwo+ICsJCWVtaXRfYWRk
KFJWX1JFR19UMiwgUlZfUkVHX1QyLCBSVl9SRUdfVDEsIGN0eCk7Cj4gKwo+ICsJCWVtaXRfbXYo
cmQsIFJWX1JFR19UMiwgY3R4KTsKPiArCX0KPiArfQoKRGVmaW5pdGVseSBlYXJseS1leGl0IGZv
ciB0aGlzIG9uZSEKClRoaXMgZnVuY3Rpb24gcmVhbGx5IHNob3ctY2FzZXMgd2h5IFpCQiBpcyBu
aWNlISA7LSkKCkknbGwgdGFrZSB0aGUgbmV4dCByZXYgb2Ygc2VyaWVzIGZvciBhIHRlc3QhCgoK
QmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
