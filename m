Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E112C61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 12:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HgvKMbE8ofGMJh8/KcGZfvJfmm5DmrmzWcv6+1TtIg=; b=u/Ul1soF3OcHor
	g8EA/SYaJLYVxzWoPoc8rb7GGxza2dbtGJkLHWRp7XxV+ZShPw3Plcydr8gd24HhKVaYSV6Y9s4HW
	Hsky0GbthjSCDXr3MjASzso79Eapo69XUEb535VdvWBqgms6Cr7u4rp3paD7+u1P9yV908jYnh5jp
	dWlTcxMTOhL8KrCxT38uTyBq2P9u0Oggb5RS7Xl48+j6+sIF/+K68Z/fIS7CM3Aq/xns1nAheKp+L
	W0nUGy/cEj3srZN11hk9BBC6U+nJqQABXfCbUrMd0I7cA8om3rTSnKb6V//GBmXBztoVcqrUb0Ie5
	j4BIb04lQQYFBYa4ygUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mAr-001kmf-05;
	Wed, 22 Nov 2023 12:17:45 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mAh-001kgn-15;
	Wed, 22 Nov 2023 12:17:38 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3AMCGDtX025025;
	Wed, 22 Nov 2023 20:16:13 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Wed, 22 Nov 2023
 20:16:09 +0800
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
Subject: [PATCH v4 02/13] irqchip/riscv-intc: Allow large non-standard interrupt number
Date: Wed, 22 Nov 2023 20:12:24 +0800
Message-ID: <20231122121235.827122-3-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122121235.827122-1-peterlin@andestech.com>
References: <20231122121235.827122-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3AMCGDtX025025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_041735_838388_05503560 
X-CRM114-Status: GOOD (  10.74  )
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
c2VzIHRoZQppbnRlcnJ1cHQgY2F1c2UgYXMgaHdpcnEgYW5kIGhhcyBhIGxpbWl0YXRpb24gb2Yg
c3VwcG9ydGluZyBhCm1heGltdW0gb2YgNjQgaHdpcnFzLiBIb3dldmVyLCBhY2NvcmRpbmcgdG8g
dGhlIHByaXZpbGVnZWQgc3BlYywKaW50ZXJydXB0IGNhdXNlcyA+PSAxNiBhcmUgZGVmaW5lZCBm
b3IgcGxhdGZvcm0gdXNlLgoKVGhpcyBsaW1pdGF0aW9uIHByZXZlbnRzIHVzIGZyb20gZnVsbHkg
dXRpbGl6aW5nIHRoZSBhdmFpbGFibGUKbG9jYWwgaW50ZXJydXB0IHNvdXJjZXMuIEFkZGl0aW9u
YWxseSwgdGhlIGh3aXJxcyB1c2VkIG9uIFJJU0MtVgphcmUgc3BhcnNlLCB3aXRoIG9ubHkgaW50
ZXJydXB0IG51bWJlcnMgMSwgNSBhbmQgOSAocGx1cyBTc2NvZnBtZgpvciBULUhlYWQncyBQTVUg
aXJxKSBiZWluZyBjdXJyZW50bHkgdXNlZCBmb3Igc3VwZXJ2aXNvciBtb2RlLgoKU3dpdGNoIHRv
IHVzaW5nIGlycV9kb21haW5fY3JlYXRlX3RyZWUoKSB0byBjcmVhdGUgdGhlIHJhZGl4IHRyZWUK
bWFwLCBzbyBhIGxhcmdlciBudW1iZXIgb2YgaGFyZHdhcmUgaW50ZXJydXB0cyBjYW4gYmUgaGFu
ZGxlZC4KClNpZ25lZC1vZmYtYnk6IFl1IENoaWVuIFBldGVyIExpbiA8cGV0ZXJsaW5AYW5kZXN0
ZWNoLmNvbT4KUmV2aWV3ZWQtYnk6IENoYXJsZXMgQ2ktSnl1biBXdSA8ZG1pbnVzQGFuZGVzdGVj
aC5jb20+ClJldmlld2VkLWJ5OiBMZW8gWXUtQ2hpIExpYW5nIDx5Y2xpYW5nQGFuZGVzdGVjaC5j
b20+Ci0tLQpDaGFuZ2VzIHYxIC0+IHYyOgogIC0gRml4ZWQgaXJxIG1hcHBpbmcgZmFpbHVyZSBj
aGVja2luZyAoc3VnZ2VzdGVkIGJ5IENsw6ltZW50IGFuZCBBbnVwKQpDaGFuZ2VzIHYyIC0+IHYz
OgogIC0gTm8gY2hhbmdlCkNoYW5nZXMgdjMgLT4gdjQ6IChTdWdnZXN0ZWQgYnkgVGhvbWFzIFsx
XSkKICAtIFVzZSBwcl93YXJuX3JhdGVsaW1pdGVkIGluc3RlYWQKICAtIEZpeCBjb2Rpbmcgc3R5
bGUgYW5kIGNvbW1pdCBtZXNzYWdlCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjMxMDIzMDA0MTAwLjI2NjM0ODYtMy1wZXRlcmxp
bkBhbmRlc3RlY2guY29tLyMyNTU3MzA4NQotLS0KIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3Yt
aW50Yy5jIHwgMTIgKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3Yt
aW50Yy5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKaW5kZXggZThkMDFiMTRj
Y2RkLi4yZmRkNDBmMmE3OTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3Yt
aW50Yy5jCisrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCkBAIC0yNCwxMCAr
MjQsOSBAQCBzdGF0aWMgYXNtbGlua2FnZSB2b2lkIHJpc2N2X2ludGNfaXJxKHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQogewogCXVuc2lnbmVkIGxvbmcgY2F1c2UgPSByZWdzLT5jYXVzZSAmIH5DQVVT
RV9JUlFfRkxBRzsKIAotCWlmICh1bmxpa2VseShjYXVzZSA+PSBCSVRTX1BFUl9MT05HKSkKLQkJ
cGFuaWMoInVuZXhwZWN0ZWQgaW50ZXJydXB0IGNhdXNlIik7Ci0KLQlnZW5lcmljX2hhbmRsZV9k
b21haW5faXJxKGludGNfZG9tYWluLCBjYXVzZSk7CisJaWYgKGdlbmVyaWNfaGFuZGxlX2RvbWFp
bl9pcnEoaW50Y19kb21haW4sIGNhdXNlKSkKKwkJcHJfd2Fybl9yYXRlbGltaXRlZCgiRmFpbGVk
IHRvIGhhbmRsZSBpbnRlcnJ1cHQgKGNhdXNlOiAlbGQpXG4iLAorCQkJCSAgICBjYXVzZSk7CiB9
CiAKIC8qCkBAIC0xMTcsOCArMTE2LDcgQEAgc3RhdGljIGludCBfX2luaXQgcmlzY3ZfaW50Y19p
bml0X2NvbW1vbihzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZm4pCiB7CiAJaW50IHJjOwogCi0JaW50
Y19kb21haW4gPSBpcnFfZG9tYWluX2NyZWF0ZV9saW5lYXIoZm4sIEJJVFNfUEVSX0xPTkcsCi0J
CQkJCSAgICAgICAmcmlzY3ZfaW50Y19kb21haW5fb3BzLCBOVUxMKTsKKwlpbnRjX2RvbWFpbiA9
IGlycV9kb21haW5fY3JlYXRlX3RyZWUoZm4sICZyaXNjdl9pbnRjX2RvbWFpbl9vcHMsIE5VTEwp
OwogCWlmICghaW50Y19kb21haW4pIHsKIAkJcHJfZXJyKCJ1bmFibGUgdG8gYWRkIElSUSBkb21h
aW5cbiIpOwogCQlyZXR1cm4gLUVOWElPOwpAQCAtMTMyLDggKzEzMCw2IEBAIHN0YXRpYyBpbnQg
X19pbml0IHJpc2N2X2ludGNfaW5pdF9jb21tb24oc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZuKQog
CiAJcmlzY3Zfc2V0X2ludGNfaHdub2RlX2ZuKHJpc2N2X2ludGNfaHdub2RlKTsKIAotCXByX2lu
Zm8oIiVkIGxvY2FsIGludGVycnVwdHMgbWFwcGVkXG4iLCBCSVRTX1BFUl9MT05HKTsKLQogCXJl
dHVybiAwOwogfQogCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
