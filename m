Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF9EEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 15:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1WW5pXVWhJKzyTGz7NilgBI+kWPjN2tyaIODHzxL1ag=; b=sAUQyKnJV8+2H3
	r438MvoJBIVnf9mS2RjJYg9zc0JpqMUr1gkAGhDx/jLJOrx9TtE8EuWpvJ9Vmo/7z5CHMzqORCrUW
	XMRP0CitZKaUV+25dY0Bf7Ebs4tAvYP9bqmekdKixyku68TJbpIctDF8aSNUKqRri66JeyErMy2fV
	nObscXzcYrFpu4VSbe+T1WEbVtk2y/9oqV2khZmgTFHLuRphLtHFAe+32kxV/bvI/joG3Ihv73Rzr
	Cicpy+4mJoyDc7P4l4lPMgm5T8Yj5jzeBa/Ve70mnr1ydYrgRBKqwPxIwbp/aOjFcyCt7VbyzrDAB
	UEGsJoaBXgyx4YA/JYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8wR-007tzY-2s;
	Wed, 19 Jul 2023 15:18:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8wO-007tyT-2D
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 15:18:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A27F616FD;
	Wed, 19 Jul 2023 15:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C11C433C8;
	Wed, 19 Jul 2023 15:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689779890;
	bh=yRNGM7k1m44UGiSOAxGAbNASoCiFYC+UXo3gbDSSuDI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QwLsB+j6V0YIEGRkP2tox2mqqdk3mE2QCURMU/CVETBBJwN3oyIYtmxOUetSAkF40
	 /RS+ApBqn8DYnYau+OosPfhhGaQMbCAqoV5muR0AMrG9m+67v0S5YqjDvIP571n7Is
	 S92IT+ZnwZqdluFH+xPI4Wr2hvcqWHvhKgaiZUKny/P+2/eLfZk1Mzh8CRyxAK7EYT
	 fyLyR+rYYBa/ZAa1yU3cVuD70VfIUN5JeWYJbpaThX0BbafGKTmiTbyEf+MqjwwtiR
	 k0moGCANuw6dLL87/X8pt6mSGmBYUtp11ymCqAwOr2KXeND2V4L25mEuAKblIZUGeY
	 a9IrYQfBI7DsQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huawei.com>, Pu Lehui <pulehui@huaweicloud.com>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>, Song Shuai
 <suagrfillet@gmail.com>
Subject: Re: [PATCH bpf] riscv, bpf: Adapt bpf trampoline to optimized riscv
 ftrace framework
In-Reply-To: <63986ef9-10a4-bcef-369d-0bad28b192d1@huawei.com>
References: <20230715090137.2141358-1-pulehui@huaweicloud.com>
 <87lefdougi.fsf@all.your.base.are.belong.to.us>
 <63986ef9-10a4-bcef-369d-0bad28b192d1@huawei.com>
Date: Wed, 19 Jul 2023 17:18:08 +0200
Message-ID: <87o7k8udzj.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_081812_832843_547E5467 
X-CRM114-Status: GOOD (  24.96  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4gd3JpdGVzOgoKPiBPbiAyMDIzLzcvMTkgNDow
NiwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQu
Y29tPiB3cml0ZXM6Cj4+IAo+Pj4gRnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4K
Pj4+Cj4+PiBDb21taXQgNjcyNGE3NmNmZjg1ICgicmlzY3Y6IGZ0cmFjZTogUmVkdWNlIHRoZSBk
ZXRvdXIgY29kZSBzaXplIHRvCj4+PiBoYWxmIikgb3B0aW1pemVzIHRoZSBkZXRvdXIgY29kZSBz
aXplIG9mIGtlcm5lbCBmdW5jdGlvbnMgdG8gaGFsZiB3aXRoCj4+PiBUMCByZWdpc3RlciBhbmQg
dGhlIHVwY29taW5nIERZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExTIG9mIHJpc2N2Cj4+
PiBpcyBiYXNlZCBvbiB0aGlzIG9wdGltaXphdGlvbiwgd2UgbmVlZCB0byBhZGFwdCByaXNjdiBi
cGYgdHJhbXBvbGluZQo+Pj4gYmFzZWQgb24gdGhpcy4gT25lIHRoaW5nIHRvIGRvIGlzIHRvIHJl
ZHVjZSBkZXRvdXIgY29kZSBzaXplIG9mIGJwZgo+Pj4gcHJvZ3JhbXMsIGFuZCB0aGUgc2Vjb25k
IGlzIHRvIGRlYWwgd2l0aCB0aGUgcmV0dXJuIGFkZHJlc3MgYWZ0ZXIgdGhlCj4+PiBleGVjdXRp
b24gb2YgYnBmIHRyYW1wb2xpbmUuIE1lYW53aGlsZSwgYWRkIG1vcmUgY29tbWVudHMgYW5kIHJl
bmFtZQo+Pj4gc29tZSB2YXJpYWJsZXMgdG8gbWFrZSBtb3JlIHNlbnNlLiBUaGUgcmVsYXRlZCB0
ZXN0cyBoYXZlIHBhc3NlZC4KPj4+Cj4+PiBUaGlzIGFkYXB0YXRpb24gbmVlZHMgdG8gYmUgbWVy
Z2VkIGJlZm9yZSB0aGUgdXBjb21pbmcKPj4+IERZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NB
TExTIG9mIHJpc2N2LCBvdGhlcndpc2UgaXQgd2lsbCBjcmFzaCBkdWUKPj4+IHRvIGEgbWlzbWF0
Y2ggaW4gdGhlIHJldHVybiBhZGRyZXNzLiBTbyB3ZSB0YXJnZXQgdGhpcyBtb2RpZmljYXRpb24g
dG8KPj4+IGJwZiB0cmVlIGFuZCBhZGQgZml4ZXMgdGFnIGZvciBsb2NhdGluZy4KPj4gCj4+IFRo
YW5rIHlvdSBmb3Igd29ya2luZyBvbiB0aGlzIQo+PiAKPj4+IEZpeGVzOiA2NzI0YTc2Y2ZmODUg
KCJyaXNjdjogZnRyYWNlOiBSZWR1Y2UgdGhlIGRldG91ciBjb2RlIHNpemUgdG8gaGFsZiIpCj4+
IAo+PiBUaGlzIGlzIG5vdCBhIGZpeC4gTm90aGluZyBpcyBicm9rZW4uIE9ubHkgdGhhdCB0aGlz
IHBhdGNoIG11Y2ggY29tZQo+PiBiZWZvcmUgb3IgYXMgcGFydCBvZiB0aGUgZnRyYWNlIHNlcmll
cy4KPgo+IFllcCwgaXQncyByZWFsbHkgbm90IGEgZml4LiBJIGhhdmUgbm8gaWRlYSB3aGV0aGVy
IHRoaXMgcGF0Y2ggdGFyZ2V0IHRvIAo+IGJwZi1uZXh0IHRyZWUgY2FuIGJlIGFoZWFkIG9mIHRo
ZSBmdHJhY2Ugc2VyaWVzIG9mIHJpc2N2IHRyZWU/CgpGb3IgdGhpcyBwYXRjaCwgSSdkIHNheSBp
dCdzIGVhc2llciB0byB0YWtlIGl0IHZpYSB0aGUgUklTQy1WIHRyZWUsIElGRgp0aGUgZnRyYWNl
IHNlcmllcyBpcyBpbiBmb3ItbmV4dC4KClsuLi5dCgo+Pj4gKyNkZWZpbmUgREVUT1VSX05JTlNO
UwkyCj4+IAo+PiBCZXR0ZXIgbmFtZT8gTWF5YmUgY2FsbCB0aGlzIHBhdGNoYWJsZSBmdW5jdGlv
biBlbnRyeSBzb21ldGhpbmc/IEFsc28sCj4KPiBIb3cgYWJvdXQgUlZfRkVOVFJZX05JTlNOUz8K
ClN1cmUuIEFuZCBtb3JlIGltcG9ydGFudGx5IHRoYXQgaXQncyBhY3R1YWxseSB1c2VkIGluIHRo
ZSBwbGFjZXMgd2hlcmUKbm9wcy9za2lwcyBhcmUgZG9uZS4KCj4+IHRvIGNhdGNoIGZ1dHVyZSBi
cmVha3MgbGlrZSB0aGlzIC0tIHdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gaGF2ZSBhCj4+IHN0YXRp
Y19hc3NlcnQoKSBjb21iaW5lZCB3aXRoIHNvbWV0aGluZyB0aWVkIHRvCj4+IC1mcGF0Y2hhYmxl
LWZ1bmN0aW9uLWVudHJ5PSBmcm9tIGFyY2gvcmlzY3YvTWFrZWZpbGU/Cj4KPiBJdCBpcyB2ZXJ5
IG5lY2Vzc2FyeSwgYnV0IGl0IGRvZXNuJ3Qgc2VlbSB0byBiZSBlYXN5LiBJIHRyeSB0byBmaW5k
IEdDQyAKPiByZWxhdGVkIGZ1bmN0aW9ucywgc29tZXRoaW5nIGxpa2UgX19idWlsdGluX3h4eCwg
YnV0IEkgY2FuJ3QgZmluZCBpdCBzbyAKPiBmYXIuIEFsc28gdHJ5IHRvIG1ha2UgaXQgYXMgYSBD
T05GSUdfUEFUQ0hBQkxFX0ZVTkNUSU9OX0VOVFJZPTQgaW4gCj4gTWFrZWZpbGUgYW5kIHRoZW4g
c3RhdGljX2Fzc2VydCwgYnV0IG9idmlvdXNseSBpdCBzaG91bGRuJ3QgYmUgZG9uZS4gCj4gTWF5
YmUgd2UgY2FuIGRlYWwgd2l0aCB0aGlzIGxhdGVyIHdoZW4gd2UgaGF2ZSBhIHNvbHV0aW9uPwoK
T2shCgpbLi4uXQoKPj4+IEBAIC03ODcsMjAgKzc2MiwxOSBAQCBzdGF0aWMgaW50IF9fYXJjaF9w
cmVwYXJlX2JwZl90cmFtcG9saW5lKHN0cnVjdCBicGZfdHJhbXBfaW1hZ2UgKmltLAo+Pj4gICAJ
aW50IGksIHJldCwgb2Zmc2V0Owo+Pj4gICAJaW50ICpicmFuY2hlc19vZmYgPSBOVUxMOwo+Pj4g
ICAJaW50IHN0YWNrX3NpemUgPSAwLCBucmVncyA9IG0tPm5yX2FyZ3M7Cj4+PiAtCWludCByZXRh
ZGRyX29mZiwgZnBfb2ZmLCByZXR2YWxfb2ZmLCBhcmdzX29mZjsKPj4+IC0JaW50IG5yZWdzX29m
ZiwgaXBfb2ZmLCBydW5fY3R4X29mZiwgc3JlZ19vZmY7Cj4+PiArCWludCBmcF9vZmYsIHJldHZh
bF9vZmYsIGFyZ3Nfb2ZmLCBucmVnc19vZmYsIGlwX29mZiwgcnVuX2N0eF9vZmYsIHNyZWdfb2Zm
Owo+Pj4gICAJc3RydWN0IGJwZl90cmFtcF9saW5rcyAqZmVudHJ5ID0gJnRsaW5rc1tCUEZfVFJB
TVBfRkVOVFJZXTsKPj4+ICAgCXN0cnVjdCBicGZfdHJhbXBfbGlua3MgKmZleGl0ID0gJnRsaW5r
c1tCUEZfVFJBTVBfRkVYSVRdOwo+Pj4gICAJc3RydWN0IGJwZl90cmFtcF9saW5rcyAqZm1vZF9y
ZXQgPSAmdGxpbmtzW0JQRl9UUkFNUF9NT0RJRllfUkVUVVJOXTsKPj4+ICAgCXZvaWQgKm9yaWdf
Y2FsbCA9IGZ1bmNfYWRkcjsKPj4+IC0JYm9vbCBzYXZlX3JldDsKPj4+ICsJYm9vbCBzYXZlX3Jl
dHZhbCwgdHJhY2VkX3JldDsKPj4+ICAgCXUzMiBpbnNuOwo+Pj4gICAKPj4+ICAgCS8qIEdlbmVy
YXRlZCB0cmFtcG9saW5lIHN0YWNrIGxheW91dDoKPj4+ICAgCSAqCj4+PiAgIAkgKiBGUCAtIDgJ
ICAgIFsgUkEgb2YgcGFyZW50IGZ1bmMJXSByZXR1cm4gYWRkcmVzcyBvZiBwYXJlbnQKPj4+ICAg
CSAqCQkJCQkgIGZ1bmN0aW9uCj4+PiAtCSAqIEZQIC0gcmV0YWRkcl9vZmYgWyBSQSBvZiB0cmFj
ZWQgZnVuYwldIHJldHVybiBhZGRyZXNzIG9mIHRyYWNlZAo+Pj4gKwkgKiBGUCAtIDE2CSAgICBb
IFJBIG9mIHRyYWNlZCBmdW5jCV0gcmV0dXJuIGFkZHJlc3Mgb2YKPj4+ICAgCXRyYWNlZAo+PiAK
Pj4gQlBGIGNvZGUgdXNlcyBmcmFtZSBwb2ludGVycy4gU2hvdWxkbid0IHRoZSB0cmFtcG9saW5l
IGZyYW1lIGxvb2sgbGlrZSBhCj4+IHJlZ3VsYXIgZnJhbWUgWzFdLCBpLmUuIHN0YXJ0IHdpdGgg
cmV0dXJuIGFkZHJlc3MgZm9sbG93ZWQgYnkgcHJldmlvdXMKPj4gZnJhbWUgcG9pbnRlcj8KPj4g
Cj4KPiBvb3BzLCB3aWxsIGZpeCBpdC4gQWxzbyB3ZSBuZWVkIHRvIGNvbnNpZGVyIHR3byB0eXBl
cyBvZiB0cmFtcG9saW5lIAo+IHN0YWNrIGxheW91dCwgdGhhdCBpczoKPgo+ICogMS4gdHJhbXBv
bGluZSBjYWxsZWQgZnJvbSBmdW5jdGlvbiBlbnRyeQo+ICogLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiAqIEZQICsgOCAgICAgICAgICAgWyBSQSBvZiBwYXJlbnQgZnVu
YyBdIHJldHVybiBhZGRyZXNzIG9mIHBhcmVudAo+ICogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZnVuY3Rpb24KPiAqIEZQICsgMCAgICAgICAgICAgWyBGUCAgICAgICAg
ICAgICAgICBdCj4gKgo+ICogRlAgLSA4ICAgICAgICAgICBbIFJBIG9mIHRyYWNlZCBmdW5jIF0g
cmV0dXJuIGFkZHJlc3Mgb2YgdHJhY2VkCj4gKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmdW5jdGlvbgo+ICogRlAgLSAxNiAgICAgICAgICBbIEZQICAgICAgICAgICAg
ICAgIF0KPiAqIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKgo+ICog
Mi4gdHJhbXBvbGluZSBjYWxsZWQgZGlyZWN0bHkKPiAqIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gKiBGUCAtIDggICAgICAgICAgIFsgUkEgb2YgY2FsbGVyIGZ1bmMg
XSByZXR1cm4gYWRkcmVzcyBvZiBjYWxsZXIKPiAqICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGZ1bmN0aW9uCj4gKiBGUCAtIDE2ICAgICAgICAgIFsgRlAgICAgICAgICAg
ICAgICAgXQo+ICogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCkhtbSwg
Y291bGQgeW91IGV4cGFuZCBhIGJpdCBvbiB0aGlzPyBUaGUgc3RhY2sgZnJhbWUgdG9wIDE2QiAo
OCs4KQpzaG91bGQgZm9sbG93IHdoYXQgdGhlIHBzYWJpIHN1Z2dlc3RzLCByZWdhcmRsZXNzIG9m
IHRoZSBjYWxsIHNpdGU/CgpNYXliZSBpdCdzIG1lIHRoYXQncyBub3QgZm9sbG93aW5nIC0tIHBs
ZWFzZSBleHBsYWluIGEgYml0IG1vcmUhCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
