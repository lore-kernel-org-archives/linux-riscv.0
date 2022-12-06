Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B95C352A1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 07:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KjFBxDhynaxf7yKg5hU4FMFayiuCzIu8SICA6kI08M=; b=PkLKT4YkZwWefK
	Flr3ZTPKJ9U7h1uYzRNjk+xkyjGkx30IiyPbqkIYbGs/f+uDdAWRxgGJX0XOBf+pOv9i6Hb07WhYT
	Qtx7h8olQqYXsSGyyWWAYgV3neWtjYee9H9k6FXeUf0QGdbwPRfchjDZCRDQOTfhRA9Oc2nOtYdfp
	ExGYLJkYZPO/JwWt67OIXUIE2qo4KM6s0E+sjwfy8ei8hLGo1KMz0k3HPkO7z8rx96bvvOKx9hAZ+
	gIXaIsZ6x2cx+kLVIBN26W2ei28yJVXlmU1Ht2bdfi2v8ToVJU0f5YzLog0rG2aNfoocLfZeGW/Yk
	yzN2UHq8AXg5RqSXTZ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Snt-0049tU-GT; Tue, 06 Dec 2022 07:55:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Snq-0049lm-L3
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 07:55:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F341661596;
	Tue,  6 Dec 2022 07:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D69C433C1;
	Tue,  6 Dec 2022 07:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670313345;
	bh=Ws+/WeLvxVRVftbMkKZ45KNmqftKhEp+4sJrpNSl7W8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Akt6EXK463zbJVk8vj7pqEFLR0sdb/4Yob2ZKUli/56Vf/35f9UzxgX2xjFgkpDZX
	 KNSo4q9Ngdo3c4XuIU9VXbXERskeiNCubROjs2lmFvd6+qu0oY75x3gni7p+dGu+mW
	 J/WiEknNLgmLlmUFLIWy7MqhjimYk0Qeahju301o0jy1+BJ+aBjQN7/F+TfVB2vCOH
	 cCPw/3+/1K64HF3622QTf6ZOd2pndNYBBQmSoUuS9QSHDMKbNc2x+Pxx4vnb+IfcHL
	 quPT49Mx1L/W8GXWfpkEge3Ng9ROmFZinxeLlCLdcQkBRy+mlqHv+F4WKFA19t+qzL
	 wmG4Hn25bz1ww==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf v2] riscv, bpf: Emit fixed-length instructions for
 BPF_PSEUDO_FUNC
In-Reply-To: <0ade59ea-6863-4d68-607c-22e4b9405a0d@huaweicloud.com>
References: <20221202094837.3872444-1-pulehui@huaweicloud.com>
 <87y1rq848x.fsf@all.your.base.are.belong.to.us>
 <0ade59ea-6863-4d68-607c-22e4b9405a0d@huaweicloud.com>
Date: Tue, 06 Dec 2022 08:55:42 +0100
Message-ID: <87359t3r0h.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_235546_782930_AC59C63D 
X-CRM114-Status: GOOD (  21.79  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IFNvcnJ5IGZvciBy
ZXBseWluZyBzbyBsYXRlLiBGb3IgQlBGX1BTRVVET19GVU5DIGluc3RydWN0aW9uLCB2ZXJpZmll
ciAKPiB3aWxsIHNldCBpbnNuWzBdLmltbSBhbmQgaW5zblsxXS5pbW0gdG8gMSB0aGF0IG1ha2Ug
YWRkciB0byAweDEwMDAwMDAwMSAKPiBiZWZvcmUgZXh0cmEgcGFzcywgYW5kIGFsc28gY3R4LT5p
bnNucyBpcyBOVUxMIGluIGl0ZXJhdGlvbiBzdGFnZSwgYWxsIAo+IG9mIHRoZXNlIG1ha2Ugb2Zm
IG91dCBvZiByYW5nZSBvZiBBVUlQQy1BRERJIHJhbmdlLCBhbmQgcmV0dXJuIGZhaWxlZC4gCj4g
V2UgY291bGQgYWRkIHNvbWUgc3BlY2lhbCBoYW5kbGluZyBhdCBkaWZmZXJlbnQgc3RhZ2VzLCBi
dXQgdGhhdCBzZWVtcyBhIAo+IGxpdHRsZSB3ZWlyZC4gQnkgdGhlIHdheSwgSSBkbyBub3QgcmVh
bGx5IGxpa2UgZW1pdF9hZGRyIGZ1bmN0aW9uIHdpdGggCj4gcmV0dXJuIHZhbHVlLgoKTXkgcmF0
aW9uYWwgaXMgdGhhdCAqaWYqIGZvciBzb21lIHJlYXNvbiB0aGUgaml0IGlzIHBhc3NlZCBhbiBh
ZGRyZXNzCnRoYXQgYXVpcGMvYWRkaSBjYW4ndCByZXByZXNlbnQsIHdlJ2QgbGlrZSB0byBjYXRj
aCB0aGF0IGFuZCBub3QgZW1pdApicm9rZW4gY29kZS4KCj4gV2hpbGUgYSBwcm9wZXIgYWRkcmVz
cyBpcyBhdCBsZWFzdCAyQiBhbGlnbm1lbnQsIGFuZCB0aGUgdmFsaWQgYWRkcmVzcyAKPiBpcyBm
cm9tIDB4ZmZmZmZmZmYwMDAwMDAwMCB0byAweGZmZmZmZmZmZmZmZmZmZmYsIHdlIGNhbiBtYWtl
IGFkZHJlc3MgCj4gc2hpZmVkIDEgcGxhY2UgdG8gcmlnaHQsIGFuZCBhZGRyID4+IDEgd2lsbCBh
bHdheXMgaW4gdGhlIHJhbmdlIG9mIAo+IEFVSVBDLUFEREkgcmFuZ2UuIFdlIGNhbiBnZXQgcmlk
IG9mIHRoZSByYW5nZSBkZXRlY3Rpb24uIFRoZSAKPiBpbXBsZW1lbnRhdGlvbiBpcyBhcyBmb2xs
b3dzOgo+Cj4gc3RhdGljIHZvaWQgZW1pdF9hZGRyKHU4IHJkLCB1NjQgYWRkciwgc3RydWN0IHJ2
X2ppdF9jb250ZXh0ICpjdHgpCj4gewo+ICAgICAgICAgICBzNjQgaW1tID0gYWRkciA+PiAxOwo+
ICAgICAgICAgICBzNjQgdXBwZXIgPSAoaW1tICsgKDEgPDwgMTEpKSA+PiAxMjsKPiAgICAgICAg
ICAgczY0IGxvd2VyID0gaW1tICYgMHhmZmY7Cj4KPiAgICAgICAgICAgZW1pdChydl9sdWkocmQs
IHVwcGVyKSwgY3R4KTsKPiAgICAgICAgICAgZW1pdChydl9hZGRpKHJkLCByZCwgbG93ZXIpLCBj
dHgpOwo+ICAgICAgICAgICBlbWl0KHJ2X3NsbGkocmQsIHJkLCAxKSwgY3R4KTsKPiB9Cj4KPiBX
aGF0IGRvIHlvdSB0aGluaz8KClRoYXQncyBhIGNvZGUgZ2VuZXJhdGlvbiBwZW5hbHR5LCBpbnN0
ZWFkIG9mIGNhdGNoaW5nIGl0IGF0IGNvZGUKZ2VuLiBEb24ndCBsaWtlISA6LSkgSSBtdWNoIHBy
ZWZlciB0aGUgYXVpcGMvYWRkaSB2ZXJzaW9uLgoKV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhl
IGRpZmYgKG9uLXRvcCBvZiB5b3VyIHdvcmspIGJlbG93PwoKLS04PC0tCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9j
b21wNjQuYwppbmRleCBhYTk0MTBlZWY3N2MuLjdhY2FmMjhjYjNiZSAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYworKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0
X2NvbXA2NC5jCkBAIC0xMzcsMTUgKzEzNywyMSBAQCBzdGF0aWMgYm9vbCBpbl9hdWlwY19qYWxy
X3JhbmdlKHM2NCB2YWwpCiB9CiAKIC8qIEVtaXQgZml4ZWQtbGVuZ3RoIGluc3RydWN0aW9ucyBm
b3IgYWRkcmVzcyAqLwotc3RhdGljIHZvaWQgZW1pdF9hZGRyKHU4IHJkLCB1NjQgYWRkciwgc3Ry
dWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCitzdGF0aWMgaW50IGVtaXRfYWRkcih1OCByZCwgdTY0
IGFkZHIsIGJvb2wgZXh0cmFfcGFzcywgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCiB7CiAJ
dTY0IGlwID0gKHU2NCkoY3R4LT5pbnNucyArIGN0eC0+bmluc25zKTsKIAlzNjQgb2ZmID0gYWRk
ciAtIGlwOwogCXM2NCB1cHBlciA9IChvZmYgKyAoMSA8PCAxMSkpID4+IDEyOwogCXM2NCBsb3dl
ciA9ICgob2ZmICYgMHhmZmYpIDw8IDUyKSA+PiA1MjsKIAorCWlmIChleHRyYV9wYXNzICYmICFp
bl9hdWlwY19qYWxyX3JhbmdlKG9mZikpIHsKKwkJcHJfZXJyKCJicGYtaml0OiB0YXJnZXQgb2Zm
c2V0IDB4JWxseCBpcyBvdXQgb2YgcmFuZ2VcbiIsIG9mZik7CisJCXJldHVybiAtRVJBTkdFOwor
CX0KKwogCWVtaXQocnZfYXVpcGMocmQsIHVwcGVyKSwgY3R4KTsKIAllbWl0KHJ2X2FkZGkocmQs
IHJkLCBsb3dlciksIGN0eCk7CisJcmV0dXJuIDA7CiB9CiAKIC8qIEVtaXQgdmFyaWFibGUtbGVu
Z3RoIGluc3RydWN0aW9ucyBmb3IgMzItYml0IGFuZCA2NC1iaXQgaW1tICovCkBAIC0xMDYxLDEz
ICsxMDY3LDE3IEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25zdCBzdHJ1Y3QgYnBmX2luc24g
Kmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAogCXsKIAkJc3RydWN0IGJwZl9pbnNu
IGluc24xID0gaW5zblsxXTsKIAkJdTY0IGltbTY0OworCQlpbnQgcmV0OwogCiAJCWltbTY0ID0g
KHU2NClpbnNuMS5pbW0gPDwgMzIgfCAodTMyKWltbTsKLQkJaWYgKGJwZl9wc2V1ZG9fZnVuYyhp
bnNuKSkKKwkJaWYgKGJwZl9wc2V1ZG9fZnVuYyhpbnNuKSkgewogCQkJLyogZml4ZWQtbGVuZ3Ro
IGluc25zIGZvciBleHRyYSBqaXQgcGFzcyAqLwotCQkJZW1pdF9hZGRyKHJkLCBpbW02NCwgY3R4
KTsKLQkJZWxzZQorCQkJcmV0ID0gZW1pdF9hZGRyKHJkLCBpbW02NCwgZXh0cmFfcGFzcywgY3R4
KTsKKwkJCWlmIChyZXQpCisJCQkJcmV0dXJuIHJldDsKKwkJfSBlbHNlIHsKIAkJCWVtaXRfaW1t
KHJkLCBpbW02NCwgY3R4KTsKKwkJfQogCiAJCXJldHVybiAxOwogCX0KCi0tODwtLQoKV291bGRu
J3QgdGhhdCB3b3JrPwoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
