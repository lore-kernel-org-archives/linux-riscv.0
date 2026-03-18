Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA06810775E7
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HGGY05019Zw2Qa4M3WMj33aQNIdpACbZTd1mb5bOrC0=; b=1FHhxAbVM1qjYH
	zNVn7BX7OUGanm0njnc8gib6q5APO95kzhLkKgRguvboB0t/zWfUpm352V/Aev9Yk7EglN1IKu/mY
	F9wfOzcrcTV91E27E01UtRhK0u2weKRv82cP70wcFXy7ANNue7U8c8LInd6635TP6ABiOB5wILV78
	hSIKEJhzD0T4ziyIuztfsYox/ynMONFVSRrBG6EcDq12IJHE9fo+GQJ2vxdUq5NFXJtbjWvh3bqT/
	COLaRLIyWBs+DN5lzCQiyqY0nuGMW08HZKcV4LwD9c2Um6aSd15bcLyvIpaITrw+IGEQrNamjlGHi
	jeTx9G8vGZZ2fzjLSO8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tu5-00000008xm0-3aFV;
	Wed, 18 Mar 2026 16:37:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tu3-00000008xlT-1ePz
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 16:37:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4000444CE;
	Wed, 18 Mar 2026 16:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1C8C19421;
	Wed, 18 Mar 2026 16:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773851870;
	bh=iqmtwLEcnL6mFlvnn9juJ9ChTC04q0eJq3YD9qrNJTI=;
	h=From:To:Cc:Subject:Date:From;
	b=PcNp68uNOBv5fLixIjnHiniTlT7nbV1vida+HWufRivcjOEemg/cdnlQZ3S28LjPi
	 j+Xclfj0fxIG1UpkeaBCnCo6UaO3E3amhxQ0ljAmkY0FRBeo/1eejhlIg0s6ML2FYk
	 j176lFp0kwIqRk5ppGbJPIIIsgG3KdHbfeTYvW/jsKkGjJxT/x3Gg6QtQlRfCRZpNT
	 XdeszBOq+uAYHkdzzUrLODEADMMj+YEJi6+GVLHejPAu4Va5m8rkI51zxutddRnfmG
	 rZMQokXJVXxrUynwFEGUBbog4r2FnXJu/834cMVrfnTJ2zROdK96aZdce098xnwnVX
	 yw3vTEIdZ6XrA==
From: Conor Dooley <conor@kernel.org>
To: netdev@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Ryan.Wanner@microchip.com
Subject: [PATCH net-next v4 00/13] macb usrio/tsu patches
Date: Wed, 18 Mar 2026 16:37:31 +0000
Message-ID: <20260318-surpass-puzzle-f94b46aa8808@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3354; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ixRxbL+6ajZ8OQT5v+uLquAllGh8dKxfO7p3wZv97z8=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm7rpxJPpK842A178372bLM1VvsRZhFMv/9DGrwumC4e Rv7wyChjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk0nNGhm+NrfcPtEx5qbjw 28GNZs4SZe8mhaqKx37at3bLIl2Oy8sY/kdIOprVt5/ulWOIfSe1o/PBh79mp+KZXq1T5+DZ/+z GdEYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_093751_479605_DADC2B35 
X-CRM114-Status: GOOD (  12.10  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCkhleSBmb2xr
cywKCkF0IHRoZSB2ZXJ5IGxlYXN0LCBpdCdkIGJlIGdvb2Qgb2YgdGhlIHNvYyB2ZW5kb3IgZm9s
a3MgY291bGQgY2hlY2sKdGhlaXIgcGxhdGZvcm1zIGFuZCBzZWUgaWYgdGhlaXIgdXNyaW8gc3R1
ZmYgYWN0dWFsbHkgbGluZXMgdXAgd2l0aCB3aGF0CnRoZSBkcml2ZXIgY3VycmVudGx5IGNhbGxz
ICJtYWNiX2RlZmF1bHRfdXNyaW8iLiBPdXJzIGRpZG4ndCBhbmQgaXQgd2FzCmEgbmFzdHkgc3Vy
cHJpc2UuCgpSeWFuIGFuZCBJIGZpZ3VyZWQgb3V0IHRoYXQgdGhlIHNhbWE3ZzUgc3R1ZmYgaXMg
bm90IGFjdHVhbGx5IHVzaW5nIHRoZQpzYW1lIHVzcmlvIGJpdHMgYXMgZWFybGllciBkZXZpY2Vz
LCBzbyB0aGVyZSdzIG5vdyBtb3JlIHBhdGNoZXMgaW4gdGhpcwpzZXJpZXMgdG8gc3BsaXQgdGhl
bSBhcGFydC4gSSd2ZSBub3QgdGVzdGVkIHRoZSBzcGxpdCBvciB0aGUgbmV3CnByb3BlcnR5IGR1
ZSB0byBsYWNrIG9mIGhhcmR3YXJlLCBidXQgUnlhbiBoYXMuCgpNYXJraW5nIHRoaXMgc3R1ZmYg
bmV0LW5leHQsIGJlY2F1c2UgYWx0aG91Z2ggdGhleSdyZSBmaXhlcyBJIGRvbid0IHNlZQphbnkg
cGFydGljdWxhciB1cmdlbmN5LCBhbmQgaXQgYXZvaWRzIGNyZWF0aW5nIHNvbWUgZGVwZW5kZW5j
aWVzIGJldHdlZW4KY2xlYW51cCBpdGVtcyBhbmQgdGhlIGZpeGVzLgoKQ2hlZXJzLApDb25vci4K
CnY0OgotIGRlcHJlY2F0ZSBpbnN0ZWFkIG9mIHJlbW92ZSBleGlzdGluZyBkZXZpY2V0cmVlIHBy
b3BlcnR5Ci0gcGljayB1cCBUaGVvJ3MgcGF0Y2hlcwoKdjM6Ci0gcmVvcmRlciBwYXRjaGVzCi0g
Zml4IHNtYXRjaCBpc3N1ZSByZXBvcnRlZCBieSBTaW1vbgotIGFkZCBwYXRjaGVzIHJld29ya2lu
ZyB1c3JpbyBoYW5kbGluZyBvZiBjbGtlbi9yZWZjbGsgKGFuZCByZW1vdmUgdGhlCiAgaXNzdWUg
dGhlIGxsbSByZXBvcnRlZCBpbiB0aGUgcHJvY2VzcykKLSBhZGQgYSBuZXcgZGV2aWNldHJlZSBw
cm9wZXJ0eSBmb3IgcmVmY2xrIHNlbGVjdGlvbiwgcmVwbGFjaW5nIHRoZQogIGV4aXN0aW5nIG9u
ZS4KLSBkcm9wIHRoZSBkdHMgcGF0Y2gKCkNDOiBWYWxlbnRpbmEuRmVybmFuZGV6QWxhbmlzQG1p
Y3JvY2hpcC5jb20KQ0M6IEFuZHJldyBMdW5uIDxhbmRyZXcrbmV0ZGV2QGx1bm4uY2g+CkNDOiBE
YXZpZCBTLiBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+CkNDOiBFcmljIER1bWF6ZXQgPGVk
dW1hemV0QGdvb2dsZS5jb20+CkNDOiBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPgpD
QzogUGFvbG8gQWJlbmkgPHBhYmVuaUByZWRoYXQuY29tPgpDQzogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4KQ0M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz4K
Q0M6IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz4KQ0M6IERhaXJlIE1jTmFtYXJh
IDxkYWlyZS5tY25hbWFyYUBtaWNyb2NoaXAuY29tPgpDQzogUGF1bCBXYWxtc2xleSA8cGp3QGtl
cm5lbC5vcmc+CkNDOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgpDQzogQWxi
ZXJ0IE91IDxhb3VAZWVjcy5iZXJrZWxleS5lZHU+CkNDOiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhA
Z2hpdGkuZnI+CkNDOiBOaWNvbGFzIEZlcnJlIDxuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20+
CkNDOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2PgpDQzogUmljaGFy
ZCBDb2NocmFuIDxyaWNoYXJkY29jaHJhbkBnbWFpbC5jb20+CkNDOiBTYW11ZWwgSG9sbGFuZCA8
c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KQ0M6IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcKQ0M6
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnCkNDOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnCkNDOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCkNDOiBEYXZlIFN0ZXZlbnNv
biA8ZGF2ZS5zdGV2ZW5zb25AcmFzcGJlcnJ5cGkuY29tPgpDQzogU2VhbiBBbmRlcnNvbiA8c2Vh
bi5hbmRlcnNvbkBsaW51eC5kZXY+CkNDOiBWaW5lZXRoIEthcnVtYW5jaGkgPHZpbmVldGgua2Fy
dW1hbmNoaUBhbWQuY29tPgpDQzogQWJpbiBKb3NlcGggPGFiaW4uam9zZXBoQGFtZC5jb20+CkND
OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgpDQzogUnlhbi5XYW5uZXJA
bWljcm9jaGlwLmNvbQoKQ29ub3IgRG9vbGV5ICgxMCk6CiAgbmV0OiBtYWNiOiByZW5hbWUgbWFj
Yl9kZWZhdWx0X3VzcmlvIHRvIGF0OTFfZGVmYXVsdF91c3JpbyBhcyBub3QgYWxsCiAgICBwbGF0
Zm9ybXMgaGF2ZSBtaWkgbW9kZSBjb250cm9sIGluIHVzcmlvCiAgbmV0OiBtYWNiOiBzcGxpdCBV
U1JJT19IQVNfQ0xLRU4gY2FwYWJpbGl0eSBpbiB0d28KICBkdC1iaW5kaW5nczogbmV0OiBjZG5z
LG1hY2I6IHJlcGxhY2UgY2RucyxyZWZjbGstZXh0IHdpdGgKICAgIGNkbnMscmVmY2xrLXNvdXJj
ZQogIG5ldDogbWFjYjogcmV3b3JrIHVzcmlvIHJlZmNsayBzZWxlY3Rpb24gY29kZQogIG5ldDog
bWFjYjogbnA0IGRvZXNuJ3QgbmVlZCBhIHVzcmlvIHBvaW50ZXIKICBuZXQ6IG1hY2I6IGFkZCBt
cGZzIHNwZWNpZmljIHVzcmlvIGNvbmZpZ3VyYXRpb24KICBuZXQ6IG1hY2I6IHdhcm4gb24gcGNs
ayB1c2UgYXMgYSB0c3VfY2xrIGZhbGxiYWNrCiAgbmV0OiBtYWNiOiBjbGVhbiB1cCB0c3UgY2xr
IHJhdGUgYWNxdWlzaXRpb24KICBkdC1iaW5kaW5nczogbmV0OiBtYWNiOiBhZGQgcHJvcGVydHkg
aW5kaWNhdGluZyB0aW1lciBhZGp1c3QgbW9kZQogIG5ldDogbWFjYjogdGltZXIgYWRqdXN0IG1v
ZGUgaXMgbm90IHN1cHBvcnRlZAoKVGjDqW8gTGVicnVuICgzKToKICBuZXQ6IG1hY2I6IHJ1bnRp
bWUgZGV0ZWN0IE1BQ0JfQ0FQU19VU1JJT19ESVNBQkxFRAogIG5ldDogbWFjYjogc2V0IE1BQ0Jf
Q0FQU19VU1JJT19ESVNBQkxFRCBpZiBubyB1c3JpbyBjb25maWcgaXMgcHJvdmlkZWQKICBuZXQ6
IG1hY2I6IGRyb3AgdXNyaW8gcG9pbnRlciBvbiBFeWVRNSBjb25maWcKCiAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9uZXQvY2RucyxtYWNiLnlhbWwgICAgfCAgNzEgKysrKystCiBkcml2ZXJzL25l
dC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaCAgICAgICAgICAgfCAgIDggKwogZHJpdmVycy9uZXQv
ZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYyAgICAgIHwgMjAyICsrKysrKysrKysrKy0tLS0t
LQogMyBmaWxlcyBjaGFuZ2VkLCAyMTEgaW5zZXJ0aW9ucygrKSwgNzAgZGVsZXRpb25zKC0pCgot
LSAKMi41MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
