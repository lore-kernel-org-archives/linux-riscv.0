Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E9CC88E72
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 23:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I07hqcg8CjgXRA7bZRXszdWueCAtAxzCLdEIt9bGMCY=; b=biN0LCaPs7IFp0
	WlDHqOeCwFigygKfkTd/15ZwSeJ6jpYyqCCC3WauEAvY4vvO47xS3wC7nzPmUVn1MTOcc7Z/tJl/d
	62lcrT7Adb0sEmFkUdBf7ea2VWpLVYf+84XPwOtHYAWR2ALehW/VDNklKvLogyQ9u6FkrvgBe1xMx
	YQoOETY8FK+dF5mCGvnj05uBPXdZ9WKA33EcrPNglh2HjNOMLnoaJ3jSzyWU9O4lwZaIBJBVphD5z
	x41zmGe75PONo0pndj9oHXLLSAfCx1mefOZDEAzBIBsT4l61nZObpUfXa6Su6L6DSoHIAMfSo9Baz
	CBxhzuuMvHoKy/eT4Q3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Fuh-00000004qUn-2uyo;
	Mon, 14 Sep 2026 23:16:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6FuL-00000004q9c-0Ulu;
	Mon, 14 Sep 2026 23:16:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D4F6942A28;
	Mon, 14 Sep 2026 23:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586901F000FF;
	Mon, 14 Sep 2026 23:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789427776;
	bh=tIIjh/Uf6BNc6qFW23Fkd03LNzbGrXqGSgv6kpFBBBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z0MKwixYFejC9aXB2ou9gDyVgw+IXUfla6yha+G1h+pdjyd9O2GMLR6rfbmVCIqRh
	 qnCgaS96Y5zdrUGXyZHeCOvJUyELkRb+9fGwuS5j2u7zwvM0KNnIOldogKIDh75OXI
	 UU1X49g4kycw28XdTtqVEurHf9Wwkc//rViLO6ZtoDml0qlU8ptCINWW4hrt54jJG2
	 hAPr0WuTs5yk74shR3GBcrH+k1Xa8WmdEfWKZAyL5keV+wX4e0ljXisLoEP1cRbpgh
	 4LO1uDw+LaWAO/9Fcz1VWy59hEVIdQMtiu7jS8LG28h+tTb8lnAcVAxnFEOPTpkgHm
	 sgjmnSADR5CMg==
From: Jakub Kicinski <kuba@kernel.org>
To: bartosz.golaszewski@oss.qualcomm.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	vkoul@kernel.org,
	peppe.cavallaro@st.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	shawnguo@kernel.org,
	festevam@gmail.com,
	jan.petrous@oss.nxp.com,
	s32@nxp.com,
	mohd.anwar@oss.qualcomm.com,
	romain.gantois@bootlin.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mripard@kernel.org,
	christophe.roullier@foss.st.com,
	brgl@kernel.org,
	radu@rendec.net,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	dfustini@tenstorrent.com,
	linux-sunxi@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-mips@vger.kernel.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	bartosz.golaszewski@linaro.org
Subject: Re: [PATCH net-next v14 07/10] net: stmmac: qcom-ethqos: fix SGMII loopback not set on resume after speed change
Date: Mon, 14 Sep 2026 16:16:13 -0700
Message-ID: <20260914231614.704318-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-7-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-7-ec212b747a7d@oss.qualcomm.com>
MIME-Version: 1.0
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

VGhpcyBpcyBhbiBBSS1nZW5lcmF0ZWQgcmV2aWV3IG9mIHlvdXIgcGF0Y2guIFRoZSBodW1hbiBz
ZW5kaW5nIHRoaXMKZW1haWwgaGFzIGNvbnNpZGVyZWQgdGhlIEFJIHJldmlldyB2YWxpZCwgb3Ig
YXQgbGVhc3QgcGxhdXNpYmxlLgotLS0KbmV0OiBzdG1tYWM6IHFjb20tZXRocW9zOiBmaXggU0dN
SUkgbG9vcGJhY2sgbm90IHNldCBvbiByZXN1bWUgYWZ0ZXIgc3BlZWQgY2hhbmdlCgpUaGlzIGV4
dGVuZHMgdGhlIGd1YXJkIGluIHFjb21fZXRocW9zX3NldF9zZ21paV9sb29wYmFjaygpIHNvIHRo
YXQgdGhlIE1BQwp3cmFwcGVyIFRYLXRvLVJYIGxvb3BiYWNrIGlzIGFsc28gYXJtZWQgd2hlbiBl
dGhxb3MtPnBoeV9tb2RlIGhvbGRzClBIWV9JTlRFUkZBQ0VfTU9ERV9TR01JSSwgbm90IG9ubHkg
UEhZX0lOVEVSRkFDRV9NT0RFXzI1MDBCQVNFWC4gV2l0aG91dAp0aGUgbG9vcGJhY2ssIGR3bWFj
NF9kbWFfcmVzZXQoKSBwb2xscyBhbiBSWCBjbG9jayB0aGF0IG5ldmVyIHRvZ2dsZXMgYW5kCnRp
bWVzIG91dC4KCk5vIExpbms6IHRhZ3Mgd2VyZSBwcmVzZW50IGluIHRoZSBjb21taXQgaGVhZGVy
LgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdt
YWMtcWNvbS1ldGhxb3MuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3
bWFjLXFjb20tZXRocW9zLmMKPiBpbmRleCBmZDc0MTRhNTBlYjRlLi5lMDY3Y2VlZTAxNjIxIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFj
b20tZXRocW9zLmMKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9k
d21hYy1xY29tLWV0aHFvcy5jCj4gQEAgLTE5MCw3ICsxOTAsOCBAQCBzdGF0aWMgdm9pZAo+ICBx
Y29tX2V0aHFvc19zZXRfc2dtaWlfbG9vcGJhY2soc3RydWN0IHFjb21fZXRocW9zICpldGhxb3Ms
IGJvb2wgZW5hYmxlKQo+ICB7Cj4gIAlpZiAoIWV0aHFvcy0+bmVlZHNfc2dtaWlfbG9vcGJhY2sg
fHwKPiAtCSAgICBldGhxb3MtPnBoeV9tb2RlICE9IFBIWV9JTlRFUkZBQ0VfTU9ERV8yNTAwQkFT
RVgpCj4gKwkgICAgKGV0aHFvcy0+cGh5X21vZGUgIT0gUEhZX0lOVEVSRkFDRV9NT0RFXzI1MDBC
QVNFWCAmJgo+ICsJICAgICBldGhxb3MtPnBoeV9tb2RlICE9IFBIWV9JTlRFUkZBQ0VfTU9ERV9T
R01JSSkpCj4gIAkJcmV0dXJuOwoKW1NldmVyaXR5OiBNZWRpdW1dClNob3VsZCB0aGlzIGh1bmsg
YmUgc3F1YXNoZWQgaW50byB0aGUgcHJlY2VkaW5nIHBhdGNoIG9mIHRoZSBzZXJpZXMsIG9yIGF0
CmxlYXN0IGNhcnJ5IGEgRml4ZXM6IHRhZyBuYW1pbmcgaXQ/CgpUaGUgY29tbWl0IG1lc3NhZ2Ug
c2F5cyAibWFjX2ZpbmlzaCgpIG5vdyB1cGRhdGVzIHBoeV9tb2RlIHRvIHRoZQpydW50aW1lLXJl
c29sdmVkIGludGVyZmFjZSIsIHdoaWNoIGlzIHRoZSBjaGFuZ2UgbWFkZSBvbmUgcGF0Y2ggZWFy
bGllciBpbgp0aGlzIHNhbWUgc2VyaWVzOgoKICBmNDBlNzJkNTdiY2IzOCAoIm5ldDogc3RtbWFj
OiBxY29tLWV0aHFvczogdXBkYXRlIHBoeV9tb2RlIHRvIHRoZQogIHJlc29sdmVkIGludGVyZmFj
ZSBpbiBtYWNfZmluaXNoKCkiKQoKZ2l0IGJsYW1lIGF0IHRoaXMgY29tbWl0IHNob3dzIHRoZSBh
c3NpZ25tZW50IGluIGV0aHFvc19tYWNfZmluaXNoX3NlcmRlcygpOgoKCWV0aHFvcy0+cGh5X21v
ZGUgPSBpbnRlcmZhY2U7CgpjYW1lIGZyb20gZjQwZTcyZDU3YmNiMzguIEJlZm9yZSB0aGF0LCBl
dGhxb3MtPnBoeV9tb2RlIHdhcyB3cml0dGVuIG9ubHkKb25jZSwgaW4gcWNvbV9ldGhxb3NfcHJv
YmUoKSBmcm9tIHRoZSBEVCBwaHktbW9kZSBwcm9wZXJ0eSwgc28gdGhlCjI1MDBCQVNFWC1vbmx5
IGd1YXJkIGNvdWxkIG5vdCBnbyBzdGFsZSBhdCBydW50aW1lIGFuZCB0aGUgRE1BIHJlc2V0CnRp
bWVvdXQgZGVzY3JpYmVkIGhlcmUgZGlkIG5vdCBleGlzdC4KCkRvZXMgdGhhdCBsZWF2ZSBmNDBl
NzJkNTdiY2IzOCBicm9rZW4gb24gaXRzIG93biwgZS5nLiBhcyBhIGJpc2VjdCBwb2ludCBvcgph
IHN0YWJsZSBiYWNrcG9ydD8gT24gYSBuZWVkc19zZ21paV9sb29wYmFjayBwbGF0Zm9ybSAoZW1h
Y192NF8wXzBfZGF0YSkKd2l0aCBEVCBwaHktbW9kZSAiMjUwMGJhc2UteCIgd2hvc2UgbGluayBy
ZXNvbHZlcyB0byAxRyBTR01JSToKCiAgZXRocW9zX21hY19maW5pc2hfc2VyZGVzKCkgICAgICAt
PiBldGhxb3MtPnBoeV9tb2RlID0gUEhZX0lOVEVSRkFDRV9NT0RFX1NHTUlJCiAgc3VzcGVuZCAv
IGlmZG93bgogIHJlc3VtZSAvIGlmdXAKICBldGhxb3NfY2xrc19jb25maWcoZXRocW9zLCB0cnVl
KQogICAgcWNvbV9ldGhxb3Nfc2V0X3NnbWlpX2xvb3BiYWNrKGV0aHFvcywgdHJ1ZSkKICAgICAg
aWYgKC4uLiBldGhxb3MtPnBoeV9tb2RlICE9IFBIWV9JTlRFUkZBQ0VfTU9ERV8yNTAwQkFTRVgp
CiAgICAgICAgICAgICAgcmV0dXJuOyAgICAgICAgICAgICAgICAgLyogbG9vcGJhY2sgbmV2ZXIg
ZW5hYmxlZCAqLwogIGR3bWFjNF9kbWFfcmVzZXQoKSAgICAgICAgICAgICAgICAgIC8qIHBvbGxz
IGEgbm9uLXRvZ2dsaW5nIGNsb2NrLCB0aW1lcyBvdXQgKi8KCkFsc28sIHRoZSBzdWJqZWN0IGxp
bmUgcmVhZHMgYXMgYSBzdGFuZGFsb25lIGZpeCBmb3IgYSBwcmUtZXhpc3RpbmcKcHJvYmxlbSwg
d2hpY2ggaGlkZXMgdGhlIGRlcGVuZGVuY3kgb24gdGhlIHByZXZpb3VzIHBhdGNoLiBXb3VsZCBl
aXRoZXIKc3F1YXNoaW5nIHRoZSBndWFyZCBjaGFuZ2UgaW50byBmNDBlNzJkNTdiY2IzOCwgb3Ig
YWRkaW5nCgogIEZpeGVzOiBmNDBlNzJkNTdiY2IzOCAoIm5ldDogc3RtbWFjOiBxY29tLWV0aHFv
czogdXBkYXRlIHBoeV9tb2RlIHRvIHRoZSByZXNvbHZlZCBpbnRlcmZhY2UgaW4gbWFjX2Zpbmlz
aCgpIikKCm1ha2UgdGhlIG9yZGVyaW5nIHJlcXVpcmVtZW50IGV4cGxpY2l0PwoKT25lIG1vcmUg
bm90ZSBvbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd29yZGluZzogdGhlIHNlY29uZCBwYXJhZ3JhcGgg
cmVhZHMKInFjb21fZXRocW9zX3NldF9zZ21paV9sb29wYmFjaygpIGdhdGVzIHRoaXMgb24gcGh5
X21vZGUgYmVpbmcgMjUwMEJBU0VYLgptYWNfZmluaXNoKCkgbm93IHVwZGF0ZXMgcGh5X21vZGUg
dG8gdGhlIHJ1bnRpbWUtcmVzb2x2ZWQgaW50ZXJmYWNlLCBhbnkKc3Vic2VxdWVudCByZXN1bWUg
d2l0aCBhIDFHIFNHTUlJIGxpbmsgc2tpcHMgdGhlIGxvb3BiYWNrIHNldHVwIiDigJQgdGhlCnNl
bnRlbmNlIGpvaW5pbmcgaXMgbWlzc2luZyBhIGNvbm5lY3RvciBzdWNoIGFzICJzbyB0aGF0IiBv
ciAiYW5kIHNpbmNlIiwKd2hpY2ggbWFrZXMgdGhlIGNhdXNhbCByZWxhdGlvbnNoaXAgaGFyZCB0
byBmb2xsb3cuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
