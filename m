Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78454C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 08:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFpjmBu0WbAYYuloPFWFGCc7RjzZaRdLjNJc5v0aJwg=; b=Jvio1wjy0deIg2
	mWTNYKyIrtJyZRiYdk6ILaClda89y2cQqxw0rkVtInIxGm4LWpWnEYx+hWhaxJnYnsJu1MtOVNPWn
	1alsMuHuaEKKn/xtTT2TnkoqGPahFmkbdOsK4al37lkdh1XVNf8V+2cjmdz/uYBlH3RUiLw1z4BQO
	PXJ6ceSMu8aBXcslr2QRK4BonbnSxxFMBvzZWZyZk8Q6sUYaRWopydNos+TJebCeys8IBbtNImLRY
	r3GXHvz/vo4FeWGYuNLZQdv/k651IbMfDKL0Pvya8srFXv9TQ3eGWGTGB3vLoEz9LFhLWzAQo/su3
	4YeEIRkI3bluYHgjawYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjux-00000001OQV-15SL;
	Thu, 09 Jul 2026 08:15:35 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjus-00000001OPW-1Sii;
	Thu, 09 Jul 2026 08:15:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=48+51s385OsDhp5N7LQ5qHC6FAjEEUm6ed4fMfXeBFY=;
	b=kCxesqoZlJiDDihnZyAzF5o6+WjRbCD++5bvCV+W0tELEqX7VwTIDS62IobikU82bv7sl8+Y1
	2yCD+9ZYiDHYfjsAjS3Zn9Bd2SI2V6mn7KdFbxeGgCuBgK5A7WIPxe6IBYKwyHnFX9K58lcg3UM
	OCKTRSDGklsZpCIPJLCzdso=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gwnbX6pZrzcbR0;
	Thu,  9 Jul 2026 16:06:16 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id CC36D40561;
	Thu,  9 Jul 2026 16:15:21 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 9 Jul 2026 16:15:16 +0800
Message-ID: <d9c9686c-dfd8-4539-b301-8726bab7443b@huawei.com>
Date: Thu, 9 Jul 2026 16:15:15 +0800
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
 <21875fb4-434b-480d-b68b-e2ffd5fff5ae@huawei.com>
 <20260709090525-b1e5ae06-1fb4-454e-919c-6503dcf3d073@linutronix.de>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709090525-b1e5ae06-1fb4-454e-919c-6503dcf3d073@linutronix.de>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_011531_006245_10C0345D 
X-CRM114-Status: GOOD (  16.14  )
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

CgpPbiA3LzkvMjAyNiAzOjE3IFBNLCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToKPiBPbiBUaHUs
IEp1bCAwOSwgMjAyNiBhdCAwMjozNzowNVBNICswODAwLCBKaW5qaWUgUnVhbiB3cm90ZToKPj4g
T24gNi8zMC8yMDI2IDExOjMyIFBNLCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToKPj4+IE9uIE1v
biwgSnVuIDI5LCAyMDI2IGF0IDA5OjA2OjE2UE0gKzA4MDAsIEppbmppZSBSdWFuIHdyb3RlOgo+
ICguLikKPiAKPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9rZXJuZWwvdmRzby5jIGIvYXJj
aC9hcm02NC9rZXJuZWwvdmRzby5jCj4+Pj4gaW5kZXggNTkyZGQ4NjY4ZGU0Li41YTAzMTRhM2My
NmUgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvdmRzby5jCj4+Pj4gKysrIGIv
YXJjaC9hcm02NC9rZXJuZWwvdmRzby5jCj4+Pj4gQEAgLTM0MywzICszNDMsMTkgQEAgaW50IGFy
Y2hfc2V0dXBfYWRkaXRpb25hbF9wYWdlcyhzdHJ1Y3QgbGludXhfYmlucHJtICpicHJtLCBpbnQg
dXNlc19pbnRlcnApCj4+Pj4gIAo+Pj4+ICAJcmV0dXJuIHJldDsKPj4+PiAgfQo+Pj4+ICsKPj4+
PiArYm9vbCBhcmNoX3N5c2NhbGxfaXNfdmRzb19zaWdyZXR1cm4oc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCj4+Pj4gK3sKPj4+PiArCXVuc2lnbmVkIGxvbmcgc2lndHJhbXA7Cj4+Pj4gKwo+Pj4+ICsj
aWZkZWYgQ09ORklHX0NPTVBBVAo+Pj4+ICsJaWYgKGlzX2NvbXBhdF90YXNrKCkpIHsKPj4+PiAr
CQl1bnNpZ25lZCBsb25nIHNpZ3BhZ2UgPSAodW5zaWduZWQgbG9uZyljdXJyZW50LT5tbS0+Y29u
dGV4dC5zaWdwYWdlOwo+Pj4+ICsKPj4+PiArCQlyZXR1cm4gcmVncy0+cGMgPj0gc2lncGFnZSAm
JiByZWdzLT5wYyA8IChzaWdwYWdlICsgUEFHRV9TSVpFKTsKPj4+PiArCX0KPj4+PiArI2VuZGlm
Cj4+Pj4gKwlzaWd0cmFtcCA9ICh1bnNpZ25lZCBsb25nKVZEU09fU1lNQk9MKGN1cnJlbnQtPm1t
LT5jb250ZXh0LnZkc28sIHNpZ3RyYW1wKTsKPj4+PiArCj4+Pj4gKwlyZXR1cm4gcmVncy0+cGMg
PT0gKHNpZ3RyYW1wICsgOCk7Cj4+Pgo+Pj4gSW5zdGVhZCBvZiBoYXJkY29kaW5nICdzaWd0cmFt
cCArIDgnIHlvdSBjb3VsZCBhZGQgYSBuZXcgbGFiZWwgdG8gdGhlICdzdmMgIzAnCj4+PiBpbnN0
cnVjdGlvbiBhbmQgdXNlIHRoYXQgd2l0aCBWRFNPX1NZTUJPTCgpLgo+Pgo+PiBJdCBzZWVtcyB0
aGF0IHRoZSBtb2RpZmljYXRpb24gb2YgX19rZXJuZWxfcnRfc2lncmV0dXJuKCkgaXMgbm90IHJl
Y29tbWVuZGVkCj4gCj4gRm9yIHRoZSBjaGFuZ2VzIHRvIHRoZSBvYmplY3QgY29kZSBvZiB0aGUg
ZnVuY3Rpb24gdGhpcyBpcyBvYnZpb3VzIGFuZAo+IHdlbGwgZXhwbGFpbmVkIGluIHRoZSBjb21t
ZW50cy4KPiAKPiBTdWNoIGEgbGFiZWwgaG93ZXZlciB3b3VsZCBub3QgY2hhbmdlIHRoZSBvYmpl
Y3QgY29kZSBvZiB0aGUgZnVuY3Rpb24uCj4gSW4gZmFjdCBpdCB3b3VsZCBub3QgY2hhbmdlIGFu
eSBiaXQgd2hhdHNvZXZlciBpbiB0aGUgZmluYWwgdkRTTywKPiBzYXZlIGZvciBhIG5ldyBidWls
ZCBJRC4KClllcywgYW5kIHVzaW5nIGxhYmVscyBpcyBlYXNpZXIgdG8gbWFpbnRhaW4gdGhhbiBo
YXJkY29kaW5nIG9mZnNldHMKZGlyZWN0bHkuCgpTaW1pbGFyIHRvIHRoZSBjb2RlIGJlbG93PwoK
LS0tIGEvYXJjaC9hcm02NC9LY29uZmlnCisrKyBiL2FyY2gvYXJtNjQvS2NvbmZpZwpAQCAtODYs
NiArODYsNyBAQCBjb25maWcgQVJNNjQKICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19TQ0hF
RF9TTVQKICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19TQ0hFRF9DTFVTVEVSCiAgICAgICAg
c2VsZWN0IEFSQ0hfU1VQUE9SVFNfU0NIRURfTUMKKyAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JU
U19TWVNDQUxMX1VTRVJfRElTUEFUQ0gKICAgICAgICBzZWxlY3QgQVJDSF9XQU5UX0JBVENIRURf
VU5NQVBfVExCX0ZMVVNICiAgICAgICAgc2VsZWN0IEFSQ0hfV0FOVF9DT01QQVRfSVBDX1BBUlNF
X1ZFUlNJT04gaWYgQ09NUEFUCiAgICAgICAgc2VsZWN0IEFSQ0hfV0FOVF9ERUZBVUxUX0JQRl9K
SVQKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vZWxmLmggYi9hcmNoL2FybTY0
L2luY2x1ZGUvYXNtL2VsZi5oCmluZGV4IGQyNzc5ZDYwNGM3Yi4uYThiMjMyYzVjNmQ5IDEwMDY0
NAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2VsZi5oCisrKyBiL2FyY2gvYXJtNjQvaW5j
bHVkZS9hc20vZWxmLmgKQEAgLTI5Myw2ICsyOTMsNyBAQCBzdGF0aWMgaW5saW5lIGludCBhcmNo
X2NoZWNrX2VsZih2b2lkICplaGRyLCBib29sCmhhc19pbnRlcnAsCiAgICAgICAgcmV0dXJuIDA7
CiB9CgorZXh0ZXJuIGJvb2wgYXJjaF9zeXNjYWxsX2lzX3Zkc29fc2lncmV0dXJuKHN0cnVjdCBw
dF9yZWdzICpyZWdzKTsKICNlbmRpZiAvKiAhX19BU1NFTUJMRVJfXyAqLwoKICNlbmRpZgpkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9rZXJuZWwvdmRzby5jIGIvYXJjaC9hcm02NC9rZXJuZWwvdmRz
by5jCmluZGV4IDU5MmRkODY2OGRlNC4uNjA5ZDdiY2Q4MzA4IDEwMDY0NAotLS0gYS9hcmNoL2Fy
bTY0L2tlcm5lbC92ZHNvLmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvdmRzby5jCkBAIC0zNDMs
MyArMzQzLDE5IEBAIGludCBhcmNoX3NldHVwX2FkZGl0aW9uYWxfcGFnZXMoc3RydWN0IGxpbnV4
X2JpbnBybQoqYnBybSwgaW50IHVzZXNfaW50ZXJwKQoKICAgICAgICByZXR1cm4gcmV0OwogfQor
Citib29sIGFyY2hfc3lzY2FsbF9pc192ZHNvX3NpZ3JldHVybihzdHJ1Y3QgcHRfcmVncyAqcmVn
cykKK3sKKyAgICAgICB1bnNpZ25lZCBsb25nIHNpZ3RyYW1wOworCisjaWZkZWYgQ09ORklHX0NP
TVBBVAorICAgICAgIGlmIChpc19jb21wYXRfdGFzaygpKSB7CisgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIHNpZ3BhZ2UgPSAodW5zaWduZWQKbG9uZyljdXJyZW50LT5tbS0+Y29udGV4dC5z
aWdwYWdlOworCisgICAgICAgICAgICAgICByZXR1cm4gcmVncy0+cGMgPj0gc2lncGFnZSAmJiBy
ZWdzLT5wYyA8IChzaWdwYWdlICsKUEFHRV9TSVpFKTsKKyAgICAgICB9CisjZW5kaWYKKyAgICAg
ICBzaWd0cmFtcCA9ICh1bnNpZ25lZCBsb25nKVZEU09fU1lNQk9MKGN1cnJlbnQtPm1tLT5jb250
ZXh0LnZkc28sCnNpZ3JldHVybl9sYW5kaW5nX3BhZCk7CisKKyAgICAgICByZXR1cm4gcmVncy0+
cGMgPT0gc2lndHJhbXA7Cit9CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC92ZHNvL3Np
Z3JldHVybi5TCmIvYXJjaC9hcm02NC9rZXJuZWwvdmRzby9zaWdyZXR1cm4uUwppbmRleCAwZTE4
NzI5YWJjM2IuLjhkMmQ0MTNmZjQ1ZSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvdmRz
by9zaWdyZXR1cm4uUworKysgYi9hcmNoL2FybTY0L2tlcm5lbC92ZHNvL3NpZ3JldHVybi5TCkBA
IC03Myw2ICs3Myw3IEBAIFNZTV9DT0RFX1NUQVJUKF9fa2VybmVsX3J0X3NpZ3JldHVybikKICAg
ICAgICBtb3YgICAgIHg4LCAjX19OUl9ydF9zaWdyZXR1cm4KIC8vICAgICBQTEVBU0UgRE8gTk9U
IE1PRElGWQogICAgICAgIHN2YyAgICAgIzAKKyAgICAgICBTWU1fSU5ORVJfTEFCRUwoX19zaWdy
ZXR1cm5fbGFuZGluZ19wYWQsIFNZTV9MX0dMT0JBTCkKIC8vICAgICBQTEVBU0UgRE8gTk9UIE1P
RElGWQogLy8gICAgIC5jZmlfZW5kcHJvYwogU1lNX0NPREVfRU5EKF9fa2VybmVsX3J0X3NpZ3Jl
dHVybikKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL3Zkc28vdmRzby5sZHMuUwpiL2Fy
Y2gvYXJtNjQva2VybmVsL3Zkc28vdmRzby5sZHMuUwppbmRleCA1MjMxNGJlMjkxOTEuLjVmZWUy
OTI3ZTRjNSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvdmRzby92ZHNvLmxkcy5TCisr
KyBiL2FyY2gvYXJtNjQva2VybmVsL3Zkc28vdmRzby5sZHMuUwpAQCAtMTA0LDYgKzEwNCw3IEBA
IFZFUlNJT04KICAgICAgICAgICAgICAgIF9fa2VybmVsX2Nsb2NrX2dldHRpbWU7CiAgICAgICAg
ICAgICAgICBfX2tlcm5lbF9jbG9ja19nZXRyZXM7CiAgICAgICAgICAgICAgICBfX2tlcm5lbF9n
ZXRyYW5kb207CisgICAgICAgICAgICAgICBfX3NpZ3JldHVybl9sYW5kaW5nX3BhZDsKICAgICAg
ICBsb2NhbDogKjsKICAgICAgICB9OwogfQpAQCAtMTEyLDMgKzExMyw0IEBAIFZFUlNJT04KICAq
IE1ha2UgdGhlIHNpZ3JldHVybiBjb2RlIHZpc2libGUgdG8gdGhlIGtlcm5lbC4KICAqLwogVkRT
T19zaWd0cmFtcCAgICAgICAgICA9IF9fa2VybmVsX3J0X3NpZ3JldHVybjsKK1ZEU09fc2lncmV0
dXJuX2xhbmRpbmdfcGFkICAgICA9IF9fc2lncmV0dXJuX2xhbmRpbmdfcGFkOwoKCj4gCj4gCj4g
VGhvbWFzCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
