Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84D8CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 18:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMV4cNP5lGvqaiko5dcfPTzjafZXKFXPHj0S6YinIuQ=; b=tRpPcKgEUtClYC
	8QeIdWVh55ROBjfjx8PjsEgbKzdLrucd5CvItEkrgpwF9kfzZY6bcoQ8r4NTQABDNzlmAu34gGU0C
	UleO9ODTd5eywMyGUrEUfJfVbEwGXKvcVP2ufw/v2GDFzYiSzoJzzPH22V9Iodz56Hgtob6IdaEqe
	2KVSVWvD338BPJ7rTfy0iudzfjxYBhv9cT0daHOrfjnQ61O5iVPacOSdp0sj3Uj/iBuMfCvxT6wUK
	uxq9rMgIWt1OF/FEP10NVsNUKqg189GNlYgJAGQoTfQE0LCrYn/2AGo5QObgEXppXzHcKDUVmtmdj
	8C0TBsobohMS+aO4XccQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXSy-00000008oTu-3ZUt;
	Mon, 11 Aug 2025 18:41:52 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUnU-00000008HAz-1WhT;
	Mon, 11 Aug 2025 15:50:53 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so8023266a12.2;
        Mon, 11 Aug 2025 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927451; x=1755532251; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gtZQ94WBszTISCSHtIKTauM3dit5VcpLWsofgTPpah4=;
        b=fFqJafzA13gU+78CW50eoeN2D+zBioIKIdfqCbGtBsNOKyMzFXW04TAL2HJJCrWzCk
         cc9POtW16jwwVqw57ysxvrk/RM7jeCKdRot3xeddu1iNYvV1k43ouzKyiJsZPFJcpNm9
         zw38j3NUXoM0/kNrTbMhHQr0/dvDHf+M+SNv4XrRw7qNG305SUQKlEf4gxNYQ0U89m6n
         1/QhzgC/A57dRCj8H9xtyZNkWdugA6eMZMoSE2SACdsyo9LK/H3i0/grcXFSxp7zM0uH
         bv3fNrafeqOcvcCqiK6Y68XCL072MfB0pRuoeuCfz8qoo46O4AmhL2dqzhk1UEqy9nuE
         9Dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927451; x=1755532251;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtZQ94WBszTISCSHtIKTauM3dit5VcpLWsofgTPpah4=;
        b=C7YB3+voC/AKRszNKDNyNY7ByZq32loJcDOVgVP/zWeCsmIJ7QpR7pIqYloCYx6NkJ
         +D56+adnkl0XFiHtTy3tf2B9hDR2SPJ7PlRbucG7JqsyLFsueCZflPwy+AwIsqTPOh/r
         isR57T2KD4bHopj63FLEK6JUgMUCu81O2V64Re3eOXsu9hWPkx8g+l4I2FLghrWHzRH1
         i8XQVZB/CS1v+UdXTe710ft3eaSslj2yCULmVhla8wytj6aQdAVCKOKQOHs+yRWRCcRv
         zpklXms0CkA1ZoO5dBjZQW5p34bl5tbHicVBMvN+4blvFuITZ7aC9a2+qfcwkfXhuBmr
         /B4A==
X-Forwarded-Encrypted: i=1; AJvYcCU7tpwzxUdExPjSofluBFBgW2z5wN/jpvcM81mPaLF0mgHxu0VJMqToGpm2Hqww0EgmSg5ijAsDe2cd1Cw=@lists.infradead.org, AJvYcCUiQN+EFPItvefOpu7yduok2vI/DBoJyyiNj1lZ8XPnR19s/gAoYVz8TRiB2fGa178qefdYeBqtXT55xMdMkGmeJg==@lists.infradead.org, AJvYcCV4f0vFTrbVchljv9DeI+5arjVtTrTjfzfGgWHdUb1Uo/pC3lF87+cgB9rKdAvOIe92xMYQkY65MVzhO5NurQ4=@lists.infradead.org, AJvYcCVSMSISrV6oFj5ik/oG4Wa3qehCLu250NHd8zwDsEJjKWsQ4afSXhe/KD3X859nN2uPghB9FacffZA3T7uUiWE=@lists.infradead.org, AJvYcCXPesnwBjb9U7HtgqPahb+cQuCR+FzkWjto0enbsSA3uxKVemceg9D+xd4v4S3CH1zaFalIRpokJcU7gDpn@lists.infradead.org
X-Gm-Message-State: AOJu0YzcO91LkIsiWLbR7w8RG2McFAiAKgIxsAt1tZFrCTvsyLZPsBOU
	4k53eIBjqvAHXNQ2i5ie0v7iu6FQhamTvZIj5PGaRfK9ZYvvj4XLmgGc
X-Gm-Gg: ASbGncteGG1q0p/G1m6dYcEg+vsJO2J1gc0xEMrSMdd/71MNpk6SclzolA4XvviZdbH
	cA7DoRa9TSX37RuGWD5qAfvOq5mwvkABKMikUPGoyaxxFFrGrZstD9p+OV7ltFyPMsnSLO+HBdf
	CtiwRknEvcqdcno65NdyIOZkDUPz/X2cdF/NSEtuKnKF8otiP2JQmvonlX8W32qgnv9BuNiNMaU
	ZgJe0gBD363W377/pyOmu77KACKTSNqTv2oMat/IKYj9X6UKDzPl3HfyMVHU1zXJUXj9PkdwhLq
	dEUy6iNacbA06QHA4Q7l84p5GTmbd+kvLNkv1W9O3IhHssEi+m+wJZnfUf3Tj+uzOhw4utjoISy
	5dPN4WmaLJdVlzXenf6AVkAmwQvEo6pAA3ZZrWRqWeVNWv3TnAA==
X-Google-Smtp-Source: AGHT+IHe8ajBJUyXwu1jxvqnFBotZVZqGKDHQgYwFn+fyltnooA7uDIcyyMAL7hOfbd71etw3G4PSg==
X-Received: by 2002:a05:6402:26c2:b0:618:3a61:b1c with SMTP id 4fb4d7f45d1cf-6183a610b1fmr2169187a12.31.1754927450586;
        Mon, 11 Aug 2025 08:50:50 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f000c3sm18680418a12.4.2025.08.11.08.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:50:50 -0700 (PDT)
Message-ID: <d3b0ae61d0bb5dc4e115ace27e1672444ae90d83.camel@gmail.com>
Subject: Re: [PATCH 014/114] clk: ep93xx: convert from round_rate() to
 determine_rate()
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Cristian
 Marussi	 <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto	 <inochiama@gmail.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil	 <paul@crapouillou.net>, Keguang Zhang
 <keguang.zhang@gmail.com>, Taichi Sugaya	 <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>,  Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jacky Huang	
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Vladimir
 Zapolskiy	 <vz@mleia.com>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan	 <dlan@gentoo.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon	
 <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Orson Zhai	
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue	 <alexandre.torgue@foss.st.com>, Michal Simek
 <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, Andreas
 =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,  Manivannan Sadhasivam	
 <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau
 <j@jannau.net>,  Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa
 <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,  Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>,  Romain Perier <romain.perier@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement	
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth	
 <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner
 <heiko@sntech.de>, Andrea della Porta <andrea.porta@suse.com>,  Krzysztof
 Kozlowski	 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi	 <cw00.choi@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Qin Jian	 <qinjian@cqplus1.com>, Viresh Kumar
 <vireshk@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Alex Helms	 <alexander.helms.jy@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>,  Liviu Dudau
 <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Nobuhiro
 Iwamatsu	 <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Date: Mon, 11 Aug 2025 17:50:46 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-14-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-14-b3bf97b038dc@redhat.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_085052_403742_3481738D 
X-CRM114-Status: GOOD (  18.67  )
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

T24gTW9uLCAyMDI1LTA4LTExIGF0IDExOjE4IC0wNDAwLCBCcmlhbiBNYXNuZXkgdmlhIEI0IFJl
bGF5IHdyb3RlOgo+IEZyb206IEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPgo+IAo+
IFRoZSByb3VuZF9yYXRlKCkgY2xrIG9wcyBpcyBkZXByZWNhdGVkLCBzbyBtaWdyYXRlIHRoaXMg
ZHJpdmVyIGZyb20KPiByb3VuZF9yYXRlKCkgdG8gZGV0ZXJtaW5lX3JhdGUoKSB1c2luZyB0aGUg
Q29jY2luZWxsZSBzZW1hbnRpYyBwYXRjaAo+IG9uIHRoZSBjb3ZlciBsZXR0ZXIgb2YgdGhpcyBz
ZXJpZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhhdC5j
b20+CgpSZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5A
Z21haWwuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvY2xrL2Nsay1lcDkzeHguYyB8IDE4ICsrKysr
KysrKystLS0tLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Nsay1lcDkzeHguYyBiL2Ry
aXZlcnMvY2xrL2Nsay1lcDkzeHguYwo+IGluZGV4IDRiZDhkNmVjZjZhMmJkZTI2Mjg3ZTRlOTQ5
YjA2MmE1NjYwMTM5ZTYuLmIwODFlZjkyMGUyNTBkZDk5MTM0YWY2ODQ1YzQ0M2VlMTEyNjZkYTgg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvY2xrLWVwOTN4eC5jCj4gKysrIGIvZHJpdmVycy9j
bGsvY2xrLWVwOTN4eC5jCj4gQEAgLTM4OSwyMyArMzg5LDI1IEBAIHN0YXRpYyB1bnNpZ25lZCBs
b25nIGVwOTN4eF9kaXZfcmVjYWxjX3JhdGUoc3RydWN0IGNsa19odyAqaHcsCj4gwqAJcmV0dXJu
IERJVl9ST1VORF9DTE9TRVNUKHBhcmVudF9yYXRlLCBjbGstPmRpdltpbmRleF0pOwo+IMKgfQo+
IMKgCj4gLXN0YXRpYyBsb25nIGVwOTN4eF9kaXZfcm91bmRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpo
dywgdW5zaWduZWQgbG9uZyByYXRlLAo+IC0JCQkJwqDCoCB1bnNpZ25lZCBsb25nICpwYXJlbnRf
cmF0ZSkKPiArc3RhdGljIGludCBlcDkzeHhfZGl2X2RldGVybWluZV9yYXRlKHN0cnVjdCBjbGtf
aHcgKmh3LAo+ICsJCQkJwqDCoMKgwqAgc3RydWN0IGNsa19yYXRlX3JlcXVlc3QgKnJlcSkKPiDC
oHsKPiDCoAlzdHJ1Y3QgZXA5M3h4X2NsayAqY2xrID0gZXA5M3h4X2Nsa19mcm9tKGh3KTsKPiDC
oAl1bnNpZ25lZCBsb25nIGJlc3QgPSAwLCBub3c7Cj4gwqAJdW5zaWduZWQgaW50IGk7Cj4gwqAK
PiDCoAlmb3IgKGkgPSAwOyBpIDwgY2xrLT5udW1fZGl2OyBpKyspIHsKPiAtCQlpZiAoKHJhdGUg
KiBjbGstPmRpdltpXSkgPT0gKnBhcmVudF9yYXRlKQo+IC0JCQlyZXR1cm4gcmF0ZTsKPiArCQlp
ZiAocmVxLT5yYXRlICogY2xrLT5kaXZbaV0gPT0gcmVxLT5iZXN0X3BhcmVudF9yYXRlKQo+ICsJ
CQlyZXR1cm4gMDsKPiDCoAo+IC0JCW5vdyA9IERJVl9ST1VORF9DTE9TRVNUKCpwYXJlbnRfcmF0
ZSwgY2xrLT5kaXZbaV0pOwo+IC0JCWlmICghYmVzdCB8fCBpc19iZXN0KHJhdGUsIG5vdywgYmVz
dCkpCj4gKwkJbm93ID0gRElWX1JPVU5EX0NMT1NFU1QocmVxLT5iZXN0X3BhcmVudF9yYXRlLCBj
bGstPmRpdltpXSk7Cj4gKwkJaWYgKCFiZXN0IHx8IGlzX2Jlc3QocmVxLT5yYXRlLCBub3csIGJl
c3QpKQo+IMKgCQkJYmVzdCA9IG5vdzsKPiDCoAl9Cj4gwqAKPiAtCXJldHVybiBiZXN0Owo+ICsJ
cmVxLT5yYXRlID0gYmVzdDsKPiArCj4gKwlyZXR1cm4gMDsKPiDCoH0KPiDCoAo+IMKgc3RhdGlj
IGludCBlcDkzeHhfZGl2X3NldF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LCB1bnNpZ25lZCBsb25n
IHJhdGUsCj4gQEAgLTQzNyw3ICs0MzksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19vcHMg
ZXA5M3h4X2Rpdl9vcHMgPSB7Cj4gwqAJLmRpc2FibGUgPSBlcDkzeHhfY2xrX2Rpc2FibGUsCj4g
wqAJLmlzX2VuYWJsZWQgPSBlcDkzeHhfY2xrX2lzX2VuYWJsZWQsCj4gwqAJLnJlY2FsY19yYXRl
ID0gZXA5M3h4X2Rpdl9yZWNhbGNfcmF0ZSwKPiAtCS5yb3VuZF9yYXRlID0gZXA5M3h4X2Rpdl9y
b3VuZF9yYXRlLAo+ICsJLmRldGVybWluZV9yYXRlID0gZXA5M3h4X2Rpdl9kZXRlcm1pbmVfcmF0
ZSwKPiDCoAkuc2V0X3JhdGUgPSBlcDkzeHhfZGl2X3NldF9yYXRlLAo+IMKgfTsKCi0tIApBbGV4
YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
