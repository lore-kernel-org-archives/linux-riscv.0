Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8417C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 09:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RvVUYRs52y/+kH2CFemi+6ux626g8632wq8uS0tRlEs=; b=5HDc7VkxSSZYTS
	CLDTFs9TZa6KhtYfFUS+X/67jxKV1QBCAT1sAPUYZ+RsFuPZogCSeUQZaZTFmgvE/Mx4CJA52DxZn
	u43y9b54G+6lsWSkY+TI/S0xAOtRxNO2WvjGb8UH+me2kvmDflYfojwOCR1yChOhNuCzA1lG5bfQU
	xTiP8nBr/zpodyoD1ZVDrqRCnuhaHVjuKTAJ3TE6R0O6VlQ/XT8dqIc5CYc2XhDX4eIIfqqJ8VFat
	QvbQuRLa7aws/A7Dg8lq/9mxPQ2drx1yCP3uQ9sLBQLV6bpAzxlT9aVdIwEXKf4Wt3z6rmK5ST79f
	KOyzugXJDaSQPxJfWjag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWnq-0000000ES5t-3FXr;
	Mon, 27 May 2024 09:38:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWno-0000000ES4C-18cN
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 09:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1716802679; x=1748338679;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XBN7++Zvn6jUh1suRjCaio6HybTeWQjWEhslD6Yd0b8=;
  b=Gd9Jv0C9yxKbhuiTauUkCjE11Ur3U6Jrpl3fkKm+hSRuotWeFqVFYIZP
   Ms7bekbPmb0sdH42Y0pritzXGVBwZenpB9avP/zXT/osHvhjVsQWhfeex
   y75n2n7618RnebapUHUFD9SCcjuovwFsLD06/E865z2pjDGDvBJNYXD/H
   I3ou3ehV+cduxse5+yth+VJj9rogip1Z0Njn07D2MduzvYa2kPbrUC8KH
   Yy0AFLGHXKmCbuVjs8soqYp9gltH9U15Yywt9s/19KfVLreohkfGJ7IFV
   rSdFdq1Byj16d80l3Gki36OLObBFtvHENMs0PMUhJFpjeYJ+0RkxkqFn8
   g==;
X-CSE-ConnectionGUID: AcSvwgxcR7OHBHrk8NTkiw==
X-CSE-MsgGUID: 9VeZiux7QCa+8v7K5kzo2A==
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="193774875"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 May 2024 02:37:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 27 May 2024 02:37:36 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 27 May 2024 02:37:34 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: 
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring
	<robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v1 0/2] PCI: microchip: support using either instance 1 or 2
Date: Mon, 27 May 2024 10:37:13 +0100
Message-ID: <20240527-slather-backfire-db4605ae7cd7@wendy>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=XBN7++Zvn6jUh1suRjCaio6HybTeWQjWEhslD6Yd0b8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGkhIV5Hb7ekJjy5yn61vjp/YpvsgyCxNZrvRef79E9Z3+6W 8uFhRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACaiMpHhr5DDG46y3Zencpk4fFrxyy f147+COPmrgR+W7Www+D5dI56R4amTOremdfZq2zc19WvYBFssG2QYkieJsHKvE0pImxrIDQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_023800_453467_4A3BCAAB 
X-CRM114-Status: UNSURE (   6.44  )
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

VGhlIGN1cnJlbnQgZHJpdmVyIGFuZCBiaW5kaW5nIGZvciBQb2xhckZpcmUgU29DJ3MgUENJIGNv
bnRyb2xsZXIgYXNzdW1lCnRoYXQgdGhlIHJvb3QgcG9ydCBpbnN0YW5jZSBpbiB1c2UgaXMgaW5z
dGFuY2UgMS4gVGhlIHNlY29uZCByZWcKcHJvcGVydHkgY29uc3RpdHV0ZXMgdGhlIHJlZ2lvbiBl
bmNvbXBhc3NpbmcgYm90aCAiY29udHJvbCIgYW5kICJicmlkZ2UiCnJlZ2lzdGVycyBmb3IgYm90
aCBpbnN0YW5jZXMuIEluIHRoZSBkcml2ZXIsIGEgZml4ZWQgb2Zmc2V0IGlzIGFwcGxpZWQgdG8K
ZmluZCB0aGUgYmFzZSBhZGRyZXNzZXMgZm9yIGluc3RhbmNlIDEncyAiY29udHJvbCIgYW5kICJi
cmlkZ2UiCnJlZ2lzdGVycy4gVGhlIEJlYWdsZVYgRmlyZSB1c2VzIHJvb3QgcG9ydCBpbnN0YW5j
ZSAyLCBzbyBzb21ldGhpbmcgbXVzdApiZSBkb25lIHNvIHRoYXQgc29mdHdhcmUgY2FuIGRpZmZl
cmVudGlhdGUuIFRoaXMgc2VyaWVzIHNwbGl0cyB0aGUKc2Vjb25kIHJlZyBwcm9wZXJ0eSBpbiB0
d28sIHdpdGggZGVkaWNhdGVkICJjb250cm9sIiBhbmQgImJyaWRnZSIKZW50cmllcyBzbyB0aGF0
IGVpdGhlciBpbnN0YW5jZSBjYW4gYmUgdXNlZC4KCkNoZWVycywKQ29ub3IuCgpDQzogRGFpcmUg
TWNOYW1hcmEgPGRhaXJlLm1jbmFtYXJhQG1pY3JvY2hpcC5jb20+CkNDOiBMb3JlbnpvIFBpZXJh
bGlzaSA8bHBpZXJhbGlzaUBrZXJuZWwub3JnPgpDQzogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxr
d0BsaW51eC5jb20+CkNDOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDQzogQmpvcm4g
SGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KQ0M6IEtyenlzenRvZiBLb3psb3dza2kgPGty
emsrZHRAa2VybmVsLm9yZz4KQ0M6IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz4K
Q0M6IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmcKQ0M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnCkNDOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkNDOiBsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCgpDb25vciBEb29sZXkgKDIpOgogIGR0LWJpbmRpbmdzOiBQQ0k6IG1p
Y3JvY2hpcCxwY2llLWhvc3Q6IGZpeCByZWcgcHJvcGVydGllcwogIFBDSTogbWljcm9jaGlwOiBy
ZXdvcmsgcmVnIHJlZ2lvbiBoYW5kaW5nCgogLi4uL2JpbmRpbmdzL3BjaS9taWNyb2NoaXAscGNp
ZS1ob3N0LnlhbWwgICAgIHwgIDEwICstCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWlj
cm9jaGlwLWhvc3QuYyAgfCAxNTkgKysrKysrKysrLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQs
IDgzIGluc2VydGlvbnMoKyksIDg2IGRlbGV0aW9ucygtKQoKLS0gCjIuNDMuMgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
