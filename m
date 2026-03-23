Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282A6FC72C8
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 07:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/6oqJeeK2RnZkTxq+KoXOB8NPxH4DRM9R799BeW43w=; b=VKfw8z4Rk3y2PR
	atXmph7P4FnRTesQx/0NBoXNYfjNXhdMPId7Yk7YDSuEP1BANJRNzvT6mP9KpnOmrVN8iSHnfjQwm
	WmdL475l9nrYx6XFuivqAK9geORDeKHDgf5BlingA0FlYMNU9mdWNLYgoPQs0VSOj5BjE6yiWR3z+
	LLky8ihkvwCoGfu+swC/u70BfZSwSFCsDvvn5DfiizVa78XEQgHxQjRl599HXo6U6IEcX0pTG65Yg
	gFxWwOOVlLY8JOTlRDDr18dHVwmNn1AaqsGvx45VC3VIzCBhL3HoWVj19Ot4p5UaNoGeS4DJ78Vtv
	g2TrEWGbMVUGw8V40wsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZgQ-0000000GBrg-3I7k;
	Mon, 23 Mar 2026 07:26:42 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZgF-0000000GBjf-2YDd;
	Mon, 23 Mar 2026 07:26:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=q26crh1bRAQSwEBH+O8wN3grLapTaD7O8Bt4sMFkk/0=;
	b=ZsVUaj5Mifw+opMXK0aA44WFftzh+E/uVNOs8Z+OcHWhOQDPFuUKJm4ooX7ibK1s6mbzRanhy
	0wUF1p50Tj1EvW/fbP2koNdLk9pPInUJNgWTT/in3ux4wLLZoPKn/2AiDsN4jPKkJjys9yUwWZB
	xJuc5vvWrZ5pBLMM4uz6zRY=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4ffPhP2f0mzmV73;
	Mon, 23 Mar 2026 15:20:21 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 1666C4056C;
	Mon, 23 Mar 2026 15:26:27 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 23 Mar
 2026 15:26:24 +0800
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
	<feng.tang@linux.alibaba.com>, <pawan.kumar.gupta@linux.intel.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <ruanjinjie@huawei.com>,
	<safinaskar@gmail.com>, <rppt@kernel.org>, <ardb@kernel.org>,
	<leitao@debian.org>, <jbohac@suse.cz>, <cfsworks@gmail.com>,
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
Subject: [PATCH v9 4/5] arm64: kexec: Add support for crashkernel CMA reservation
Date: Mon, 23 Mar 2026 15:27:44 +0800
Message-ID: <20260323072745.2481719-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323072745.2481719-1-ruanjinjie@huawei.com>
References: <20260323072745.2481719-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_002632_276172_0D45423F 
X-CRM114-Status: GOOD (  20.81  )
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
MTY0NmQ2NjdiOS4uNTMxYmU1ZmNkZWI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL29mL2ZkdC5jCisr
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
aXRoIGV4aXN0aW5nIHVzZXItc3BhY2UgYW5kIG9sZGVyCisgKiBrZHVtcCwgdGhlIGxvdyByZWdp
b24gaXMgYWx3YXlzIHRoZSBsYXN0IHJhbmdlIG9mIGxpbnV4LHVzYWJsZS1tZW1vcnktcmFuZ2UK
KyAqIGlmIGV4aXN0LgogICovCi0jZGVmaW5lIE1BWF9VU0FCTEVfUkFOR0VTCQkyCisjZGVmaW5l
IE1BWF9VU0FCTEVfUkFOR0VTCQkoMiArIENSQVNIS0VSTkVMX0NNQV9SQU5HRVNfTUFYKQogCiAv
KioKICAqIGVhcmx5X2luaXRfZHRfY2hlY2tfZm9yX3VzYWJsZV9tZW1fcmFuZ2UgLSBEZWNvZGUg
dXNhYmxlIG1lbW9yeSByYW5nZQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9rZXhlYy5jIGIvZHJp
dmVycy9vZi9rZXhlYy5jCmluZGV4IGM0Y2YzNTUyYzAxOC4uYzg1MjFkOTk1NTJmIDEwMDY0NAot
LS0gYS9kcml2ZXJzL29mL2tleGVjLmMKKysrIGIvZHJpdmVycy9vZi9rZXhlYy5jCkBAIC00MzEs
NiArNDMxLDE1IEBAIHZvaWQgKm9mX2tleGVjX2FsbG9jX2FuZF9zZXR1cF9mZHQoY29uc3Qgc3Ry
dWN0IGtpbWFnZSAqaW1hZ2UsCiAJCWlmIChyZXQpCiAJCQlnb3RvIG91dDsKIAorCQlmb3IgKGlu
dCBpID0gMDsgaSA8IGNyYXNoa19jbWFfY250OyBpKyspIHsKKwkJCXJldCA9IGZkdF9hcHBlbmRw
cm9wX2FkZHJyYW5nZShmZHQsIDAsIGNob3Nlbl9ub2RlLAorCQkJCQkibGludXgsdXNhYmxlLW1l
bW9yeS1yYW5nZSIsCisJCQkJCWNyYXNoa19jbWFfcmFuZ2VzW2ldLnN0YXJ0LAorCQkJCQljcmFz
aGtfY21hX3Jhbmdlc1tpXS5lbmQgLSBjcmFzaGtfY21hX3Jhbmdlc1tpXS5zdGFydCArIDEpOwor
CQkJaWYgKHJldCkKKwkJCQlnb3RvIG91dDsKKwkJfQorCiAJCWlmIChjcmFzaGtfbG93X3Jlcy5l
bmQpIHsKIAkJCXJldCA9IGZkdF9hcHBlbmRwcm9wX2FkZHJyYW5nZShmZHQsIDAsIGNob3Nlbl9u
b2RlLAogCQkJCQkibGludXgsdXNhYmxlLW1lbW9yeS1yYW5nZSIsCi0tIAoyLjM0LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
