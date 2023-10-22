Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D81CCDB474
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Oct 2023 15:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVeibpifKSV6yRVNb8iABbQF6voAo64CCi1bfqT9efo=; b=uJ72hrajDy6mi3
	dkbHHkjacxiUpqb48rSvQizlI9JM4GoN0px/5pzjt8cfF0Kefeejt7f17wr2GUvw670yPiHh9sr5I
	s8lyP7vV3BfN7SDAUsgmfVIj+GDQJbxHxy5o//twzbXMM7oMsbg26YQPSWf/SQDfza6XLovtdRsI2
	I4ITM+WHxksoBSk99L4ezHyqBU/mJWPf+5xNQEk2EYMuFcJXcizZa3esjQl2t7zKUTU84kTYNlP7R
	wIuPch5UFPKXeIBWQ8HRRw0dZQ140f+E1znLMKSC5ejF41ktL3PMuk2iN9NSReMzvo4MNIsgGBtQk
	jhAOsOw+vBOlGj01Lb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quaIw-005bY7-0P;
	Sun, 22 Oct 2023 15:23:50 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quaIk-005bUq-1B;
	Sun, 22 Oct 2023 15:23:41 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39MFMOhW032691;
	Sun, 22 Oct 2023 23:22:24 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Sun, 22 Oct 2023
 23:22:20 +0800
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
        <will@kernel.org>, <ycliang@andestech.com>
Subject: [RFC PATCH v3 02/13] irqchip/riscv-intc: Allow large non-standard hwirq number
Date: Sun, 22 Oct 2023 23:18:47 +0800
Message-ID: <20231022151858.2479969-3-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231022151858.2479969-1-peterlin@andestech.com>
References: <20231022151858.2479969-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39MFMOhW032691
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_082338_862488_39AAD3CF 
X-CRM114-Status: GOOD (  10.10  )
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
aXJxKSBiZWluZyBjdXJyZW50bHkgdXNlZCBmb3Igc3VwZXJ2aXNvciBtb2RlLgoKVGhlIHBhdGNo
IHN3aXRjaGVzIHRvIHVzaW5nIGlycV9kb21haW5fY3JlYXRlX3RyZWUoKSB3aGljaApjcmVhdGVz
IHRoZSByYWRpeCB0cmVlIG1hcCwgYWxsb3dpbmcgdXMgdG8gaGFuZGxlIGEgbGFyZ2VyCm51bWJl
ciBvZiBod2lycXMuCgpTaWduZWQtb2ZmLWJ5OiBZdSBDaGllbiBQZXRlciBMaW4gPHBldGVybGlu
QGFuZGVzdGVjaC5jb20+ClJldmlld2VkLWJ5OiBDaGFybGVzIENpLUp5dW4gV3UgPGRtaW51c0Bh
bmRlc3RlY2guY29tPgpSZXZpZXdlZC1ieTogTGVvIFl1LUNoaSBMaWFuZyA8eWNsaWFuZ0BhbmRl
c3RlY2guY29tPgotLS0KQ2hhbmdlcyB2MSAtPiB2MjoKICAtIEZpeGVkIGlycSBtYXBwaW5nIGZh
aWx1cmUgY2hlY2tpbmcgKHN1Z2dlc3RlZCBieSBDbMOpbWVudCBhbmQgQW51cCkKQ2hhbmdlcyB2
MiAtPiB2MzoKICAtIE5vIGNoYW5nZQotLS0KIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50
Yy5jIHwgMTIgKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50
Yy5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKaW5kZXggZThkMDFiMTRjY2Rk
Li43OWQwNDkxMDUzODQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50
Yy5jCisrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCkBAIC0yNCwxMCArMjQs
OCBAQCBzdGF0aWMgYXNtbGlua2FnZSB2b2lkIHJpc2N2X2ludGNfaXJxKHN0cnVjdCBwdF9yZWdz
ICpyZWdzKQogewogCXVuc2lnbmVkIGxvbmcgY2F1c2UgPSByZWdzLT5jYXVzZSAmIH5DQVVTRV9J
UlFfRkxBRzsKIAotCWlmICh1bmxpa2VseShjYXVzZSA+PSBCSVRTX1BFUl9MT05HKSkKLQkJcGFu
aWMoInVuZXhwZWN0ZWQgaW50ZXJydXB0IGNhdXNlIik7Ci0KLQlnZW5lcmljX2hhbmRsZV9kb21h
aW5faXJxKGludGNfZG9tYWluLCBjYXVzZSk7CisJaWYgKGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9p
cnEoaW50Y19kb21haW4sIGNhdXNlKSkKKwkJcHJfd2FybigiRmFpbGVkIHRvIGhhbmRsZSBpbnRl
cnJ1cHQgKGNhdXNlOiAlbGQpXG4iLCBjYXVzZSk7CiB9CiAKIC8qCkBAIC0xMTcsOCArMTE1LDgg
QEAgc3RhdGljIGludCBfX2luaXQgcmlzY3ZfaW50Y19pbml0X2NvbW1vbihzdHJ1Y3QgZndub2Rl
X2hhbmRsZSAqZm4pCiB7CiAJaW50IHJjOwogCi0JaW50Y19kb21haW4gPSBpcnFfZG9tYWluX2Ny
ZWF0ZV9saW5lYXIoZm4sIEJJVFNfUEVSX0xPTkcsCi0JCQkJCSAgICAgICAmcmlzY3ZfaW50Y19k
b21haW5fb3BzLCBOVUxMKTsKKwlpbnRjX2RvbWFpbiA9IGlycV9kb21haW5fY3JlYXRlX3RyZWUo
Zm4sICZyaXNjdl9pbnRjX2RvbWFpbl9vcHMsCisJCQkJCSAgICAgTlVMTCk7CiAJaWYgKCFpbnRj
X2RvbWFpbikgewogCQlwcl9lcnIoInVuYWJsZSB0byBhZGQgSVJRIGRvbWFpblxuIik7CiAJCXJl
dHVybiAtRU5YSU87CkBAIC0xMzIsOCArMTMwLDYgQEAgc3RhdGljIGludCBfX2luaXQgcmlzY3Zf
aW50Y19pbml0X2NvbW1vbihzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZm4pCiAKIAlyaXNjdl9zZXRf
aW50Y19od25vZGVfZm4ocmlzY3ZfaW50Y19od25vZGUpOwogCi0JcHJfaW5mbygiJWQgbG9jYWwg
aW50ZXJydXB0cyBtYXBwZWRcbiIsIEJJVFNfUEVSX0xPTkcpOwotCiAJcmV0dXJuIDA7CiB9CiAK
LS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
