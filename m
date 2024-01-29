Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1830C48286
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 09:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kM2pn0UjFhCZtgP+y2NCSYu7/KuXOUKkB2cGkP9zRzw=; b=nA2Px4Ff33shTf
	rvCV/3XVQvbaxz7MigCsdTJcUaniR5/ib97Ck6edCcQi2IxbLigKe4p5FM6bLGD9FR0qDqJqMb0MI
	eZtc5mETy6UcGUfR1b0VUECQc2tGgL9/W9Mud2OYhE32SmCs883vptO4S6WG/cgV/fAK2qSFT3/Lc
	VDi8MNciySsNJTSwNLbjDvk3MkAQ+/fXwKb1GypCbQxrn7SbULeJ343uptEGgtlHiucZgEgtAuyXa
	dtfjaFCbCpouwRv+InHMFtvWLiDOt/nodOJAcI148uvUStwzub7j/3eug4LWFFAqWYUPm4DJH0zN3
	aCYJxNHQSDNyaI6CtfFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUNvg-0000000C0xI-3kO7;
	Mon, 29 Jan 2024 09:27:48 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUNvM-0000000C0ih-2Qe7;
	Mon, 29 Jan 2024 09:27:32 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 40T9Q97i080046;
	Mon, 29 Jan 2024 17:26:09 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Mon, 29 Jan 2024
 17:26:06 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <acme@kernel.org>, <adrian.hunter@intel.com>, <ajones@ventanamicro.com>,
        <alexander.shishkin@linux.intel.com>, <andre.przywara@arm.com>,
        <anup@brainfault.org>, <aou@eecs.berkeley.edu>,
        <atishp@atishpatra.org>, <conor+dt@kernel.org>,
        <conor.dooley@microchip.com>, <conor@kernel.org>,
        <devicetree@vger.kernel.org>, <evan@rivosinc.com>,
        <geert+renesas@glider.be>, <guoren@kernel.org>, <heiko@sntech.de>,
        <irogers@google.com>, <jernej.skrabec@gmail.com>, <jolsa@kernel.org>,
        <jszhang@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
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
        <will@kernel.org>, <inochiama@outlook.com>, <unicorn_wang@outlook.com>,
        <wefu@redhat.com>
CC: Randolph <randolph@andestech.com>, Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 02/10] irqchip/riscv-intc: Allow large non-standard interrupt number
Date: Mon, 29 Jan 2024 17:25:45 +0800
Message-ID: <20240129092553.2058043-3-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129092553.2058043-1-peterlin@andestech.com>
References: <20240129092553.2058043-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 40T9Q97i080046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_012729_182524_DE4CEE27 
X-CRM114-Status: GOOD (  14.89  )
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
c2VzIHRoZQppbnRlcnJ1cHQgY2F1c2UgYXMgdGhlIGhhcmR3YXJlIGludGVycnVwdCBudW1iZXIs
IHdpdGggYSBtYXhpbXVtIG9mCjY0IGludGVycnVwdHMuIEhvd2V2ZXIsIHRoZSBwbGF0Zm9ybSBj
YW4gZXhwYW5kIHRoZSBpbnRlcnJ1cHQgbnVtYmVyCmZ1cnRoZXIgZm9yIGN1c3RvbSBsb2NhbCBp
bnRlcnJ1cHRzLgoKVG8gZnVsbHkgdXRpbGl6ZSB0aGUgYXZhaWxhYmxlIGxvY2FsIGludGVycnVw
dCBzb3VyY2VzLCBzd2l0Y2gKdG8gdXNpbmcgaXJxX2RvbWFpbl9jcmVhdGVfdHJlZSgpIHRoYXQg
Y3JlYXRlcyB0aGUgcmFkaXggdHJlZQptYXAsIGFkZCBnbG9iYWwgdmFyaWFibGVzIChyaXNjdl9p
bnRjX25yX2lycXMsIHJpc2N2X2ludGNfY3VzdG9tX2Jhc2UKYW5kIHJpc2N2X2ludGNfY3VzdG9t
X25yX2lycXMpIHRvIGRldGVybWluZSB0aGUgdmFsaWQgcmFuZ2Ugb2YgbG9jYWwKaW50ZXJydXB0
IG51bWJlciAoaHdpcnEpLgoKU2lnbmVkLW9mZi1ieTogWXUgQ2hpZW4gUGV0ZXIgTGluIDxwZXRl
cmxpbkBhbmRlc3RlY2guY29tPgpSZXZpZXdlZC1ieTogUmFuZG9scGggPHJhbmRvbHBoQGFuZGVz
dGVjaC5jb20+ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgpS
ZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Ci0tLQpDaGFuZ2Vz
IHYxIC0+IHYyOgogIC0gRml4ZWQgaXJxIG1hcHBpbmcgZmFpbHVyZSBjaGVja2luZyAoc3VnZ2Vz
dGVkIGJ5IENsw6ltZW50IGFuZCBBbnVwKQpDaGFuZ2VzIHYyIC0+IHYzOgogIC0gTm8gY2hhbmdl
CkNoYW5nZXMgdjMgLT4gdjQ6IChTdWdnZXN0ZWQgYnkgVGhvbWFzIFsxXSkKICAtIFVzZSBwcl93
YXJuX3JhdGVsaW1pdGVkIGluc3RlYWQKICAtIEZpeCBjb2Rpbmcgc3R5bGUgYW5kIGNvbW1pdCBt
ZXNzYWdlCkNoYW5nZXMgdjQgLT4gdjU6IChTdWdnZXN0ZWQgYnkgVGhvbWFzKQogIC0gRml4IGNv
bW1pdCBtZXNzYWdlCkNoYW5nZXMgdjUgLT4gdjY6IChTdWdnZXN0ZWQgYnkgQW51cCBbMl0pCiAg
LSBBZGQgcmlzY3ZfaW50Y18qIGdsb2JhbCB2YXJpYWJsZXMgZm9yIGNoZWNraW5nIHRoZSByYW5n
ZSBvZiB2YWxpZAogICAgaW50ZXJydXB0IG51bWJlciBpbiByaXNjdl9pbnRjX2RvbWFpbl9hbGxv
YygpCiAgLSBBZHZlcnRpc2UgdGhlIG51bWJlciBvZiBpbnRlcnJ1cHRzIGFsbG93ZWQKQ2hhbmdl
cyB2NiAtPiB2NzoKICAtIE5vIGZ1bmN0aW9uYWwgY2hhbmdlCkNoYW5nZXMgdjcgLT4gdjg6CiAg
LSBJbmNsdWRlIFJldmlld2VkLWJ5IHRhZ3MgZnJvbSBBbnVwIGFuZCBBdGlzaAoKWzFdIGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIzMTAy
MzAwNDEwMC4yNjYzNDg2LTMtcGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbS8jMjU1NzMwODUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC4uClsyXSBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Byb2plY3QvbGludXgtcmlzY3YvcGF0Y2gvMjAyMzEyMTMwNzAzMDEuMTY4NDc1MS0zLXBl
dGVybGluQGFuZGVzdGVjaC5jb20vIzI1NjM2NTg5Ci0tLQogZHJpdmVycy9pcnFjaGlwL2lycS1y
aXNjdi1pbnRjLmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNj
di1pbnRjLmMKaW5kZXggZThkMDFiMTRjY2RkLi5iMTNhMTZiMTY0YzkgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCisrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEt
cmlzY3YtaW50Yy5jCkBAIC0xOSwxNSArMTksMTcgQEAKICNpbmNsdWRlIDxsaW51eC9zbXAuaD4K
IAogc3RhdGljIHN0cnVjdCBpcnFfZG9tYWluICppbnRjX2RvbWFpbjsKK3N0YXRpYyB1bnNpZ25l
ZCBpbnQgcmlzY3ZfaW50Y19ucl9pcnFzIF9fcm9fYWZ0ZXJfaW5pdDsKK3N0YXRpYyB1bnNpZ25l
ZCBpbnQgcmlzY3ZfaW50Y19jdXN0b21fYmFzZSBfX3JvX2FmdGVyX2luaXQ7CitzdGF0aWMgdW5z
aWduZWQgaW50IHJpc2N2X2ludGNfY3VzdG9tX25yX2lycXMgX19yb19hZnRlcl9pbml0OwogCiBz
dGF0aWMgYXNtbGlua2FnZSB2b2lkIHJpc2N2X2ludGNfaXJxKHN0cnVjdCBwdF9yZWdzICpyZWdz
KQogewogCXVuc2lnbmVkIGxvbmcgY2F1c2UgPSByZWdzLT5jYXVzZSAmIH5DQVVTRV9JUlFfRkxB
RzsKIAotCWlmICh1bmxpa2VseShjYXVzZSA+PSBCSVRTX1BFUl9MT05HKSkKLQkJcGFuaWMoInVu
ZXhwZWN0ZWQgaW50ZXJydXB0IGNhdXNlIik7Ci0KLQlnZW5lcmljX2hhbmRsZV9kb21haW5faXJx
KGludGNfZG9tYWluLCBjYXVzZSk7CisJaWYgKGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnEoaW50
Y19kb21haW4sIGNhdXNlKSkKKwkJcHJfd2Fybl9yYXRlbGltaXRlZCgiRmFpbGVkIHRvIGhhbmRs
ZSBpbnRlcnJ1cHQgKGNhdXNlOiAlbGQpXG4iLAorCQkJCSAgICBjYXVzZSk7CiB9CiAKIC8qCkBA
IC05Myw2ICs5NSwxNCBAQCBzdGF0aWMgaW50IHJpc2N2X2ludGNfZG9tYWluX2FsbG9jKHN0cnVj
dCBpcnFfZG9tYWluICpkb21haW4sCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAorCS8qCisJ
ICogT25seSBhbGxvdyBod2lycSBmb3Igd2hpY2ggd2UgaGF2ZSBjb3JyZXNwb25kaW5nIHN0YW5k
YXJkIG9yCisJICogY3VzdG9tIGludGVycnVwdCBlbmFibGUgcmVnaXN0ZXIuCisJICovCisJaWYg
KChyaXNjdl9pbnRjX25yX2lycXMgPD0gaHdpcnEgJiYgaHdpcnEgPCByaXNjdl9pbnRjX2N1c3Rv
bV9iYXNlKSB8fAorCSAgICAocmlzY3ZfaW50Y19jdXN0b21fYmFzZSArIHJpc2N2X2ludGNfY3Vz
dG9tX25yX2lycXMpIDw9IGh3aXJxKQorCQlyZXR1cm4gLUVJTlZBTDsKKwogCWZvciAoaSA9IDA7
IGkgPCBucl9pcnFzOyBpKyspIHsKIAkJcmV0ID0gcmlzY3ZfaW50Y19kb21haW5fbWFwKGRvbWFp
biwgdmlycSArIGksIGh3aXJxICsgaSk7CiAJCWlmIChyZXQpCkBAIC0xMTcsOCArMTI3LDcgQEAg
c3RhdGljIGludCBfX2luaXQgcmlzY3ZfaW50Y19pbml0X2NvbW1vbihzdHJ1Y3QgZndub2RlX2hh
bmRsZSAqZm4pCiB7CiAJaW50IHJjOwogCi0JaW50Y19kb21haW4gPSBpcnFfZG9tYWluX2NyZWF0
ZV9saW5lYXIoZm4sIEJJVFNfUEVSX0xPTkcsCi0JCQkJCSAgICAgICAmcmlzY3ZfaW50Y19kb21h
aW5fb3BzLCBOVUxMKTsKKwlpbnRjX2RvbWFpbiA9IGlycV9kb21haW5fY3JlYXRlX3RyZWUoZm4s
ICZyaXNjdl9pbnRjX2RvbWFpbl9vcHMsIE5VTEwpOwogCWlmICghaW50Y19kb21haW4pIHsKIAkJ
cHJfZXJyKCJ1bmFibGUgdG8gYWRkIElSUSBkb21haW5cbiIpOwogCQlyZXR1cm4gLUVOWElPOwpA
QCAtMTMyLDcgKzE0MSwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCByaXNjdl9pbnRjX2luaXRfY29t
bW9uKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmbikKIAogCXJpc2N2X3NldF9pbnRjX2h3bm9kZV9m
bihyaXNjdl9pbnRjX2h3bm9kZSk7CiAKLQlwcl9pbmZvKCIlZCBsb2NhbCBpbnRlcnJ1cHRzIG1h
cHBlZFxuIiwgQklUU19QRVJfTE9ORyk7CisJcHJfaW5mbygiJWQgbG9jYWwgaW50ZXJydXB0cyBt
YXBwZWRcbiIsIHJpc2N2X2ludGNfbnJfaXJxcyk7CisJaWYgKHJpc2N2X2ludGNfY3VzdG9tX25y
X2lycXMpCisJCXByX2luZm8oIiVkIGN1c3RvbSBsb2NhbCBpbnRlcnJ1cHRzIG1hcHBlZFxuIiwK
KwkJCXJpc2N2X2ludGNfY3VzdG9tX25yX2lycXMpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC0xNjYs
NiArMTc4LDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2ludGNfaW5pdChzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5vZGUsCiAJCXJldHVybiAwOwogCX0KIAorCXJpc2N2X2ludGNfbnJfaXJxcyA9
IEJJVFNfUEVSX0xPTkc7CisJcmlzY3ZfaW50Y19jdXN0b21fYmFzZSA9IHJpc2N2X2ludGNfbnJf
aXJxczsKKwlyaXNjdl9pbnRjX2N1c3RvbV9ucl9pcnFzID0gMDsKKwogCXJldHVybiByaXNjdl9p
bnRjX2luaXRfY29tbW9uKG9mX25vZGVfdG9fZndub2RlKG5vZGUpKTsKIH0KIAotLSAKMi4zNC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
