Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1199CCD8CAE
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 06:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHBmtsPpKRd9BBY8XcgzvEvfJi69A/8lEK4C31WlN20=; b=EAGde2FhSD2by3
	TZqvBCMutM1LL3Lw0H2E7X1vuo9PpksxtXqotLyy5tOiz1Y61r82QDxhk4LoEXHxX0OSZfNVIa3Zp
	RcO9tBzJpiYgx6+byzyLgZNcf/6kHyCKfRYWR3l+wD5H7KnPlkby6e2tqFcuXzsrrhJh/K9u4VmUS
	vp/FlesKRjDv/F6gVt3sXmlfhUd2S+b4wMBJW5yfHBzK/bmmQXSG9U6oo7Y/ELdoWGibQUw3vllg7
	djEFX0fvXXDUTgDfxhml32cqybhrllRoXQtmuhDxaiFlSQeTwC1VivoTmI4A1CQQ9SSPmubNg+Xqg
	2yapDDQA310Onknd472Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpl0-00000004qFl-2RQO;
	Tue, 09 Jun 2026 06:16:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpkz-00000004qFQ-0AZJ;
	Tue, 09 Jun 2026 06:16:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ABF54176F;
	Tue,  9 Jun 2026 06:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A581F00893;
	Tue,  9 Jun 2026 06:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780985772;
	bh=GRmx4DwqEvH8Sj/Hh6Skbn6x441MCdzscjye44bXYhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gnkwVPhQb1ZwNiquck1wvt/I4u7Xwi7KfygraCnUeVOcnNjZoHwgzswIY7tGx4q21
	 9xqTDQdDBnROooohabC/eJx7QexicCmG6FBAPHdY5lC7YXSGxW/AM8t+XAVWxjkLgQ
	 f5HCzHfyyLcNsmqOf+WPOHLJANZnbEuvwb1vjdJiABe1OFQuXv2W/0UURrRaIVk4na
	 gaNBLcthN5C57QLJajeCAn8uMU+eq6ohIfBWseszie91vLW2b8SbBmPrnqMFHLR3Iz
	 Ocj0FlWFqf2FqQEWX7v82OtzUcllX4I+cnPg1oNqK+xZyxvrGyKK6/6fvh5OMcTubt
	 eupEoMmaF6uvA==
Date: Mon, 8 Jun 2026 23:16:11 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 03/12] riscv: dts: thead: add device tree node for MISC
 clock controller
Message-ID: <aievq4dae3GHHq0c@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-4-zhengxingda@iscas.ac.cn>
 <aiehUzl-qZeZDjXP@thelio>
 <67790d90737c13127100510020262d6921810e34.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67790d90737c13127100510020262d6921810e34.camel@icenowy.me>
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

T24gVHVlLCBKdW4gMDksIDIwMjYgYXQgMDE6MzU6MTFQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyNi0wNi0wOOS4gOeahCAyMjoxNCAtMDcwMO+8jERyZXcgRnVzdGluaeWG
memBk++8mgo+ID4gT24gVGh1LCBNYXkgMDcsIDIwMjYgYXQgMDQ6MTc6MDFQTSArMDgwMCwgSWNl
bm93eSBaaGVuZyB3cm90ZToKPiA+ID4gVGhlIE1JU0NfU1VCU1lTIGNsb2NrIGNvbnRyb2xsZXIg
b24gVEgxNTIwIFNvQyBpcyBhIGNsb2NrCj4gPiA+IGNvbnRyb2xsZXIKPiA+ID4gbWFpbmx5IGNv
bnRyb2xsaW5nIFVTQi1yZWxhdGVkIGNsb2NrcyAod2hpY2ggaXNuJ3QgdXRpbGl6ZWQgeWV0KQo+
ID4gPiBhbmQKPiA+ID4gTU1DL1NEIGNvbnRyb2xsZXJzJyBBSEIgYnVzIGNsb2Nrcy4KPiA+ID4g
Cj4gPiA+IEFkZCB0aGUgZGV2aWNlIHRyZWUgbm9kZSBmb3IgaXQgYWxvbmcgd2l0aCB0aGUgbWlz
c2luZyBidXMgY2xvY2sKPiA+ID4gcmVmZXJlbmNlcyBmb3IgTU1DL1NEIGNvbnRyb2xsZXJzLgo+
ID4gCj4gPiBJcyB0aGVyZSBhIGZ1bmN0aW9uYWwgcmVhc29uIHRvIG1vZGlmeSB0aGUgbW1jIG5v
ZGVzIGluIHRoaXMgc2VyaWVzPwo+IAo+IFdoZW4gdGhlIGNsb2NrIGlzbid0IHJlZmVyZW5jZWQs
IExpbnV4IHdpbGwgZGlzYWJsZSBpdCB1bmxlc3MKPiBgY2xrX2lnbm9yZV91bnVzZWRgIHBhcmFt
ZXRlciBpcyBwYXNzZWQuCgpBaCBvaywgdGhhbmtzIGZvciBleHBsYWluaW5nLgoKRHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
