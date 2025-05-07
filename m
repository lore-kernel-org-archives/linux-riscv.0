Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AD0C3ABB6
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 06:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wh+ygS7kLkFKi6lTto6OzZanHUSMZWmjOVNWtPpwuNA=; b=1Jk7YllrwNIilp
	eQIznOMvr/3oliNa29GgCbENn8gjw7M1wrGk5IS0H+bYnJBZKlvQOFsXhyuapHCom0l4ZhnRLe5Be
	0pcHuKjFaW5iJOpaTNDVdIoViPEiIS7vH3AVQ3SeDVxjSUHJgspM4oPUAKCqMNqwgRh7qkgSfT1Io
	PVxX5eBqJbrZw5lEUAurWYDwgZnLBBaigBSw7GIUcr0fQKBpp9xavKrEtVlCdCdp6IKTPbXCHr3M/
	WEbzved67gbuoAjoEHc3MfhgN5dUNloH2c/AkGe6dlg8UCD2BDYvEbWRaTuBUbP7WesqH1c6K1vpT
	xCYgzWYZ3Es2MrVK7TvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYbA-0000000EPzU-1rRR;
	Wed, 07 May 2025 06:49:44 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYUL-0000000EPGL-3FWd
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 06:42:43 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Zsly22qhpz1R7kw;
	Wed,  7 May 2025 14:40:26 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 3B20014027A;
	Wed,  7 May 2025 14:42:32 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 7 May 2025 14:42:30 +0800
Message-ID: <3739f76d-ffe3-43b9-99ac-b121f85a2361@huawei.com>
Date: Wed, 7 May 2025 14:42:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 1/8] bpf/verifier: Handle BPF_LOAD_ACQ
 instructions in insn_def_regno()
Content-Language: en-US
To: Peilin Ye <yepeilin@google.com>, <bpf@vger.kernel.org>
CC: <linux-riscv@lists.infradead.org>, Andrea Parri <parri.andrea@gmail.com>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Puranjay Mohan
	<puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mykola Lysenko
	<mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Josh Don
	<joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu
	<neelnatu@google.com>, Benjamin Segall <bsegall@google.com>
References: <cover.1746588351.git.yepeilin@google.com>
 <09cb2aec979aaed9d16db41f0f5b364de39377c0.1746588351.git.yepeilin@google.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <09cb2aec979aaed9d16db41f0f5b364de39377c0.1746588351.git.yepeilin@google.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_234241_963061_51D86077 
X-CRM114-Status: GOOD (  11.84  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDI1LzUvNyAxMTo0MiwgUGVpbGluIFllIHdyb3RlOgo+IEluIHByZXBhcmF0aW9uIGZv
ciBzdXBwb3J0aW5nIEJQRiBsb2FkLWFjcXVpcmUgYW5kIHN0b3JlLXJlbGVhc2UKPiBpbnN0cnVj
dGlvbnMgZm9yIGFyY2hpdGVjdHVyZXMgd2hlcmUgYnBmX2ppdF9uZWVkc196ZXh0KCkgcmV0dXJu
cyB0cnVlCj4gKGUuZy4gcmlzY3Y2NCksIG1ha2UgaW5zbl9kZWZfcmVnbm8oKSBoYW5kbGUgbG9h
ZC1hY3F1aXJlcyBwcm9wZXJseS4KPiAKPiBBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5A
a2VybmVsLm9yZz4KPiBUZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNv
bT4gIyBRRU1VL1JWQTIzCj4gU2lnbmVkLW9mZi1ieTogUGVpbGluIFllIDx5ZXBlaWxpbkBnb29n
bGUuY29tPgo+IC0tLQo+ICAga2VybmVsL2JwZi92ZXJpZmllci5jIHwgMTIgKysrKysrLS0tLS0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9rZXJuZWwvYnBmL3ZlcmlmaWVyLmMgYi9rZXJuZWwvYnBmL3ZlcmlmaWVy
LmMKPiBpbmRleCA5OWFhMmM4OTBlN2IuLjI4ZjVhNzg5OWJkNiAxMDA2NDQKPiAtLS0gYS9rZXJu
ZWwvYnBmL3ZlcmlmaWVyLmMKPiArKysgYi9rZXJuZWwvYnBmL3ZlcmlmaWVyLmMKPiBAQCAtMzY0
OSwxNiArMzY0OSwxNiBAQCBzdGF0aWMgaW50IGluc25fZGVmX3JlZ25vKGNvbnN0IHN0cnVjdCBi
cGZfaW5zbiAqaW5zbikKPiAgIAljYXNlIEJQRl9TVDoKPiAgIAkJcmV0dXJuIC0xOwo+ICAgCWNh
c2UgQlBGX1NUWDoKPiAtCQlpZiAoKEJQRl9NT0RFKGluc24tPmNvZGUpID09IEJQRl9BVE9NSUMg
fHwKPiAtCQkgICAgIEJQRl9NT0RFKGluc24tPmNvZGUpID09IEJQRl9QUk9CRV9BVE9NSUMpICYm
Cj4gLQkJICAgIChpbnNuLT5pbW0gJiBCUEZfRkVUQ0gpKSB7Cj4gKwkJaWYgKEJQRl9NT0RFKGlu
c24tPmNvZGUpID09IEJQRl9BVE9NSUMgfHwKPiArCQkgICAgQlBGX01PREUoaW5zbi0+Y29kZSkg
PT0gQlBGX1BST0JFX0FUT01JQykgewo+ICAgCQkJaWYgKGluc24tPmltbSA9PSBCUEZfQ01QWENI
RykKPiAgIAkJCQlyZXR1cm4gQlBGX1JFR18wOwo+IC0JCQllbHNlCj4gKwkJCWVsc2UgaWYgKGlu
c24tPmltbSA9PSBCUEZfTE9BRF9BQ1EpCj4gKwkJCQlyZXR1cm4gaW5zbi0+ZHN0X3JlZzsKPiAr
CQkJZWxzZSBpZiAoaW5zbi0+aW1tICYgQlBGX0ZFVENIKQo+ICAgCQkJCXJldHVybiBpbnNuLT5z
cmNfcmVnOwo+IC0JCX0gZWxzZSB7Cj4gLQkJCXJldHVybiAtMTsKPiAgIAkJfQo+ICsJCXJldHVy
biAtMTsKPiAgIAlkZWZhdWx0Ogo+ICAgCQlyZXR1cm4gaW5zbi0+ZHN0X3JlZzsKPiAgIAl9Cgps
Z3RtLCB0aGFua3MKUmV2aWV3ZWQtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
