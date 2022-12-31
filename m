Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1336C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 23:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KfMkiKTqF6Bbvgknsaz6coUtre3Kf2C5taaxr9tyzr4=; b=B8hIp3g5OU8Xzj
	c3A44k+0IvBfUNkIcNjYqaM942gVogDOeEnBBblmwizcHZWstDBsvHV30anBnjk8vdHXE+Cc8kvNS
	L4WOoz4TlSYcIoBYdWlveBJvgEYeKmZ5TGV3llueBoi0SJNtHT5pTS90lSM3aMViZjunYPfOghKEV
	5rx1OBahOA8l4jUzJFny1eb/JyEkb61UlsAAIc2fBl2QYbse/uA+ISJk5mkfQBA2IrVj3ts1c8fmk
	kt9/ulZDbqEuk0z1GIMrZpJXstYy7nYNRUd2eR0fBK5X6d7JI4mCrylOoPh/NsD/XWMvBVvyZc6Lj
	PVdcw8Hm7VkbICOkDtOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBl5T-00BNt1-Up; Sat, 31 Dec 2022 23:16:24 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBl3j-00BN8a-NI; Sat, 31 Dec 2022 23:14:39 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 16F435C00B4;
	Sat, 31 Dec 2022 18:14:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 31 Dec 2022 18:14:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1672528471; x=1672614871; bh=CLyRJuU5Gp
	42q8xKUuOHFJyhAzWE0gbLmmfwQ+yR6RM=; b=sND/yvJN90kEWak4oJKkGgYl+6
	1M8k31rA6aBsLQzt+QO+WBqpol4njSNBAbgwX+Bbnk9vmIQLz1WC4iKBuPWfbukO
	rBI6YqV2OHJkUuxn8RL1AeG2RAAr3dnN/uuPK5GBMIDk18Ke95LjYx/lsCacDeGN
	PBvy0VmNoxw9jXzKiLCc7DkY4v/HScgTKtmRvyBm/TUZ8W7ioVPxHrxtuuQp450k
	xdcPIaBlILMioDmy2Y1mvRVO0LCZzlsLxYTcTeTkzYK1rhH872JLfgwaRh4H1JDk
	uthbRI2BUJAkAdAB8zrbqepaQSkfiD7b4SI8YNiFzO8aJ1Rp16UKy37HXmkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672528471; x=1672614871; bh=CLyRJuU5Gp42q
	8xKUuOHFJyhAzWE0gbLmmfwQ+yR6RM=; b=CwmaOVuDAxje46IPRtmGqnCNeVpij
	1V2xBgx6sadZZciNP5AZbCnCzjMutysvahJXOz7V2UKZG9m3g+U8hbVltJGBEofE
	e7Nj8omH2hVnwSL+YkN955ZusXxBu/LGoilUaJ4Rs0FPUra7T9+ko/KApoAkFsv4
	t9mi6wHBE92NsEa/8iR1oMgDp02x389nxcB02H+uwhyb/i1ok9uIZ2YW6ZYCWUHs
	p34b7b8awAOakqVW4cI6dRpykICCL4eC+77bmEvSmUMC5XXb9qGHxz9GJc1i9Hpp
	DyahcES8r8O7CyJcgM0ZWrGzfjFWxFPDZHWXIuNPFXxbS3a/PqllzolDg==
X-ME-Sender: <xms:VsKwY2CEebTacyCxkyiApgYo9TiwS0lkrTBl1wQ_ockyy56ACbqaaw>
    <xme:VsKwYwi5IZVw04wRjfrVRlZWhr_ADxfUlBWtz4uq26AXCXvOdLUh7W2iyVsRTGoNC
    fZQkHeX6XjSYh2TdA>
X-ME-Received: <xmr:VsKwY5lQWUYrXzDFIqWpNvs8cWkITLtrD24msoUFPHUFr8b8REHtPF_3VpPTa0vmCpkWCaOjkbdvivP6ElJ5oAmqi8FZrHR-MLIoC-pKFhfn_fSmJWcyIOPav6mJmuhLhRaY4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieelgddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepueevhfevkeeiffevieelhedtudelffevhefgudfgtdekheetfffflefh
    feetvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:VsKwY0wzYHJA_6CiHYEjdXdmc0JvA62iuwIygHOmRMhvRZwUVQ_Rcw>
    <xmx:VsKwY7TjX4_KrQ4PDQC_nMuBOas97R27aCH6qjZ_C88otSXULnZyFA>
    <xmx:VsKwY_ZHPrV2EGTgsJv6bKIaKZOqs70rViHY50ALDG6BZLBAOaVsmg>
    <xmx:V8KwY8iF5VSXS85weF33WvOoQMtovtaG02aPEMa7zuyJUNJy05_PPA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 18:14:29 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/6] clk: sunxi-ng: Allwinner R528/T113 clock support
Date: Sat, 31 Dec 2022 17:14:23 -0600
Message-Id: <20221231231429.18357-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_151436_541497_E4410AD9 
X-CRM114-Status: UNSURE (   9.97  )
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

UjUyOCBhbmQgVDExMyBhcmUgU29DcyBiYXNlZCBvbiB0aGUgc2FtZSBkZXNpZ24gYXMgRDEvRDFz
LCBidXQgd2l0aCBBUk0KQ1BVcyBpbnN0ZWFkIG9mIFJJU0MtVi4gVGhleSB1c2UgdGhlIHNhbWUg
Q0NVIGltcGxlbWVudGF0aW9uLCBtZWFuaW5nCnRoZSBDQ1UgaGFzIGdhdGVzL3Jlc2V0cyBmb3Ig
YWxsIHBlcmlwaGVyYWxzIHByZXNlbnQgb24gYW55IFNvQyBpbiB0aGlzCmZhbWlseS4gSSB2ZXJp
ZmllZCB0aGUgQ0FOIGJ1cyBiaXRzIGFyZSBhbHNvIHByZXNlbnQgb24gRDEvRDFzLgoKUGF0Y2hl
cyAxLTIgY2xlYW4gdXAgdGhlIEtjb25maWcgaW4gcHJlcGFyYXRpb24gZm9yIHBhdGNoIDMsIHdo
aWNoCmFsbG93cyBidWlsZGluZyB0aGUgZHJpdmVyLiBQYXRjaGVzIDQtNiBhZGQgdGhlIG1pc3Np
bmcgYmluZGluZyBoZWFkZXIKYW5kIGRyaXZlciBiaXRzLgoKQ2hhbmdlcyBpbiB2MjoKIC0gRXhw
YW5kIGNvbW1pdCBtZXNzYWdlCiAtIE1vdmUgZHQtYmluZGluZ3MgaGVhZGVyIGNoYW5nZXMgdG8g
YSBzZXBhcmF0ZSBwYXRjaAoKQW5kcsOhcyBTemVtesWRICgxKToKICBjbGs6IHN1bnhpLW5nOiBk
MTogTWFyayBjcHV4IGNsb2NrIGFzIGNyaXRpY2FsCgpGYWJpZW4gUG91c3NpbiAoMSk6CiAgY2xr
OiBzdW54aS1uZzogZDE6IEFkZCBDQU4gYnVzIGdhdGVzIGFuZCByZXNldHMKClNhbXVlbCBIb2xs
YW5kICg0KToKICBjbGs6IHN1bnhpLW5nOiBSZW1vdmUgZHVwbGljYXRlIEFSQ0hfU1VOWEkgZGVw
ZW5kZW5jaWVzCiAgY2xrOiBzdW54aS1uZzogTW92ZSBTb0MgZHJpdmVyIGNvbmRpdGlvbnMgdG8g
ZGVwZW5kZW5jaWVzCiAgY2xrOiBzdW54aS1uZzogZDE6IEFsbG93IGJ1aWxkaW5nIGZvciBSNTI4
L1QxMTMKICBkdC1iaW5kaW5nczogY2xvY2s6IEFkZCBEMSBDQU4gYnVzIGdhdGVzIGFuZCByZXNl
dHMKCiBkcml2ZXJzL2Nsay9zdW54aS1uZy9LY29uZmlnICAgICAgICAgICAgICB8IDcxICsrKysr
KysrKysrKy0tLS0tLS0tLS0tCiBkcml2ZXJzL2Nsay9zdW54aS1uZy9jY3Utc3VuMjBpLWQxLmMg
ICAgICB8IDEzICsrKystCiBkcml2ZXJzL2Nsay9zdW54aS1uZy9jY3Utc3VuMjBpLWQxLmggICAg
ICB8ICAyICstCiBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3N1bjIwaS1kMS1jY3UuaCB8ICAy
ICsKIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvc3VuMjBpLWQxLWNjdS5oIHwgIDIgKwogNSBm
aWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkKCi0tIAoyLjM3
LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
