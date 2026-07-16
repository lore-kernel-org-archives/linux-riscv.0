Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4739C44501
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 08:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPkEJZwTDTLuK3mWdmGzxm98nzCyJzf1ToZUoq/BWzM=; b=YrSfZUIr3xO//l
	LYMHXVDqxjSwXu4vbxnXsgsbUm65fqstUoNANKQz0Fsx05/tpeVw019Ph2O8xpFTh7TzM7jNwspLT
	8SutBiS4XogSyjkUthy5QnVRctu4ww6ygyjzCefSreWAEOJ/b2oGK9pjG6BvL0s5Zrd0B1kIq2iob
	dKfVvQV2K/cuKteEfKEUSCJY3fMKAbXvr+j4MxzYMEFUbzSoWTIl0uerq/OA4kmOyXZ4oG++pKuzG
	BeWGG0aJFidPkpxagd+yv3Ij2dowyxVx6+WrGv5dhJYJ/UaOe4OT6IISXEQfo9siWvsuAFlRn4Jdc
	HbgZeXJFCLx7th/s9lJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkH8Y-0000000GiIL-0oFU;
	Thu, 16 Jul 2026 08:08:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkH8X-0000000GiIB-3Sl0
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 08:08:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EF97160054;
	Thu, 16 Jul 2026 08:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BF21F000E9;
	Thu, 16 Jul 2026 08:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784189284;
	bh=j19L2Iuj7nf3YuWOyNn/pNo1TKaAQ7yjwz7bZzfQ9ac=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=niXas0v57O5WQpY58b8mKCqlJ7dbVaCI3Py6WSwSc5gkHVGbCUZW5oEqoxbknAWHh
	 0K7n5HnWYxU7xKHbQoDNR7A/pb0GYJ5Wn/4PbKDefCuurGySZCvYN20SZz+73QBbXU
	 YGAlK1zTHlhloyHXzdMAvOjukVO9sH09lkjN8cPQYS2DzN7pFA3hr8L4nAYERwVArN
	 ltqtZFRxPn1ILi/evJYOL9SdeUocw00/7ejmW4Xqd1+GfNlSlkmYQV/7z/5XytHMU0
	 /+2IVy8RA3Mx7uMrnEbUumAK0Yh5NXFg9yzz2ChGfRRvyfFwnIo0opZZORFnmYVOZq
	 ZlXJx9AqHnmOg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song
 Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Luke Nelson
 <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Pu Lehui
 <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan
 <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Feng Jiang
 <jiangfeng@kylinos.cn>
Subject: Re: [PATCH v3 1/2] bpf, riscv: add support for timed may_goto
In-Reply-To: <20260715-riscv-bpf-timed-may-goto-v3-1-cf2a9c3d843f@kylinos.cn>
References: <20260715-riscv-bpf-timed-may-goto-v3-0-cf2a9c3d843f@kylinos.cn>
 <20260715-riscv-bpf-timed-may-goto-v3-1-cf2a9c3d843f@kylinos.cn>
Date: Thu, 16 Jul 2026 10:08:01 +0200
Message-ID: <8733xjwe5a.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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

RmVuZyBKaWFuZyA8amlhbmdmZW5nQGt5bGlub3MuY24+IHdyaXRlczoKCj4gSW1wbGVtZW50IGFy
Y2hfYnBmX3RpbWVkX21heV9nb3RvKCkgZm9yIHRoZSBSVjY0IEpJVC4gVGhlIGFyZ3VtZW50IGFu
ZAo+IHJldHVybiB2YWx1ZSBhcmUgY2FycmllZCBpbiBCUEZfUkVHX0FYLCBhbmQgQlBGIFIwLVI1
IGFyZSBwcmVzZXJ2ZWQKPiBhY3Jvc3MgdGhlIGNhbGwgdG8gdGhlIGdlbmVyaWMgYnBmX2NoZWNr
X3RpbWVkX21heV9nb3RvKCkuCj4KPiBFbmFibGUgYnBmX2ppdF9zdXBwb3J0c190aW1lZF9tYXlf
Z290bygpIHNvIHRoZSB2ZXJpZmllciB1c2VzIHRoZSB0aW1lZAo+IGV4cGFuc2lvbiBwYXRoLgoK
VGhhbmtzIGZvciB3b3JraW5nIG9uIHRoaXMhCgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25l
dC9icGZfaml0X2NvbXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+IGlu
ZGV4IGMwM2MxZGUxNmI3OS4uNGY4OGE0NDYyNzhhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
bmV0L2JwZl9qaXRfY29tcDY0LmMKPiArKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2
NC5jCj4gQEAgLTE4NDEsNyArMTg0MSwxMyBAQCBpbnQgYnBmX2ppdF9lbWl0X2luc24oY29uc3Qg
c3RydWN0IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwKPiAgCQlp
ZiAocmV0KQo+ICAJCQlyZXR1cm4gcmV0Owo+ICAKPiAtCQlpZiAoaW5zbi0+c3JjX3JlZyAhPSBC
UEZfUFNFVURPX0NBTEwpCj4gKwkJLyoKPiArCQkgKiBhcmNoX2JwZl90aW1lZF9tYXlfZ290bygp
IGlzIGVtaXR0ZWQgYnkgdGhlIHZlcmlmaWVyIGFuZAo+ICsJCSAqIHJldHVybnMgaXRzIHJlc3Vs
dCBpbiBCUEZfUkVHX0FYIGluc3RlYWQgb2YgQlBGX1JFR18wLCBzbwo+ICsJCSAqIHNraXAgdGhl
IG5vcm1hbCAibW92ZSByZXR1cm4gcmVnaXN0ZXIgaW50byBSMCIuCj4gKwkJICovCj4gKwkJaWYg
KGluc24tPnNyY19yZWcgIT0gQlBGX1BTRVVET19DQUxMICYmCj4gKwkJICAgIGFkZHIgIT0gKHU2
NClhcmNoX2JwZl90aW1lZF9tYXlfZ290bykKCk5pdDogSW4gdGhlIGZ1dHVyZSwgcGxlYXNlIHVz
ZSBmdWxsIDEwMCBjaGFycyBsaW5lcywgaW5zdGVhZCBvZiBicmVha2luZwp0aGUgbGluZS4KCldv
dWxkIGl0IGJlIHBvc3NpYmxlIHRvIGFkZCBhIHRlc3QgZm9yIHRoaXMgY3VzdG9tIEFCST8gVGhl
IGZhY3QgdGhhdCBpdAp3YXMgbWlzc2VkIGluIHYxIGhpbnRzIHRoYXQgaXQgd291bGQgYmUgZ29v
ZC4KCkkgYXNrZWQgYW4gTExNIHRvIHN1Z2dlc3QgYSB0ZXN0IFsxXS4gRmVlbCBmcmVlIHRvIGJl
IGluc3BpcmVkIGJ5IGl0Lgo7LSkKCgpCasO2cm4KClsxXSBodHRwczovL3Bhc3RlLmRlYmlhbi5u
ZXQvaGlkZGVuLzlkZDc2OWQ2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
