Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56809FD45F9
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 03:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0HiUTwXxJj7k1aO44FFBUIkuShz+fj4iTjwwvx/zes=; b=aMdCHrP34ZAmpk
	ygn1KXdZJryBl894KnZvIssBQpHYJT+56V9vSyrB4GwG1+yowaGQod+27JthwotwpYlMYKELy33v3
	kwjzQNvd0LNWP0VoZ6j1c7J6zFP5b5d435OkzuGu4S0SvxEpAOgL+pO1FGBgK8gHJQ9YaQgp1yBeR
	RsDp4vWxkMO51GPfbXSfAg3hsU5zKcS3Ikd5bDnFr5n385i7T8ZlgN5IY0Llv1PpoabbOQbkNgUgw
	ZWxsBXzCl95twiGqnVt/cC1MsnHPfzhPEUDRph2OsxSojOvbnGGqlpTPTn71qBpduBbTHUNVK4Xp2
	FdZFSb4JrWHaLsjt4/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvRzv-00000005Jds-1Kd3;
	Thu, 26 Feb 2026 03:25:07 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvRzq-00000005Jcx-2o22;
	Thu, 26 Feb 2026 03:25:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=X/tw47XVxnBSBQVQnzbdQeBRFqR3Av4K63nH/lDW8AE=;
	b=x1l2VLMmjYlYgtz9e9QHe2mOtGBgkKNh7hz5MB9XCgwIHUNdvwywy/MiST1AdgYMZ8Zyzmb27
	xiMAI8GTBB37K4MPa+6n43+ne+oVZQwZt5AaCiT8i/cHG9pw7k06FxwueZqr+OCknXS8TuOpk3e
	TFufapm/JkqBD70EL8N9gQs=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fLxXn5h2NznTW8;
	Thu, 26 Feb 2026 11:20:09 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 0E70340561;
	Thu, 26 Feb 2026 11:24:50 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Feb 2026 11:24:46 +0800
Message-ID: <0b0c0a34-f67d-9cf5-d5fc-ed8e1870a104@huawei.com>
Date: Thu, 26 Feb 2026 11:24:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v6 4/5] arm64: kexec: Add support for crashkernel CMA
 reservation
To: Mike Rapoport <rppt@kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <bhe@redhat.com>,
	<vgoyal@redhat.com>, <dyoung@redhat.com>, <rdunlap@infradead.org>,
	<pmladek@suse.com>, <dapeng1.mi@linux.intel.com>, <kees@kernel.org>,
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <arnd@arndb.de>,
	<ardb@kernel.org>, <leitao@debian.org>, <cfsworks@gmail.com>,
	<ryan.roberts@arm.com>, <sourabhjain@linux.ibm.com>,
	<tangyouling@kylinos.cn>, <eajames@linux.ibm.com>, <hbathini@linux.ibm.com>,
	<ritesh.list@gmail.com>, <songshuaishuai@tinylab.org>,
	<samuel.holland@sifive.com>, <kevin.brodsky@arm.com>,
	<vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <coxu@redhat.com>,
	<liaoyuanhong@vivo.com>, <fuqiang.wang@easystack.cn>, <jbohac@suse.cz>,
	<brgerst@gmail.com>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
References: <20260224085342.387996-1-ruanjinjie@huawei.com>
 <20260224085342.387996-5-ruanjinjie@huawei.com> <aZ8Z2WXw3QwaXRo8@kernel.org>
Content-Language: en-US
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aZ8Z2WXw3QwaXRo8@kernel.org>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_192503_377492_C51BEA4C 
X-CRM114-Status: GOOD (  22.49  )
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

CgpPbiAyMDI2LzIvMjUgMjM6NDgsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gT24gVHVlLCBGZWIg
MjQsIDIwMjYgYXQgMDQ6NTM6NDFQTSArMDgwMCwgSmluamllIFJ1YW4gd3JvdGU6Cj4+IENvbW1p
dCAzNWMxOGYyOTMzYzUgKCJBZGQgYSBuZXcgb3B0aW9uYWwgIixjbWEiIHN1ZmZpeCB0byB0aGUK
Pj4gY3Jhc2hrZXJuZWw9IGNvbW1hbmQgbGluZSBvcHRpb24iKSBhbmQgY29tbWl0IGFiNDc1NTEw
ZTA0MiAoImtkdW1wOgo+PiBpbXBsZW1lbnQgcmVzZXJ2ZV9jcmFzaGtlcm5lbF9jbWEiKSBhZGRl
ZCBDTUEgc3VwcG9ydCBmb3Iga2R1bXAKPj4gY3Jhc2hrZXJuZWwgcmVzZXJ2YXRpb24uCj4+Cj4+
IENyYXNoIGtlcm5lbCBtZW1vcnkgcmVzZXJ2YXRpb24gd2FzdGVzIHByb2R1Y3Rpb24gcmVzb3Vy
Y2VzIGlmIHRvbwo+PiBsYXJnZSwgcmlza3Mga2R1bXAgZmFpbHVyZSBpZiB0b28gc21hbGwsIGFu
ZCBmYWNlcyBhbGxvY2F0aW9uIGRpZmZpY3VsdGllcwo+PiBvbiBmcmFnbWVudGVkIHN5c3RlbXMg
ZHVlIHRvIGNvbnRpZ3VvdXMgYmxvY2sgY29uc3RyYWludHMuIFRoZSBuZXcKPj4gQ01BLWJhc2Vk
IGNyYXNoa2VybmVsIHJlc2VydmF0aW9uIHNjaGVtZSBzcGxpdHMgdGhlICJsYXJnZSBmaXhlZAo+
PiByZXNlcnZhdGlvbiIgaW50byBhICJzbWFsbCBmaXhlZCByZWdpb24gKyBsYXJnZSBDTUEgZHlu
YW1pYyByZWdpb24iOiB0aGUKPj4gQ01BIG1lbW9yeSBpcyBhdmFpbGFibGUgdG8gdXNlcnNwYWNl
IGR1cmluZyBub3JtYWwgb3BlcmF0aW9uIHRvIGF2b2lkCj4+IHdhc3RlLCBhbmQgaXMgcmVjbGFp
bWVkIGZvciBrZHVtcCB1cG9uIGNyYXNo4oCUc2F2aW5nIG1lbW9yeSB3aGlsZQo+PiBpbXByb3Zp
bmcgcmVsaWFiaWxpdHkuCj4+Cj4+IFNvIGV4dGVuZCBjcmFzaGtlcm5lbCBDTUEgcmVzZXJ2YXRp
b24gc3VwcG9ydCB0byBhcm02NC4gVGhlIGZvbGxvd2luZwo+PiBjaGFuZ2VzIGFyZSBtYWRlIHRv
IGVuYWJsZSBDTUEgcmVzZXJ2YXRpb246Cj4+Cj4+IC0gUGFyc2UgYW5kIG9idGFpbiB0aGUgQ01B
IHJlc2VydmF0aW9uIHNpemUgYWxvbmcgd2l0aCBvdGhlciBjcmFzaGtlcm5lbAo+PiAgIHBhcmFt
ZXRlcnMuCj4+IC0gQ2FsbCByZXNlcnZlX2NyYXNoa2VybmVsX2NtYSgpIHRvIGFsbG9jYXRlIHRo
ZSBDTUEgcmVnaW9uIGZvciBrZHVtcC4KPj4gLSBJbmNsdWRlIHRoZSBDTUEtcmVzZXJ2ZWQgcmFu
Z2VzIGZvciBrZHVtcCBrZXJuZWwgdG8gdXNlLgo+PiAtIEV4Y2x1ZGUgdGhlIENNQS1yZXNlcnZl
ZCByYW5nZXMgZnJvbSB0aGUgY3Jhc2gga2VybmVsIG1lbW9yeSB0bwo+PiAgIHByZXZlbnQgdGhl
bSBmcm9tIGJlaW5nIGV4cG9ydGVkIHRocm91Z2ggL3Byb2Mvdm1jb3JlLCB3aGljaCBpcyBhbHJl
YWR5Cj4+ICAgZG9uZSBpbiB0aGUgY3Jhc2ggY29yZS4KPj4KPj4gVXBkYXRlIGtlcm5lbC1wYXJh
bWV0ZXJzLnR4dCB0byBkb2N1bWVudCBDTUEgc3VwcG9ydCBmb3IgY3Jhc2hrZXJuZWwgb24KPj4g
YXJtNjQgYXJjaGl0ZWN0dXJlLgo+Pgo+PiBBY2tlZC1ieTogQXJkIEJpZXNoZXV2ZWwgPGFyZGJA
a2VybmVsLm9yZz4KPj4gU2lnbmVkLW9mZi1ieTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVh
d2VpLmNvbT4KPj4gLS0tCj4+IHYzOgo+PiAtIEFkZCBBY2tlZC1ieS4KPj4gdjI6Cj4+IC0gRnJl
ZSBjbWVtIGluIHByZXBhcmVfZWxmX2hlYWRlcnMoKQo+PiAtIEFkZCB0aGUgbXRpdmF0aW9uLgo+
PiAtLS0KPj4gIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0
IHwgMiArLQo+PiAgYXJjaC9hcm02NC9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMgICAgICAg
ICAgfCA4ICsrKysrKystCj4+ICBhcmNoL2FybTY0L21tL2luaXQuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDUgKysrLS0KPj4gIDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYWRtaW4t
Z3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9r
ZXJuZWwtcGFyYW1ldGVycy50eHQKPj4gaW5kZXggY2I4NTBlNTI5MGMyLi40OTdmNjNiNzY4OTgg
MTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRl
cnMudHh0Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRl
cnMudHh0Cj4+IEBAIC0xMTIxLDcgKzExMjEsNyBAQCBLZXJuZWwgcGFyYW1ldGVycwo+PiAgCQkJ
SXQgd2lsbCBiZSBpZ25vcmVkIHdoZW4gY3Jhc2hrZXJuZWw9WCxoaWdoIGlzIG5vdCB1c2VkCj4+
ICAJCQlvciBtZW1vcnkgcmVzZXJ2ZWQgaXMgYmVsb3cgNEcuCj4+ICAJY3Jhc2hrZXJuZWw9c2l6
ZVtLTUddLGNtYQo+PiAtCQkJW0tOTCwgWDg2LCBwcGNdIFJlc2VydmUgYWRkaXRpb25hbCBjcmFz
aCBrZXJuZWwgbWVtb3J5IGZyb20KPj4gKwkJCVtLTkwsIFg4NiwgQVJNNjQsIHBwY10gUmVzZXJ2
ZSBhZGRpdGlvbmFsIGNyYXNoIGtlcm5lbCBtZW1vcnkgZnJvbQo+PiAgCQkJQ01BLiBUaGlzIHJl
c2VydmF0aW9uIGlzIHVzYWJsZSBieSB0aGUgZmlyc3Qgc3lzdGVtJ3MKPj4gIAkJCXVzZXJzcGFj
ZSBtZW1vcnkgYW5kIGtlcm5lbCBtb3ZhYmxlIGFsbG9jYXRpb25zIChtZW1vcnkKPj4gIAkJCWJh
bGxvb24sIHpzd2FwKS4gUGFnZXMgYWxsb2NhdGVkIGZyb20gdGhpcyBtZW1vcnkgcmFuZ2UKPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jIGIvYXJj
aC9hcm02NC9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMKPj4gaW5kZXggYzMzODUwNmE1ODBi
Li5jODg2MmE3NjJlYjMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVf
a2V4ZWNfZmlsZS5jCj4+ICsrKyBiL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWNfZmls
ZS5jCj4+IEBAIC00Miw3ICs0Miw3IEBAIGludCBhcmNoX2tpbWFnZV9maWxlX3Bvc3RfbG9hZF9j
bGVhbnVwKHN0cnVjdCBraW1hZ2UgKmltYWdlKQo+PiAgI2lmZGVmIENPTkZJR19DUkFTSF9EVU1Q
Cj4+ICB1bnNpZ25lZCBpbnQgYXJjaF9nZXRfc3lzdGVtX25yX3Jhbmdlcyh2b2lkKQo+PiAgewo+
PiAtCXVuc2lnbmVkIGludCBucl9yYW5nZXMgPSAyOyAvKiBmb3IgZXhjbHVzaW9uIG9mIGNyYXNo
a2VybmVsIHJlZ2lvbiAqLwo+PiArCXVuc2lnbmVkIGludCBucl9yYW5nZXMgPSAyICsgY3Jhc2hr
X2NtYV9jbnQ7IC8qIGZvciBleGNsdXNpb24gb2YgY3Jhc2hrZXJuZWwgcmVnaW9uICovCj4+ICAJ
cGh5c19hZGRyX3Qgc3RhcnQsIGVuZDsKPj4gIAl1NjQgaTsKPj4gIAo+PiBAQCAtNjQsNiArNjQs
MTIgQEAgaW50IGFyY2hfY3Jhc2hfcG9wdWxhdGVfY21lbShzdHJ1Y3QgY3Jhc2hfbWVtICpjbWVt
KQo+PiAgCQljbWVtLT5ucl9yYW5nZXMrKzsKPj4gIAl9Cj4+ICAKPj4gKwlmb3IgKGkgPSAwOyBp
IDwgY3Jhc2hrX2NtYV9jbnQ7IGkrKykgewo+PiArCQljbWVtLT5yYW5nZXNbY21lbS0+bnJfcmFu
Z2VzXS5zdGFydCA9IGNyYXNoa19jbWFfcmFuZ2VzW2ldLnN0YXJ0Owo+PiArCQljbWVtLT5yYW5n
ZXNbY21lbS0+bnJfcmFuZ2VzXS5lbmQgPSBjcmFzaGtfY21hX3Jhbmdlc1tpXS5lbmQ7Cj4+ICsJ
CWNtZW0tPm5yX3JhbmdlcysrOwo+PiArCX0KPiAKPiBXaHkgZG8gd2UgbmVlZCB0byBhZGQgY21h
IHJhbmdlcyBoZXJlPyBUaGV5IGFyZSBhbnl3YXkgd2lsbCBiZSBleGNsdWRlZCBpbgo+IGNyYXNo
X2V4Y2x1ZGVfY29yZV9yYW5nZXMoKS4KPiAKPiBUaGUgc2FtZSBjb21tZW50IGFwcGxpZXMgdG8g
cmlzY3YgcGF0Y2guCgpJbmRlZWQsIGl0IHNob3VsZCBub3QgYmUgcGxhY2VkIGhlcmUuIEluIHRo
ZSBrZXhlYyBEVCBjb2RlLCB0aGVzZSBtZW1vcnkKcmVnaW9ucyBuZWVkIHRvIGJlIGluY2x1ZGVk
IGluIHRoZSAidXNhYmxlLW1lbW9yeS1yYW5nZSIsd2hpY2ggaXMKZXF1aXZhbGVudCB0byB0aGUg
eDg2IGNyYXNoX3NldHVwX21lbW1hcF9lbnRyaWVzKCkgZnVuY3Rpb24uCgo+IAo+PiAgCXJldHVy
biAwOwo+PiAgfQo+PiAgI2VuZGlmCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L21tL2luaXQu
YyBiL2FyY2gvYXJtNjQvbW0vaW5pdC5jCj4+IGluZGV4IDk2NzExYjg1NzhmZC4uMTQ0ZTMwZmU5
YTc1IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L21tL2luaXQuYwo+PiArKysgYi9hcmNoL2Fy
bTY0L21tL2luaXQuYwo+PiBAQCAtOTYsOCArOTYsOCBAQCBwaHlzX2FkZHJfdCBfX3JvX2FmdGVy
X2luaXQgYXJtNjRfZG1hX3BoeXNfbGltaXQ7Cj4+ICAKPj4gIHN0YXRpYyB2b2lkIF9faW5pdCBh
cmNoX3Jlc2VydmVfY3Jhc2hrZXJuZWwodm9pZCkKPj4gIHsKPj4gKwl1bnNpZ25lZCBsb25nIGxv
bmcgY3Jhc2hfYmFzZSwgY3Jhc2hfc2l6ZSwgY21hX3NpemUgPSAwOwo+PiAgCXVuc2lnbmVkIGxv
bmcgbG9uZyBsb3dfc2l6ZSA9IDA7Cj4+IC0JdW5zaWduZWQgbG9uZyBsb25nIGNyYXNoX2Jhc2Us
IGNyYXNoX3NpemU7Cj4+ICAJYm9vbCBoaWdoID0gZmFsc2U7Cj4+ICAJaW50IHJldDsKPj4gIAo+
PiBAQCAtMTA2LDExICsxMDYsMTIgQEAgc3RhdGljIHZvaWQgX19pbml0IGFyY2hfcmVzZXJ2ZV9j
cmFzaGtlcm5lbCh2b2lkKQo+PiAgCj4+ICAJcmV0ID0gcGFyc2VfY3Jhc2hrZXJuZWwoYm9vdF9j
b21tYW5kX2xpbmUsIG1lbWJsb2NrX3BoeXNfbWVtX3NpemUoKSwKPj4gIAkJCQkmY3Jhc2hfc2l6
ZSwgJmNyYXNoX2Jhc2UsCj4+IC0JCQkJJmxvd19zaXplLCBOVUxMLCAmaGlnaCk7Cj4+ICsJCQkJ
Jmxvd19zaXplLCAmY21hX3NpemUsICZoaWdoKTsKPj4gIAlpZiAocmV0KQo+PiAgCQlyZXR1cm47
Cj4+ICAKPj4gIAlyZXNlcnZlX2NyYXNoa2VybmVsX2dlbmVyaWMoY3Jhc2hfc2l6ZSwgY3Jhc2hf
YmFzZSwgbG93X3NpemUsIGhpZ2gpOwo+PiArCXJlc2VydmVfY3Jhc2hrZXJuZWxfY21hKGNtYV9z
aXplKTsKPj4gIH0KPj4gIAo+PiAgc3RhdGljIHBoeXNfYWRkcl90IF9faW5pdCBtYXhfem9uZV9w
aHlzKHBoeXNfYWRkcl90IHpvbmVfbGltaXQpCj4+IC0tIAo+PiAyLjM0LjEKPj4KPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
