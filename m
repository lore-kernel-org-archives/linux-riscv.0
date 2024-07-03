Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E583C30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 20:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EhtjJsbyPUgm7+j/5mcUhFk0WRtQXWKTe8ZBfAettUU=; b=fzZjZpjuGMPdEg
	1wMrTOruA9DwU5DzhJwr0wqpX0OF5o4nzL/CeEY/jOfBW3UxkXesMVysyqRRmIz39iXGEk5R0Jtnk
	3zVKnM+5NKfmg/hs89NFkMBU8ZPwbDzAVjQldxwQu/YLT+4BA1tHCvxTSOrEJcajGNBKwXg8zZYhY
	Foicni4p3FU4R7V1lZztQ2dajsssm7T02Swn0QNB8AcNFuEH58CfgI52tZK5DNtvb3MWnS2r0rMDT
	Zzy12InNM+uZM4PL5tpSdPYY/YQBRgzz8X67jFx+nqAaVswOBA3F3lFBppRULc/Nt4AZTxAILor+3
	bdGtBfMGz1HJLZQgDjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP6Hs-0000000BLVY-49JQ;
	Wed, 03 Jul 2024 20:09:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP6Hp-0000000BLUT-4BoK
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 20:09:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 51EFACE2FCE;
	Wed,  3 Jul 2024 20:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094EEC2BD10;
	Wed,  3 Jul 2024 20:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720037342;
	bh=aYbHslMbo5658qwdT3gkCNxpaGZS1ogTj90k1s36n8M=;
	h=From:To:Cc:Subject:Date:From;
	b=uanslunZzMpUHeaPZtIAM39fLDSvTd1CwE9fVzu8B5nqpbjKgU/SQ6b4DISEy0yZb
	 HVsZ6IZqzBzpihZE6wCzy66hurceQj89cdo2PwEnzzIi6e81l3wD3jBOTbTEWWbtFW
	 x73RPVSKxoZAQ5zuJ/RYb2hXnPQ/Zawg73DdTJ/IGrkJKk6BfkCQ7ZtnhA2sDgWXHK
	 b2uF/7ZT9VU1EjQBv6zVkvTjoHuHLkHO1fmjZMmEjgU3FeUokuJzkbhFc+o3W/Ma1M
	 phQOwB5xuCdI8w1NdngTACZWbgrimvWNgToTe2IDDWybFRRGgDJnPPPGi59YvZD+wz
	 MbJDpsWIJZ4HA==
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
Subject: [PATCH v4 0/2] PCI: microchip: support using either instance 1 or 2
Date: Wed,  3 Jul 2024 21:08:44 +0100
Message-ID: <20240703-stand-ferocity-bac033ac70b1@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=nUAy4lu9tNjB0mh9nOJJDmgdT1HtV+a+iNjY3WPTG04=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmt66/+UGL/e0tL6N9S2cu/zXy/nQg/95Eh/U36NvX85 NjPT06zd5SyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiMxcwMjxI2bTLN+DissjL GY3fwsR/2cj7hPZJz53Udn/2xj8v9aYzMjxtEBFIXfByd+4iR5XPHKxrrVOmLDO0yZq97CH3Aa+ HfzkB
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_130906_235846_B9C0CEA2 
X-CRM114-Status: UNSURE (   8.26  )
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
aW5zdGFuY2UgY2FuIGJlIHVzZWQuCgpDaGVlcnMsCkNvbm9yLgoKdjQ6Ci0gZml4IGEgY29jY2kg
d2FybmluZyByZXBvcnRlZCBvZmYgbGlzdCBhYm91dCBhbiBpbmNvbnNpc3RlbnQgdmFyaWFibGUK
ICB1c2VkIGJldHdlZW4gSVNfRVJSKCkgYW5kIFBUUl9FUlIoKSBjYWxscy4KCnYzOgotIHJlbmFt
ZSBhIHZhcmlhYmxlIGluIHByb2JlIHMvYXhpL2FwYi8KCnYyOgotIHRyeSB0aGUgbmV3IHJlZyBm
b3JtYXQgYmVmb3JlIHRoZSBvbGQgb25lIHRvIGF2b2lkIHdhcm5pbmdzIGluIHRoZQogIGdvb2Qg
Y2FzZQotIHJld29yZCAkc3ViamVjdCBmb3IgMi8yCgpDQzogRGFpcmUgTWNOYW1hcmEgPGRhaXJl
Lm1jbmFtYXJhQG1pY3JvY2hpcC5jb20+CkNDOiBMb3JlbnpvIFBpZXJhbGlzaSA8bHBpZXJhbGlz
aUBrZXJuZWwub3JnPgpDQzogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxrd0BsaW51eC5jb20+CkND
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDQzogQmpvcm4gSGVsZ2FhcyA8YmhlbGdh
YXNAZ29vZ2xlLmNvbT4KQ0M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9y
Zz4KQ0M6IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz4KQ0M6IGxpbnV4LXBjaUB2
Z2VyLmtlcm5lbC5vcmcKQ0M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnCkNDOiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnCkNDOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
CgpDb25vciBEb29sZXkgKDIpOgogIGR0LWJpbmRpbmdzOiBQQ0k6IG1pY3JvY2hpcCxwY2llLWhv
c3Q6IGZpeCByZWcgcHJvcGVydGllcwogIFBDSTogbWljcm9jaGlwOiByZXdvcmsgcmVnIHJlZ2lv
biBoYW5kaW5nIHRvIHN1cHBvcnQgdXNpbmcgZWl0aGVyCiAgICBpbnN0YW5jZSAxIG9yIDIKCiAu
Li4vYmluZGluZ3MvcGNpL21pY3JvY2hpcCxwY2llLWhvc3QueWFtbCAgICAgfCAgMTAgKy0KIGRy
aXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1taWNyb2NoaXAtaG9zdC5jICB8IDE1NSArKysrKysr
KystLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNzkgaW5zZXJ0aW9ucygrKSwgODYgZGVsZXRp
b25zKC0pCgotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
