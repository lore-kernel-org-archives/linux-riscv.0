Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20393C44500
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 13:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QaYTnEnu4b5bWVf090aoObeGV95HJvOvHMXiyHJ3zX8=; b=QnLeVj6EBE/3wU
	CQKh148yHK4ubcZ0Nr+S6x5Di41K1yF+wf38TMyKsrhHiPxCpFvWQCmkaJR9L5d+AycsPnoYsG5ev
	MCI4K2LIBwWxYEW2RF7G0ZdKlnSHQqFixuXeS1h6NbszMZIUsLC6I2CryDMYI2UJdIjumk6msVh8X
	6sh9Vf7bxOKSif44gJDYLzamYiRX3/Cuvgv30lpriEkW3zEqIY1wxwE8Z5hC09dbk29FN5hg+Dn9v
	KnDORmx5toQMJnL/f6Vr+EZ+WnAOXRIB/NHRyfJ7kIAwVBnHW5+QDkNGIy9Gk98eCBPbzCXatLZ7s
	gXtkJDTFt6Oqr9gKMbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBhW-0000000EfaE-1iMB;
	Mon, 29 Jun 2026 13:07:02 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBhS-0000000EfTs-2881;
	Mon, 29 Jun 2026 13:07:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2tgd8psQEJ0paMoFyhOqZDvuVvnTBva24LYJw5z0Xdw=;
	b=obS3f4t/Ekl9z/a/IDOrh1hP+eobkVYySkiX1b4nRKIGKUjwYNdeXqhPgqRDKjsdtlCpqmeah
	kFZXl4F2UaNIWX2ZKGvz+WWmGTLHxKiT4eIpFSMjifYhBYWT2dPpgX0Q9k4qXSG3boHoHWrzaD8
	5I3q5Yw/kqi1eZkFX8mJEv4=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gpmXq1Rgkz1T4gT;
	Mon, 29 Jun 2026 20:58:03 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 532E62025F;
	Mon, 29 Jun 2026 21:06:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 29 Jun
 2026 21:06:47 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <oleg@redhat.com>, <richard.henderson@linaro.org>, <mattst88@gmail.com>,
	<linmag7@gmail.com>, <linux@armlinux.org.uk>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <kees@kernel.org>, <guoren@kernel.org>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <geert@linux-m68k.org>,
	<tsbogend@alpha.franken.de>, <James.Bottomley@HansenPartnership.com>,
	<deller@gmx.de>, <maddy@linux.ibm.com>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>, <chleroy@kernel.org>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<hca@linux.ibm.com>, <gor@linux.ibm.com>, <agordeev@linux.ibm.com>,
	<borntraeger@linux.ibm.com>, <svens@linux.ibm.com>,
	<ysato@users.sourceforge.jp>, <dalias@libc.org>,
	<glaubitz@physik.fu-berlin.de>, <richard@nod.at>,
	<anton.ivanov@cambridgegreys.com>, <johannes@sipsolutions.net>,
	<luto@kernel.org>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <chris@zankel.net>,
	<jcmvbkbc@gmail.com>, <peterz@infradead.org>, <wad@chromium.org>,
	<ruanjinjie@huawei.com>, <thuth@redhat.com>, <mark.rutland@arm.com>,
	<ada.coupriediaz@arm.com>, <kevin.brodsky@arm.com>, <linusw@kernel.org>,
	<yeoreum.yun@arm.com>, <song@kernel.org>, <james.morse@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <liqiang01@kylinos.cn>,
	<pengcan@kylinos.cn>, <ryan.roberts@arm.com>, <yangtiezhu@loongson.cn>,
	<sshegde@linux.ibm.com>, <mchauras@linux.ibm.com>, <austin.kim@lge.com>,
	<jchrist@linux.ibm.com>, <arnd@arndb.de>, <thomas.weissschuh@linutronix.de>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>, <jgross@suse.com>,
	<kas@kernel.org>, <x86@kernel.org>, <linux-alpha@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>, <linux-csky@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-m68k@lists.linux-m68k.org>,
	<linux-mips@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<linux-um@lists.infradead.org>
Subject: [PATCH v16 03/18] arm64: ptrace: Pass thread flags to syscall_trace_enter/exit()
Date: Mon, 29 Jun 2026 21:06:01 +0800
Message-ID: <20260629130616.642022-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629130616.642022-1-ruanjinjie@huawei.com>
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_060658_869184_40ED2E3E 
X-CRM114-Status: GOOD (  10.18  )
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

UmVmYWN0b3Igc3lzY2FsbF90cmFjZV9lbnRlcigpIGFuZCBzeXNjYWxsX3RyYWNlX2V4aXQoKSB0
byBtb3ZlIHRocmVhZApmbGFnIHJlYWRpbmcgdG8gdGhlIGNhbGxlci4gVGhpcyBhbGlnbnMgYXJt
NjQncyBzeXNjYWxsIHRyYWNlIGVudGVyL2V4aXQKZnVuY3Rpb24gc2lnbmF0dXJlIHdpdGggZ2Vu
ZXJpYyBlbnRyeSBmcmFtZXdvcmsuCgpbQ2hhbmdlc10KMS4gRnVuY3Rpb24gc2lnbmF0dXJlIGNo
YW5nZXM6CiAgIC0gc3lzY2FsbF90cmFjZV9lbnRlcihyZWdzKSDihpIgc3lzY2FsbF90cmFjZV9l
bnRlcihyZWdzLCBmbGFncykKICAgLSBzeXNjYWxsX3RyYWNlX2V4aXQocmVncykg4oaSIHN5c2Nh
bGxfdHJhY2VfZXhpdChyZWdzLCBmbGFncykKCjIuIE1vdmUgZmxhZ3MgcmVhZGluZyB0byBjYWxs
ZXI6CiAgIC0gUHJldmlvdXNseTogcmVhZF90aHJlYWRfZmxhZ3MoKSBjYWxsZWQgaW5zaWRlIGVh
Y2ggZnVuY3Rpb24uCiAgIC0gTm93OiBjYWxsZXIgKGxpa2UgZWwwX3N2Y19jb21tb24pIHBhc3Nl
cyBmbGFncyBhcyBwYXJhbWV0ZXIuCgozLiBVcGRhdGUgc3lzY2FsbC5jOgogICAtIGVsMF9zdmNf
Y29tbW9uKCkgbm93IHBhc3NlcyBmbGFncyB0byB0cmFjaW5nIGZ1bmN0aW9ucyBhbmQKICAgICBy
ZS1mZXRjaGVzIGZsYWdzIGJlZm9yZSBlbnRyeS9leGl0IHRvIGhhbmRsZSBwb3RlbnRpYWwgVElG
CiAgICAgdXBkYXRlcy4KCltXaHkgdGhpcyBtYXR0ZXJzXQotIEFsaWducyBhcm02NCB3aXRoIHRo
ZSBnZW5lcmljIGVudHJ5IGludGVyZmFjZS4KLSBNYWtlcyBmdXR1cmUgbWlncmF0aW9uIHRvIGdl
bmVyaWMgZW50cnkgZnJhbWV3b3JrIHNtb290aGVyLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGlu
dGVuZGVkLgoKQ2M6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+CkNjOiBXaWxs
IERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPgpDYzogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1h
cmluYXNAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEFkYSBDb3VwcmllIERpYXogPGFkYS5jb3Vwcmll
ZGlhekBhcm0uY29tPgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5v
cmc+ClJldmlld2VkLWJ5OiBZZW9yZXVtIFl1biA8eWVvcmV1bS55dW5AYXJtLmNvbT4KUmV2aWV3
ZWQtYnk6IEtldmluIEJyb2Rza3kgPGtldmluLmJyb2Rza3lAYXJtLmNvbT4KU2lnbmVkLW9mZi1i
eTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4KLS0tCiBhcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL3N5c2NhbGwuaCB8IDQgKystLQogYXJjaC9hcm02NC9rZXJuZWwvcHRyYWNlLmMg
ICAgICAgfCA3ICsrLS0tLS0KIGFyY2gvYXJtNjQva2VybmVsL3N5c2NhbGwuYyAgICAgIHwgNSAr
KystLQogMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9zeXNjYWxsLmggYi9hcmNoL2FybTY0
L2luY2x1ZGUvYXNtL3N5c2NhbGwuaAppbmRleCA1ZTRjN2ZjNDRmNzMuLjMwYjIwM2VmMTU2YiAx
MDA2NDQKLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9zeXNjYWxsLmgKKysrIGIvYXJjaC9h
cm02NC9pbmNsdWRlL2FzbS9zeXNjYWxsLmgKQEAgLTEyMCw3ICsxMjAsNyBAQCBzdGF0aWMgaW5s
aW5lIGludCBzeXNjYWxsX2dldF9hcmNoKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaykKIAlyZXR1
cm4gQVVESVRfQVJDSF9BQVJDSDY0OwogfQogCi1pbnQgc3lzY2FsbF90cmFjZV9lbnRlcihzdHJ1
Y3QgcHRfcmVncyAqcmVncyk7Ci12b2lkIHN5c2NhbGxfdHJhY2VfZXhpdChzdHJ1Y3QgcHRfcmVn
cyAqcmVncyk7CitpbnQgc3lzY2FsbF90cmFjZV9lbnRlcihzdHJ1Y3QgcHRfcmVncyAqcmVncywg
dW5zaWduZWQgbG9uZyBmbGFncyk7Cit2b2lkIHN5c2NhbGxfdHJhY2VfZXhpdChzdHJ1Y3QgcHRf
cmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBmbGFncyk7CiAKICNlbmRpZgkvKiBfX0FTTV9TWVND
QUxMX0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL3B0cmFjZS5jIGIvYXJjaC9h
cm02NC9rZXJuZWwvcHRyYWNlLmMKaW5kZXggMmNhNmZhYjM5YTM3Li5hYzE1YjgxYTcxYjUgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtNjQva2VybmVsL3B0cmFjZS5jCisrKyBiL2FyY2gvYXJtNjQva2Vy
bmVsL3B0cmFjZS5jCkBAIC0yNDA4LDkgKzI0MDgsOCBAQCBzdGF0aWMgdm9pZCByZXBvcnRfc3lz
Y2FsbF9leGl0KHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCX0KIH0KIAotaW50IHN5c2NhbGxfdHJh
Y2VfZW50ZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCitpbnQgc3lzY2FsbF90cmFjZV9lbnRlcihz
dHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBmbGFncykKIHsKLQl1bnNpZ25lZCBs
b25nIGZsYWdzID0gcmVhZF90aHJlYWRfZmxhZ3MoKTsKIAlpbnQgcmV0OwogCiAJaWYgKGZsYWdz
ICYgKF9USUZfU1lTQ0FMTF9FTVUgfCBfVElGX1NZU0NBTExfVFJBQ0UpKSB7CkBAIC0yNDMyLDEw
ICsyNDMxLDggQEAgaW50IHN5c2NhbGxfdHJhY2VfZW50ZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
CiAJcmV0dXJuIHJlZ3MtPnN5c2NhbGxubzsKIH0KIAotdm9pZCBzeXNjYWxsX3RyYWNlX2V4aXQo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCit2b2lkIHN5c2NhbGxfdHJhY2VfZXhpdChzdHJ1Y3QgcHRf
cmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBmbGFncykKIHsKLQl1bnNpZ25lZCBsb25nIGZsYWdz
ID0gcmVhZF90aHJlYWRfZmxhZ3MoKTsKLQogCWF1ZGl0X3N5c2NhbGxfZXhpdChyZWdzKTsKIAog
CWlmIChmbGFncyAmIF9USUZfU1lTQ0FMTF9UUkFDRVBPSU5UKQpkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9rZXJuZWwvc3lzY2FsbC5jIGIvYXJjaC9hcm02NC9rZXJuZWwvc3lzY2FsbC5jCmluZGV4
IDM1OGRkZmJmMTQwMS4uYzhlMTE2Mzk3Y2ZkIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2tlcm5l
bC9zeXNjYWxsLmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvc3lzY2FsbC5jCkBAIC0xMTMsNyAr
MTEzLDcgQEAgc3RhdGljIHZvaWQgZWwwX3N2Y19jb21tb24oc3RydWN0IHB0X3JlZ3MgKnJlZ3Ms
IGludCBzY25vLCBpbnQgc2NfbnIsCiAJCSAqLwogCQlpZiAoc2NubyA9PSBOT19TWVNDQUxMKQog
CQkJc3lzY2FsbF9zZXRfcmV0dXJuX3ZhbHVlKGN1cnJlbnQsIHJlZ3MsIC1FTk9TWVMsIDApOwot
CQlzY25vID0gc3lzY2FsbF90cmFjZV9lbnRlcihyZWdzKTsKKwkJc2NubyA9IHN5c2NhbGxfdHJh
Y2VfZW50ZXIocmVncywgcmVhZF90aHJlYWRfZmxhZ3MoKSk7CiAJCWlmIChzY25vID09IE5PX1NZ
U0NBTEwpCiAJCQlnb3RvIHRyYWNlX2V4aXQ7CiAJfQpAQCAtMTMyLDcgKzEzMiw4IEBAIHN0YXRp
YyB2b2lkIGVsMF9zdmNfY29tbW9uKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBpbnQgc2NubywgaW50
IHNjX25yLAogCX0KIAogdHJhY2VfZXhpdDoKLQlzeXNjYWxsX3RyYWNlX2V4aXQocmVncyk7CisJ
ZmxhZ3MgPSByZWFkX3RocmVhZF9mbGFncygpOworCXN5c2NhbGxfdHJhY2VfZXhpdChyZWdzLCBm
bGFncyk7CiB9CiAKIHZvaWQgZG9fZWwwX3N2YyhzdHJ1Y3QgcHRfcmVncyAqcmVncykKLS0gCjIu
MzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
