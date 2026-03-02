Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8DBD58E7B
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 08:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ed8CqNzkfohibIBr+WiDeyCYEE0mim2kbG2T1n7ZCR8=; b=G3j0EEBrIJVj9A
	gfLPKFmCV2+lMOG5OAGgRX7gqaKnBYp/0fZfoILLROGNh9wKGWhWYvXK9X23bf8drNtxtiFzOicMi
	tTRL3g8fn6WKxJGzxmsK7LGCVIasss8pOlpKnasCFaMgeDLLO8vsaDCWVCsnUWHQBuwjNApyB2YG+
	xLFQkfr52XwqzQVj3sErwL/BgNuKnzUwBUNRDm1qkVYzGR4WEnFipCzplyIqhwTv0yr2cVjXhY5Ap
	lVRaQwkSefvjVZNCgGf/q6ND6OIjB2NBYamY0ebJ8RVk+X+0Q+S/eq1SUzX8CUg9U7ne/6vdghe8b
	Jqpy9pQXj90iDJjlarPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwycS-0000000CW06-0yB2;
	Mon, 02 Mar 2026 08:27:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwycO-0000000CVzJ-2QMo
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 08:27:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CDF864E424D9;
	Mon,  2 Mar 2026 08:27:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CBC35FE89;
	Mon,  2 Mar 2026 08:27:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A012D103694FE;
	Mon,  2 Mar 2026 09:27:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772440022; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=piYK+ohE4FXRykqJ7bVz4XSAKhvZE7Spq+gUotHbweI=;
	b=WA0uayCjxXlgNNNFzZ4/Mw9MID4Eh7paEnNedaUShTOhNyZ/ZMJv47shjESHlQZqr+dwSd
	YrDtwaAYIxpPY01spYATUiyeK10ezei8/CpVOQxw3fvi29uZJbhRe98O75vaRGcrWftmoZ
	U5WFzY7rfjyDenPlQeoXxTbJytpJI9CBnOqGnxBmQ6LZHV6NpjvjMVy1Rmd0RCYbIj/nX/
	3vhHfPmJo+hRjfMC2pyy248EsEgGrt2a4LbKfW6AUol11eJBvH6l9I0KCxZKFCcGZK8mAi
	XhVZTla/F5LXFFDwgCriXV1Zw8qVXYV5Z7ebEq004vg2vkZreIcIBJN/zvetGQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,  Ron Economos <re@w6rz.net>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org,  wsa+renesas@sang-engineering.com
Subject: Re: spi: Regression with v7.0-rc1 on VisionFive 2
In-Reply-To: <20260228-defuse-extenuate-cf2a90ae66ea@spud> (Conor Dooley's
	message of "Sat, 28 Feb 2026 15:39:01 +0000")
References: <a3ca5e9b-7446-497e-8df2-7ef2b42a02e9@w6rz.net>
	<aaL2WVO_7bl6vNp5@sirena.co.uk>
	<20260228-ragweed-theater-b02967937353@spud>
	<20260228-defuse-extenuate-cf2a90ae66ea@spud>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 02 Mar 2026 09:27:00 +0100
Message-ID: <87seaiocvf.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_002709_121384_B98D9435 
X-CRM114-Status: UNSURE (   9.13  )
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

SGVsbG8sCgo+PiA+ID4gSSdtIGdldHRpbmcgYW4gU1BJIGZhaWx1cmUgd2l0aCBMaW51eCB2Ny4w
LXJjMSBvbiB0aGUgVmlzaW9uRml2ZSAyIFJJU0MtViBib2FyZC4KPj4gPiAKPj4gPiA+IEZlYiAy
OCAwMDoyOTozMyB2aXNpb25maXZlIGtlcm5lbDogY2FkZW5jZS1xc3BpIDEzMDEwMDAwLnNwaTog
UVNQSSBpcyBzdGlsbCBidXN5IGFmdGVyIDUwMG1zIHRpbWVvdXQuCj4+ID4gPiBGZWIgMjggMDA6
Mjk6MzMgdmlzaW9uZml2ZSBrZXJuZWw6IGNhZGVuY2UtcXNwaSAxMzAxMDAwMC5zcGk6IGRldGVj
dGVkIEZJRk8gZGVwdGggKDEpIGRpZmZlcmVudCBmcm9tIGNvbmZpZyAoMjU2KQo+PiA+ID4gRmVi
IDI4IDAwOjI5OjMzIHZpc2lvbmZpdmUga2VybmVsOiBjYWRlbmNlLXFzcGkgMTMwMTAwMDAuc3Bp
OiBRU1BJIGlzIHN0aWxsIGJ1c3kgYWZ0ZXIgNTAwbXMgdGltZW91dC4KPj4gPiA+IEZlYiAyOCAw
MDoyOTozMyB2aXNpb25maXZlIGtlcm5lbDogY2FkZW5jZS1xc3BpIDEzMDEwMDAwLnNwaTogUVNQ
SSBpcyBzdGlsbCBidXN5IGFmdGVyIDUwMG1zIHRpbWVvdXQuCj4+ID4gPiBGZWIgMjggMDA6Mjk6
MzMgdmlzaW9uZml2ZSBrZXJuZWw6IHNwaS1ub3Igc3BpMS4wOiBvcGVyYXRpb24gZmFpbGVkIHdp
dGggLTExMAo+PiA+ID4gRmViIDI4IDAwOjI5OjMzIHZpc2lvbmZpdmUga2VybmVsOiBzcGktbm9y
IHNwaTEuMDogcHJvYmUgd2l0aCBkcml2ZXIgc3BpLW5vciBmYWlsZWQgd2l0aCBlcnJvciAtMTEw
Cj4+ID4gCj4+ID4gRldJVyBjb25maXJtZWQgb24gbXkgc3lzdGVtOgo+PiA+IAo+PiA+ICAgIGh0
dHBzOi8vbGF2YS5zaXJlbmEub3JnLnVrL3NjaGVkdWxlci9qb2IvMjUwNDAyNiNMNzE1Cj4+ID4g
Cj4+ID4gKHdoaWNoIEkgZGlkbid0IG5vdGljZSBhcyB0aGF0IHdhcyBqdXN0IGJ1aWxkcm9vdCBh
bmQgbm90IHJ1bm5pbmcKPj4gPiBrc2VsZnRlc3QtZHQuLi4pLgo+PiAKPj4gVGhpcyBwcm9iYWJs
eSBjb25zdGl0dXRlcyByYW5kb20gc3BlY3VsYXRpb24sIGJ1dCBJIGFtIGN1cmlvdXMgaWYKPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLmR0c2kgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC5kdHNpCj4+IGluZGV4IDZlNTZlOWQy
MGJiMDYuLjM5MGZhODdlZGJhZjggMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c3RhcmZpdmUvamg3MTEwLmR0c2kKPj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2
ZS9qaDcxMTAuZHRzaQo+PiBAQCAtODczLDkgKzg3Myw5IEBAIHFzcGk6IHNwaUAxMzAxMDAwMCB7
Cj4+ICAJCQkgICAgICA8MHgwIDB4MjEwMDAwMDAgMHgwIDB4NDAwMDAwPjsKPj4gIAkJCWludGVy
cnVwdHMgPSA8MjU+Owo+PiAgCQkJY2xvY2tzID0gPCZzeXNjcmcgSkg3MTEwX1NZU0NMS19RU1BJ
X1JFRj4sCj4+IC0JCQkJIDwmc3lzY3JnIEpINzExMF9TWVNDTEtfUVNQSV9BSEI+LAo+PiAtCQkJ
CSA8JnN5c2NyZyBKSDcxMTBfU1lTQ0xLX1FTUElfQVBCPjsKPj4gLQkJCWNsb2NrLW5hbWVzID0g
InJlZiIsICJhaGIiLCAiYXBiIjsKPj4gKwkJCQkgPCZzeXNjcmcgSkg3MTEwX1NZU0NMS19RU1BJ
X0FQQj4sCj4+ICsJCQkJIDwmc3lzY3JnIEpINzExMF9TWVNDTEtfUVNQSV9BSEI+Owo+PiArCQkJ
Y2xvY2stbmFtZXMgPSAicmVmIiwgImFwYiIsICJhaGIiOwo+PiAgCQkJcmVzZXRzID0gPCZzeXNj
cmcgSkg3MTEwX1NZU1JTVF9RU1BJX0FQQj4sCj4+ICAJCQkJIDwmc3lzY3JnIEpINzExMF9TWVNS
U1RfUVNQSV9BSEI+LAo+PiAgCQkJCSA8JnN5c2NyZyBKSDcxMTBfU1lTUlNUX1FTUElfUkVGPjsK
Pj4gaGFzIGFueSBpbXBhY3QuIEdvaW5nIGZyb20gamg3MTEwIHNwZWNpZmljIGNvZGUgdG8gYnVs
ayBhcGlzIGlzIGFuCj4+IG9yZGVyaW5nIGNoYW5nZSwgcmlnaHQ/Cj4KPiBBY2NvcmRpbmcgdG8g
Um9uLCBpdCBoYWQgbm8gaW1wYWN0LgoKVGhhbmtzIGZvciB0aGUgcmVwb3J0LCBhbmQgdGhhbmtz
IGZvciB0aGUgdHJ5LiBMZXQgbWUgaGF2ZSBhIGxvb2suCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
