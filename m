Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80649FF494B
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 07:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xNNgIA8VRivGM27rgMPId8dEU98XvRjor9c3htXdKs=; b=EgXTLZT6EkGxZQ
	Gj8EJ371VqLXrrVVy0zJmfUDksKUViHXhz7eoRv6/Tg1Ibbvm0DxbPlLRN3NbKKi+ywycIp/8nA4Y
	fvwbWZhUZ/PvwRmvDytn3g3iJ5VPj4DXQtGGfMdk3ADx8XV/kNr9ysgR52GYFc2CSxcD8Ixof2+lg
	hOioUOVUFAwyJm1kCUmPuK29zayMWtutcUngwPcgNlHN7W0NEkaJSL0xNIw0pgU8FazS4ihJRdNeR
	LNFhKZWCXFTHPh9nUjSKmgWf5hFjrUCckMRT7m/d836CB0D9OkxHTVKt8c058wjh4+VuGxH5RTNwz
	4iqmum62jIVC6+Q3V/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76oX-0000000Ajwk-086F;
	Mon, 30 Mar 2026 07:13:33 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76oP-0000000AjuN-33QX
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 07:13:30 +0000
X-QQ-mid: Yeas1t1774854731t870t42468
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [115.227.224.139])
X-QQ-SSF: 0000000000000000000000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 968294333165646595
To: <patchwork-bot+netdevbpf@kernel.org>,
	"'Conor Dooley'" <conor@kernel.org>,
	"'Conor Dooley'" <conor@kernel.org>
Cc: <netdev@vger.kernel.org>,
	<conor.dooley@microchip.com>,
	<Valentina.FernandezAlanis@microchip.com>,
	<andrew+netdev@lunn.ch>,
	<davem@davemloft.net>,
	<edumazet@google.com>,
	<kuba@kernel.org>,
	<pabeni@redhat.com>,
	<robh@kernel.org>,
	<krzk+dt@kernel.org>,
	<conor+dt@kernel.org>,
	<daire.mcnamara@microchip.com>,
	<pjw@kernel.org>,
	<palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>,
	<nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>,
	<richardcochran@gmail.com>,
	<samuel.holland@sifive.com>,
	<devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>,
	<dave.stevenson@raspberrypi.com>,
	<sean.anderson@linux.dev>,
	<vineeth.karumanchi@amd.com>,
	<abin.joseph@amd.com>,
	<theo.lebrun@bootlin.com>,
	<Ryan.Wanner@microchip.com>,
	<haokexin@gmail.com>,
	<netdev@vger.kernel.org>,
	<conor.dooley@microchip.com>,
	<Valentina.FernandezAlanis@microchip.com>,
	<andrew+netdev@lunn.ch>,
	<davem@davemloft.net>,
	<edumazet@google.com>,
	<kuba@kernel.org>,
	<pabeni@redhat.com>,
	<robh@kernel.org>,
	<krzk+dt@kernel.org>,
	<conor+dt@kernel.org>,
	<daire.mcnamara@microchip.com>,
	<pjw@kernel.org>,
	<palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>,
	<nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>,
	<richardcochran@gmail.com>,
	<samuel.holland@sifive.com>,
	<devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>,
	<dave.stevenson@raspberrypi.com>,
	<sean.anderson@linux.dev>,
	<vineeth.karumanchi@amd.com>,
	<abin.joseph@amd.com>,
	<theo.lebrun@bootlin.com>,
	<Ryan.Wanner@microchip.com>,
	<haokexin@gmail.com>
References: <20260325-unsterile-flail-4c7729750dc4@spud>  <177482042554.472023.12757157452690281696.git-patchwork-notify@kernel.org>
In-Reply-To: <177482042554.472023.12757157452690281696.git-patchwork-notify@kernel.org>
Subject: RE: [PATCH net-next v5 00/14] macb usrio/tsu patches
Date: Mon, 30 Mar 2026 15:12:10 +0800
Message-ID: <06a701dcc014$86def5b0$949ce110$@trustnetic.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQF0vN16QhDCAi1TInuOp+Z4l0ZKlwGT8tMStooKEUA=
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NhwZbiJyi1+wZ4uypLuYQMD8YcwjOFYKl/zYs0K++zP4VxYJO0x3AKyX
	8mIpKGM8bOFeM2yIphfDVYHb+APtAbyNiQxBgApDq68/UmHsXMyTamP9N3SYZYPreYhkOIL
	yeyRHjDDmxbxFdDyyeYqLqizGsaFBk8zO6o9PvtiGGZgaLcdGznj23j1DHwaTiglWd1jcTh
	RSFmWz48AbwyIkPOqOtNR/XoylIF3Jkm5GOQdct6T4FdzdqEqvPdjE6EA4Y+NgY4UulOWCY
	K2n6LviBSmWr6ZP1N3o1o5tOZHODvSLCAs4Us4Vd5p7EeJubeeeRNCqUglJNtFeytKv4KHQ
	syZyzOaoBmcu8tZimE3402S11Nc2lFn4oOf7VIJtjtG8GSIwOnHRZ1BckItUZJnAcSV1sch
	qtT6rWAjz1FDJQ04tFyJD5/uEzGQ2rmW01DPfjTe/v8Qp1J8WKSzm44eALFifL2gp7g1OkM
	Uwv6obx/dtLcORmlM/aSq5Yq1w/xV7r7HuF5SXnbd50FdUexbx3qmcW6oTkMy9W5f7521Yz
	fi9tm9kiPhAIC/cZzJC879UVEm4ojZPYHXQuF8uUQZkCD7Kw+wTHOQXOATVZeGXSM1T3aya
	LvRgLOOgpNuBgjE+uqnmRyYxSCjiGXqssA48s4NqtUiO24sMdVwZ7pCLku+z1n/sgib9GJZ
	w1lp4k/B53Y8jprA7zwluesLk9kRIQDE1ja2sTGTgYpuc4jvrUMVJVAZ26QOK1FydPxnOjn
	uC6lskI5Pj0D4Uo8NeRpuWJm2A3Udch7R7Q3F8LqPGzwGrqm3AeBBvqY7fAb39RpKh3vwhy
	NiRGjq8XFnFqVXMlMs2FoLsFEdcY8aPfJcC1T5JVFlA05EdD9Jf2V8/RrbGcxGQ8vFxRuQX
	k0Cqe/QMy3GlNSDb4gDTERKdGcPndeJQECeoOScrBrcviM+Ec2I4BUypqKiDB88t9yU2krU
	Gkg0N+Bbgaa1LNa5qf3J/LHXpud4T6L8yMIFbHphi2fi3LYp9YS9cj1Z7TExMusKMDGWN4v
	XGYyOiDGWa3KgIVB0zeYjHFEwk1f7F1F397m6UEg==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_001326_260406_5381C03B 
X-CRM114-Status: GOOD (  14.86  )
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

PiBIZWxsbzoKPiAKPiBUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byBuZXRkZXYvbmV0LW5leHQu
Z2l0IChtYWluKQo+IGJ5IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+Ogo+IAo+IE9u
IFdlZCwgMjUgTWFyIDIwMjYgMTY6Mjg6MDQgKzAwMDAgeW91IHdyb3RlOgo+ID4gRnJvbTogQ29u
b3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+Cj4gPiBIZXkgZm9sa3Ms
Cj4gPgo+ID4gQXQgdGhlIHZlcnkgbGVhc3QsIGl0J2QgYmUgZ29vZCBvZiB0aGUgc29jIHZlbmRv
ciBmb2xrcyBjb3VsZCBjaGVjawo+ID4gdGhlaXIgcGxhdGZvcm1zIGFuZCBzZWUgaWYgdGhlaXIg
dXNyaW8gc3R1ZmYgYWN0dWFsbHkgbGluZXMgdXAgd2l0aCB3aGF0Cj4gPiB0aGUgZHJpdmVyIGN1
cnJlbnRseSBjYWxscyAibWFjYl9kZWZhdWx0X3VzcmlvIi4gT3VycyBkaWRuJ3QgYW5kIGl0IHdh
cwo+ID4gYSBuYXN0eSBzdXJwcmlzZS4KPiA+Cj4gPiBbLi4uXQo+IAo+IEhlcmUgaXMgdGhlIHN1
bW1hcnkgd2l0aCBsaW5rczoKPiAgIC0gW25ldC1uZXh0LHY1LDAxLzE0XSBSZXZlcnQgIm5ldDog
bWFjYjogQ2xlYW4gdXAgdGhlIC51c3JpbyBzZXR0aW5ncyBpbiBtYWNiX2NvbmZpZyBpbnN0YW5j
ZXMiCj4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvbmV0ZGV2L25ldC1uZXh0L2MvOGNjZjA2
MmM2NzcwCj4gICAtIFtuZXQtbmV4dCx2NSwwMi8xNF0gbmV0OiBtYWNiOiByZW5hbWUgbWFjYl9k
ZWZhdWx0X3VzcmlvIHRvIGF0OTFfZGVmYXVsdF91c3JpbyBhcyBub3QgYWxsIHBsYXRmb3JtcyBo
YXZlIG1paSBtb2RlIGNvbnRyb2wgaW4KPiB1c3Jpbwo+ICAgICBodHRwczovL2dpdC5rZXJuZWwu
b3JnL25ldGRldi9uZXQtbmV4dC9jL2ExNzg3MTc3OGVlMgo+ICAgLSBbbmV0LW5leHQsdjUsMDMv
MTRdIG5ldDogbWFjYjogc3BsaXQgVVNSSU9fSEFTX0NMS0VOIGNhcGFiaWxpdHkgaW4gdHdvCj4g
ICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvbmV0ZGV2L25ldC1uZXh0L2MvMDM5ZjE4NWEwMDYw
Cj4gICAtIFtuZXQtbmV4dCx2NSwwNC8xNF0gZHQtYmluZGluZ3M6IG5ldDogY2RucyxtYWNiOiBy
ZXBsYWNlIGNkbnMscmVmY2xrLWV4dCB3aXRoIGNkbnMscmVmY2xrLXNvdXJjZQo+ICAgICBodHRw
czovL2dpdC5rZXJuZWwub3JnL25ldGRldi9uZXQtbmV4dC9jL2RmYTM2ZDdlODYwYwo+ICAgLSBb
bmV0LW5leHQsdjUsMDUvMTRdIG5ldDogbWFjYjogcmV3b3JrIHVzcmlvIHJlZmNsayBzZWxlY3Rp
b24gY29kZQo+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL25ldGRldi9uZXQtbmV4dC9jLzZj
NWI1NjVkN2Q0MQo+ICAgLSBbbmV0LW5leHQsdjUsMDYvMTRdIG5ldDogbWFjYjogbnA0IGRvZXNu
J3QgbmVlZCBhIHVzcmlvIHBvaW50ZXIKPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9uZXRk
ZXYvbmV0LW5leHQvYy84MjZjYmU2MzZlMTAKPiAgIC0gW25ldC1uZXh0LHY1LDA3LzE0XSBuZXQ6
IG1hY2I6IGFkZCBtcGZzIHNwZWNpZmljIHVzcmlvIGNvbmZpZ3VyYXRpb24KPiAgICAgaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9uZXRkZXYvbmV0LW5leHQvYy9jNzExMzExZDZiYTMKPiAgIC0gW25l
dC1uZXh0LHY1LDA4LzE0XSBuZXQ6IG1hY2I6IHdhcm4gb24gcGNsayB1c2UgYXMgYSB0c3VfY2xr
IGZhbGxiYWNrCj4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvbmV0ZGV2L25ldC1uZXh0L2Mv
M2ZlMTNkODU4ZjgzCj4gICAtIFtuZXQtbmV4dCx2NSwwOS8xNF0gbmV0OiBtYWNiOiBjbGVhbiB1
cCB0c3UgY2xrIHJhdGUgYWNxdWlzaXRpb24KPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9u
ZXRkZXYvbmV0LW5leHQvYy9iNjk4YTFlMzk3YWIKPiAgIC0gW25ldC1uZXh0LHY1LDEwLzE0XSBk
dC1iaW5kaW5nczogbmV0OiBtYWNiOiBhZGQgcHJvcGVydHkgaW5kaWNhdGluZyB0aW1lciBhZGp1
c3QgbW9kZQo+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL25ldGRldi9uZXQtbmV4dC9jLzA5
YTYxNjRhNGYxZAo+ICAgLSBbbmV0LW5leHQsdjUsMTEvMTRdIG5ldDogbWFjYjogdGltZXIgYWRq
dXN0IG1vZGUgaXMgbm90IHN1cHBvcnRlZAo+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL25l
dGRldi9uZXQtbmV4dC9jLzQxYWRkYTg3NjRmZAo+ICAgLSBbbmV0LW5leHQsdjUsMTIvMTRdIG5l
dDogbWFjYjogcnVudGltZSBkZXRlY3QgTUFDQl9DQVBTX1VTUklPX0RJU0FCTEVECj4gICAgIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvbmV0ZGV2L25ldC1uZXh0L2MvNDdjODZjNDYzNjEyCj4gICAt
IFtuZXQtbmV4dCx2NSwxMy8xNF0gbmV0OiBtYWNiOiBzZXQgTUFDQl9DQVBTX1VTUklPX0RJU0FC
TEVEIGlmIG5vIHVzcmlvIGNvbmZpZyBpcyBwcm92aWRlZAo+ICAgICBodHRwczovL2dpdC5rZXJu
ZWwub3JnL25ldGRldi9uZXQtbmV4dC9jLzMyZmM2YTlmNmU3NQo+ICAgLSBbbmV0LW5leHQsdjUs
MTQvMTRdIG5ldDogbWFjYjogZHJvcCB1c3JpbyBwb2ludGVyIG9uIEV5ZVE1IGNvbmZpZwo+ICAg
ICBodHRwczovL2dpdC5rZXJuZWwub3JnL25ldGRldi9uZXQtbmV4dC9jL2NkMTA4MmE5NmY5YQo+
IAo+IFlvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQo+IC0tCj4gRGVldC1kb290LWRvdCwgSSBh
bSBhIGJvdC4KPiBodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5o
dG1sCgpIaSwKClRoZXJlIGFyZSBjb21waWxhdGlvbiBlcnJvcnMgYWZ0ZXIgbWVyZ2luZyB0aGlz
IHBhdGNoIHNldC4KSSBiZWxpZXZlIHRoZSBlcnJvciBvY2N1cnJlZCB3aGVyZSB0aGUgQ09ORklH
X09GIGlzIG5vdCBzZXQuCgpyb290QHctTVMtN0UxNjp+L25ldC1uZXh0IyBtYWtlIEM9MSBXPTEK
ICBDQUxMICAgIHNjcmlwdHMvY2hlY2tzeXNjYWxscy5zaAogIERFU0NFTkQgb2JqdG9vbAogIElO
U1RBTEwgbGlic3ViY21kX2hlYWRlcnMKICBDQyBbTV0gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2Nh
ZGVuY2UvbWFjYl9tYWluLm8KZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4u
Yzo1NzU1OjE5OiBlcnJvcjog4oCYYXQ5MV9kZWZhdWx0X3Vzcmlv4oCZIHVuZGVjbGFyZWQgaGVy
ZSAobm90IGluIGEgZnVuY3Rpb24pCiA1NzU1IHwgICAgICAgICAudXNyaW8gPSAmYXQ5MV9kZWZh
dWx0X3VzcmlvLAogICAgICB8ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgpt
YWtlWzZdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6Mjg5OiBkcml2ZXJzL25ldC9ldGhl
cm5ldC9jYWRlbmNlL21hY2JfbWFpbi5vXSBFcnJvciAxCm1ha2VbNV06ICoqKiBbc2NyaXB0cy9N
YWtlZmlsZS5idWlsZDo1NDg6IGRyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2VdIEVycm9yIDIK
bWFrZVs0XTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjU0ODogZHJpdmVycy9uZXQvZXRo
ZXJuZXRdIEVycm9yIDIKbWFrZVszXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjU0ODog
ZHJpdmVycy9uZXRdIEVycm9yIDIKbWFrZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxk
OjU0ODogZHJpdmVyc10gRXJyb3IgMgptYWtlWzFdOiAqKiogWy9yb290L25ldC1uZXh0L01ha2Vm
aWxlOjIxMDU6IC5dIEVycm9yIDIKbWFrZTogKioqIFtNYWtlZmlsZToyNDg6IF9fc3ViLW1ha2Vd
IEVycm9yIDIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
