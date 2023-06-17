Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9522EB64D9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 18:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DobICx6CBsavIF+sjdxESR2zt5iHj44Sg4xhTtT+tBY=; b=0KbQUmlniNTA+e
	wbYaBXWEYtndPRPWPexuq700yhlK3Na50aTmZ/6R2oVo8i9YnScgm3iewoBEeKLnYlBv4PCCDDVJV
	aRWNsnK+6B9Fd6t2V+5+oPMg2A2QT/HzIkRhEHP5SBbS++980s5CKRQo7nwDirLu/cS+jvN8HKUHp
	Ho9GrsWQEZ9pJ5tlweG7OEBbISq17uR3rnLfXPMaQT0s5IvJEgZihtDn4c78Rk95Qm10yCA9LUyk1
	eVPtEEyuOPTRlhntpcVZt0reWXBfzISJJkmSX0EhME13fqG+izat/0TqmETHb5iOAtzMhVBUEsU5h
	giCuHl653m+QlO/2uLDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAb2H-00495y-1N;
	Sat, 17 Jun 2023 18:52:33 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAb2E-00494e-0T;
	Sat, 17 Jun 2023 18:52:31 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-982a88ca610so269569666b.2;
        Sat, 17 Jun 2023 11:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687027945; x=1689619945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzK3QhwOQbNBL0QFe3mmmruOL89rBfwrLckQ4Lu4tw0=;
        b=U6pm4jaJS8m2UDl5VXEpxwxyEDkQHF9QkXqtVNIGqvYUOfLq7S32g4YLmC3Sqb+bpq
         A5aHeO5vtvvjURkrsSjRIErKQNawz2pmzcdyE0ETSHmd+rgVKxSzve3tBc6oaoKI+zXv
         W7S+slQW2VP9zijRGLMbvldmtrWYybAs4W+VatwcU1jy9/+JIyLI26+dHnTRKB4TgZmF
         O5Thtl2g9ai5+N5F1Fr8ztrekEbGqWHJhErXjKufts4RfAqdMKYk59yoUWcn3ztZ6lJX
         8MvELPPOFeC3fnLgW4NCPPg1DStOTN/jCqDb8npw3/tPveBPPE0cXRVc/Wzje4x1HxJw
         HSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687027945; x=1689619945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzK3QhwOQbNBL0QFe3mmmruOL89rBfwrLckQ4Lu4tw0=;
        b=Nn4xRhLSc8oQrenT7oDwpbmv7k137I1VVXkMpl5tgPns3Sc5vuBiNZOLdteI5I55WK
         ZNOlRb/t/senhm5XvJLZsTncF9VcvbmdCOyDD+VF7nlG+VduZLMpk8j7pC4HdHmW9FLi
         u8K5eLaAkdKAjUjBehZvjQCUOyxCo084rfeHaNi7k2xXtuVCr72uYlHq0k4dT9zHEKRG
         mfB0rcValWNdB3xsZ32VDOPjLZzw2zCuit0OSsz/aGTou1GbdxXW6wxjsoOmXyUvxuAK
         8t28rqYymJgS1qhrkj2SIGdYTO5Xbf4PIY3Yyg/4NS3lzPgC2JVzpG2RfjCByHuVIu39
         0SBw==
X-Gm-Message-State: AC+VfDxxgCY6Qj8ZVov3CARNLYJzkJcxEPlJ4s1fGjfNYhCvdNHtx+Fq
	vTUUZrtydgO5d3bs4lYYJnNC4FEHkLhu1NS3F6Q=
X-Google-Smtp-Source: ACHHUZ5QbT7Jg6uOgdeAKNzv3ZBblzxwZ5KIiDFzExm5SfOEog04farQMGB0tuGmdV8OQf2IrM3SebaH7vJEO5LQFdE=
X-Received: by 2002:a17:907:7faa:b0:987:f7ae:4af6 with SMTP id
 qk42-20020a1709077faa00b00987f7ae4af6mr1496201ejc.35.1687027944402; Sat, 17
 Jun 2023 11:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230615205540.1803975-1-bigunclemax@gmail.com>
 <20230615205540.1803975-2-bigunclemax@gmail.com> <20230617144855.0388c4ff@jic23-huawei>
In-Reply-To: <20230617144855.0388c4ff@jic23-huawei>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sat, 17 Jun 2023 21:52:12 +0300
Message-ID: <CALHCpMgxNwz197qgiEueV9Y26LN7BBfYSGBHy6J4gOTFpiVUtw@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
	=?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Mike Looijmans <mike.looijmans@topic.nl>, ChiYuan Huang <cy_huang@richtek.com>, 
	Ramona Bolboaca <ramona.bolboaca@analog.com>, Ibrahim Tilki <Ibrahim.Tilki@analog.com>, 
	William Breathitt Gray <william.gray@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_115230_191610_077FF6C9 
X-CRM114-Status: GOOD (  19.14  )
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

0YHQsSwgMTcg0LjRjtC9LiAyMDIz4oCv0LMuINCyIDE2OjQ5LCBKb25hdGhhbiBDYW1lcm9uIDxq
aWMyM0BrZXJuZWwub3JnPjoKPgo+IE9uIFRodSwgMTUgSnVuIDIwMjMgMjM6NTU6MjAgKzAzMDAK
PiBNYWtzaW0gS2lzZWxldiA8YmlndW5jbGVtYXhAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gVGhl
IEdlbmVyYWwgUHVycG9zZSBBREMgKEdQQURDKSBjYW4gY29udmVydCB0aGUgZXh0ZXJuYWwgc2ln
bmFsIGludG8KPiA+IGEgY2VydGFpbiBwcm9wb3J0aW9uIG9mIGRpZ2l0YWwgdmFsdWUsIHRvIHJl
YWxpemUgdGhlIG1lYXN1cmVtZW50IG9mCj4gPiBhbmFsb2cgc2lnbmFsLCB3aGljaCBjYW4gYmUg
YXBwbGllZCB0byBwb3dlciBkZXRlY3Rpb24gYW5kIGtleSBkZXRlY3Rpb24uCj4gPgo+ID4gVGhl
b3JldGljYWxseSwgdGhpcyBBREMgY2FuIHN1cHBvcnQgdXAgdG8gMTYgY2hhbm5lbHMuIEFsbCBT
b0NzIGJlbG93Cj4gPiBjb250YWluIHRoaXMgR1BBREMgSVAuIFRoZSBvbmx5IGRpZmZlcmVuY2Ug
YmV0d2VlbiB0aGVtIGlzIHRoZSBudW1iZXIKPiA+IG9mIGF2YWlsYWJsZSBjaGFubmVsczoKPiA+
Cj4gPiAgVDExMyAtIDEgY2hhbm5lbAo+ID4gIEQxICAgLSAyIGNoYW5uZWxzCj4gPiAgUjMyOSAt
IDQgY2hhbm5lbHMKPiA+ICBUNTA3IC0gNCBjaGFubmVscwo+ID4KPiA+IFJldmlld2VkLWJ5OiBB
bmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBNYWtzaW0gS2lzZWxldiA8YmlndW5jbGVtYXhAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAg
ZHJpdmVycy9paW8vYWRjL0tjb25maWcgICAgICAgICAgICB8ICAxMCArKwo+ID4gIGRyaXZlcnMv
aWlvL2FkYy9NYWtlZmlsZSAgICAgICAgICAgfCAgIDEgKwo+ID4gIGRyaXZlcnMvaWlvL2FkYy9z
dW4yMGktZ3BhZGMtaWlvLmMgfCAyNzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+
ICAzIGZpbGVzIGNoYW5nZWQsIDI4NyBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvaWlvL2FkYy9zdW4yMGktZ3BhZGMtaWlvLmMKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9paW8vYWRjL0tjb25maWcgYi9kcml2ZXJzL2lpby9hZGMvS2NvbmZpZwo+ID4g
aW5kZXggZWIyYjA5ZWY1ZDViLi5kZWZmN2FlNzA0Y2UgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2lpby9hZGMvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9paW8vYWRjL0tjb25maWcKPiA+IEBA
IC0xMTIzLDYgKzExMjMsMTYgQEAgY29uZmlnIFNVTjRJX0dQQURDCj4gPiAgICAgICAgIFRvIGNv
bXBpbGUgdGhpcyBkcml2ZXIgYXMgYSBtb2R1bGUsIGNob29zZSBNIGhlcmU6IHRoZSBtb2R1bGUg
d2lsbCBiZQo+ID4gICAgICAgICBjYWxsZWQgc3VuNGktZ3BhZGMtaWlvLgo+ID4KPiA+ICtjb25m
aWcgU1VOMjBJX0dQQURDCj4gPiArICAgICB0cmlzdGF0ZSAiU3VwcG9ydCBmb3IgdGhlIEFsbHdp
bm5lciBTb0NzIEdQQURDIgo+IEkgYXBwbGllZCB0aGlzIGFuZCBzdGFydGVkIGEgYnVpbGQgdGVz
dCBiZWZvcmUgbm90aWNpbmcgdGhhdCB0aGlzIEtjb25maWcgZGVzY3JpcHRpb24KPiBpcyB2ZXJ5
IHZhZ3VlIGFuZCBtYXRjaGVzIHRoZSBvbmUgZm9yIHRoZSBleGlzdGluZyA0aSBkcml2ZXIuLi4K
CkluZGVlZC4gSSBtdXN0IGhhdmUgZm9yZ290dGVuIHRvIGNoYW5nZSB0aGlzIGxpbmUgd2hlbiBj
b3B5aW5nIGZyb20gc3VuNGkuLi4KCj4gVGhlICdTdXBwb3J0IGZvciB0aGUnIGJpdCBhbHNvIGlz
bid0IGFwcHJvcHJpYXRlIGZvciB3aGF0IHlvdSBzZWUgaW4gbWFrZSBtZW51Y29uZmlnCj4gbWVu
dSBldGMuICAgUGxlYXNlIGNvbWUgdXAgd2l0aCBzb21ldGhpbmcgZGVzY3JpcHRpdmUuIE1heWJl
Cj4gInN1bjIwaSBhbmQgc2ltaWxhciBTb0MgR1BBREMiPwo+Cj4gQm9udXMgcG9pbnRzIGlmIHlv
dSBjaGFuZ2UgdGhlIHRleHQgZm9yIHRoZSA0aSBhdCB0aGUgc2FtZSB0aW1lIHRvIGJlCj4gbW9y
ZSBtZWFuaW5nZnVsLiBJIGNsZWFybHkgbWlzc2VkIHRoYXQgaW4gcmV2aWV3IGEgbG9uZyB0aW1l
IGFnbyEKClNob3VsZCBJIGRvIHRoaXMgaW4gYSBzZXBhcmF0ZSBwYXRjaD8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
