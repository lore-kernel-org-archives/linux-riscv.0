Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4528103A9A3
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 02:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7ZA10HpMd9FVwLc0kUVGflyrbuHHNsTLIlq1+JNSRo=; b=w9wX2uYg3voFbD
	Pf/C/2LHzaG/YIVCGd52rgH9i4KHTauftsoIB0QZP8aTjgbOZ4430+aJSWEu+9przqIbc8y75fNrE
	eR2ak1/oMAy2BJoyqr9z8gn5dYT3qiwCjXiCvlE4aC9o4BCsEffXXzuWwtfBhRBiVUw3SX34HbHi/
	zdwt8uHC5K8VaU44gOxH07TGcKJUary3DIelCme2vEtFL4Hk6l+AAWkFG5kr3tY5JwS+tErkN40f1
	Dd3xUF+atBZgd3+Y+LAB8AEB9pvwS7tYq45jY+IeDLJDlXWTTMOmOK6d/9ZDA2mcZtbEIKyD5oN+R
	6xshfX5FELSVCAHkg5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ERO-00000002Ykh-1HNf;
	Wed, 25 Mar 2026 02:57:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ERL-00000002YgL-34GO;
	Wed, 25 Mar 2026 02:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=AOVYfpfg79yD7eFn4CZ9+BNhSBjLdVbtAdmSv2LXRjg=; b=I/W0ZqbBcrbUaoUm62rD9EUh/A
	fKjYsh7ecM82/zhY3YZtIIs0hhwQID2gHNsh4I/Sg01NHnP7SjUWHdKUGxw/3m28wEZc4ZkVgvZGO
	RyPXRT7xU7BzhzPF4m5qkL+tfIpxJ8fp7bdyapcNr9XzIvU9i7daFPkwyZLxBtPIJlW9PnMlTgoUj
	rynM5E8K/uzHbzJZj7Wqnkp8FVq8HKiPWWzG8567D5XE7iShgdbcD8tBf2YKaPLIr46qfYgEChOaP
	1Yz9rDZOmTsD156KH+JmddcciNkq/HiHKYFbEZzv2wAnV5T7uTZWi80J4c4gFDIfKxCMfg5BiLn0x
	SWYPp4gw==;
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ERG-00000005JRl-0cZ2;
	Wed, 25 Mar 2026 02:57:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AOVYfpfg79yD7eFn4CZ9+BNhSBjLdVbtAdmSv2LXRjg=;
	b=vuDTFtJIXlWi3WQM2PetFjfxW+SnD7MBA2PxvSdlatPhSOtT4gx1oqMa4NOtQZuws+JbJ1ZyC
	Fm/mjPn8ztEHvKsUG0OBHWrhyCwVn5lMss21RWhOewdNhpZm429kOdv0hEv9v6goginDjZIvENq
	vzFeYjGnhNXtq6oWpCAjFpE=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fgWf72074znTWd;
	Wed, 25 Mar 2026 10:52:15 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 16CDB40565;
	Wed, 25 Mar 2026 10:57:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 25 Mar
 2026 10:57:39 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <vgoyal@redhat.com>,
	<dyoung@redhat.com>, <rdunlap@infradead.org>, <peterz@infradead.org>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <ruanjinjie@huawei.com>,
	<rppt@kernel.org>, <ardb@kernel.org>, <leitao@debian.org>, <osandov@fb.com>,
	<cfsworks@gmail.com>, <tangyouling@kylinos.cn>, <sourabhjain@linux.ibm.com>,
	<ritesh.list@gmail.com>, <eajames@linux.ibm.com>,
	<songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
	<samuel.holland@sifive.com>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <coxu@redhat.com>, <liaoyuanhong@vivo.com>,
	<jbohac@suse.cz>, <fuqiang.wang@easystack.cn>, <guoren@kernel.org>,
	<chenjiahao16@huawei.com>, <hbathini@linux.ibm.com>, <james.morse@arm.com>,
	<takahiro.akashi@linaro.org>, <lizhengyu3@huawei.com>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
Subject: [PATCH v10 6/8] arm64: kexec: Add support for crashkernel CMA reservation
Date: Wed, 25 Mar 2026 10:59:02 +0800
Message-ID: <20260325025904.2811960-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325025904.2811960-1-ruanjinjie@huawei.com>
References: <20260325025904.2811960-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_025746_993879_73F614AC 
X-CRM114-Status: GOOD (  20.93  )
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
ZWN0dXJlLgoKQWNrZWQtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+CkFj
a2VkLWJ5OiBCYW9xdWFuIEhlIDxiaGVAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IE1pa2UgUmFwb3Bv
cnQgKE1pY3Jvc29mdCkgPHJwcHRAa2VybmVsLm9yZz4KQWNrZWQtYnk6IEFyZCBCaWVzaGV1dmVs
IDxhcmRiQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEppbmppZSBSdWFuIDxydWFuamluamll
QGh1YXdlaS5jb20+Ci0tLQp2NzoKLSBDb3JyZWN0IHRoZSBpbmNsdXNpb24gb2YgQ01BLXJlc2Vy
dmVkIHJhbmdlcyBmb3Iga2R1bXAKICBrZXJuZWwgaW4gb2Yva2V4ZWMuCnYzOgotIEFkZCBBY2tl
ZC1ieS4KdjI6Ci0gRnJlZSBjbWVtIGluIHByZXBhcmVfZWxmX2hlYWRlcnMoKQotIEFkZCB0aGUg
bXRpdmF0aW9uLgotLS0KIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRl
cnMudHh0IHwgMiArLQogYXJjaC9hcm02NC9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMgICAg
ICAgICAgfCAyICstCiBhcmNoL2FybTY0L21tL2luaXQuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDUgKysrLS0KIGRyaXZlcnMvb2YvZmR0LmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgOSArKysrKy0tLS0KIGRyaXZlcnMvb2Yva2V4ZWMuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgOSArKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9u
cygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1
aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2Vy
bmVsLXBhcmFtZXRlcnMudHh0CmluZGV4IGNiODUwZTUyOTBjMi4uYWZiMzExMjUxMGY3IDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAor
KysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dApAQCAt
MTEyMSw3ICsxMTIxLDcgQEAgS2VybmVsIHBhcmFtZXRlcnMKIAkJCUl0IHdpbGwgYmUgaWdub3Jl
ZCB3aGVuIGNyYXNoa2VybmVsPVgsaGlnaCBpcyBub3QgdXNlZAogCQkJb3IgbWVtb3J5IHJlc2Vy
dmVkIGlzIGJlbG93IDRHLgogCWNyYXNoa2VybmVsPXNpemVbS01HXSxjbWEKLQkJCVtLTkwsIFg4
NiwgcHBjXSBSZXNlcnZlIGFkZGl0aW9uYWwgY3Jhc2gga2VybmVsIG1lbW9yeSBmcm9tCisJCQlb
S05MLCBYODYsIEFSTTY0LCBQUENdIFJlc2VydmUgYWRkaXRpb25hbCBjcmFzaCBrZXJuZWwgbWVt
b3J5IGZyb20KIAkJCUNNQS4gVGhpcyByZXNlcnZhdGlvbiBpcyB1c2FibGUgYnkgdGhlIGZpcnN0
IHN5c3RlbSdzCiAJCQl1c2Vyc3BhY2UgbWVtb3J5IGFuZCBrZXJuZWwgbW92YWJsZSBhbGxvY2F0
aW9ucyAobWVtb3J5CiAJCQliYWxsb29uLCB6c3dhcCkuIFBhZ2VzIGFsbG9jYXRlZCBmcm9tIHRo
aXMgbWVtb3J5IHJhbmdlCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9tYWNoaW5lX2tl
eGVjX2ZpbGUuYyBiL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jCmluZGV4
IGMzMzg1MDZhNTgwYi4uY2M1NzdkNzdkZjAwIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2tlcm5l
bC9tYWNoaW5lX2tleGVjX2ZpbGUuYworKysgYi9hcmNoL2FybTY0L2tlcm5lbC9tYWNoaW5lX2tl
eGVjX2ZpbGUuYwpAQCAtNDIsNyArNDIsNyBAQCBpbnQgYXJjaF9raW1hZ2VfZmlsZV9wb3N0X2xv
YWRfY2xlYW51cChzdHJ1Y3Qga2ltYWdlICppbWFnZSkKICNpZmRlZiBDT05GSUdfQ1JBU0hfRFVN
UAogdW5zaWduZWQgaW50IGFyY2hfZ2V0X3N5c3RlbV9ucl9yYW5nZXModm9pZCkKIHsKLQl1bnNp
Z25lZCBpbnQgbnJfcmFuZ2VzID0gMjsgLyogZm9yIGV4Y2x1c2lvbiBvZiBjcmFzaGtlcm5lbCBy
ZWdpb24gKi8KKwl1bnNpZ25lZCBpbnQgbnJfcmFuZ2VzID0gMiArIGNyYXNoa19jbWFfY250OyAv
KiBmb3IgZXhjbHVzaW9uIG9mIGNyYXNoa2VybmVsIHJlZ2lvbiAqLwogCXBoeXNfYWRkcl90IHN0
YXJ0LCBlbmQ7CiAJdTY0IGk7CiAKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vaW5pdC5jIGIv
YXJjaC9hcm02NC9tbS9pbml0LmMKaW5kZXggOTY3MTFiODU3OGZkLi4xNDRlMzBmZTlhNzUgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtNjQvbW0vaW5pdC5jCisrKyBiL2FyY2gvYXJtNjQvbW0vaW5pdC5j
CkBAIC05Niw4ICs5Niw4IEBAIHBoeXNfYWRkcl90IF9fcm9fYWZ0ZXJfaW5pdCBhcm02NF9kbWFf
cGh5c19saW1pdDsKIAogc3RhdGljIHZvaWQgX19pbml0IGFyY2hfcmVzZXJ2ZV9jcmFzaGtlcm5l
bCh2b2lkKQogeworCXVuc2lnbmVkIGxvbmcgbG9uZyBjcmFzaF9iYXNlLCBjcmFzaF9zaXplLCBj
bWFfc2l6ZSA9IDA7CiAJdW5zaWduZWQgbG9uZyBsb25nIGxvd19zaXplID0gMDsKLQl1bnNpZ25l
ZCBsb25nIGxvbmcgY3Jhc2hfYmFzZSwgY3Jhc2hfc2l6ZTsKIAlib29sIGhpZ2ggPSBmYWxzZTsK
IAlpbnQgcmV0OwogCkBAIC0xMDYsMTEgKzEwNiwxMiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYXJj
aF9yZXNlcnZlX2NyYXNoa2VybmVsKHZvaWQpCiAKIAlyZXQgPSBwYXJzZV9jcmFzaGtlcm5lbChi
b290X2NvbW1hbmRfbGluZSwgbWVtYmxvY2tfcGh5c19tZW1fc2l6ZSgpLAogCQkJCSZjcmFzaF9z
aXplLCAmY3Jhc2hfYmFzZSwKLQkJCQkmbG93X3NpemUsIE5VTEwsICZoaWdoKTsKKwkJCQkmbG93
X3NpemUsICZjbWFfc2l6ZSwgJmhpZ2gpOwogCWlmIChyZXQpCiAJCXJldHVybjsKIAogCXJlc2Vy
dmVfY3Jhc2hrZXJuZWxfZ2VuZXJpYyhjcmFzaF9zaXplLCBjcmFzaF9iYXNlLCBsb3dfc2l6ZSwg
aGlnaCk7CisJcmVzZXJ2ZV9jcmFzaGtlcm5lbF9jbWEoY21hX3NpemUpOwogfQogCiBzdGF0aWMg
cGh5c19hZGRyX3QgX19pbml0IG1heF96b25lX3BoeXMocGh5c19hZGRyX3Qgem9uZV9saW1pdCkK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvZmR0LmMgYi9kcml2ZXJzL29mL2ZkdC5jCmluZGV4IDMz
MTY0NmQ2NjdiOS4uMDM3OTI2ZWQzMGZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL29mL2ZkdC5jCisr
KyBiL2RyaXZlcnMvb2YvZmR0LmMKQEAgLTg3MSwxMSArODcxLDEyIEBAIHN0YXRpYyB1bnNpZ25l
ZCBsb25nIGNob3Nlbl9ub2RlX29mZnNldCA9IC1GRFRfRVJSX05PVEZPVU5EOwogLyoKICAqIFRo
ZSBtYWluIHVzYWdlIG9mIGxpbnV4LHVzYWJsZS1tZW1vcnktcmFuZ2UgaXMgZm9yIGNyYXNoIGR1
bXAga2VybmVsLgogICogT3JpZ2luYWxseSwgdGhlIG51bWJlciBvZiB1c2FibGUtbWVtb3J5IHJl
Z2lvbnMgaXMgb25lLiBOb3cgdGhlcmUgbWF5Ci0gKiBiZSB0d28gcmVnaW9ucywgbG93IHJlZ2lv
biBhbmQgaGlnaCByZWdpb24uCi0gKiBUbyBtYWtlIGNvbXBhdGliaWxpdHkgd2l0aCBleGlzdGlu
ZyB1c2VyLXNwYWNlIGFuZCBvbGRlciBrZHVtcCwgdGhlIGxvdwotICogcmVnaW9uIGlzIGFsd2F5
cyB0aGUgbGFzdCByYW5nZSBvZiBsaW51eCx1c2FibGUtbWVtb3J5LXJhbmdlIGlmIGV4aXN0Lgor
ICogYmUgMiArIENSQVNIS0VSTkVMX0NNQV9SQU5HRVNfTUFYIHJlZ2lvbnMsIGxvdyByZWdpb24s
IGhpZ2ggcmVnaW9uIGFuZAorICogY21hIHJlZ2lvbnMuIFRvIG1ha2UgY29tcGF0aWJpbGl0eSB3
aXRoIGV4aXN0aW5nIHVzZXItc3BhY2UgYW5kIG9sZGVyCisgKiBrZHVtcCwgdGhlIGhpZ2ggYW5k
IGxvdyByZWdpb24gYXJlIGFsd2F5cyB0aGUgZmlyc3QgdHdvIHJhbmdlcyBvZgorICogbGludXgs
dXNhYmxlLW1lbW9yeS1yYW5nZSBpZiBleGlzdC4KICAqLwotI2RlZmluZSBNQVhfVVNBQkxFX1JB
TkdFUwkJMgorI2RlZmluZSBNQVhfVVNBQkxFX1JBTkdFUwkJKDIgKyBDUkFTSEtFUk5FTF9DTUFf
UkFOR0VTX01BWCkKIAogLyoqCiAgKiBlYXJseV9pbml0X2R0X2NoZWNrX2Zvcl91c2FibGVfbWVt
X3JhbmdlIC0gRGVjb2RlIHVzYWJsZSBtZW1vcnkgcmFuZ2UKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
b2Yva2V4ZWMuYyBiL2RyaXZlcnMvb2Yva2V4ZWMuYwppbmRleCBjNGNmMzU1MmMwMTguLjU3OTUw
YWFlODBlNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9vZi9rZXhlYy5jCisrKyBiL2RyaXZlcnMvb2Yv
a2V4ZWMuYwpAQCAtNDM5LDYgKzQzOSwxNSBAQCB2b2lkICpvZl9rZXhlY19hbGxvY19hbmRfc2V0
dXBfZmR0KGNvbnN0IHN0cnVjdCBraW1hZ2UgKmltYWdlLAogCQkJaWYgKHJldCkKIAkJCQlnb3Rv
IG91dDsKIAkJfQorCisJCWZvciAoaW50IGkgPSAwOyBpIDwgY3Jhc2hrX2NtYV9jbnQ7IGkrKykg
eworCQkJcmV0ID0gZmR0X2FwcGVuZHByb3BfYWRkcnJhbmdlKGZkdCwgMCwgY2hvc2VuX25vZGUs
CisJCQkJCSJsaW51eCx1c2FibGUtbWVtb3J5LXJhbmdlIiwKKwkJCQkJY3Jhc2hrX2NtYV9yYW5n
ZXNbaV0uc3RhcnQsCisJCQkJCWNyYXNoa19jbWFfcmFuZ2VzW2ldLmVuZCAtIGNyYXNoa19jbWFf
cmFuZ2VzW2ldLnN0YXJ0ICsgMSk7CisJCQlpZiAocmV0KQorCQkJCWdvdG8gb3V0OworCQl9CiAj
ZW5kaWYKIAl9CiAKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
