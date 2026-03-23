Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED78EC01C9
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 11:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ar9Zu7keuzVU8FzJ0GST345M2O84xU+U9QkeohMiGcU=; b=IM+cq7FBUxYDwn
	wkaWjdhHaYJhL/U0tBVmWlufJRMOo87627T/lc25c0Q5Stwx1jwSqUkGzkcAUHxZQkdY3bofBW2O1
	dlFR0BVLJ2+YhZbcMEEk288wdbPYxV6ZHZnglHENoOyLYq82tiCE6xpqjDs50vFUOgZ+QC4IwG+8B
	UyoCTsq5zB1NZU4lKfi6bLGqB5tKad/Qavdt/aZr6+S2noW0U2VnWVZNtB3OOXBdTR36VQ3cZedcb
	acmVXW40Ichma4lVFbCEfw4RsOstSwhWaSgMp2rdBiUj/tSEb+0HpyRsFg2Gnc7juEKsqYs09B7Sw
	TWaZ05Cmcx/F6cxKAbBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dI9-0000000Gbsx-0Jk8;
	Mon, 23 Mar 2026 11:17:53 +0000
Received: from [113.46.200.224] (helo=canpmsgout09.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dI4-0000000GbrJ-18wh;
	Mon, 23 Mar 2026 11:17:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wSdOmMtQJa4WowpqlfcOJcehmFcXYtTS05KoePMKPVU=;
	b=WI3G5XBSvLw1Ei2KOl8bWUoPjcsVkaCWFhuxcWJmThK8RYco8rIJbvc4XJRxcYjdR3c6oop/z
	t3cQyEFjF4AU7xxJmO+zxXY1B8actvrXqxeVN6l+7rl7qve6RGVo3HX9lQ7j7A2FMHl37WUY9XJ
	2Tv/+h0JBqqA0gRXAB3ife0=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4ffVpy6zGtz1cyP0;
	Mon, 23 Mar 2026 19:11:22 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 8A58F4056C;
	Mon, 23 Mar 2026 19:17:26 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 23 Mar 2026 19:17:23 +0800
Message-ID: <a5694ee0-7a95-4c15-6775-990d70c8d77b@huawei.com>
Date: Mon, 23 Mar 2026 19:17:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9 4/5] arm64: kexec: Add support for crashkernel CMA
 reservation
Content-Language: en-US
To: Breno Leitao <leitao@debian.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <vgoyal@redhat.com>,
	<dyoung@redhat.com>, <rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <pawan.kumar.gupta@linux.intel.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <safinaskar@gmail.com>,
	<rppt@kernel.org>, <ardb@kernel.org>, <jbohac@suse.cz>, <cfsworks@gmail.com>,
	<osandov@fb.com>, <tangyouling@kylinos.cn>, <sourabhjain@linux.ibm.com>,
	<ritesh.list@gmail.com>, <eajames@linux.ibm.com>,
	<songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
	<samuel.holland@sifive.com>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <coxu@redhat.com>, <liaoyuanhong@vivo.com>,
	<fuqiang.wang@easystack.cn>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
References: <20260323072745.2481719-1-ruanjinjie@huawei.com>
 <20260323072745.2481719-5-ruanjinjie@huawei.com> <acETyW3FYaWCShUc@gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <acETyW3FYaWCShUc@gmail.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_041749_233728_FB35B9BD 
X-CRM114-Status: GOOD (  17.79  )
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

CgpPbiAyMDI2LzMvMjMgMTg6MjAsIEJyZW5vIExlaXRhbyB3cm90ZToKPiBPbiBNb24sIE1hciAy
MywgMjAyNiBhdCAwMzoyNzo0NFBNICswODAwLCBKaW5qaWUgUnVhbiB3cm90ZToKPj4gQ29tbWl0
IDM1YzE4ZjI5MzNjNSAoIkFkZCBhIG5ldyBvcHRpb25hbCAiLGNtYSIgc3VmZml4IHRvIHRoZQo+
PiBjcmFzaGtlcm5lbD0gY29tbWFuZCBsaW5lIG9wdGlvbiIpIGFuZCBjb21taXQgYWI0NzU1MTBl
MDQyICgia2R1bXA6Cj4+IGltcGxlbWVudCByZXNlcnZlX2NyYXNoa2VybmVsX2NtYSIpIGFkZGVk
IENNQSBzdXBwb3J0IGZvciBrZHVtcAo+PiBjcmFzaGtlcm5lbCByZXNlcnZhdGlvbi4KPj4KPj4g
Q3Jhc2gga2VybmVsIG1lbW9yeSByZXNlcnZhdGlvbiB3YXN0ZXMgcHJvZHVjdGlvbiByZXNvdXJj
ZXMgaWYgdG9vCj4+IGxhcmdlLCByaXNrcyBrZHVtcCBmYWlsdXJlIGlmIHRvbyBzbWFsbCwgYW5k
IGZhY2VzIGFsbG9jYXRpb24gZGlmZmljdWx0aWVzCj4+IG9uIGZyYWdtZW50ZWQgc3lzdGVtcyBk
dWUgdG8gY29udGlndW91cyBibG9jayBjb25zdHJhaW50cy4gVGhlIG5ldwo+PiBDTUEtYmFzZWQg
Y3Jhc2hrZXJuZWwgcmVzZXJ2YXRpb24gc2NoZW1lIHNwbGl0cyB0aGUgImxhcmdlIGZpeGVkCj4+
IHJlc2VydmF0aW9uIiBpbnRvIGEgInNtYWxsIGZpeGVkIHJlZ2lvbiArIGxhcmdlIENNQSBkeW5h
bWljIHJlZ2lvbiI6IHRoZQo+PiBDTUEgbWVtb3J5IGlzIGF2YWlsYWJsZSB0byB1c2Vyc3BhY2Ug
ZHVyaW5nIG5vcm1hbCBvcGVyYXRpb24gdG8gYXZvaWQKPj4gd2FzdGUsIGFuZCBpcyByZWNsYWlt
ZWQgZm9yIGtkdW1wIHVwb24gY3Jhc2jigJRzYXZpbmcgbWVtb3J5IHdoaWxlCj4+IGltcHJvdmlu
ZyByZWxpYWJpbGl0eS4KPj4KPj4gU28gZXh0ZW5kIGNyYXNoa2VybmVsIENNQSByZXNlcnZhdGlv
biBzdXBwb3J0IHRvIGFybTY0LiBUaGUgZm9sbG93aW5nCj4+IGNoYW5nZXMgYXJlIG1hZGUgdG8g
ZW5hYmxlIENNQSByZXNlcnZhdGlvbjoKPj4KPj4gLSBQYXJzZSBhbmQgb2J0YWluIHRoZSBDTUEg
cmVzZXJ2YXRpb24gc2l6ZSBhbG9uZyB3aXRoIG90aGVyIGNyYXNoa2VybmVsCj4+ICAgcGFyYW1l
dGVycy4KPj4gLSBDYWxsIHJlc2VydmVfY3Jhc2hrZXJuZWxfY21hKCkgdG8gYWxsb2NhdGUgdGhl
IENNQSByZWdpb24gZm9yIGtkdW1wLgo+PiAtIEluY2x1ZGUgdGhlIENNQS1yZXNlcnZlZCByYW5n
ZXMgZm9yIGtkdW1wIGtlcm5lbCB0byB1c2UuCj4+IC0gRXhjbHVkZSB0aGUgQ01BLXJlc2VydmVk
IHJhbmdlcyBmcm9tIHRoZSBjcmFzaCBrZXJuZWwgbWVtb3J5IHRvCj4+ICAgcHJldmVudCB0aGVt
IGZyb20gYmVpbmcgZXhwb3J0ZWQgdGhyb3VnaCAvcHJvYy92bWNvcmUsIHdoaWNoIGlzIGFscmVh
ZHkKPj4gICBkb25lIGluIHRoZSBjcmFzaCBjb3JlLgo+Pgo+PiBVcGRhdGUga2VybmVsLXBhcmFt
ZXRlcnMudHh0IHRvIGRvY3VtZW50IENNQSBzdXBwb3J0IGZvciBjcmFzaGtlcm5lbCBvbgo+PiBh
cm02NCBhcmNoaXRlY3R1cmUuCj4+Cj4+IEFja2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9i
aEBrZXJuZWwub3JnPgo+PiBBY2tlZC1ieTogQmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5jb20+Cj4+
IEFja2VkLWJ5OiBNaWtlIFJhcG9wb3J0IChNaWNyb3NvZnQpIDxycHB0QGtlcm5lbC5vcmc+Cj4+
IEFja2VkLWJ5OiBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPgo+PiBTaWduZWQtb2Zm
LWJ5OiBKaW5qaWUgUnVhbiA8cnVhbmppbmppZUBodWF3ZWkuY29tPgo+PiAtLS0KPj4gdjc6Cj4+
IC0gQ29ycmVjdCB0aGUgaW5jbHVzaW9uIG9mIENNQS1yZXNlcnZlZCByYW5nZXMgZm9yIGtkdW1w
Cj4+ICAga2VybmVsIGluIG9mL2tleGVjLgo+PiB2MzoKPj4gLSBBZGQgQWNrZWQtYnkuCj4+IHYy
Ogo+PiAtIEZyZWUgY21lbSBpbiBwcmVwYXJlX2VsZl9oZWFkZXJzKCkKPj4gLSBBZGQgdGhlIG10
aXZhdGlvbi4KPj4gLS0tCj4+ICBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJh
bWV0ZXJzLnR4dCB8IDIgKy0KPj4gIGFyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWNfZmls
ZS5jICAgICAgICAgIHwgMiArLQo+PiAgYXJjaC9hcm02NC9tbS9pbml0LmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCA1ICsrKy0tCj4+ICBkcml2ZXJzL29mL2ZkdC5jICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDkgKysrKystLS0tCj4+ICBkcml2ZXJzL29mL2tleGVjLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDkgKysrKysrKysrCj4+ICA1IGZpbGVzIGNo
YW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCBiL0RvY3Vt
ZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Cj4+IGluZGV4IGNiODUw
ZTUyOTBjMi4uYWZiMzExMjUxMGY3IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+PiBAQCAtMTEyMSw3ICsxMTIxLDcgQEAgS2Vy
bmVsIHBhcmFtZXRlcnMKPj4gIAkJCUl0IHdpbGwgYmUgaWdub3JlZCB3aGVuIGNyYXNoa2VybmVs
PVgsaGlnaCBpcyBub3QgdXNlZAo+PiAgCQkJb3IgbWVtb3J5IHJlc2VydmVkIGlzIGJlbG93IDRH
Lgo+PiAgCWNyYXNoa2VybmVsPXNpemVbS01HXSxjbWEKPj4gLQkJCVtLTkwsIFg4NiwgcHBjXSBS
ZXNlcnZlIGFkZGl0aW9uYWwgY3Jhc2gga2VybmVsIG1lbW9yeSBmcm9tCj4+ICsJCQlbS05MLCBY
ODYsIEFSTTY0LCBQUENdIFJlc2VydmUgYWRkaXRpb25hbCBjcmFzaCBrZXJuZWwgbWVtb3J5IGZy
b20KPj4gIAkJCUNNQS4gVGhpcyByZXNlcnZhdGlvbiBpcyB1c2FibGUgYnkgdGhlIGZpcnN0IHN5
c3RlbSdzCj4+ICAJCQl1c2Vyc3BhY2UgbWVtb3J5IGFuZCBrZXJuZWwgbW92YWJsZSBhbGxvY2F0
aW9ucyAobWVtb3J5Cj4+ICAJCQliYWxsb29uLCB6c3dhcCkuIFBhZ2VzIGFsbG9jYXRlZCBmcm9t
IHRoaXMgbWVtb3J5IHJhbmdlCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9tYWNo
aW5lX2tleGVjX2ZpbGUuYyBiL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5j
Cj4+IGluZGV4IGMzMzg1MDZhNTgwYi4uY2M1NzdkNzdkZjAwIDEwMDY0NAo+PiAtLS0gYS9hcmNo
L2FybTY0L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYwo+PiArKysgYi9hcmNoL2FybTY0L2tl
cm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYwo+PiBAQCAtNDIsNyArNDIsNyBAQCBpbnQgYXJjaF9r
aW1hZ2VfZmlsZV9wb3N0X2xvYWRfY2xlYW51cChzdHJ1Y3Qga2ltYWdlICppbWFnZSkKPj4gICNp
ZmRlZiBDT05GSUdfQ1JBU0hfRFVNUAo+PiAgdW5zaWduZWQgaW50IGFyY2hfZ2V0X3N5c3RlbV9u
cl9yYW5nZXModm9pZCkKPj4gIHsKPj4gLQl1bnNpZ25lZCBpbnQgbnJfcmFuZ2VzID0gMjsgLyog
Zm9yIGV4Y2x1c2lvbiBvZiBjcmFzaGtlcm5lbCByZWdpb24gKi8KPj4gKwl1bnNpZ25lZCBpbnQg
bnJfcmFuZ2VzID0gMiArIGNyYXNoa19jbWFfY250OyAvKiBmb3IgZXhjbHVzaW9uIG9mIGNyYXNo
a2VybmVsIHJlZ2lvbiAqLwo+IAo+IFlvdSB1cGRhdGUgYXJjaF9nZXRfc3lzdGVtX25yX3Jhbmdl
cygpIHRvIGFjY291bnQgZm9yIENNQSByYW5nZXMsIGJ1dAo+IHByZXBhcmVfZWxmX2hlYWRlcnMo
KSBpbiB0aGUgc2FtZSBmaWxlIChsaW5lIDUxKSBzdGlsbCBoYXMgdGhlCj4gaGFyZGNvZGVkOgo+
IAo+ICAgICAgICAgbnJfcmFuZ2VzID0gMjsgLyogZm9yIGV4Y2x1c2lvbiBvZiBjcmFzaGtlcm5l
bCByZWdpb24gKi8KCkkgZG9uJ3Qgc2VlIGFueSBsb2dpYyByZWxhdGVkIHRvIHByZXBhcmVfZWxm
X2hlYWRlcnMoKSBvciBoYXJkY29kZWQKbnJfcmFuZ2VzID0gMiBpbiB0aGUgYXJtNjQgaW1wbGVt
ZW50YXRpb24uCgpEaWQgSSBtaXNzIHNvbWV0aGluZyBoZXJlPwoKPiAKPiBhbmQgZG9lcyBub3Qg
ZXhjbHVkZSBDTUEgcmFuZ2VzIGZyb20gY21lbS4gSWYgdGhlIGdlbmVyaWMgY3Jhc2ggY29yZQo+
IGhhbmRsZXMgQ01BIGV4Y2x1c2lvbiBmcm9tIHZtY29yZSwgdGhlbiBzaG91bGRuJ3QKPiBhcmNo
X2dldF9zeXN0ZW1fbnJfcmFuZ2VzKCkgYWxzbyBub3QgbmVlZCB0aGlzIGNoYW5nZT8KPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
