Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6171CE95360
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 09:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yn0Yxn8wqvkvo9QpZlqsJ57Pn+QZSFjbMcbWBtCryy8=; b=Q0Ms/82OyU1hwo
	Zue12zrKLk2ie1+IwqswFd44uH6df8SmqFNCyZwqtLmgvYMR9AAjtFc/hQ9GhcxLW3pA7XxEMIQpV
	ce+VDB5FkfS2et9w6vGbtlhvhV9lDwUewQsKIljMwlifCTYerGB09EcRxzbWGkAZqDh7pWgyY6gf2
	HeMqwyc+XnaLIvZCchFzYHDRq1IAMHdEIxSJ+OvPg4XCaEFzwdAKiQoXYIwnERJy8qVNi2ohQkfER
	vLdbcnrtIb4al2LEZ24SGfRQdr5zls1a1WYtAvVpPSRHGM8oKL9fmcBtpvG72jjGceYzxjc7E99Cq
	f2ac96FdM8bPDVX9W0Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZJw-00000008Dq8-26NQ;
	Wed, 04 Feb 2026 09:37:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZJt-00000008Dnp-0nn0;
	Wed, 04 Feb 2026 09:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9dh41FuXoskin5kEyP/EzKDXWLppsq5+vDzuAG9frAc=; b=QRYaBiFHa4NhIYZVnyP5mDiU8Y
	55jOxqlFC+77VOTlkmDau7r2xFo0j+sRWKH2z2OMBuwVktI48HFq0xnQeTSOJL8P44rq5tGI/4Q+a
	f/jdkfjndiOTTtMkrJVVjwjGFDLV4aQ1wTiiY421oig8dID0DKLBmrzpF2Tnu3TIc3M8lvTIDtJDV
	USRjw92clgT5/XxngcXl/UO/DoKjVVfaGMEPAsZysxdq2D3ikoA5gVyICPOgfjGuRamPpeeoFr6Wt
	hInZH9cCOrRVn57Ro7vCPfxHKqm7qi682oLmrL9A/arjzW2lfrqYzUpWWfktU68DzAzajCa7KpzHz
	C0NQhuDg==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZJp-00000000E7Q-2kJA;
	Wed, 04 Feb 2026 09:37:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9dh41FuXoskin5kEyP/EzKDXWLppsq5+vDzuAG9frAc=;
	b=O05tgehusLXxCPdoMc3HuZGiKmyI7zPSArAukVtx29XJeeSPz6a9SN/2YFTXxU1lSlAJ79XK1
	K0hTPthQMZ92VIfFMbzLuF5PiVF+fIshLc7csCP+lx0p4fKMolwvRJCvTP4q8HxXlOf5doEOqux
	NH1bTdersZfl51BebkcMNZM=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f5Zwt2x1Xz1BGCf;
	Wed,  4 Feb 2026 17:36:14 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9dh41FuXoskin5kEyP/EzKDXWLppsq5+vDzuAG9frAc=;
	b=O05tgehusLXxCPdoMc3HuZGiKmyI7zPSArAukVtx29XJeeSPz6a9SN/2YFTXxU1lSlAJ79XK1
	K0hTPthQMZ92VIfFMbzLuF5PiVF+fIshLc7csCP+lx0p4fKMolwvRJCvTP4q8HxXlOf5doEOqux
	NH1bTdersZfl51BebkcMNZM=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f5ZrP1l8Wz1T4fn;
	Wed,  4 Feb 2026 17:32:21 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E0B5404AD;
	Wed,  4 Feb 2026 17:36:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Feb
 2026 17:36:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<bhe@redhat.com>, <vgoyal@redhat.com>, <dyoung@redhat.com>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<kees@kernel.org>, <elver@google.com>, <arnd@arndb.de>,
	<lirongqing@baidu.com>, <fvdl@google.com>, <leitao@debian.org>,
	<rppt@kernel.org>, <cfsworks@gmail.com>, <osandov@fb.com>,
	<sourabhjain@linux.ibm.com>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
	<tangyouling@kylinos.cn>, <ritesh.list@gmail.com>, <bjorn@rivosinc.com>,
	<songshuaishuai@tinylab.org>, <samuel.holland@sifive.com>,
	<kevin.brodsky@arm.com>, <junhui.liu@pigmoral.tech>,
	<vishal.moola@gmail.com>, <coxu@redhat.com>, <jbohac@suse.cz>,
	<liaoyuanhong@vivo.com>, <brgerst@gmail.com>, <fuqiang.wang@easystack.cn>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 2/3] arm64: kexec: Add support for crashkernel CMA reservation
Date: Wed, 4 Feb 2026 17:37:27 +0800
Message-ID: <20260204093728.1447527-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260204093728.1447527-1-ruanjinjie@huawei.com>
References: <20260204093728.1447527-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_093706_655877_5D743451 
X-CRM114-Status: GOOD (  17.51  )
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
ZWN0dXJlLgoKU2lnbmVkLW9mZi1ieTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNv
bT4KLS0tCnYzOgotIEFkZCBBY2tlZC1ieS4KdjI6Ci0gRnJlZSBjbWVtIGluIHByZXBhcmVfZWxm
X2hlYWRlcnMoKQotIEFkZCB0aGUgbXRpdmF0aW9uLgotLS0KIERvY3VtZW50YXRpb24vYWRtaW4t
Z3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IHwgMiArLQogYXJjaC9hcm02NC9rZXJuZWwvbWFj
aGluZV9rZXhlY19maWxlLmMgICAgICAgICAgfCA4ICsrKysrKystCiBhcmNoL2FybTY0L21tL2lu
aXQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDUgKysrLS0KIDMgZmlsZXMgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCBiL0RvY3VtZW50YXRpb24v
YWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0CmluZGV4IDEwNThmMmE2ZDZhOC4uMzZi
YjY0MmE3ZWRkIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1w
YXJhbWV0ZXJzLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJh
bWV0ZXJzLnR4dApAQCAtMTExOSw3ICsxMTE5LDcgQEAgS2VybmVsIHBhcmFtZXRlcnMKIAkJCUl0
IHdpbGwgYmUgaWdub3JlZCB3aGVuIGNyYXNoa2VybmVsPVgsaGlnaCBpcyBub3QgdXNlZAogCQkJ
b3IgbWVtb3J5IHJlc2VydmVkIGlzIGJlbG93IDRHLgogCWNyYXNoa2VybmVsPXNpemVbS01HXSxj
bWEKLQkJCVtLTkwsIFg4NiwgcHBjXSBSZXNlcnZlIGFkZGl0aW9uYWwgY3Jhc2gga2VybmVsIG1l
bW9yeSBmcm9tCisJCQlbS05MLCBYODYsIEFSTTY0LCBwcGNdIFJlc2VydmUgYWRkaXRpb25hbCBj
cmFzaCBrZXJuZWwgbWVtb3J5IGZyb20KIAkJCUNNQS4gVGhpcyByZXNlcnZhdGlvbiBpcyB1c2Fi
bGUgYnkgdGhlIGZpcnN0IHN5c3RlbSdzCiAJCQl1c2Vyc3BhY2UgbWVtb3J5IGFuZCBrZXJuZWwg
bW92YWJsZSBhbGxvY2F0aW9ucyAobWVtb3J5CiAJCQliYWxsb29uLCB6c3dhcCkuIFBhZ2VzIGFs
bG9jYXRlZCBmcm9tIHRoaXMgbWVtb3J5IHJhbmdlCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tl
cm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYyBiL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4
ZWNfZmlsZS5jCmluZGV4IGVkMmM0NTAwNzE1OC4uY2FiNGFhZjhjYjIyIDEwMDY0NAotLS0gYS9h
cmNoL2FybTY0L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYworKysgYi9hcmNoL2FybTY0L2tl
cm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYwpAQCAtNDgsNyArNDgsNyBAQCBzdGF0aWMgaW50IHBy
ZXBhcmVfZWxmX2hlYWRlcnModm9pZCAqKmFkZHIsIHVuc2lnbmVkIGxvbmcgKnN6KQogCXU2NCBp
OwogCXBoeXNfYWRkcl90IHN0YXJ0LCBlbmQ7CiAKLQlucl9yYW5nZXMgPSAyOyAvKiBmb3IgZXhj
bHVzaW9uIG9mIGNyYXNoa2VybmVsIHJlZ2lvbiAqLworCW5yX3JhbmdlcyA9IDIgKyBjcmFzaGtf
Y21hX2NudDsgLyogZm9yIGV4Y2x1c2lvbiBvZiBjcmFzaGtlcm5lbCByZWdpb24gKi8KIAlmb3Jf
ZWFjaF9tZW1fcmFuZ2UoaSwgJnN0YXJ0LCAmZW5kKQogCQlucl9yYW5nZXMrKzsKIApAQCAtNjQs
NiArNjQsMTIgQEAgc3RhdGljIGludCBwcmVwYXJlX2VsZl9oZWFkZXJzKHZvaWQgKiphZGRyLCB1
bnNpZ25lZCBsb25nICpzeikKIAkJY21lbS0+bnJfcmFuZ2VzKys7CiAJfQogCisJZm9yIChpID0g
MDsgaSA8IGNyYXNoa19jbWFfY250OyBpKyspIHsKKwkJY21lbS0+cmFuZ2VzW2NtZW0tPm5yX3Jh
bmdlc10uc3RhcnQgPSBjcmFzaGtfY21hX3Jhbmdlc1tpXS5zdGFydDsKKwkJY21lbS0+cmFuZ2Vz
W2NtZW0tPm5yX3Jhbmdlc10uZW5kID0gY3Jhc2hrX2NtYV9yYW5nZXNbaV0uZW5kOworCQljbWVt
LT5ucl9yYW5nZXMrKzsKKwl9CisKIAlyZXQgPSBjcmFzaF9wcmVwYXJlX2VsZjY0X2hlYWRlcnMo
Y21lbSwgdHJ1ZSwgYWRkciwgc3opOwogCiAJa2ZyZWUoY21lbSk7CmRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L21tL2luaXQuYyBiL2FyY2gvYXJtNjQvbW0vaW5pdC5jCmluZGV4IDUyNGQzNGEwZTky
MS4uMjgxNjVkOTRhZjA4IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L21tL2luaXQuYworKysgYi9h
cmNoL2FybTY0L21tL2luaXQuYwpAQCAtOTYsOCArOTYsOCBAQCBwaHlzX2FkZHJfdCBfX3JvX2Fm
dGVyX2luaXQgYXJtNjRfZG1hX3BoeXNfbGltaXQ7CiAKIHN0YXRpYyB2b2lkIF9faW5pdCBhcmNo
X3Jlc2VydmVfY3Jhc2hrZXJuZWwodm9pZCkKIHsKKwl1bnNpZ25lZCBsb25nIGxvbmcgY3Jhc2hf
YmFzZSwgY3Jhc2hfc2l6ZSwgY21hX3NpemUgPSAwOwogCXVuc2lnbmVkIGxvbmcgbG9uZyBsb3df
c2l6ZSA9IDA7Ci0JdW5zaWduZWQgbG9uZyBsb25nIGNyYXNoX2Jhc2UsIGNyYXNoX3NpemU7CiAJ
Ym9vbCBoaWdoID0gZmFsc2U7CiAJaW50IHJldDsKIApAQCAtMTA2LDExICsxMDYsMTIgQEAgc3Rh
dGljIHZvaWQgX19pbml0IGFyY2hfcmVzZXJ2ZV9jcmFzaGtlcm5lbCh2b2lkKQogCiAJcmV0ID0g
cGFyc2VfY3Jhc2hrZXJuZWwoYm9vdF9jb21tYW5kX2xpbmUsIG1lbWJsb2NrX3BoeXNfbWVtX3Np
emUoKSwKIAkJCQkmY3Jhc2hfc2l6ZSwgJmNyYXNoX2Jhc2UsCi0JCQkJJmxvd19zaXplLCBOVUxM
LCAmaGlnaCk7CisJCQkJJmxvd19zaXplLCAmY21hX3NpemUsICZoaWdoKTsKIAlpZiAocmV0KQog
CQlyZXR1cm47CiAKIAlyZXNlcnZlX2NyYXNoa2VybmVsX2dlbmVyaWMoY3Jhc2hfc2l6ZSwgY3Jh
c2hfYmFzZSwgbG93X3NpemUsIGhpZ2gpOworCXJlc2VydmVfY3Jhc2hrZXJuZWxfY21hKGNtYV9z
aXplKTsKIH0KIAogc3RhdGljIHBoeXNfYWRkcl90IF9faW5pdCBtYXhfem9uZV9waHlzKHBoeXNf
YWRkcl90IHpvbmVfbGltaXQpCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
