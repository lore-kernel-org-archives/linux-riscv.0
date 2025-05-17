Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F74BC3ABDD
	for <linux-riscv@archiver.kernel.org>; Sat, 17 May 2025 19:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7G9TZC/JLJ0J+S/GyMymrPBzA4YRwAv3FT+7pgWJs/s=; b=OYkmQ+YnQ5+0uI
	jU/Xgjuq4VEW190Acv2wyQ8kUMR5pneqWKNzL1NW7M6Ne8mMXTYUr4dCEqM3OWJnrSPE6hibhegTR
	6Ef41ctqKRnS0agrzuJ2c9YgwtGD1ByxvtjQ4xZvRaiMk5yIGiJjCKjf9gnV88n3EtRfRJ+uQC9YI
	yXc0l4OdHkgiY8Oj/ajVvrF29M/7BX3f+AYTZ5hJ5wNEG3f+4Uwc8eYWrgMXfS2Ulc0oaHOg0irhD
	NMsrNOUt8wZwo4f3fcL9RuE3vpRWtMUPtYEhGG3HozInC6JUAiPBicyyEeA/kmEfp8BhIaTj0xG11
	DExhw3ikgnkkZ6a8/ISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGN4i-00000006AwC-0hb9;
	Sat, 17 May 2025 19:20:00 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGN4e-00000006AvX-41ej
	for linux-riscv@lists.infradead.org;
	Sat, 17 May 2025 19:19:59 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.32])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15658ef3f;
	Sun, 18 May 2025 03:19:44 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Subject: [PATCH v3 0/3] Add SpacemiT K1 USB3.0 host controller support
Date: Sun, 18 May 2025 03:19:18 +0800
Message-Id: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADbhKGgC/yXMyw6DIBCF4Vcxsy4JIDDoqzQuuIwtadQWrG1if
 PeSuvxOcv4dCuVEBfpmh0xbKmmZK9pLA+Hu5huxFKtBcqm5Fsi8Yg/B4ie0bGuZltw6ziVK66B
 +npnG9P33rsPpTK93za7nCN4VYmGZprT2jfMmhs6ZgFIESRStwSA0KoVolCNjx7HzSDAcxw83d
 CnCqwAAAA==
X-Change-ID: 20250517-b4-k1-dwc3-v3-5208a002728a
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747509584; l=2565;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=m0rhmjL8pDzWwTV99e480ZMyCgYeWWuByDM1d3BgpJg=;
 b=RQik/nkIEBOID3dW/RIXcwUzBpll9dRE5Er0E9l14Zewu8TxWxL1+VA6nzaYwaF8oDxeDGbbm
 6t19cUhiwfQCxQsAyhm6gaORVvB8KC4/5Vvdi4XXfcPrcAA5TR5pX2M
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSk0eVktPTxlCTBlJShpJT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVISVlXWRYaDxIVHRRZQVlPS0hVSktJT09PS1VKS0tVS1kG
X-HM-Tid: 0a96dfb024c803a1kunm15658ef3f
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PyI6OSo6EDE9CCo9Qxo3LA4B
	EwoKFExVSlVKTE9MTktCTkJKSktMVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVISVlXWQgBWUFPSUhCNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_121957_156775_8A7BF4F5 
X-CRM114-Status: UNSURE (   9.15  )
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

VGhlIFVTQiAzLjAgY29udHJvbGxlciBmb3VuZCBpbiB0aGUgU3BhY2VtaVQgSzEgU29DWzFdIHN1
cHBvcnRzIGJvdGggVVNCMy4wCkhvc3QgYW5kIFVTQjIuMCBEdWFsLVJvbGUgRGV2aWNlIChEUkQp
LiBUaGUgUEhZIGludGVyZmFjZXMgcmVxdWlyZWQgZm9yIHRoZQpLMSBVU0Igc3Vic3lzdGVtIOKA
lCBQSVBFMyAoZm9yIFVTQiAzLjApIGFuZCBVVE1JKyAoZm9yIFVTQiAyLjApIOKAlCBoYXZlCmFs
cmVhZHkgYmVlbiBzdXBwb3J0ZWQgaW4gYSBzZXBhcmF0ZSBwYXRjaHNldCBbMl0uCgpUaGlzIGNv
bnRyb2xsZXIgaXMgY29tcGF0aWJsZSB3aXRoIERlc2lnbldhcmUgQ29yZSBVU0IgMyAoRFdDMykg
ZHJpdmVyLgpIb3dldmVyLCBjb25zdHJhaW50cyBpbiB0aGUgc25wcyxkd2MzIGJpbmRpbmcgbGlt
aXQgdGhlIGFiaWxpdHkgdG8gZXh0ZW5kCnByb3BlcnRpZXMgdG8gZGVzY3JpYmUgaGFyZHdhcmUg
dmFyaWF0aW9ucy4gVGhlIGV4aXN0aW5nIGdlbmVyaWMgRFdDMyBkcml2ZXIsCmR3YzMtb2Ytc2lt
cGxlLCBzdGlsbCBmdW5jdGlvbnMgYXMgYSBnbHVlIGxheWVyLgoKVG8gYWRkcmVzcyB0aGlzIGFu
ZCBwcm9tb3RlIHRyYXNpdGlvbiB0byBmbGF0dGVuZWQgZHdjIG5vZGUsIHRoaXMgcGF0Y2gKaW50
cm9kdWNlcyBkd2MzLWNvbW1vbiwgYnVpbGRpbmcgdXBvbiBwcmlvciB3b3JrIHRoYXQgZXhwb3Nl
ZCB0aGUgRFdDMyBjb3JlCmRyaXZlciBbM10uCgpUaGlzIHBhdGNoc2V0IGlzIGJhc2VkIG9uIHVz
Yi1uZXh0ICg2LjE1LXJjNikgYW5kIGhhcyBiZWVuIHRlc3RlZCBvbiBCYW5hbmFQaSBhbmQgSnVw
aXRlciBkZXZlbG9wbWVudCBib2FyZHMuCgpMaW5rOiBodHRwczovL2RldmVsb3Blci5zcGFjZW1p
dC5jb20vZG9jdW1lbnRhdGlvbj90b2tlbj1BakhEd3JXNzhpZ0FBRWtpSHJhY0JJOUhuVGIgWzFd
Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwNDE4LWI0LWsx
LXVzYjMtcGh5LXYyLXYyLTAtYjY5ZTAyZGE4NGViQHdodXQuZWR1LmNuIFsyXQpMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA0MTQtZHdjMy1yZWZhY3Rvci12Ny0zLWYwMTVi
MzU4NzIyZEBvc3MucXVhbGNvbW0uY29tIFszXQoKU2lnbmVkLW9mZi1ieTogWmUgSHVhbmcgPGh1
YW5nemVAd2h1dC5lZHUuY24+Ci0tLQpDaGFuZ2VzIGluIHYzOgotIGludHJvZHVjZSBkd2MzLWNv
bW1vbiBmb3IgZ2VuZXJpYyBkd2MzIGhhcmR3YXJlCi0gZml4IHdhcm5pbmdzIGluIHVzYiBob3N0
IGR0LWJpbmRpbmdzCi0gZml4IGVycm9ycyBpbiBkdHMKLSBMaW5rIHRvIHYyOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjUwNDI4LWI0LWsxLWR3YzMtdjItdjEtMC03Y2IwNjFhYmQ2MTlA
d2h1dC5lZHUuY24KCkNoYW5nZXMgaW4gdjI6Ci0gZHQtYmluZGluZ3M6CiAgLSBhZGQgbWlzc2lu
ZyAnbWF4SXRlbXMnCiAgLSByZW1vdmUgJ3N0YXR1cycgcHJvcGVydHkgaW4gZXhtYXBsZQogIC0g
Zm9sZCBkd2MzIG5vZGUgaW50byBwYXJlbnQKLSBkcm9wIGR3YzMgZ2x1ZSBkcml2ZXIgYW5kIHVz
ZSBzbnBzLGR3YzMgZHJpdmVyIGRpcmVjdGx5Ci0gcmVuYW1lIGR0cyBub2RlcyBhbmQgcmVvcmRl
ciBwcm9wZXJ0aWVzIHRvIGZpdCBjb2Rpbmcgc3R5bGUKLSBMaW5rIHRvIHYxOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNTA0MDctYjQtazEtdXNiMy12My0yLXYxLTAtYmYwYmNjNDFj
OWJhQHdodXQuZWR1LmNuCgotLS0KWmUgSHVhbmcgKDMpOgogICAgICBkdC1iaW5kaW5nczogdXNi
OiBkd2MzOiBhZGQgc3VwcG9ydCBmb3IgU3BhY2VtaVQgSzEKICAgICAgdXNiOiBkd2MzOiBhZGQg
Y29tbW9uIGRyaXZlciB0byBzdXBwb3J0IGZsYXR0ZW5lZCBEVAogICAgICByaXNjdjogZHRzOiBz
cGFjZW1pdDogYWRkIHVzYjMuMCBzdXBwb3J0IGZvciBLMQoKIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3VzYi9zcGFjZW1pdCxrMS1kd2MzLnlhbWwgIHwgIDg0ICsrKysrKysrKwogYXJjaC9yaXNj
di9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMgICAgfCAgNTAgKysrKysrCiBh
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kgICAgICAgICAgICAgICB8ICA2OSAr
KysrKysrKwogZHJpdmVycy91c2IvZHdjMy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDkgKwogZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDEgKwogZHJpdmVycy91c2IvZHdjMy9kd2MzLWNvbW1vbi5jICAgICAgICAgICAg
ICAgICAgICAgfCAxOTEgKysrKysrKysrKysrKysrKysrKysrCiA2IGZpbGVzIGNoYW5nZWQsIDQw
NCBpbnNlcnRpb25zKCspCi0tLQpiYXNlLWNvbW1pdDogYWI2ZGM5YTZjNzIxYzJlZWQ4NjdjMTU3
NDQ3NzY0YWU2OGZmOWI3ZQpjaGFuZ2UtaWQ6IDIwMjUwNTE3LWI0LWsxLWR3YzMtdjMtNTIwOGEw
MDI3MjhhCgpCZXN0IHJlZ2FyZHMsCi0tIApaZSBIdWFuZyA8aHVhbmd6ZUB3aHV0LmVkdS5jbj4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
