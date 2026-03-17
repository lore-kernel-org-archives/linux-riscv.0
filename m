Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B543FD876B
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 13:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJob2rr4dKV7My43RKYRihHOcJOdAdazExSgN4Etm4A=; b=nMRIM9Fndqoj6E
	ZjHm07UPXagZG7xlNMfWo2SEXXH2VoFl7FPQQSN4b5MrL6TSTXg/HAABgsR0ZrwKbA0U3FiL7HoH1
	QRwc3EYvXRaJ/PAWYHaazkkv2RJWY6nI0u8N9ROIZ8KEy6bojPZh0iom5i4hotJhY6j8CHJefd/BY
	ic+WiLabnh4A5pUvHzKnzVJpycQOAWP40bVtuVhgVTEeNyRjhnHmyXehm112EBVNgbwf3BQGnRHkA
	0qH5lFSq0/nnwiuRvhH8SKbHZeDkUIorDeCNYcyGMHrgB2jEbmvQ5DLJ72J1i7fgiPrlo3cb8I5GZ
	aN1z5OFT7+JC0WF8UAYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UYL-00000006R4y-01K8;
	Tue, 17 Mar 2026 13:33:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UYI-00000006R2t-3TXL
	for linux-riscv@bombadil.infradead.org;
	Tue, 17 Mar 2026 13:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ntIkyf4BHjj62Dc7A+L7YEXGw0IsZTA15rJunwpStEs=; b=B/pDwByuAABSaD+HuVtcGaHuv6
	gV5CAxzT0E8uPeCPwJyshY0xZhS6C8z6AHVQxXD6wJgn63YiSLUbmybai+uQmZ2KHfYQk8KoulAIP
	SLvxjuSRDLVMPtXbTIEJcjUFgwASLHA06/hipTOC6DB7nIK91d3P2S48ajHKqy9enCz7YUIn5QYVV
	fFhU6qO3dfJAfwTWy34b9rj4TQ2u1V+QkpLwZIQw1C7D3yN6TjrQU8B8viEjdK0/q7OLYW6XFSgyL
	RjBLPrWL1wxVNMPlMI+UFTh+ar54tZQdNCtTlOZd4Z8MjeueflBZCa8R9eJtmiIKtr/fmIBhufn3r
	r/kDmNVA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UYF-00000002lah-35w1
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 13:33:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7EC864E42661;
	Tue, 17 Mar 2026 13:33:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 547305FC9A;
	Tue, 17 Mar 2026 13:33:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7464A104505E9;
	Tue, 17 Mar 2026 14:33:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773754415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ntIkyf4BHjj62Dc7A+L7YEXGw0IsZTA15rJunwpStEs=;
	b=1BnL00zWwyVJ2Ahl+rY1ma+pyiHmUkWeuMpRJTebQCfIJnv/qyPxILXpRF/LmFkw0sKghF
	o4rj2GtpUB1JN2U0zj07i5iDluv2pfGykBbp+UERlaPQcwt+aIKs6/XdHh0JmZdj4hvdyI
	tFlztnwP1YrA56E/i2549Y0/Dh9nbFnobrxLZ5GQzuzhOBtB7YgrUzDKHQSuTXrtm3sZ5B
	AMGnpYfdJW62j7qKhKmwQxtAahjTrmzf30k5IxATz2XjiMkOIBUpKjrxLR/P0zsz20xyhQ
	1GOWnG8dNY9/bxSn6rb4ZoiXI9LGsUjyzls71ZO7yWa2M1f0G9sZZ3+o565wLQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 17 Mar 2026 14:33:05 +0100
Subject: [PATCH v5 03/10] clk: fixed-factor: Rework initialization with
 parent clocks
MIME-Version: 1.0
Message-Id: <20260317-clk-eyeq7-v5-3-6f6daa2c2367@bootlin.com>
References: <20260317-clk-eyeq7-v5-0-6f6daa2c2367@bootlin.com>
In-Reply-To: <20260317-clk-eyeq7-v5-0-6f6daa2c2367@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_133339_857274_E7F3A91E 
X-CRM114-Status: GOOD (  13.72  )
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

VXNlIHRoZSBzYW1lIHNlcXVlbmNlIGFzIGNsay1kaXZpZGVyLCBjbGstZ2F0ZSBhbmQgb3RoZXIg
dG8gc2V0IHRoZQpwYXJlbnRfbmFtZXMsIHBhcmVudF9od3MgYW5kIHBhcmVudF9kYXRhIGluIHRo
ZSBpbml0IHN0cnVjdCB3aGVuCnJlZ2lzdGVyaW5nIGEgZml4ZWQtZmFjdG9yIGNsb2NrLiBUaGUg
bnVtYmVyIG9mIHBhcmVudCBjbG9ja3MgaXMgbm93Cm9ubHkgc2V0IHRvIG9uZSBpZiBhIHBhcmVu
dCBjbG9jayBpcyBwcm92aWRlZC4KClByZXZpb3VzbHkgdGhlIG51bWJlciBvZiBwYXJlbnQgY2xv
Y2tzIHdhcyBhbHdheXMgb25lLCBmb3JjaW5nIGNhbGxlcnMKb2YgX19jbGtfaHdfcmVnaXN0ZXJf
Zml4ZWRfZmFjdG9yKCkgdG8gcHJvdmlkZSBhIGR1bW15IHBhcmVudF9kYXRhCnN0cnVjdCB3aXRo
IGFuIGludmFsaWQgY2xvY2sgaW5kZXggaW4gY2FzZSB0aGV5IHdlcmUgbm90IHByb3ZpZGVkIHdp
dGgKYSBub24tTlVMTCBwYXJlbnRfbmFtZSBvciBwYXJlbnRfaHcuIERyb3AgdGhpcyBkdW1teSBw
YXJlbnRfZGF0YSBhcyBpcwpub3QgbmVjZXNzYXJ5IGFueW1vcmUuCgpUaGlzIGNoYW5nZSBvbmx5
IGhhcyBhIHNtYWxsIGltcGFjdCBvbiBtaXMtY29uZmlndXJlZCBmaXhlZC1mYWN0b3IuIE5vdyBh
CmNhbGwgdG8gY2xrX2h3X3JlZ2lzdGVyX2ZpeGVkX2ZhY3RvcigpIHdpdGggYSBOVUxMIHBhcmVu
dCB3aWxsIHJlZ2lzdGVyCmEgZml4ZWQtZmFjdG9yIHdpdGggemVybyBwYXJlbnQgd2hpbGUgcHJl
dmlvdXNseSBpdCB3YXMgcmVnaXN0ZXJlZCB3aXRoCm9uZSBpbnZhbGlkIHBhcmVudC4gSW4gYm90
aCBjYXNlcyB0aGUgcmF0ZSBvZiB0aGUgZml4ZWQtZmFjdG9yIGlzIDBIegpidXQgaXQgaXMgbm8g
bG9uZ2VyIHNob3duIGFzIG9ycGhhbmVkLgoKVGhpcyBoYXMgbm8gaW1wYWN0IG9uIHByb3Blcmx5
IGNvbmZpZ3VyZWQgZml4ZWQtZmFjdG9ycyBjbG9ja3MuCgpSZXZpZXdlZC1ieTogQnJpYW4gTWFz
bmV5IDxibWFzbmV5QHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEJlbm/DrnQgTW9uaW4gPGJl
bm9pdC5tb25pbkBib290bGluLmNvbT4KLS0tCiBkcml2ZXJzL2Nsay9jbGstZml4ZWQtZmFjdG9y
LmMgfCAyOCArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsv
Y2xrLWZpeGVkLWZhY3Rvci5jIGIvZHJpdmVycy9jbGsvY2xrLWZpeGVkLWZhY3Rvci5jCmluZGV4
IDg1MGU4Yjk1ZjM1Mi4uMzU5ZTkxNDQxYzc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9jbGst
Zml4ZWQtZmFjdG9yLmMKKysrIGIvZHJpdmVycy9jbGsvY2xrLWZpeGVkLWZhY3Rvci5jCkBAIC0x
MjQsMTMgKzEyNCwxMyBAQCBfX2Nsa19od19yZWdpc3Rlcl9maXhlZF9mYWN0b3Ioc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAogCWluaXQubmFtZSA9IG5hbWU7CiAJ
aW5pdC5vcHMgPSAmY2xrX2ZpeGVkX2ZhY3Rvcl9vcHM7CiAJaW5pdC5mbGFncyA9IGZsYWdzOwot
CWlmIChwYXJlbnRfbmFtZSkKLQkJaW5pdC5wYXJlbnRfbmFtZXMgPSAmcGFyZW50X25hbWU7Ci0J
ZWxzZSBpZiAocGFyZW50X2h3KQotCQlpbml0LnBhcmVudF9od3MgPSAmcGFyZW50X2h3OworCWlu
aXQucGFyZW50X25hbWVzID0gcGFyZW50X25hbWUgPyAmcGFyZW50X25hbWUgOiBOVUxMOworCWlu
aXQucGFyZW50X2h3cyA9IHBhcmVudF9odyA/ICZwYXJlbnRfaHcgOiBOVUxMOworCWluaXQucGFy
ZW50X2RhdGEgPSBwZGF0YTsKKwlpZiAocGFyZW50X25hbWUgfHwgcGFyZW50X2h3IHx8IHBkYXRh
KQorCQlpbml0Lm51bV9wYXJlbnRzID0gMTsKIAllbHNlCi0JCWluaXQucGFyZW50X2RhdGEgPSBw
ZGF0YTsKLQlpbml0Lm51bV9wYXJlbnRzID0gMTsKKwkJaW5pdC5udW1fcGFyZW50cyA9IDA7CiAK
IAlodyA9ICZmaXgtPmh3OwogCWlmIChkZXYpCkBAIC0xOTAsMTAgKzE5MCw4IEBAIHN0cnVjdCBj
bGtfaHcgKmRldm1fY2xrX2h3X3JlZ2lzdGVyX2ZpeGVkX2ZhY3Rvcl9wYXJlbnRfaHcoc3RydWN0
IGRldmljZSAqZGV2LAogCQljb25zdCBjaGFyICpuYW1lLCBjb25zdCBzdHJ1Y3QgY2xrX2h3ICpw
YXJlbnRfaHcsCiAJCXVuc2lnbmVkIGxvbmcgZmxhZ3MsIHVuc2lnbmVkIGludCBtdWx0LCB1bnNp
Z25lZCBpbnQgZGl2KQogewotCWNvbnN0IHN0cnVjdCBjbGtfcGFyZW50X2RhdGEgcGRhdGEgPSB7
IC5pbmRleCA9IC0xIH07Ci0KIAlyZXR1cm4gX19jbGtfaHdfcmVnaXN0ZXJfZml4ZWRfZmFjdG9y
KGRldiwgTlVMTCwgbmFtZSwgTlVMTCwgcGFyZW50X2h3LAotCQkJCQkgICAgICAmcGRhdGEsIGZs
YWdzLCBtdWx0LCBkaXYsIDAsIDAsIHRydWUpOworCQkJCQkgICAgICBOVUxMLCBmbGFncywgbXVs
dCwgZGl2LCAwLCAwLCB0cnVlKTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGRldm1fY2xrX2h3X3Jl
Z2lzdGVyX2ZpeGVkX2ZhY3Rvcl9wYXJlbnRfaHcpOwogCkBAIC0yMDEsMTAgKzE5OSw4IEBAIHN0
cnVjdCBjbGtfaHcgKmNsa19od19yZWdpc3Rlcl9maXhlZF9mYWN0b3JfcGFyZW50X2h3KHN0cnVj
dCBkZXZpY2UgKmRldiwKIAkJY29uc3QgY2hhciAqbmFtZSwgY29uc3Qgc3RydWN0IGNsa19odyAq
cGFyZW50X2h3LAogCQl1bnNpZ25lZCBsb25nIGZsYWdzLCB1bnNpZ25lZCBpbnQgbXVsdCwgdW5z
aWduZWQgaW50IGRpdikKIHsKLQljb25zdCBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRhIHBkYXRhID0g
eyAuaW5kZXggPSAtMSB9OwotCiAJcmV0dXJuIF9fY2xrX2h3X3JlZ2lzdGVyX2ZpeGVkX2ZhY3Rv
cihkZXYsIE5VTEwsIG5hbWUsIE5VTEwsIHBhcmVudF9odywKLQkJCQkJICAgICAgJnBkYXRhLCBm
bGFncywgbXVsdCwgZGl2LCAwLCAwLCBmYWxzZSk7CisJCQkJCSAgICAgIE5VTEwsIGZsYWdzLCBt
dWx0LCBkaXYsIDAsIDAsIGZhbHNlKTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGNsa19od19yZWdp
c3Rlcl9maXhlZF9mYWN0b3JfcGFyZW50X2h3KTsKIApAQCAtMjEyLDEwICsyMDgsOCBAQCBzdHJ1
Y3QgY2xrX2h3ICpjbGtfaHdfcmVnaXN0ZXJfZml4ZWRfZmFjdG9yKHN0cnVjdCBkZXZpY2UgKmRl
diwKIAkJY29uc3QgY2hhciAqbmFtZSwgY29uc3QgY2hhciAqcGFyZW50X25hbWUsIHVuc2lnbmVk
IGxvbmcgZmxhZ3MsCiAJCXVuc2lnbmVkIGludCBtdWx0LCB1bnNpZ25lZCBpbnQgZGl2KQogewot
CWNvbnN0IHN0cnVjdCBjbGtfcGFyZW50X2RhdGEgcGRhdGEgPSB7IC5pbmRleCA9IC0xIH07Ci0K
IAlyZXR1cm4gX19jbGtfaHdfcmVnaXN0ZXJfZml4ZWRfZmFjdG9yKGRldiwgTlVMTCwgbmFtZSwg
cGFyZW50X25hbWUsIE5VTEwsCi0JCQkJCSAgICAgICZwZGF0YSwgZmxhZ3MsIG11bHQsIGRpdiwg
MCwgMCwgZmFsc2UpOworCQkJCQkgICAgICBOVUxMLCBmbGFncywgbXVsdCwgZGl2LCAwLCAwLCBm
YWxzZSk7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChjbGtfaHdfcmVnaXN0ZXJfZml4ZWRfZmFjdG9y
KTsKIApAQCAtMjk2LDEwICsyOTAsOCBAQCBzdHJ1Y3QgY2xrX2h3ICpkZXZtX2Nsa19od19yZWdp
c3Rlcl9maXhlZF9mYWN0b3Ioc3RydWN0IGRldmljZSAqZGV2LAogCQljb25zdCBjaGFyICpuYW1l
LCBjb25zdCBjaGFyICpwYXJlbnRfbmFtZSwgdW5zaWduZWQgbG9uZyBmbGFncywKIAkJdW5zaWdu
ZWQgaW50IG11bHQsIHVuc2lnbmVkIGludCBkaXYpCiB7Ci0JY29uc3Qgc3RydWN0IGNsa19wYXJl
bnRfZGF0YSBwZGF0YSA9IHsgLmluZGV4ID0gLTEgfTsKLQogCXJldHVybiBfX2Nsa19od19yZWdp
c3Rlcl9maXhlZF9mYWN0b3IoZGV2LCBOVUxMLCBuYW1lLCBwYXJlbnRfbmFtZSwgTlVMTCwKLQkJ
CSZwZGF0YSwgZmxhZ3MsIG11bHQsIGRpdiwgMCwgMCwgdHJ1ZSk7CisJCQlOVUxMLCBmbGFncywg
bXVsdCwgZGl2LCAwLCAwLCB0cnVlKTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGRldm1fY2xrX2h3
X3JlZ2lzdGVyX2ZpeGVkX2ZhY3Rvcik7CiAKCi0tIAoyLjUzLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
