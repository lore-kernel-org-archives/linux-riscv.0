Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ABDEA795C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 03:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bsz9KH8FtOaTtpkpLFF4opAXmKfb21AGYRRcIgebFLw=; b=duf2ImONE8/lF7
	JwS8uUFu8GopTNXyP6HStyy+2e7iTnbZuf/LJ8J7ZfzqtGMusJZ55JUYZoOZ/XdEfU2TYdPJuGacj
	2ECsHNhH1KIDTUV9w9pa4C4UhR4X7lDEKbr3hXl9cYWVriU1old3GVj7xkBh9OkwWQm1Fa7Yc/CuU
	bz/1JVWyMgYvNksqQddf7aZI4Fy/hxNFBOApgWj5Jy59pSply3YdtBfEf/Qh+0Vjwybn/dnkCt785
	RzXzrei+SxlvVEZitq1he9/6LKPVnLWzLnLdgIF0wSD+7ePpiZbDDJjL/jmzc9YgnCZcJUqIhi8Fl
	zM+c0I1ggEZBerIZXRuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnpqU-00000009M2w-1Xrg;
	Thu, 05 Feb 2026 03:15:54 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnpqQ-00000009M2O-0b7l;
	Thu, 05 Feb 2026 03:15:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=m0YhAEtCzGzoYGvZg42KcYgs+OHxXA5AmpEhewJRkE0=;
	b=mrg81Ley9PfGVLZQRfso+yz1ManXQbV+PfgxLEEqszlmqVu7nf5ibUS3D3jz2hxv4nVKl3Pxy
	u1f26cRtxz6qdg+Sa5H47rkNKtSL2+fw1FqsGBvUi1egGqaUWoOeHZW1xEPRfIPMfxyDybkK+me
	y6AzQqnzHgyAcWGTJDZFXnA=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4f62L33nmhz1prQr;
	Thu,  5 Feb 2026 11:11:07 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A0B3540561;
	Thu,  5 Feb 2026 11:15:44 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 5 Feb 2026 11:15:41 +0800
Message-ID: <113f1d02-69df-b28e-edb9-514d284c6b29@huawei.com>
Date: Thu, 5 Feb 2026 11:15:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 1/3] crash: Exclude crash kernel memory in crash core
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, <corbet@lwn.net>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <chenhuacai@kernel.org>,
	<kernel@xen0n.name>, <maddy@linux.ibm.com>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>, <chleroy@kernel.org>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<bhe@redhat.com>, <vgoyal@redhat.com>, <dyoung@redhat.com>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<kees@kernel.org>, <elver@google.com>, <arnd@arndb.de>,
	<lirongqing@baidu.com>, <fvdl@google.com>, <leitao@debian.org>,
	<rppt@kernel.org>, <cfsworks@gmail.com>, <osandov@fb.com>, <ardb@kernel.org>,
	<ryan.roberts@arm.com>, <tangyouling@kylinos.cn>, <ritesh.list@gmail.com>,
	<bjorn@rivosinc.com>, <songshuaishuai@tinylab.org>,
	<samuel.holland@sifive.com>, <kevin.brodsky@arm.com>,
	<junhui.liu@pigmoral.tech>, <vishal.moola@gmail.com>, <coxu@redhat.com>,
	<jbohac@suse.cz>, <liaoyuanhong@vivo.com>, <brgerst@gmail.com>,
	<fuqiang.wang@easystack.cn>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
References: <20260204093728.1447527-1-ruanjinjie@huawei.com>
 <20260204093728.1447527-2-ruanjinjie@huawei.com>
 <4dc944c7-20ad-4e92-b05e-28a9e0c5a2b8@linux.ibm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <4dc944c7-20ad-4e92-b05e-28a9e0c5a2b8@linux.ibm.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_191551_056511_2B3DD426 
X-CRM114-Status: GOOD (  24.73  )
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

CgpPbiAyMDI2LzIvNCAyMDozMiwgU291cmFiaCBKYWluIHdyb3RlOgo+IAo+IAo+IE9uIDA0LzAy
LzI2IDE1OjA3LCBKaW5qaWUgUnVhbiB3cm90ZToKPj4gVGhlIGV4Y2x1ZGUgb2YgY3Jhc2hrX3Jl
cywgY3Jhc2hrX2xvd19yZXMgYW5kIGNyYXNoa19jbWEgbWVtb3J5Cj4+IGFyZSBhbG1vc3QgaWRl
bnRpY2FsIGFjcm9zcyBkaWZmZXJlbnQgYXJjaGl0ZWN0dXJlcywgc28gaGFuZGxpbmcgdGhlbQo+
PiBpbiB0aGUgY3Jhc2ggY29yZSB3b3VsZCBlbGltaW5hdGUgYSBsb3Qgb2YgZHVwbGljYXRpb24s
IHNvIGRvCj4+IHRoZW0gaW4gdGhlIGNvbW1vbiBjb2RlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBK
aW5qaWUgUnVhbiA8cnVhbmppbmppZUBodWF3ZWkuY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9hcm02
NC9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmPCoMKgwqDCoCB8IDEyIC0tLS0tLS0KPj4gwqAg
YXJjaC9sb29uZ2FyY2gva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jIHwgMTIgLS0tLS0tLQo+
PiDCoCBhcmNoL3Bvd2VycGMva2V4ZWMvcmFuZ2VzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAxNiArKy0tLS0tLS0KPj4gwqAgYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhl
Y19maWxlLmPCoMKgwqDCoCB8wqAgNSArLS0KPj4gwqAgYXJjaC94ODYva2VybmVsL2NyYXNoLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDM5ICsrLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPj4gwqAga2VybmVsL2NyYXNoX2NvcmUuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyOCArKysrKysrKysrKysrKysrCj4+IMKgIDYgZmls
ZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgNzggZGVsZXRpb25zKC0pCj4+CgpbLi4uXQoK
Pj4gLXN0YXRpYyBpbnQgY3Jhc2hfZXhjbHVkZV9tZW1fcmFuZ2VfZ3VhcmRlZChzdHJ1Y3QgY3Jh
c2hfbWVtCj4+ICoqbWVtX3JhbmdlcywKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgbG9uZyBtc3RhcnQsCj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGxvbmcgbWVu
ZCkKPj4gK3N0YXRpYyBpbnQgY3Jhc2hfcmVhbGxvY19tZW1fcmFuZ2VfZ3VhcmRlZChzdHJ1Y3Qg
Y3Jhc2hfbWVtCj4+ICoqbWVtX3JhbmdlcykKPj4gwqAgewo+PiDCoMKgwqDCoMKgIHN0cnVjdCBj
cmFzaF9tZW0gKnRtZW0gPSAqbWVtX3JhbmdlczsKPj4gwqAgQEAgLTU2Niw3ICs1NjQsNyBAQCBz
dGF0aWMgaW50Cj4+IGNyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlX2d1YXJkZWQoc3RydWN0IGNyYXNo
X21lbSAqKm1lbV9yYW5nZXMsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAt
RU5PTUVNOwo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgLcKgwqDCoCByZXR1cm4gY3Jhc2hfZXhjbHVk
ZV9tZW1fcmFuZ2UodG1lbSwgbXN0YXJ0LCBtZW5kKTsKPj4gK8KgwqDCoCByZXR1cm4gMDsKPj4g
wqAgfQo+PiDCoCDCoCAvKioKPj4gQEAgLTYwNCwxOCArNjAyLDEwIEBAIGludCBnZXRfY3Jhc2hf
bWVtb3J5X3JhbmdlcyhzdHJ1Y3QgY3Jhc2hfbWVtCj4+ICoqbWVtX3JhbmdlcykKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc29ydF9tZW1vcnlfcmFuZ2VzKCptZW1fcmFuZ2VzLCB0cnVl
KTsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgIC3CoMKgwqAgLyogRXhjbHVkZSBjcmFzaGtlcm5lbCBy
ZWdpb24gKi8KPj4gLcKgwqDCoCByZXQgPSBjcmFzaF9leGNsdWRlX21lbV9yYW5nZV9ndWFyZGVk
KG1lbV9yYW5nZXMsCj4+IGNyYXNoa19yZXMuc3RhcnQsIGNyYXNoa19yZXMuZW5kKTsKPj4gK8Kg
wqDCoCByZXQgPSBjcmFzaF9yZWFsbG9jX21lbV9yYW5nZV9ndWFyZGVkKG1lbV9yYW5nZXMpOwo+
IAo+IFdoYXQgaWYgbWF4X25yX3JhbmdlcyAtIG5yX3JhbmdlcyA9IDEsIHRoZW4gbm8gcmVhbGxv
YyB3aWxsIGhhcHBlbiBoZXJlLgo+IEFuZCBpbgo+IGVsZl9oZWFkZXJfZXhjbHVkZV9yYW5nZXMg
d2UgbWF5IG5vdCBlbm91Z2ggc3BhY2UgdG8gc3RvcmUgYWRkaXRpb25hbAo+IG1lbW9yeSByYW5n
ZXMgbmVlZGVkIHdoaWxlIGV4Y2x1ZGluZyBvbmUgb3IgbW9yZSBDTUEgcmFuZ2VzLgoKWW91J3Jl
IGFic29sdXRlbHkgcmlnaHQg4oCUIGlmIG1heF9ucl9yYW5nZXMgLSBucl9yYW5nZXMgPT0gMSB3
ZSBza2lwIHRoZQpyZWFsbG9jLCB5ZXQgZWxmX2hlYWRlcl9leGNsdWRlX3JhbmdlcygpIGNhbiBl
YXNpbHkgbmVlZCBtb3JlIHRoYW4gb25lCmV4dHJhIHNsb3QuCgpUaGFua3MgZm9yIGNhdGNoaW5n
IHRoaXMuCkppbmppZQoKPiAKPj4gwqDCoMKgwqDCoCBpZiAocmV0KQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgZ290byBvdXQ7Cj4+IMKgIC3CoMKgwqAgZm9yIChpID0gMDsgaSA8IGNyYXNoa19jbWFf
Y250OyArK2kpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IGNyYXNoX2V4Y2x1ZGVfbWVtX3Jh
bmdlX2d1YXJkZWQobWVtX3JhbmdlcywKPj4gY3Jhc2hrX2NtYV9yYW5nZXNbaV0uc3RhcnQsCj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjcmFz
aGtfY21hX3Jhbmdlc1tpXS5lbmQpOwo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4+IC3CoMKgwqAgfQo+PiAtCj4+IMKgwqDC
oMKgwqAgLyoKPj4gwqDCoMKgwqDCoMKgICogRklYTUU6IEZvciBub3csIHN0YXkgaW4gcGFyaXR5
IHdpdGgga2V4ZWMtdG9vbHMgYnV0IGlmIFJUQVMvT1BBTAo+PiDCoMKgwqDCoMKgwqAgKsKgwqDC
oMKgwqDCoMKgIHJlZ2lvbnMgYXJlIGV4cG9ydGVkIHRvIHNhdmUgdGhlaXIgY29udGV4dCBhdCB0
aGUgdGltZSBvZgoKWy4uLl0KCj4+IMKgICtzdGF0aWMgaW50IGNyYXNoX2V4Y2x1ZGVfbWVtX3Jh
bmdlcyhzdHJ1Y3QgY3Jhc2hfbWVtICpjbWVtKQo+PiArewo+PiArwqDCoMKgIGludCByZXQsIGk7
Cj4+ICsKPj4gK8KgwqDCoCAvKiBFeGNsdWRlIGNyYXNoa2VybmVsIHJlZ2lvbiAqLwo+PiArwqDC
oMKgIHJldCA9IGNyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlKGNtZW0sIGNyYXNoa19yZXMuc3RhcnQs
Cj4+IGNyYXNoa19yZXMuZW5kKTsKPj4gK8KgwqDCoCBpZiAocmV0KQo+PiArwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIHJldDsKPj4gKwo+PiArwqDCoMKgIGlmIChjcmFzaGtfbG93X3Jlcy5lbmQpIHsK
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IGNyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlKGNtZW0sIGNy
YXNoa19sb3dfcmVzLnN0YXJ0LAo+PiBjcmFzaGtfbG93X3Jlcy5lbmQpOwo+PiArwqDCoMKgwqDC
oMKgwqAgaWYgKHJldCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4g
K8KgwqDCoCB9Cj4+IMKgICvCoMKgwqAgZm9yIChpID0gMDsgaSA8IGNyYXNoa19jbWFfY250OyAr
K2kpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IGNyYXNoX2V4Y2x1ZGVfbWVtX3JhbmdlKGNt
ZW0sIGNyYXNoa19jbWFfcmFuZ2VzW2ldLnN0YXJ0LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3Jhc2hrX2NtYV9yYW5nZXNbaV0uZW5kKTsK
Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiByZXQ7Cj4+ICvCoMKgwqAgfQo+PiDCoCArwqDCoMKgIHJldHVybiByZXQ7Cj4+ICt9Cj4+
IMKgIMKgIGludCBjcmFzaF9wcmVwYXJlX2VsZjY0X2hlYWRlcnMoc3RydWN0IGNyYXNoX21lbSAq
bWVtLCBpbnQKPj4gbmVlZF9rZXJuZWxfbWFwLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdm9pZCAqKmFkZHIsIHVuc2lnbmVkIGxvbmcgKnN6KQo+PiBAQCAtMTc0LDYgKzE5Nywx
MSBAQCBpbnQgY3Jhc2hfcHJlcGFyZV9lbGY2NF9oZWFkZXJzKHN0cnVjdCBjcmFzaF9tZW0KPj4g
Km1lbSwgaW50IG5lZWRfa2VybmVsX21hcCwKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgY3B1
LCBpOwo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgbG9uZyBub3Rlc19hZGRyOwo+PiDCoMKg
wqDCoMKgIHVuc2lnbmVkIGxvbmcgbXN0YXJ0LCBtZW5kOwo+PiArwqDCoMKgIGludCByZXQ7Cj4+
ICsKPj4gK8KgwqDCoCByZXQgPSBjcmFzaF9leGNsdWRlX21lbV9yYW5nZXMobWVtKTsKPiAKPiBJ
IHRoaW5rIHRoZSBhc3N1bXB0aW9uIGhlcmUgaXMgdGhhdCBtZW0gc2hvdWxkIGhhdmUgZW5vdWdo
IHNwYWNlCj4gdG8gaG9sZCB0aGUgZXh0cmEgcmFuZ2VzIGNyZWF0ZWQgd2hpbGUgZXhjbHVkaW5n
IGNyYXNoIG1lbW9yeSByYW5nZXMuCj4gUmlnaHQgbm93LCB0aGlzIGlzIG5vdCBoYXBwZW5pbmcg
b24gcG93ZXJwYyBmb3IgdGhlIGNhc2UgSSBtZW50aW9uZWQKPiBpbiB0aGUgYWJvdmUgY29tbWVu
dC4KClllcywgYXMgeW91IG1lbnRpb25lZCBhYm92ZS4KCj4gCj4gQWxzbywgaWYgY3Jhc2hrX2Nt
YV9jbnQgY2hhbmdlcyBpbiB0aGUgZnV0dXJlLCBvciBpZiBhIG5ldyB0eXBlIG9mCj4gY3Jhc2gg
bWVtb3J5IGlzIGFkZGVkLCB0aGVuIGV2ZXJ5IGFyY2hpdGVjdHVyZSB3b3VsZCBuZWVkIHRvIGFk
anVzdAo+IHRoZSBtZW0gYWxsb2NhdGlvbiBhY2NvcmRpbmdseS4gSW5zdGVhZCwgY291bGQgd2Ug
aGFuZGxlIHRoaXMgaW4KPiBnZW5lcmljIGNvZGUgcmF0aGVyIHRoYW4gaW4gYXJjaGl0ZWN0dXJl
LXNwZWNpZmljIGNvZGUsIHNvIHRoYXQgd2UKPiBhbHdheXMgZW5zdXJlIG1lbSBoYXMgZW5vdWdo
IHNwYWNlPwoKSSBhZ3JlZSDigJQgaGFyZC1jb2RpbmcgdGhlIHdvcnN0LWNhc2UgY291bnQgaW4g
ZXZlcnkgYXJjaCBpcyBhCm1haW50ZW5hbmNlIHRyYXAuCkxldCdzIG1vdmUgdGhlIHNpemUgY2Fs
Y3VsYXRpb24gKGFuZCB0aGUgcmVhbGxvYyBpZiBuZWVkZWQpIGludG8gdGhlCmdlbmVyaWMgY3Jh
c2ggY29yZSBzbyB0aGF0OgoKLSBOZXcgQ01BIHJlZ2lvbnMgb3IgZnV0dXJlIGNyYXNoLW1lbW9y
eSB0eXBlcyBhcmUgYXV0b21hdGljYWxseQphY2NvdW50ZWQgZm9yOwoKLSBFYWNoIGFyY2hpdGVj
dHVyZSBubyBsb25nZXIgaGFzIHRvIHBsYXkgd2hhY2stYS1tb2xlIHdpdGggaXRzIHByaXZhdGUK
YXJyYXkgc2l6ZS4KClRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uCgo+IAo+PiArwqDCoMKgIGlm
IChyZXQpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiDCoCDCoMKgwqDCoMKgIC8q
IGV4dHJhIHBoZHIgZm9yIHZtY29yZWluZm8gRUxGIG5vdGUgKi8KPj4gwqDCoMKgwqDCoCBucl9w
aGRyID0gbnJfY3B1cyArIDE7Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
