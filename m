Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA94C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 10:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tX/ubNVIC8VC8l5NAtQBzFeaUMRMG8pkTL364JCEkU8=; b=3pYIYeu5pzFU9G
	zfIcOiTf411PCl79ryrOFKijBJn+l76rxTMkMge1HaPtRydxTr2EFgWzVs3waTjMGUpR2Y0YRCWp5
	xvUkblxn+03xHMTkdWFN/ovrtNK6+XzlW8sSiXN74J3cmK8lGmPdBBy0w92xOzeiTj7lIEQbGGlZR
	UIx/EpKpt5OEcxZ7GSYoBaDvUzIHt5nWr90YGIIozx10jgE6or0a7psxuFtTKhiVqyIrLKrecmHU2
	DcLe614fYt05PSWPKDDCGna99FXxeODiMdvBPwO3cZDFJZEJLAW56mxeCW4+3g13ITiZxrIHdGsMT
	2xDfsFR0gU0OZt42s3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHLgK-0000000CMTF-2UuO;
	Wed, 12 Jun 2024 10:58:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHLgH-0000000CMSc-1fF2
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 10:58:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A546BCE0CEF;
	Wed, 12 Jun 2024 10:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57448C3277B;
	Wed, 12 Jun 2024 10:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718189895;
	bh=47DU7S/KIbzHjqDBoxXBhMyQV6hLuFO+cJiT7+VrD4I=;
	h=From:To:Cc:Subject:Date:From;
	b=khTMS+5MJFTFb8yXw4fHZGUMGkTy8jxGN/TYfeg32VavACwiQNP9s2rXch8BHSweR
	 WpHYVXLktmu7p0efcsOa4riHw1M+RVmhP3Me3ta8rbWC6AJU/lwiOM+hi0+4GiNUNZ
	 P0K9IHurqQauRbCFrRwd9pV3E6ueaCUZtyLTMeuDYEGExD5miK96AbcZtdkr98VZ7P
	 UvpL72If+ABOYLaHr68LHClktRQdPDvq3EJ9uN2da6OpFIL051Wh1YWu6VEdqITra7
	 3+x3xedBNEbIRhBfReG4/aw/lEGQu4x9K9hRmoqPtUeX3ht1rr0ilGgB94N8zDO47N
	 djVEKrl4Kl75g==
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
Subject: [PATCH v2 0/2] PCI: microchip: support using either instance 1 or 2
Date: Wed, 12 Jun 2024 11:57:54 +0100
Message-ID: <20240612-outfield-gummy-388a36d95100@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1555; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=zil4c1af9kgKB/4JC67HHkNcqLGWhATVWxa9QRrypgU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmZ9cY/Z7BPfVS3ag4/59Wal/d9DX7mfPdpzvrvbnDi4 qLiUyJKHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIKweG3+zbtq39aFjD7sk7 8V+ZYEja/xMFWuU1Ng8MPi9arCWxkY/hn07HFjfLrHKvyMMr/eSOWAeumNNT8eP6pzWpWxi/12x x4AUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_035817_646965_F9337F5F 
X-CRM114-Status: UNSURE (   7.71  )
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
aW5zdGFuY2UgY2FuIGJlIHVzZWQuCgpDaGVlcnMsCkNvbm9yLgoKdjI6Ci0gdHJ5IHRoZSBuZXcg
cmVnIGZvcm1hdCBiZWZvcmUgdGhlIG9sZCBvbmUgdG8gYXZvaWQgd2FybmluZ3MgaW4gdGhlCiAg
bmV3IGNhc2UKLSByZXdvcmQgJHN1YmplY3QgZm9yIDIvMgoKQ0M6IERhaXJlIE1jTmFtYXJhIDxk
YWlyZS5tY25hbWFyYUBtaWNyb2NoaXAuY29tPgpDQzogTG9yZW56byBQaWVyYWxpc2kgPGxwaWVy
YWxpc2lAa2VybmVsLm9yZz4KQ0M6IEtyenlzenRvZiBXaWxjennFhHNraSA8a3dAbGludXguY29t
PgpDQzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KQ0M6IEJqb3JuIEhlbGdhYXMgPGJo
ZWxnYWFzQGdvb2dsZS5jb20+CkNDOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5l
bC5vcmc+CkNDOiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+CkNDOiBsaW51eC1w
Y2lAdmdlci5rZXJuZWwub3JnCkNDOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwpDQzogbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDQzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwoKQ29ub3IgRG9vbGV5ICgyKToKICBkdC1iaW5kaW5nczogUENJOiBtaWNyb2NoaXAscGNp
ZS1ob3N0OiBmaXggcmVnIHByb3BlcnRpZXMKICBQQ0k6IG1pY3JvY2hpcDogcmV3b3JrIHJlZyBy
ZWdpb24gaGFuZGluZyB0byBzdXBwb3J0IHVzaW5nIGVpdGhlcgogICAgaW5zdGFuY2UgMSBvciAy
CgogLi4uL2JpbmRpbmdzL3BjaS9taWNyb2NoaXAscGNpZS1ob3N0LnlhbWwgICAgIHwgIDEwICst
CiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWljcm9jaGlwLWhvc3QuYyAgfCAxNTUgKysr
KysrKysrLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKyksIDg2IGRl
bGV0aW9ucygtKQoKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
