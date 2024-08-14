Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB7CC52D7F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 08:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0gMAYhxiaZninTloMPd6NkvRrni4A8u75AW0oiwdGx0=; b=Rsn0smHarMP3O1
	gDxe4W+GEu8G3vY7OfDnKilaV+ZeWEP+Osm36Dv1gzsKHb8pvmebBZH9LvoiKkU51SGYJkEwvXrJG
	zBs2s8QxS7lOOKkJ1LtpIAi49ESnRqG6b1IT1gzc1jwl/8pN0KWyf4ORBk+OT1FTUoAS86YQMwQ25
	XQMEDXZesCvVqwbRsdhpTzL2bA5V+Py/hPsTZra6R+fT1lHSwBDUb/H7aAVlo4nDr95SxVgcq0wzw
	KjvS6O0qnmw3d02SoOx7kXoia5MBdjEgv1koE3C6RyvCuV/s3LJXxT5Ew3aXlPYfgCxdhbzRf4UaW
	e6AEmCJZacRO77jZakJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se94N-00000006B7i-0W8p;
	Wed, 14 Aug 2024 08:09:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se94J-00000006B6q-3sAb
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:09:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6996461920;
	Wed, 14 Aug 2024 08:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8663EC32786;
	Wed, 14 Aug 2024 08:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723622959;
	bh=+tqs6o2jIS/Xoflq9ps38miVMDp8z82qkSyMMzRu+wk=;
	h=From:To:Cc:Subject:Date:From;
	b=XL5FPnVS0XG3jZaQ2fxN9roq8cXM1UZgQsp4125Lpwj5Y5tDS5bEvyGFzF9HRtgAv
	 46UuzBbbcl6yWZnUtB5Bp5JOpnXtZ1bcXFVgulp6aLOc0+9grH0pJ/43jyGJgjqP7C
	 RZohY78Pe3SaTukhlMn/ULK/71mWywZhFFQvR2Ot28qzxSSi3EOxyMxZ0IgANaIajF
	 rtZu2myiysFS/Yn8qtrOCzVJHoyVdindo+OOwZ7YMsj55609AVXBMRKtFXl/vVnk9P
	 w8oxVH1ZY4x12KiZkzkkneveTB4XO0iSVeE7qeWdGd9/up9lOwv0xAmfewwwffIFWm
	 fkrPeqS2v+yyA==
From: Conor Dooley <conor@kernel.org>
To: linux-pci@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/2] PCI: microchip: support using either instance 1 or 2
Date: Wed, 14 Aug 2024 09:08:40 +0100
Message-ID: <20240814-setback-rumbling-c6393c8f1a91@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2047; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=oenr9RCh/D6LfU/4KK35V3BOr+N0Qxe0IOLLSKy4LD8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGl70jg+RjA47pJwV3uk0HOPS0k6de0TVcO1UZ+0/O78q hfMu9rVUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgInU7Gf473jEo1uzcPbRvStF WDV9Cgyf2yXp67kq1MslvV3+1nX6YkaG/VrHH8iy/toZ+EleuublDx1WXkE9fW+Hojcav5c4yuz nAAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_010920_071820_84E4F130 
X-CRM114-Status: UNSURE (   9.44  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClRoZSBjdXJy
ZW50IGRyaXZlciBhbmQgYmluZGluZyBmb3IgUG9sYXJGaXJlIFNvQydzIFBDSSBjb250cm9sbGVy
IGFzc3VtZQp0aGF0IHRoZSByb290IHBvcnQgaW5zdGFuY2UgaW4gdXNlIGlzIGluc3RhbmNlIDEu
IFRoZSBzZWNvbmQgcmVnCnByb3BlcnR5IGNvbnN0aXR1dGVzIHRoZSByZWdpb24gZW5jb21wYXNz
aW5nIGJvdGggImNvbnRyb2wiIGFuZCAiYnJpZGdlIgpyZWdpc3RlcnMgZm9yIGJvdGggaW5zdGFu
Y2VzLiBJbiB0aGUgZHJpdmVyLCBhIGZpeGVkIG9mZnNldCBpcyBhcHBsaWVkIHRvCmZpbmQgdGhl
IGJhc2UgYWRkcmVzc2VzIGZvciBpbnN0YW5jZSAxJ3MgImNvbnRyb2wiIGFuZCAiYnJpZGdlIgpy
ZWdpc3RlcnMuIFRoZSBCZWFnbGVWIEZpcmUgdXNlcyByb290IHBvcnQgaW5zdGFuY2UgMiwgc28g
c29tZXRoaW5nIG11c3QKYmUgZG9uZSBzbyB0aGF0IHNvZnR3YXJlIGNhbiBkaWZmZXJlbnRpYXRl
LiBUaGlzIHNlcmllcyBzcGxpdHMgdGhlCnNlY29uZCByZWcgcHJvcGVydHkgaW4gdHdvLCB3aXRo
IGRlZGljYXRlZCAiY29udHJvbCIgYW5kICJicmlkZ2UiCmVudHJpZXMgc28gdGhhdCBlaXRoZXIg
aW5zdGFuY2UgY2FuIGJlIHVzZWQuCgpDaGVlcnMsCkNvbm9yLgoKdjU6Ci0gcmViYXNlIG9uIHRv
cCBvZiA2LjExLXJjMSwgd2hpY2ggYnJvdWdodCBhYm91dCBhIGxvdCBvZiBkcml2ZXIgY2hhbmdl
CiAgZHVlIHRvIHRoZSBwbGRhIGNvbW1vbiBkcml2ZXIgY3JlYXRpb24gLSBhbHRob3VnaCBsaXR0
bGUgYWN0dWFsbHkKICBjaGFuZ2VkIGluIHRlcm1zIG9mIHRoZSBsaW5lcyBlZGl0ZWQgaW4gdGhp
cyBwYXRjaC4KCnY0OgotIGZpeCBhIGNvY2NpIHdhcm5pbmcgcmVwb3J0ZWQgb2ZmIGxpc3QgYWJv
dXQgYW4gaW5jb25zaXN0ZW50IHZhcmlhYmxlCiAgdXNlZCBiZXR3ZWVuIElTX0VSUigpIGFuZCBQ
VFJfRVJSKCkgY2FsbHMuCgp2MzoKLSByZW5hbWUgYSB2YXJpYWJsZSBpbiBwcm9iZSBzL2F4aS9h
cGIvCgp2MjoKLSB0cnkgdGhlIG5ldyByZWcgZm9ybWF0IGJlZm9yZSB0aGUgb2xkIG9uZSB0byBh
dm9pZCB3YXJuaW5ncyBpbiB0aGUKICBnb29kIGNhc2UKLSByZXdvcmQgJHN1YmplY3QgZm9yIDIv
MgoKQ0M6IERhaXJlIE1jTmFtYXJhIDxkYWlyZS5tY25hbWFyYUBtaWNyb2NoaXAuY29tPgpDQzog
TG9yZW56byBQaWVyYWxpc2kgPGxwaWVyYWxpc2lAa2VybmVsLm9yZz4KQ0M6IEtyenlzenRvZiBX
aWxjennFhHNraSA8a3dAbGludXguY29tPgpDQzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4KQ0M6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+CkNDOiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+CkNDOiBDb25vciBEb29sZXkgPGNvbm9yK2R0
QGtlcm5lbC5vcmc+CkNDOiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnCkNDOiBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZwpDQzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDQzogbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwoKQ29ub3IgRG9vbGV5ICgyKToKICBkdC1iaW5k
aW5nczogUENJOiBtaWNyb2NoaXAscGNpZS1ob3N0OiBmaXggcmVnIHByb3BlcnRpZXMKICBQQ0k6
IG1pY3JvY2hpcDogcmV3b3JrIHJlZyByZWdpb24gaGFuZGluZyB0byBzdXBwb3J0IHVzaW5nIGVp
dGhlcgogICAgaW5zdGFuY2UgMSBvciAyCgogLi4uL2JpbmRpbmdzL3BjaS9taWNyb2NoaXAscGNp
ZS1ob3N0LnlhbWwgICAgIHwgIDExICstCiAuLi4vcGNpL3BsZGEseHByZXNzcmljaDMtYXhpLWNv
bW1vbi55YW1sICAgICAgfCAgMTQgKystCiAuLi4vYmluZGluZ3MvcGNpL3N0YXJmaXZlLGpoNzEx
MC1wY2llLnlhbWwgICAgfCAgIDcgKysKIC4uLi9wY2kvY29udHJvbGxlci9wbGRhL3BjaWUtbWlj
cm9jaGlwLWhvc3QuYyB8IDExNiArKysrKysrKystLS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwg
ODcgaW5zZXJ0aW9ucygrKSwgNjEgZGVsZXRpb25zKC0pCgotLSAKMi40My4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
