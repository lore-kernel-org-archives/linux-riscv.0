Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37825C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 10:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSfQNga2P431q8uuwxWLCKz8SZ/dV9vwqL+mhToyxaY=; b=DVq8QxqbHLComB
	LSJTZ9QZiCc7c5kt68dXL0/23NrskkYd0szzfiGdcLdfbbyj1gXEaVbeZ/0VITJ4iNFUZ0NeDqfI9
	Mgkf8rmrDcUdZStExsUsJxjs2DAwhFvMC/91+sJ/7G1XwGABCLa/ca9/nY9SaYjqAgiD1YL6tlrP8
	stQUprPPfdPKJ6+SN8n43OwZobMEQ0WKO4MJJdCH55SV9qIZrMHLornEQq63UUH+tb4Y05CatinX+
	oq/ltGYEl5u6KeZYx8t/J3K1nJtLLSngo5hiqfxCY/6ZBhinA9Lhjfmkmb7EXV07oGZjplseCt/9x
	LTMTWda38/dVlTJ7wdlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6r0h-00GQaU-9E; Thu, 30 Jun 2022 10:02:55 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6r0d-00GQX9-OV
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 10:02:53 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 2D8E85C02FA;
	Thu, 30 Jun 2022 06:02:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 30 Jun 2022 06:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1656583368; x=
	1656669768; bh=rukFsKCtzvuRkbG83MFab30lodzeGqZdlWa/kvg1r5s=; b=Z
	EMEv2BBGFfuf6awEWncvn0trs5PXyggT8N4vSiYYnMz+nYW5ncjVNj3bLucMp0zQ
	O1sIAbxLYqn1AYdSLjm3A6k5JJW4gpAZMKCH9GnXRioJjyX2c5sb7tQQFFrlzgcZ
	y2IEN09y/tc6P4RwhDkebnJ7xt9hFpjcwD7bbYjOuwoQizjZ0Tbzp0Kf/dACWHP9
	/ucYsmi/MQaeD0jyGJq9iBLk5P2u8DhCsJxrHNdd4QdsU0kQbl9n+B6HsVEFe3Pl
	zVWlyCquv1AySqSQ2tgehy1yCxfdXCTHvSpmW1gHiPW8eNwEUv5xWk8j7Gdzf+OH
	54eS7IIr++TePJ043ONBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656583368; x=
	1656669768; bh=rukFsKCtzvuRkbG83MFab30lodzeGqZdlWa/kvg1r5s=; b=s
	J77aMr1PK2JwSDE0Q1JpiW+pkh58ufaITM8Gv8+ao9ZgsUEdWWGdbdOtUT6EDDmi
	/4IpuL0YEYBHoN0tRFWjqieKleXqtlVym/iGqmC/aBU4djWnXNNg+S432FRbnMbJ
	akurfl5HBhOcieBsdhSSgH8sVDsDutoW80NIIk995tdkZ3CKSGM7SZ5lJfFHrrZ+
	YVa0FsUoAXTwidiBfgfkjPQ9PVHjU3AJJWhPI+5jFXY9azuHj9EbOKqzqnnZXvG8
	1PttTQaD1/y5I3cPibh0yvwkuuR6Y4fM+8wLRAVxFxLVN1DgYSvMwSMa5/qJwOLj
	qpUZPsBFcTRpUOzldQW7Q==
X-ME-Sender: <xms:x3S9Yqog83lhQWxJoDUD4-KX1djloJrYVoYsNvospCB9uQzTop2WnQ>
    <xme:x3S9YorAiyyq5lWZhX88xMuoObvNlcXqKuU8zShAZFSbAxF5BFwmTwnNqXRchWKIY
    M7HhPdC58HEUoQMSg>
X-ME-Received: <xmr:x3S9YvNOFamXUagJ9Jx5-2HtvN9GrgbSZ66sy--SALsuIVqPc9CH7xUvNwY9x6OFnFTCvEJxAaOVbYF7Gi9_LbXK9cjFZX4cXNn5IpmOmc3pHs7stj801GTiOXjogI3cyXaWyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehuddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeefueevueeffeelheelhfelgeelgffgieekffevteefveejueei
    teeugfefieehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:yHS9Yp5b6OnPMvf9gccnyecyMdPRYDRJDEzJeh9BAFuXf88yezSXww>
    <xmx:yHS9Yp66KhBENlqBPMrfa6hXaae3Kg4IhUUmMp6aByJhdTAS_C_LbA>
    <xmx:yHS9YpgFatQr0MzobHraY-EQUl1e8xbcMDMh3SDowkPzxANQPp8C4g>
    <xmx:yHS9YgowBalQ8_8eWN2CCy9LD1CxGX9XGdjJN-Lyjo2Pu8xEjusPvA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 06:02:47 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Marc Zyngier <maz@kernel.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Samuel Holland <samuel@sholland.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/4] dt-bindings: interrupt-controller: Require trigger type for T-HEAD PLIC
Date: Thu, 30 Jun 2022 05:02:40 -0500
Message-Id: <20220630100241.35233-4-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630100241.35233-1-samuel@sholland.org>
References: <20220630100241.35233-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_030251_918071_79940EA6 
X-CRM114-Status: GOOD (  14.07  )
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

VGhlIFJJU0MtViBQTElDIHNwZWNpZmljYXRpb24gdW5mb3J0dW5hdGVseSBhbGxvd3MgUExJQyBp
bXBsZW1lbnRhdGlvbnMKdG8gaWdub3JlIGVkZ2VzIHNlZW4gd2hpbGUgYW4gZWRnZS10cmlnZ2Vy
ZWQgaW50ZXJydXB0IGlzIGJlaW5nIGhhbmRsZWQ6CgogIERlcGVuZGluZyBvbiB0aGUgZGVzaWdu
IG9mIHRoZSBkZXZpY2UgYW5kIHRoZSBpbnRlcnJ1cHQgaGFuZGxlciwKICBpbiBiZXR3ZWVuIHNl
bmRpbmcgYW4gaW50ZXJydXB0IHJlcXVlc3QgYW5kIHJlY2VpdmluZyBub3RpY2Ugb2YgaXRzCiAg
aGFuZGxlcuKAmXMgY29tcGxldGlvbiwgdGhlIGdhdGV3YXkgbWlnaHQgZWl0aGVyIGlnbm9yZSBh
ZGRpdGlvbmFsCiAgbWF0Y2hpbmcgZWRnZXMgb3IgaW5jcmVtZW50IGEgY291bnRlciBvZiBwZW5k
aW5nIGludGVycnVwdHMuCgpMaWtlIHRoZSBOQ0VQTElDMTAwLCB0aGUgVC1IRUFEIEM5MDAgUExJ
QyBhbHNvIGhhcyB0aGlzIGJlaGF2aW9yLiBUaHVzCml0IGFsc28gbmVlZHMgdG8gaW5mb3JtIHNv
ZnR3YXJlIGFib3V0IGVhY2ggaW50ZXJydXB0J3MgdHJpZ2dlciB0eXBlLCBzbwp0aGUgZHJpdmVy
IGNhbiB1c2UgdGhlIHJpZ2h0IGludGVycnVwdCBmbG93LgoKUmV2aWV3ZWQtYnk6IExhZCBQcmFi
aGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KU2lnbmVkLW9m
Zi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9sbGFuZC5vcmc+Ci0tLQoKQ2hhbmdlcyBp
biB2MzoKIC0gUmViYXNlZCBvbiB0b3Agb2YgdGhlIFJaL0ZpdmUgcGF0Y2hlcwoKIC4uLi9iaW5k
aW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1sICAgICAgIHwg
MyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNv
bnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1sCmlu
ZGV4IGNkMmI4YmNhZWMzYi4uOTJlMGY4YzNlZmYyIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4w
LjAueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0
LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbApAQCAtMzMsNyArMzMsNyBAQCBkZXNj
cmlwdGlvbjoKICAgaXQgaXMgbm90IGluY2x1ZGVkIGluIHRoZSBpbnRlcnJ1cHQgc3BlY2lmaWVy
LiBJbiB0aGUgc2Vjb25kIGNhc2UsIHNvZnR3YXJlCiAgIG5lZWRzIHRvIGtub3cgdGhlIHRyaWdn
ZXIgdHlwZSwgc28gaXQgY2FuIHJlb3JkZXIgdGhlIGludGVycnVwdCBmbG93IHRvIGF2b2lkCiAg
IG1pc3NpbmcgaW50ZXJydXB0cy4gVGhpcyBzcGVjaWFsIGhhbmRsaW5nIGlzIG5lZWRlZCBieSBh
dCBsZWFzdCB0aGUgUmVuZXNhcwotICBSWi9GaXZlIFNvQyAoQVg0NU1QIEFuZGVzQ29yZSB3aXRo
IGEgTkNFUExJQzEwMCkuCisgIFJaL0ZpdmUgU29DIChBWDQ1TVAgQW5kZXNDb3JlIHdpdGggYSBO
Q0VQTElDMTAwKSBhbmQgdGhlIFQtSEVBRCBDOTAwIFBMSUMuCiAKICAgV2hpbGUgdGhlIFJJU0Mt
ViBJU0EgZG9lc24ndCBzcGVjaWZ5IGEgbWVtb3J5IGxheW91dCBmb3IgdGhlIFBMSUMsIHRoZQog
ICAic2lmaXZlLHBsaWMtMS4wLjAiIGRldmljZSBpcyBhIGNvbmNyZXRlIGltcGxlbWVudGF0aW9u
IG9mIHRoZSBQTElDIHRoYXQKQEAgLTExMiw2ICsxMTIsNyBAQCBhbGxPZjoKICAgICAgICAgICBj
b250YWluczoKICAgICAgICAgICAgIGVudW06CiAgICAgICAgICAgICAgIC0gYW5kZXN0ZWNoLG5j
ZXBsaWMxMDAKKyAgICAgICAgICAgICAgLSB0aGVhZCxjOTAwLXBsaWMKIAogICAgIHRoZW46CiAg
ICAgICBwcm9wZXJ0aWVzOgotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
