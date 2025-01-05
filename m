Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A9EE77197
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jan 2025 08:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qW5jhNbrusGIw485EU/dzlLrp6941ekVmJ+pNwHC4uI=; b=u533a7qGhazl6A
	m5xfYvwd1kDJhrquNOSN2c4KG1wAMp8HqGc0ZP2t0KkOEJeygBPCfUr1w1dlvFUkSS33zWpzhc58P
	cU4aB0UTLrcI9xDKiLOddv7X8DX5zsxHJpcpyWaC8edcv6KTzIYw/Fc6tgiDsDZGvmp58CZX28XCa
	GdoGlwPDRf/DuHC4/GoMYrxssJhjicKipguqMCneTI1+V9JTWS8RLqNbPSWTJoIoG7xK4JZb+Mini
	4Hge4hfMNBGP1mW1KRH4PCfcaaoCzrwaR2gP5YHlufFWkgoR2kKDllV4UmkRB9DfSLmz8JVjHA3dB
	VBdnXek+g1lFCAXtd6qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUMB2-0000000GY8S-2xVg;
	Sun, 05 Jan 2025 08:40:04 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUMAy-0000000GY7R-2s7j
	for linux-riscv@lists.infradead.org;
	Sun, 05 Jan 2025 08:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1736066399; x=1767602399;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z/K0SqeHgdhQcv49IYilM/zZ3lHXS5Gvf9N0LFcoCU4=;
  b=m5cgI7CALSTSTVy+SxVuJvhmHrYznJHkppsJumAMuFtUUJsBHlWXuAzz
   SSpJ/5rMIfCGqj/7UjpWTpXgqSzti9FKFwJlkBDv3qvrdpEE6dvvo1Y0g
   EwBFA874Fz/lBL5olhdyLNsVHGvWBC76eCF2b+Kkj7yqDneO35ujPc0dU
   b+RQVDgUzmfvMVAuMY1KLCDmEYj0/i/NQVBFvvHYopdmEp4/3c4iQQ9NX
   INgTNCaXMrGWf9P5y0yqgD5gmc5IiOg36qZAx+yECRDt9kVMizJgJXn0D
   JRNHf3CGU2ABsx1lpjTwnfoYGIINCLGjZEv2XbKYjtsB+fPKr4QR1JS6W
   Q==;
X-CSE-ConnectionGUID: CfpY9T+PR9GKa0NAaEl5ag==
X-CSE-MsgGUID: hjRKhnmFQwy8mNY0yyKm0A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 10:39:51 +0200
X-CSE-ConnectionGUID: XSsLCryfQ2Ke3UGOxo8zcA==
X-CSE-MsgGUID: ClLY1LQXRn2Ji/nVT3b89w==
Received: from unknown (HELO epgd022.me-corp.lan) ([10.154.54.6])
  by ces01_data.me-corp.lan with SMTP; 05 Jan 2025 10:39:51 +0200
Received: by epgd022.me-corp.lan (sSMTP sendmail emulation); Sun, 05 Jan 2025 10:39:51 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v2] irqchip/riscv-aplic: add support for hart indexes
Date: Sun,  5 Jan 2025 10:39:22 +0200
Message-ID: <20250105083922.3563784-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <CAAhSdy3RaJEnUJEB+W+7iTJ46c8r8vWUh5HBNe5utpxFv-zr0Q@mail.gmail.com>
References: <CAAhSdy3RaJEnUJEB+W+7iTJ46c8r8vWUh5HBNe5utpxFv-zr0Q@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_004001_201577_4025136B 
X-CRM114-Status: GOOD (  19.73  )
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

UmlzYy1WIEFQTElDIHNwZWNpZmljYXRpb24gZGVmaW5lcyAiaGFydCBpbmRleCIgaW4gWzFdOgoK
V2l0aGluIGEgZ2l2ZW4gaW50ZXJydXB0IGRvbWFpbiwgZWFjaCBvZiB0aGUgZG9tYWlu4oCZcyBo
YXJ0cyBoYXMgYQp1bmlxdWUgaW5kZXggbnVtYmVyIGluIHRoZSByYW5nZSAwIHRvIDJeMTQg4oiS
IDEgKD0gMTYsMzgzKS4gVGhlIGluZGV4Cm51bWJlciBhIGRvbWFpbiBhc3NvY2lhdGVzIHdpdGgg
YSBoYXJ0IG1heSBvciBtYXkgbm90IGhhdmUgYW55CnJlbGF0aW9uc2hpcCB0byB0aGUgdW5pcXVl
IGhhcnQgaWRlbnRpZmllciAo4oCcaGFydCBJROKAnSkgdGhhdCB0aGUKUklTQy1WIFByaXZpbGVn
ZWQgQXJjaGl0ZWN0dXJlIGFzc2lnbnMgdG8gdGhlIGhhcnQuIFR3byBkaWZmZXJlbnQKaW50ZXJy
dXB0IGRvbWFpbnMgbWF5IGVtcGxveSBlbnRpcmVseSBkaWZmZXJlbnQgaW5kZXggbnVtYmVycyBm
b3IKdGhlIHNhbWUgc2V0IG9mIGhhcnRzLgoKRnVydGhlciwgdGhpcyBkb2N1bWVudCBzYXlzIGlu
ICI0LjUgTWVtb3J5LW1hcHBlZCBjb250cm9sCnJlZ2lvbiBmb3IgYW4gaW50ZXJydXB0IGRvbWFp
biI6CgpUaGUgYXJyYXkgb2YgSURDIHN0cnVjdHVyZXMgbWF5IGluY2x1ZGUgc29tZSBmb3IgcG90
ZW50aWFsIGhhcnQgaW5kZXgKbnVtYmVycyB0aGF0IGFyZSBub3QgYWN0dWFsIGhhcnQgaW5kZXgg
bnVtYmVycyBpbiB0aGUgZG9tYWluLiBGb3IKZXhhbXBsZSwgdGhlIGZpcnN0IElEQyBzdHJ1Y3R1
cmUgaXMgYWx3YXlzIGZvciBoYXJ0IGluZGV4IDAsIGJ1dCAwIGlzCm5vdCBuZWNlc3NhcmlseSBh
IHZhbGlkIGluZGV4IG51bWJlciBmb3IgYW55IGhhcnQgaW4gdGhlIGRvbWFpbi4KClN1cHBvcnQg
YXJiaXRyYXJ5IGhhcnQgaW5kZXhlcyBzcGVjaWZpZWQgaW4gb3B0aW9uYWwgQVBMSUMgcHJvcGVy
dHkKInJpc2N2LGhhcnQtaW5kZXgiIHRoYXQgc2hvdWxkIGJlIGFycmF5IG9mIHUzMiBlbGVtZW50
cywgb25lIHBlcgppbnRlcnJ1cHQgdGFyZ2V0LiBJZiB0aGlzIHByb3BlcnR5IG5vdCBzcGVjaWZp
ZWQsIGZhbGxiYWNrIGlzIHRvIHVzZQpsb2dpY2FsIGhhcnQgaW5kZXhlcyB3aXRoaW4gdGhlIGRv
bWFpbi4KClsxXTogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWFpYQoKU2lnbmVkLW9m
Zi1ieTogVmxhZGltaXIgS29uZHJhdGlldiA8dmxhZGltaXIua29uZHJhdGlldkBtb2JpbGV5ZS5j
b20+Ci0tLQogZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1kaXJlY3QuYyB8IDI1ICsr
KysrKysrKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1h
cGxpYy1kaXJlY3QuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtZGlyZWN0LmMK
aW5kZXggN2NkNmI2NDY3NzRiLi5jODBhNjVjMTczMmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaXJx
Y2hpcC9pcnEtcmlzY3YtYXBsaWMtZGlyZWN0LmMKKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1y
aXNjdi1hcGxpYy1kaXJlY3QuYwpAQCAtMzEsNyArMzEsNyBAQCBzdHJ1Y3QgYXBsaWNfZGlyZWN0
IHsKIH07CiAKIHN0cnVjdCBhcGxpY19pZGMgewotCXVuc2lnbmVkIGludAkJaGFydF9pbmRleDsK
Kwl1MzIJCQloYXJ0X2luZGV4OwogCXZvaWQgX19pb21lbQkJKnJlZ3M7CiAJc3RydWN0IGFwbGlj
X2RpcmVjdAkqZGlyZWN0OwogfTsKQEAgLTIxOSw2ICsyMTksMjEgQEAgc3RhdGljIGludCBhcGxp
Y19kaXJlY3RfcGFyc2VfcGFyZW50X2h3aXJxKHN0cnVjdCBkZXZpY2UgKmRldiwgdTMyIGluZGV4
LAogCXJldHVybiAwOwogfQogCitzdGF0aWMgaW50IGFwbGljX2RpcmVjdF9nZXRfaGFydF9pbmRl
eChzdHJ1Y3QgZGV2aWNlICpkZXYsIHUzMiBsb2dpY2FsX2luZGV4LAorCQkJCSAgICAgICB1MzIg
KmhhcnRfaW5kZXgpCit7CisJc3RhdGljIGNvbnN0IGNoYXIgKnByb3BfaGFydF9pbmRleCA9ICJy
aXNjdixoYXJ0LWluZGV4IjsKKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gdG9fb2Zfbm9kZShk
ZXYtPmZ3bm9kZSk7CisKKwlpZiAoIW5wIHx8ICFvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLCBwcm9w
X2hhcnRfaW5kZXgpKSB7CisJCSpoYXJ0X2luZGV4ID0gbG9naWNhbF9pbmRleDsKKwkJcmV0dXJu
IDA7CisJfQorCisJcmV0dXJuIG9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KG5wLCBwcm9wX2hh
cnRfaW5kZXgsCisJCQkJCSAgbG9naWNhbF9pbmRleCwgaGFydF9pbmRleCk7Cit9CisKIGludCBh
cGxpY19kaXJlY3Rfc2V0dXAoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkIF9faW9tZW0gKnJlZ3Mp
CiB7CiAJaW50IGksIGosIHJjLCBjcHUsIGN1cnJlbnRfY3B1LCBzZXR1cF9jb3VudCA9IDA7CkBA
IC0yNjUsOCArMjgwLDEyIEBAIGludCBhcGxpY19kaXJlY3Rfc2V0dXAoc3RydWN0IGRldmljZSAq
ZGV2LCB2b2lkIF9faW9tZW0gKnJlZ3MpCiAJCWNwdW1hc2tfc2V0X2NwdShjcHUsICZkaXJlY3Qt
PmxtYXNrKTsKIAogCQlpZGMgPSBwZXJfY3B1X3B0cigmYXBsaWNfaWRjcywgY3B1KTsKLQkJaWRj
LT5oYXJ0X2luZGV4ID0gaTsKLQkJaWRjLT5yZWdzID0gcHJpdi0+cmVncyArIEFQTElDX0lEQ19C
QVNFICsgaSAqIEFQTElDX0lEQ19TSVpFOworCQlyYyA9IGFwbGljX2RpcmVjdF9nZXRfaGFydF9p
bmRleChkZXYsIGksICZpZGMtPmhhcnRfaW5kZXgpOworCQlpZiAocmMpIHsKKwkJCWRldl93YXJu
KGRldiwgImhhcnQgaW5kZXggbm90IGZvdW5kIGZvciBJREMlZFxuIiwgaSk7CisJCQljb250aW51
ZTsKKwkJfQorCQlpZGMtPnJlZ3MgPSBwcml2LT5yZWdzICsgQVBMSUNfSURDX0JBU0UgKyBpZGMt
PmhhcnRfaW5kZXggKiBBUExJQ19JRENfU0laRTsKIAkJaWRjLT5kaXJlY3QgPSBkaXJlY3Q7CiAK
IAkJYXBsaWNfaWRjX3NldF9kZWxpdmVyeShpZGMsIHRydWUpOwotLSAKMi40My4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
