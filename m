Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9248BC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 23:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBbHFYnBnFiTlbESUwmR33d6nM9ytjiIhNP4qWI+d/s=; b=CLdTfnGRYIYiVK
	A/JxUoUS67jyTgr9qMqYvbVkHL7xjqE+8939eMXR1uEiIx3QSTEgOEPev0M+w3UItzB9uPzl4HU58
	V79X9PjGaf5TjskVgnxHmzwNVOr8f4or74wFuPDHdqmxFVL0B5CKa2p3OEMDEwf16G3BJbuAhm4CC
	Ja30x0Ho4942MaDqGveqJpU7g3eUarlPLLr13Ua292FlwQ+sZiFMdvz1BYm40q77MdEIB2tLMSBRX
	sjBolW//Db+DNcKcBB+HyzzthmW0LFkXbtNCyP9HhY3a24LDG0gp/whthl0JCyaDZCDyV0Hw7L9G5
	TgcbBLxiqTPASVx+b8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBl8n-00BPMo-MV; Sat, 31 Dec 2022 23:19:49 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBl3l-00BNCj-Dh; Sat, 31 Dec 2022 23:14:39 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id C45FE5C00AF;
	Sat, 31 Dec 2022 18:14:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 31 Dec 2022 18:14:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672528476; x=
	1672614876; bh=gj3YwYb/ee2y+650wDSXXGGyk6dcEiCvb/zuXgo5cOk=; b=u
	NXjnlg9bd7th2Y70EJg23Yf/PzAnzeehqcU8N8cjWsniKEWF3j0erT7ilFJh2Y3M
	wVDUO3gJcz8wuicKAkeZK5V1J6cT7uxHsIJxI6RRkXG2nDwdKjSGBzlWB+RJm/zL
	GmiJSwjKZxjdGX75CwAAMN9MkPlFMsGypSw/vQIqkZ98yg/FwsJgFLdNXGrDdRuD
	0apCD2hB4e/qetG3PxjizPjSqtRP7k6pT1vWGtuVFgNZdPwrYUTOP7ohISKhqQPw
	m9tSXAZrimW36x2Xd99QtOHkpQR02JN6dJc2ADhYc7nnKKmtB1Od1jjfZyfkRoLF
	XuGaLp10LYGonzytc9GQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672528476; x=
	1672614876; bh=gj3YwYb/ee2y+650wDSXXGGyk6dcEiCvb/zuXgo5cOk=; b=h
	/hFhsVAlmBzPmp5Xg1CHBYrTX0IE2xrY0CEWj3t3BnyjbsGhyDJNYDcrob+YSSo3
	Z5khLEdvfRkL8Dczy88qvjucrmIS/tXk147RyEfC4aMs9ndQwbRki8hxH07S0A2L
	itHZOUyy8M9US2beCqelxD59mHfgXDgM6jn8eMGBHBDzuCtX2NGS9Tr9np94Dz3b
	esjlsfaiY60bvKc+pYexElNwzWbQ7SZgUI/3ywL6lePWLa8+TCCad2AMeh79TSCy
	0LYrBVe6s4YhE2aALZ9kfnoSXCIVkL5hCJ/surhDltbMY7eRAYnclTubnIhe0e9b
	pv7X02SUPV6tR3BiAtOxg==
X-ME-Sender: <xms:XMKwY7TXenYutuZu09XLhaBXRqiSBy0LC3_CGgEqZFzfJW8bpGDNZA>
    <xme:XMKwY8yr_wkag7oakk6ZZo6-4D6Bb0YVUYTRsbmVAblsz_8hVsXrLcurwqKuqVd1Q
    ChpXkhaApxsAwoy8A>
X-ME-Received: <xmr:XMKwYw3GpTW5XD6D6m-6q_y7rjBqfV2XiZ3d_UKKGu0mfiqPDC-EaFKKpo0eMJIzivj89H0hI0tTtsGlzvWOdTUCZANoU_LoAizbi-W4hUOF8_QAk6hLKoHlhey9yUDc-2Jzdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieelgddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepfeeuveeufeefleehlefhleeglefggfeikeffveetfeevjeeuieet
    uefgfeeiheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:XMKwY7BtZOZ8OgfjlorT-gbC-1PC_xI3wUtAmxrITbennHFRRxXeFw>
    <xmx:XMKwY0iY0k21qcFw_oXzSDCUUInsHZ4q57U9P_ZllYhyi3s9PxUzJQ>
    <xmx:XMKwY_oiwqqe7OA5TeCAARdnxXWzGhE8VBUAEXllsJ5bWLNNXs5t1Q>
    <xmx:XMKwY3VxGuOo34bMtN3UU4CcuC_DPJUOhHImhPjqJZYX85nYpL0m6Q>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 18:14:35 -0500 (EST)
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
	linux-sunxi@lists.linux.dev,
	=?UTF-8?q?Andr=C3=A1s=20Szemz=C5=91?= <szemzo.andras@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 4/6] clk: sunxi-ng: d1: Mark cpux clock as critical
Date: Sat, 31 Dec 2022 17:14:27 -0600
Message-Id: <20221231231429.18357-5-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231231429.18357-1-samuel@sholland.org>
References: <20221231231429.18357-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_151437_593915_DD7D16CE 
X-CRM114-Status: GOOD (  12.59  )
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

RnJvbTogQW5kcsOhcyBTemVtesWRIDxzemVtem8uYW5kcmFzQGdtYWlsLmNvbT4KClNvbWUgU29D
cyBpbiB0aGUgRDEgZmFtaWx5IGZlYXR1cmUgQVJNIENQVXMgaW5zdGVhZCBvZiBhIFJJU0MtViBD
UFUuCkluIHRoYXQgY2FzZSwgdGhlIENQVXMgYXJlIGRyaXZlbiBmcm9tIHRoZSAnY3B1eCcgY2xv
Y2ssIHNvIGl0IG5lZWRzCnRvIGJlIG1hcmtlZCBhcyBjcml0aWNhbCwgc2luY2UgdGhlcmUgaXMg
bm8gY29uc3VtZXIgd2hlbiBEVkZTIGlzCmRpc2FibGVkLiBUaGlzIG1hdGNoZXMgdGhlIGRyaXZl
cnMgZm9yIG90aGVyIFNvQ3MsIGFuZCB0aGUgInJpc2N2IgpjbG9jayBpbiB0aGlzIGRyaXZlci4K
ClNpZ25lZC1vZmYtYnk6IEFuZHLDoXMgU3plbXrFkSA8c3plbXpvLmFuZHJhc0BnbWFpbC5jb20+
CkFja2VkLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgpSZXZp
ZXdlZC1ieTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGFybS5jb20+ClNpZ25lZC1v
ZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPgotLS0KCkNoYW5nZXMg
aW4gdjI6CiAtIEV4cGFuZCBjb21taXQgbWVzc2FnZQoKIGRyaXZlcnMvY2xrL3N1bnhpLW5nL2Nj
dS1zdW4yMGktZDEuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdS1zdW4yMGkt
ZDEuYyBiL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdS1zdW4yMGktZDEuYwppbmRleCA4ZWYzY2Rl
Yjc5NjIuLmM1YTdkZjkzNjAyYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9jbGsvc3VueGktbmcvY2N1
LXN1bjIwaS1kMS5jCisrKyBiL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdS1zdW4yMGktZDEuYwpA
QCAtMjQwLDcgKzI0MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRhIGNw
dXhfcGFyZW50c1tdID0gewogCXsgLmh3ID0gJnBsbF9wZXJpcGgwXzgwME1fY2xrLmNvbW1vbi5o
dyB9LAogfTsKIHN0YXRpYyBTVU5YSV9DQ1VfTVVYX0RBVEEoY3B1eF9jbGssICJjcHV4IiwgY3B1
eF9wYXJlbnRzLAotCQkJICAweDUwMCwgMjQsIDMsIENMS19TRVRfUkFURV9QQVJFTlQpOworCQkJ
ICAweDUwMCwgMjQsIDMsIENMS19TRVRfUkFURV9QQVJFTlQgfCBDTEtfSVNfQ1JJVElDQUwpOwog
CiBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19odyAqY3B1eF9od3NbXSA9IHsgJmNwdXhfY2xrLmNv
bW1vbi5odyB9Owogc3RhdGljIFNVTlhJX0NDVV9NX0hXUyhjcHV4X2F4aV9jbGssICJjcHV4LWF4
aSIsCi0tIAoyLjM3LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
