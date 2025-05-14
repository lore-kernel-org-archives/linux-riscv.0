Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6DEC3ABD8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 16:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7kVF75+E0kVfttYGVwXxP7Lo0jH69j7YXCDa13sKIU=; b=DAbudNTZXVsAVW
	X/tyDX49sQHC5U4X+6Lkfq0tMob0AOMNItmFELCHBc2yXStR5eKXXDpoatPM9y0GP1il6XC+vfUPC
	mOugbNNipGjtC4e5IOrD/Sg5MK7Rr0sD9zFjhj2+dP7dot5yfmYJqFgiDuHWpJxUgsjTBKiAU34aq
	H2n0k5fXlGZ1FCiu9t3gwj3IYEILD8VUAwACI9KaGs3294wB09g1iP3EXSr3jEyZ9S8U8NRe7pzkG
	VaIRiP4iqm33WvgIunwcb6k0L3cLbHIM2h9s1KfG4HYTNGxGlMia2y1VcAbUeoQF/Ag5SwboChgWR
	wKIF94nTsjspS3HWuTzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFF1a-0000000FlCy-3Wkj;
	Wed, 14 May 2025 16:32:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEQU-0000000FeVW-49Y5
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 15:53:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60D24A4DED0;
	Wed, 14 May 2025 15:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2EDC4CEE3;
	Wed, 14 May 2025 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747238025;
	bh=vUJao5RA1FECEfxSWQAdWVDba5icQlbRNS/+nM7I1XA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y78eKOdRFrLUEiUBM1SjlXL7oRujznCCqxO9wf2G2oOD9TN2Ebo6oDaN8UqBIfxeb
	 aWnLSJptIzyb6deKVSSSaG88mP/gOk6blsI0ixxK0+ugCcbLT1sTUEH+wPSqqoFCzd
	 NrDwhODn1LHwSSlOcsHP+Z2yBK+YWGzd3S51vCqksTihqk7j4GjdvM6dfDYLosMJQC
	 XgEAIne+vE4btJf6fvGkPkSjMIwj7l1TtRocV9S04g7Jz/aJY1+DhtiW03cOXkXjxc
	 sJZ9LtUJAz42jN4OnviELHlaWXL/q9M6Lhuf6E6+CxlrrIShttRlcoaJckbAksStvY
	 mbWRrlg51jbGA==
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tglx@linutronix.de,
	daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tim609@andestech.com
Subject: Re: (subset) [PATCH v4 0/9] add Voyager board support
Date: Wed, 14 May 2025 16:53:34 +0100
Message-ID: <20250514-spherical-spindle-0315375167ea@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250514095350.3765716-1-ben717@andestech.com>
References: <20250514095350.3765716-1-ben717@andestech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=566; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=o01yVTTzZFhpDmtQ1GzGggNP3iMTUpd+Z6Ki8ySZNTY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBkqe2plgqcGXXx24ZJRo7eKQ0z/e+93Vx9a5G6+3NHcd vhTz3+OjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkzURGhpvcXafWN5TLGk0V kuDQE2MseHjPKVR0cfSi1uzww2WX5zEyHFtzLcn4jujdLJevx6ZcnXtsso5DEvskM7Fwjw8iR5f 1cgEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_085347_099521_171E1ADB 
X-CRM114-Status: UNSURE (   8.69  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCk9uIFdlZCwg
MTQgTWF5IDIwMjUgMTc6NTM6NDEgKzA4MDAsIEJlbiBab25nLVlvdSBYaWUgd3JvdGU6Cj4gVGhl
IFZveWFnZXIgaXMgYSA5LjbigJ0geCA5LjbigJ0gTWljcm8gQVRYIGZvcm0gZmFjdG9yIGRldmVs
b3BtZW50IGJvYXJkCj4gaW5jbHVkaW5nIEFuZGVzIFFpTGFpIFNvQy4gVGhpcyBwYXRjaCBzZXJp
ZXMgYWRkcyBtaW5pbWFsIGRldmljZSB0cmVlCj4gZmlsZXMgZm9yIHRoZSBRaUxhaSBTb0MgYW5k
IHRoZSBWb3lhZ2VyIGJvYXJkIFsxXS4KPiAKPiBOb3cgb25seSBzdXBwb3J0IGJhc2ljIHVhcnQg
ZHJpdmVycyB0byBib290IHVwIGludG8gYSBiYXNpYyBjb25zb2xlLiBPdGhlcgo+IGZlYXR1cmVz
IHdpbGwgYmUgYWRkZWQgbGF0ZXIuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gcmlzY3YtY2FjaGUt
Zm9yLW5leHQsIHRoYW5rcyEKCls2LzldIGR0LWJpbmRpbmdzOiBjYWNoZTogYWRkIFFpTGFpIGNv
bXBhdGlibGUgdG8gYXg0NW1wCiAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY29ub3IvYy81
MWIwODFjZGI5MjMKClRoYW5rcywKQ29ub3IuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
