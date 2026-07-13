Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E102AC44501
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 03:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dxvwAEi+N+ILqUC6wZoGWeED6Xmmp5PFyofeM8/uiso=; b=1q5Ma5QbzeKztQ
	wwBUnby2y9JB2j+ZbQfJT4Jqsjz/GCaZwnZ36cwLIu6iWjnzopC15R249JvIlEPSL3l2x6+z/mOL4
	IDpGP3pMvZIrm9l7yC51AiGo7fhEhjEz1YnfJzUCajh68vs3GuoxeDHLwh22YPeXfF04Vce24mHBH
	VKbBAcPIpyaxHOVyRl3+A+xuuS/87052OyiAqUXWAwdQV66ob+MhDzrkhrgbmljcQAoueOnF60tRr
	Fz9PE7ohTifmvtGEEsBiPT8yshasHasKFBi8+sTjJXbfo8rzZEZfMrcl/toVKAi43lCzNiyAskQFT
	8G7CtIuH7wo/FOTdl2vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7kT-000000083cv-13qZ;
	Mon, 13 Jul 2026 03:54:29 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7kP-000000083cX-0gWY
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 03:54:27 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Wll8mTLBn9B2fPK9pm24mOajugHT7OtRM0GeQhTtfeg=;
	b=EHSxG8IT53N6k+cl2pDQ/HnOvdvCXTaXD5Wu1EI7I5nfI2mEAXDXd3NzfNSDRc23QAHsZL9OK
	18UrkbYTp1rtOo5ehYoaYcq+JhN138Umz5lQOKl81MDZhFz/A5xndUvG09QEDEjbHiu4F/kVhpq
	6xZtSFLFEo2Rih9MgpKl2ho=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gz7ch73wrzpT0s;
	Mon, 13 Jul 2026 11:45:24 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9517640561;
	Mon, 13 Jul 2026 11:54:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 13 Jul
 2026 11:54:11 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <hca@linux.ibm.com>, <gor@linux.ibm.com>,
	<agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>, <svens@linux.ibm.com>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <nathan@kernel.org>,
	<kees@kernel.org>, <xur@google.com>, <arnd@arndb.de>, <peterz@infradead.org>,
	<gourry@gourry.net>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<yangtiezhu@loongson.cn>, <mchauras@linux.ibm.com>, <sshegde@linux.ibm.com>,
	<austin.kim@lge.com>, <jchrist@linux.ibm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH RESEND] syscall_user_dispatch: Introduce ARCH_SUPPORTS_SYSCALL_USER_DISPATCH
Date: Mon, 13 Jul 2026 11:54:22 +0800
Message-ID: <20260713035422.582771-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_205425_854374_1072013B 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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

Q3VycmVudGx5LCBvbmx5IHg4NiBnZW51aW5lbHkgaW1wbGVtZW50cyBhbmQgc3VwcG9ydHMgU3lz
Y2FsbCBVc2VyCkRpc3BhdGNoIChTVUQpLiBNdWx0aXBsZSBhcmNoaXRlY3R1cmVzIHByb3ZpZGUg
YSBzdHViCmFyY2hfc3lzY2FsbF9pc192ZHNvX3NpZ3JldHVybigpIHJldHVybmluZyAnZmFsc2Un
IHNpbXBseSB0byBzYXRpc2Z5CkdFTkVSSUNfRU5UUlkgY29tcGlsYXRpb24sIHdoaWNoIGNyZWF0
ZXMgYSBmYWxzZSBpbXByZXNzaW9uIG9mIGZlYXR1cmUKc3VwcG9ydC4KCkludHJvZHVjZSBBUkNI
X1NVUFBPUlRTX1NZU0NBTExfVVNFUl9ESVNQQVRDSCB0byBkZWNvdXBsZSB0aGlzIG1lY2hhbmlz
bQpmcm9tIEdFTkVSSUNfRU5UUlkuIFNlbGVjdCBpdCBleGNsdXNpdmVseSBvbiB4ODYgYW5kIHJl
bW92ZSB0aGUgcmVkdW5kYW50CnN0dWIgZnVuY3Rpb25zIGZyb20gb3RoZXIgYXJjaGl0ZWN0dXJl
cy4KCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvYWtaZ1Yw
WTRZQW1CNDNfZ0BKMk43UVRSOVIzLmNhbWJyaWRnZS5hcm0uY29tLwpDYzogVGhvbWFzIEdsZWl4
bmVyIDx0Z2x4QGtlcm5lbC5vcmc+CkNjOiBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0u
Y29tPgpDYzogR3JlZ29yeSBQcmljZSA8Z291cnJ5QGdvdXJyeS5uZXQ+CkNjOiBBZGEgQ291cHJp
ZSBEaWF6IDxhZGEuY291cHJpZWRpYXpAYXJtLmNvbT4KQ2M6IFRob21hcyBXZWnDn3NjaHVoIDx0
aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgpTdWdnZXN0ZWQtYnk6IE1hcmsgUnV0bGFu
ZCA8bWFyay5ydXRsYW5kQGFybS5jb20+ClNpZ25lZC1vZmYtYnk6IEppbmppZSBSdWFuIDxydWFu
amluamllQGh1YXdlaS5jb20+Ci0tLQp2MSAtPiBSRVNFTkQKLSBEZWZpbmUgbWlzc2luZyBBUkNI
X1NVUFBPUlRTX1NZU0NBTExfVVNFUl9ESVNQQVRDSC4KLS0tCiBhcmNoL0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgICAgfCA0ICsrKysKIGFyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3N5
c2NhbGwuaCB8IDYgLS0tLS0tCiBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc3lzY2FsbC5oICAg
fCA1IC0tLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N5c2NhbGwuaCAgICAgfCA1IC0tLS0t
CiBhcmNoL3MzOTAvaW5jbHVkZS9hc20vc3lzY2FsbC5oICAgICAgfCA1IC0tLS0tCiBhcmNoL3g4
Ni9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAxICsKIDYgZmlsZXMgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL0tjb25maWcg
Yi9hcmNoL0tjb25maWcKaW5kZXggZDJkYmVkNTI0ZjE1Li4wNjYyNjNjYzQ0ZmUgMTAwNjQ0Ci0t
LSBhL2FyY2gvS2NvbmZpZworKysgYi9hcmNoL0tjb25maWcKQEAgLTExNCw4ICsxMTQsMTIgQEAg
Y29uZmlnIEdFTkVSSUNfRU5UUlkKIAlzZWxlY3QgR0VORVJJQ19JUlFfRU5UUlkKIAlzZWxlY3Qg
R0VORVJJQ19TWVNDQUxMCiAKK2NvbmZpZyBBUkNIX1NVUFBPUlRTX1NZU0NBTExfVVNFUl9ESVNQ
QVRDSAorCWJvb2wKKwogY29uZmlnIFNZU0NBTExfVVNFUl9ESVNQQVRDSAogCWJvb2wgIlN5c2Nh
bGwgVXNlciBEaXNwYXRjaCIKKwlkZXBlbmRzIG9uIEFSQ0hfU1VQUE9SVFNfU1lTQ0FMTF9VU0VS
X0RJU1BBVENICiAJZGVwZW5kcyBvbiBHRU5FUklDX0VOVFJZCiAJZGVmYXVsdCB5CiAJaGVscApk
aWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vc3lzY2FsbC5oIGIvYXJjaC9s
b29uZ2FyY2gvaW5jbHVkZS9hc20vc3lzY2FsbC5oCmluZGV4IGRmOGVhMjIzYzc3Yi4uZDkyNzUw
MTBmNTQ4IDEwMDY0NAotLS0gYS9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9zeXNjYWxsLmgK
KysrIGIvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vc3lzY2FsbC5oCkBAIC04NCwxMCArODQs
NCBAQCBzdGF0aWMgaW5saW5lIGludCBzeXNjYWxsX2dldF9hcmNoKHN0cnVjdCB0YXNrX3N0cnVj
dCAqdGFzaykKIAlyZXR1cm4gQVVESVRfQVJDSF9MT09OR0FSQ0g2NDsKICNlbmRpZgogfQotCi1z
dGF0aWMgaW5saW5lIGJvb2wgYXJjaF9zeXNjYWxsX2lzX3Zkc29fc2lncmV0dXJuKHN0cnVjdCBw
dF9yZWdzICpyZWdzKQotewotCXJldHVybiBmYWxzZTsKLX0KLQogI2VuZGlmCS8qIF9fQVNNX0xP
T05HQVJDSF9TWVNDQUxMX0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9zeXNjYWxsLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc3lzY2FsbC5oCmluZGV4IDgz
NGZjYzRmN2I1NC4uNGIzYzUyZWQ2ZTlkIDEwMDY0NAotLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vc3lzY2FsbC5oCisrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9zeXNjYWxsLmgK
QEAgLTEzOSw5ICsxMzksNCBAQCBzdGF0aWMgaW5saW5lIGludCBzeXNjYWxsX2dldF9hcmNoKHN0
cnVjdCB0YXNrX3N0cnVjdCAqdGFzaykKIAllbHNlCiAJCXJldHVybiBBVURJVF9BUkNIX1BQQzY0
OwogfQotCi1zdGF0aWMgaW5saW5lIGJvb2wgYXJjaF9zeXNjYWxsX2lzX3Zkc29fc2lncmV0dXJu
KHN0cnVjdCBwdF9yZWdzICpyZWdzKQotewotCXJldHVybiBmYWxzZTsKLX0KICNlbmRpZgkvKiBf
QVNNX1NZU0NBTExfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zeXNj
YWxsLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N5c2NhbGwuaAppbmRleCA4MDY3ZTY2NmE0
Y2EuLjk4N2M5YTc4ODA2ZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zeXNj
YWxsLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zeXNjYWxsLmgKQEAgLTExMiwxMSAr
MTEyLDYgQEAgc3RhdGljIGlubGluZSB2b2lkIHN5c2NhbGxfaGFuZGxlcihzdHJ1Y3QgcHRfcmVn
cyAqcmVncywgdWxvbmcgc3lzY2FsbCkKIAlyZWdzLT5hMCA9IGZuKHJlZ3MpOwogfQogCi1zdGF0
aWMgaW5saW5lIGJvb2wgYXJjaF9zeXNjYWxsX2lzX3Zkc29fc2lncmV0dXJuKHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQotewotCXJldHVybiBmYWxzZTsKLX0KLQogYXNtbGlua2FnZSBsb25nIHN5c19y
aXNjdl9mbHVzaF9pY2FjaGUodWludHB0cl90LCB1aW50cHRyX3QsIHVpbnRwdHJfdCk7CiAKIGFz
bWxpbmthZ2UgbG9uZyBzeXNfcmlzY3ZfaHdwcm9iZShzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqLCBz
aXplX3QsIHNpemVfdCwKZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9pbmNsdWRlL2FzbS9zeXNjYWxs
LmggYi9hcmNoL3MzOTAvaW5jbHVkZS9hc20vc3lzY2FsbC5oCmluZGV4IDQyNzFlNDE2OWY0NS4u
NWYzMTBjYWFkMWZjIDEwMDY0NAotLS0gYS9hcmNoL3MzOTAvaW5jbHVkZS9hc20vc3lzY2FsbC5o
CisrKyBiL2FyY2gvczM5MC9pbmNsdWRlL2FzbS9zeXNjYWxsLmgKQEAgLTg5LDExICs4OSw2IEBA
IHN0YXRpYyBpbmxpbmUgaW50IHN5c2NhbGxfZ2V0X2FyY2goc3RydWN0IHRhc2tfc3RydWN0ICp0
YXNrKQogCXJldHVybiBBVURJVF9BUkNIX1MzOTBYOwogfQogCi1zdGF0aWMgaW5saW5lIGJvb2wg
YXJjaF9zeXNjYWxsX2lzX3Zkc29fc2lncmV0dXJuKHN0cnVjdCBwdF9yZWdzICpyZWdzKQotewot
CXJldHVybiBmYWxzZTsKLX0KLQogI2RlZmluZSBTWVNDQUxMX0ZNVF8wCiAjZGVmaW5lIFNZU0NB
TExfRk1UXzEgLCAiMCIgKHIyKQogI2RlZmluZSBTWVNDQUxMX0ZNVF8yICwgImQiIChyMykgU1lT
Q0FMTF9GTVRfMQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvS2NvbmZpZyBiL2FyY2gveDg2L0tjb25m
aWcKaW5kZXggYmRhZDkwZjIxMGU0Li5mM2Y4YWQxMDdlZWIgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2
L0tjb25maWcKKysrIGIvYXJjaC94ODYvS2NvbmZpZwpAQCAtMzM1LDYgKzMzNSw3IEBAIGNvbmZp
ZyBYODYKIAlzZWxlY3QgU0NIRURfU01UCQkJaWYgU01QCiAJc2VsZWN0IEFSQ0hfU1VQUE9SVFNf
U0NIRURfQ0xVU1RFUglpZiBTTVAKIAlzZWxlY3QgQVJDSF9TVVBQT1JUU19TQ0hFRF9NQwkJaWYg
U01QCisJc2VsZWN0IEFSQ0hfU1VQUE9SVFNfU1lTQ0FMTF9VU0VSX0RJU1BBVENICiAJc2VsZWN0
IEhBVkVfU0lOR0xFX0ZUUkFDRV9ESVJFQ1RfT1BTCWlmIFg4Nl82NCAmJiBEWU5BTUlDX0ZUUkFD
RV9XSVRIX0RJUkVDVF9DQUxMUwogCiBjb25maWcgSU5TVFJVQ1RJT05fREVDT0RFUgotLSAKMi4z
NC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
