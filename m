Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BE9C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 07:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9IZQWzhmIrWcnCCNWJNAkmZBui0RHKH9f7XzulH5AY8=; b=dv2DV5VlnEoOyY
	Si483c+/ma3q/OwIlLj0XlJLBSm37uMSitHgQJOSGSemf2MyMuBxkBqWGWPTTXvIw2hIwpsnontLW
	7DHj3JEp2lE67xjv95SKWzXE7mTF39XhI+6uBX1v1ZgUNAN4bHO+M7WFO5xWSsqwonVRTpp0RJu0w
	n7L4IAVzlDJTe1tYFiA0dWzRiijqIwe0aEcvGSu+Na2IqFcuELxwkw5oNk4L5nZQCRWW/qSBf774+
	r9vzxs1BqfMaW9VQwDqx2Xa0QLPTnCEA1sJMCilELdbZg1nNVDog68poPw4heHeb7NGChwx91PDBJ
	CJFenzYcb/z9WZVtv8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDJIC-00DrLl-0n;
	Wed, 13 Dec 2023 07:04:28 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDJI6-00DrHP-2l;
	Wed, 13 Dec 2023 07:04:24 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3BD73HrQ032167;
	Wed, 13 Dec 2023 15:03:17 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Wed, 13 Dec 2023
 15:03:13 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <acme@kernel.org>, <adrian.hunter@intel.com>, <ajones@ventanamicro.com>,
        <alexander.shishkin@linux.intel.com>, <andre.przywara@arm.com>,
        <anup@brainfault.org>, <aou@eecs.berkeley.edu>,
        <atishp@atishpatra.org>, <conor+dt@kernel.org>,
        <conor.dooley@microchip.com>, <conor@kernel.org>,
        <devicetree@vger.kernel.org>, <dminus@andestech.com>,
        <evan@rivosinc.com>, <geert+renesas@glider.be>, <guoren@kernel.org>,
        <heiko@sntech.de>, <irogers@google.com>, <jernej.skrabec@gmail.com>,
        <jolsa@kernel.org>, <jszhang@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-perf-users@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <locus84@andestech.com>,
        <magnus.damm@gmail.com>, <mark.rutland@arm.com>, <mingo@redhat.com>,
        <n.shubin@yadro.com>, <namhyung@kernel.org>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <peterlin@andestech.com>,
        <peterz@infradead.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <rdunlap@infradead.org>, <robh+dt@kernel.org>, <samuel@sholland.org>,
        <sunilvl@ventanamicro.com>, <tglx@linutronix.de>,
        <tim609@andestech.com>, <uwu@icenowy.me>, <wens@csie.org>,
        <will@kernel.org>, <ycliang@andestech.com>, <inochiama@outlook.com>
Subject: [PATCH v5 02/16] irqchip/riscv-intc: Allow large non-standard interrupt number
Date: Wed, 13 Dec 2023 15:02:47 +0800
Message-ID: <20231213070301.1684751-3-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231213070301.1684751-1-peterlin@andestech.com>
References: <20231213070301.1684751-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3BD73HrQ032167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_230423_350666_CD830491 
X-CRM114-Status: UNSURE (   9.88  )
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

Q3VycmVudGx5LCB0aGUgaW1wbGVtZW50YXRpb24gb2YgdGhlIFJJU0MtViBJTlRDIGRyaXZlciB1
c2VzIHRoZQppbnRlcnJ1cHQgY2F1c2UgYXMgaGFyZHdhcmUgaW50ZXJydXB0IG51bWJlciBhbmQg
aGFzIGEgbGltaXRhdGlvbiBvZgpzdXBwb3J0aW5nIGEgbWF4aW11bSBvZiA2NCBpbnRlcnJ1cHRz
LiBIb3dldmVyLCBhY2NvcmRpbmcgdG8gdGhlCnByaXZpbGVnZWQgc3BlYywgaW50ZXJydXB0IGNh
dXNlcyA+PSAxNiBhcmUgZGVmaW5lZCBmb3IgcGxhdGZvcm0gdXNlLgoKVGhpcyBsaW1pdGF0aW9u
IHByZXZlbnRzIHRvIGZ1bGx5IHV0aWxpemUgdGhlIGF2YWlsYWJsZSBsb2NhbCBpbnRlcnJ1cHQK
c291cmNlcy4gQWRkaXRpb25hbGx5LCB0aGUgaW50ZXJydXB0IG51bWJlciB1c2VkIG9uIFJJU0Mt
ViBhcmUgc3BhcnNlLAp3aXRoIG9ubHkgaW50ZXJydXB0IG51bWJlcnMgMSwgNSBhbmQgOSAocGx1
cyBTc2NvZnBtZiBvciBULUhlYWQncyBQTVUKaW50ZXJydXB0KSBiZWluZyBjdXJyZW50bHkgdXNl
ZCBmb3Igc3VwZXJ2aXNvciBtb2RlLgoKU3dpdGNoIHRvIHVzaW5nIGlycV9kb21haW5fY3JlYXRl
X3RyZWUoKSB0byBjcmVhdGUgdGhlIHJhZGl4IHRyZWUKbWFwLCBzbyBhIGxhcmdlciBudW1iZXIg
b2YgaGFyZHdhcmUgaW50ZXJydXB0cyBjYW4gYmUgaGFuZGxlZC4KClNpZ25lZC1vZmYtYnk6IFl1
IENoaWVuIFBldGVyIExpbiA8cGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbT4KUmV2aWV3ZWQtYnk6IENo
YXJsZXMgQ2ktSnl1biBXdSA8ZG1pbnVzQGFuZGVzdGVjaC5jb20+ClJldmlld2VkLWJ5OiBMZW8g
WXUtQ2hpIExpYW5nIDx5Y2xpYW5nQGFuZGVzdGVjaC5jb20+Ci0tLQpDaGFuZ2VzIHYxIC0+IHYy
OgogIC0gRml4ZWQgaXJxIG1hcHBpbmcgZmFpbHVyZSBjaGVja2luZyAoc3VnZ2VzdGVkIGJ5IENs
w6ltZW50IGFuZCBBbnVwKQpDaGFuZ2VzIHYyIC0+IHYzOgogIC0gTm8gY2hhbmdlCkNoYW5nZXMg
djMgLT4gdjQ6IChTdWdnZXN0ZWQgYnkgVGhvbWFzIFsxXSkKICAtIFVzZSBwcl93YXJuX3JhdGVs
aW1pdGVkIGluc3RlYWQKICAtIEZpeCBjb2Rpbmcgc3R5bGUgYW5kIGNvbW1pdCBtZXNzYWdlCkNo
YW5nZXMgdjQgLT4gdjU6IChTdWdnZXN0ZWQgYnkgVGhvbWFzKQogIC0gRml4IGNvbW1pdCBtZXNz
YWdlCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2
L3BhdGNoLzIwMjMxMDIzMDA0MTAwLjI2NjM0ODYtMy1wZXRlcmxpbkBhbmRlc3RlY2guY29tLyMy
NTU3MzA4NQotLS0KIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jIHwgMTIgKysrKy0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jIGIvZHJpdmVycy9p
cnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKaW5kZXggZThkMDFiMTRjY2RkLi4yZmRkNDBmMmE3OTEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCisrKyBiL2RyaXZl
cnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCkBAIC0yNCwxMCArMjQsOSBAQCBzdGF0aWMgYXNt
bGlua2FnZSB2b2lkIHJpc2N2X2ludGNfaXJxKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogewogCXVu
c2lnbmVkIGxvbmcgY2F1c2UgPSByZWdzLT5jYXVzZSAmIH5DQVVTRV9JUlFfRkxBRzsKIAotCWlm
ICh1bmxpa2VseShjYXVzZSA+PSBCSVRTX1BFUl9MT05HKSkKLQkJcGFuaWMoInVuZXhwZWN0ZWQg
aW50ZXJydXB0IGNhdXNlIik7Ci0KLQlnZW5lcmljX2hhbmRsZV9kb21haW5faXJxKGludGNfZG9t
YWluLCBjYXVzZSk7CisJaWYgKGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnEoaW50Y19kb21haW4s
IGNhdXNlKSkKKwkJcHJfd2Fybl9yYXRlbGltaXRlZCgiRmFpbGVkIHRvIGhhbmRsZSBpbnRlcnJ1
cHQgKGNhdXNlOiAlbGQpXG4iLAorCQkJCSAgICBjYXVzZSk7CiB9CiAKIC8qCkBAIC0xMTcsOCAr
MTE2LDcgQEAgc3RhdGljIGludCBfX2luaXQgcmlzY3ZfaW50Y19pbml0X2NvbW1vbihzdHJ1Y3Qg
Zndub2RlX2hhbmRsZSAqZm4pCiB7CiAJaW50IHJjOwogCi0JaW50Y19kb21haW4gPSBpcnFfZG9t
YWluX2NyZWF0ZV9saW5lYXIoZm4sIEJJVFNfUEVSX0xPTkcsCi0JCQkJCSAgICAgICAmcmlzY3Zf
aW50Y19kb21haW5fb3BzLCBOVUxMKTsKKwlpbnRjX2RvbWFpbiA9IGlycV9kb21haW5fY3JlYXRl
X3RyZWUoZm4sICZyaXNjdl9pbnRjX2RvbWFpbl9vcHMsIE5VTEwpOwogCWlmICghaW50Y19kb21h
aW4pIHsKIAkJcHJfZXJyKCJ1bmFibGUgdG8gYWRkIElSUSBkb21haW5cbiIpOwogCQlyZXR1cm4g
LUVOWElPOwpAQCAtMTMyLDggKzEzMCw2IEBAIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2ludGNf
aW5pdF9jb21tb24oc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZuKQogCiAJcmlzY3Zfc2V0X2ludGNf
aHdub2RlX2ZuKHJpc2N2X2ludGNfaHdub2RlKTsKIAotCXByX2luZm8oIiVkIGxvY2FsIGludGVy
cnVwdHMgbWFwcGVkXG4iLCBCSVRTX1BFUl9MT05HKTsKLQogCXJldHVybiAwOwogfQogCi0tIAoy
LjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
