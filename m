Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F97C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jun 2022 17:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xaeN09wgZASCpL7aUmBTQV7H3Y5IDyNXKMXOYO2F7FA=; b=x+8sTJ74tW4PMg
	WTy2M9YMEZeyz5rL+SZNslydYmSckit7FKxNXMd8O0WC4vIcveI0a8ozu+gvkQjnmY2zOgP7gIzPG
	i+eUkXQQETvaYt+xGvrHPiN4R7yt+53bFuAwdcVSfSeFlieTawvzm5m/rMVEfirQjpBaibWrgpcdX
	2F72h+f9CF8jfBsh6Ox0Bjrp2QwGvHFdlZ8aLV/wQmYuJh/ckEJf/8quqBwRbEl6BxU4gLBB5HpVE
	sKJROHsmjBR14rtw4qTrtxnufciltt5Y5kRgy1OHSXbs3+LGDc0iRud5zQgWeX1Ve0HOEkXtxfFgz
	lqOhvSl/vHG2G5wSIlgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2yai-00EoEL-Fk; Sun, 19 Jun 2022 17:20:04 +0000
Received: from smtp01.smtpout.orange.fr ([80.12.242.123] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2yag-00EoD7-FR
	for linux-riscv@lists.infradead.org; Sun, 19 Jun 2022 17:20:03 +0000
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id 2yabog1Yxk3IC2yaboxGxL; Sun, 19 Jun 2022 19:19:59 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 19 Jun 2022 19:19:59 +0200
X-ME-IP: 90.11.190.129
Message-ID: <19bcf5cb-e291-2c18-b006-f4e9e7adac92@wanadoo.fr>
Date: Sun, 19 Jun 2022 19:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC 3/6] clk: microchip: mpfs: add reset controller
Content-Language: fr
To: Conor Dooley <mail@conchuod.ie>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220619164935.1492823-1-mail@conchuod.ie>
 <20220619164935.1492823-4-mail@conchuod.ie>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220619164935.1492823-4-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_102002_695487_0702BAE3 
X-CRM114-Status: GOOD (  12.50  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

TGUgMTkvMDYvMjAyMiDDoCAxODo0OSwgQ29ub3IgRG9vbGV5IGEgw6ljcml0wqA6Cj4gRnJvbTog
Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAKPiBBZGQgYSByZXNl
dCBjb250cm9sbGVyIHRvIFBvbGFyRmlyZSBTb0MncyBjbG9jayBkcml2ZXIuIFRoaXMgcmVzZXQK
PiBjb250cm9sbGVyIGlzIHJlZ2lzdGVyZWQgYXMgYW4gYXV4IGRldmljZSBhbmQgcmVhZC93cml0
ZSBmdW5jdGlvbnMKPiBleHBvcnRlZCB0byB0aGUgZHJpdmVycyBuYW1lc3BhY2Ugc28gdGhhdCB0
aGUgcmVzZXQgY29udHJvbGxlciBjYW4KPiBhY2Nlc3MgdGhlIHBlcmlwaGVyYWwgZGV2aWNlIHJl
c2V0IHJlZ2lzdGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+CgpbLi4uXQoKPiArc3RhdGljIHZvaWQgbXBmc19yZXNldF9hZGV2
X3JlbGVhc2Uoc3RydWN0IGRldmljZSAqZGV2KQo+ICt7Cj4gKwlzdHJ1Y3QgYXV4aWxpYXJ5X2Rl
dmljZSAqYWRldiA9IHRvX2F1eGlsaWFyeV9kZXYoZGV2KTsKPiArCj4gKwlhdXhpbGlhcnlfZGV2
aWNlX3VuaW5pdChhZGV2KTsKPiArCj4gKwlrZnJlZShhZGV2LT5uYW1lKTsKCj8KCkJlbG93IHdl
IGhhdmU6CglhZGV2LT5uYW1lID0gInJlc2V0LW1wZnMiOwoKCj4gKwlrZnJlZShhZGV2KTsKPiAr
fQo+ICsKPiArc3RhdGljIHN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlICptcGZzX3Jlc2V0X2FkZXZf
YWxsb2Moc3RydWN0IG1wZnNfY2xvY2tfZGF0YSAqY2xrX2RhdGEpCj4gK3sKPiArCXN0cnVjdCBh
dXhpbGlhcnlfZGV2aWNlICphZGV2Owo+ICsJaW50IHJldDsKPiArCj4gKwlhZGV2ID0ga3phbGxv
YyhzaXplb2YoKmFkZXYpLCBHRlBfS0VSTkVMKTsKPiArCWlmICghYWRldikKPiArCQlyZXR1cm4g
RVJSX1BUUigtRU5PTUVNKTsKPiArCj4gKwlhZGV2LT5uYW1lID0gInJlc2V0LW1wZnMiOwo+ICsJ
YWRldi0+ZGV2LnBhcmVudCA9IGNsa19kYXRhLT5kZXY7Cj4gKwlhZGV2LT5kZXYucmVsZWFzZSA9
IG1wZnNfcmVzZXRfYWRldl9yZWxlYXNlOwo+ICsJYWRldi0+aWQgPSA2NjZ1Owo+ICsKPiArCXJl
dCA9IGF1eGlsaWFyeV9kZXZpY2VfaW5pdChhZGV2KTsKPiArCWlmIChyZXQpIHsKPiArCQlrZnJl
ZShhZGV2KTsKPiArCQlyZXR1cm4gRVJSX1BUUihyZXQpOwo+ICsJfQo+ICsKPiArCXJldHVybiBh
ZGV2Owo+ICt9CgpbLi4uXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
