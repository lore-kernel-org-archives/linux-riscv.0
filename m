Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B477C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 05:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9w0Gs33ha0mktzwiFQNEKc4sPmcBZLYdIAXsBW6rnJM=; b=Vg4jy1BO+VhXG2
	P15Xo88olmZioRxfcNSv/AwCwH+HGGzV7Jvefz0vyyG6knvMjecgDRfULdNEkZE0lYKqEK3EsXiYW
	WAUOrx6p8k2L4/6nN7uRIomepxMFGxZgqow0t2vdQOZJ/3S6FtQwCOK5nPkeYjhOmq9APgI/c8IFA
	y4+TWKD0Eo6SaxZT3aLVrV5dSyvkF91Ip4ZDxrfvoIIPe79uTO58HT2pH4LFIorWd+Hun7ENWPWck
	9hM15nhyLEKl1w8Jx7GWoJV3f2WExg63jVH89BCczJJxUpe4oIhkoJbnoPW5a0DCIrMczhDgA4k+J
	gKiSiUz5CfBFAGRHv2/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5hDK-00FjCH-BF; Mon, 27 Jun 2022 05:23:10 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5h3V-00FcWY-LU
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 05:13:04 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 005F65C019D;
	Mon, 27 Jun 2022 01:13:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 27 Jun 2022 01:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1656306780; x=
	1656393180; bh=6AYLrxKS1kGzYaCKlRypTFspscTKmPnJSs3erP6wz1w=; b=k
	dOF4mlRrncMvmxqTBXFJv0uZzvqiAuA+WGEzPTn1W4cS/eLTvrJDBvrEZZp2bSwZ
	u8/u7FBDthN7jNyokEAYT9XDrp57cBNVFkxbzELBBeVpTl4PKRfPYfZ9EWzrEvEL
	mNapWNuvdj65vengO3Q33z9Csoim9rZ6aUYx704JQrdrzeLc5j3/X9MJBwD30gOl
	OT2ZdySuFgrZag3Fum3cqIQn9DrkZq+1gt27KmR/m6kLAhRtJOEfCAwabJpC5+Y2
	jewJHdzY51M/RV1VykQ5FcXQ4+7H9mFxrN2Q7apOUOEKd3Y5GmtI6diXBfjG0NFw
	DGTU/YyVdMUZBHPvUadfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656306780; x=
	1656393180; bh=6AYLrxKS1kGzYaCKlRypTFspscTKmPnJSs3erP6wz1w=; b=E
	shgTd6PCY3pBsBTMsG1M4fmh046VCXqVhwm76Mn1oFAI53fiehbtRxEGH/xj4jYt
	Rq6Vmk1fh56mWkECA6TugPJBhiw3PhdDjUHnkmc/Cm4gNf8Y/QJII1XuFmYJ0aqu
	LUUSJ8feloAHkrGq7CcT82KL3D6QtvDmdTUn3r/EODHfQ8vsGfl0sJneLiqsk/Zb
	wc9Q53+dZpq2hcqlBA72o4jBWK4yvXNrEJUGcEqysqs+jmx47CIv3/Aa0BJ29EYw
	fz+aIJCmbX5bcqZLtZxJd45PiZ3s1JRDT1dFE0V9Wlu71zB9T0XDb/kGGe/QfQcu
	n0YFwQ+R+SYDG8WmW8xzg==
X-ME-Sender: <xms:XDy5YtH9pZjtNAbxdV8mzNlzyPlr9SoC1l0TGKm5nBiHiPe3z6YXGA>
    <xme:XDy5YiX0WKOg7d2xAURsJHyKVc4AB4n5PiuYGOLmzZbm4rZAlUPDfwaIvPejbWMxy
    fbxYmrobAhNNnVJHw>
X-ME-Received: <xmr:XDy5YvKJtZemoheUFT4GqId1D9TNB2iHUP1gH0Xm3pDj2zckJ8tr8uK1NYBWJbCVxUy7mnGERCwOWI9ZKvxiI6oiNBHfqIpnU_AEqmcdX9e4bmVc16cFX3_AUI8XOxVg7KprZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeggedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeefueevueeffeelheelhfelgeelgffgieekffevteefveejueei
    teeugfefieehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:XDy5YjGUNv6nFuvTlJww6T9FPCa7tspQXaKLIUtomJ0SPQYv1eBsoA>
    <xmx:XDy5YjXj0J0WGxBSFnpA3vK_3OVY5VRh_2qlm6r975-bvx8prT-dQQ>
    <xmx:XDy5YuP31Mll77E93ALVaCbQA1YXz9Xg--LM768PxgtEFDa5V-RpmA>
    <xmx:XDy5YnnirgDeDCNioq19GZoXn0Y0BRU7ntHSG0MkcYfYU6dbvmT1xg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jun 2022 01:13:00 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Marc Zyngier <maz@kernel.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Gleixner <tglx@linutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/3] dt-bindings: interrupt-controller: Require trigger type for T-HEAD PLIC
Date: Mon, 27 Jun 2022 00:12:55 -0500
Message-Id: <20220627051257.38543-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220627051257.38543-1-samuel@sholland.org>
References: <20220627051257.38543-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_221301_824225_6E719C0E 
X-CRM114-Status: GOOD (  16.07  )
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
aW5nIGludGVycnVwdHMuCgpGb3IgUExJQ3Mgd2l0aCB0aGF0IG1pc2ZlYXR1cmUsIHNvZnR3YXJl
IG5lZWRzIHRvIGtub3cgdGhlIHRyaWdnZXIgdHlwZQpvZiBlYWNoIGludGVycnVwdC4gVGhpcyBh
bGxvd3MgaXQgdG8gd29yayBhcm91bmQgdGhlIGlzc3VlIGJ5IGNvbXBsZXRpbmcKZWRnZS10cmln
Z2VyZWQgaW50ZXJydXB0cyBiZWZvcmUgaGFuZGxpbmcgdGhlbS4gU3VjaCBhIHdvcmthcm91bmQg
aXMKcmVxdWlyZWQgdG8gYXZvaWQgbWlzc2luZyBhbnkgZWRnZXMuCgpUaGUgVC1IRUFEIEM5eHgg
UExJQyBpcyBhbiBleGFtcGxlIG9mIGEgUExJQyB3aXRoIHRoaXMgYmVoYXZpb3IuCgpTaWduZWQt
b2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4KLS0tCgogLi4uL3Np
Zml2ZSxwbGljLTEuMC4wLnlhbWwgICAgICAgICAgICAgICAgICAgIHwgMzEgKysrKysrKysrKysr
KysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFt
bAppbmRleCAyNzA5MmM2YTg2YzQuLjNjNTg5Y2JjYTg1MSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGlj
LTEuMC4wLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVy
cnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwKQEAgLTI2LDkgKzI2LDEzIEBA
IGRlc2NyaXB0aW9uOgogICB3aXRoIHByaW9yaXR5IGJlbG93IHRoaXMgdGhyZXNob2xkIHdpbGwg
bm90IGNhdXNlIHRoZSBQTElDIHRvIHJhaXNlIGl0cwogICBpbnRlcnJ1cHQgbGluZSBsZWFkaW5n
IHRvIHRoZSBjb250ZXh0LgogCi0gIFdoaWxlIHRoZSBQTElDIHN1cHBvcnRzIGJvdGggZWRnZS10
cmlnZ2VyZWQgYW5kIGxldmVsLXRyaWdnZXJlZCBpbnRlcnJ1cHRzLAotICBpbnRlcnJ1cHQgaGFu
ZGxlcnMgYXJlIG9ibGl2aW91cyB0byB0aGlzIGRpc3RpbmN0aW9uIGFuZCB0aGVyZWZvcmUgaXQg
aXMgbm90Ci0gIHNwZWNpZmllZCBpbiB0aGUgUExJQyBkZXZpY2UtdHJlZSBiaW5kaW5nLgorICBU
aGUgUExJQyBzdXBwb3J0cyBib3RoIGVkZ2UtdHJpZ2dlcmVkIGFuZCBsZXZlbC10cmlnZ2VyZWQg
aW50ZXJydXB0cy4gRm9yCisgIGVkZ2UtdHJpZ2dlcmVkIGludGVycnVwdHMsIHRoZSBSSVNDLVYg
UExJQyBzcGVjIGFsbG93cyB0d28gcmVzcG9uc2VzIHRvIGVkZ2VzCisgIHNlZW4gd2hpbGUgYW4g
aW50ZXJydXB0IGhhbmRsZXIgaXMgYWN0aXZlOyB0aGUgUExJQyBtYXkgZWl0aGVyIHF1ZXVlIHRo
ZW0gb3IKKyAgaWdub3JlIHRoZW0uIEluIHRoZSBmaXJzdCBjYXNlLCBoYW5kbGVycyBhcmUgb2Js
aXZpb3VzIHRvIHRoZSB0cmlnZ2VyIHR5cGUsIHNvCisgIGl0IGlzIG5vdCBpbmNsdWRlZCBpbiB0
aGUgaW50ZXJydXB0IHNwZWNpZmllci4gSW4gdGhlIHNlY29uZCBjYXNlLCBzb2Z0d2FyZQorICBu
ZWVkcyB0byBrbm93IHRoZSB0cmlnZ2VyIHR5cGUsIHNvIGl0IGNhbiByZW9yZGVyIHRoZSBpbnRl
cnJ1cHQgZmxvdyB0byBhdm9pZAorICBtaXNzaW5nIGludGVycnVwdHMuCiAKICAgV2hpbGUgdGhl
IFJJU0MtViBJU0EgZG9lc24ndCBzcGVjaWZ5IGEgbWVtb3J5IGxheW91dCBmb3IgdGhlIFBMSUMs
IHRoZQogICAic2lmaXZlLHBsaWMtMS4wLjAiIGRldmljZSBpcyBhIGNvbmNyZXRlIGltcGxlbWVu
dGF0aW9uIG9mIHRoZSBQTElDIHRoYXQKQEAgLTY1LDcgKzY5LDggQEAgcHJvcGVydGllczoKICAg
ICBjb25zdDogMAogCiAgICcjaW50ZXJydXB0LWNlbGxzJzoKLSAgICBjb25zdDogMQorICAgIG1p
bmltdW06IDEKKyAgICBtYXhpbXVtOiAyCiAKICAgaW50ZXJydXB0LWNvbnRyb2xsZXI6IHRydWUK
IApAQCAtOTEsNiArOTYsMjQgQEAgcmVxdWlyZWQ6CiAgIC0gaW50ZXJydXB0cy1leHRlbmRlZAog
ICAtIHJpc2N2LG5kZXYKIAorYWxsT2Y6CisgIC0gaWY6CisgICAgICBwcm9wZXJ0aWVzOgorICAg
ICAgICBjb21wYXRpYmxlOgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgZW51bToK
KyAgICAgICAgICAgICAgLSB0aGVhZCxjOTAwLXBsaWMKKworICAgIHRoZW46CisgICAgICBwcm9w
ZXJ0aWVzOgorICAgICAgICAnI2ludGVycnVwdC1jZWxscyc6CisgICAgICAgICAgY29uc3Q6IDIK
KworICAgIGVsc2U6CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICAnI2ludGVycnVwdC1jZWxs
cyc6CisgICAgICAgICAgY29uc3Q6IDEKKwogYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCiAK
IGV4YW1wbGVzOgotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
