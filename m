Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397E4C47072
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Dec 2023 10:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w3agbnd6UQWxJcauhR+G+AdHxAK30diDS0XdUT7fK2Q=; b=j08BZgTOtQaFNI
	RpU3XGJgPJrgnmfdESHiI6hD1yVfUuMfFvwfwzVi7g9ihMVXTbnretnMsK1CQMF3ufUfcujqj+PRf
	nKkOPwZ4/pEVaotMD+GiJ2q7Ypplxa8mX2uPtIR1L5HPxGdXknZ4bLnLrodTxH7Ce9QzQbgaXcRdf
	dxMkFzb6HCWLaQWooiXRLjfo2A9vhzl2wcgaRKl0lTvdTAFJPuq0ANNErazpp07jlm+DNCys8WpD1
	D0H+wRSeT/xQo4qc7KSzvGrnoRpm/FE/r54lVMZSY1Qax43ua3uQqU7mOfZ4Zf8XANIzorcdqAosN
	ONMkdOGzK9WJIa9xj0Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHiIw-00AYL4-03;
	Mon, 25 Dec 2023 10:35:26 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHiIU-00AY63-24;
	Mon, 25 Dec 2023 10:35:04 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3BPAXMQH093103;
	Mon, 25 Dec 2023 18:33:22 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Mon, 25 Dec 2023
 18:33:19 +0800
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
        <will@kernel.org>, <ycliang@andestech.com>, <inochiama@outlook.com>,
        <chao.wei@sophgo.com>, <unicorn_wang@outlook.com>, <wefu@redhat.com>
CC: Randolph <randolph@andestech.com>
Subject: [PATCH v6 02/16] irqchip/riscv-intc: Allow large non-standard interrupt number
Date: Mon, 25 Dec 2023 18:32:54 +0800
Message-ID: <20231225103308.1557548-3-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231225103308.1557548-1-peterlin@andestech.com>
References: <20231225103308.1557548-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3BPAXMQH093103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_023459_219626_4ED761D6 
X-CRM114-Status: GOOD (  14.48  )
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
dGVjaC5jb20+Ci0tLQpDaGFuZ2VzIHYxIC0+IHYyOgogIC0gRml4ZWQgaXJxIG1hcHBpbmcgZmFp
bHVyZSBjaGVja2luZyAoc3VnZ2VzdGVkIGJ5IENsw6ltZW50IGFuZCBBbnVwKQpDaGFuZ2VzIHYy
IC0+IHYzOgogIC0gTm8gY2hhbmdlCkNoYW5nZXMgdjMgLT4gdjQ6IChTdWdnZXN0ZWQgYnkgVGhv
bWFzIFsxXSkKICAtIFVzZSBwcl93YXJuX3JhdGVsaW1pdGVkIGluc3RlYWQKICAtIEZpeCBjb2Rp
bmcgc3R5bGUgYW5kIGNvbW1pdCBtZXNzYWdlCkNoYW5nZXMgdjQgLT4gdjU6IChTdWdnZXN0ZWQg
YnkgVGhvbWFzKQogIC0gRml4IGNvbW1pdCBtZXNzYWdlCkNoYW5nZXMgdjUgLT4gdjY6IChTdWdn
ZXN0ZWQgYnkgQW51cCBbMl0pCiAgLSBBZGQgcmlzY3ZfaW50Y18qIGdsb2JhbCB2YXJpYWJsZXMg
Zm9yIGNoZWNraW5nIHJhbmdlIGluIHJpc2N2X2ludGNfZG9tYWluX2FsbG9jKCkKICAtIEFkdmVy
dGlzZSB0aGUgbnVtYmVyIG9mIGludGVycnVwdHMgYWxsb3dlZAoKWzFdIGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIzMTAyMzAwNDEwMC4y
NjYzNDg2LTMtcGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbS8jMjU1NzMwODUKWzJdIGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIzMTIxMzA3MDMw
MS4xNjg0NzUxLTMtcGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbS8jMjU2MzY1ODkKLS0tCiBkcml2ZXJz
L2lycWNoaXAvaXJxLXJpc2N2LWludGMuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jIGIvZHJpdmVycy9p
cnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKaW5kZXggZThkMDFiMTRjY2RkLi5lMWQ4MGNiMDAyMGUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCisrKyBiL2RyaXZl
cnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCkBAIC0xOSwxNSArMTksMTcgQEAKICNpbmNsdWRl
IDxsaW51eC9zbXAuaD4KIAogc3RhdGljIHN0cnVjdCBpcnFfZG9tYWluICppbnRjX2RvbWFpbjsK
K3N0YXRpYyB1bnNpZ25lZCBpbnQgcmlzY3ZfaW50Y19ucl9pcnFzIF9fcm9fYWZ0ZXJfaW5pdDsK
K3N0YXRpYyB1bnNpZ25lZCBpbnQgcmlzY3ZfaW50Y19jdXN0b21fYmFzZSBfX3JvX2FmdGVyX2lu
aXQ7CitzdGF0aWMgdW5zaWduZWQgaW50IHJpc2N2X2ludGNfY3VzdG9tX25yX2lycXMgX19yb19h
ZnRlcl9pbml0OwogCiBzdGF0aWMgYXNtbGlua2FnZSB2b2lkIHJpc2N2X2ludGNfaXJxKHN0cnVj
dCBwdF9yZWdzICpyZWdzKQogewogCXVuc2lnbmVkIGxvbmcgY2F1c2UgPSByZWdzLT5jYXVzZSAm
IH5DQVVTRV9JUlFfRkxBRzsKIAotCWlmICh1bmxpa2VseShjYXVzZSA+PSBCSVRTX1BFUl9MT05H
KSkKLQkJcGFuaWMoInVuZXhwZWN0ZWQgaW50ZXJydXB0IGNhdXNlIik7Ci0KLQlnZW5lcmljX2hh
bmRsZV9kb21haW5faXJxKGludGNfZG9tYWluLCBjYXVzZSk7CisJaWYgKGdlbmVyaWNfaGFuZGxl
X2RvbWFpbl9pcnEoaW50Y19kb21haW4sIGNhdXNlKSkKKwkJcHJfd2Fybl9yYXRlbGltaXRlZCgi
RmFpbGVkIHRvIGhhbmRsZSBpbnRlcnJ1cHQgKGNhdXNlOiAlbGQpXG4iLAorCQkJCSAgICBjYXVz
ZSk7CiB9CiAKIC8qCkBAIC05Myw2ICs5NSwxNCBAQCBzdGF0aWMgaW50IHJpc2N2X2ludGNfZG9t
YWluX2FsbG9jKHN0cnVjdCBpcnFfZG9tYWluICpkb21haW4sCiAJaWYgKHJldCkKIAkJcmV0dXJu
IHJldDsKIAorCS8qCisJICogT25seSBhbGxvdyBod2lycSBmb3Igd2hpY2ggd2UgaGF2ZSBjb3Jy
ZXNwb25kaW5nIHN0YW5kYXJkIG9yCisJICogY3VzdG9tIGludGVycnVwdCBlbmFibGUgcmVnaXN0
ZXIuCisJICovCisJaWYgKChyaXNjdl9pbnRjX25yX2lycXMgPD0gaHdpcnEgJiYgaHdpcnEgPCBy
aXNjdl9pbnRjX2N1c3RvbV9iYXNlKSB8fAorCSAgICAocmlzY3ZfaW50Y19jdXN0b21fYmFzZSAr
IHJpc2N2X2ludGNfY3VzdG9tX25yX2lycXMpIDw9IGh3aXJxKQorCQlyZXR1cm4gLUVJTlZBTDsK
KwogCWZvciAoaSA9IDA7IGkgPCBucl9pcnFzOyBpKyspIHsKIAkJcmV0ID0gcmlzY3ZfaW50Y19k
b21haW5fbWFwKGRvbWFpbiwgdmlycSArIGksIGh3aXJxICsgaSk7CiAJCWlmIChyZXQpCkBAIC0x
MTcsOCArMTI3LDcgQEAgc3RhdGljIGludCBfX2luaXQgcmlzY3ZfaW50Y19pbml0X2NvbW1vbihz
dHJ1Y3QgZndub2RlX2hhbmRsZSAqZm4pCiB7CiAJaW50IHJjOwogCi0JaW50Y19kb21haW4gPSBp
cnFfZG9tYWluX2NyZWF0ZV9saW5lYXIoZm4sIEJJVFNfUEVSX0xPTkcsCi0JCQkJCSAgICAgICAm
cmlzY3ZfaW50Y19kb21haW5fb3BzLCBOVUxMKTsKKwlpbnRjX2RvbWFpbiA9IGlycV9kb21haW5f
Y3JlYXRlX3RyZWUoZm4sICZyaXNjdl9pbnRjX2RvbWFpbl9vcHMsIE5VTEwpOwogCWlmICghaW50
Y19kb21haW4pIHsKIAkJcHJfZXJyKCJ1bmFibGUgdG8gYWRkIElSUSBkb21haW5cbiIpOwogCQly
ZXR1cm4gLUVOWElPOwpAQCAtMTMyLDcgKzE0MSwxMSBAQCBzdGF0aWMgaW50IF9faW5pdCByaXNj
dl9pbnRjX2luaXRfY29tbW9uKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmbikKIAogCXJpc2N2X3Nl
dF9pbnRjX2h3bm9kZV9mbihyaXNjdl9pbnRjX2h3bm9kZSk7CiAKLQlwcl9pbmZvKCIlZCBsb2Nh
bCBpbnRlcnJ1cHRzIG1hcHBlZFxuIiwgQklUU19QRVJfTE9ORyk7CisJcHJfaW5mbygiJWQgbG9j
YWwgaW50ZXJydXB0cyBtYXBwZWRcbiIsIHJpc2N2X2ludGNfbnJfaXJxcyk7CisJaWYgKHJpc2N2
X2ludGNfY3VzdG9tX25yX2lycXMpCisJCXByX2luZm8oIiVkICglZCAtICVkKSBjdXN0b20gbG9j
YWwgaW50ZXJydXB0cyBtYXBwZWRcbiIsCisJCQlyaXNjdl9pbnRjX2N1c3RvbV9ucl9pcnFzLCBy
aXNjdl9pbnRjX2N1c3RvbV9iYXNlLAorCQkJcmlzY3ZfaW50Y19jdXN0b21fYmFzZSArIHJpc2N2
X2ludGNfY3VzdG9tX25yX2lycXMpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC0xNjYsNiArMTc5LDEw
IEBAIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2ludGNfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5vZGUsCiAJCXJldHVybiAwOwogCX0KIAorCXJpc2N2X2ludGNfbnJfaXJxcyA9IEJJVFNfUEVS
X0xPTkc7CisJcmlzY3ZfaW50Y19jdXN0b21fYmFzZSA9IHJpc2N2X2ludGNfbnJfaXJxczsKKwly
aXNjdl9pbnRjX2N1c3RvbV9ucl9pcnFzID0gMDsKKwogCXJldHVybiByaXNjdl9pbnRjX2luaXRf
Y29tbW9uKG9mX25vZGVfdG9fZndub2RlKG5vZGUpKTsKIH0KIAotLSAKMi4zNC4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
