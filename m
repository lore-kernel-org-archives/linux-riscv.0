Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55C1C7EE2C
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 06:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tU3P83LGmrOGhBnQTCBpuzS2qyoXgODfOqIiwt98D88=; b=ePM+FRBJjkypGu
	1Rlx3N3u93fmPwQb9HrFB1NOjSYMs9Vk2Eixk8FbFYy0Rvt/kX9uS2CenjD8htcE7HFazhVzUDAoI
	v65OwZHwD9uoJxav6K7Xtp/srikSV0+2o/LdYKUVVIQQd/czpPuSurW1VCNRf6GOB9u0fSjkUZxRt
	kjiIdGtDc5aVuCNZYw0TTxppTrUPQGHZAzHMYYHspOyn1HuADgYJaAkq/V4hFc/L6UjR76HihHP0W
	uK5GReDGqKMT2y0fV7PSVuJR0tR5ZtZR6bEvb3fMaGDZhzNwFqcfO2M10IYRmlFMNWy/QOmFFICdS
	h7zylMdtgLNgJvNPnSEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q63dT-00EKhe-0G;
	Mon, 05 Jun 2023 06:24:11 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q63dP-00EKg0-0R
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 06:24:09 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f3b5881734so5453836e87.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 Jun 2023 23:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685946244; x=1688538244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T+rq5XkqN28INce3TzLWsTQLy6BL9Bx5PmUS8c7Jaoc=;
        b=iIM6Ehv/5Tuame+j/7VHDY/RJzfdGmjMN/9anQ7EDq7HLd1EOta0j10Qed1nLMTQla
         Saw/Yz71Nz0LgIEQGt/WzYeHhMj26hjs58+WaadXcQzDoyy1d/uQUuuuOHOmKrJsD8RK
         K6z7cDAtyeF2MdOjIZAI/aKyVg6Sr0YsfTgwoZGzjnUaI2uhmevmfNTEmZT822OxOQ01
         OBQZEnYCn+oiWjqe3owQKt7QrVnJuuTzm3Fr6mwyy82Si2v0aIjv5NrrfpRnZaAV11wW
         g0s76nXLTAGBPtX8gvVsJc2FKlrEhJ1E+RbXysjiCPK0NTEj6iiBKwYJns9kEopyak4U
         kQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685946244; x=1688538244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T+rq5XkqN28INce3TzLWsTQLy6BL9Bx5PmUS8c7Jaoc=;
        b=a2vIe4lkqbY5LpnBsxbSGEDz7OjARPqH3rKkN8/EQXMfJbp88j/GAGxyiBWPbaiQES
         eKPIiZHFVzum9hvvdmbMbxIYAMncng1cHp1zzltQegpSQt9JQQMj42QJstZbRS8mPKwz
         4TzACf3s6pZklI67I17W2aD6XF4yCbSjkh4R8S8Ja3RValmhoue2SlMqzadwcmxyqFOC
         v5gJjjA/9uMjyHOHl1MPlzxY+UQ/vJ+IdLmdmnzXPEpSIvcRLbSpsKXUFpAyIU5frlXE
         PuRZbBu8UlRmNDAhu/uQXily9YLzWZuGwOp9Xrg5qE+DC4gUxx2ME1ocQR7FelBabfwc
         11jw==
X-Gm-Message-State: AC+VfDw9mp7M0M98fGVB8zGDgSR+8JhjYhfcNKcsWHXR6ELQMnxBUqzH
	tIQFawwMiXI2VR7z9X7AJymVzg==
X-Google-Smtp-Source: ACHHUZ721HTzywDNwWlcZQjpy3ZTbwS6sBCP+LYgCL+Orn1Z1WX8P/q9HPfxZPhBQLsIqlR0HXoUsw==
X-Received: by 2002:ac2:5a01:0:b0:4f5:a181:97b1 with SMTP id q1-20020ac25a01000000b004f5a18197b1mr4917129lfn.50.1685946243884;
        Sun, 04 Jun 2023 23:24:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id bc10-20020a056402204a00b00510de087302sm3511072edb.47.2023.06.04.23.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 23:24:03 -0700 (PDT)
Message-ID: <7e9e5588-46bc-51bf-13d3-7d47d2bee6ec@linaro.org>
Date: Mon, 5 Jun 2023 08:24:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
Content-Language: en-US
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cosmin Tanislav <demonsingur@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 William Breathitt Gray <william.gray@linaro.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Ramona Bolboaca <ramona.bolboaca@analog.com>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 ChiaEn Wu <chiaen_wu@richtek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230601223104.1243871-1-bigunclemax@gmail.com>
 <20230601223104.1243871-3-bigunclemax@gmail.com>
 <fbcc5688-387c-32fb-edac-17848c92b936@linaro.org>
 <CALHCpMizv52yj0rw0pR8pYjSys2UivS4L4GkWLgc-d91bdmDCA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CALHCpMizv52yj0rw0pR8pYjSys2UivS4L4GkWLgc-d91bdmDCA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_232407_204617_2CDAC8C5 
X-CRM114-Status: GOOD (  20.39  )
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

T24gMDQvMDYvMjAyMyAyMjoyMCwgTWF4aW0gS2lzZWxldiB3cm90ZToKPiDQv9GCLCAyINC40Y7Q
vS4gMjAyM+KAr9CzLiDQsiAxMTozOCwgS3J6eXN6dG9mIEtvemxvd3NraQo+IDxrcnp5c3p0b2Yu
a296bG93c2tpQGxpbmFyby5vcmc+Ogo+IEhpIEtyenlzenRvZiwKPj4KPj4gT24gMDIvMDYvMjAy
MyAwMDozMCwgTWFrc2ltIEtpc2VsZXYgd3JvdGU6Cj4+PiBGcm9tOiBNYXhpbSBLaXNlbGV2IDxi
aWd1bmNsZW1heEBnbWFpbC5jb20+Cj4+Pgo+Pj4gQWxsd2lubmVyJ3MgRDEvVDExM3MvUjMyOS9U
NTA3IFNvQ3MgaGF2ZSBhIG5ldyBnZW5lcmFsIHB1cnBvc2UgQURDLgo+Pj4gVGhpcyBBREMgaXMg
dGhlIHNhbWUgZm9yIGFsbCBvZiB0aGlzIFNvQ3MuIFRoZSBvbmx5IGRpZmZlcmVuY2UgaXMKPj4+
IHRoZSBudW1iZXIgb2YgYXZhaWxhYmxlIGNoYW5uZWxzLgo+Pgo+PiBFeGNlcHQgdGhhdCBpdCB3
YXNuJ3QgdGVzdGVkLi4uCj4gCj4gWWVzLCB5b3UgYXJlIHJpZ2h0LiBJIHRlc3RlZCBpdCBvbmx5
IG9uIHRoZSBUMTEzcyBib2FyZC4gQW5kIEkgd2lsbCBiZSBnbGFkIGlmCj4gc29tZW9uZSB0ZXN0
cyBpdCBvbiBhbm90aGVyIFNvQy4KClBsZWFzZSBzaG93IG1lIHRoZSBjb21tYW5kcyBob3cgeW91
IHRlc3RlZCBiaW5kaW5ncyBvbiBUMTEzcyBib2FyZC4gSQpyZWFsbHkgd291bGQgbGlrZSB0byBz
ZWUgdGhlbS4uLgoKPiAKPiAuLi4KPiAKPj4gUGxlYXNlIHJ1biBzY3JpcHRzL2NoZWNrcGF0Y2gu
cGwgYW5kIGZpeCByZXBvcnRlZCB3YXJuaW5ncy4gU29tZQo+PiB3YXJuaW5ncyBjYW4gYmUgaWdu
b3JlZCwgYnV0IHRoZSBjb2RlIGhlcmUgbG9va3MgbGlrZSBpdCBuZWVkcyBhIGZpeC4KPj4gRmVl
bCBmcmVlIHRvIGdldCBpbiB0b3VjaCBpZiB0aGUgd2FybmluZyBpcyBub3QgY2xlYXIuCj4gCj4g
SSBnb3QgYSB3YXJuaW5nIGFib3V0IHJlcXVpcmVkIG1haW50YWluZXIgcHJvcGVydHkuIFNob3Vs
ZCBJIGRvCj4gYW55dGhpbmcgd2l0aCB0aGlzPwoKWW91IHNob3VsZCBkbyBzb21ldGhpbmcgYmVj
YXVzZSBzZW5kaW5nIGJyb2tlbiBjb2RlIGlzIG5vdCBjb3JyZWN0LgoKPiBJZiB5ZXMsIHRoZW4g
d2hvIHNob3VsZCBiZSBhIG1haW50YWluZXI/CgpTb21lb25lIHJlc3BvbnNpYmxlIGZvciB0aGlz
IGhhcmR3YXJlLgoKPiAKPiAuLi4KPiAKPj4gSG0/IFNvIHlvdSBkbyBub3QgYWxsb3cgYW55dGhp
bmcgZnJvbSBhZGMueWFtbCByZWxhdGVkPyBBcmUgeW91IHN1cmUKPj4gdGhpcyBpcyB5b3VyIGlu
dGVudGlvbj8KPiAKPiBJJ20gbm90IHN1cmUgYWJvdXQgaXQuIEkgbG9va2VkIGF0IG90aGVyIEFE
QyBiaW5kaW5ncyBhbmQgZGlkbid0IGZpbmQKPiBhbm90aGVyIGRyaXZlciB3aXRoICdhZGRpdGlv
bmFsUHJvcGVydGllczogdHJ1ZScKCkkgZGlkbid0IHdyaXRlIGFib3V0IGFkZGl0aW9uYWxQcm9w
ZXJ0aWVzOnRydWUsIGJ1dCBhYm91dCBtaXNzaW5nIHJlZiB0bwphZGMueWFtbC4KCkJlc3QgcmVn
YXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
