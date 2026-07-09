Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11CFC44503
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 07:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DBKXGuBS/7LWMWFpwcRmJoyJ81WKv8nW0mUY54+9rtc=; b=y4e/KiSRzSW6ZT
	Ppp0iSXlcbwfJ2hZlSQVlg4X6mPJAF39PF0EplzwTLZq+t2zELMtHOoJMrTratZOy04m2851SSjdJ
	AxPtaJLGscBEyp/dP0saiE3tjBnPzGTZSxSRQK82rBExfulEhcP7k/iapuK1ynJJOEC+v9+81f7ky
	u6Sv54u/uFDZmyLzS7HdIX7tp2xODnLf5BdPOp1wpUqI0LhRH9eTcDrlJ+6iebukLn8wIEKj+eynn
	bLPcrxW8OUNwJ5n09Qf6TGzlYL1Ji4UtXxio1P0+AoWqBMK8D61LR7ljpLhxwZzhD//b8mj1pJOox
	9Erg7AfT1sBdKYydIYAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjB3-00000001HNP-0aBh;
	Thu, 09 Jul 2026 07:28:09 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjAz-00000001HMa-1SYx
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 07:28:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+d8+hXbp8vZoFm5ME6uj8LWk7bRuSPPZwP0vsJH0Xoc=;
	b=m5+EHwbdqX4zMx4HWe3w4vFomb7O6mvMNVQ4OW6SQl7xhblwN3y1cSjYkfCctkvX3B9vPfkzv
	EKkzZYLkWAmKN+eCt0bQy9mYL0Np6EP0Usfh7tRd6ELvNyP9gDfyWdZK1Hpei8NTdoaTTig58r/
	PddtkWbymG7ljm2zZIA+aCA=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gwmXZ2J8yz1prKZ;
	Thu,  9 Jul 2026 15:18:38 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id E098640537;
	Thu,  9 Jul 2026 15:27:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 9 Jul
 2026 15:27:53 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <hca@linux.ibm.com>, <gor@linux.ibm.com>,
	<agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>, <svens@linux.ibm.com>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <nathan@kernel.org>,
	<kees@kernel.org>, <xur@google.com>, <peterz@infradead.org>,
	<gourry@gourry.net>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<ruanjinjie@huawei.com>, <yangtiezhu@loongson.cn>, <sshegde@linux.ibm.com>,
	<mchauras@linux.ibm.com>, <austin.kim@lge.com>, <arnd@arndb.de>,
	<jchrist@linux.ibm.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>
Subject: [PATCH] syscall_user_dispatch: Introduce ARCH_SUPPORTS_SYSCALL_USER_DISPATCH
Date: Thu, 9 Jul 2026 15:28:03 +0800
Message-ID: <20260709072803.3843948-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_002806_011982_99ED0DF9 
X-CRM114-Status: UNSURE (   8.29  )
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
Y29tPgpDYzogQWRhIENvdXByaWUgRGlheiA8YWRhLmNvdXByaWVkaWF6QGFybS5jb20+CkNjOiBU
aG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KU3VnZ2Vz
dGVkLWJ5OiBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5
OiBKaW5qaWUgUnVhbiA8cnVhbmppbmppZUBodWF3ZWkuY29tPgotLS0KIGFyY2gvS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwogYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20v
c3lzY2FsbC5oIHwgNiAtLS0tLS0KIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9zeXNjYWxsLmgg
ICB8IDUgLS0tLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3lzY2FsbC5oICAgICB8IDUgLS0t
LS0KIGFyY2gvczM5MC9pbmNsdWRlL2FzbS9zeXNjYWxsLmggICAgICB8IDUgLS0tLS0KIGFyY2gv
eDg2L0tjb25maWcgICAgICAgICAgICAgICAgICAgICB8IDEgKwogNiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvS2NvbmZp
ZyBiL2FyY2gvS2NvbmZpZwppbmRleCAwYzAxNTIxYzJmM2YuLjM5M2QwZmI3NWVhYyAxMDA2NDQK
LS0tIGEvYXJjaC9LY29uZmlnCisrKyBiL2FyY2gvS2NvbmZpZwpAQCAtMTE2LDYgKzExNiw3IEBA
IGNvbmZpZyBHRU5FUklDX0VOVFJZCiAKIGNvbmZpZyBTWVNDQUxMX1VTRVJfRElTUEFUQ0gKIAli
b29sICJTeXNjYWxsIFVzZXIgRGlzcGF0Y2giCisJZGVwZW5kcyBvbiBBUkNIX1NVUFBPUlRTX1NZ
U0NBTExfVVNFUl9ESVNQQVRDSAogCWRlcGVuZHMgb24gR0VORVJJQ19FTlRSWQogCWRlZmF1bHQg
eQogCWhlbHAKZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3N5c2NhbGwu
aCBiL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3N5c2NhbGwuaAppbmRleCBkZjhlYTIyM2M3
N2IuLmQ5Mjc1MDEwZjU0OCAxMDA2NDQKLS0tIGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20v
c3lzY2FsbC5oCisrKyBiL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3N5c2NhbGwuaApAQCAt
ODQsMTAgKzg0LDQgQEAgc3RhdGljIGlubGluZSBpbnQgc3lzY2FsbF9nZXRfYXJjaChzdHJ1Y3Qg
dGFza19zdHJ1Y3QgKnRhc2spCiAJcmV0dXJuIEFVRElUX0FSQ0hfTE9PTkdBUkNINjQ7CiAjZW5k
aWYKIH0KLQotc3RhdGljIGlubGluZSBib29sIGFyY2hfc3lzY2FsbF9pc192ZHNvX3NpZ3JldHVy
bihzdHJ1Y3QgcHRfcmVncyAqcmVncykKLXsKLQlyZXR1cm4gZmFsc2U7Ci19Ci0KICNlbmRpZgkv
KiBfX0FTTV9MT09OR0FSQ0hfU1lTQ0FMTF9IICovCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vc3lzY2FsbC5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3N5c2NhbGwu
aAppbmRleCA4MzRmY2M0ZjdiNTQuLjRiM2M1MmVkNmU5ZCAxMDA2NDQKLS0tIGEvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL3N5c2NhbGwuaAorKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
c3lzY2FsbC5oCkBAIC0xMzksOSArMTM5LDQgQEAgc3RhdGljIGlubGluZSBpbnQgc3lzY2FsbF9n
ZXRfYXJjaChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2spCiAJZWxzZQogCQlyZXR1cm4gQVVESVRf
QVJDSF9QUEM2NDsKIH0KLQotc3RhdGljIGlubGluZSBib29sIGFyY2hfc3lzY2FsbF9pc192ZHNv
X3NpZ3JldHVybihzdHJ1Y3QgcHRfcmVncyAqcmVncykKLXsKLQlyZXR1cm4gZmFsc2U7Ci19CiAj
ZW5kaWYJLyogX0FTTV9TWVNDQUxMX0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc3lzY2FsbC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zeXNjYWxsLmgKaW5kZXgg
ODA2N2U2NjZhNGNhLi45ODdjOWE3ODgwNmYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc3lzY2FsbC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3lzY2FsbC5oCkBA
IC0xMTIsMTEgKzExMiw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzeXNjYWxsX2hhbmRsZXIoc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MsIHVsb25nIHN5c2NhbGwpCiAJcmVncy0+YTAgPSBmbihyZWdzKTsK
IH0KIAotc3RhdGljIGlubGluZSBib29sIGFyY2hfc3lzY2FsbF9pc192ZHNvX3NpZ3JldHVybihz
dHJ1Y3QgcHRfcmVncyAqcmVncykKLXsKLQlyZXR1cm4gZmFsc2U7Ci19Ci0KIGFzbWxpbmthZ2Ug
bG9uZyBzeXNfcmlzY3ZfZmx1c2hfaWNhY2hlKHVpbnRwdHJfdCwgdWludHB0cl90LCB1aW50cHRy
X3QpOwogCiBhc21saW5rYWdlIGxvbmcgc3lzX3Jpc2N2X2h3cHJvYmUoc3RydWN0IHJpc2N2X2h3
cHJvYmUgKiwgc2l6ZV90LCBzaXplX3QsCmRpZmYgLS1naXQgYS9hcmNoL3MzOTAvaW5jbHVkZS9h
c20vc3lzY2FsbC5oIGIvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL3N5c2NhbGwuaAppbmRleCA0Mjcx
ZTQxNjlmNDUuLjVmMzEwY2FhZDFmYyAxMDA2NDQKLS0tIGEvYXJjaC9zMzkwL2luY2x1ZGUvYXNt
L3N5c2NhbGwuaAorKysgYi9hcmNoL3MzOTAvaW5jbHVkZS9hc20vc3lzY2FsbC5oCkBAIC04OSwx
MSArODksNiBAQCBzdGF0aWMgaW5saW5lIGludCBzeXNjYWxsX2dldF9hcmNoKHN0cnVjdCB0YXNr
X3N0cnVjdCAqdGFzaykKIAlyZXR1cm4gQVVESVRfQVJDSF9TMzkwWDsKIH0KIAotc3RhdGljIGlu
bGluZSBib29sIGFyY2hfc3lzY2FsbF9pc192ZHNvX3NpZ3JldHVybihzdHJ1Y3QgcHRfcmVncyAq
cmVncykKLXsKLQlyZXR1cm4gZmFsc2U7Ci19Ci0KICNkZWZpbmUgU1lTQ0FMTF9GTVRfMAogI2Rl
ZmluZSBTWVNDQUxMX0ZNVF8xICwgIjAiIChyMikKICNkZWZpbmUgU1lTQ0FMTF9GTVRfMiAsICJk
IiAocjMpIFNZU0NBTExfRk1UXzEKZGlmZiAtLWdpdCBhL2FyY2gveDg2L0tjb25maWcgYi9hcmNo
L3g4Ni9LY29uZmlnCmluZGV4IGJkYWQ5MGYyMTBlNC4uZjNmOGFkMTA3ZWViIDEwMDY0NAotLS0g
YS9hcmNoL3g4Ni9LY29uZmlnCisrKyBiL2FyY2gveDg2L0tjb25maWcKQEAgLTMzNSw2ICszMzUs
NyBAQCBjb25maWcgWDg2CiAJc2VsZWN0IFNDSEVEX1NNVAkJCWlmIFNNUAogCXNlbGVjdCBBUkNI
X1NVUFBPUlRTX1NDSEVEX0NMVVNURVIJaWYgU01QCiAJc2VsZWN0IEFSQ0hfU1VQUE9SVFNfU0NI
RURfTUMJCWlmIFNNUAorCXNlbGVjdCBBUkNIX1NVUFBPUlRTX1NZU0NBTExfVVNFUl9ESVNQQVRD
SAogCXNlbGVjdCBIQVZFX1NJTkdMRV9GVFJBQ0VfRElSRUNUX09QUwlpZiBYODZfNjQgJiYgRFlO
QU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMKIAogY29uZmlnIElOU1RSVUNUSU9OX0RFQ09E
RVIKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
