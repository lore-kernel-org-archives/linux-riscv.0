Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748BCC71141
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jun 2025 11:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLHeGrn68GPPTaw/K7JYH2SFhi/sKMp0A/64tfoaAGg=; b=pH5ho7xl9Yftuu
	eA9JVeNMfdiY4pK1Lqo86FcAQ2gfMYd4GotjOU1xFAPAMGGckuRe3f84aJ+aloXIRA86etSS9X0dD
	7DzrOfG53gk87XaM8mr3eCrRzbPq0VWZpEQGj9OlVvhIdk8rdc5CS7R4pv8vRR3QWCti+rSCj2wqV
	y4g3/aWGWycQMwP5I9KnB0ck6/1zHqimVUT3Qke7HDq5xO6KZusEE0ishO56prppEvDVtz7pYlRur
	G6fXMduJZzIWnkmx9Knd2DahwV+VJODeny25fKtI0Ydp9X63sQDn4V0umrCYM1kXr98QoZYbV4R2e
	Q0DojfRnT7LCOlH0169Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQOxI-00000001BG2-1mui;
	Sat, 14 Jun 2025 11:21:48 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQOsw-00000001AvZ-1d2a
	for linux-riscv@lists.infradead.org;
	Sat, 14 Jun 2025 11:17:19 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id B6E69240027
	for <linux-riscv@lists.infradead.org>; Sat, 14 Jun 2025 13:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net;
	s=1984.ea087b; t=1749899832;
	bh=d4gNp/0M9SMRUX5Vo9jyFaZjMh959oqzUg9NU3r341s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=Lca7QKh6j957WM9z2uGhxtJ0SvljdRqwb2jlCuWb67exWTonQombxmqnjTCtYsFh5
	 6wowc8OD7y1uR6Sw0DHc7nc4rp52t+Rbn3jb8JHD0rUjXbYpYuHB6gfPsHghCVQg1k
	 eoJ2CP6AwhUzFU59QB2uLKmOd0CwOSpJvr0YtHsIyquoZKeJuhyOZNpWCPA4H4ipdP
	 KEYfc6osVgjdgmG7N53P3rDmLbHF3QmOvxWttVVH1aYepo6ts9ge+t/1ITkpW3xiIE
	 OHDYljxwR+Lhl8ZCW+tPbDXSFrQr2DSLCWhJX3lyb+i+/pdDQS+Ax41Ro/PF3TLz9K
	 y2dTiXxYmjplrVYGQDEaSFRCtGqFFCT9vExXL/7K/c1Y2Z6bK2+IJ6VSkVp5GvKZjh
	 Bn/uUwVyKxJfvKsYREBojzFDxPlooV9wHrXo+vNfSvVFZ3+IvmSSjjFfG6mUDw76eY
	 lsDFOq2AlyLTUZ+oeOO8HjF1lzN2TVUesC7UWC4oFZB9vL+7jLv
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bKDHh1hfPz6tsf;
	Sat, 14 Jun 2025 13:17:04 +0200 (CEST)
Date: Sat, 14 Jun 2025 11:17:03 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Michal Simek <michal.simek@amd.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 06/17] pinctrl: nuvoton: Constify static 'pinctrl_desc'
Message-ID: <aE1aL_ff1230w2DL@probook>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
 <20250611-pinctrl-const-desc-v2-6-b11c1d650384@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611-pinctrl-const-desc-v2-6-b11c1d650384@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_041718_701479_B4AFDEB5 
X-CRM114-Status: GOOD (  14.60  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgMDg6MTM6MzhBTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBUaGUgbG9jYWwgc3RhdGljICdzdHJ1Y3QgcGluY3RybF9kZXNjJyBpcyBu
b3QgbW9kaWZpZWQsIHNvIGNhbiBiZSBtYWRlCj4gY29uc3QgZm9yIGNvZGUgc2FmZXR5Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lA
bGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0
PgoKVGhhbmtzIQoKCj4gLS0tCj4gIGRyaXZlcnMvcGluY3RybC9udXZvdG9uL3BpbmN0cmwtbnBj
bTd4eC5jIHwgMiArLQo+ICBkcml2ZXJzL3BpbmN0cmwvbnV2b3Rvbi9waW5jdHJsLW5wY204eHgu
YyB8IDIgKy0KPiAgZHJpdmVycy9waW5jdHJsL251dm90b24vcGluY3RybC13cGNtNDUwLmMgfCAy
ICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbnV2b3Rvbi9waW5jdHJsLW5wY203eHgu
YyBiL2RyaXZlcnMvcGluY3RybC9udXZvdG9uL3BpbmN0cmwtbnBjbTd4eC5jCj4gaW5kZXggZGZk
MzJmZWIzNDI4NmI3YTRkODA3ZTkwMzNhMTFmNTA3ZTI3N2RjZS4uYjg4NzJkOGY1OTMwYWQ5MzFk
YWQyMDhhZmVjNGUwOGEyM2MzZDY1MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvbnV2
b3Rvbi9waW5jdHJsLW5wY203eHguYwo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9udXZvdG9uL3Bp
bmN0cmwtbnBjbTd4eC5jCj4gQEAgLTE4MTcsNyArMTgxNyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcGluY29uZl9vcHMgbnBjbTd4eF9waW5jb25mX29wcyA9IHsKPiAgfTsKPiAgCj4gIC8qIHBp
bmN0cmxfZGVzYyAqLwo+IC1zdGF0aWMgc3RydWN0IHBpbmN0cmxfZGVzYyBucGNtN3h4X3BpbmN0
cmxfZGVzYyA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBwaW5jdHJsX2Rlc2MgbnBjbTd4eF9w
aW5jdHJsX2Rlc2MgPSB7Cj4gIAkubmFtZSA9ICJucGNtN3h4LXBpbmN0cmwiLAo+ICAJLnBpbnMg
PSBucGNtN3h4X3BpbnMsCj4gIAkubnBpbnMgPSBBUlJBWV9TSVpFKG5wY203eHhfcGlucyksCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9udXZvdG9uL3BpbmN0cmwtbnBjbTh4eC5jIGIv
ZHJpdmVycy9waW5jdHJsL251dm90b24vcGluY3RybC1ucGNtOHh4LmMKPiBpbmRleCBiZTNkYjhh
YjQwNmM0MTZmMDcwOWQwNmViODY0ZTMzZTMyMDg1NDFhLi4zYzNiOWQ4ZDM2ODFjNjRjMjE5Mjc2
MTVlMWJiNDlmMTU3ZjE1NmI1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9udXZvdG9u
L3BpbmN0cmwtbnBjbTh4eC5jCj4gKysrIGIvZHJpdmVycy9waW5jdHJsL251dm90b24vcGluY3Ry
bC1ucGNtOHh4LmMKPiBAQCAtMjI5OSw3ICsyMjk5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBw
aW5jb25mX29wcyBucGNtOHh4X3BpbmNvbmZfb3BzID0gewo+ICB9Owo+ICAKPiAgLyogcGluY3Ry
bF9kZXNjICovCj4gLXN0YXRpYyBzdHJ1Y3QgcGluY3RybF9kZXNjIG5wY204eHhfcGluY3RybF9k
ZXNjID0gewo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBpbmN0cmxfZGVzYyBucGNtOHh4X3BpbmN0
cmxfZGVzYyA9IHsKPiAgCS5uYW1lID0gIm5wY204eHgtcGluY3RybCIsCj4gIAkucGlucyA9IG5w
Y204eHhfcGlucywKPiAgCS5ucGlucyA9IEFSUkFZX1NJWkUobnBjbTh4eF9waW5zKSwKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL251dm90b24vcGluY3RybC13cGNtNDUwLmMgYi9kcml2
ZXJzL3BpbmN0cmwvbnV2b3Rvbi9waW5jdHJsLXdwY200NTAuYwo+IGluZGV4IDQyNjRjYTc0OTE3
NWEyY2UwZjM2MDNjMWQ3YWEyNzFkOThlNmNkODkuLjhkODMxNGJhMGU0Y2I1NWRiMmIxZDNhZGYy
ZGUwN2U2ZmI5M2MyNzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL251dm90b24vcGlu
Y3RybC13cGNtNDUwLmMKPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvbnV2b3Rvbi9waW5jdHJsLXdw
Y200NTAuYwo+IEBAIC05ODksNyArOTg5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwaW5jb25m
X29wcyB3cGNtNDUwX3BpbmNvbmZfb3BzID0gewo+ICAJLnBpbl9jb25maWdfc2V0ID0gd3BjbTQ1
MF9jb25maWdfc2V0LAo+ICB9Owo+ICAKPiAtc3RhdGljIHN0cnVjdCBwaW5jdHJsX2Rlc2Mgd3Bj
bTQ1MF9waW5jdHJsX2Rlc2MgPSB7Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGluY3RybF9kZXNj
IHdwY200NTBfcGluY3RybF9kZXNjID0gewo+ICAJLm5hbWUgPSAid3BjbTQ1MC1waW5jdHJsIiwK
PiAgCS5waW5zID0gd3BjbTQ1MF9waW5zLAo+ICAJLm5waW5zID0gQVJSQVlfU0laRSh3cGNtNDUw
X3BpbnMpLAo+IAo+IC0tIAo+IDIuNDUuMgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
