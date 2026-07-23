Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E15AC531CB
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 10:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQMUiDC7JTjSEoeCepXtM3yksUchazw6ltHP41bgjNk=; b=EQLusj1M4g6diI
	nUViT1kN8ndR3qL322byxX1d13RrXZR/zWrb+fRGTR/HJlVqHNNYanxT8YpHu/KuTfjF+rRgl4Afm
	ECjg7ha1enO8STaZOpb+LL8o6lUrIkDrbXeZw6oiRXVSVydhVgzgjGrWwCbHiM9V0Ln4KrGQ0REyY
	IiwGNyO6Ynr0+Tc3luD0VkQZFpk7oTzN8eOnVqXYgDz1wFZ0afu8rgD8jbdKpLEbgIv18KmzmmHrD
	LxFsxCMATTTDrA4zyhlQGNv3ysUHnUXw9WKx98XHBrkMplI/zmEdUfJvcPbyJp5dQkv6IBFyx06EW
	3w4mKt7zbtieIQAkxlEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqO8-0000000DzVK-1i4R;
	Thu, 23 Jul 2026 10:10:48 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqO4-0000000DzSE-16CE
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 10:10:45 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5re4nPlbLEVWPOreOr0zy5dD8ExMrcczNzif8ZTa/es=;
	b=Jiqa3cfrWTvKoXT7hLpR3pWIORx0bu4RUsN+sOJn/TzQn1dtsBCuG5ql7QJXv7/6brGtITNkU
	u8WtkCy3UXrIlyabDei8mPfl0ma11M1DdPaD3b2bVubSvPMaIs3QyexzZI5cDlBpR2aoGsHb+ZO
	/Iflx3PfpYI5LwEggUalpOA=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h5RTg0bbXzKmB5;
	Thu, 23 Jul 2026 18:01:11 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id D93CD402AB;
	Thu, 23 Jul 2026 18:10:36 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 23 Jul
 2026 18:10:35 +0800
Message-ID: <f8768480-9cbb-4807-bd9c-e2eeea6cdbe0@huawei.com>
Date: Thu, 23 Jul 2026 18:10:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v5 2/3] selftests/bpf: test timed may_goto
 preserves R0-R5
Content-Language: en-US
To: Feng Jiang <jiangfeng@kylinos.cn>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi
	<memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	<song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
	<jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Puranjay Mohan
	<puranjay@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>, Ihor Solodrai
	<ihor.solodrai@linux.dev>
CC: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260723-riscv-bpf-timed-may-goto-v5-0-86acb54e5642@kylinos.cn>
 <20260723-riscv-bpf-timed-may-goto-v5-2-86acb54e5642@kylinos.cn>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260723-riscv-bpf-timed-may-goto-v5-2-86acb54e5642@kylinos.cn>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_031044_638945_897BC6BA 
X-CRM114-Status: GOOD (  11.01  )
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

Ck9uIDIwMjYvNy8yMyAxMzo0MSwgRmVuZyBKaWFuZyB3cm90ZToKPiBBZGQgYSB0ZXN0IHRoYXQg
Y2hlY2tzIFIwLVI1IGFyZSBwcmVzZXJ2ZWQgYWNyb3NzCj4gYXJjaF9icGZfdGltZWRfbWF5X2dv
dG8oKSBjYWxscy4KPiAKPiBVc2UgYnBmX2dldF9wcmFuZG9tX3UzMigpIHRvIGF2b2lkIHRoZSB2
ZXJpZmllciByZW1vdmluZyB0aGUgY2hlY2tzCj4gdmlhIERDRS4KPiAKPiBTdWdnZXN0ZWQtYnk6
IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogRmVuZyBK
aWFuZyA8amlhbmdmZW5nQGt5bGlub3MuY24+Cj4gLS0tCj4gICAuLi4vc2VsZnRlc3RzL2JwZi9w
cm9ncy92ZXJpZmllcl9tYXlfZ290b18xLmMgICAgICB8IDU4ICsrKysrKysrKysrKysrKysrKysr
KysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspCgpSZXZpZXdlZC1ieTogUHUg
TGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmllcl9tYXlfZ290b18xLmMgYi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdmVyaWZpZXJfbWF5X2dvdG9fMS5jCj4gaW5kZXggNGJk
ZjQyNTZhNDFlLi5jYjFjZTRkMTNjZmMgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX21heV9nb3RvXzEuYwo+ICsrKyBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmllcl9tYXlfZ290b18xLmMKPiBAQCAtMTA2LDQg
KzEwNiw2MiBAQCBfX25ha2VkIHZvaWQgbWF5X2dvdG9fYmF0Y2hfMih2b2lkKQo+ICAgCTogX19j
bG9iYmVyX2FsbCk7Cj4gICB9Cj4gICAKPiArLyoKPiArICogVXNlIGJwZl9nZXRfcHJhbmRvbV91
MzIoKSB0byBwcmV2ZW50IERDRSBmcm9tIHJlbW92aW5nIHRoZSBjaGVja3MuCj4gKyAqIHJldHZh
bDogMD1hbGwgb2ssIDEtNj1SMC1SNSBjbG9iYmVyZWQuCj4gKyAqLwo+ICtTRUMoInN5c2NhbGwi
KQo+ICtfX2Rlc2NyaXB0aW9uKCJ0aW1lZCBtYXlfZ290byBwcmVzZXJ2ZXMgUjAtUjUiKQo+ICtf
X2FyY2hfeDg2XzY0Cj4gK19fYXJjaF9zMzkweAo+ICtfX2FyY2hfYXJtNjQKPiArX19hcmNoX3Jp
c2N2NjQKPiArX19zdWNjZXNzCj4gK19fcmV0dmFsKDApCj4gK19fbmFrZWQgdm9pZCB0aW1lZF9t
YXlfZ290b19wcmVzZXJ2ZXNfcmVncyh2b2lkKQo+ICt7Cj4gKwlhc20gdm9sYXRpbGUgKAo+ICsJ
ImNhbGwgJVticGZfZ2V0X3ByYW5kb21fdTMyXTsiCj4gKwkicjYgPSByMDsiCj4gKwkicjAgPSAw
eDExMTE7Igo+ICsJInIwICs9IHI2OyIKPiArCSJyMSA9IDB4MjIyMjsiCj4gKwkicjEgKz0gcjY7
Igo+ICsJInIyID0gMHgzMzMzOyIKPiArCSJyMiArPSByNjsiCj4gKwkicjMgPSAweDQ0NDQ7Igo+
ICsJInIzICs9IHI2OyIKPiArCSJyNCA9IDB4NTU1NTsiCj4gKwkicjQgKz0gcjY7Igo+ICsJInI1
ID0gMHg2NjY2OyIKPiArCSJyNSArPSByNjsiCj4gKwkiLjhieXRlICVbbWF5X2dvdG9dOyIKPiAr
CSIuOGJ5dGUgJVtsb29wXTsiCj4gKwkicjAgLT0gcjY7Igo+ICsJInIxIC09IHI2OyIKPiArCSJy
MiAtPSByNjsiCj4gKwkicjMgLT0gcjY7Igo+ICsJInI0IC09IHI2OyIKPiArCSJyNSAtPSByNjsi
Cj4gKwkiaWYgcjAgIT0gMHgxMTExIGdvdG8gMWY7Igo+ICsJImlmIHIxICE9IDB4MjIyMiBnb3Rv
IDJmOyIKPiArCSJpZiByMiAhPSAweDMzMzMgZ290byAzZjsiCj4gKwkiaWYgcjMgIT0gMHg0NDQ0
IGdvdG8gNGY7Igo+ICsJImlmIHI0ICE9IDB4NTU1NSBnb3RvIDVmOyIKPiArCSJpZiByNSAhPSAw
eDY2NjYgZ290byA2ZjsiCj4gKwkicjAgPSAwOyIKPiArCSJleGl0OyIKPiArCSIxOiByMCA9IDE7
IGV4aXQ7Igo+ICsJIjI6IHIwID0gMjsgZXhpdDsiCj4gKwkiMzogcjAgPSAzOyBleGl0OyIKPiAr
CSI0OiByMCA9IDQ7IGV4aXQ7Igo+ICsJIjU6IHIwID0gNTsgZXhpdDsiCj4gKwkiNjogcjAgPSA2
OyBleGl0OyIKPiArCToKPiArCTogX19pbW0oYnBmX2dldF9wcmFuZG9tX3UzMiksCj4gKwkgIF9f
aW1tX2luc24obWF5X2dvdG8sIEJQRl9SQVdfSU5TTihCUEZfSk1QIHwgQlBGX0pDT05ELCAwLCAw
LCAxLCAwKSksCj4gKwkgIF9faW1tX2luc24obG9vcCwgQlBGX1JBV19JTlNOKEJQRl9KTVAgfCBC
UEZfSkEsIDAsIDAsIC0yLCAwKSkKPiArCTogX19jbG9iYmVyX2FsbCk7Cj4gK30KPiArCj4gICBj
aGFyIF9saWNlbnNlW10gU0VDKCJsaWNlbnNlIikgPSAiR1BMIjsKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
