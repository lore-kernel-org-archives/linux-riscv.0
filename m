Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AA4CD5BD1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 09:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2QmYHmNe031dUjHG0hGEWmt7bXNQe0E1kHr35aIoqKA=; b=BQHNLFkKD22I5l
	paW6aBqsmP7H9BRWGx9cf29Uiv7ytGBztcU5P9LKMaskm3GDZW55Plbm6Of8GwDFtS/48ATPhsPbg
	5pdOhRmWBDxRhhzMhsN/sgC0AoQXLRyencimC6Fi5J2GYN0zEerN0EFazh9B8aRreQCagmarc2RZd
	HRIhs1zmbI/iqXX2hyJwEVJDNDDXchZgJXseUVb4M51ULc+P4EgVEeJ/meTIJPdqClp01mIdZL67C
	1LYs2/5FGzrmD0MS1Vy7QWFc/fqtMdPJ+ZOPAr+6ZVNnRUday8sih9QvdBRXAx9qd9aCNoHayte0o
	rwzDQ6ZvlN/rJ04n9cFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzHa-0000000AY55-12PL;
	Mon, 01 Jun 2026 09:50:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzHX-0000000AY1H-1iCw;
	Mon, 01 Jun 2026 09:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JhYJvE/GhQydUAJcrbUk3aDyXMPQ/ckx7nLUeIZgB5Y=; b=UyvYapoSzkdJdl4UeODPt0VSmU
	SI3qQ5zmjembbOAYgXfOxfBTZD9OIezP+FuVT0apZJIjROCGdcH6OclnoWMF6MiiYBAHwHS0Whyfs
	mTkY5XmmzyKBRspXntQEP/RGIHJ8A36z6UAsEsa9dqvrrMwJ1lvuIVq/gtpsjXdHEuRcXz+Xk7L8t
	/uZn6BMTMmu6yh9zYNeVyfnUNapPUq+PLgPMtQ43w26awKoP7rfWGtsTmlFn72mXoXslo212I4y9K
	F87IXinT0mwWegJwpMrBz8STb5KWfdagU/M9eJ0arj3Q0jrssv39vYRiyb4+9CL/1YTUMCeDn4g/a
	ZICTO3Pw==;
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzHS-00000006I93-2Xh7;
	Mon, 01 Jun 2026 09:50:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JhYJvE/GhQydUAJcrbUk3aDyXMPQ/ckx7nLUeIZgB5Y=;
	b=PAcKayAmwzYGQXXcnlJ9zJ3jrC4/A2b51RtkifSRjjCtuTa0lUInTSzMedb1BuM8a6T+ONzv3
	VTtsJd+pt3CAYeT3RW1i4ZitvR4Xa88yWPTSQXh+tdtKZOLfeYv4TeLAgizh0WO0YRvSqupgjr9
	6/rYQ9+TTmf2yEQZNce1Jjw=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gTTWx34pYzpSvD;
	Mon,  1 Jun 2026 17:42:21 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 5CFA04048F;
	Mon,  1 Jun 2026 17:49:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 1 Jun
 2026 17:49:52 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <rppt@kernel.org>,
	<pasha.tatashin@soleen.com>, <pratyush@kernel.org>, <ruirui.yang@linux.dev>,
	<rdunlap@infradead.org>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<kuba@kernel.org>, <lirongqing@baidu.com>, <ebiggers@kernel.org>,
	<paulmck@kernel.org>, <sourabhjain@linux.ibm.com>, <thuth@redhat.com>,
	<ardb@kernel.org>, <masahiroy@kernel.org>, <gshan@redhat.com>,
	<james.morse@arm.com>, <maz@kernel.org>, <leitao@debian.org>,
	<yeoreum.yun@arm.com>, <coxu@redhat.com>, <suzuki.poulose@arm.com>,
	<cfsworks@gmail.com>, <osandov@fb.com>, <jbohac@suse.cz>,
	<ryan.roberts@arm.com>, <tangyouling@kylinos.cn>, <ritesh.list@gmail.com>,
	<adityag@linux.ibm.com>, <hbathini@linux.ibm.com>, <bjorn@rivosinc.com>,
	<songshuaishuai@tinylab.org>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <djordje.todorovic@htecgroup.com>,
	<austin.kim@lge.com>, <namcao@linutronix.de>, <djbw@kernel.org>,
	<chao.gao@intel.com>, <seanjc@google.com>, <fuqiang.wang@easystack.cn>,
	<liaoyuanhong@vivo.com>, <makb@juniper.net>, <graf@amazon.com>,
	<piliu@redhat.com>, <rafael.j.wysocki@intel.com>,
	<mario.limonciello@amd.com>, <jbouron@amazon.com>, <chenjiahao16@huawei.com>,
	<guoren@kernel.org>, <bauerman@linux.ibm.com>, <bgwin@google.com>,
	<takahiro.akashi@linaro.org>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v15 21/23] arm64: kexec_file: Add support for crashkernel CMA reservation
Date: Mon, 1 Jun 2026 17:48:03 +0800
Message-ID: <20260601094805.2928614-22-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601094805.2928614-1-ruanjinjie@huawei.com>
References: <20260601094805.2928614-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_104959_497671_09E55C8E 
X-CRM114-Status: GOOD (  21.43  )
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
ZWN0dXJlLgoKVGVzdGVkLWJ5OiBCcmVubyBMZWl0YW8gPGxlaXRhb0BkZWJpYW4ub3JnPgpBY2tl
ZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KQWNrZWQtYnk6
IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+CkFja2VkLWJ5OiBCYW9xdWFuIEhl
IDxiaGVAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IE1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkgPHJw
cHRAa2VybmVsLm9yZz4KQWNrZWQtYnk6IEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+
ClNpZ25lZC1vZmYtYnk6IEppbmppZSBSdWFuIDxydWFuamluamllQGh1YXdlaS5jb20+Ci0tLQp2
NzoKLSBDb3JyZWN0IHRoZSBpbmNsdXNpb24gb2YgQ01BLXJlc2VydmVkIHJhbmdlcyBmb3Iga2R1
bXAKICBrZXJuZWwgaW4gb2Yva2V4ZWMuCnYzOgotIEFkZCBBY2tlZC1ieS4KdjI6Ci0gRnJlZSBj
bWVtIGluIHByZXBhcmVfZWxmX2hlYWRlcnMoKQotIEFkZCB0aGUgbXRpdmF0aW9uLgotLS0KIERv
Y3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IHwgMiArLQogYXJj
aC9hcm02NC9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMgICAgICAgICAgfCAyICstCiBhcmNo
L2FybTY0L21tL2luaXQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDUgKysrLS0KIGRy
aXZlcnMvb2YvZmR0LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgOSArKysrKy0t
LS0KIGRyaXZlcnMvb2Yva2V4ZWMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgOSAr
KysrKysrKysKIGluY2x1ZGUvbGludXgvY3Jhc2hfcmVzZXJ2ZS5oICAgICAgICAgICAgICAgICAg
IHwgNCArKystCiA2IGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1l
dGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4
dAppbmRleCA0ZDBmNTQ1ZmIzZWMuLjUyNzQyZmFiNDlhOSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKKysrIGIvRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKQEAgLTExMTksNyArMTExOSw3IEBA
IEtlcm5lbCBwYXJhbWV0ZXJzCiAJCQlJdCB3aWxsIGJlIGlnbm9yZWQgd2hlbiBjcmFzaGtlcm5l
bD1YLGhpZ2ggaXMgbm90IHVzZWQKIAkJCW9yIG1lbW9yeSByZXNlcnZlZCBpcyBiZWxvdyA0Ry4K
IAljcmFzaGtlcm5lbD1zaXplW0tNR10sY21hCi0JCQlbS05MLCBYODYsIHBwY10gUmVzZXJ2ZSBh
ZGRpdGlvbmFsIGNyYXNoIGtlcm5lbCBtZW1vcnkgZnJvbQorCQkJW0tOTCwgWDg2LCBBUk02NCwg
UFBDXSBSZXNlcnZlIGFkZGl0aW9uYWwgY3Jhc2gga2VybmVsIG1lbW9yeSBmcm9tCiAJCQlDTUEu
IFRoaXMgcmVzZXJ2YXRpb24gaXMgdXNhYmxlIGJ5IHRoZSBmaXJzdCBzeXN0ZW0ncwogCQkJdXNl
cnNwYWNlIG1lbW9yeSBhbmQga2VybmVsIG1vdmFibGUgYWxsb2NhdGlvbnMgKG1lbW9yeQogCQkJ
YmFsbG9vbiwgenN3YXApLiBQYWdlcyBhbGxvY2F0ZWQgZnJvbSB0aGlzIG1lbW9yeSByYW5nZQpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMgYi9hcmNo
L2FybTY0L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYwppbmRleCAxNGU2NTM1MTEzM2UuLmQw
ZjczZWIzZjg1NiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvbWFjaGluZV9rZXhlY19m
aWxlLmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMKQEAgLTQz
LDcgKzQzLDcgQEAgaW50IGFyY2hfa2ltYWdlX2ZpbGVfcG9zdF9sb2FkX2NsZWFudXAoc3RydWN0
IGtpbWFnZSAqaW1hZ2UpCiB1bnNpZ25lZCBpbnQgYXJjaF9nZXRfc3lzdGVtX25yX3Jhbmdlcyh2
b2lkKQogewogCS8qIGZvciBleGNsdXNpb24gb2YgY3Jhc2hrZXJuZWwgcmVnaW9uICovCi0JdW5z
aWduZWQgaW50IG5yX3JhbmdlcyA9IDIgKyBDUkFTSF9IT1RQTFVHX1NBRkVUWV9QQURESU5HOwor
CXVuc2lnbmVkIGludCBucl9yYW5nZXMgPSAyICsgY3Jhc2hrX2NtYV9jbnQgKyBDUkFTSF9IT1RQ
TFVHX1NBRkVUWV9QQURESU5HOwogCXBoeXNfYWRkcl90IHN0YXJ0LCBlbmQ7CiAJdTY0IGk7CiAK
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vaW5pdC5jIGIvYXJjaC9hcm02NC9tbS9pbml0LmMK
aW5kZXggOTc5ODdmODUwYTMzLi4yMjdmNTg1MjJkYWQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQv
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
eF96b25lX3BoeXMocGh5c19hZGRyX3Qgem9uZV9saW1pdCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
b2YvZmR0LmMgYi9kcml2ZXJzL29mL2ZkdC5jCmluZGV4IDgyZjczMjdjNTllYS4uMDQ3MGFjYmQx
ZmNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL29mL2ZkdC5jCisrKyBiL2RyaXZlcnMvb2YvZmR0LmMK
QEAgLTg4MCwxMSArODgwLDEyIEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIGNob3Nlbl9ub2RlX29m
ZnNldCA9IC1GRFRfRVJSX05PVEZPVU5EOwogLyoKICAqIFRoZSBtYWluIHVzYWdlIG9mIGxpbnV4
LHVzYWJsZS1tZW1vcnktcmFuZ2UgaXMgZm9yIGNyYXNoIGR1bXAga2VybmVsLgogICogT3JpZ2lu
YWxseSwgdGhlIG51bWJlciBvZiB1c2FibGUtbWVtb3J5IHJlZ2lvbnMgaXMgb25lLiBOb3cgdGhl
cmUgbWF5Ci0gKiBiZSB0d28gcmVnaW9ucywgbG93IHJlZ2lvbiBhbmQgaGlnaCByZWdpb24uCi0g
KiBUbyBtYWtlIGNvbXBhdGliaWxpdHkgd2l0aCBleGlzdGluZyB1c2VyLXNwYWNlIGFuZCBvbGRl
ciBrZHVtcCwgdGhlIGxvdwotICogcmVnaW9uIGlzIGFsd2F5cyB0aGUgbGFzdCByYW5nZSBvZiBs
aW51eCx1c2FibGUtbWVtb3J5LXJhbmdlIGlmIGV4aXN0LgorICogYmUgMiArIENSQVNIS19DTUFf
UkFOR0VTX01BWCByZWdpb25zLCBsb3cgcmVnaW9uLCBoaWdoIHJlZ2lvbiBhbmQgY21hCisgKiBy
ZWdpb25zLiBUbyBtYWtlIGNvbXBhdGliaWxpdHkgd2l0aCBleGlzdGluZyB1c2VyLXNwYWNlIGFu
ZCBvbGRlciBrZHVtcCwKKyAqIHRoZSBoaWdoIGFuZCBsb3cgcmVnaW9uIGFyZSBhbHdheXMgdGhl
IGZpcnN0IHR3byByYW5nZXMgb2YKKyAqIGxpbnV4LHVzYWJsZS1tZW1vcnktcmFuZ2UgaWYgZXhp
c3QuCiAgKi8KLSNkZWZpbmUgTUFYX1VTQUJMRV9SQU5HRVMJCTIKKyNkZWZpbmUgTUFYX1VTQUJM
RV9SQU5HRVMJCSgyICsgQ1JBU0hLX0NNQV9SQU5HRVNfTUFYKQogCiAvKioKICAqIGVhcmx5X2lu
aXRfZHRfY2hlY2tfZm9yX3VzYWJsZV9tZW1fcmFuZ2UgLSBEZWNvZGUgdXNhYmxlIG1lbW9yeSBy
YW5nZQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9rZXhlYy5jIGIvZHJpdmVycy9vZi9rZXhlYy5j
CmluZGV4IGI2ODM3ZTI5OWU3Zi4uMDI5OTAzYjk4NmNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL29m
L2tleGVjLmMKKysrIGIvZHJpdmVycy9vZi9rZXhlYy5jCkBAIC00NTgsNiArNDU4LDE1IEBAIHZv
aWQgKm9mX2tleGVjX2FsbG9jX2FuZF9zZXR1cF9mZHQoY29uc3Qgc3RydWN0IGtpbWFnZSAqaW1h
Z2UsCiAJCQlpZiAocmV0KQogCQkJCWdvdG8gb3V0OwogCQl9CisKKwkJZm9yIChpbnQgaSA9IDA7
IGkgPCBjcmFzaGtfY21hX2NudDsgaSsrKSB7CisJCQlyZXQgPSBmZHRfYXBwZW5kcHJvcF9hZGRy
cmFuZ2UoZmR0LCAwLCBjaG9zZW5fbm9kZSwKKwkJCQkJImxpbnV4LHVzYWJsZS1tZW1vcnktcmFu
Z2UiLAorCQkJCQljcmFzaGtfY21hX3Jhbmdlc1tpXS5zdGFydCwKKwkJCQkJY3Jhc2hrX2NtYV9y
YW5nZXNbaV0uZW5kIC0gY3Jhc2hrX2NtYV9yYW5nZXNbaV0uc3RhcnQgKyAxKTsKKwkJCWlmIChy
ZXQpCisJCQkJZ290byBvdXQ7CisJCX0KICNlbmRpZgogCX0KIApkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9jcmFzaF9yZXNlcnZlLmggYi9pbmNsdWRlL2xpbnV4L2NyYXNoX3Jlc2VydmUuaApp
bmRleCBmMGRjMDNkOTRjYTIuLjMwODY0ZDkwZDdmNSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51
eC9jcmFzaF9yZXNlcnZlLmgKKysrIGIvaW5jbHVkZS9saW51eC9jcmFzaF9yZXNlcnZlLmgKQEAg
LTE0LDkgKzE0LDExIEBACiBleHRlcm4gc3RydWN0IHJlc291cmNlIGNyYXNoa19yZXM7CiBleHRl
cm4gc3RydWN0IHJlc291cmNlIGNyYXNoa19sb3dfcmVzOwogZXh0ZXJuIHN0cnVjdCByYW5nZSBj
cmFzaGtfY21hX3Jhbmdlc1tdOworCisjZGVmaW5lIENSQVNIS19DTUFfUkFOR0VTX01BWCA0CiAj
aWYgZGVmaW5lZChDT05GSUdfQ01BKSAmJiBkZWZpbmVkKENPTkZJR19BUkNIX0hBU19HRU5FUklD
X0NSQVNIS0VSTkVMX1JFU0VSVkFUSU9OKQogI2RlZmluZSBDUkFTSEtFUk5FTF9DTUEKLSNkZWZp
bmUgQ1JBU0hLRVJORUxfQ01BX1JBTkdFU19NQVggNAorI2RlZmluZSBDUkFTSEtFUk5FTF9DTUFf
UkFOR0VTX01BWCAoQ1JBU0hLX0NNQV9SQU5HRVNfTUFYKQogZXh0ZXJuIGludCBjcmFzaGtfY21h
X2NudDsKICNlbHNlCiAjZGVmaW5lIGNyYXNoa19jbWFfY250IDAKLS0gCjIuMzQuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
