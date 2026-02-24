Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF94EFB81A
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 08:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NawxjRyGDc5hcJ2qGHxugqTgGeE/lZy9It7SeF2fF1s=; b=BoaXf8PqpIK/w6
	PnP5k5xyT4Vuz8eEpYW67FKdc9DR+OMMGNpkwQPDbTBhdOxNde2+A78pMNYGtm5StHuaAeezVRjtc
	bX35yhjQguXUZBRH7YTYPP/hrCYUwJGxXDgg+TlKQU0ZXpNZB7lcvArgMtyDB4sqKCvb0Cc2n+NVJ
	nUKeNgAWfeOzSV6jU42/x6CG0KO5fw4jqWQna+SpXTT351KZEK1vSfGsObMKSkaJnQsH5Nh0E7zY+
	fo/NDPtqqqfqliSIpr2jpByFnjC6iup3CZTGfJC+RH1PujHIsX60HBbqoW9jUuOYRr8LB2eTybEGj
	aqkISUsOGv5t9qYBezFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoCB-00000001gEi-2WEZ;
	Tue, 24 Feb 2026 08:55:07 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoC6-00000001g6m-0pG7;
	Tue, 24 Feb 2026 08:55:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NM621g/YN7qqZc3aOEqRwr5f/j+prUa2v+nsXWWrQb4=;
	b=1chYo5gymxUupAkB1C6ccQJgeOGbSo5jMJlj/wuH+C+hDS/YyGbZ19LHlIYomM+oh08xsCgpr
	jF50u72dLzHThtsOhqOUUfwzGKdlHAeMDnGqz/dVbAodZBAFM37HMBW3Ux6sF/onGScy1CdSgml
	1fJqRz5fuK9OD+v2psN139E=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fKryX1S5gzmVXK;
	Tue, 24 Feb 2026 16:50:12 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 578EF402AB;
	Tue, 24 Feb 2026 16:54:59 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Feb
 2026 16:54:56 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <bhe@redhat.com>,
	<vgoyal@redhat.com>, <dyoung@redhat.com>, <rdunlap@infradead.org>,
	<pmladek@suse.com>, <dapeng1.mi@linux.intel.com>, <kees@kernel.org>,
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <arnd@arndb.de>,
	<ardb@kernel.org>, <leitao@debian.org>, <rppt@kernel.org>,
	<cfsworks@gmail.com>, <ryan.roberts@arm.com>, <sourabhjain@linux.ibm.com>,
	<tangyouling@kylinos.cn>, <eajames@linux.ibm.com>, <hbathini@linux.ibm.com>,
	<ritesh.list@gmail.com>, <songshuaishuai@tinylab.org>,
	<samuel.holland@sifive.com>, <kevin.brodsky@arm.com>,
	<vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <coxu@redhat.com>,
	<liaoyuanhong@vivo.com>, <fuqiang.wang@easystack.cn>, <jbohac@suse.cz>,
	<brgerst@gmail.com>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v6 4/5] arm64: kexec: Add support for crashkernel CMA reservation
Date: Tue, 24 Feb 2026 16:53:41 +0800
Message-ID: <20260224085342.387996-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224085342.387996-1-ruanjinjie@huawei.com>
References: <20260224085342.387996-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_005502_611186_28343CA3 
X-CRM114-Status: GOOD (  17.28  )
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

Q29tbWl0IDM1YzE4ZjI5MzNjNSAoIkFkZCBhIG5ldyBvcHRpb25hbCAiLGNtYSIgc3VmZml4IHRv
IHRoZQpjcmFzaGtlcm5lbD0gY29tbWFuZCBsaW5lIG9wdGlvbiIpIGFuZCBjb21taXQgYWI0NzU1
MTBlMDQyICgia2R1bXA6CmltcGxlbWVudCByZXNlcnZlX2NyYXNoa2VybmVsX2NtYSIpIGFkZGVk
IENNQSBzdXBwb3J0IGZvciBrZHVtcApjcmFzaGtlcm5lbCByZXNlcnZhdGlvbi4KCkNyYXNoIGtl
cm5lbCBtZW1vcnkgcmVzZXJ2YXRpb24gd2FzdGVzIHByb2R1Y3Rpb24gcmVzb3VyY2VzIGlmIHRv
bwpsYXJnZSwgcmlza3Mga2R1bXAgZmFpbHVyZSBpZiB0b28gc21hbGwsIGFuZCBmYWNlcyBhbGxv
Y2F0aW9uIGRpZmZpY3VsdGllcwpvbiBmcmFnbWVudGVkIHN5c3RlbXMgZHVlIHRvIGNvbnRpZ3Vv
dXMgYmxvY2sgY29uc3RyYWludHMuIFRoZSBuZXcKQ01BLWJhc2VkIGNyYXNoa2VybmVsIHJlc2Vy
dmF0aW9uIHNjaGVtZSBzcGxpdHMgdGhlICJsYXJnZSBmaXhlZApyZXNlcnZhdGlvbiIgaW50byBh
ICJzbWFsbCBmaXhlZCByZWdpb24gKyBsYXJnZSBDTUEgZHluYW1pYyByZWdpb24iOiB0aGUKQ01B
IG1lbW9yeSBpcyBhdmFpbGFibGUgdG8gdXNlcnNwYWNlIGR1cmluZyBub3JtYWwgb3BlcmF0aW9u
IHRvIGF2b2lkCndhc3RlLCBhbmQgaXMgcmVjbGFpbWVkIGZvciBrZHVtcCB1cG9uIGNyYXNo4oCU
c2F2aW5nIG1lbW9yeSB3aGlsZQppbXByb3ZpbmcgcmVsaWFiaWxpdHkuCgpTbyBleHRlbmQgY3Jh
c2hrZXJuZWwgQ01BIHJlc2VydmF0aW9uIHN1cHBvcnQgdG8gYXJtNjQuIFRoZSBmb2xsb3dpbmcK
Y2hhbmdlcyBhcmUgbWFkZSB0byBlbmFibGUgQ01BIHJlc2VydmF0aW9uOgoKLSBQYXJzZSBhbmQg
b2J0YWluIHRoZSBDTUEgcmVzZXJ2YXRpb24gc2l6ZSBhbG9uZyB3aXRoIG90aGVyIGNyYXNoa2Vy
bmVsCiAgcGFyYW1ldGVycy4KLSBDYWxsIHJlc2VydmVfY3Jhc2hrZXJuZWxfY21hKCkgdG8gYWxs
b2NhdGUgdGhlIENNQSByZWdpb24gZm9yIGtkdW1wLgotIEluY2x1ZGUgdGhlIENNQS1yZXNlcnZl
ZCByYW5nZXMgZm9yIGtkdW1wIGtlcm5lbCB0byB1c2UuCi0gRXhjbHVkZSB0aGUgQ01BLXJlc2Vy
dmVkIHJhbmdlcyBmcm9tIHRoZSBjcmFzaCBrZXJuZWwgbWVtb3J5IHRvCiAgcHJldmVudCB0aGVt
IGZyb20gYmVpbmcgZXhwb3J0ZWQgdGhyb3VnaCAvcHJvYy92bWNvcmUsIHdoaWNoIGlzIGFscmVh
ZHkKICBkb25lIGluIHRoZSBjcmFzaCBjb3JlLgoKVXBkYXRlIGtlcm5lbC1wYXJhbWV0ZXJzLnR4
dCB0byBkb2N1bWVudCBDTUEgc3VwcG9ydCBmb3IgY3Jhc2hrZXJuZWwgb24KYXJtNjQgYXJjaGl0
ZWN0dXJlLgoKQWNrZWQtYnk6IEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+ClNpZ25l
ZC1vZmYtYnk6IEppbmppZSBSdWFuIDxydWFuamluamllQGh1YXdlaS5jb20+Ci0tLQp2MzoKLSBB
ZGQgQWNrZWQtYnkuCnYyOgotIEZyZWUgY21lbSBpbiBwcmVwYXJlX2VsZl9oZWFkZXJzKCkKLSBB
ZGQgdGhlIG10aXZhdGlvbi4KLS0tCiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1w
YXJhbWV0ZXJzLnR4dCB8IDIgKy0KIGFyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWNfZmls
ZS5jICAgICAgICAgIHwgOCArKysrKysrLQogYXJjaC9hcm02NC9tbS9pbml0LmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCA1ICsrKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tl
cm5lbC1wYXJhbWV0ZXJzLnR4dAppbmRleCBjYjg1MGU1MjkwYzIuLjQ5N2Y2M2I3Njg5OCAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQK
KysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKQEAg
LTExMjEsNyArMTEyMSw3IEBAIEtlcm5lbCBwYXJhbWV0ZXJzCiAJCQlJdCB3aWxsIGJlIGlnbm9y
ZWQgd2hlbiBjcmFzaGtlcm5lbD1YLGhpZ2ggaXMgbm90IHVzZWQKIAkJCW9yIG1lbW9yeSByZXNl
cnZlZCBpcyBiZWxvdyA0Ry4KIAljcmFzaGtlcm5lbD1zaXplW0tNR10sY21hCi0JCQlbS05MLCBY
ODYsIHBwY10gUmVzZXJ2ZSBhZGRpdGlvbmFsIGNyYXNoIGtlcm5lbCBtZW1vcnkgZnJvbQorCQkJ
W0tOTCwgWDg2LCBBUk02NCwgcHBjXSBSZXNlcnZlIGFkZGl0aW9uYWwgY3Jhc2gga2VybmVsIG1l
bW9yeSBmcm9tCiAJCQlDTUEuIFRoaXMgcmVzZXJ2YXRpb24gaXMgdXNhYmxlIGJ5IHRoZSBmaXJz
dCBzeXN0ZW0ncwogCQkJdXNlcnNwYWNlIG1lbW9yeSBhbmQga2VybmVsIG1vdmFibGUgYWxsb2Nh
dGlvbnMgKG1lbW9yeQogCQkJYmFsbG9vbiwgenN3YXApLiBQYWdlcyBhbGxvY2F0ZWQgZnJvbSB0
aGlzIG1lbW9yeSByYW5nZQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9rZXJuZWwvbWFjaGluZV9r
ZXhlY19maWxlLmMgYi9hcmNoL2FybTY0L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYwppbmRl
eCBjMzM4NTA2YTU4MGIuLmM4ODYyYTc2MmViMyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9rZXJu
ZWwvbWFjaGluZV9rZXhlY19maWxlLmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvbWFjaGluZV9r
ZXhlY19maWxlLmMKQEAgLTQyLDcgKzQyLDcgQEAgaW50IGFyY2hfa2ltYWdlX2ZpbGVfcG9zdF9s
b2FkX2NsZWFudXAoc3RydWN0IGtpbWFnZSAqaW1hZ2UpCiAjaWZkZWYgQ09ORklHX0NSQVNIX0RV
TVAKIHVuc2lnbmVkIGludCBhcmNoX2dldF9zeXN0ZW1fbnJfcmFuZ2VzKHZvaWQpCiB7Ci0JdW5z
aWduZWQgaW50IG5yX3JhbmdlcyA9IDI7IC8qIGZvciBleGNsdXNpb24gb2YgY3Jhc2hrZXJuZWwg
cmVnaW9uICovCisJdW5zaWduZWQgaW50IG5yX3JhbmdlcyA9IDIgKyBjcmFzaGtfY21hX2NudDsg
LyogZm9yIGV4Y2x1c2lvbiBvZiBjcmFzaGtlcm5lbCByZWdpb24gKi8KIAlwaHlzX2FkZHJfdCBz
dGFydCwgZW5kOwogCXU2NCBpOwogCkBAIC02NCw2ICs2NCwxMiBAQCBpbnQgYXJjaF9jcmFzaF9w
b3B1bGF0ZV9jbWVtKHN0cnVjdCBjcmFzaF9tZW0gKmNtZW0pCiAJCWNtZW0tPm5yX3Jhbmdlcysr
OwogCX0KIAorCWZvciAoaSA9IDA7IGkgPCBjcmFzaGtfY21hX2NudDsgaSsrKSB7CisJCWNtZW0t
PnJhbmdlc1tjbWVtLT5ucl9yYW5nZXNdLnN0YXJ0ID0gY3Jhc2hrX2NtYV9yYW5nZXNbaV0uc3Rh
cnQ7CisJCWNtZW0tPnJhbmdlc1tjbWVtLT5ucl9yYW5nZXNdLmVuZCA9IGNyYXNoa19jbWFfcmFu
Z2VzW2ldLmVuZDsKKwkJY21lbS0+bnJfcmFuZ2VzKys7CisJfQorCiAJcmV0dXJuIDA7CiB9CiAj
ZW5kaWYKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vaW5pdC5jIGIvYXJjaC9hcm02NC9tbS9p
bml0LmMKaW5kZXggOTY3MTFiODU3OGZkLi4xNDRlMzBmZTlhNzUgMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJtNjQvbW0vaW5pdC5jCisrKyBiL2FyY2gvYXJtNjQvbW0vaW5pdC5jCkBAIC05Niw4ICs5Niw4
IEBAIHBoeXNfYWRkcl90IF9fcm9fYWZ0ZXJfaW5pdCBhcm02NF9kbWFfcGh5c19saW1pdDsKIAog
c3RhdGljIHZvaWQgX19pbml0IGFyY2hfcmVzZXJ2ZV9jcmFzaGtlcm5lbCh2b2lkKQogeworCXVu
c2lnbmVkIGxvbmcgbG9uZyBjcmFzaF9iYXNlLCBjcmFzaF9zaXplLCBjbWFfc2l6ZSA9IDA7CiAJ
dW5zaWduZWQgbG9uZyBsb25nIGxvd19zaXplID0gMDsKLQl1bnNpZ25lZCBsb25nIGxvbmcgY3Jh
c2hfYmFzZSwgY3Jhc2hfc2l6ZTsKIAlib29sIGhpZ2ggPSBmYWxzZTsKIAlpbnQgcmV0OwogCkBA
IC0xMDYsMTEgKzEwNiwxMiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYXJjaF9yZXNlcnZlX2NyYXNo
a2VybmVsKHZvaWQpCiAKIAlyZXQgPSBwYXJzZV9jcmFzaGtlcm5lbChib290X2NvbW1hbmRfbGlu
ZSwgbWVtYmxvY2tfcGh5c19tZW1fc2l6ZSgpLAogCQkJCSZjcmFzaF9zaXplLCAmY3Jhc2hfYmFz
ZSwKLQkJCQkmbG93X3NpemUsIE5VTEwsICZoaWdoKTsKKwkJCQkmbG93X3NpemUsICZjbWFfc2l6
ZSwgJmhpZ2gpOwogCWlmIChyZXQpCiAJCXJldHVybjsKIAogCXJlc2VydmVfY3Jhc2hrZXJuZWxf
Z2VuZXJpYyhjcmFzaF9zaXplLCBjcmFzaF9iYXNlLCBsb3dfc2l6ZSwgaGlnaCk7CisJcmVzZXJ2
ZV9jcmFzaGtlcm5lbF9jbWEoY21hX3NpemUpOwogfQogCiBzdGF0aWMgcGh5c19hZGRyX3QgX19p
bml0IG1heF96b25lX3BoeXMocGh5c19hZGRyX3Qgem9uZV9saW1pdCkKLS0gCjIuMzQuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
