Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C91AC5478C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 08:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aASSPMZ8aNWChmbGsgQyp5OrEQKRmCczf20XietJfcc=; b=Rm1EMR9h52yqbj
	zO7uIIwSnvHHH/SxqB3qPpy6d5R3Q3APPFFTKh/uaoiMtT7Nn+Scq1Aeea6Ux3ZUwINZhXN0HSKVp
	IJVajJuLOxFANFGR93nn/pFWkHPOCxKJghcteUWwfbSMLGpg45HpAZ8ajf0t0tsNIjdtl5cQN9WXf
	yTSrsaOg2s5UDXVIWUwXREU5OKwTO74pKJxNWvcFSuFkHW+S3PAjoXzp+KCsFRj9witlBeSBSHqRu
	PNxtaxVYpy/jF64YphISNO+0CqOT/jdxSYRjMJnux29T1YU4gtUMzsssSk8hIBMu7GSWdgRCfaHdP
	3zJ7cY2g5qIsUpjJq6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4dg-000000044Ll-3nCM;
	Thu, 22 Feb 2024 08:41:08 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4da-000000044IG-21C5;
	Thu, 22 Feb 2024 08:41:04 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 41M8e38C074466;
	Thu, 22 Feb 2024 16:40:03 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 22 Feb 2024
 16:39:59 +0800
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
Subject: [PATCH v9 02/10] irqchip/riscv-intc: Allow large non-standard interrupt number
Date: Thu, 22 Feb 2024 16:39:38 +0800
Message-ID: <20240222083946.3977135-3-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222083946.3977135-1-peterlin@andestech.com>
References: <20240222083946.3977135-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 41M8e38C074466
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_004102_810719_AE2DE147 
X-CRM114-Status: GOOD (  14.31  )
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
LSBJbmNsdWRlIFJldmlld2VkLWJ5IHRhZ3MgZnJvbSBBbnVwIGFuZCBBdGlzaApDaGFuZ2VzIHY4
IC0+IHY5IChTdWdnZXN0ZWQgYnkgVGhvbWFzIFszXSk6CiAgLSBGaXggY29kaW5nIHN0eWxlIAog
IC0gVXBkYXRlIGh3aXJxIHJhbmdlIGNoZWNrcwogIC0gVXBkYXRlIHJpc2N2X2ludGNfKiBnbG9i
YWwgdmFyaWFibGVzIGluaXRpYWxpemF0aW9uCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjMxMDIzMDA0MTAwLjI2NjM0ODYtMy1w
ZXRlcmxpbkBhbmRlc3RlY2guY29tLyMyNTU3MzA4NQpbMl0gaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjMxMjEzMDcwMzAxLjE2ODQ3NTEt
My1wZXRlcmxpbkBhbmRlc3RlY2guY29tLyMyNTYzNjU4OQpbM10gaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjQwMTI5MDkyNTUzLjIwNTgw
NDMtMy1wZXRlcmxpbkBhbmRlc3RlY2guY29tLyMyNTcxMDU4NAotLS0KIGRyaXZlcnMvaXJxY2hp
cC9pcnEtcmlzY3YtaW50Yy5jIHwgMjYgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1y
aXNjdi1pbnRjLmMKaW5kZXggZThkMDFiMTRjY2RkLi42ODQ4NzVjMzk3MjggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCisrKyBiL2RyaXZlcnMvaXJxY2hpcC9p
cnEtcmlzY3YtaW50Yy5jCkBAIC0xOSwxNSArMTksMTYgQEAKICNpbmNsdWRlIDxsaW51eC9zbXAu
aD4KIAogc3RhdGljIHN0cnVjdCBpcnFfZG9tYWluICppbnRjX2RvbWFpbjsKK3N0YXRpYyB1bnNp
Z25lZCBpbnQgcmlzY3ZfaW50Y19ucl9pcnFzIF9fcm9fYWZ0ZXJfaW5pdCA9IEJJVFNfUEVSX0xP
Tkc7CitzdGF0aWMgdW5zaWduZWQgaW50IHJpc2N2X2ludGNfY3VzdG9tX2Jhc2UgX19yb19hZnRl
cl9pbml0ID0gQklUU19QRVJfTE9ORzsKK3N0YXRpYyB1bnNpZ25lZCBpbnQgcmlzY3ZfaW50Y19j
dXN0b21fbnJfaXJxcyBfX3JvX2FmdGVyX2luaXQ7CiAKIHN0YXRpYyBhc21saW5rYWdlIHZvaWQg
cmlzY3ZfaW50Y19pcnEoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiB7CiAJdW5zaWduZWQgbG9uZyBj
YXVzZSA9IHJlZ3MtPmNhdXNlICYgfkNBVVNFX0lSUV9GTEFHOwogCi0JaWYgKHVubGlrZWx5KGNh
dXNlID49IEJJVFNfUEVSX0xPTkcpKQotCQlwYW5pYygidW5leHBlY3RlZCBpbnRlcnJ1cHQgY2F1
c2UiKTsKLQotCWdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnEoaW50Y19kb21haW4sIGNhdXNlKTsK
KwlpZiAoZ2VuZXJpY19oYW5kbGVfZG9tYWluX2lycShpbnRjX2RvbWFpbiwgY2F1c2UpKQorCQlw
cl93YXJuX3JhdGVsaW1pdGVkKCJGYWlsZWQgdG8gaGFuZGxlIGludGVycnVwdCAoY2F1c2U6ICVs
ZClcbiIsIGNhdXNlKTsKIH0KIAogLyoKQEAgLTkzLDYgKzk0LDE0IEBAIHN0YXRpYyBpbnQgcmlz
Y3ZfaW50Y19kb21haW5fYWxsb2Moc3RydWN0IGlycV9kb21haW4gKmRvbWFpbiwKIAlpZiAocmV0
KQogCQlyZXR1cm4gcmV0OwogCisJLyoKKwkgKiBPbmx5IGFsbG93IGh3aXJxIGZvciB3aGljaCB3
ZSBoYXZlIGNvcnJlc3BvbmRpbmcgc3RhbmRhcmQgb3IKKwkgKiBjdXN0b20gaW50ZXJydXB0IGVu
YWJsZSByZWdpc3Rlci4KKwkgKi8KKwlpZiAoKGh3aXJxID49IHJpc2N2X2ludGNfbnJfaXJxcyAm
JiBod2lycSA8IHJpc2N2X2ludGNfY3VzdG9tX2Jhc2UpIHx8CisJICAgIChod2lycSA+PSByaXNj
dl9pbnRjX2N1c3RvbV9iYXNlICsgcmlzY3ZfaW50Y19jdXN0b21fbnJfaXJxcykpCisJCXJldHVy
biAtRUlOVkFMOworCiAJZm9yIChpID0gMDsgaSA8IG5yX2lycXM7IGkrKykgewogCQlyZXQgPSBy
aXNjdl9pbnRjX2RvbWFpbl9tYXAoZG9tYWluLCB2aXJxICsgaSwgaHdpcnEgKyBpKTsKIAkJaWYg
KHJldCkKQEAgLTExNyw4ICsxMjYsNyBAQCBzdGF0aWMgaW50IF9faW5pdCByaXNjdl9pbnRjX2lu
aXRfY29tbW9uKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmbikKIHsKIAlpbnQgcmM7CiAKLQlpbnRj
X2RvbWFpbiA9IGlycV9kb21haW5fY3JlYXRlX2xpbmVhcihmbiwgQklUU19QRVJfTE9ORywKLQkJ
CQkJICAgICAgICZyaXNjdl9pbnRjX2RvbWFpbl9vcHMsIE5VTEwpOworCWludGNfZG9tYWluID0g
aXJxX2RvbWFpbl9jcmVhdGVfdHJlZShmbiwgJnJpc2N2X2ludGNfZG9tYWluX29wcywgTlVMTCk7
CiAJaWYgKCFpbnRjX2RvbWFpbikgewogCQlwcl9lcnIoInVuYWJsZSB0byBhZGQgSVJRIGRvbWFp
blxuIik7CiAJCXJldHVybiAtRU5YSU87CkBAIC0xMzIsNyArMTQwLDExIEBAIHN0YXRpYyBpbnQg
X19pbml0IHJpc2N2X2ludGNfaW5pdF9jb21tb24oc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZuKQog
CiAJcmlzY3Zfc2V0X2ludGNfaHdub2RlX2ZuKHJpc2N2X2ludGNfaHdub2RlKTsKIAotCXByX2lu
Zm8oIiVkIGxvY2FsIGludGVycnVwdHMgbWFwcGVkXG4iLCBCSVRTX1BFUl9MT05HKTsKKwlwcl9p
bmZvKCIlZCBsb2NhbCBpbnRlcnJ1cHRzIG1hcHBlZFxuIiwgcmlzY3ZfaW50Y19ucl9pcnFzKTsK
KwlpZiAocmlzY3ZfaW50Y19jdXN0b21fbnJfaXJxcykgeworCQlwcl9pbmZvKCIlZCBjdXN0b20g
bG9jYWwgaW50ZXJydXB0cyBtYXBwZWRcbiIsCisJCQlyaXNjdl9pbnRjX2N1c3RvbV9ucl9pcnFz
KTsKKwl9CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
