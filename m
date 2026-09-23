Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F4FC98304
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 14:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xw+v7ZEc4/ybVSIUgE+PJHUpMXKkqVHXA+9g5mNz1fk=; b=IJsUvXlVwQK5Ui
	3FGIBs6CqvMOc0SmwBm4MKg7ZbTOQs/Zh/vfqFGAQogkipKsac0xtmCwIvUzr0kA9Cp+tDFcBV9N3
	jsB7QKBMXrjbi/jn9DWuDkbhOTXsQ6qCr473X+NA0LbzdWUn6gpB6UziosrTdEWNUT5JH8DX3RdYo
	fqP4e+kkmg863Eicr+7De0zVn8xKu4l99cEEv39HUBSfLdTsTPZzJx8E/H2+9XH+3gSXomOaZEmx2
	2U4aRmg/x6TEunoWhDJnrjQaiCjtf2g6Sktn54TlUxQcTAalcG09qaoSLCULJaxQBUUWrEoSkeuGm
	23Hjq1Tl1Fna8uEXi4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OBE-00000008ZJg-2FSp;
	Wed, 23 Sep 2026 14:42:40 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OBA-00000008ZH6-3YqQ
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 14:42:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=X2Z8+iw+Qf9IbHL3sN6Im6/BxTzJRdFnEh+g1tCkdWg=;
	b=yTPORjqb+XbCWgPE9G/GsAlmwLahdxpMYfzPsdyNbGQ1vWBlj2owPy3lBZw5XQxhTNselH8ZX
	If06OzshV6hD661IeNC3iLf3tuz2yWLI0rIJZzHcai6pMav6KJVFsIMxRurif8EfupS0SkzuB3e
	mqSv3hHgbS2qQ13vLztDdFc=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hqfWf26HbzpStW;
	Wed, 23 Sep 2026 22:30:22 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id A3B004056D;
	Wed, 23 Sep 2026 22:42:20 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 22:42:19 +0800
Message-ID: <c7eceba4-fd29-4c80-9829-3948708b826f@huawei.com>
Date: Wed, 23 Sep 2026 22:42:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next] riscv, bpf: Fix missing sign-ext for signed
 1-byte and 2-byte kfunc args
Content-Language: en-US
To: Pu Lehui <pulehui@huaweicloud.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	<andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	<song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
	<jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai
	<ihor.solodrai@linux.dev>, Puranjay Mohan <puranjay@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre
 Ghiti <alex@ghiti.fr>
References: <20260923144154.934674-1-pulehui@huaweicloud.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260923144154.934674-1-pulehui@huaweicloud.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_074237_491861_26E95EAC 
X-CRM114-Status: GOOD (  14.53  )
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

ClNvcnJ5IGZvciB0aGUgbm9pc2UuIFRoYXQgd2FzIGFuIGFjY2lkZW50YWwgc2VuZOKAlHRoaXMg
cGF0Y2ggaGFzIGFscmVhZHkgCmJlZW4gbWVyZ2VkLgoKT24gMjAyNi85LzIzIDIyOjQxLCBQdSBM
ZWh1aSB3cm90ZToKPiBGcm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+IAo+IE9u
IFJWNjQsIHRoZSBBQkkgcmVxdWlyZXMgc2lnbi1leHRlbnNpb24gZm9yIHNpZ25lZCAxLWJ5dGUg
YW5kIDItYnl0ZQo+IGtmdW5jIGFyZ3MuIEhvd2V2ZXIsIHRoZSBSVjY0IEpJVCBjdXJyZW50bHkg
ZG9lcyBub3QgcGVyZm9ybQo+IHNpZ24tZXh0ZW5zaW9uIGZvciBzdWNoIGtmdW5jIGFyZ3MuCj4g
Cj4gQmVmb3JlIGNvbW1pdCA3Y2UwOTBhZmJmNzIgKCJicGY6IEluZmVyIHpleHRfZHN0IGJhc2Vk
IG9uIHN0YXRpYwo+IHJlZ2lzdGVyIGxpdmVuZXNzIGFuYWx5c2lzIiksIHN0YXRlIHBydW5pbmcg
Y291bGQgcG90ZW50aWFsbHkgb21pdAo+IHplcm8tZXh0ZW5zaW9uIG9mIDMyLWJpdCBzdWJyZWdp
c3RlcnMsIHdoaWNoIGluYWR2ZXJ0ZW50bHkgbWFza2VkIHRoZQo+IGFib3ZlIGlzc3VlIGJ5IG1h
a2luZyB0aGUgYXJncyBhcHBlYXIgYXMgaWYgdGhleSBoYWQgYmVlbiBwcm9wZXJseQo+IHNpZ24t
ZXh0ZW5kZWQuIEFmdGVyIHRoYXQgY29tbWl0LCB0aGUgcHJvYmxlbSBpcyBleHBvc2VkLCBjYXVz
aW5nIHRoZQo+IGtmdW5jX2NhbGwva2Z1bmNfY2FsbF90ZXN0NCBzZWxmdGVzdCB0byBmYWlsLgo+
IAo+IEZpeCB0aGlzIGJ5IGV4dGVuZGluZyB0aGUgZXhpc3Rpbmcgc2lnbi1leHRlbnNpb24gbG9n
aWMgdG8gaGFuZGxlIHNpZ25lZAo+IDEtYnl0ZSBhbmQgMi1ieXRlIGtmdW5jIGFyZ3MgYXMgd2Vs
bC4KPiAKPiBGaXhlczogNDQzNTc0YjAzMzg3ICgicmlzY3YsIGJwZjogRml4IGtmdW5jIHBhcmFt
ZXRlcnMgaW5jb21wYXRpYmlsaXR5IGJldHdlZW4gYnBmIGFuZCByaXNjdiBhYmkiKQo+IFNpZ25l
ZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBhcmNoL3Jp
c2N2L25ldC9icGZfaml0X2NvbXA2NC5jIHwgNSArKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9uZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMK
PiBpbmRleCAyNTA0ZGYxZmExMTEuLjc0ZWZlNGIxMzhkMiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4gKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9j
b21wNjQuYwo+IEBAIC0xODIzLDkgKzE4MjMsMTAgQEAgaW50IGJwZl9qaXRfZW1pdF9pbnNuKGNv
bnN0IHN0cnVjdCBicGZfaW5zbiAqaW5zbiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgsCj4g
ICAKPiAgIAkJCWZvciAoaWR4ID0gMDsgaWR4IDwgZm0tPm5yX2FyZ3M7IGlkeCsrKSB7Cj4gICAJ
CQkJdTggcmVnID0gYnBmX3RvX3J2X3JlZyhCUEZfUkVHXzEgKyBpZHgsIGN0eCk7Cj4gKwkJCQli
b29sIHNpZ24gPSBmbS0+YXJnX2ZsYWdzW2lkeF0gJiBCVEZfRk1PREVMX1NJR05FRF9BUkc7Cj4g
ICAKPiAtCQkJCWlmIChmbS0+YXJnX3NpemVbaWR4XSA9PSBzaXplb2YoaW50KSkKPiAtCQkJCQll
bWl0X3NleHR3KHJlZywgcmVnLCBjdHgpOwo+ICsJCQkJaWYgKHNpZ25fZXh0ZW5kKHJlZywgcmVn
LCBmbS0+YXJnX3NpemVbaWR4XSwgc2lnbiwgY3R4KSkKPiArCQkJCQlyZXR1cm4gLUVJTlZBTDsK
PiAgIAkJCX0KPiAgIAkJfQo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
