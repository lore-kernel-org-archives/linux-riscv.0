Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A156C8303F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 19:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZNKLbxZpClh82yLHvxOSqziTfojER5sCZXA5dPDdBI=; b=hpSDCZbwjANFkv
	C5SPzz9hTMoHxOjpEjNbiuNSsahbvP5a1UVy47UdtGK96k0mXvqaBW+skqpJ9r1J26fp81hy3CIV/
	zvlKhjy5fU+V9GxSHj+GBV14uv/zxUK3/ZiF6uwLqpAwvPrvbAxMPrl15d5FNMD6SIS+mBmSijM2q
	73oVpYWOXbkxfRpcMPem1FdY/x0fk3tlArlp0z4TUmS53EB8WJWCsUP4AsuKvmt08iPjRUfkD3T1p
	zFYFFJBZ2/veCJ26IsLAxJ3JVR2DJzHHJCWhrI+AlVEj2hXHnzWU5WDMHXqbdyA+ALQj0c/jPrCcY
	DeGPnygI+bJbSwe+9v9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgDW-00000006PJE-40Kl;
	Tue, 01 Jul 2025 19:00:30 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWe20-000000064by-3TvT
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 16:40:30 +0000
Message-ID: <1a4fe95a-f029-43b2-aed1-594365254b6a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751388026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4v8Xkp+c9mceTr0Q8v7/zrK1IVjBYCeckNhf49+7xs=;
	b=RLgFCTGLYZGv7GE+j3tCpdemaHKjOPsy83ZDnu3AOOXA8PZ6TwJihlUBHoT7RsdgGvY6rs
	iSal0Uk/kJUOk03z5i/GAeuQMbCS3TEj1la5NEJxKz28cXHvOKvXg3HkEhsMlGBvKe6R30
	aQ6wK1DMkfzkt1bFhcGJmZpmKTI4P2o=
Date: Tue, 1 Jul 2025 12:40:17 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 12/18] net: macb: match skb_reserve(skb,
 NET_IP_ALIGN) with HW alignment
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
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-12-ff8207d0bb77@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250627-macb-v2-12-ff8207d0bb77@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_094029_256373_8A49D53A 
X-CRM114-Status: GOOD (  25.24  )
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

T24gNi8yNy8yNSAwNTowOCwgVGjDqW8gTGVicnVuIHdyb3RlOgo+IElmIEhXIGlzIFJTQyBjYXBh
YmxlLCBpdCBjYW5ub3QgYWRkIGR1bW15IGJ5dGVzIGF0IHRoZSBzdGFydCBvZiBJUAoKUmVjZWl2
ZS1zaWRlIGNvYWxlc2Npbmc/IENhbiB5b3UgYWRkIGEgYnJpZWYgZGVzY3JpcHRpb24gb2YgdGhp
cwpmZWF0dXJlIHRvIHlvdXIgY29tbWl0IG1lc3NhZ2U/Cgo+IHBhY2tldHMuIEFsaWdubWVudCAo
aWUgbnVtYmVyIG9mIGR1bW15IGJ5dGVzKSBpcyBjb25maWd1cmVkIHVzaW5nIHRoZQo+IFJCT0Yg
ZmllbGQgaW5zaWRlIHRoZSBOQ0ZHUiByZWdpc3Rlci4KPiAKPiBPbiB0aGUgc29mdHdhcmUgc2lk
ZSwgdGhlIHNrYl9yZXNlcnZlKHNrYiwgTkVUX0lQX0FMSUdOKSBjYWxsIG11c3Qgb25seQo+IGJl
IGRvbmUgaWYgdGhvc2UgZHVtbXkgYnl0ZXMgYXJlIGFkZGVkIGJ5IHRoZSBoYXJkd2FyZTsgbm90
aWNlIHRoZQo+IHNrYl9yZXNlcnZlKCkgaXMgZG9uZSBBRlRFUiB3cml0aW5nIHRoZSBhZGRyZXNz
IHRvIHRoZSBkZXZpY2UuCj4gCj4gV2UgY2Fubm90IGRvIHRoZSBza2JfcmVzZXJ2ZSgpIGNhbGwg
QkVGT1JFIHdyaXRpbmcgdGhlIGFkZHJlc3MgYmVjYXVzZQo+IHRoZSBhZGRyZXNzIGZpZWxkIGln
bm9yZXMgdGhlIGxvdyAyLzMgYml0cy4gQ29uY2x1c2lvbjogaW4gc29tZSBjYXNlcywKPiB3ZSBy
aXNrIG5vdCBiZWluZyBhYmxlIHRvIHJlc3BlY3QgdGhlIE5FVF9JUF9BTElHTiB2YWx1ZSAod2hp
Y2ggaXMKPiBwaWNrZWQgYmFzZWQgb24gdW5hbGlnbmVkIENQVSBhY2Nlc3MgcGVyZm9ybWFuY2Up
Lgo+IAo+IEZpeGVzOiA0ZGY5NTEzMWVhODAgKCJuZXQvbWFjYjogY2hhbmdlIFJYIHBhdGggZm9y
IEdFTSIpCgpEbyBhbnkgZXhpc3RpbmcgTUFDQnMgc3VwcG9ydCBSU0M/IElzIHRoaXMgYSBmaXg/
IAoKPiBTaWduZWQtb2ZmLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaCAgICAgIHwgIDMg
KysrCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMgfCAyMSArKysr
KysrKysrKysrKysrKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRl
bmNlL21hY2IuaCBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYi5oCj4gaW5kZXgg
YWRjNzBiNmVmZDUyYjBiMTFlNDM2YzJjOTViYjUxMDhjNDBmMzQ5MC4uZDQyYzgxY2Y0NDFjZTQz
NWNhZDM4ZTJkZmQ3NzliMGU2YTE0MWJmMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhl
cm5ldC9jYWRlbmNlL21hY2IuaAo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2Uv
bWFjYi5oCj4gQEAgLTUyMyw2ICs1MjMsOCBAQAo+ICAvKiBCaXRmaWVsZHMgaW4gRENGRzYuICov
Cj4gICNkZWZpbmUgR0VNX1BCVUZfTFNPX09GRlNFVAkJCTI3Cj4gICNkZWZpbmUgR0VNX1BCVUZf
TFNPX1NJWkUJCQkxCj4gKyNkZWZpbmUgR0VNX1BCVUZfUlNDX09GRlNFVAkJCTI2Cj4gKyNkZWZp
bmUgR0VNX1BCVUZfUlNDX1NJWkUJCQkxCj4gICNkZWZpbmUgR0VNX1BCVUZfQ1VUVEhSVV9PRkZT
RVQJCQkyNQo+ICAjZGVmaW5lIEdFTV9QQlVGX0NVVFRIUlVfU0laRQkJCTEKPiAgI2RlZmluZSBH
RU1fREFXNjRfT0ZGU0VUCQkJMjMKPiBAQCAtNzMzLDYgKzczNSw3IEBACj4gICNkZWZpbmUgTUFD
Ql9DQVBTX01JSU9OUkdNSUkJCQlCSVQoOSkKPiAgI2RlZmluZSBNQUNCX0NBUFNfTkVFRF9UU1VD
TEsJCQlCSVQoMTApCj4gICNkZWZpbmUgTUFDQl9DQVBTX1FVRVVFX0RJU0FCTEUJCQlCSVQoMTEp
Cj4gKyNkZWZpbmUgTUFDQl9DQVBTX1JTQ19DQVBBQkxFCQkJQklUKDEyKQoKTm8gbmVlZCB0byBi
ZSBfQ0FQQUJMRSwgd2UncmUgYWxyZWFkeSBfQ0FQU18KCj4gICNkZWZpbmUgTUFDQl9DQVBTX1BD
UwkJCQlCSVQoMjQpCj4gICNkZWZpbmUgTUFDQl9DQVBTX0hJR0hfU1BFRUQJCQlCSVQoMjUpCj4g
ICNkZWZpbmUgTUFDQl9DQVBTX0NMS19IV19DSEcJCQlCSVQoMjYpCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhl
cm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCj4gaW5kZXggNDhiNzVkOTU4NjEzMTdiOTkyNWIzNjY0
NDZjNzU3MmM3ZTE4NjYyOC4uNTc4ZTcyYzc3MjdkNGY1Nzg0NzhmZjJiM2QwYTYzMTYzMjcyNzFi
MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5j
Cj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwo+IEBAIC0x
MzE3LDggKzEzMTcsMTkgQEAgc3RhdGljIHZvaWQgZ2VtX3J4X3JlZmlsbChzdHJ1Y3QgbWFjYl9x
dWV1ZSAqcXVldWUpCj4gIAkJCWRtYV93bWIoKTsKPiAgCQkJbWFjYl9zZXRfYWRkcihicCwgZGVz
YywgcGFkZHIpOwo+ICAKPiAtCQkJLyogcHJvcGVybHkgYWxpZ24gRXRoZXJuZXQgaGVhZGVyICov
Cj4gLQkJCXNrYl9yZXNlcnZlKHNrYiwgTkVUX0lQX0FMSUdOKTsKPiArCQkJLyogUHJvcGVybHkg
YWxpZ24gRXRoZXJuZXQgaGVhZGVyLgo+ICsJCQkgKgo+ICsJCQkgKiBIYXJkd2FyZSBjYW4gYWRk
IGR1bW15IGJ5dGVzIGlmIGFza2VkIHVzaW5nIHRoZSBSQk9GCj4gKwkJCSAqIGZpZWxkIGluc2lk
ZSB0aGUgTkNGR1IgcmVnaXN0ZXIuIFRoYXQgZmVhdHVyZSBpc24ndAo+ICsJCQkgKiBhdmFpbGFi
bGUgaWYgaGFyZHdhcmUgaXMgUlNDIGNhcGFibGUuCj4gKwkJCSAqCj4gKwkJCSAqIFdlIGNhbm5v
dCBmYWxsYmFjayB0byBkb2luZyB0aGUgMi1ieXRlIHNoaWZ0IGJlZm9yZQo+ICsJCQkgKiBETUEg
bWFwcGluZyBiZWNhdXNlIHRoZSBhZGRyZXNzIGZpZWxkIGRvZXMgbm90IGFsbG93Cj4gKwkJCSAq
IHNldHRpbmcgdGhlIGxvdyAyLzMgYml0cy4KPiArCQkJICogSXQgaXMgMyBiaXRzIGlmIEhXX0RN
QV9DQVBfUFRQLCBlbHNlIDIgYml0cy4KPiArCQkJICovCj4gKwkJCWlmICghKGJwLT5jYXBzICYg
TUFDQl9DQVBTX1JTQ19DQVBBQkxFKSkKPiArCQkJCXNrYl9yZXNlcnZlKHNrYiwgTkVUX0lQX0FM
SUdOKTsKPiAgCQl9IGVsc2Ugewo+ICAJCQlkZXNjLT5jdHJsID0gMDsKPiAgCQkJZG1hX3dtYigp
Owo+IEBAIC0yNzg3LDcgKzI3OTgsOSBAQCBzdGF0aWMgdm9pZCBtYWNiX2luaXRfaHcoc3RydWN0
IG1hY2IgKmJwKQo+ICAJbWFjYl9zZXRfaHdhZGRyKGJwKTsKPiAgCj4gIAljb25maWcgPSBtYWNi
X21kY19jbGtfZGl2KGJwKTsKPiAtCWNvbmZpZyB8PSBNQUNCX0JGKFJCT0YsIE5FVF9JUF9BTElH
Tik7CS8qIE1ha2UgZXRoIGRhdGEgYWxpZ25lZCAqLwo+ICsJLyogTWFrZSBldGggZGF0YSBhbGln
bmVkLiBJZiBSU0MgY2FwYWJsZSwgdGhhdCBvZmZzZXQgaXMgaWdub3JlZCBieSBIVy4gKi8KPiAr
CWlmICghKGJwLT5jYXBzICYgTUFDQl9DQVBTX1JTQ19DQVBBQkxFKSkKPiArCQljb25maWcgfD0g
TUFDQl9CRihSQk9GLCBORVRfSVBfQUxJR04pOwo+ICAJY29uZmlnIHw9IE1BQ0JfQklUKERSRkNT
KTsJCS8qIERpc2NhcmQgUnggRkNTICovCj4gIAlpZiAoYnAtPmNhcHMgJiBNQUNCX0NBUFNfSlVN
Qk8pCj4gIAkJY29uZmlnIHw9IE1BQ0JfQklUKEpGUkFNRSk7CS8qIEVuYWJsZSBqdW1ibyBmcmFt
ZXMgKi8KPiBAQCAtNDEwOCw2ICs0MTIxLDggQEAgc3RhdGljIHZvaWQgbWFjYl9jb25maWd1cmVf
Y2FwcyhzdHJ1Y3QgbWFjYiAqYnAsCj4gIAkJZGNmZyA9IGdlbV9yZWFkbChicCwgRENGRzIpOwo+
ICAJCWlmICgoZGNmZyAmIChHRU1fQklUKFJYX1BLVF9CVUZGKSB8IEdFTV9CSVQoVFhfUEtUX0JV
RkYpKSkgPT0gMCkKPiAgCQkJYnAtPmNhcHMgfD0gTUFDQl9DQVBTX0ZJRk9fTU9ERTsKPiArCQlp
ZiAoR0VNX0JGRVhUKFBCVUZfUlNDLCBnZW1fcmVhZGwoYnAsIERDRkc2KSkpCj4gKwkJCWJwLT5j
YXBzIHw9IE1BQ0JfQ0FQU19SU0NfQ0FQQUJMRTsKPiAgCQlpZiAoZ2VtX2hhc19wdHAoYnApKSB7
Cj4gIAkJCWlmICghR0VNX0JGRVhUKFRTVSwgZ2VtX3JlYWRsKGJwLCBEQ0ZHNSkpKQo+ICAJCQkJ
ZGV2X2VycigmYnAtPnBkZXYtPmRldiwKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
