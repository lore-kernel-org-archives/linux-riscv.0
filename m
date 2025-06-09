Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D549C61DB2
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 17:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lzInew6JINWMcrmR/u3fc6PPmvUFs+BHG96UP473KEc=; b=Q85M2AAL4tcaxa
	rUsSF64T12oAXaMjMsk2zhFh5b7Ud2dzimBozF+RpOlcf2bVWTYj9vTbqdNPPeRmEaCMC/06qFDwu
	FwVGDze+naCnKbcZ9z6FXx8AN+SLidPayhS31FPlUsStA7SUehCAa1mK5YcuVxZXdHRy8/YMdLpx0
	Vk79IcqVpa3YrE1OSP9ZzfZDkNqz9CrvCXSg0MAn3FA8ZbrwTDPtuHN912ht2HkikxcE0bS/XNrk5
	GTO6Fge4K98coGX9mgCWuxA/O28/lDZDbBK/A2te4ThUqNKZCcrjyHbJAB4qD8vq6/SADgupawtJa
	nB+GSfxlE6njrfVqNxTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgfR-00000004qbO-2OWO;
	Mon, 09 Jun 2025 17:52:17 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfWs-00000004hoq-2K7t
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 16:39:23 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a361b8a664so3782797f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 09:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749487160; x=1750091960; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MdlA7FTprXZiicVKK7E8JIBJj3nSquxMjsmIoLs6jMg=;
        b=a7ppmRB7vlhdUoFPjs5BY6IvD2ykc2tMlCGJatz3qv8wgACMXkybokh5V6KC/MWICr
         Vk+ubMR8bIow1OVcVXDRJq5OrxgZbqPe3mG9cHm9evE6qV3eYT0pOtdNH+iseRS2BoKA
         aLaTCqNLbdXjnHis4443gpNwkP/vIiWuI1TWdSLltydVbIbg+i6VDhGFI0OqYwyhk34l
         DBrT+Zcdpl8E6P/KyVC3V/T9L0TAI3H+++w4NiTMvnk09Kh/duC99RnZpVh8LPcsnG1i
         i3CWRWzviuasLnrT2SALIRsPOLXvSkacrp8gHCzlweyDiVuYlnDHcsV1xATxOYvUABq4
         67Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749487160; x=1750091960;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MdlA7FTprXZiicVKK7E8JIBJj3nSquxMjsmIoLs6jMg=;
        b=dQmPV3huwJAaMD38zc+ZfAUkJ75KNBhrVRPM/VqGyfEdm0dW1sgpN7aB3slxmO8dgq
         hCxVp0J6R+jqcflS5WAutO84XI2MzWx+kPHJWKns85IEOhYLWmDYACSoL5YMHyAqMv37
         1VIcqUwqqSm736LLkfVDLf6Wc/CGNuFfvicfxeIPHpdM21ools0qkQvwdE94aLYUSbeI
         +3rYywT8Y1H62oUL/UbstlOGLeBvjO/lND7TbA3uIZ6BVwnZn+iUcp7iQkqp+i1Vevu3
         pPz61R0fsZyE29yTs4NN7jW3tbFeqIeIMusH92Xjbus9ACFCN5AZp+74hK82AU8+xAf5
         75Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVtxyxWSsnyUA/LX+hMFwIeSUNTMKh6qL8Yd7Mizkcr88U7g0+kjzrtC5fjN045CTbDIs0TIFWwvHYnUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNftmMq9oa8sQ3odNHMeqPDSlEaLav9C5HbLK+gE2CXEAgB/l6
	pAtyHBxN00gaRyFRBwwndk0H+0mMLZ9f9jPflRfnp3Tz++tR7rieob0/
X-Gm-Gg: ASbGncsmxSTnO9gsvnKJAuKpMTNMTneIWuZM7zpbOY6Shh5GIIAqhOfyH75wEuQ2Tbl
	X1OHhJbbq6ZU8UD9X8qxfJzbfC9Yug8f/pqwJ872PV4cox+N1d0FxTRCF5tNePMb/Toech4uNiL
	V3qppJ2EXWRIujrOuCPFwh6Nl45ua/Ct6L2PCiWBlX8a+c0NJ0wa31gHfBqSxGaGp0wGciB0Uau
	MgshnleFwuQ5Bn7LggNkcxZdbOKZqGpN4O1fUCGcIJsF2cyFCXY2xuFs93C5JPuP+QtgwZHZBe8
	Vv9kfPWGOt+l6oRKg35dV1zN6we6CdnKjF5ppdLAc515Dxa0eJEYVUypZIulfsy38cv/fP2KSXB
	v0zF7GA==
X-Google-Smtp-Source: AGHT+IE641WVTYCKGJ9CW2nJENZhWmhnjIJAkzfQD2E1jYnnkEDfEBr76CpBPCzz77Yns7HmTZCRfA==
X-Received: by 2002:a05:6000:188f:b0:3a4:fe9d:1b10 with SMTP id ffacd0b85a97d-3a531caff2dmr10438461f8f.45.1749487160286;
        Mon, 09 Jun 2025 09:39:20 -0700 (PDT)
Received: from giga-mm-5.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532464f20sm9972251f8f.98.2025.06.09.09.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 09:39:19 -0700 (PDT)
Message-ID: <13f0f876de57d2a96f4786bcd3622772bd478d69.camel@gmail.com>
Subject: Re: [PATCH v2 2/4] reset: simple: add support for Sophgo CV1800B
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Chen
 Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti	 <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, Thomas
 Bonnefille	 <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Date: Mon, 09 Jun 2025 18:39:20 +0200
In-Reply-To: <20250608232214.771855-3-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
	 <20250608232214.771855-3-inochiama@gmail.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_093922_590157_8EB6CD00 
X-CRM114-Status: GOOD (  11.80  )
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

T24gTW9uLCAyMDI1LTA2LTA5IGF0IDA3OjIyICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+
IFJldXNlIHJlc2V0LXNpbXBsZSBkcml2ZXIgZm9yIHRoZSBTb3BoZ28gQ1YxODAwQiByZXNldCBn
ZW5lcmF0b3IuCj4gCj4gU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdt
YWlsLmNvbT4KClJldmlld2VkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVy
ZGxpbkBnbWFpbC5jb20+Cgo+IC0tLQo+IMKgZHJpdmVycy9yZXNldC9yZXNldC1zaW1wbGUuYyB8
IDIgKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9yZXNldC9yZXNldC1zaW1wbGUuYyBiL2RyaXZlcnMvcmVzZXQvcmVzZXQtc2lt
cGxlLmMKPiBpbmRleCAyNzYwNjc4Mzk4MzAuLjc5ZTk0ZWNmZTRmNSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3Jlc2V0L3Jlc2V0LXNpbXBsZS5jCj4gKysrIGIvZHJpdmVycy9yZXNldC9yZXNldC1z
aW1wbGUuYwo+IEBAIC0xNTEsNiArMTUxLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgcmVzZXRfc2ltcGxlX2R0X2lkc1tdID0gewo+IMKgCXsgLmNvbXBhdGlibGUgPSAic25w
cyxkdy1oaWdoLXJlc2V0IiB9LAo+IMKgCXsgLmNvbXBhdGlibGUgPSAic25wcyxkdy1sb3ctcmVz
ZXQiLAo+IMKgCQkuZGF0YSA9ICZyZXNldF9zaW1wbGVfYWN0aXZlX2xvdyB9LAo+ICsJeyAuY29t
cGF0aWJsZSA9ICJzb3BoZ28sY3YxODAwYi1yZXNldCIsCj4gKwkJLmRhdGEgPSAmcmVzZXRfc2lt
cGxlX2FjdGl2ZV9sb3cgfSwKPiDCoAl7IC5jb21wYXRpYmxlID0gInNvcGhnbyxzZzIwNDItcmVz
ZXQiLAo+IMKgCQkuZGF0YSA9ICZyZXNldF9zaW1wbGVfYWN0aXZlX2xvdyB9LAo+IMKgCXsgLyog
c2VudGluZWwgKi8gfSwKCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
