Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EA6C0218D
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 09:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=McJKrUvstpRu/G/ewGkaH8M7XV+biZZmhZqLfyyOPnU=; b=WHDX4+ddZBGaah
	qW5vuYdFBc7E4/VaqFwhDyAzaaNzCVD3eEuDVzTmACbM6zZoSCIFWZphKRbUHqb9YPExUYS3/NjGr
	ThA/9KWpjpeKJa1CyG2YdndHTSUjFBlAeNlTcixlxIY1uTdPSbTUak+DsMi/ugnVRVyvUOByzQMcc
	IFjPMAs3GELWRnkOtURo3oWH0TXOU+NEyoPcIha8RFJfYE1N65Hfg1DrAFKwKspQ649A8iR1M4Ewp
	tyV2rVZ5lMejPtE4x8bg0DSCXBhlMvjS9HzZPQOdh3/iYF0mqTRSrHj1mGv3yOmws2gbGe5eYdztz
	tnO0z8AMR3ZsVtfpvKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td4Bw-00000006d5O-0PT2;
	Wed, 29 Jan 2025 09:17:00 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td4Bn-00000006d2M-3gN3
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 09:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1738142212; x=1769678212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t4I+3GYTBD9R29FxQzIKQ/m13Ut3AEhZho/gtBtVzk8=;
  b=a50D9kc9QDB2jifHyCBxAfZkT6NkkLtM66L7TGd1stIuWhKABcc2ol5+
   f4sI8BTStypICDDJPK+WV6xBCMOz5o6Atw8W8XibV1JAr8IuU74u9knpp
   qFGSz1kZhemCB2zRfoAgbQye7s9nJzGypd3nD3kTfLKP9Q5J64zi8E6WH
   H83PQMEpggoJwU4bLYjwkyIMBdC8U1a+JMjQ+nBe18MBFTFTf3tTg51mR
   qztcQkd/1XWEXMy9a/JK4H7Uyho/VG88092Bp4rLCrUhU79+oPCP+c1wE
   BmuXjBOFNgdtZ2Dk/B/v4XPhOTRjW6/j1MwBufgNhGFXbvszmE0pdv5DA
   A==;
X-CSE-ConnectionGUID: F/TJ/PaSQWqvYqiJbRYzOg==
X-CSE-MsgGUID: SKum6Q1bSrSctiuJ8TojNw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 11:16:44 +0200
X-CSE-ConnectionGUID: nONMQM6cRruRabxuYX8Nfw==
X-CSE-MsgGUID: vXRUQUsaTx62JrFTD94w6A==
Received: from unknown (HELO epgd022.me-corp.lan) ([10.154.54.1])
  by ces03_data.me-corp.lan with SMTP; 29 Jan 2025 11:16:41 +0200
Received: by epgd022.me-corp.lan (sSMTP sendmail emulation); Wed, 29 Jan 2025 11:16:43 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v5 2/2] irqchip/riscv-aplic: add support for hart indexes
Date: Wed, 29 Jan 2025 11:16:37 +0200
Message-ID: <20250129091637.1667279-3-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250129091637.1667279-1-vladimir.kondratiev@mobileye.com>
References: <87ed0o87qg.ffs@tglx>
 <20250129091637.1667279-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_011652_224629_8C1CECC2 
X-CRM114-Status: GOOD (  19.56  )
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
dHkKInJpc2N2LGhhcnQtaW5kZXhlcyIgdGhhdCBzaG91bGQgYmUgYXJyYXkgb2YgdTMyIGVsZW1l
bnRzLCBvbmUgcGVyCmludGVycnVwdCB0YXJnZXQuIElmIHRoaXMgcHJvcGVydHkgbm90IHNwZWNp
ZmllZCwgZmFsbGJhY2sgaXMgdG8gdXNlCmxvZ2ljYWwgaGFydCBpbmRleGVzIHdpdGhpbiB0aGUg
ZG9tYWluLgoKWzFdOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYWlhCgpTaWduZWQt
b2ZmLWJ5OiBWbGFkaW1pciBLb25kcmF0aWV2IDx2bGFkaW1pci5rb25kcmF0aWV2QG1vYmlsZXll
LmNvbT4KUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Ci0tLQog
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1kaXJlY3QuYyB8IDI1ICsrKysrKysrKysr
KysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1kaXJl
Y3QuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtZGlyZWN0LmMKaW5kZXggN2Nk
NmI2NDY3NzRiLi5lYTYxMzI5ZGVjYjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEt
cmlzY3YtYXBsaWMtZGlyZWN0LmMKKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxp
Yy1kaXJlY3QuYwpAQCAtMzEsNyArMzEsNyBAQCBzdHJ1Y3QgYXBsaWNfZGlyZWN0IHsKIH07CiAK
IHN0cnVjdCBhcGxpY19pZGMgewotCXVuc2lnbmVkIGludAkJaGFydF9pbmRleDsKKwl1MzIJCQlo
YXJ0X2luZGV4OwogCXZvaWQgX19pb21lbQkJKnJlZ3M7CiAJc3RydWN0IGFwbGljX2RpcmVjdAkq
ZGlyZWN0OwogfTsKQEAgLTIxOSw2ICsyMTksMjEgQEAgc3RhdGljIGludCBhcGxpY19kaXJlY3Rf
cGFyc2VfcGFyZW50X2h3aXJxKHN0cnVjdCBkZXZpY2UgKmRldiwgdTMyIGluZGV4LAogCXJldHVy
biAwOwogfQogCitzdGF0aWMgaW50IGFwbGljX2RpcmVjdF9nZXRfaGFydF9pbmRleChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHUzMiBsb2dpY2FsX2luZGV4LAorCQkJCSAgICAgICB1MzIgKmhhcnRfaW5k
ZXgpCit7CisJc3RhdGljIGNvbnN0IGNoYXIgKnByb3BfaGFydF9pbmRleCA9ICJyaXNjdixoYXJ0
LWluZGV4ZXMiOworCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSB0b19vZl9ub2RlKGRldi0+Zndu
b2RlKTsKKworCWlmICghbnAgfHwgIW9mX3Byb3BlcnR5X3ByZXNlbnQobnAsIHByb3BfaGFydF9p
bmRleCkpIHsKKwkJKmhhcnRfaW5kZXggPSBsb2dpY2FsX2luZGV4OworCQlyZXR1cm4gMDsKKwl9
CisKKwlyZXR1cm4gb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgobnAsIHByb3BfaGFydF9pbmRl
eCwKKwkJCQkJICBsb2dpY2FsX2luZGV4LCBoYXJ0X2luZGV4KTsKK30KKwogaW50IGFwbGljX2Rp
cmVjdF9zZXR1cChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgX19pb21lbSAqcmVncykKIHsKIAlp
bnQgaSwgaiwgcmMsIGNwdSwgY3VycmVudF9jcHUsIHNldHVwX2NvdW50ID0gMDsKQEAgLTI2NSw4
ICsyODAsMTIgQEAgaW50IGFwbGljX2RpcmVjdF9zZXR1cChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZv
aWQgX19pb21lbSAqcmVncykKIAkJY3B1bWFza19zZXRfY3B1KGNwdSwgJmRpcmVjdC0+bG1hc2sp
OwogCiAJCWlkYyA9IHBlcl9jcHVfcHRyKCZhcGxpY19pZGNzLCBjcHUpOwotCQlpZGMtPmhhcnRf
aW5kZXggPSBpOwotCQlpZGMtPnJlZ3MgPSBwcml2LT5yZWdzICsgQVBMSUNfSURDX0JBU0UgKyBp
ICogQVBMSUNfSURDX1NJWkU7CisJCXJjID0gYXBsaWNfZGlyZWN0X2dldF9oYXJ0X2luZGV4KGRl
diwgaSwgJmlkYy0+aGFydF9pbmRleCk7CisJCWlmIChyYykgeworCQkJZGV2X3dhcm4oZGV2LCAi
aGFydCBpbmRleCBub3QgZm91bmQgZm9yIElEQyVkXG4iLCBpKTsKKwkJCWNvbnRpbnVlOworCQl9
CisJCWlkYy0+cmVncyA9IHByaXYtPnJlZ3MgKyBBUExJQ19JRENfQkFTRSArIGlkYy0+aGFydF9p
bmRleCAqIEFQTElDX0lEQ19TSVpFOwogCQlpZGMtPmRpcmVjdCA9IGRpcmVjdDsKIAogCQlhcGxp
Y19pZGNfc2V0X2RlbGl2ZXJ5KGlkYywgdHJ1ZSk7Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
