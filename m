Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D70C7EE30
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 19:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/o00GNgeHryjKa8POqfnfJI6p85YnzbCP9t1KfT52k=; b=sqEbdfde6L+ctf
	9DvhBAVsu86EZxMs/btKZg9kmQ97V7+EhS5sgR39964VGIjAv6m6C/xn9IkrjAcm2aOkX6d9XWRLg
	ToVgGJ333kQ2hwr2v0wNU5RcabitNjV9EBjvHUSZPQreR+7xAUOWElCh7vr7mSMqI8DRLJ64bYN/Z
	M1vnQyOrs0PMajVlaqPPRwhUCg69xl+IUSpKTX8t36SBIAPiAJ8bO/tYuiIpGMVkqEQaZ33lCTpTy
	r26yCRlPsdJlBmBN69yGlFRsZQrqFeJk44HXq+J+zheWwOrlistfHo3wSZHbi3TwXRo1RwrIytf5i
	OZIdsTsmcua/cTWpqcww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgDc-00000006PPv-0xHm;
	Tue, 01 Jul 2025 19:00:36 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeCt-000000067BL-2IMV
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 16:51:44 +0000
Message-ID: <31c2154b-0dc2-4d5d-a10b-803e459755e8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751388700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMEWrmV13hU5wNv9/YPiVk6dF9W0HhiA72VWSabwD9E=;
	b=GZ81VnWHz5lUEtQrFYxLovydqUcBu+AYV2Hez8GFoftT8ekfk4TH59Gr2ZydlK0N8eR+MR
	PIkDHF/pJHfNm0h7hHiNLgd5aX9NtjxIC/FxNj6YULbvsWxgLQnlSlTYVVAEKeVu+nDdnT
	6YnYd8Br6FUm4YpTDAz8XbJZ5sHGnw8=
Date: Tue, 1 Jul 2025 12:51:34 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 14/18] net: macb: add no LSO capability
 (MACB_CAPS_NO_LSO)
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Harini Katakam <harini.katakam@xilinx.com>,
 Rafal Ozieblo <rafalo@cadence.com>,
 Haavard Skinnemoen <hskinnemoen@atmel.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Andrew Lunn <andrew@lunn.ch>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-14-ff8207d0bb77@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250627-macb-v2-14-ff8207d0bb77@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095143_727357_DC0B7138 
X-CRM114-Status: GOOD (  16.87  )
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

T24gNi8yNy8yNSAwNTowOSwgVGjDqW8gTGVicnVuIHdyb3RlOgo+IExTTyBpcyBydW50aW1lLWRl
dGVjdGVkIHVzaW5nIHRoZSBQQlVGX0xTTyBmaWVsZCBpbnNpZGUgcmVnaXN0ZXIKPiBkZXNpZ25j
ZmdfZGVidWc2L0dFTV9EQ0ZHNi4gQWxsb3cgZGlzYWJsaW5nIHRoYXQgZmVhdHVyZSBpZiBpdCBp
cwo+IGJyb2tlbiBieSB1c2luZyBzdHJ1Y3QgbWFjYl9jb25maWctPmNhcHMuCj4gCj4gUmV2aWV3
ZWQtYnk6IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4KPiBTaWduZWQtb2ZmLWJ5OiBUaMOp
byBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBkcml2ZXJzL25ldC9l
dGhlcm5ldC9jYWRlbmNlL21hY2IuaCAgICAgIHwgMSArCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0
L2NhZGVuY2UvbWFjYl9tYWluLmMgfCA2ICsrKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvY2FkZW5jZS9tYWNiLmggYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21h
Y2IuaAo+IGluZGV4IGQ0MmM4MWNmNDQxY2U0MzVjYWQzOGUyZGZkNzc5YjBlNmExNDFiZjMuLmU1
ZGU2NTQ5ODYxOTY1ZTI4MjMwNDRkODFiNmFiYzIwZDJiMjdjZWIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiLmgKPiArKysgYi9kcml2ZXJzL25ldC9ldGhl
cm5ldC9jYWRlbmNlL21hY2IuaAo+IEBAIC03MzYsNiArNzM2LDcgQEAKPiAgI2RlZmluZSBNQUNC
X0NBUFNfTkVFRF9UU1VDTEsJCQlCSVQoMTApCj4gICNkZWZpbmUgTUFDQl9DQVBTX1FVRVVFX0RJ
U0FCTEUJCQlCSVQoMTEpCj4gICNkZWZpbmUgTUFDQl9DQVBTX1JTQ19DQVBBQkxFCQkJQklUKDEy
KQo+ICsjZGVmaW5lIE1BQ0JfQ0FQU19OT19MU08JCQlCSVQoMTMpCj4gICNkZWZpbmUgTUFDQl9D
QVBTX1BDUwkJCQlCSVQoMjQpCj4gICNkZWZpbmUgTUFDQl9DQVBTX0hJR0hfU1BFRUQJCQlCSVQo
MjUpCj4gICNkZWZpbmUgTUFDQl9DQVBTX0NMS19IV19DSEcJCQlCSVQoMjYpCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMgYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCj4gaW5kZXggMzQyMjNkYWQyZDAxYWU0YmNl
ZmMwODIzYzg2OGE2N2Y1OTQzNTYzOC4uZjlhM2E1Y2FlYmNhZmUzZDkxOTdhM2JjNzY4MWI2NDcz
NGQ3YWM5MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2Jf
bWFpbi5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwo+
IEBAIC00MzQ2LDggKzQzNDYsMTAgQEAgc3RhdGljIGludCBtYWNiX2luaXQoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgCS8qIFNldCBmZWF0dXJlcyAqLwo+ICAJZGV2LT5od19mZWF0
dXJlcyA9IE5FVElGX0ZfU0c7Cj4gIAo+IC0JLyogQ2hlY2sgTFNPIGNhcGFiaWxpdHkgKi8KPiAt
CWlmIChHRU1fQkZFWFQoUEJVRl9MU08sIGdlbV9yZWFkbChicCwgRENGRzYpKSkKPiArCS8qIENo
ZWNrIExTTyBjYXBhYmlsaXR5OyBydW50aW1lIGRldGVjdGlvbiBjYW4gYmUgb3ZlcnJpZGRlbiBi
eSBhIGNhcAo+ICsJICogZmxhZyBpZiB0aGUgaGFyZHdhcmUgaXMga25vd24gdG8gYmUgYnVnZ3kg
Ki8KPiArCWlmICghKGJwLT5jYXBzICYgTUFDQl9DQVBTX05PX0xTTykgJiYKPiArCSAgICBHRU1f
QkZFWFQoUEJVRl9MU08sIGdlbV9yZWFkbChicCwgRENGRzYpKSkKPiAgCQlkZXYtPmh3X2ZlYXR1
cmVzIHw9IE1BQ0JfTkVUSUZfTFNPOwo+ICAKPiAgCS8qIENoZWNrc3VtIG9mZmxvYWQgaXMgb25s
eSBhdmFpbGFibGUgb24gZ2VtIHdpdGggcGFja2V0IGJ1ZmZlciAqLwo+IAoKUmV2aWV3ZWQtYnk6
IFNlYW4gQW5kZXJzb24gPHNlYW4uYW5kZXJzb25AbGludXguZGV2PgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
