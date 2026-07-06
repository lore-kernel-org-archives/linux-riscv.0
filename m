Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A253C44500
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4SiX7YHUzjnVmd2We0KmQf02Gn5vcAvZIkL5ERjhaE=; b=P7UphV39c16RA8
	7QOYsId9PFnd9uUZ8ZY2nWrNtVbEMszpzK0UmPzCYZgU8yU837z6B+i96UKo/Mbxw9d9Rk8WbO1cv
	rBZRsdrEz/Q0tIHlQadWErthzN3Hwr2uERBlDBBiGQkn/LQZ4gQsTeEE1I3W8jkIg/z4AD0UXilni
	ZUd6IhpPt1Dbo/8LqTUYeot8eo4NGAAPs5VrMTG/EZMkOneD7FCsBnStS/LEArMqkye7+ZFzTtWuP
	zGomXw45ztJE7/TRE8k2Xt5H3n0sW0kU6BHOD500SK+yb2eLUisSBuSWCUndaCABu+PIWE+P7fAtA
	j42pOMmHTLCEGkePsbHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgZH6-0000000BPYT-2MKy;
	Mon, 06 Jul 2026 02:41:36 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgZH2-0000000BPX8-2j6i;
	Mon, 06 Jul 2026 02:41:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tLzU64zcWCpCqtKqdJfi72+8jOLqHwm6rAX9TlEnpBE=;
	b=6kW0tTks7I4JJHDfBVjF8dEaDL2J766PtNvpdA6LbQQFpMfTqMznvyBNQeh9wxbc/IYSzn3ZU
	f2djYQecToR3moTosPPfqQapkuoiHKQieMFK0sbmqWZPM62GXgOZ9REO2UonKr5TBLANxucel3h
	3onSIAA/PUlP2PaW4QIuLbU=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gtpKR1VVJzRhVJ;
	Mon,  6 Jul 2026 10:32:11 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 836134057A;
	Mon,  6 Jul 2026 10:41:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 6 Jul 2026 10:41:17 +0800
Message-ID: <e53b3d1f-c9fe-428c-bf1c-6505b3bcb894@huawei.com>
Date: Mon, 6 Jul 2026 10:41:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 01/18] seccomp: Convert __secure_computing() to return
 boolean
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
CC: <oleg@redhat.com>, <richard.henderson@linaro.org>, <mattst88@gmail.com>,
	<linmag7@gmail.com>, <linux@armlinux.org.uk>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <kees@kernel.org>, <guoren@kernel.org>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <geert@linux-m68k.org>,
	<tsbogend@alpha.franken.de>, <James.Bottomley@HansenPartnership.com>,
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
	<thuth@redhat.com>, <mark.rutland@arm.com>, <kevin.brodsky@arm.com>,
	<linusw@kernel.org>, <yeoreum.yun@arm.com>, <song@kernel.org>,
	<james.morse@arm.com>, <anshuman.khandual@arm.com>, <broonie@kernel.org>,
	<liqiang01@kylinos.cn>, <pengcan@kylinos.cn>, <ryan.roberts@arm.com>,
	<yangtiezhu@loongson.cn>, <sshegde@linux.ibm.com>, <mchauras@linux.ibm.com>,
	<austin.kim@lge.com>, <jchrist@linux.ibm.com>, <arnd@arndb.de>,
	<thomas.weissschuh@linutronix.de>, <sohil.mehta@intel.com>,
	<andrew.cooper3@citrix.com>, <jgross@suse.com>, <kas@kernel.org>,
	<x86@kernel.org>, <linux-alpha@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>, <linux-csky@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-m68k@lists.linux-m68k.org>,
	<linux-mips@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<linux-um@lists.infradead.org>
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
 <20260629130616.642022-2-ruanjinjie@huawei.com>
 <b8f3b5cd-8d8a-4396-ba0c-011a83234dd9@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <b8f3b5cd-8d8a-4396-ba0c-011a83234dd9@arm.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_194133_316719_F754E29D 
X-CRM114-Status: GOOD (  23.59  )
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

CgpPbiA3LzEvMjAyNiAxMjozNyBBTSwgQWRhIENvdXByaWUgRGlheiB3cm90ZToKPiBIaSBKaW5q
aWUsCj4gCj4gT24gMjkvMDYvMjAyNiAxNDowNSwgSmluamllIFJ1YW4gd3JvdGU6Cj4+IFRoZSBy
ZXR1cm4gdmFsdWUgb2YgX19zZWN1cmVfY29tcHV0aW5nKCkgY3VycmVudGx5IHVzZXMgMCB0byBp
bmRpY2F0ZQo+PiB0aGF0IGEgc3lzdGVtIGNhbGwgc2hvdWxkIGJlIGFsbG93ZWQsIGFuZCAtMSB0
byBpbmRpY2F0ZSB0aGF0IGl0IHNob3VsZAo+PiBiZSBibG9ja2VkL2tpbGxlZC4gVGhpcyAwLy0x
IHBhdHRlcm4gaXMgbm9uLWludHVpdGl2ZSBmb3IgYSBzZWN1cml0eQo+PiBjaGVjayBmdW5jdGlv
biBhbmQgbWFrZXMgdGhlIGNvbnRyb2wgZmxvdyBhdCB0aGUgY2FsbCBzaXRlcyBsZXNzCj4+IHJl
YWRhYmxlLgo+Pgo+PiBGdXJ0aGVybW9yZSwgYW55IHBvdGVudGlhbCBmdXR1cmUgY2hhbmdlcyB0
byB0aGVzZSByZXR1cm4gdmFsdWVzIHdvdWxkCj4+IHJlcXVpcmUgYSBoaWdoLXJpc2ssIGVycm9y
LXByb25lIGF1ZGl0IG9mIGFsbCBpdHMgdXNlcnMgYWNyb3NzIGRpZmZlcmVudAo+PiBhcmNoaXRl
Y3R1cmVzLgo+Pgo+PiBTYW5pdGl6ZSB0aGlzIGxvZ2ljIGJ5IGNvbnZlcnRpbmcgdGhlIHJldHVy
biB0eXBlIG9mIF9fc2VjdXJlX2NvbXB1dGluZygpCj4+IHRvIGEgcHJvcGVyIGJvb2xlYW4sIHdo
ZXJlICd0cnVlJyBleHBsaWNpdGx5IG1lYW5zICdhbGxvdycgYW5kICdmYWxzZScKPj4gbWVhbnMg
J2ZhaWwvZGVueScuCj4+Cj4+IFVwZGF0ZSBhbGwgdGhlIHR3byBkb3plbiBvciBzbyBjYWxsIHNp
dGVzIGFjcm9zcyB0aGUgdHJlZSB0byBhbGlnbiB3aXRoCj4+IHRoaXMgbmV3IGJvb2xlYW4gc2Vt
YW50aWMuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBhcmUgaW50ZW5kZWQsIGFzIHRoZQo+PiBjYWxs
ZXJzIHN0aWxsIHJldHVybiAtMSB0byB0aGUgbG93ZXItbGV2ZWwgYXNzZW1ibHkgZW50cnkgY29k
ZSB1cG9uCj4+IHNlY2NvbXAgZGVuaWFsLgo+IFdvdWxkIGl0IGJlIHJlbGV2YW50IHRvIG1lbnRp
b24gdGhhdCB0aGlzIGZpeGVzIHRoZSB1bnNvdW5kIHJldHVybiB2YWx1ZSBvZgo+IGBzeXNjYWxs
X3RyYWNlX2VudGVyKClgIGluIGdlbmVyaWMgZW50cnksIHdoaWNoIG1vdGl2YXRlZCB0aGUgcGF0
Y2gKPiBpbml0aWFsbHlbMF0gPwoKVGhhdCdzIGEgdmVyeSBnb29kIHBvaW50LiBJdCdzIGRlZmlu
aXRlbHkgd29ydGggbWVudGlvbmluZwoKPj4gU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgR2xlaXhuZXIg
PHRnbHhAa2VybmVsLm9yZz4KPj4gU2lnbmVkLW9mZi1ieTogSmluamllIFJ1YW4gPHJ1YW5qaW5q
aWVAaHVhd2VpLmNvbT4KPj4gLS0tCj4+IMKgIGFyY2gvYWxwaGEva2VybmVsL3B0cmFjZS5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+PiDCoCBhcmNoL2FybS9rZXJuZWwvcHRyYWNl
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+PiDCoCBhcmNoL2FybTY0L2tl
cm5lbC9wdHJhY2UuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPj4gwqAgYXJjaC9j
c2t5L2tlcm5lbC9wdHJhY2UuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+PiDC
oCBhcmNoL202OGsva2VybmVsL3B0cmFjZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAy
ICstCj4+IMKgIGFyY2gvbWlwcy9rZXJuZWwvcHRyYWNlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDIgKy0KPj4gwqAgYXJjaC9wYXJpc2Mva2VybmVsL3B0cmFjZS5jwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDIgKy0KPj4gwqAgYXJjaC9zaC9rZXJuZWwvcHRyYWNlXzMyLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4+IMKgIGFyY2gvdW0va2VybmVsL3NrYXMvc3lzY2Fs
bC5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+PiDCoCBhcmNoL3g4Ni9lbnRyeS92c3lzY2Fs
bC92c3lzY2FsbF82NC5jIHzCoCAyICstCj4+IMKgIGFyY2gveHRlbnNhL2tlcm5lbC9wdHJhY2Uu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICstLQo+PiDCoCBpbmNsdWRlL2xpbnV4L2VudHJ5
LWNvbW1vbi5owqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA3ICsrKy0tLQo+PiDCoCBpbmNsdWRlL2xp
bnV4L3NlY2NvbXAuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMCArKysrLS0tLQo+
PiDCoCBrZXJuZWwvc2VjY29tcC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgMzQgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4+IMKgIDE0IGZpbGVzIGNo
YW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygtKQo+IAo+IFRoaXMgaXMgbWlz
c2luZyBhbiB1cGRhdGUgdG8gdGhlIEtjb25maWcgZG9jdW1lbnRhdGlvbiwgYSBwb3NzaWJsZQo+
IHN1Z2dlc3Rpb24gOgoKV2lsbCB1cGRhdGUgaXQuCgo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL0tj
b25maWcgYi9hcmNoL0tjb25maWcKPiBpbmRleCBmYTc1MDdhYzhlMTMuLjllM2Q0MDA4OGFmYiAx
MDA2NDQKPiAtLS0gYS9hcmNoL0tjb25maWcKPiArKysgYi9hcmNoL0tjb25maWcKPiBAQCAtNjM3
LDcgKzYzNyw3IEBAIGNvbmZpZyBIQVZFX0FSQ0hfU0VDQ09NUF9GSUxURVIKPiDCoMKgwqDCoMKg
wqDCoMKgwqAgLSBzeXNjYWxsX3NldF9yZXR1cm5fdmFsdWUoKQo+IMKgwqDCoMKgwqDCoMKgwqDC
oCAtIFNJR1NZUyBzaWdpbmZvX3Qgc3VwcG9ydAo+IMKgwqDCoMKgwqDCoMKgwqDCoCAtIHNlY3Vy
ZV9jb21wdXRpbmcgaXMgY2FsbGVkIGZyb20gYSBwdHJhY2VfZXZlbnQoKS1zYWZlIGNvbnRleHQK
PiAtwqDCoMKgwqDCoMKgwqDCoCAtIHNlY3VyZV9jb21wdXRpbmcgcmV0dXJuIHZhbHVlIGlzIGNo
ZWNrZWQgYW5kIGEgcmV0dXJuIHZhbHVlCj4gb2YgLTEKPiArwqDCoMKgwqDCoMKgwqDCoCAtIHNl
Y3VyZV9jb21wdXRpbmcgcmV0dXJuIHZhbHVlIGlzIGNoZWNrZWQgYW5kIGlmIGZhbHNlCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXN1bHRzIGluIHRoZSBzeXN0ZW0gY2FsbCBiZWluZyBza2lw
cGVkIGltbWVkaWF0ZWx5Lgo+IMKgwqDCoMKgwqDCoMKgwqDCoCAtIHNlY2NvbXAgc3lzY2FsbCB3
aXJlZCB1cAo+IMKgwqDCoMKgwqDCoMKgwqDCoCAtIGlmICFIQVZFX1NQQVJTRV9TWVNDQUxMX05S
LCBoYXZlIFNFQ0NPTVBfQVJDSF9OQVRJVkUsCj4gCj4+IFsuLi5dCj4+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L2VudHJ5LWNvbW1vbi5oIGIvaW5jbHVkZS9saW51eC9lbnRyeS1jb21tb24u
aAo+PiBpbmRleCA0MTZhMzM1MjI2MWYuLjNmNjYzMjBlNDZkMyAxMDA2NDQKPj4gLS0tIGEvaW5j
bHVkZS9saW51eC9lbnRyeS1jb21tb24uaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L2VudHJ5LWNv
bW1vbi5oCj4+IEBAIC0xMDAsOSArMTAwLDggQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBsb25n
Cj4+IHN5c2NhbGxfdHJhY2VfZW50ZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGwK
Pj4gwqAgwqDCoMKgwqDCoCAvKiBEbyBzZWNjb21wIGFmdGVyIHB0cmFjZSwgdG8gY2F0Y2ggYW55
IHRyYWNlciBjaGFuZ2VzLiAqLwo+PiDCoMKgwqDCoMKgIGlmICh3b3JrICYgU1lTQ0FMTF9XT1JL
X1NFQ0NPTVApIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IF9fc2VjdXJlX2NvbXB1dGluZygp
Owo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKHJldCA9PSAtMUwpCj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiByZXQ7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIV9fc2VjdXJlX2NvbXB1
dGluZygpKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLTFMOwo+PiDCoMKgwqDC
oMKgIH0KPj4gwqAgwqDCoMKgwqDCoCAvKiBFaXRoZXIgb2YgdGhlIGFib3ZlIG1pZ2h0IGhhdmUg
Y2hhbmdlZCB0aGUgc3lzY2FsbCBudW1iZXIgKi8KPj4gQEAgLTExMyw3ICsxMTIsNyBAQCBzdGF0
aWMgX19hbHdheXNfaW5saW5lIGxvbmcKPj4gc3lzY2FsbF90cmFjZV9lbnRlcihzdHJ1Y3QgcHRf
cmVncyAqcmVncywgdW5zaWduZWQgbAo+PiDCoCDCoMKgwqDCoMKgIHN5c2NhbGxfZW50ZXJfYXVk
aXQocmVncywgc3lzY2FsbCk7Cj4+IMKgIC3CoMKgwqAgcmV0dXJuIHJldCA/IDogc3lzY2FsbDsK
Pj4gK8KgwqDCoCByZXR1cm4gc3lzY2FsbDsKPj4gwqAgfQo+PiBbLi4uXQo+IAo+IE90aGVyd2lz
ZSB0aGlzIGZlZWxzIGxpa2UgYSBtb3JlIGFwcHJvcHJpYXRlIGNoYW5nZSB3aXRoIHJlZ2FyZHMg
dG8KPiAic2FmZWd1YXJkaW5nIGFnYWluc3QgbmV3IGBzZWN1cmVfY29tcHV0aW5nKClgIHJldHVy
biB2YWx1ZSIgIQo+IAo+IFdpdGggdGhlIHVwZGF0ZWQgS2NvbmZpZyA6Cj4gUmV2aWV3ZWQtYnk6
IEFkYSBDb3VwcmllIERpYXogPGFkYS5jb3VwcmllZGlhekBhcm0uY29tPgo+IAo+IFRoYW5rcywK
PiBBZGEKPiAKPiBbMF06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA1MTEwOTIxMDMu
MTk3NDk4MC0yLQo+IHJ1YW5qaW5qaWVAaHVhd2VpLmNvbQo+IAo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
