Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A706AD58E47
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 03:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uoWdE6i+/XICV56U2ZbqO8+eDNrVN3TWjY7VmUyAFlQ=; b=j1vCu1Wn5+4zlc
	oV5FG1i/Cr1sU7d9YTI5lu1rlMwMrdECtLaz3GUpkQQTRJBmDdaw9MkyILKyQwZjaKfPddCDr7hOy
	bCg9kvPjDvdN8ZB6PYyy3KQkTxVp9rqeTTt6VX7UvvHx0ZMzoHFpn6roEVHcJhif5TbLfrKcXLVBj
	Z1IjOsujS7zjKNMm8X860gPRtcmOwl/VEMhCdVjnnmUxginmAYjMiVKkKm2zN458O/ACfwqZX/We4
	ItVpgpzbHy8xSsJCZA5KbO+ld0xgrT/psXR1Z++I76jgEHUuHmyKPJRouSZ691IRTHw7df++3qfGm
	N08xJ7ZQnl35GUoQYtkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwuM8-0000000CDWf-45DT;
	Mon, 02 Mar 2026 03:54:05 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwuLz-0000000CDKh-2jgG;
	Mon, 02 Mar 2026 03:53:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=buo9EOMcviLZVn1FpbPOAU7BWn78yNXxQfQnBfIfncw=;
	b=vk3zYOilztb978ruaa9ny61e9DLFmEEArcVUYmPpDWPMbfHi4ElxzM8jljkwuZ0uHaRcpwkqb
	a+gfNtN2CAfzTTEUa3KoySm9H8xSBqLNde5NxGOdSV65fL7LuMKCGRmMfDKIE8+xX8oUeZ5RQNG
	BA7WlMbKYcwmQjgbG+gvXBA=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4fPQ0D1n3Zz1cyPb;
	Mon,  2 Mar 2026 11:49:00 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B8E4040561;
	Mon,  2 Mar 2026 11:53:49 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 2 Mar
 2026 11:53:46 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <vgoyal@redhat.com>,
	<dyoung@redhat.com>, <rdunlap@infradead.org>, <pmladek@suse.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <paulmck@kernel.org>,
	<lirongqing@baidu.com>, <fvdl@google.com>, <rppt@kernel.org>,
	<ardb@kernel.org>, <leitao@debian.org>, <sourabhjain@linux.ibm.com>,
	<jbohac@suse.cz>, <cfsworks@gmail.com>, <osandov@fb.com>,
	<tangyouling@kylinos.cn>, <ritesh.list@gmail.com>, <hbathini@linux.ibm.com>,
	<eajames@linux.ibm.com>, <songshuaishuai@tinylab.org>,
	<kevin.brodsky@arm.com>, <samuel.holland@sifive.com>,
	<vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <coxu@redhat.com>,
	<liaoyuanhong@vivo.com>, <fuqiang.wang@easystack.cn>, <brgerst@gmail.com>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v8 4/5] arm64: kexec: Add support for crashkernel CMA reservation
Date: Mon, 2 Mar 2026 11:53:14 +0800
Message-ID: <20260302035315.3892241-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302035315.3892241-1-ruanjinjie@huawei.com>
References: <20260302035315.3892241-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_195356_114816_D7664B6B 
X-CRM114-Status: GOOD (  20.87  )
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
ZWN0dXJlLgoKQWNrZWQtYnk6IE1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkgPHJwcHRAa2VybmVs
Lm9yZz4KQWNrZWQtYnk6IEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+ClNpZ25lZC1v
ZmYtYnk6IEppbmppZSBSdWFuIDxydWFuamluamllQGh1YXdlaS5jb20+Ci0tLQp2NzoKLSBDb3Jy
ZWN0IHRoZSBpbmNsdXNpb24gb2YgQ01BLXJlc2VydmVkIHJhbmdlcyBmb3Iga2R1bXAKICBrZXJu
ZWwgaW4gb2Yva2V4ZWMuCnYzOgotIEFkZCBBY2tlZC1ieS4KdjI6Ci0gRnJlZSBjbWVtIGluIHBy
ZXBhcmVfZWxmX2hlYWRlcnMoKQotIEFkZCB0aGUgbXRpdmF0aW9uLgotLS0KIERvY3VtZW50YXRp
b24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IHwgMiArLQogYXJjaC9hcm02NC9r
ZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMgICAgICAgICAgfCAyICstCiBhcmNoL2FybTY0L21t
L2luaXQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDUgKysrLS0KIGRyaXZlcnMvb2Yv
ZmR0LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgOSArKysrKy0tLS0KIGRyaXZl
cnMvb2Yva2V4ZWMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgOSArKysrKysrKysK
IDUgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCBi
L0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0CmluZGV4IGNi
ODUwZTUyOTBjMi4uYWZiMzExMjUxMGY3IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1
aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dApAQCAtMTEyMSw3ICsxMTIxLDcgQEAgS2VybmVsIHBh
cmFtZXRlcnMKIAkJCUl0IHdpbGwgYmUgaWdub3JlZCB3aGVuIGNyYXNoa2VybmVsPVgsaGlnaCBp
cyBub3QgdXNlZAogCQkJb3IgbWVtb3J5IHJlc2VydmVkIGlzIGJlbG93IDRHLgogCWNyYXNoa2Vy
bmVsPXNpemVbS01HXSxjbWEKLQkJCVtLTkwsIFg4NiwgcHBjXSBSZXNlcnZlIGFkZGl0aW9uYWwg
Y3Jhc2gga2VybmVsIG1lbW9yeSBmcm9tCisJCQlbS05MLCBYODYsIEFSTTY0LCBQUENdIFJlc2Vy
dmUgYWRkaXRpb25hbCBjcmFzaCBrZXJuZWwgbWVtb3J5IGZyb20KIAkJCUNNQS4gVGhpcyByZXNl
cnZhdGlvbiBpcyB1c2FibGUgYnkgdGhlIGZpcnN0IHN5c3RlbSdzCiAJCQl1c2Vyc3BhY2UgbWVt
b3J5IGFuZCBrZXJuZWwgbW92YWJsZSBhbGxvY2F0aW9ucyAobWVtb3J5CiAJCQliYWxsb29uLCB6
c3dhcCkuIFBhZ2VzIGFsbG9jYXRlZCBmcm9tIHRoaXMgbWVtb3J5IHJhbmdlCmRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYyBiL2FyY2gvYXJtNjQva2Vy
bmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jCmluZGV4IGMzMzg1MDZhNTgwYi4uY2M1NzdkNzdkZjAw
IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYworKysg
Yi9hcmNoL2FybTY0L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYwpAQCAtNDIsNyArNDIsNyBA
QCBpbnQgYXJjaF9raW1hZ2VfZmlsZV9wb3N0X2xvYWRfY2xlYW51cChzdHJ1Y3Qga2ltYWdlICpp
bWFnZSkKICNpZmRlZiBDT05GSUdfQ1JBU0hfRFVNUAogdW5zaWduZWQgaW50IGFyY2hfZ2V0X3N5
c3RlbV9ucl9yYW5nZXModm9pZCkKIHsKLQl1bnNpZ25lZCBpbnQgbnJfcmFuZ2VzID0gMjsgLyog
Zm9yIGV4Y2x1c2lvbiBvZiBjcmFzaGtlcm5lbCByZWdpb24gKi8KKwl1bnNpZ25lZCBpbnQgbnJf
cmFuZ2VzID0gMiArIGNyYXNoa19jbWFfY250OyAvKiBmb3IgZXhjbHVzaW9uIG9mIGNyYXNoa2Vy
bmVsIHJlZ2lvbiAqLwogCXBoeXNfYWRkcl90IHN0YXJ0LCBlbmQ7CiAJdTY0IGk7CiAKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvbW0vaW5pdC5jIGIvYXJjaC9hcm02NC9tbS9pbml0LmMKaW5kZXgg
OTY3MTFiODU3OGZkLi4xNDRlMzBmZTlhNzUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvbW0vaW5p
dC5jCisrKyBiL2FyY2gvYXJtNjQvbW0vaW5pdC5jCkBAIC05Niw4ICs5Niw4IEBAIHBoeXNfYWRk
cl90IF9fcm9fYWZ0ZXJfaW5pdCBhcm02NF9kbWFfcGh5c19saW1pdDsKIAogc3RhdGljIHZvaWQg
X19pbml0IGFyY2hfcmVzZXJ2ZV9jcmFzaGtlcm5lbCh2b2lkKQogeworCXVuc2lnbmVkIGxvbmcg
bG9uZyBjcmFzaF9iYXNlLCBjcmFzaF9zaXplLCBjbWFfc2l6ZSA9IDA7CiAJdW5zaWduZWQgbG9u
ZyBsb25nIGxvd19zaXplID0gMDsKLQl1bnNpZ25lZCBsb25nIGxvbmcgY3Jhc2hfYmFzZSwgY3Jh
c2hfc2l6ZTsKIAlib29sIGhpZ2ggPSBmYWxzZTsKIAlpbnQgcmV0OwogCkBAIC0xMDYsMTEgKzEw
NiwxMiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYXJjaF9yZXNlcnZlX2NyYXNoa2VybmVsKHZvaWQp
CiAKIAlyZXQgPSBwYXJzZV9jcmFzaGtlcm5lbChib290X2NvbW1hbmRfbGluZSwgbWVtYmxvY2tf
cGh5c19tZW1fc2l6ZSgpLAogCQkJCSZjcmFzaF9zaXplLCAmY3Jhc2hfYmFzZSwKLQkJCQkmbG93
X3NpemUsIE5VTEwsICZoaWdoKTsKKwkJCQkmbG93X3NpemUsICZjbWFfc2l6ZSwgJmhpZ2gpOwog
CWlmIChyZXQpCiAJCXJldHVybjsKIAogCXJlc2VydmVfY3Jhc2hrZXJuZWxfZ2VuZXJpYyhjcmFz
aF9zaXplLCBjcmFzaF9iYXNlLCBsb3dfc2l6ZSwgaGlnaCk7CisJcmVzZXJ2ZV9jcmFzaGtlcm5l
bF9jbWEoY21hX3NpemUpOwogfQogCiBzdGF0aWMgcGh5c19hZGRyX3QgX19pbml0IG1heF96b25l
X3BoeXMocGh5c19hZGRyX3Qgem9uZV9saW1pdCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvZmR0
LmMgYi9kcml2ZXJzL29mL2ZkdC5jCmluZGV4IDMzMTY0NmQ2NjdiOS4uNTMxYmU1ZmNkZWI2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL29mL2ZkdC5jCisrKyBiL2RyaXZlcnMvb2YvZmR0LmMKQEAgLTg3
MSwxMSArODcxLDEyIEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIGNob3Nlbl9ub2RlX29mZnNldCA9
IC1GRFRfRVJSX05PVEZPVU5EOwogLyoKICAqIFRoZSBtYWluIHVzYWdlIG9mIGxpbnV4LHVzYWJs
ZS1tZW1vcnktcmFuZ2UgaXMgZm9yIGNyYXNoIGR1bXAga2VybmVsLgogICogT3JpZ2luYWxseSwg
dGhlIG51bWJlciBvZiB1c2FibGUtbWVtb3J5IHJlZ2lvbnMgaXMgb25lLiBOb3cgdGhlcmUgbWF5
Ci0gKiBiZSB0d28gcmVnaW9ucywgbG93IHJlZ2lvbiBhbmQgaGlnaCByZWdpb24uCi0gKiBUbyBt
YWtlIGNvbXBhdGliaWxpdHkgd2l0aCBleGlzdGluZyB1c2VyLXNwYWNlIGFuZCBvbGRlciBrZHVt
cCwgdGhlIGxvdwotICogcmVnaW9uIGlzIGFsd2F5cyB0aGUgbGFzdCByYW5nZSBvZiBsaW51eCx1
c2FibGUtbWVtb3J5LXJhbmdlIGlmIGV4aXN0LgorICogYmUgMiArIENSQVNIS0VSTkVMX0NNQV9S
QU5HRVNfTUFYIHJlZ2lvbnMsIGxvdyByZWdpb24sIGhpZ2ggcmVnaW9uIGFuZAorICogY21hIHJl
Z2lvbnMuIFRvIG1ha2UgY29tcGF0aWJpbGl0eSB3aXRoIGV4aXN0aW5nIHVzZXItc3BhY2UgYW5k
IG9sZGVyCisgKiBrZHVtcCwgdGhlIGxvdyByZWdpb24gaXMgYWx3YXlzIHRoZSBsYXN0IHJhbmdl
IG9mIGxpbnV4LHVzYWJsZS1tZW1vcnktcmFuZ2UKKyAqIGlmIGV4aXN0LgogICovCi0jZGVmaW5l
IE1BWF9VU0FCTEVfUkFOR0VTCQkyCisjZGVmaW5lIE1BWF9VU0FCTEVfUkFOR0VTCQkoMiArIENS
QVNIS0VSTkVMX0NNQV9SQU5HRVNfTUFYKQogCiAvKioKICAqIGVhcmx5X2luaXRfZHRfY2hlY2tf
Zm9yX3VzYWJsZV9tZW1fcmFuZ2UgLSBEZWNvZGUgdXNhYmxlIG1lbW9yeSByYW5nZQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9vZi9rZXhlYy5jIGIvZHJpdmVycy9vZi9rZXhlYy5jCmluZGV4IGM0Y2Yz
NTUyYzAxOC4uYzg1MjFkOTk1NTJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL29mL2tleGVjLmMKKysr
IGIvZHJpdmVycy9vZi9rZXhlYy5jCkBAIC00MzEsNiArNDMxLDE1IEBAIHZvaWQgKm9mX2tleGVj
X2FsbG9jX2FuZF9zZXR1cF9mZHQoY29uc3Qgc3RydWN0IGtpbWFnZSAqaW1hZ2UsCiAJCWlmIChy
ZXQpCiAJCQlnb3RvIG91dDsKIAorCQlmb3IgKGludCBpID0gMDsgaSA8IGNyYXNoa19jbWFfY250
OyBpKyspIHsKKwkJCXJldCA9IGZkdF9hcHBlbmRwcm9wX2FkZHJyYW5nZShmZHQsIDAsIGNob3Nl
bl9ub2RlLAorCQkJCQkibGludXgsdXNhYmxlLW1lbW9yeS1yYW5nZSIsCisJCQkJCWNyYXNoa19j
bWFfcmFuZ2VzW2ldLnN0YXJ0LAorCQkJCQljcmFzaGtfY21hX3Jhbmdlc1tpXS5lbmQgLSBjcmFz
aGtfY21hX3Jhbmdlc1tpXS5zdGFydCArIDEpOworCQkJaWYgKHJldCkKKwkJCQlnb3RvIG91dDsK
KwkJfQorCiAJCWlmIChjcmFzaGtfbG93X3Jlcy5lbmQpIHsKIAkJCXJldCA9IGZkdF9hcHBlbmRw
cm9wX2FkZHJyYW5nZShmZHQsIDAsIGNob3Nlbl9ub2RlLAogCQkJCQkibGludXgsdXNhYmxlLW1l
bW9yeS1yYW5nZSIsCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
