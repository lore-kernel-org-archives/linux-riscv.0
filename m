Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2024606A322
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 09:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QHn3IMll;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EE/OeHk1;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=VNIuT+eZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6SV0P2z+dp7rZLQ8e+wd2Ikc5YA52WlaWnsk0IkiG0g=; b=QHn3IMll3Xs8d+
	xTUrFbra3A7Ks560ptY6H78PSjp77krs9baDG45wO+4bT2+L4I4+PliK09FlRqWvlmKqyQk7ZaTJJ
	z/Wepg1P0rUfQuGGslAndaQLQ07ZBtNu3pE0kWSM3aE8ewgJQFKtgB3LaEG/LI4qNsxOD15FaLwdm
	Y/wLJbpg9JCfLkXDgaozJRiwwUQ5Y8d9Wnv+VEn5OdSBEEaVRbCK6qurA45uABq7o7IED/MC1/jHC
	GAfTDaZb35R4/Vq6tPyt3vVtd4UTj2I+Mo4UJ/8E3ioXB/jcHiqCVw6wwjjdjADFNThpJtsZ9/2mG
	QniKiYywG/ezHnOcrWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSGf-0000000BR20-3w9D;
	Wed, 21 Oct 2026 09:05:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSGb-0000000BR0s-3DTr;
	Wed, 21 Oct 2026 09:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qly2ZXVqJU8mRHFencdxpDDot1stjgFFpJM+J90ArtI=; b=EE/OeHk1rF0+dtB8vBwQ76ixey
	f7Tf1oFYzWIJ9yNOELL2C8OgWUafv71mEn+bVqI3FLksOphPCyzbW27EEs5AMxjqTp36+XA78zic8
	DxqErRdQkRhw4F9u3YREb04aB1HJTxwMnYv0zOOyU7BrZdK8PeXyF0z9ViS5ICWWObVk2jguVzOBt
	qN7LeMI1hptb0qbeM4/QqPG+80irxYe5i6lj1VN3tfi4TioF058xI8EnAqX/8hC5fqMraildazcnz
	+cswG0ctBNiWHw1L6GnhMGCeb04U0hNUBsBa7pbJx43UlLXPf0P2RxPmZ3vTRLE4xi3862mgnHuJJ
	FGpPRoYA==;
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJSGW-00000005d87-3WUk;
	Wed, 21 Oct 2026 09:05:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qly2ZXVqJU8mRHFencdxpDDot1stjgFFpJM+J90ArtI=;
	b=VNIuT+eZ75BYq5bEgDxPMwxDJad0LsRd2qh8O5xIl6lSkVcMxoMw0iYMTpsMxZj6Jahuezyk/
	yCYxoyiTPQ7Vzfr1pjBJxOpwsIQj3XOgI1W9mckRnRaKJwL0kZrJRME/xKwgmPeH9Mbs9PUKvqW
	U5k8YRQq520iy9kJHkZbWqo=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4j8jks5JQPz1cySH;
	Wed, 21 Oct 2026 16:54:13 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 682B34058E;
	Wed, 21 Oct 2026 17:05:33 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 17:05:32 +0800
Message-ID: <6d4ba1c2-b672-465b-9683-0aa1ad8dee73@huawei.com>
Date: Wed, 21 Oct 2026 17:05:31 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/8] riscv: build crash_mem ranges from memblock
 instead of resource tree
To: Wandun Chen <chenwandun1@gmail.com>, <robh@kernel.org>,
	<baoquan.he@linux.dev>, <rppt@kernel.org>, <m.szyprowski@samsung.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<saravanak@kernel.org>, <akpm@linux-foundation.org>,
	<pasha.tatashin@soleen.com>, <pratyush@kernel.org>, <ruirui.yang@linux.dev>,
	<robin.murphy@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>, <linux-mm@kvack.org>, <iommu@lists.linux.dev>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <20261021083011.2170525-2-chenwandun1@gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261021083011.2170525-2-chenwandun1@gmail.com>
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_100546_082397_A33A8784 
X-CRM114-Status: GOOD (  16.23  )
X-Spam-Score: -0.1 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgrlnKggMjAyNi8xMC8yMSAxNjozMCwgV2FuZHVuIENoZW4g5YaZ6YGTOgo+IEZyb206IFdhbmR1
biBDaGVuIDxjaGVud2FuZHVuQGxpeGlhbmcuY29tPgo+IAo+IFJlcGxhY2Ugd2Fsa19zeXN0ZW1f
cmFtX3JlcygpIHdpdGggZm9yX2VhY2hfbWVtX3JhbmdlKCkuIEEgbGF0ZXIgcGF0Y2gKPiBpbnRy
b2R1Y2VzIE1FTUJMT0NLX05PRFVNUCBpbiBtZW1ibG9jaywgdGhlIHJlc2VydmVkLW1lbW9yeSBy
ZWdpb25zCj4gbWFya2VkIHdpdGggTUVNQkxPQ0tfTk9EVU1QIGNhbiBiZSBleGNsdWRlZCBmcm9t
IHRoZSB2bWNvcmUgYnkgd2Fsa2luZwo+IG1lbWJsb2NrLgo+IAo+IGZvcl9lYWNoX21lbV9yYW5n
ZSgpIGl0ZXJhdGVzIG1lbWJsb2NrLm1lbW9yeSwgd2hpY2ggaXMgZnJlZWQgYWZ0ZXIKPiBpbml0
IHVubGVzcyBBUkNIX0tFRVBfTUVNQkxPQ0sgaXMgc2VsZWN0ZWQuIHJpc2N2IG5lZWRzIEFSQ0hf
S0VFUF9NRU1CTE9DSwo+IHRvIGZpbHRlciByZXNlcnZlZCBtZW1vcnkgZnJvbSB0aGUgdm1jb3Jl
LCBzbyBleHRlbmQgaXRzIGNvbmRpdGlvbgo+IChBQ1BJIHx8IEtFWEVDKSB3aXRoIENSQVNIX0RV
TVAuIGFybTY0IGFuZCBsb29uZ2FyY2ggYWxyZWFkeSBzZWxlY3QKPiBBUkNIX0tFRVBfTUVNQkxP
Q0sgdW5jb25kaXRpb25hbGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdhbmR1biBDaGVuIDxjaGVu
d2FuZHVuQGxpeGlhbmcuY29tPgo+IFRlc3RlZC1ieTogTWVpamluZyBaaGFvIDx6aGFvbWVpamlu
Z0BsaXhpYW5nLmNvbT4KPiBBY2tlZC1ieTogQmFvcXVhbiBIZSA8YmFvcXVhbi5oZUBsaW51eC5k
ZXY+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMgfCAzMSArKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDIwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9h
cmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCBlNzg5MWEyYTg5ZGEuLmUyMWQwYmFiNzdlZSAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcK
PiBAQCAtNTgsNyArNTgsNyBAQCBjb25maWcgUklTQ1YKPiAgCXNlbGVjdCBBUkNIX0hBU19VQlNB
Tgo+ICAJc2VsZWN0IEFSQ0hfSEFTX1ZEU09fQVJDSF9EQVRBCj4gIAlzZWxlY3QgQVJDSF9IQVZF
X05NSV9TQUZFX0NNUFhDSEcKPiAtCXNlbGVjdCBBUkNIX0tFRVBfTUVNQkxPQ0sgaWYgQUNQSSB8
fCBLRVhFQwo+ICsJc2VsZWN0IEFSQ0hfS0VFUF9NRU1CTE9DSyBpZiBBQ1BJIHx8IEtFWEVDIHx8
IENSQVNIX0RVTVAKPiAgCXNlbGVjdCBBUkNIX01IUF9NRU1NQVBfT05fTUVNT1JZX0VOQUJMRQlp
ZiA2NEJJVCAmJiBNTVUKPiAgCXNlbGVjdCBBUkNIX09QVElPTkFMX0tFUk5FTF9SV1ggaWYgQVJD
SF9IQVNfU1RSSUNUX0tFUk5FTF9SV1gKPiAgCXNlbGVjdCBBUkNIX09QVElPTkFMX0tFUk5FTF9S
V1hfREVGQVVMVAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVj
X2ZpbGUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jCj4gaW5kZXgg
MjZjZDJhOGJkMGNkLi44MDhlODcyZjQwNjMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvbWFjaGluZV9rZXhlY19maWxlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5l
X2tleGVjX2ZpbGUuYwo+IEBAIC0zNywzOSArMzcsMzIgQEAgaW50IGFyY2hfa2ltYWdlX2ZpbGVf
cG9zdF9sb2FkX2NsZWFudXAoc3RydWN0IGtpbWFnZSAqaW1hZ2UpCj4gIH0KPiAgCj4gICNpZmRl
ZiBDT05GSUdfQ1JBU0hfRFVNUAo+IC1zdGF0aWMgaW50IGdldF9ucl9yYW1fcmFuZ2VzX2NhbGxi
YWNrKHN0cnVjdCByZXNvdXJjZSAqcmVzLCB2b2lkICphcmcpCj4gLXsKPiAtCXVuc2lnbmVkIGlu
dCAqbnJfcmFuZ2VzID0gYXJnOwo+IC0KPiAtCSgqbnJfcmFuZ2VzKSsrOwo+IC0JcmV0dXJuIDA7
Cj4gLX0KPiAtCj4gIHVuc2lnbmVkIGludCBhcmNoX2dldF9zeXN0ZW1fbnJfcmFuZ2VzKHZvaWQp
Cj4gIHsKPiAgCXVuc2lnbmVkIGludCBucl9yYW5nZXMgPSAyICsgY3Jhc2hrX2NtYV9jbnQ7IC8q
IEZvciBleGNsdXNpb24gb2YgY3Jhc2hrZXJuZWwgcmVnaW9uICovCj4gKwl1NjQgaTsKPiArCXBo
eXNfYWRkcl90IHN0YXJ0LCBlbmQ7CgpUaGUga2VybmVsIHByZWZlcnMgdGhlIHJldmVyc2UgQ2hy
aXN0bWFzIHRyZWUgbGF5b3V0IGZvciBsb2NhbCB2YXJpYWJsZXMuCgo+ICAKPiAtCXdhbGtfc3lz
dGVtX3JhbV9yZXMoMCwgLTEsICZucl9yYW5nZXMsIGdldF9ucl9yYW1fcmFuZ2VzX2NhbGxiYWNr
KTsKPiArCWZvcl9lYWNoX21lbV9yYW5nZShpLCAmc3RhcnQsICZlbmQpCj4gKwkJbnJfcmFuZ2Vz
Kys7Cj4gIAo+ICAJcmV0dXJuIG5yX3JhbmdlczsKPiAgfQo+ICAKPiAtc3RhdGljIGludCBwcmVw
YXJlX2VsZjY0X3JhbV9oZWFkZXJzX2NhbGxiYWNrKHN0cnVjdCByZXNvdXJjZSAqcmVzLCB2b2lk
ICphcmcpCj4gK2ludCBhcmNoX2NyYXNoX3BvcHVsYXRlX2NtZW0oc3RydWN0IGNyYXNoX21lbSAq
Y21lbSkKPiAgewo+IC0Jc3RydWN0IGNyYXNoX21lbSAqY21lbSA9IGFyZzsKPiArCXU2NCBpOwo+
ICsJcGh5c19hZGRyX3Qgc3RhcnQsIGVuZDsKPiAgCj4gLQljbWVtLT5yYW5nZXNbY21lbS0+bnJf
cmFuZ2VzXS5zdGFydCA9IHJlcy0+c3RhcnQ7Cj4gLQljbWVtLT5yYW5nZXNbY21lbS0+bnJfcmFu
Z2VzXS5lbmQgPSByZXMtPmVuZDsKPiAtCWNtZW0tPm5yX3JhbmdlcysrOwo+ICsJZm9yX2VhY2hf
bWVtX3JhbmdlKGksICZzdGFydCwgJmVuZCkgewo+ICsJCWNtZW0tPnJhbmdlc1tjbWVtLT5ucl9y
YW5nZXNdLnN0YXJ0ID0gc3RhcnQ7Cj4gKwkJY21lbS0+cmFuZ2VzW2NtZW0tPm5yX3Jhbmdlc10u
ZW5kID0gZW5kIC0gMTsKPiArCQljbWVtLT5ucl9yYW5nZXMrKzsKPiArCX0KPiAgCj4gIAlyZXR1
cm4gMDsKPiAgfQo+ICAKPiAtaW50IGFyY2hfY3Jhc2hfcG9wdWxhdGVfY21lbShzdHJ1Y3QgY3Jh
c2hfbWVtICpjbWVtKQo+IC17Cj4gLQlyZXR1cm4gd2Fsa19zeXN0ZW1fcmFtX3JlcygwLCAtMSwg
Y21lbSwgcHJlcGFyZV9lbGY2NF9yYW1faGVhZGVyc19jYWxsYmFjayk7Cj4gLX0KPiAtCj4gIHN0
YXRpYyBjaGFyICpzZXR1cF9rZHVtcF9jbWRsaW5lKHN0cnVjdCBraW1hZ2UgKmltYWdlLCBjaGFy
ICpjbWRsaW5lLAo+ICAJCQkJIHVuc2lnbmVkIGxvbmcgY21kbGluZV9sZW4pCj4gIHsKCi0tIApC
ZXN0IHJlZ2FyZHMsCkppbmppZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
