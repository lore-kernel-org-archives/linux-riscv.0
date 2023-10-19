Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0735ACDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 14:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D1XMDScaFQEGHJBxmEXyOImpGbdZQYTqSNCHlNSg+A8=; b=ZfE0qwa+YMzb2S
	MqNz3BJu8CaOKoQ0bbJ2h9fdOBAO+3N0Fi9HwXORSht0ad/bkP3JbCnJs5o48DFYckxmZKJdnqsnP
	KxRAIrq4rMqNmoe83tZI2aHbwXunNylZxS1MevG++RGBvLmDKSvoyU5kju0Na7NQgr9Y6SqsJYiL8
	XsJw2HM5ODCbnBdxSpBdslYHqgwAl7ckdgIB5ks7dSfvitMAUIMuhmNJqTMIYnC5aNbI8/4flV5gj
	4tD3ohSR5+6SUkvVCLocKzz/AFeS0wyY6BQ+wCZykFgSi4MaEQQMOU2/hB/g4uF2Umyvm0J9F4m4o
	pslID3DRA+IENhK+omWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTZH-00HaUl-0F;
	Thu, 19 Oct 2023 14:00:07 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTZE-00HaUA-15
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 14:00:06 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39JDxaO4026745;
	Thu, 19 Oct 2023 21:59:36 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 19 Oct 2023
 21:59:35 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <tglx@linutronix.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <tim609@andestech.com>,
        <dylan@andestech.com>, <locus84@andestech.com>, <dminus@andestech.com>,
        <peterlin@andestech.com>, Leo Yu-Chi Liang <ycliang@andestech.com>
Subject: [RFC PATCH v2 02/10] irqchip/riscv-intc: Allow large non-standard hwirq number
Date: Thu, 19 Oct 2023 21:56:29 +0800
Message-ID: <20231019135629.3656450-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39JDxaO4026745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_070004_827351_D639A78F 
X-CRM114-Status: GOOD (  10.40  )
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
c3RlY2guY29tPgotLS0KQ2hhbmdlcyB2MSAtPiB2MjoKICAtIEZpeCBpcnEgbWFwcGluZyBmYWls
dXJlIGNoZWNraW5nIChzdWdnZXN0ZWQgYnkgQ2zDqW1lbnQgYW5kIEFudXApCi0tLQogZHJpdmVy
cy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMgfCAxMiArKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWlu
dGMuYwppbmRleCBlOGQwMWIxNGNjZGQuLjc5ZDA0OTEwNTM4NCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNj
di1pbnRjLmMKQEAgLTI0LDEwICsyNCw4IEBAIHN0YXRpYyBhc21saW5rYWdlIHZvaWQgcmlzY3Zf
aW50Y19pcnEoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiB7CiAJdW5zaWduZWQgbG9uZyBjYXVzZSA9
IHJlZ3MtPmNhdXNlICYgfkNBVVNFX0lSUV9GTEFHOwogCi0JaWYgKHVubGlrZWx5KGNhdXNlID49
IEJJVFNfUEVSX0xPTkcpKQotCQlwYW5pYygidW5leHBlY3RlZCBpbnRlcnJ1cHQgY2F1c2UiKTsK
LQotCWdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnEoaW50Y19kb21haW4sIGNhdXNlKTsKKwlpZiAo
Z2VuZXJpY19oYW5kbGVfZG9tYWluX2lycShpbnRjX2RvbWFpbiwgY2F1c2UpKQorCQlwcl93YXJu
KCJGYWlsZWQgdG8gaGFuZGxlIGludGVycnVwdCAoY2F1c2U6ICVsZClcbiIsIGNhdXNlKTsKIH0K
IAogLyoKQEAgLTExNyw4ICsxMTUsOCBAQCBzdGF0aWMgaW50IF9faW5pdCByaXNjdl9pbnRjX2lu
aXRfY29tbW9uKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmbikKIHsKIAlpbnQgcmM7CiAKLQlpbnRj
X2RvbWFpbiA9IGlycV9kb21haW5fY3JlYXRlX2xpbmVhcihmbiwgQklUU19QRVJfTE9ORywKLQkJ
CQkJICAgICAgICZyaXNjdl9pbnRjX2RvbWFpbl9vcHMsIE5VTEwpOworCWludGNfZG9tYWluID0g
aXJxX2RvbWFpbl9jcmVhdGVfdHJlZShmbiwgJnJpc2N2X2ludGNfZG9tYWluX29wcywKKwkJCQkJ
ICAgICBOVUxMKTsKIAlpZiAoIWludGNfZG9tYWluKSB7CiAJCXByX2VycigidW5hYmxlIHRvIGFk
ZCBJUlEgZG9tYWluXG4iKTsKIAkJcmV0dXJuIC1FTlhJTzsKQEAgLTEzMiw4ICsxMzAsNiBAQCBz
dGF0aWMgaW50IF9faW5pdCByaXNjdl9pbnRjX2luaXRfY29tbW9uKHN0cnVjdCBmd25vZGVfaGFu
ZGxlICpmbikKIAogCXJpc2N2X3NldF9pbnRjX2h3bm9kZV9mbihyaXNjdl9pbnRjX2h3bm9kZSk7
CiAKLQlwcl9pbmZvKCIlZCBsb2NhbCBpbnRlcnJ1cHRzIG1hcHBlZFxuIiwgQklUU19QRVJfTE9O
Ryk7Ci0KIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
