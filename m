Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907D6C7618D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 20:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ti4mqREXyq+RYm5xPNvZV6sURTEWp4+SDlPBldWAJTY=; b=rDagtDJT2+QMYX
	AWwDovvjHxCXA/GRGkIL4FubjRHi0mjaC8YW7J4cBZ5LyZrXFIeNML/rgWmcHq6QIXRUmqHL9Hm3h
	pigi3DTAfptPc4HA5ONPtZrCTJqiyCuMRnMnpq+8uG4JzteCRbmSEd9oft2cf9ViPEX+f9vvm9P96
	Nc6YanD7ZoQt9j4yZmaKoDZc2SWXJx/QB+8ZiIq9VQiKBu4qkKKH48IFVAY5FMY9S/9wdq6EmBY9K
	rtgApwa+qEyW4DymtmMdfFukfd6PWG4G3o6IWX9szNDLD9sUz3YKPL20WyagvvSajw5iLhqwq/zvl
	S+xiSl4F/J4O5zOpP6Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkWgd-008auE-29;
	Thu, 06 Apr 2023 20:58:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkWgb-008atp-0F
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 20:58:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9FD5D60FCC;
	Thu,  6 Apr 2023 20:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9938C433D2;
	Thu,  6 Apr 2023 20:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680814704;
	bh=6HOP6IWi70A568L3rv60gr7BjPLNKufwgR4g363zP1s=;
	h=From:To:Cc:Subject:Date:From;
	b=Caj1g8/uojLuOyayGUhgyz1d1woHd8qEpIX8/Q4Yo7OJ1eQYccAXbUK93fHD+v1wN
	 JUJeIq/gyULKxun358lE/eBExmJoLmnjpO+7ClH+PH3O32hDpb7JCmcTImc0DeB5py
	 PHFQgkQ8A4ziM26UbBn8dc5gcRzzXGpLfg2bltB54DoCPNaR/1KKt/D0F+0ihsGxUn
	 prqjqhJnYL6fOJEr2n20vq/nxR7gqGGyu3QaXbXXtTWiggGke4y+2ZJSqgd7ESilED
	 kPiVdGaEq46SRubHXWGquQD8NTEmY77tvZWQFFZTsHuENGuUFptbkyHtupLZtwRt+/
	 8hPGdf/w99RRw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v1 0/4] Convert SiFive drivers from SOC_FOO dependencies to ARCH_FOO
Date: Thu,  6 Apr 2023 21:57:46 +0100
Message-Id: <20230406-undertake-stowing-50f45b90413a@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=CGy9TNeI5BNViJ7q9RnyTEdvbyhTHwWrkTZBWg67ltk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCn6Rp7KTiwtnbOXabn3fZn7rJld5NGXqx5tDkaGToyX5 688GnKko5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABOZEMHwV+BQ7DO1leeZfU/x cvxjiQ4v3hV0tORVXMN1xY9bLtmfLmX4n392xQSJgq879c9dupRc8eb7Hb2fvx+ELGC+ffCIsqZ jGBcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_135825_212885_6A99F013 
X-CRM114-Status: GOOD (  10.73  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClJJU0MtVidz
IFNPQ19GT08gc3ltYm9scyBmb3IgbWljcm8tYXJjaHMgYXJlIGdvaW5nIGF3YXksIGFuZCBiZWlu
ZwpyZXBsYWNlZCB3aXRoIHRoZSBtb3JlIGNvbW1vbiBBUkNIX0ZPTyBwYXR0ZXJuIHRoYXQgaXMg
dXNlZCBieSBvdGhlcgphcmNocyAoYW5kIGJ5IHZlbmRvcnMgd2l0aCBhIGhpc3Rvcnkgb3V0c2lk
ZSBvZiBSSVNDLVYpLgpJIGtpY2tlZCB0aGUgY29udmVyc2lvbiBvZmYgYnkgY29udmVydGluZyB0
aGUgTWljcm9jaGlwIFJJU0MtViBiaXRzIHRvCnVzZSB0aGVpciByZXBsYWNlbWVudCBzeW1ib2ws
IHNvIGhlcmUncyByb3VuZCB0d286IHRoZSB2YXJpb3VzIFNpRml2ZQpkcml2ZXJzLgoKVGhlcmUg
YXJlIG5vIGRlcGVuZGVuY2llcyBoZXJlLCBldmVyeXRoaW5nIGNhbiBnbyB2aWEgc3Vic3lzdGVt
IHRyZWVzLgpXZSd2ZSBhbHJlYWR5IGFkZGVkIHRoZSByZXBsYWNlbWVudCBzeW1ib2xzIHRvIFJJ
U0MtVidzIEtjb25maWcgYml0cy4KCkNoZWVycywKQ29ub3IuCgpDQzogTWljaGFlbCBUdXJxdWV0
dGUgPG10dXJxdWV0dGVAYmF5bGlicmUuY29tPgpDQzogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJu
ZWwub3JnPgpDQzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KQ0M6IFBhdWwg
V2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4KQ0M6IExvcmVuem8gUGllcmFsaXNp
IDxscGllcmFsaXNpQGtlcm5lbC5vcmc+CkNDOiBLcnp5c3p0b2YgV2lsY3p5xYRza2kgPGt3QGxp
bnV4LmNvbT4KQ0M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CkNDOiBCam9ybiBIZWxn
YWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgpDQzogQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwu
b3JnPgpDQzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4K
Q0M6IEppcmkgU2xhYnkgPGppcmlzbGFieUBrZXJuZWwub3JnPgpDQzogbGludXgtY2xrQHZnZXIu
a2VybmVsLm9yZwpDQzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpDQzogbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZwpDQzogbGludXgtcGNpQHZnZXIua2VybmVsLm9yZwpDQzog
bGludXgtc2VyaWFsQHZnZXIua2VybmVsLm9yZwoKQ29ub3IgRG9vbGV5ICg0KToKICBjbGs6IHNp
Zml2ZTogbWFrZSBTaUZpdmUgY2xrIGRyaXZlcnMgZGVwZW5kIG9uIEFSQ0hfIHN5bWJvbHMKICBQ
Q0k6IGR3YzogbWFrZSBTaUZpdmUncyBQQ0kgZHJpdmVyIGRlcGVuZCBvbiBBUkNIXyBzeW1ib2xz
CiAgc29jOiBzaWZpdmU6IG1ha2UgU2lGaXZlJ3MgY2FjaGUgY29udHJvbGxlciBkcml2ZXIgZGVw
ZW5kIG9uIEFSQ0hfCiAgICBzeW1ib2xzCiAgc2VyaWFsOiBtYWtlIFNpRml2ZSBzZXJpYWwgZHJp
dmVycyBkZXBlbmQgb24gQVJDSF8gc3ltYm9scwoKIGRyaXZlcnMvY2xrL3NpZml2ZS9LY29uZmln
ICAgICAgICAgfCA2ICsrKy0tLQogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvS2NvbmZpZyB8
IDIgKy0KIGRyaXZlcnMvc29jL3NpZml2ZS9LY29uZmlnICAgICAgICAgfCAyICstCiBkcml2ZXJz
L3R0eS9zZXJpYWwvS2NvbmZpZyAgICAgICAgIHwgNCArKy0tCiA0IGZpbGVzIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
