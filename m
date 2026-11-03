Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F332606A324
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 09:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KuQ0NatZ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ZZLh0PUQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5eYACRjMqrsos+Aa6KTWnCnyHz52y8unA75GaxOTBMw=; b=KuQ0NatZdAC9TCh/zKvxdCqwCI
	AGLQSM61NzRQ7mjpMmqp950FrwzCJ2sC8G3qg/ban8Y7ED1OJqBMnw2+QBoyKSLxKmc0/Nf2NOf/S
	bDjyVA84WPUhVR0tYrtbhLR/ik3s41kyWRPXGNPzfrAEMfaxjzOWp2YzCT9kh2TuRatA/pyBt1bpd
	ViVemk6f3o+JBo7GbypH3+eiyP/IqD5YackgEREJRr07+ZldSxfrQdShI8z4TdLrb/hD+KcC/Xa55
	gBFCTJIyV7vzFb27zopM0l/80P2KRZWGmDuEOLMrDtKGTwwRU2dJBP2iroRmX6UuMkytlApmaeV7W
	1aV+IlRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAbR-00000001iKu-1QbA;
	Tue, 03 Nov 2026 09:14:49 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAbM-00000001iIE-10Q3;
	Tue, 03 Nov 2026 09:14:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Tn8JJ6e2rb+ujxI+sTGHT+OqEATEBHO8rrC9BgLrjPE=;
	b=ZZLh0PUQ1ZZiNnfLu8uV6kw465/92VoTefC9sc818KZ47gSrCoOLE4H+gQBVYp/oXtMCHQGBE
	/xxU76TnM8sqb8j6X269lFFu/zBlJdYIDfc09Pt9kMeIGaLVXeVOU+Fj5wlRPONrYU2LJAaTcTe
	QH3ZbbAuATkrqCZCdRFZpKs=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jJjZ432W9z1T4LL;
	Tue,  3 Nov 2026 17:14:20 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A470540537;
	Tue,  3 Nov 2026 17:14:38 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 3 Nov
 2026 17:14:36 +0800
Message-ID: <6ed88169-f663-4b72-a8f7-f75f2c7dc080@huawei.com>
Date: Tue, 3 Nov 2026 17:14:35 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] kexec: Fix CMA and elf header leaks and rework
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<baoquan.he@linux.dev>, <rppt@kernel.org>, <pasha.tatashin@soleen.com>,
	<pratyush@kernel.org>, <thuth@redhat.com>, <leitao@debian.org>,
	<yeoreum.yun@arm.com>, <robh@kernel.org>, <sourabhjain@linux.ibm.com>,
	<kees@kernel.org>, <coiby.xu@gmail.com>, <Yeking@Red54.com>,
	<tangyouling@kylinos.cn>, <maqianga@uniontech.com>,
	<zhangtianyang@loongson.cn>, <guodongtai@kylinos.cn>, <blum@kernel.org>,
	<adityag@linux.ibm.com>, <hui.wang@canonical.com>, <sohammetha01@gmail.com>,
	<guoren@kernel.org>, <gaohan@iscas.ac.cn>, <kai.huang@intel.com>,
	<kas@kernel.org>, <vishal.l.verma@intel.com>, <piliu@redhat.com>,
	<jbouron@amazon.com>, <mclapinski@google.com>, <me@linux.beauty>,
	<graf@amazon.com>, <bgwin@google.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
References: <20261026075201.699550-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261026075201.699550-1-ruanjinjie@huawei.com>
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_011445_452150_F394BAC9 
X-CRM114-Status: GOOD (  14.89  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgrlnKggMjAyNi8xMC8yNiAxNTo1MSwgSmluamllIFJ1YW4g5YaZ6YGTOgo+IEFSTTY0LCBMb29u
Z0FyY2ggYW5kIFJJU0MtViBsb2FkIHRoZSBlbGYgY29yZSBoZWFkZXIsIGluaXRyZCwgRFRCCj4g
YW5kIGNtZGxpbmUgcGFyYW1ldGVycyB3aXRoIGFsbW9zdCBpZGVudGljYWwgY29kZS4gVGhpcyBz
ZXJpZXMgZml4ZXMKPiB0aGUgYnVncyBpbiB0aGF0IHBhdGguIEFuZCBhcyBNaWtlIHN1Z2dlc3Rl
ZCwgcmV3b3JrIHRoZSBjb21tb24gcGFydAo+IGludG8gYSBoZWxwZXIuCj4gCj4gUGF0Y2ggMSBz
dG9wcyB1c2luZyB0aGUgSW1hZ2UgdGV4dF9vZmZzZXQgZm9yIGFybTY0LCB3aGljaCBicmVha3Mg
Q01BCj4gc2VnbWVudHMgaW4gYm90aCB0aGUgbG9hZCBhbmQgcmVsZWFzZSBwYXRocywgYW5kIHJl
amVjdHMgaW1hZ2VzIHdpdGgKPiBhIG5vbi16ZXJvIHZhbHVlLgo+IAo+IFBhdGNoZXMgMi03IGZp
eCB0aGUgQ01BIHBhZ2UgYW5kIGVsZiBjb3JlIGhlYWRlciBsZWFrcyBpbiB0aGUgcmV0cnkKPiBs
b29wcyBpbiBhcm02NCBhbmQgTG9vbmdBcmNoLCBhbHNvIGZpeCBhIG1vZGlmaWVkX2NtZGxpbmUg
bGVhawo+IGluIExvb25nQXJjaC4KPiAKPiBQYXRjaGVzIDgtMTAgcGFzcyB0aGUga2J1ZiBmaWVs
ZHMgdG8gY3Jhc2hfcHJlcGFyZV9oZWFkZXJzKCkgdG8KPiBzaW1wbGZ5IGNvZGUuCj4gCj4gUGF0
Y2ggMTEgZnJlZXMgdGhlIGVsZiBjb3JlIGhlYWRlciBmcm9tIHRoZSBnZW5lcmljIHBvc3QtbG9h
ZCBjbGVhbnVwLgo+IAo+IFBhdGNoZXMgMTItMTUgYWRkIGtleGVjX2xvYWRfb3RoZXJfc2VnbWVu
dHMoKSBhbmQgY29udmVydCB0aGUgdGhyZWUKPiBhcmNoaXRlY3R1cmVzLCBhbmQgYXJjaF9rZXhl
Y19zZXR1cF9vdGhlcl9zZWdtZW50cygpIGJ1aWxkcwo+IHRoZSBhcmNoaXRlY3R1cmUgc3BlY2lm
aWMgYm9vdCBwYXJhbWV0ZXJzIChhIERUQiBvciBhIGNvbW1hbmQgbGluZSkuCgoKSGksIGV2ZXJ5
b25lLAoKQW55IHRob3VnaHRzIG9yIHN1Z2dlc3Rpb25zPwoKPiAKPiBUZXN0ZWQgd2l0aCBrZXhl
Y19maWxlX2xvYWQoKSBhbmQga2R1bXAgb24gYXJtNjQsIFJJU0MtViBhbmQgTG9vbmdBcmNoCj4g
dW5kZXIgUUVNVSwgaW5jbHVkaW5nIHRoZSBub24temVybyB0ZXh0X29mZnNldCByZWplY3Rpb24u
Cj4gCj4gVGhpcyBzZXJpZXMgaXMgYWxzbyBhdmFpbGFibGUgYXQ6Cj4gICAgICAgICBodHRwczov
L2dpdGh1Yi5jb20vcnVhbmppbmppZS1lbmcvbGludXgvdHJlZS9rZXhlY19jbGVhbnVwX3Y3Cj4g
Cj4gQ2hhbmdlcyBpbiB2NzoKPiAtIFJld29yayB0aGUga2V4ZWNfZmlsZSBsb2FkIGNvZGUgdG8g
YXZvaWQgY29kZSBkdXBsaWNhdGlvbgo+ICAgYXMgTWlrZSBzdWdnZXN0ZWQuCj4gLSBBZGQgQWNr
ZWQtYnkuCj4gLSBEcm9wIHRoZSB0d28gbm9uLXplcm8gdGV4dF9vZmZzZXQgZml4IHBhdGNoZXMK
PiAgIGFuZCBkZXByZWNhdGUgLnRleHRfb2Zmc2V0IGluIGFybTY0IGFzIE1pa2Ugc3VnZ2VzdGVk
Lgo+IC0gRHJvcCB0aGUgeDg2LTMyIGZpeCBwYXRjaC4KPiAtIERyb3AgdGhlIFRPQ1RPVSByYWNl
IGZpeCBwYXRjaGVzLgo+IC0gTGluayB0byB2NjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjYwOTIxMDkwNDUwLjgwNzU3NS0xLXJ1YW5qaW5qaWVAaHVhd2VpLmNvbS8KPiAKPiBQcmV2
aW91cyBWZXJzaW9ucyBhcmUgYXMgYmVsb3c6Cj4gLSB2NTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjYwOTE4MTAwNDQyLjM4NDExMzUtMS1ydWFuamluamllQGh1YXdlaS5jb20vCj4g
LSB2NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwOTA3MTI1NDA0LjkyMjEyMy0x
LXJ1YW5qaW5qaWVAaHVhd2VpLmNvbS8KPiAtIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNjA4MjYwOTI1NDEuMzkwNTkzMy0xLXJ1YW5qaW5qaWVAaHVhd2VpLmNvbS8KPiAtIHYy
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA3MjkwMzEyMzUuMjg0MDI1NS0xLXJ1
YW5qaW5qaWVAaHVhd2VpLmNvbS8KPiAtIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyNjA3MjMxMzEyNDIuMTUzNzYzMy0xLXJ1YW5qaW5qaWVAaHVhd2VpLmNvbS8jdAo+IAo+IEpp
bmppZSBSdWFuICgxNSk6Cj4gICBhcm02NDoga2V4ZWNfZmlsZTogU3RvcCB1c2luZyB0aGUgSW1h
Z2UgdGV4dF9vZmZzZXQKPiAgIGtleGVjOiBFeHRyYWN0IGtleGVjX2ZyZWVfc2VnbWVudF9jbWEo
KSBmcm9tIGtpbWFnZV9mcmVlX2NtYSgpCj4gICBhcm02NDoga2V4ZWNfZmlsZTogRml4IENNQSBw
YWdlIGxlYWtzIGluIHNlZ21lbnQgcGxhY2VtZW50IHJldHJ5IGxvb3BzCj4gICBhcm02NDoga2V4
ZWNfZmlsZTogRml4IGVsZl9oZWFkZXJzIG1lbW9yeSBsZWFrIGluIHJldHJ5IGxvb3AKPiAgIExv
b25nQXJjaDoga2V4ZWNfZmlsZTogRml4IENNQSBwYWdlIGxlYWtzIGluIHNlZ21lbnQgcGxhY2Vt
ZW50IHJldHJ5Cj4gICAgIGxvb3BzCj4gICBMb29uZ0FyY2g6IGtleGVjX2ZpbGU6IEZpeCBlbGZf
aGVhZGVycyBtZW1vcnkgbGVhayBpbiByZXRyeSBsb29wCj4gICBMb29uZ0FyY2g6IGtleGVjX2Zp
bGU6IEZpeCBhIG1vZGlmaWVkX2NtZGxpbmUgbGVhawo+ICAgYXJtNjQ6IGtleGVjX2ZpbGU6IFNp
bXBsaWZ5IGxvYWRfb3RoZXJfc2VnbWVudHMoKQo+ICAgTG9vbmdBcmNoOiBrZXhlY19maWxlOiBT
aW1wbGlmeSBsb2FkX290aGVyX3NlZ21lbnRzKCkKPiAgIHJpc2N2OiBrZXhlY19maWxlOiBTaW1w
bGlmeSBsb2FkX2V4dHJhX3NlZ21lbnRzKCkKPiAgIGtleGVjOiBGcmVlIHRoZSBlbGYgY29yZSBo
ZWFkZXIgaW4ga2ltYWdlX2ZpbGVfcG9zdF9sb2FkX2NsZWFudXAoKQo+ICAga2V4ZWM6IEFkZCBr
ZXhlY19sb2FkX290aGVyX3NlZ21lbnRzKCkgaGVscGVyCj4gICBhcm02NDoga2V4ZWNfZmlsZTog
VXNlIGtleGVjX2xvYWRfb3RoZXJfc2VnbWVudHMoKSB0byBzaW1wbGlmeSBjb2RlCj4gICBMb29u
Z0FyY2g6IGtleGVjX2ZpbGU6IFVzZSBrZXhlY19sb2FkX290aGVyX3NlZ21lbnRzKCkgdG8gc2lt
cGxpZnkKPiAgICAgY29kZQo+ICAgcmlzY3Y6IGtleGVjX2ZpbGU6IFVzZSBrZXhlY19sb2FkX290
aGVyX3NlZ21lbnRzKCkgdG8gc2ltcGxpZnkgY29kZQo+IAo+ICBhcmNoL2FybTY0L2luY2x1ZGUv
YXNtL2tleGVjLmggICAgICAgICAgICAgfCAgIDUgLQo+ICBhcmNoL2FybTY0L2tlcm5lbC9rZXhl
Y19pbWFnZS5jICAgICAgICAgICAgfCAgMzMgKysrKystLQo+ICBhcmNoL2FybTY0L2tlcm5lbC9t
YWNoaW5lX2tleGVjX2ZpbGUuYyAgICAgfCAxMDMgKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4gIGFy
Y2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL2tleGVjLmggICAgICAgICB8ICAgNCAtCj4gIGFyY2gv
bG9vbmdhcmNoL2tlcm5lbC9rZXhlY19lZmkuYyAgICAgICAgICB8ICAyMCArKystCj4gIGFyY2gv
bG9vbmdhcmNoL2tlcm5lbC9rZXhlY19lbGYuYyAgICAgICAgICB8ICAxMSArKy0KPiAgYXJjaC9s
b29uZ2FyY2gva2VybmVsL21hY2hpbmVfa2V4ZWMuYyAgICAgIHwgICAyICsKPiAgYXJjaC9sb29u
Z2FyY2gva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jIHwgIDk2ICsrKy0tLS0tLS0tLS0tLS0t
LS0KPiAgYXJjaC9wb3dlcnBjL2tleGVjL2ZpbGVfbG9hZF82NC5jICAgICAgICAgIHwgICA0IC0K
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rZXhlYy5oICAgICAgICAgICAgIHwgICA0IC0KPiAg
YXJjaC9yaXNjdi9rZXJuZWwva2V4ZWNfZWxmLmMgICAgICAgICAgICAgIHwgIDExICsrLQo+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9rZXhlY19pbWFnZS5jICAgICAgICAgICAgfCAgMTEgKystCj4gIGFy
Y2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jICAgICB8ICA3OSArKysrLS0tLS0t
LS0tLS0tCj4gIGFyY2gveDg2L2tlcm5lbC9tYWNoaW5lX2tleGVjXzY0LmMgICAgICAgICB8ICAg
NCAtCj4gIGluY2x1ZGUvbGludXgva2V4ZWMuaCAgICAgICAgICAgICAgICAgICAgICB8ICAxNyAr
KysrCj4gIGtlcm5lbC9rZXhlY19jb3JlLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAyNSAr
Ky0tLQo+ICBrZXJuZWwva2V4ZWNfZmlsZS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgOTkg
KysrKysrKysrKysrKysrKysrKysKPiAgMTcgZmlsZXMgY2hhbmdlZCwgMjQ4IGluc2VydGlvbnMo
KyksIDI4MCBkZWxldGlvbnMoLSkKPiAKCi0tIApCZXN0IHJlZ2FyZHMsCkppbmppZQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
