Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C9DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 13:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IbvyV10pKqC7k0IbE324m/M/YCSVCixOM1B85gY5kfg=; b=Xx+EXqX0baZih+
	lOwZTi0EXcvrxMq4yVJJL66zuRRU2JuaIXLTMR+swCl3ZQmOat7uhAS/ujouLe8vNt3SMWQTB/1D1
	mjXlQP8s4i5s/0cg6vnJ1ogIpIDshw6vY/uASH11ZMR6nUWxQQilEuBpLt5rK9+h4VD+hG5R+9287
	wQOmm1UGh6BwMBhCWSZvPCR94byna//CXfuvx3cCgega3MnBY8s7LQKSjsq0Vsqgo8t8I5oO+V6M8
	X91xqPb6xcUD/42yPj9/57WrIBD1vydSZMoXrKbee49WAI1JR55hMgrqUBKF36fh90brWN26ZeGQt
	9PTadVrevnGgb7sJwC6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxr5d-005vER-BE; Thu, 16 Dec 2021 13:46:33 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxqxI-005rJi-M8
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 13:37:58 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by albert.telenet-ops.be with bizsmtp
 id X1dg2600Z250X30061dgKG; Thu, 16 Dec 2021 14:37:56 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxqx1-005Q99-Sv; Thu, 16 Dec 2021 14:37:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxqx1-009xvO-AJ; Thu, 16 Dec 2021 14:37:39 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>
Subject: [PATCH v4 0/4] Renesas RZ/N1 NAND controller support
Date: Thu, 16 Dec 2021 14:37:37 +0100
Message-Id: <20211215154619.166360-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639660956.git.geert@linux-m68k.org>
References: <cover.1639660956.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_053756_923471_D901AF18 
X-CRM114-Status: GOOD (  16.44  )
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

RnJvbTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCkhlbGxvLAoK
SGVyZSBpcyBhIHNob3J0IHNlcmllcyBicmluZ2luZyBzdXBwb3J0IGZvciBSZW5lc2FzIFJaL04x
IE5BTkQKY29udHJvbGxlci4KClRoaXMgdGltZSB0aGUgZHJpdmVyIGhhcyBiZWVuIHRlc3RlZCB3
aXRoIGEgZnVsbHktdXBzdHJlYW0gZGV2aWNlIHRyZWUKb24gdG9wIG9mIGEgdjUuMTYtcmM0LiBU
aGUgRFQgdXNlZCBpcyB2ZXJ5IGNsb3NlIHRvIHRoZSByOWEwNmcwMzItZGIuCgpDaGVlcnMsCk1p
cXXDqGwKCkNoYW5nZXMgaW4gdjQ6CiogU2V0IHVuZXZhbHVhdGVkUHJvcGVydGllcyBzZXQgdG8g
ZmFsc2UgaW4gdGhlIGJpbmRpbmdzLgoqIENoYW5nZSB0aGUgY2xvY2sgbmFtZXMgYnkgcmVtb3Zp
bmcgdGhlIG5hbmRfIHByZWZpeCB3aGljaCBpcwogIHJlZHVuZGFudCwgZXZlbiB0aG91Z2ggdGhl
IGNsb2NrcyBhcmUgbmFtZWQgbGlrZSB0aGlzIGluIHRoZSBzcGVjLiBUaGUKICBuYW1lIHJlbWFp
bnMgY2xlYXIgZW5vdWdoIGFueXdheS4KCkNoYW5nZXMgaW4gdjM6CiogUmViYXNlZCBvbiB0b3Ag
b2YgYSBmdWxseS11cHN0cmVhbSByZWNlbnQga2VybmVsLgoqIFJlbmFtZWQgdGhlIGNsb2NrcyBp
biB0aGUgYmluZGluZ3MgYW5kIHRoZSBkcml2ZXIgdG8gbWF0Y2ggdGhlCiAgZG9jdW1lbnRhdGlv
biAobG93ZXItY2FzZWQpOiBuYW5kX2hjbGsgJiBuYW5kX2VjbGsuCiogQWRkZWQgYSBuZXcgY29t
bWl0IGRlc2NyaWJpbmcgdGhlIE5BTkQgY29udHJvbGxlciBpbiB0aGUgcjlhMDZnMDMyCiAgRFRT
SS4KKiBBZGRlZCB0aGUgUmV2aWV3ZWQtYnkgYW5kIFRlc3RlZC1ieSB0YWdzIHJlY2VpdmVkLgoK
Q2hhbmdlcyBpbiB2MjoKKiBBZGRlZCB0aGUgZmFtaWx5LXNwZWNpZmljIHJ6bjEgY29tcGF0aWJs
ZSBhcyBzdWdnZXN0ZWQgYnkgR2VlcnQuCiAgVXBkYXRlZCB0aGUgYmluZGluZ3MsIHRoZSBiaW5k
aW5nIGZpbGUgbmFtZSwgdGhlIGNvbXBhdGlibGUgdXNlZCBpbgogIHRoZSBkcml2ZXIsIHRoZSBN
QUlOVEFJTkVSUyBlbnRyeSwgZXRjLgoqIEFkZGVkIGFuIEFSQ0hfUkVORVNBUyBLY29uZmlnIGRl
cGVuZGVuY3kuCiogQ2hhbmdlZCB0aGUgdHlwZSAodG8gdW5zaWduZWQpIG9mIGEgY291cGxlIG9m
IHZhcmlhYmxlcy4KKiBSZXR1cm5lZCBlYXJsaWVyIHdoZW4gcG9zc2libGUgdG8gcmVkdWNlIGlu
ZGVudGF0aW9uLgoqIFVzZWQgcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpIGluc3RlYWQgb2Yg
cGxhdGZvcm1fZ2V0X2lycSgpIHRvIGF2b2lkCiAgYSB1c2VsZXNzIHdhcm5pbmcuCiogSGFuZGxl
ZCBwcm9iZSBkZWZlcnJhbCBjb3JyZWN0bHkuCiogQXBwbGllZCBhIG1hc3NpdmUgcy9uZmMvbmFu
ZGMvIGFzIHN1Z2dlc3RlZCBieSBHZWVydCB0byBhdm9pZAogIGNvbmZ1c2lvbnMgd2l0aCB0aGUg
bmVhci1maWVsZC1jb21tdW5pY2F0aW9uIGRldmljZS4KKiBNZW50aW9uZWQgRXZhdHJvbml4IGFz
IG9yaWdpbmFsIGF1dGhvcnMgb2YgdGhlIElQIGluIHRoZSBjb21taXQgbG9nIGFuZAogIGluIHRo
ZSBoZWFkZXIuCiogQWRkZWQgYW4gYWRkaXRpb25hbCBjaGVjayBvbiB0aGUgdmFsaWRpdHkgb2Yg
dGhlIGNoaWxkIG5vZGVzIHJlZyBwcm9wZXJ0eS4KKiBBIGNvdXBsZSBvZiBzdHlsZSBmaXhlcy4K
Ck1pcXVlbCBSYXluYWwgKDQpOgogIGR0LWJpbmRpbmdzOiBtdGQ6IHJ6bjE6IERlc2NyaWJlIFJl
bmVzYXMgUlovTjEgTkFORCBjb250cm9sbGVyCiAgbXRkOiByYXduYW5kOiByem4xOiBBZGQgbmV3
IE5BTkQgY29udHJvbGxlciBkcml2ZXIKICBNQUlOVEFJTkVSUzogQWRkIGFuIGVudHJ5IGZvciBS
ZW5lc2FzIFJaL04xIE5BTkQgY29udHJvbGxlcgogIEFSTTogZHRzOiByOWEwNmcwMzI6IERlc2Ny
aWJlIE5BTkQgY29udHJvbGxlcgoKIC4uLi9tdGQvcmVuZXNhcyxyem4xLW5hbmQtY29udHJvbGxl
ci55YW1sICAgICB8ICAgNjQgKwogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAgNyArCiBhcmNoL2FybS9ib290L2R0cy9yOWEwNmcwMzIuZHRzaSAgICAg
ICAgICAgICAgfCAgIDEyICsKIGRyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcgICAgICAgICAg
ICAgICAgICB8ICAgIDYgKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgIHwgICAgMSArCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9yem4xLW5hbmQtY29udHJvbGxl
ci5jICAgfCAxNDIyICsrKysrKysrKysrKysrKysrCiA2IGZpbGVzIGNoYW5nZWQsIDE1MTIgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvcmVuZXNhcyxyem4xLW5hbmQtY29udHJvbGxlci55YW1sCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9tdGQvbmFuZC9yYXcvcnpuMS1uYW5kLWNvbnRyb2xsZXIuYwoKLS0g
CjIuMjcuMAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
