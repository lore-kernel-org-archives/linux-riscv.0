Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C98C8303C
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 19:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTznB1L4RXragg1/zi2yLKOAV7bKYjEIjmsbDsnLMg4=; b=RZnOhha60mSqR8
	ry2zTUNy/qTjmk08EU7TF9hX4bNcLuzvS89K+oLjFZwyr1Z3oFmOPT9KjaARcCRtHNXV61oTx0gxi
	uXUGT6JR4R/0k1D3oZ0RZPjFbYrLlNuq7tSXkZELHobP0bR5E3uEskD/sIVTmDm+Yy+fOZdNanmAK
	vOHQ5te+vDKmMVDbnUoqzGMKb1cTjnhdu24Wjb9xDJhMXUmEe4qa5KsVndSkw/1OI2w/WOdpUQdRW
	lulWttrS/A+dq5FyiJ9ir22MQ4ZM62j5IwW5d5Q2p5MkyTfsq2DzgVx6cvcHO8TI0MxHPB7NT0oNP
	kfmV7ukhaSGNm9P9CDUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgDb-00000006POq-1PBY;
	Tue, 01 Jul 2025 19:00:35 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeCa-0000000676M-0XGU
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 16:51:25 +0000
Message-ID: <fe28f804-feee-4435-823b-5d03986c153b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751388680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFV2Y1ZWu7rW4X21P0xZgpGTDxMq6xKQ6i6Q3MK2S08=;
	b=K14Ov+NR3NsVPzQm7eadWphxZ3H+IIaVGvtE3m9uhaob7QgGFkE642v1NQgYUgPJo7ly2m
	C2uu1rxJDY1LaRC/5O/6HzgrnfbANHAN8uoyrKr0VGaU5YVZS+pv5s+gUPIyc/BKP21O2H
	a8oUKIUnwgutjKv5ZXIirwZ5Fhb4Vdw=
Date: Tue, 1 Jul 2025 12:51:10 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 15/18] net: macb: Add "mobileye,eyeq5-gem"
 compatible
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
 <20250627-macb-v2-15-ff8207d0bb77@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250627-macb-v2-15-ff8207d0bb77@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095124_321343_BB9A88A7 
X-CRM114-Status: GOOD (  21.60  )
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

T24gNi8yNy8yNSAwNTowOSwgVGjDqW8gTGVicnVuIHdyb3RlOgo+IEFkZCBzdXBwb3J0IGZvciB0
aGUgdHdvIEdFTSBpbnN0YW5jZXMgaW5zaWRlIE1vYmlsZXllIEV5ZVE1IFNvQ3MsIHVzaW5nCj4g
Y29tcGF0aWJsZSAibW9iaWxleWUsZXllcTUtZ2VtIi4gV2l0aCBpdCwgYWRkIGEgY3VzdG9tIGlu
aXQgc2VxdWVuY2UKPiB0aGF0IGFjY2Vzc2VzIHR3byBzeXN0ZW0tY29udHJvbGxlciByZWdpc3Rl
cnMuCj4gCj4gTm90ZXdvcnRoeTogTkVUX0lQX0FMSUdOPTIgb24gTUlQUyBidXQgdGhlIGhhcmR3
YXJlIGRvZXMgbm90IGFsaWduIGFuZAo+IGxvdyBiaXRzIGFyZW4ndCBjb25maWd1cmFibGUsIHNv
IHdlIGNhbm5vdCByZXNwZWN0IHRoZSByZXF1ZXN0ZWQgSVAKPiBoZWFkZXIgYWxpZ25tZW50Lgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFRow6lvIExlYnJ1biA8dGhlby5sZWJydW5AYm9vdGxpbi5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMgfCA4MCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgODAgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNl
L21hY2JfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwo+
IGluZGV4IGY5YTNhNWNhZWJjYWZlM2Q5MTk3YTNiYzc2ODFiNjQ3MzRkN2FjOTMuLmVkMzk0ZTVk
MWVjOWIxNzQ4MjgyZjE0NDg2MjhkNTAwNmYzYjA5NzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L2NhZGVuY2UvbWFjYl9tYWluLmMKPiBAQCAtMjAsNiArMjAsNyBAQAo+ICAjaW5jbHVkZSA8
bGludXgvaW9wb2xsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pcC5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgva2VybmVsLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tZmQvc3lzY29uLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9tb2R1bGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZXBhcmFtLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9uZXRkZXZpY2UuaD4KPiBAQCAtMzEsNiArMzIsNyBAQAo+ICAjaW5jbHVk
ZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1l
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wdHBfY2xhc3NpZnkuaD4KPiArI2luY2x1ZGUgPGxpbnV4
L3JlZ21hcC5oPgo+ICAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L3NsYWIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3RjcC5oPgo+IEBAIC00OTU3LDYgKzQ5NTksNzIg
QEAgc3RhdGljIGludCBpbml0X3Jlc2V0X29wdGlvbmFsKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+ICsjZGVmaW5lIEVZRVE1X09MQl9HUF9U
WF9TV1JTVF9ESVMJQklUKDApCQkvLyBUeCBTVyByZXNldAo+ICsjZGVmaW5lIEVZRVE1X09MQl9H
UF9UWF9NX0NMS0UJCUJJVCgxKQkJLy8gVHggTSBjbG9jayBlbmFibGUKPiArI2RlZmluZSBFWUVR
NV9PTEJfR1BfU1lTX1NXUlNUX0RJUwlCSVQoMikJCS8vIFN5cyBTVyByZXNldAo+ICsjZGVmaW5l
IEVZRVE1X09MQl9HUF9TWVNfTV9DTEtFCQlCSVQoMykJCS8vIFN5cyBjbG9jayBlbmFibGUKPiAr
I2RlZmluZSBFWUVRNV9PTEJfR1BfU0dNSUlfTU9ERQkJQklUKDQpCQkvLyBTR01JSSBtb2RlCj4g
KyNkZWZpbmUgRVlFUTVfT0xCX0dQX1JHTUlJX0RSVgkJR0VOTUFTSyg4LCA1KQkvLyBSR01JSSBt
b2RlCj4gKwo+ICsjZGVmaW5lIEVZRVE1X09MQl9TR01JSV9QV1JfRU4JCUJJVCgwKQo+ICsjZGVm
aW5lIEVZRVE1X09MQl9TR01JSV9SU1RfRElTCQlCSVQoMSkKPiArI2RlZmluZSBFWUVRNV9PTEJf
U0dNSUlfUExMX0VOCQlCSVQoMikKPiArI2RlZmluZSBFWUVRNV9PTEJfU0dNSUlfU0lHX0RFVF9T
VwlCSVQoMykKPiArI2RlZmluZSBFWUVRNV9PTEJfU0dNSUlfUFdSX1NUQVRFCUJJVCg0KQo+ICsj
ZGVmaW5lIEVZRVE1X09MQl9TR01JSV9QTExfQUNLCQlCSVQoMTgpCj4gKwo+ICtzdGF0aWMgaW50
IGV5ZXE1X2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiArewo+ICsJc3RydWN0
IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiArCXN0cnVjdCBuZXRfZGV2aWNlICpuZXRkZXYg
PSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiArCXN0cnVjdCBtYWNiICpicCA9IG5ldGRl
dl9wcml2KG5ldGRldik7Cj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2Rl
Owo+ICsJdW5zaWduZWQgaW50IGdwLCBzZ21paTsKPiArCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsK
PiArCXVuc2lnbmVkIGludCBhcmdzWzJdOwo+ICsJdW5zaWduZWQgaW50IHJlZzsKPiArCWludCBy
ZXQ7Cj4gKwo+ICsJcmVnbWFwID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZV9hcmdz
KG5wLCAibW9iaWxleWUsb2xiIiwgMiwgYXJncyk7Cj4gKwlpZiAoSVNfRVJSKHJlZ21hcCkpCj4g
KwkJcmV0dXJuIFBUUl9FUlIocmVnbWFwKTsKPiArCj4gKwlncCA9IGFyZ3NbMF07Cj4gKwlzZ21p
aSA9IGFyZ3NbMV07Cj4gKwo+ICsJLyogRm9yY2VkIHJlc2V0ICovCj4gKwlyZWdtYXBfd3JpdGUo
cmVnbWFwLCBncCwgMCk7Cj4gKwlyZWdtYXBfd3JpdGUocmVnbWFwLCBzZ21paSwgMCk7Cj4gKwl1
c2xlZXBfcmFuZ2UoNSwgMjApOwo+ICsKPiArCWlmIChicC0+cGh5X2ludGVyZmFjZSA9PSBQSFlf
SU5URVJGQUNFX01PREVfU0dNSUkpIAoKSXNuJ3QgdGhpcyB0b28gZWFybHk/IFdoYXQgaWYgeW91
IGhhdmUgYW4gU0ZQIGFuZCB0aGUgaW50ZXJmYWNlIG1vZGUgaXMgaW5pdGlhbGx5CjEwMDBCYXNl
LVggYW5kIHRoZSB1c2VyIHBsdWdzIGluIGFuIFNHTUlJIG1vZHVsZT8KCnsKPiArCQlyZWdtYXBf
d3JpdGUocmVnbWFwLCBncCwgRVlFUTVfT0xCX0dQX1NHTUlJX01PREUpOwo+ICsKPiArCQlyZWcg
PSBFWUVRNV9PTEJfU0dNSUlfUFdSX0VOIHwgRVlFUTVfT0xCX1NHTUlJX1JTVF9ESVMgfAo+ICsJ
CSAgICAgIEVZRVE1X09MQl9TR01JSV9QTExfRU47Cj4gKwkJcmVnbWFwX3dyaXRlKHJlZ21hcCwg
c2dtaWksIHJlZyk7Cj4gKwo+ICsJCXJldCA9IHJlZ21hcF9yZWFkX3BvbGxfdGltZW91dChyZWdt
YXAsIHNnbWlpLCByZWcsCj4gKwkJCQkJICAgICAgIHJlZyAmIEVZRVE1X09MQl9TR01JSV9QTExf
QUNLLAo+ICsJCQkJCSAgICAgICAxLCAxMDApOwo+ICsJCWlmIChyZXQpCj4gKwkJCXJldHVybiBk
ZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiUExMIHRpbWVvdXQiKTsKPiArCj4gKwkJcmVnID0gRVlF
UTVfT0xCX1NHTUlJX1BXUl9TVEFURSB8IEVZRVE1X09MQl9TR01JSV9TSUdfREVUX1NXOwo+ICsJ
CXJlZ21hcF91cGRhdGVfYml0cyhyZWdtYXAsIHNnbWlpLCByZWcsIHJlZyk7Cj4gKwl9Cj4gKwo+
ICsJcmVnID0gcGh5X2ludGVyZmFjZV9tb2RlX2lzX3JnbWlpKGJwLT5waHlfaW50ZXJmYWNlKSA/
IDB4OSA6IDB4MDsKPiArCXJlZ21hcF91cGRhdGVfYml0cyhyZWdtYXAsIGdwLCBFWUVRNV9PTEJf
R1BfUkdNSUlfRFJWLAo+ICsJCQkgICBGSUVMRF9QUkVQKEVZRVE1X09MQl9HUF9SR01JSV9EUlYs
IHJlZykpOwo+ICsKPiArCXJlZyA9IEVZRVE1X09MQl9HUF9UWF9TV1JTVF9ESVMgfCBFWUVRNV9P
TEJfR1BfVFhfTV9DTEtFIHwKPiArCSAgICAgIEVZRVE1X09MQl9HUF9TWVNfU1dSU1RfRElTIHwg
RVlFUTVfT0xCX0dQX1NZU19NX0NMS0U7Cj4gKwlyZWdtYXBfdXBkYXRlX2JpdHMocmVnbWFwLCBn
cCwgcmVnLCByZWcpOwo+ICsKPiArCXJldHVybiBtYWNiX2luaXQocGRldik7Cj4gK30KPiArCj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWFjYl91c3Jpb19jb25maWcgc2FtYTdnNV91c3JpbyA9IHsK
PiAgCS5taWkgPSAwLAo+ICAJLnJtaWkgPSAxLAo+IEBAIC01MTA5LDYgKzUxNzcsMTcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtYWNiX2NvbmZpZyB2ZXJzYWxfY29uZmlnID0gewo+ICAJLnVzcmlv
ID0gJm1hY2JfZGVmYXVsdF91c3JpbywKPiAgfTsKPiAgCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
bWFjYl9jb25maWcgZXllcTVfY29uZmlnID0gewo+ICsJLmNhcHMgPSBNQUNCX0NBUFNfR0lHQUJJ
VF9NT0RFX0FWQUlMQUJMRSB8IE1BQ0JfQ0FQU19KVU1CTyB8Cj4gKwkJTUFDQl9DQVBTX0dFTV9I
QVNfUFRQIHwgTUFDQl9DQVBTX1FVRVVFX0RJU0FCTEUgfAo+ICsJCU1BQ0JfQ0FQU19OT19MU08s
Cj4gKwkuZG1hX2J1cnN0X2xlbmd0aCA9IDE2LAo+ICsJLmNsa19pbml0ID0gbWFjYl9jbGtfaW5p
dCwKPiArCS5pbml0ID0gZXllcTVfaW5pdCwKPiArCS5qdW1ib19tYXhfbGVuID0gMTAyNDAsCj4g
KwkudXNyaW8gPSAmbWFjYl9kZWZhdWx0X3VzcmlvLAo+ICt9Owo+ICsKPiAgc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgbWFjYl9kdF9pZHNbXSA9IHsKPiAgCXsgLmNvbXBhdGlibGUg
PSAiY2RucyxhdDkxc2FtOTI2MC1tYWNiIiwgLmRhdGEgPSAmYXQ5MXNhbTkyNjBfY29uZmlnIH0s
Cj4gIAl7IC5jb21wYXRpYmxlID0gImNkbnMsbWFjYiIgfSwKPiBAQCAtNTEyOSw2ICs1MjA4LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbWFjYl9kdF9pZHNbXSA9IHsKPiAg
CXsgLmNvbXBhdGlibGUgPSAibWljcm9jaGlwLG1wZnMtbWFjYiIsIC5kYXRhID0gJm1wZnNfY29u
ZmlnIH0sCj4gIAl7IC5jb21wYXRpYmxlID0gIm1pY3JvY2hpcCxzYW1hN2c1LWdlbSIsIC5kYXRh
ID0gJnNhbWE3ZzVfZ2VtX2NvbmZpZyB9LAo+ICAJeyAuY29tcGF0aWJsZSA9ICJtaWNyb2NoaXAs
c2FtYTdnNS1lbWFjIiwgLmRhdGEgPSAmc2FtYTdnNV9lbWFjX2NvbmZpZyB9LAo+ICsJeyAuY29t
cGF0aWJsZSA9ICJtb2JpbGV5ZSxleWVxNS1nZW0iLCAuZGF0YSA9ICZleWVxNV9jb25maWcgfSwK
PiAgCXsgLmNvbXBhdGlibGUgPSAieGxueCx6eW5xbXAtZ2VtIiwgLmRhdGEgPSAmenlucW1wX2Nv
bmZpZ30sCj4gIAl7IC5jb21wYXRpYmxlID0gInhsbngsenlucS1nZW0iLCAuZGF0YSA9ICZ6eW5x
X2NvbmZpZyB9LAo+ICAJeyAuY29tcGF0aWJsZSA9ICJ4bG54LHZlcnNhbC1nZW0iLCAuZGF0YSA9
ICZ2ZXJzYWxfY29uZmlnfSwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
