Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AC4C43638
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 13:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k/4v86BDoEOiQZD/T432rFdxlWNSppKzWp52RrVkvMM=; b=Pps+u4rc+t6l5+
	w6tuBLtkuwRZneCf2qGyPaGqrHWMJxkFlcnp0rShrD5La9+8NCLBclBopbUXBC4LUl3xAoz3PRqSU
	graSc6IJngT0Njs1XIhCgPwLFCtbci144Mo4DWZByh34G+/v7mV/iIkhlvZbfNqqwEJj9DruQWKjv
	/gCv9A3u2fYLZ7FzdqK3rWW+y+xcqHsdEq99aFemos+O0euoH1tKHtDYnyi//7mca3rl2cez4P3jl
	0nbEDpbkNBWxScH0OKA4mMwMkf0hxCo33bM5p3uWQkKiKnCGKRMAaXPN3tNNaIV8UjGc+ZV0AtG0J
	eIIdNRVajILtZDXg6Qmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBiP-0000000Egkm-3xmk;
	Mon, 29 Jun 2026 13:07:57 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBiJ-0000000EgY4-3yhp;
	Mon, 29 Jun 2026 13:07:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+4M70Gapyp6lHxcKfDwoDJcCaABh3//z1ZN+1TfSdMw=;
	b=cSATadQt9PmNn538c0HHU4sX8smMeILhM4/tfoRnYuXf0zwowoLl3eZcV10IFFxBuD4+cb08H
	+KSbgdGzMyMpvYFbzcGOgEDWHH66J/pCKAly7VOfjRPdrY2/LCxyITtutjzl5BZTqlAVvhPbgi3
	gxod+gURdaXV7rMOTz85YpE=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gpmYY75QYzRhqt;
	Mon, 29 Jun 2026 20:58:41 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 3B07540575;
	Mon, 29 Jun 2026 21:07:49 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 29 Jun
 2026 21:07:45 +0800
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
Subject: [PATCH v16 17/18] arm64: Inline el0_svc_common()
Date: Mon, 29 Jun 2026 21:06:15 +0800
Message-ID: <20260629130616.642022-18-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629130616.642022-1-ruanjinjie@huawei.com>
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_060752_351132_72128AEE 
X-CRM114-Status: UNSURE (   9.97  )
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

QWZ0ZXIgY29udmVydGluZyBhcm02NCB0byBHZW5lcmljIEVudHJ5IGZyYW1ld29yaywgdGhlIGNv
bXBpbGVyIG5vIGxvbmdlcgppbmxpbmVzIGVsMF9zdmNfY29tbW9uKCkgaW50byBpdHMgY2FsbGVy
IGRvX2VsMF9zdmMoKS4gVGhpcyBpbnRyb2R1Y2VzCmEgc21hbGwgYnV0IG1lYXN1cmFibGUgb3Zl
cmhlYWQgaW4gdGhlIGNyaXRpY2FsIHN5c3RlbSBjYWxsIHBhdGguCgpNYW51YWxseSBmb3JjaW5n
IGVsMF9zdmNfY29tbW9uKCkgdG8gYmUgaW5saW5lZCByZXN0b3JlcyB0aGUKcGVyZm9ybWFuY2Uu
IEJlbmNobWFya2luZyB3aXRoIHBlcmYgYmVuY2ggc3lzY2FsbCBiYXNpYyBvbiBhCkt1bnBlbmcg
OTIwIHBsYXRmb3JtIChiYXNlZCBvbiB2Ni4xOS1yYzEpIHNob3dzIGEgfjElIHBlcmZvcm1hbmNl
CnVwbGlmdC4KCklubGluaW5nIHRoaXMgZnVuY3Rpb24gcmVkdWNlcyBmdW5jdGlvbiBwcm9sb2d1
ZS9lcGlsb2d1ZSBvdmVyaGVhZAphbmQgYWxsb3dzIGZvciBiZXR0ZXIgY29tcGlsZXIgb3B0aW1p
emF0aW9uIGluIHRoZSBob3Qgc3lzdGVtIGNhbGwKZGlzcGF0Y2ggcGF0aC4KCnwgTWV0cmljICAg
ICB8IFcvTyB0aGlzIHBhdGNoIHwgV2l0aCB0aGlzIHBhdGNoIHwgQ2hhbmdlICAgIHwKfCAtLS0t
LS0tLS0tIHwgLS0tLS0tLS0tLS0tLS0gfCAtLS0tLS0tLS0tLS0tLS0gfCAtLS0tLS0tLS0gfAp8
IFRvdGFsIHRpbWUgfCAyLjE5NSBbc2VjXSAgICB8IDIuMTcxIFtzZWNdICAgICB8ICDihpMxLjEl
ICAgfAp8IHVzZWNzL29wICAgfCAwLjIxOTU3NSAgICAgICB8IDAuMjE3MTkyICAgICAgICB8ICDi
hpMxLjElICAgfAp8IG9wcy9zZWMgICAgfCA0LDU1NCwyNjAgICAgICB8IDQsNjA0LDIyNSAgICAg
ICB8ICDihpExLjElICAgIHwKCkNjOiBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29t
PgpDYzogV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4KQ2M6IENhdGFsaW4gTWFyaW5hcyA8
Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+ClJldmlld2VkLWJ5OiBBZGEgQ291cHJpZSBEaWF6IDxh
ZGEuY291cHJpZWRpYXpAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVz
d0BrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogWWVvcmV1bSBZdW4gPHllb3JldW0ueXVuQGFybS5j
b20+ClJldmlld2VkLWJ5OiBLZXZpbiBCcm9kc2t5IDxrZXZpbi5icm9kc2t5QGFybS5jb20+ClNp
Z25lZC1vZmYtYnk6IEppbmppZSBSdWFuIDxydWFuamluamllQGh1YXdlaS5jb20+Ci0tLQogYXJj
aC9hcm02NC9rZXJuZWwvc3lzY2FsbC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVs
L3N5c2NhbGwuYyBiL2FyY2gvYXJtNjQva2VybmVsL3N5c2NhbGwuYwppbmRleCA0MWEzYjcwYTkz
NzQuLmUwYTk4ZmFjM2I4NSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvc3lzY2FsbC5j
CisrKyBiL2FyY2gvYXJtNjQva2VybmVsL3N5c2NhbGwuYwpAQCAtNTUsOCArNTUsOCBAQCBzdGF0
aWMgdm9pZCBpbnZva2Vfc3lzY2FsbChzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgaW50
IHNjbm8sCiAJc3lzY2FsbF9zZXRfcmV0dXJuX3ZhbHVlKGN1cnJlbnQsIHJlZ3MsIDAsIHJldCk7
CiB9CiAKLXN0YXRpYyB2b2lkIGVsMF9zdmNfY29tbW9uKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBp
bnQgc2NubywgaW50IHNjX25yLAotCQkJICAgY29uc3Qgc3lzY2FsbF9mbl90IHN5c2NhbGxfdGFi
bGVbXSkKK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBlbDBfc3ZjX2NvbW1vbihzdHJ1Y3Qg
cHRfcmVncyAqcmVncywgaW50IHNjbm8sIGludCBzY19uciwKKwkJCQkJICAgY29uc3Qgc3lzY2Fs
bF9mbl90IHN5c2NhbGxfdGFibGVbXSkKIHsKIAl1bnNpZ25lZCBsb25nIGZsYWdzID0gcmVhZF90
aHJlYWRfZmxhZ3MoKTsKIAl1bnNpZ25lZCBsb25nIHdvcms7Ci0tIAoyLjM0LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
