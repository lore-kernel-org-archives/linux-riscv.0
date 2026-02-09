Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD58E7E0BC
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 09:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A74kOTokBXVtjXSdUO9OTh4pXx2QtnuyaBWR5BW91Q0=; b=b/D3dWGpw6+c4Z
	zunLce51uL9NP/prhF4UZzwVUod//KOx9ZBIZPIa31bZzg9cdlLNmv2yYBWxJ7EBYcY9raw+X7w8v
	TdpL4Wa6BilaT/+kJ+E/gEvYbrBoMErRc/7SzWnMpgxwXKBLseV7LaTtyGS0RYabd+Yn0j/d6OsHf
	8+legiToYBLpiwAA8GIYTekECCnXek9uzPD8bsKippc3NEF3VoSXdkMRleMulsYfsXXoVY8O5BKdS
	QBDw77aa6aGqTuVS+cd2y8/XpZIdkK7AvZrwLyc96zX46jvwIOx3MKUbgOXmYmZ4iHInTxFbf1w6W
	o5lVnYrZrqPKF0gOj3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpO2i-0000000FCmp-1xaM;
	Mon, 09 Feb 2026 09:58:56 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpO2e-0000000FCiT-1XHZ;
	Mon, 09 Feb 2026 09:58:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=A7QSD0FZxPYGa9nM/vOmRlehchcq+wPFipR/HtdIIvk=;
	b=lZ9hS/qnzUPwxNJd4kCYOh4uN0Q8ShB745NEqXHiPySEmqU1DMVTtzwGtCeICu9S654aPh3kb
	Y3CbKrQ74CjPdXLzIdQlWGIOPaWwJWngtd2Ywql6AzsZvRZ+esf6OoGrXNPpEUzCPVqt8ZDrvNY
	dpjJ/qmocCnQODqgczGI8fE=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4f8g581GmGz1prMr;
	Mon,  9 Feb 2026 17:54:04 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C96AD40363;
	Mon,  9 Feb 2026 17:58:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Feb
 2026 17:58:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<bhe@redhat.com>, <vgoyal@redhat.com>, <dyoung@redhat.com>,
	<rdunlap@infradead.org>, <pmladek@suse.com>, <feng.tang@linux.alibaba.com>,
	<pawan.kumar.gupta@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<arnd@arndb.de>, <lirongqing@baidu.com>, <fvdl@google.com>,
	<leitao@debian.org>, <rppt@kernel.org>, <ardb@kernel.org>, <jbohac@suse.cz>,
	<sourabhjain@linux.ibm.com>, <osandov@fb.com>, <ryan.roberts@arm.com>,
	<cfsworks@gmail.com>, <tangyouling@kylinos.cn>, <ritesh.list@gmail.com>,
	<thuth@redhat.com>, <hbathini@linux.ibm.com>, <eajames@linux.ibm.com>,
	<bjorn@rivosinc.com>, <songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
	<samuel.holland@sifive.com>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <dwmw@amazon.co.uk>, <pbonzini@redhat.com>,
	<thomas.lendacky@amd.com>, <kai.huang@intel.com>, <ubizjak@gmail.com>,
	<coxu@redhat.com>, <liaoyuanhong@vivo.com>, <fuqiang.wang@easystack.cn>,
	<brgerst@gmail.com>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 2/3] arm64: kexec: Add support for crashkernel CMA reservation
Date: Mon, 9 Feb 2026 17:59:30 +0800
Message-ID: <20260209095931.2813152-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209095931.2813152-1-ruanjinjie@huawei.com>
References: <20260209095931.2813152-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_015852_708756_BD250C5B 
X-CRM114-Status: GOOD (  14.19  )
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
ZCByYW5nZXMgZm9yIGtkdW1wIGtlcm5lbCB0byB1c2UsIHdoaWNoIGlzCiAgdGhlIGNyYXNoIGNv
cmUgZGVmYXVsdCBpbXBsZW1lbnRhdGlvbiwgc28gbm90aGluZyBuZWVkcyB0byBiZSBkb25lLgot
IEV4Y2x1ZGUgdGhlIENNQS1yZXNlcnZlZCByYW5nZXMgZnJvbSB0aGUgY3Jhc2gga2VybmVsIG1l
bW9yeSB0bwogIHByZXZlbnQgdGhlbSBmcm9tIGJlaW5nIGV4cG9ydGVkIHRocm91Z2ggL3Byb2Mv
dm1jb3JlLCB3aGljaCBpcyBhbHJlYWR5CiAgZG9uZSBpbiB0aGUgY3Jhc2ggY29yZS4KClVwZGF0
ZSBrZXJuZWwtcGFyYW1ldGVycy50eHQgdG8gZG9jdW1lbnQgQ01BIHN1cHBvcnQgZm9yIGNyYXNo
a2VybmVsIG9uCmFybTY0IGFyY2hpdGVjdHVyZS4KCkFja2VkLWJ5OiBBcmQgQmllc2hldXZlbCA8
YXJkYkBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBKaW5qaWUgUnVhbiA8cnVhbmppbmppZUBo
dWF3ZWkuY29tPgotLS0KdjM6Ci0gQWRkIEFja2VkLWJ5Lgp2MjoKLSBGcmVlIGNtZW0gaW4gcHJl
cGFyZV9lbGZfaGVhZGVycygpCi0gQWRkIHRoZSBtdGl2YXRpb24uCi0tLQogRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgfCAyICstCiBhcmNoL2FybTY0L21t
L2luaXQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDUgKysrLS0KIDIgZmlsZXMgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IGIvRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKaW5kZXggMTA1OGYyYTZkNmE4Li4z
NmJiNjQyYTdlZGQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVs
LXBhcmFtZXRlcnMudHh0CisrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBh
cmFtZXRlcnMudHh0CkBAIC0xMTE5LDcgKzExMTksNyBAQCBLZXJuZWwgcGFyYW1ldGVycwogCQkJ
SXQgd2lsbCBiZSBpZ25vcmVkIHdoZW4gY3Jhc2hrZXJuZWw9WCxoaWdoIGlzIG5vdCB1c2VkCiAJ
CQlvciBtZW1vcnkgcmVzZXJ2ZWQgaXMgYmVsb3cgNEcuCiAJY3Jhc2hrZXJuZWw9c2l6ZVtLTUdd
LGNtYQotCQkJW0tOTCwgWDg2LCBwcGNdIFJlc2VydmUgYWRkaXRpb25hbCBjcmFzaCBrZXJuZWwg
bWVtb3J5IGZyb20KKwkJCVtLTkwsIFg4NiwgQVJNNjQsIHBwY10gUmVzZXJ2ZSBhZGRpdGlvbmFs
IGNyYXNoIGtlcm5lbCBtZW1vcnkgZnJvbQogCQkJQ01BLiBUaGlzIHJlc2VydmF0aW9uIGlzIHVz
YWJsZSBieSB0aGUgZmlyc3Qgc3lzdGVtJ3MKIAkJCXVzZXJzcGFjZSBtZW1vcnkgYW5kIGtlcm5l
bCBtb3ZhYmxlIGFsbG9jYXRpb25zIChtZW1vcnkKIAkJCWJhbGxvb24sIHpzd2FwKS4gUGFnZXMg
YWxsb2NhdGVkIGZyb20gdGhpcyBtZW1vcnkgcmFuZ2UKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
bW0vaW5pdC5jIGIvYXJjaC9hcm02NC9tbS9pbml0LmMKaW5kZXggNTI0ZDM0YTBlOTIxLi4yODE2
NWQ5NGFmMDggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvbW0vaW5pdC5jCisrKyBiL2FyY2gvYXJt
NjQvbW0vaW5pdC5jCkBAIC05Niw4ICs5Niw4IEBAIHBoeXNfYWRkcl90IF9fcm9fYWZ0ZXJfaW5p
dCBhcm02NF9kbWFfcGh5c19saW1pdDsKIAogc3RhdGljIHZvaWQgX19pbml0IGFyY2hfcmVzZXJ2
ZV9jcmFzaGtlcm5lbCh2b2lkKQogeworCXVuc2lnbmVkIGxvbmcgbG9uZyBjcmFzaF9iYXNlLCBj
cmFzaF9zaXplLCBjbWFfc2l6ZSA9IDA7CiAJdW5zaWduZWQgbG9uZyBsb25nIGxvd19zaXplID0g
MDsKLQl1bnNpZ25lZCBsb25nIGxvbmcgY3Jhc2hfYmFzZSwgY3Jhc2hfc2l6ZTsKIAlib29sIGhp
Z2ggPSBmYWxzZTsKIAlpbnQgcmV0OwogCkBAIC0xMDYsMTEgKzEwNiwxMiBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgYXJjaF9yZXNlcnZlX2NyYXNoa2VybmVsKHZvaWQpCiAKIAlyZXQgPSBwYXJzZV9j
cmFzaGtlcm5lbChib290X2NvbW1hbmRfbGluZSwgbWVtYmxvY2tfcGh5c19tZW1fc2l6ZSgpLAog
CQkJCSZjcmFzaF9zaXplLCAmY3Jhc2hfYmFzZSwKLQkJCQkmbG93X3NpemUsIE5VTEwsICZoaWdo
KTsKKwkJCQkmbG93X3NpemUsICZjbWFfc2l6ZSwgJmhpZ2gpOwogCWlmIChyZXQpCiAJCXJldHVy
bjsKIAogCXJlc2VydmVfY3Jhc2hrZXJuZWxfZ2VuZXJpYyhjcmFzaF9zaXplLCBjcmFzaF9iYXNl
LCBsb3dfc2l6ZSwgaGlnaCk7CisJcmVzZXJ2ZV9jcmFzaGtlcm5lbF9jbWEoY21hX3NpemUpOwog
fQogCiBzdGF0aWMgcGh5c19hZGRyX3QgX19pbml0IG1heF96b25lX3BoeXMocGh5c19hZGRyX3Qg
em9uZV9saW1pdCkKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
