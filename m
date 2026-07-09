Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34847C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 06:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmQ/LYu2wMq9tDk0nxaL8+N/+4ECj99D44s15TOUDt8=; b=pu/Yh8wLilbA/u
	bFzCBkh/F3ZUhl5jtFaP+xw0skagPM4SpOOpOvwb5+AKz9PlysyP0PBS1iS0kWUGfyA0sB3nELdfu
	T8xY3IaQRHidGJJZN56utEYRkmVoHpjrgR6h0KxxioZa92ujvL6BUp4ZTl8ZW8QvpE6WbRtCFVKR+
	PLEpOPi+KSrRVBRUxYoWq1hOmoNie1AfnuePKdAXd+V6Ep9piI86fOohS2hRs8lZ27GHss/KiOHzn
	SaG4FEf+k4l/7F9RRZ/QF7icdcnJppewf3BnKcxKiv/o8dZrcnqbT2uwakB1w9fcw0grNtA802kyc
	6mckRHSn3IBxfU6cOJ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiNr-00000001CDq-35tA;
	Thu, 09 Jul 2026 06:37:19 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiNo-00000001CCr-2slm;
	Thu, 09 Jul 2026 06:37:18 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nx9uTIIpEYlLKn/TlkCDaDRFao/mdFBZNp54PrQsjPw=;
	b=ktnvhwntGgaRfWEAoNl4nP/eMAv3WF40w6U+rHuISN9Agz4HcuqKVmp7oYolkH1rs7mUNfj74
	gCHhpWuGxUwoXRpbuDGJzqHbbuU4k1jP4vTX4mO+NAfGMKawslgm9u9z/t6vpBkLBD6GuiT0hg5
	ivGaNCxTDm241yTFRway9Ns=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gwlQL0MmWz1T4G2;
	Thu,  9 Jul 2026 14:28:10 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id ED73340579;
	Thu,  9 Jul 2026 14:37:11 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 9 Jul 2026 14:37:07 +0800
Message-ID: <21875fb4-434b-480d-b68b-e2ffd5fff5ae@huawei.com>
Date: Thu, 9 Jul 2026 14:37:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 18/18] arm64: vdso: Expose sigreturn address on vdso
 to the kernel
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
CC: <oleg@redhat.com>, <richard.henderson@linaro.org>, <mattst88@gmail.com>,
	<linmag7@gmail.com>, <linux@armlinux.org.uk>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <kees@kernel.org>, <guoren@kernel.org>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <geert@linux-m68k.org>,
	<tsbogend@alpha.franken.de>, <James.Bottomley@hansenpartnership.com>,
	<deller@gmx.de>, <maddy@linux.ibm.com>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>, <chleroy@kernel.org>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<hca@linux.ibm.com>, <gor@linux.ibm.com>, <agordeev@linux.ibm.com>,
	<borntraeger@linux.ibm.com>, <svens@linux.ibm.com>,
	<ysato@users.sourceforge.jp>, <dalias@libc.org>,
	<glaubitz@physik.fu-berlin.de>, <richard@nod.at>,
	<anton.ivanov@cambridgegreys.com>, <johannes@sipsolutions.net>,
	<luto@kernel.org>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <chris@zankel.net>,
	<jcmvbkbc@gmail.com>, <peterz@infradead.org>, <wad@chromium.org>,
	<thuth@redhat.com>, <mark.rutland@arm.com>, <ada.coupriediaz@arm.com>,
	<kevin.brodsky@arm.com>, <linusw@kernel.org>, <yeoreum.yun@arm.com>,
	<song@kernel.org>, <james.morse@arm.com>, <anshuman.khandual@arm.com>,
	<broonie@kernel.org>, <liqiang01@kylinos.cn>, <pengcan@kylinos.cn>,
	<ryan.roberts@arm.com>, <yangtiezhu@loongson.cn>, <sshegde@linux.ibm.com>,
	<mchauras@linux.ibm.com>, <austin.kim@lge.com>, <jchrist@linux.ibm.com>,
	<arnd@arndb.de>, <sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<jgross@suse.com>, <kas@kernel.org>, <x86@kernel.org>,
	<linux-alpha@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<linux-csky@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-m68k@lists.linux-m68k.org>, <linux-mips@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-sh@vger.kernel.org>, <linux-um@lists.infradead.org>
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
 <20260629130616.642022-19-ruanjinjie@huawei.com>
 <20260630172619-6c78c2e2-c2d3-44be-88e6-6c82de12baf4@linutronix.de>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260630172619-6c78c2e2-c2d3-44be-88e6-6c82de12baf4@linutronix.de>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_233717_042584_6B036310 
X-CRM114-Status: GOOD (  15.21  )
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

CgpPbiA2LzMwLzIwMjYgMTE6MzIgUE0sIFRob21hcyBXZWnDn3NjaHVoIHdyb3RlOgo+IE9uIE1v
biwgSnVuIDI5LCAyMDI2IGF0IDA5OjA2OjE2UE0gKzA4MDAsIEppbmppZSBSdWFuIHdyb3RlOgo+
PiBTeXNjYWxsIFVzZXIgRGlzcGF0Y2ggKFNVRCkgcmVxdWlyZXMgdGhlIHNpZ25hbCB0cmFtcG9s
aW5lIGNvZGUgdG8gbm90IGJlCj4+IGludGVyY2VwdGVkLiBUaGlzIGlzIG5lY2Vzc2FyeSB0byBz
dXBwb3J0IHJldHVybmluZyB3aXRoIGEgbG9ja2VkIHNlbGVjdG9yCj4+IHdoaWxlIGF2b2lkaW5n
IGluZmluaXRlIHJlY3Vyc2lvbiBiYWNrIGludG8gdGhlIHNpZ25hbCBoYW5kbGVyLgo+Pgo+PiBJ
bXBsZW1lbnQgYXJjaF9zeXNjYWxsX2lzX3Zkc29fc2lncmV0dXJuKCkgZm9yIGFybTY0IHRvIHN1
cHBvcnQgdGhpcwo+PiBleGNsdXNpb24gbWVjaGFuaXNtLiBGb3IgbmF0aXZlIDY0LWJpdCB0YXNr
cywgaXQgY2hlY2tzIHdoZXRoZXIgdGhlIGN1cnJlbnQKPj4gUEMgbWF0Y2hlcyB0aGUgJ3N2YyAj
MCcgaW5zdHJ1Y3Rpb24gaW5zaWRlIHRoZSB2RFNPIHNpZ3JldHVybiB0cmFtcG9saW5lLgo+Pgo+
PiAJU1lNX0NPREVfU1RBUlQoX19rZXJuZWxfcnRfc2lncmV0dXJuKQo+PiAJICAgICAgICBtb3Yg
ICAgIHg4LCAjX19OUl9ydF9zaWdyZXR1cm4KPj4gCSAgICAgICAgc3ZjICAgICAjMAo+PiAJU1lN
X0NPREVfRU5EKF9fa2VybmVsX3J0X3NpZ3JldHVybikKPj4KPj4gRm9yIENPTVBBVCB0YXNrcywg
aXQgdmVyaWZpZXMgaWYgdGhlIGluc3RydWN0aW9uIGZhbGxzIHdpdGhpbgo+PiB0aGUgYXJjaGl0
ZWN0dXJlJ3MgJ3NpZ3BhZ2UnIHJhbmdlLCBhbGxvd2luZyB0aGUga2VybmVsIHRvIHNhZmVseSBi
eXBhc3MKPj4gZGlzcGF0Y2hpbmcgc3lzY2FsbHMgb3JpZ2luYXRpbmcgZnJvbSB0aGVzZSBhcmVh
cyBiYWNrIHRvIHVzZXJzcGFjZS4KPj4KPj4gU3VnZ2VzdGVkLWJ5OiBLZXZpbiBCcm9kc2t5IDxr
ZXZpbi5icm9kc2t5QGFybS5jb20+Cj4+IFN1Z2dlc3RlZC1ieToga2VtYWwgPGttYWxAY29jay5s
aT4KPj4gU2lnbmVkLW9mZi1ieTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4K
Pj4gLS0tCj4+ICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2VsZi5oIHwgIDEgKwo+PiAgYXJjaC9h
cm02NC9rZXJuZWwvdmRzby5jICAgICB8IDE2ICsrKysrKysrKysrKysrKysKPj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9p
bmNsdWRlL2FzbS9lbGYuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vZWxmLmgKPj4gaW5kZXgg
ZDI3NzlkNjA0YzdiLi5mNDNkNGRlYTkxNmEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvaW5j
bHVkZS9hc20vZWxmLmgKPj4gKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9lbGYuaAo+PiBA
QCAtMTg1LDYgKzE4NSw3IEBAIGRvIHsJCQkJCQkJCQlcCj4+ICBzdHJ1Y3QgbGludXhfYmlucHJt
Owo+PiAgZXh0ZXJuIGludCBhcmNoX3NldHVwX2FkZGl0aW9uYWxfcGFnZXMoc3RydWN0IGxpbnV4
X2JpbnBybSAqYnBybSwKPj4gIAkJCQkgICAgICAgaW50IHVzZXNfaW50ZXJwKTsKPj4gK2V4dGVy
biBib29sIGFyY2hfc3lzY2FsbF9pc192ZHNvX3NpZ3JldHVybihzdHJ1Y3QgcHRfcmVncyAqcmVn
cyk7Cj4gCj4gQSBoZWFkZXIgZm9yIHRoYXQ/CgpTdXJlLCBpdCBuZWVkIGEgY2xlYW51cCwgYXMg
Y3VycmVudGx5LCB0aGVyZSBpcyBubyBzeXNjYWxsX3VzZXJfZGlzcGF0Y2gKaGVhZGVyIGZpbGUg
cmVsYXRlZCB0byB0aGUgYXJjaGl0ZWN0dXJlLgoKPiAKPj4gIC8qIDFHQiBvZiBWQSAqLwo+PiAg
I2lmZGVmIENPTkZJR19DT01QQVQKPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL3Zk
c28uYyBiL2FyY2gvYXJtNjQva2VybmVsL3Zkc28uYwo+PiBpbmRleCA1OTJkZDg2NjhkZTQuLjVh
MDMxNGEzYzI2ZSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvdmRzby5jCj4+ICsr
KyBiL2FyY2gvYXJtNjQva2VybmVsL3Zkc28uYwo+PiBAQCAtMzQzLDMgKzM0MywxOSBAQCBpbnQg
YXJjaF9zZXR1cF9hZGRpdGlvbmFsX3BhZ2VzKHN0cnVjdCBsaW51eF9iaW5wcm0gKmJwcm0sIGlu
dCB1c2VzX2ludGVycCkKPj4gIAo+PiAgCXJldHVybiByZXQ7Cj4+ICB9Cj4+ICsKPj4gK2Jvb2wg
YXJjaF9zeXNjYWxsX2lzX3Zkc29fc2lncmV0dXJuKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+PiAr
ewo+PiArCXVuc2lnbmVkIGxvbmcgc2lndHJhbXA7Cj4+ICsKPj4gKyNpZmRlZiBDT05GSUdfQ09N
UEFUCj4+ICsJaWYgKGlzX2NvbXBhdF90YXNrKCkpIHsKPj4gKwkJdW5zaWduZWQgbG9uZyBzaWdw
YWdlID0gKHVuc2lnbmVkIGxvbmcpY3VycmVudC0+bW0tPmNvbnRleHQuc2lncGFnZTsKPj4gKwo+
PiArCQlyZXR1cm4gcmVncy0+cGMgPj0gc2lncGFnZSAmJiByZWdzLT5wYyA8IChzaWdwYWdlICsg
UEFHRV9TSVpFKTsKPj4gKwl9Cj4+ICsjZW5kaWYKPj4gKwlzaWd0cmFtcCA9ICh1bnNpZ25lZCBs
b25nKVZEU09fU1lNQk9MKGN1cnJlbnQtPm1tLT5jb250ZXh0LnZkc28sIHNpZ3RyYW1wKTsKPj4g
Kwo+PiArCXJldHVybiByZWdzLT5wYyA9PSAoc2lndHJhbXAgKyA4KTsKPiAKPiBJbnN0ZWFkIG9m
IGhhcmRjb2RpbmcgJ3NpZ3RyYW1wICsgOCcgeW91IGNvdWxkIGFkZCBhIG5ldyBsYWJlbCB0byB0
aGUgJ3N2YyAjMCcKPiBpbnN0cnVjdGlvbiBhbmQgdXNlIHRoYXQgd2l0aCBWRFNPX1NZTUJPTCgp
LgoKSXQgc2VlbXMgdGhhdCB0aGUgbW9kaWZpY2F0aW9uIG9mIF9fa2VybmVsX3J0X3NpZ3JldHVy
bigpIGlzIG5vdCByZWNvbW1lbmRlZAoKPiAKPiAKPiBUaG9tYXMKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
