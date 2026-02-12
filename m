Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B5AEB48F3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 10:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MmspEqpGdI/j7SuUfxf3Y0tgBclDBCMTTdT8tBBtOM4=; b=unDz7bvLcCIpNi
	Q/y/2iIFuku5O6Db5U7K5HWINWNabYuNH9E0L3Phzlv+rIc6EACkFmsHIwEjtnkxCbVFUTpA5ZByY
	h2kwaHtP86GzWBUqdK3g5fUCcYEHQZD/mtFJXnEfi55I26QLevZi/E5JU+DmSacC8XVFaSTL0ZQKP
	HmIUgZ2bObijSnaTr1Z9BOnx4RGv5BDPd3zhDj4XrwCGFDAQFN+PSb764/QbfB5dOgSIIVqI7bxV/
	SZlnpT+o+8GMPqWoa5n9yDUSIjEgaqStYyyOOLsptygGTQ8YFF7uuKG1xa7PmUOTAgoadliZYiG6u
	hEf1GTo9nP5mF186YTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTdk-00000001u5r-3AJv;
	Thu, 12 Feb 2026 10:09:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTdg-00000001u40-1hKS;
	Thu, 12 Feb 2026 10:09:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=g+cqoZxeKma4ciqaa6LpacmbaqmzkXvuRpW7u2o02X8=; b=ahtCIy5Rh8x7CxHQXCfO+QwpXh
	lSi6XTpgTa24R/2lJiGnUFRt8wdXR6UQEO5LRvh3MHnUdS5eMSdrvVnOv+hJDG4hL10A0VMAiRx2l
	1lXOOILpBqXBKqewD8/Hu05yUQBU7v0VWWa6al31W3HZdEPKfjsv0FQh8ek46+m6Di1Vg2/Ud62ma
	051UylY9fuH9fQXmDj3LDDcJSo1tYgEEG/TtNpBDArFYVBVM3zEMRmU4nX//E17EwM4hgMMHqgo3u
	KekfhLRNN/heRrowuGUbmVS+pSGxf9lI/ebKdIMlYv1jnAIxEZp/ydYelCQ4OxW/mx4lg7fKKj5zU
	bVTGXv6A==;
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTdc-0000000Alpv-2tx5;
	Thu, 12 Feb 2026 10:09:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=g+cqoZxeKma4ciqaa6LpacmbaqmzkXvuRpW7u2o02X8=;
	b=n9aL6KoiJh3/rFu1hXuueujGuykYvVit5Opx7v2hv3uJVWApZfePJoDzLMez0yKFtxnzV9SHf
	xlWM6gYX8EaqSQ9jBepF3tSWbsz4h/MvZrVyTyJZFJtP9hQnVz74fXiU0+3e9ZCEVzUt0QrI45T
	jHGjhS/XA9NNgFul5+9hY1w=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fBW9y1HSJzcb4N;
	Thu, 12 Feb 2026 18:04:38 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 4A7CA4056D;
	Thu, 12 Feb 2026 18:09:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Feb
 2026 18:09:13 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <bhe@redhat.com>,
	<vgoyal@redhat.com>, <dyoung@redhat.com>, <rdunlap@infradead.org>,
	<kees@kernel.org>, <elver@google.com>, <paulmck@kernel.org>, <arnd@arndb.de>,
	<ruanjinjie@huawei.com>, <fvdl@google.com>, <thuth@redhat.com>,
	<ardb@kernel.org>, <leitao@debian.org>, <rppt@kernel.org>, <osandov@fb.com>,
	<cfsworks@gmail.com>, <sourabhjain@linux.ibm.com>, <ryan.roberts@arm.com>,
	<tangyouling@kylinos.cn>, <eajames@linux.ibm.com>, <hbathini@linux.ibm.com>,
	<ritesh.list@gmail.com>, <songshuaishuai@tinylab.org>, <bjorn@rivosinc.com>,
	<samuel.holland@sifive.com>, <kevin.brodsky@arm.com>,
	<junhui.liu@pigmoral.tech>, <vishal.moola@gmail.com>, <dwmw@amazon.co.uk>,
	<pbonzini@redhat.com>, <kai.huang@intel.com>, <ubizjak@gmail.com>,
	<coxu@redhat.com>, <fuqiang.wang@easystack.cn>, <liaoyuanhong@vivo.com>,
	<brgerst@gmail.com>, <jbohac@suse.cz>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<kexec@lists.infradead.org>
Subject: [PATCH v5 3/4] arm64: kexec: Add support for crashkernel CMA reservation
Date: Thu, 12 Feb 2026 18:10:00 +0800
Message-ID: <20260212101001.343158-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212101001.343158-1-ruanjinjie@huawei.com>
References: <20260212101001.343158-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_100933_283993_17A7F7ED 
X-CRM114-Status: GOOD (  15.91  )
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
ZS5jICAgICAgICAgIHwgNiArKysrKysKIGFyY2gvYXJtNjQvbW0vaW5pdC5jICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgNSArKystLQogMyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3Vp
ZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJu
ZWwtcGFyYW1ldGVycy50eHQKaW5kZXggZWYxYmE5MjJkYzYwLi5hMmM3YzIyYzYwZTQgMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Cisr
KyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0CkBAIC0x
MTIxLDcgKzExMjEsNyBAQCBLZXJuZWwgcGFyYW1ldGVycwogCQkJSXQgd2lsbCBiZSBpZ25vcmVk
IHdoZW4gY3Jhc2hrZXJuZWw9WCxoaWdoIGlzIG5vdCB1c2VkCiAJCQlvciBtZW1vcnkgcmVzZXJ2
ZWQgaXMgYmVsb3cgNEcuCiAJY3Jhc2hrZXJuZWw9c2l6ZVtLTUddLGNtYQotCQkJW0tOTCwgWDg2
LCBwcGNdIFJlc2VydmUgYWRkaXRpb25hbCBjcmFzaCBrZXJuZWwgbWVtb3J5IGZyb20KKwkJCVtL
TkwsIFg4NiwgQVJNNjQsIHBwY10gUmVzZXJ2ZSBhZGRpdGlvbmFsIGNyYXNoIGtlcm5lbCBtZW1v
cnkgZnJvbQogCQkJQ01BLiBUaGlzIHJlc2VydmF0aW9uIGlzIHVzYWJsZSBieSB0aGUgZmlyc3Qg
c3lzdGVtJ3MKIAkJCXVzZXJzcGFjZSBtZW1vcnkgYW5kIGtlcm5lbCBtb3ZhYmxlIGFsbG9jYXRp
b25zIChtZW1vcnkKIAkJCWJhbGxvb24sIHpzd2FwKS4gUGFnZXMgYWxsb2NhdGVkIGZyb20gdGhp
cyBtZW1vcnkgcmFuZ2UKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4
ZWNfZmlsZS5jIGIvYXJjaC9hcm02NC9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMKaW5kZXgg
NTA2YTE2NTExN2IxLi40NzRiMTVlZWZiNjIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQva2VybmVs
L21hY2hpbmVfa2V4ZWNfZmlsZS5jCisrKyBiL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4
ZWNfZmlsZS5jCkBAIC02Myw2ICs2MywxMiBAQCBpbnQgYXJjaF9wcmVwYXJlX2VsZjY0X3JhbV9o
ZWFkZXJzKHN0cnVjdCBjcmFzaF9tZW0gKmNtZW0pCiAJCWNtZW0tPm5yX3JhbmdlcysrOwogCX0K
IAorCWZvciAoaSA9IDA7IGkgPCBjcmFzaGtfY21hX2NudDsgaSsrKSB7CisJCWNtZW0tPnJhbmdl
c1tjbWVtLT5ucl9yYW5nZXNdLnN0YXJ0ID0gY3Jhc2hrX2NtYV9yYW5nZXNbaV0uc3RhcnQ7CisJ
CWNtZW0tPnJhbmdlc1tjbWVtLT5ucl9yYW5nZXNdLmVuZCA9IGNyYXNoa19jbWFfcmFuZ2VzW2ld
LmVuZDsKKwkJY21lbS0+bnJfcmFuZ2VzKys7CisJfQorCiAJcmV0dXJuIDA7CiB9CiAjZW5kaWYK
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vaW5pdC5jIGIvYXJjaC9hcm02NC9tbS9pbml0LmMK
aW5kZXggNTI0ZDM0YTBlOTIxLi4yODE2NWQ5NGFmMDggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQv
bW0vaW5pdC5jCisrKyBiL2FyY2gvYXJtNjQvbW0vaW5pdC5jCkBAIC05Niw4ICs5Niw4IEBAIHBo
eXNfYWRkcl90IF9fcm9fYWZ0ZXJfaW5pdCBhcm02NF9kbWFfcGh5c19saW1pdDsKIAogc3RhdGlj
IHZvaWQgX19pbml0IGFyY2hfcmVzZXJ2ZV9jcmFzaGtlcm5lbCh2b2lkKQogeworCXVuc2lnbmVk
IGxvbmcgbG9uZyBjcmFzaF9iYXNlLCBjcmFzaF9zaXplLCBjbWFfc2l6ZSA9IDA7CiAJdW5zaWdu
ZWQgbG9uZyBsb25nIGxvd19zaXplID0gMDsKLQl1bnNpZ25lZCBsb25nIGxvbmcgY3Jhc2hfYmFz
ZSwgY3Jhc2hfc2l6ZTsKIAlib29sIGhpZ2ggPSBmYWxzZTsKIAlpbnQgcmV0OwogCkBAIC0xMDYs
MTEgKzEwNiwxMiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYXJjaF9yZXNlcnZlX2NyYXNoa2VybmVs
KHZvaWQpCiAKIAlyZXQgPSBwYXJzZV9jcmFzaGtlcm5lbChib290X2NvbW1hbmRfbGluZSwgbWVt
YmxvY2tfcGh5c19tZW1fc2l6ZSgpLAogCQkJCSZjcmFzaF9zaXplLCAmY3Jhc2hfYmFzZSwKLQkJ
CQkmbG93X3NpemUsIE5VTEwsICZoaWdoKTsKKwkJCQkmbG93X3NpemUsICZjbWFfc2l6ZSwgJmhp
Z2gpOwogCWlmIChyZXQpCiAJCXJldHVybjsKIAogCXJlc2VydmVfY3Jhc2hrZXJuZWxfZ2VuZXJp
YyhjcmFzaF9zaXplLCBjcmFzaF9iYXNlLCBsb3dfc2l6ZSwgaGlnaCk7CisJcmVzZXJ2ZV9jcmFz
aGtlcm5lbF9jbWEoY21hX3NpemUpOwogfQogCiBzdGF0aWMgcGh5c19hZGRyX3QgX19pbml0IG1h
eF96b25lX3BoeXMocGh5c19hZGRyX3Qgem9uZV9saW1pdCkKLS0gCjIuMzQuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
