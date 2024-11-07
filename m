Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AF0D43341
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 11:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Ah9mChYyxMltJhKsWx6jQeWc8pHcRhDRhShPTdQKr0=; b=zwYyhS5OF57G3j
	vbguQHZMWSH4MtdZ1WbebS9i7mRLa0RB5atoFGwuyERdG8qNOlOghkjhncKuXGqVyFbzMW8fiozQz
	508GETLXMK/yXNcMM5Ff/v1HWTgHsdtQlQAApOhAjrawHejNtX370TcY1pJSj+b0ORMKOQ02dWbb5
	30SsXVMSkrjmC+tXPdjTtkWsx+Oo927HwjHg1vwqG63Q7+WQaj6bXzt382BtithDTw7KYl/A3/L6J
	oHFyxxUxjhN9RYeHcrHoq68adqfhL4XrGauroZhp/Cl6tvJ60AKyFHpcVpJtpsUtF+SmdAWC0wKlT
	reYmaakzFVGicjXbngFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90Fi-00000006aMg-3mmd;
	Thu, 07 Nov 2024 11:00:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90Ey-00000006a7y-1er2
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 10:59:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 367795C2736;
	Thu,  7 Nov 2024 10:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFAAC4CECC;
	Thu,  7 Nov 2024 10:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730977191;
	bh=ulJ1Mfc081n2BYrBwoce4yXqUrc0vALnBWkN8KQGmko=;
	h=From:To:Cc:Subject:Date:From;
	b=PG/0YCm+Gk0R9TdATEB0FHWvZYV137vwKutlJMVZZFB97xFyzXQ/iwt63QiSwVCCm
	 gBz6zvnROaYLHBw3Y3KzF+FOlI59P1ux+H43FJnViU6rSazOPNJW3XdZqiiR530uno
	 KL1OrG+2zSWhUK7VgjogS/YGyqWLpG3nD/JppHmAVxHJ4+kCK9X5fH9tCDYFBYPFxm
	 BnvTvQC6mUNvpLIncGMQlShrGlcHHV5J+ogSqqgT4OJLlyVVXgsimec9jXl9jr0tfE
	 BdabkaEmhF1LxidljxPqENQlI+Ax+/zwH+xudTC9VCT2OJ8ifM6sN2E+qSqcVIGzGm
	 4BM99mndAZJ4Q==
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
Subject: [PATCH v6 0/2] PCI: microchip: support using either instance 1 or 2
Date: Thu,  7 Nov 2024 10:59:33 +0000
Message-ID: <20241107-aqueduct-petroleum-c002480ba291@spud>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2148; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=fVyaqmi1x3CSNtda6SlOyTBYUpS/Zg4XH/v6iZNKKks=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOk6c2eXvrmxvr/yfpqwJov3vI4Pvh8/5EoXTJ7DdV9sX 3uW3qdfHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIm4UM/9N3Hk437PF1ea9w 1ma68d9LaW6Zj1flhWu3+W45EVn0bCPDHz6H957n1nvuC0wJ3f/KdpvHoa8S3EnixSLn9nq0p1p N5wIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_025952_546388_34F52EE1 
X-CRM114-Status: UNSURE (   9.32  )
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
aW5zdGFuY2UgY2FuIGJlIHVzZWQuCgpDaGVlcnMsCkNvbm9yLgoKdjY6Ci0gcmV3b3JrIGNvbW1p
dCBtZXNzYWdlcyB0byB1c2UgQmpvcm4ncyBwcmVmZXJyZWQgInJvb3QgcG9ydCIgYW5kICJyb290
CiAgY29tcGxleCIgd29yZGluZwoKdjU6Ci0gcmViYXNlIG9uIHRvcCBvZiA2LjExLXJjMSwgd2hp
Y2ggYnJvdWdodCBhYm91dCBhIGxvdCBvZiBkcml2ZXIgY2hhbmdlCiAgZHVlIHRvIHRoZSBwbGRh
IGNvbW1vbiBkcml2ZXIgY3JlYXRpb24gLSBhbHRob3VnaCBsaXR0bGUgYWN0dWFsbHkKICBjaGFu
Z2VkIGluIHRlcm1zIG9mIHRoZSBsaW5lcyBlZGl0ZWQgaW4gdGhpcyBwYXRjaC4KCnY0OgotIGZp
eCBhIGNvY2NpIHdhcm5pbmcgcmVwb3J0ZWQgb2ZmIGxpc3QgYWJvdXQgYW4gaW5jb25zaXN0ZW50
IHZhcmlhYmxlCiAgdXNlZCBiZXR3ZWVuIElTX0VSUigpIGFuZCBQVFJfRVJSKCkgY2FsbHMuCgp2
MzoKLSByZW5hbWUgYSB2YXJpYWJsZSBpbiBwcm9iZSBzL2F4aS9hcGIvCgp2MjoKLSB0cnkgdGhl
IG5ldyByZWcgZm9ybWF0IGJlZm9yZSB0aGUgb2xkIG9uZSB0byBhdm9pZCB3YXJuaW5ncyBpbiB0
aGUKICBnb29kIGNhc2UKLSByZXdvcmQgJHN1YmplY3QgZm9yIDIvMgoKQ0M6IERhaXJlIE1jTmFt
YXJhIDxkYWlyZS5tY25hbWFyYUBtaWNyb2NoaXAuY29tPgpDQzogTG9yZW56byBQaWVyYWxpc2kg
PGxwaWVyYWxpc2lAa2VybmVsLm9yZz4KQ0M6IEtyenlzenRvZiBXaWxjennFhHNraSA8a3dAbGlu
dXguY29tPgpDQzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KQ0M6IEJqb3JuIEhlbGdh
YXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+CkNDOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0
QGtlcm5lbC5vcmc+CkNDOiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+CkNDOiBs
aW51eC1wY2lAdmdlci5rZXJuZWwub3JnCkNDOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwpD
QzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDQzogbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwoKQ29ub3IgRG9vbGV5ICgyKToKICBkdC1iaW5kaW5nczogUENJOiBtaWNyb2No
aXAscGNpZS1ob3N0OiBmaXggcmVnIHByb3BlcnRpZXMKICBQQ0k6IG1pY3JvY2hpcDogcmV3b3Jr
IHJlZyByZWdpb24gaGFuZGluZyB0byBzdXBwb3J0IHVzaW5nIGVpdGhlciByb290CiAgICBwb3J0
IDEgb3IgMgoKIC4uLi9iaW5kaW5ncy9wY2kvbWljcm9jaGlwLHBjaWUtaG9zdC55YW1sICAgICB8
ICAxMSArLQogLi4uL3BjaS9wbGRhLHhwcmVzc3JpY2gzLWF4aS1jb21tb24ueWFtbCAgICAgIHwg
IDE0ICsrLQogLi4uL2JpbmRpbmdzL3BjaS9zdGFyZml2ZSxqaDcxMTAtcGNpZS55YW1sICAgIHwg
ICA3ICsrCiAuLi4vcGNpL2NvbnRyb2xsZXIvcGxkYS9wY2llLW1pY3JvY2hpcC1ob3N0LmMgfCAx
MTYgKysrKysrKysrLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDg3IGluc2VydGlvbnMoKyks
IDYxIGRlbGV0aW9ucygtKQoKLS0gCjIuNDUuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
