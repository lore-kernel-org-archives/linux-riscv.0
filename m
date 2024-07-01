Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027C3C30653
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oL6LrYNKWj/0x0pVpUnpgHe1f/aZyqYr4DFSJIlyB3k=; b=rP2MMD5pqHF+Aw
	holtS4CPhvGT3r/I3LAzD4fIe8mVO9x4FMJNxYcQKPkmbMFemM63Jq/eV3A+aGDvker/0G12kGnKO
	PDO6J5YJ5QIrGHI5U3d+rY7FJgRi777CmJ3l6i/BBuBLhyb7CsBbcIlHvkeMlkTqi3wqSfrGLFnhQ
	X4Uh/hQufOMKpjycDmfr9h5AJsSSy0SLtUI/BSvBv0/9ZL9TIaTAY1wZ2/bM2+LfQR+/8HCcTCXWQ
	oJ+rMbNLEdJ98vQTRzvixTs1FhAMF5kzBovinDoR+Qu/gQoLnYgJegyUajxFtcYC99um/LOlGZHq9
	jW6VbPVkyM15KnTnyeug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOEB3-00000002deB-2bZI;
	Mon, 01 Jul 2024 10:22:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOEB1-00000002dcp-0gQa
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 10:22:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2C6B2CE116E;
	Mon,  1 Jul 2024 10:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E660EC116B1;
	Mon,  1 Jul 2024 10:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719829344;
	bh=lILPFujAusSuBTPER4NperHFzpZF4Joa/IjBo7MTe2A=;
	h=From:To:Cc:Subject:Date:From;
	b=k1vuLZrA1BxXnG7EmaOnQoLNLn5zL09PvdR2NWvoacYbl5o07GdTGO5Svz5pU5X5Z
	 rEtZZ06ZbJwZQs0WCWmw0b/4Z+pZUapkEzrbllXSTkhr1l6cihw2helBls4bUAfkEH
	 qnV+7/dJzEqzrfWVSmlhADxODnygQJfOFIS14Ftq9lo4FOEefr5rMo9GgX7bjEv4oL
	 0NYs2szFNXCtlOFR61fFoS5doADt6s627sWblQhVCZn83BUYtfE+rIS4jv8T8JEyM4
	 n0TGGnIHwsjj4E2o0LUx74e94b7NnVFuWcCdc7xPW7eJkRldalvvUjekjthmSg6t2o
	 0+waEe6BBvqBg==
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
Subject: [PATCH v3 0/2] PCI: microchip: support using either instance 1 or 2
Date: Mon,  1 Jul 2024 11:22:10 +0100
Message-ID: <20240701-plant-tycoon-db11909036e6@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6PYNzTuci0j48BqrGaPbxVulQndcuM5qX19cbMOrGKs=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlNzSGxAkwT7vw8zzWp9Zl3083UF5P9cyq9ckv3ss/9u kvvPpNSRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTAC6SwPDP8pfk4eU99WLKit+i erx0ni3XSV643SbucvP/3AX1ucarGBnmxny/NM9ecNmV4zPTb+yxkPy/y0Z37i+26xO/c3svOf6 cBQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_032227_405136_F96BBD29 
X-CRM114-Status: UNSURE (   8.25  )
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
aW5zdGFuY2UgY2FuIGJlIHVzZWQuCgpDaGVlcnMsCkNvbm9yLgoKdjM6Ci0gcmVuYW1lIGEgdmFy
aWFibGUgaW4gcHJvYmUgcy9heGkvYXBiLwoKdjI6Ci0gdHJ5IHRoZSBuZXcgcmVnIGZvcm1hdCBi
ZWZvcmUgdGhlIG9sZCBvbmUgdG8gYXZvaWQgd2FybmluZ3MgaW4gdGhlCiAgZ29vZCBjYXNlCi0g
cmV3b3JkICRzdWJqZWN0IGZvciAyLzIKCkNDOiBEYWlyZSBNY05hbWFyYSA8ZGFpcmUubWNuYW1h
cmFAbWljcm9jaGlwLmNvbT4KQ0M6IExvcmVuem8gUGllcmFsaXNpIDxscGllcmFsaXNpQGtlcm5l
bC5vcmc+CkNDOiBLcnp5c3p0b2YgV2lsY3p5xYRza2kgPGt3QGxpbnV4LmNvbT4KQ0M6IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CkNDOiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29n
bGUuY29tPgpDQzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPgpDQzog
Q29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPgpDQzogbGludXgtcGNpQHZnZXIua2Vy
bmVsLm9yZwpDQzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKQ0M6IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcKQ0M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKCkNvbm9y
IERvb2xleSAoMik6CiAgZHQtYmluZGluZ3M6IFBDSTogbWljcm9jaGlwLHBjaWUtaG9zdDogZml4
IHJlZyBwcm9wZXJ0aWVzCiAgUENJOiBtaWNyb2NoaXA6IHJld29yayByZWcgcmVnaW9uIGhhbmRp
bmcgdG8gc3VwcG9ydCB1c2luZyBlaXRoZXIKICAgIGluc3RhbmNlIDEgb3IgMgoKIC4uLi9iaW5k
aW5ncy9wY2kvbWljcm9jaGlwLHBjaWUtaG9zdC55YW1sICAgICB8ICAxMCArLQogZHJpdmVycy9w
Y2kvY29udHJvbGxlci9wY2llLW1pY3JvY2hpcC1ob3N0LmMgIHwgMTU1ICsrKysrKysrKy0tLS0t
LS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA3OSBpbnNlcnRpb25zKCspLCA4NiBkZWxldGlvbnMoLSkK
Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
