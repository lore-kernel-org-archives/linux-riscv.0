Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D72CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 18:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPi80XfmndxBDCkHZG55/UTl0rib6aa7bl4qnKLWD30=; b=n5H/t20kCFfSXn
	D1Xag0JhSiuXwND+CLeJ062Ui07Rl8LXV6psMqVvoFyposvjxJXn8EVXsrw2fZXK97sy5XQugTzlC
	ZFY96yLadPizaeP5otbmBVjlEjyya9YFaHat9zVZ0vojgt03Iv+PKGqtFXqPzppummptbX4RtEXwL
	PqUg2CyKHqZkFTcJzpb1gnzkkhAXzr5bVMxQ+PMtsCFJhgqQxSWazalBA01u6B8rWrNzIb5ENRjHj
	CVRt2qG4Q1e4VoBCALXOVcHULzsW9J9olVR6bhNYpsS4fhTibQ+JpLdtqSoJ4n/4eTrDcCDbRyDy7
	EtMus6Cg1ocdMyko+CIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXKs-00000008nV1-3IiC;
	Mon, 11 Aug 2025 18:33:30 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUZG-00000008DYM-3Y98;
	Mon, 11 Aug 2025 15:36:12 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-af922ab4849so671360266b.3;
        Mon, 11 Aug 2025 08:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754926569; x=1755531369; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o2PLgwzqCzU4aYsyzpQU8Pmm9EwNqnw9dQ2/FdBe/4E=;
        b=kBBTbMxBTRFYNRLnazEc3vv/XUp/2gpLF/2R7qyf/x+XUdwLXeECgMw6MVToYRBNTn
         tGyWGlwZ0Q0kuMHeyizbfPfMRIVUwaAT9SAwdVMIOrfLOU2cSJ1DD3Niw5wrjL5AJ22M
         URXIiFxpQKBQlHRT8hTw/ofbbvqT2W48B9cxmyICBxQ9+ECzx6Xn/Po5YNKoixs/L7VM
         rVXwciyO8qW22kqiq7Yvx8FODGORWgv5pTZECi0dYWEwDls2VaJypICskSRzw+CNK3nr
         o2FkGNbJf3tK++r0omAsZL4xFhnzhWZRahKvk310CWOArbldPR2i8FmKYgoLdOAx/J6k
         4BGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926569; x=1755531369;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2PLgwzqCzU4aYsyzpQU8Pmm9EwNqnw9dQ2/FdBe/4E=;
        b=BRQ3E1A4aIG3at96FnqgNIbQ/aMvCb6EMQVx7AJdixaodU8Bm46EnyevAJOfItnk9s
         Eb5LXdFDxOYBzOa93thQarFNPTmnYnyKvJeGHGiJ8JcfT5zDgpfD9eK12gHGE5dzjNQ6
         SONGuT7KiGqvZ0iHx8Fsf3QVbvedyfV/rBb1PKciBL2Ohye9Iu+KQhQO+RxLAIJvcPvp
         A9ZfYPqWeaUhGCBXj4NIEciKYneX49CbO4zhzR7mMH/WoH4hhlIUXCwMdTTnRgZk1VlJ
         XeenBpT4/VH5H7h3KWqNf7Jx3Vl4EGl6D/RvB826PQSTek8AiGW0Oa08U8p2CnHwCAXk
         6PyA==
X-Forwarded-Encrypted: i=1; AJvYcCUuzs0JGZwryEpqgaShDKwn6+K8ZV9p1IMMbt1rUh/MdOFSZpq+xmpKjoT79SQfFX8OU27Z/H3EKxJ//3/W53A=@lists.infradead.org, AJvYcCV307DQe9jWGiR1DoJ94NeI9lWN1r+zQJC91FNuvuBvkxOjTTIrbZ6x9kt0xLDUnQ8IP7tbDGyvBcVJDjE=@lists.infradead.org, AJvYcCVf0jf71Az3HvgHI8zmPAzAE49h+akzZ6GqkUipcs+2HBIX257CIlD6V1KzUJNsxUsbKi3QAO918ph1LNED244Jog==@lists.infradead.org, AJvYcCW6r+wjgvt9DKfTyo3SRO+2MMYGymJV9UeaW/NSd9v/1UfnKv0p24H5+Ho4RL36h57QFKIdAMeZHI8ZMY3d@lists.infradead.org, AJvYcCW6tWSnZRNPtjgM+h3x7hve8VAIfXbZa/JPmHISE6WyGq1kEfml+GVusz1YsOcRrNz+ko7RF7qzF4faZ/KBaq0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1FJG+CS1l1nrKuf4lexH99n9MUXm9EtSffScMpq7Zny03GzLd
	yivHVYcvt5qV1hUZZRSiWIfOEDw5wmFPK9BWHnRy43nofiB09vpkOb8q
X-Gm-Gg: ASbGncvlB2jd34Fc39AaFK4RFNE/pMrD7t5BDcDzbg6KCXsyR7TuKDYBErnblo4yEwP
	u4RQOsw6JoRIvazsnLuRb8qMYW0L76NFBXWLKht3wDyjuP3fngNbeITW3GJeCGCzhnrYEtGiz7S
	FFM3ZqX0D/SQjTJa00GZlKEUZVEkz8yQkptzlzwFuK4qyEnWccTibNyIMvPIw3nL8yifhkZUoQ5
	Yfc+wu1eTo3cY5IU4rGGozopla1SuudTPZb9oV18/4Gkijxn34+0XNVzLK5S93n03zIyAa7UjrW
	8s//qvqlaKQEkQ4W04Pk+9didTycfx7JeC8LNOPUm631qstjGR+ulQKWxLwPWzfuXqVvNMcoLgQ
	jqV7+XAq7AB035hHN9yt5yxZ9YO8YHPWUqCJ4Rh0=
X-Google-Smtp-Source: AGHT+IEWXGSRjdy4RAu+IcFqNFLSigtkUTeWRQg71jQOmauDsjSiWhFOxk2+KAgssZQX1ci7YH+4nA==
X-Received: by 2002:a17:907:7fa4:b0:ae3:c767:da11 with SMTP id a640c23a62f3a-af9c65de7eemr1091487766b.50.1754926568473;
        Mon, 11 Aug 2025 08:36:08 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615c57f9fd0sm17432655a12.11.2025.08.11.08.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:36:08 -0700 (PDT)
Message-ID: <f6d130cac25b794e0fad1a8f0267d38acf8ee465.camel@gmail.com>
Subject: Re: [PATCH 113/114] clk: sophgo: sg2042-pll: remove round_rate() in
 favor of determine_rate()
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
Date: Mon, 11 Aug 2025 17:36:04 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-113-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-113-b3bf97b038dc@redhat.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_083610_885650_B84DC59F 
X-CRM114-Status: GOOD (  19.76  )
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

SGkgQnJpYW4hCgpPbiBNb24sIDIwMjUtMDgtMTEgYXQgMTE6MTkgLTA0MDAsIEJyaWFuIE1hc25l
eSB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4gRnJvbTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhh
dC5jb20+Cj4gCj4gVGhpcyBkcml2ZXIgaW1wbGVtZW50cyBib3RoIHRoZSBkZXRlcm1pbmVfcmF0
ZSgpIGFuZCByb3VuZF9yYXRlKCkgY2xrCj4gb3BzLCBhbmQgdGhlIHJvdW5kX3JhdGUoKSBjbGsg
b3BzIGlzIGRlcHJlY2F0ZWQuIFdoZW4gYm90aCBhcmUgZGVmaW5lZCwKPiBjbGtfY29yZV9kZXRl
cm1pbmVfcm91bmRfbm9sb2NrKCkgZnJvbSB0aGUgY2xrIGNvcmUgd2lsbCBvbmx5IHVzZSB0aGUK
PiBkZXRlcm1pbmVfcmF0ZSgpIGNsayBvcHMsIHNvIGxldCdzIHJlbW92ZSB0aGUgcm91bmRfcmF0
ZSgpIGNsayBvcHMgc2luY2UKPiBpdCdzIHVudXNlZC4KPiAKPiBUaGUgaW1wbGVtZW50YXRpb24g
b2Ygc2cyMDQyX2Nsa19wbGxfZGV0ZXJtaW5lX3JhdGUoKSBjYWxscwo+IHNnMjA0Ml9jbGtfcGxs
X3JvdW5kX3JhdGUoKSwgc28gdGhpcyBmb2xkcyB0aGUgdHdvIGludG8gYSBzaW5nbGUKPiBmdW5j
dGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPGJtYXNuZXlAcmVkaGF0LmNv
bT4KPiAtLS0KPiDCoGRyaXZlcnMvY2xrL3NvcGhnby9jbGstc2cyMDQyLXBsbC5jIHwgMjQgKysr
KysrKystLS0tLS0tLS0tLS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCAxNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc29waGdvL2Ns
ay1zZzIwNDItcGxsLmMgYi9kcml2ZXJzL2Nsay9zb3BoZ28vY2xrLXNnMjA0Mi1wbGwuYwo+IGlu
ZGV4IGU1ZmIwYmI3YWM0Zjk3NjE2ZjNiNDcyZmNhYjQ1ZTU3MjllYjY1M2UuLmIyY2JkNTBhYzcz
Yzc1MzhiMWFjYmNhNTE3ZjQyNTljYmE4ODVmY2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsv
c29waGdvL2Nsay1zZzIwNDItcGxsLmMKPiArKysgYi9kcml2ZXJzL2Nsay9zb3BoZ28vY2xrLXNn
MjA0Mi1wbGwuYwo+IEBAIC0zNDYsMzcgKzM0NiwzMCBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBz
ZzIwNDJfY2xrX3BsbF9yZWNhbGNfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywKPiDCoAlyZXR1cm4g
cmF0ZTsKPiDCoH0KPiDCoAo+IC1zdGF0aWMgbG9uZyBzZzIwNDJfY2xrX3BsbF9yb3VuZF9yYXRl
KHN0cnVjdCBjbGtfaHcgKmh3LAo+IC0JCQkJwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHJlcV9y
YXRlLAo+IC0JCQkJwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nICpwcmF0ZSkKPiArc3RhdGljIGlu
dCBzZzIwNDJfY2xrX3BsbF9kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywKPiArCQkJ
CQkgc3RydWN0IGNsa19yYXRlX3JlcXVlc3QgKnJlcSkKPiDCoHsKPiDCoAlzdHJ1Y3Qgc2cyMDQy
X3BsbF9jdHJsIHBjdHJsX3RhYmxlOwo+IMKgCXVuc2lnbmVkIGludCB2YWx1ZTsKPiDCoAlsb25n
IHByb3Blcl9yYXRlOwo+IMKgCWludCByZXQ7Cj4gwqAKPiAtCXJldCA9IHNnMjA0Ml9nZXRfcGxs
X2N0bF9zZXR0aW5nKCZwY3RybF90YWJsZSwgcmVxX3JhdGUsICpwcmF0ZSk7Cj4gKwlyZXQgPSBz
ZzIwNDJfZ2V0X3BsbF9jdGxfc2V0dGluZygmcGN0cmxfdGFibGUsCj4gKwkJCQkJIG1pbihyZXEt
PnJhdGUsIHJlcS0+bWF4X3JhdGUpLAo+ICsJCQkJCSByZXEtPmJlc3RfcGFyZW50X3JhdGUpOwo+
IMKgCWlmIChyZXQpIHsKPiDCoAkJcHJvcGVyX3JhdGUgPSAwOwo+IMKgCQlnb3RvIG91dDsKPiDC
oAl9Cj4gwqAKPiDCoAl2YWx1ZSA9IHNnMjA0Ml9wbGxfY3RybF9lbmNvZGUoJnBjdHJsX3RhYmxl
KTsKPiAtCXByb3Blcl9yYXRlID0gKGxvbmcpc2cyMDQyX3BsbF9yZWNhbGNfcmF0ZSh2YWx1ZSwg
KnByYXRlKTsKPiArCXByb3Blcl9yYXRlID0gKGxvbmcpc2cyMDQyX3BsbF9yZWNhbGNfcmF0ZSh2
YWx1ZSwgcmVxLT5iZXN0X3BhcmVudF9yYXRlKTsKPiDCoAo+IMKgb3V0Ogo+IMKgCXByX2RlYnVn
KCItLT4gJXM6IHBsbF9yb3VuZF9yYXRlOiB2YWwgPSAlbGRcbiIsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgXl5eXl5eXl5eXl5eXl4KTm93IHRoYXQgcm91bmRfcmF0ZSBoYXMgZ29uZSwgc2hv
dWxkIHRoZSBhYm92ZSBiZWNvbWUgInBsbF9kZXRlcm1pbmVfcmF0ZSI/Cgo+IMKgCQkgY2xrX2h3
X2dldF9uYW1lKGh3KSwgcHJvcGVyX3JhdGUpOwo+IC0JcmV0dXJuIHByb3Blcl9yYXRlOwo+IC19
Cj4gKwlyZXEtPnJhdGUgPSBwcm9wZXJfcmF0ZTsKPiDCoAo+IC1zdGF0aWMgaW50IHNnMjA0Ml9j
bGtfcGxsX2RldGVybWluZV9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LAo+IC0JCQkJCSBzdHJ1Y3Qg
Y2xrX3JhdGVfcmVxdWVzdCAqcmVxKQo+IC17Cj4gLQlyZXEtPnJhdGUgPSBzZzIwNDJfY2xrX3Bs
bF9yb3VuZF9yYXRlKGh3LCBtaW4ocmVxLT5yYXRlLCByZXEtPm1heF9yYXRlKSwKPiAtCQkJCQnC
oMKgwqDCoMKgICZyZXEtPmJlc3RfcGFyZW50X3JhdGUpOwo+IC0JcHJfZGVidWcoIi0tPiAlczog
cGxsX2RldGVybWluZV9yYXRlOiB2YWwgPSAlbGRcbiIsCj4gLQkJIGNsa19od19nZXRfbmFtZSho
dyksIHJlcS0+cmF0ZSk7Cj4gwqAJcmV0dXJuIDA7Cj4gwqB9Cj4gwqAKPiBAQCAtNDE3LDE0ICs0
MTAsMTMgQEAgc3RhdGljIGludCBzZzIwNDJfY2xrX3BsbF9zZXRfcmF0ZShzdHJ1Y3QgY2xrX2h3
ICpodywKPiDCoAo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfb3BzIHNnMjA0Ml9jbGtfcGxs
X29wcyA9IHsKPiDCoAkucmVjYWxjX3JhdGUgPSBzZzIwNDJfY2xrX3BsbF9yZWNhbGNfcmF0ZSwK
PiAtCS5yb3VuZF9yYXRlID0gc2cyMDQyX2Nsa19wbGxfcm91bmRfcmF0ZSwKPiDCoAkuZGV0ZXJt
aW5lX3JhdGUgPSBzZzIwNDJfY2xrX3BsbF9kZXRlcm1pbmVfcmF0ZSwKPiDCoAkuc2V0X3JhdGUg
PSBzZzIwNDJfY2xrX3BsbF9zZXRfcmF0ZSwKPiDCoH07Cj4gwqAKPiDCoHN0YXRpYyBjb25zdCBz
dHJ1Y3QgY2xrX29wcyBzZzIwNDJfY2xrX3BsbF9yb19vcHMgPSB7Cj4gwqAJLnJlY2FsY19yYXRl
ID0gc2cyMDQyX2Nsa19wbGxfcmVjYWxjX3JhdGUsCj4gLQkucm91bmRfcmF0ZSA9IHNnMjA0Ml9j
bGtfcGxsX3JvdW5kX3JhdGUsCj4gKwkuZGV0ZXJtaW5lX3JhdGUgPSBzZzIwNDJfY2xrX3BsbF9k
ZXRlcm1pbmVfcmF0ZSwKPiDCoH07CgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
