Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAA7C7EE23
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Jun 2023 07:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/N8rkfQcXwMNAK9MCLQiUZq77+yJ6T9K7uhfYEmQME=; b=q7BdiotHgOnxM4
	yETMckCtjpx4RFVb1ND1Cysqs6S1vk7AX00TTSjrL4vPNnaY+Koq+pxUqM5Ng3/u8VWmRoqqFhh/B
	+wXRlRnB7Dxn7r/Tu3J3XrSlw6fKl9OSI9hD1fLUli0s9xO0lEaJ+fcbS+CrtbNi+8WjV92FhD4Ry
	y6B+nt+tknUHq/iFoLy8tX9d4G4+KGrRAuCRYR603B8x09ZChuqjHjoe1UOFTMdqXSHY3FpZl6cP1
	QVuwgzgIf0adZXnLb9Gi+QmceTzrIMmC+krqEk0Xu8k/GMA74nNzQdKSucmuMxm6T0FKWnN8i75BW
	1r9KW73UBhWAFQgP0U/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8Ftw-000IFD-25;
	Sun, 11 Jun 2023 07:54:16 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8Ftu-000IEd-00;
	Sun, 11 Jun 2023 07:54:15 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-977c88c9021so549042166b.3;
        Sun, 11 Jun 2023 00:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686470050; x=1689062050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2bYmU9gOFw7prawoSArqsjj7q30vNelMkCTOp3DUZA=;
        b=ZIEOX3tJHJOzGLZrKAdQ+Em+CgSdACZ6I8FnuJaC4jYMStxwz09k1IUU5ZVNT1dW2v
         ogPNUK7ZS+3BABiwD25+IzvvjnBLi493MzDiM/IR6p3MMAwZt7gXj55mTTsPuV1GhUnB
         iq6nxosD3itFoqyejgow+y2d+JcxEim7S9fh42peyFKgPu1KbhgXG/+edgWI+9mRGdCA
         yCU+aQjqgUZYEEPCg7Xt6cnvbidmIInJNEc58JumOG7Xe0aO208JhTCnXrR+QlWi1wMM
         tRieArJ9twGrAHIA7Zobx4X3k4JDjR7avO4YwD1ezT3hNQ7OM9N1Ahi5W08doshMsRBk
         2skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686470050; x=1689062050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2bYmU9gOFw7prawoSArqsjj7q30vNelMkCTOp3DUZA=;
        b=hXfDnRSbpoEVu4EXg7zDstZgRasZST5nuQQES1h+fMz3rwnHbNWOq2Rsw7bryt64YY
         NZw9Vfvs9jy3laxM9cxy5nlmeM1nosSE0p0feCS/T4J0Y9khwqDNqLsJSO6m3b67VY2t
         +OkGQtedcdko5zldF17Bdh+6WA7FuNxCcaCJt7Xesif8dlSOusqPhvOPB6e9HotrRiAj
         +7JkIuWIfiHlabYwHDqzEcY90msCu+jY0TGKx6Kf5fO8IexN5xnH/o+rkwJErfpbL9B0
         cTd8XfqDHW+nCY2tJtuxzWRKqdLXJ3/h160tqDhdGPqjfgtAOSUdYlkhviOER0cmEcoO
         9Sew==
X-Gm-Message-State: AC+VfDzQIx1nsD5FbhLpZRrol11bRZo2zPmDPBPMpbC2odn7wefrHZGF
	RIFu+brsEQGcvFfhkO2g3n+1s9OWJMie0w2VOqg=
X-Google-Smtp-Source: ACHHUZ5ja8bZ3Ma/lzFyJGdan7jkXrsKOmmJXjhxvrXILS4V+ZNLzwM/6ID9I2oXbI3TE6BVuXmHvV/daKEMgKQnrEw=
X-Received: by 2002:a17:907:7f09:b0:973:a30d:b264 with SMTP id
 qf9-20020a1709077f0900b00973a30db264mr6940129ejc.46.1686470049410; Sun, 11
 Jun 2023 00:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230610141739.999268-1-bigunclemax@gmail.com>
 <20230610141739.999268-4-bigunclemax@gmail.com> <20230610-rehire-amid-2517f43504c0@spud>
 <CALHCpMiEmc8L=O86_x7-KkBHFwf2QpuP0M7ugz7dNPr71cpJmQ@mail.gmail.com>
 <20230610-enlarged-agonize-0e9219f9921d@spud> <20230610-crumpet-spender-4133090a4728@spud>
 <CALHCpMjFNvJAnd2_3-1n_L3QRz4eNc-Egm-BD6jcS6H694dSyg@mail.gmail.com> <20230610-whimsical-unrushed-2f5b30349588@spud>
In-Reply-To: <20230610-whimsical-unrushed-2f5b30349588@spud>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sun, 11 Jun 2023 10:53:56 +0300
Message-ID: <CALHCpMhQ8XxffHr_f=AtO-HoWadBQb1mSvojELctdwMKnF1tbw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] dt-bindings: thermal: sun8i: Add binding for
 D1/T113s THS controller
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_005414_067134_F55E80C5 
X-CRM114-Status: GOOD (  29.27  )
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

0LLRgSwgMTEg0LjRjtC9LiAyMDIz4oCv0LMuINCyIDAxOjE0LCBDb25vciBEb29sZXkgPGNvbm9y
QGtlcm5lbC5vcmc+Ogo+Cj4gT24gU2F0LCBKdW4gMTAsIDIwMjMgYXQgMTE6MzE6MDNQTSArMDMw
MCwgTWF4aW0gS2lzZWxldiB3cm90ZToKPiA+INGB0LEsIDEwINC40Y7QvS4gMjAyM+KAr9CzLiDQ
siAyMTowMSwgQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPjoKPiA+Cj4gPiAuLi4KPiA+
Cj4gPiA+ID4gPiA+ICsgIC0gfAo+ID4gPiA+ID4gPiArICAgIHRoZXJtYWwtc2Vuc29yQDIwMDk0
MDAgewo+ID4gPiA+ID4gPiArICAgICAgICAgIGNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjIw
aS1kMS10aHMiOwo+ID4gPiA+ID4gPiArICAgICAgICAgIHJlZyA9IDwweDAyMDA5NDAwIDB4NDAw
PjsKPiA+ID4gPiA+ID4gKyAgICAgICAgICBpbnRlcnJ1cHRzID0gPDAgOTAgMD47Cj4gPiA+ID4g
PiA+ICsgICAgICAgICAgY2xvY2tzID0gPCZjY3UgMD47Cj4gPiA+ID4gPiA+ICsgICAgICAgICAg
Y2xvY2stbmFtZXMgPSAiYnVzIjsKPiA+ID4gPiA+ID4gKyAgICAgICAgICByZXNldHMgPSA8JmNj
dSAyPjsKPiA+ID4gPiA+ID4gKyAgICAgICAgICBudm1lbS1jZWxscyA9IDwmdGhzX2NhbGlicmF0
aW9uPjsKPiA+ID4gPiA+ID4gKyAgICAgICAgICBudm1lbS1jZWxsLW5hbWVzID0gImNhbGlicmF0
aW9uIjsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAjdGhlcm1hbC1zZW5zb3ItY2VsbHMgPSA8MD47
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+PiBJcyB0aGlzIGNhbGlicmF0aW9uIHJlcXVpcmVkLCBv
ciBvcHRpb25hbCwgZm9yIHRoZSBkMT8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBDYWxpYnJhdGlvbiBk
YXRhIGZvciB0aGUgRDEgaXMgb3B0aW9uYWwgYXMgZm9yIHRoZSBINi4KPiA+ID4gPiA+IChCdXQg
d2l0aG91dCBpdCwgdGhlIHNlbnNvciBkYXRhIHdpbGwgYmUgaW5hY2N1cmF0ZSkuCj4gPiA+ID4K
PiA+ID4gPiBPa2F5LiBNb2R1bG8gdGhlIHNpZ25vZmY6Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IENv
bm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPiA+Cj4gPiA+IFdhaXQs
IHRoYXQncyBub3Qgd2hhdCBJIG1lYW50IHRvIHNheS4uLiBDbGVhcmx5IHR1cm5lZCBteSBicmFp
biBvZmYgZm9yCj4gPiA+IGEgbW9tZW50LiBJZiBpdCBpcyBub3QgZ29pbmcgdG8gZnVuY3Rpb24g
Y29ycmVjdGx5IHdpdGhvdXQgdGhlCj4gPiA+IGNhbGlicmF0aW9uIGRhdGEsIHdoeSBub3QgbWFr
ZSB0aGUgY2FsaWJyYXRpb24gZGF0YSByZXF1aXJlZCBmb3IgdGhlCj4gPiA+IGQxJ3MgdGhzPwo+
ID4KPiA+IEkgZG9uJ3QgcmVhbGx5IGtub3cgd2h5LCBidXQgdGhlIGNhbGlicmF0aW9uIGRhdGEg
aXMgb3B0aW9uYWwgZm9yCj4gPiBvdGhlciBjb250cm9sbGVycy4KPiA+IFNvIEkganVzdCBkaWQg
aXQgdGhlIHNhbWUgd2F5Lgo+ID4gSGVyZSBpcyBleHBsYW5hdGlvbiBjb21tZW50IGFib3V0IGl0
IGZyb20gdGhlIGRyaXZlcjoKPiA+ICAgICAgICAgLyoKPiA+ICAgICAgICAgICogRXZlbiBpZiB0
aGUgZXh0ZXJuYWwgY2FsaWJyYXRpb24gZGF0YSBzdG9yZWQgaW4gc2lkIGlzCj4gPiAgICAgICAg
ICAqIG5vdCBhY2Nlc3NpYmxlLCB0aGUgVEhTIGhhcmR3YXJlIGNhbiBzdGlsbCB3b3JrLCBhbHRo
b3VnaAo+ID4gICAgICAgICAgKiB0aGUgZGF0YSB3b24ndCBiZSBzbyBhY2N1cmF0ZS4KPiA+ICAg
ICAgICAgICoKPiA+ICAgICAgICAgICogVGhlIGRlZmF1bHQgdmFsdWUgb2YgY2FsaWJyYXRpb24g
cmVnaXN0ZXIgaXMgMHg4MDAgZm9yCj4gPiAgICAgICAgICAqIGV2ZXJ5IHNlbnNvciwgYW5kIHRo
ZSBjYWxpYnJhdGlvbiB2YWx1ZSBpcyB1c3VhbGx5IDB4N3h4Cj4gPiAgICAgICAgICAqIG9yIDB4
OHh4LCBzbyB0aGV5IHdvbid0IGJlIGF3YXkgZnJvbSB0aGUgZGVmYXVsdCB2YWx1ZQo+ID4gICAg
ICAgICAgKiBmb3IgYSBsb3QuCj4gPiAgICAgICAgICAqCj4gPiAgICAgICAgICAqIFNvIGhlcmUg
d2UgZG8gbm90IHJldHVybiBlcnJvciBpZiB0aGUgY2FsaWJyYXRpb24gZGF0YSBpcwo+ID4gICAg
ICAgICAgKiBub3QgYXZhaWxhYmxlLCBleGNlcHQgdGhlIHByb2JlIG5lZWRzIGRlZmVycmluZy4K
PiA+ICAgICAgICAgICovCj4KPiBXYWl0LCBzbyBpZiB0aGVyZSBpcyBubyBjYWxpYnJhdGlvbiBk
YXRhIHRoZW4gdGhpcyB0aGluZyB3aWxsIGp1c3QgZGVmZXIKPiBwcm9iaW5nLCBhZCBpbmZpbml0
dW0/IExvb2tzIGxpa2UgZXZlcnl0aGluZyBvdGhlciB0aGFuIHRoZSBhMzMgaGFzIHRoZQo+IGNl
bGxzIGluIHRoZSBkdHMsIGFuZCB0aGUgc29mdHdhcmUgc2VlbXMgdG8gZXhwZWN0IHRoZSBjZWxs
cy4KPiBXaGF0IGFtIEkgbWlzc2luZz8KCk5vdCBxdWl0ZS4gSWYgd2UgZG9uJ3QgaGF2ZSBhIGNh
bGlicmF0aW9uIGNlbGwgaW4gdGhlIGR0cywgdGhlbiB3ZQpqdXN0IHNraXAgdGhlIGNhbGlicmF0
aW9uLgpXZSB3aWxsIG9ubHkgZ2V0IEVQUk9CRV9ERUZFUiBpZiB3ZSBoYXZlIGNhbGlicmF0aW9u
IGluIHRoZSBkdHMuCkhlcmUgaXMgdGhlIHdob2xlIGZ1bmN0aW9uIGNvZGU6CgpzdGF0aWMgaW50
IHN1bjhpX3Roc19jYWxpYnJhdGUoc3RydWN0IHRoc19kZXZpY2UgKnRtZGV2KQp7CiAgICBzdHJ1
Y3QgbnZtZW1fY2VsbCAqY2FsY2VsbDsKICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9IHRtZGV2LT5k
ZXY7CiAgICB1MTYgKmNhbGRhdGE7CiAgICBzaXplX3QgY2FsbGVuOwogICAgaW50IHJldCA9IDA7
CgogICAgY2FsY2VsbCA9IGRldm1fbnZtZW1fY2VsbF9nZXQoZGV2LCAiY2FsaWJyYXRpb24iKTsK
ICAgIGlmIChJU19FUlIoY2FsY2VsbCkpIHsKICAgICAgICBpZiAoUFRSX0VSUihjYWxjZWxsKSA9
PSAtRVBST0JFX0RFRkVSKQogICAgICAgICAgICByZXR1cm4gLUVQUk9CRV9ERUZFUjsKICAgICAg
ICAvKgogICAgICAgICAqIEV2ZW4gaWYgdGhlIGV4dGVybmFsIGNhbGlicmF0aW9uIGRhdGEgc3Rv
cmVkIGluIHNpZCBpcwogICAgICAgICAqIG5vdCBhY2Nlc3NpYmxlLCB0aGUgVEhTIGhhcmR3YXJl
IGNhbiBzdGlsbCB3b3JrLCBhbHRob3VnaAogICAgICAgICAqIHRoZSBkYXRhIHdvbid0IGJlIHNv
IGFjY3VyYXRlLgogICAgICAgICAqCiAgICAgICAgICogVGhlIGRlZmF1bHQgdmFsdWUgb2YgY2Fs
aWJyYXRpb24gcmVnaXN0ZXIgaXMgMHg4MDAgZm9yCiAgICAgICAgICogZXZlcnkgc2Vuc29yLCBh
bmQgdGhlIGNhbGlicmF0aW9uIHZhbHVlIGlzIHVzdWFsbHkgMHg3eHgKICAgICAgICAgKiBvciAw
eDh4eCwgc28gdGhleSB3b24ndCBiZSBhd2F5IGZyb20gdGhlIGRlZmF1bHQgdmFsdWUKICAgICAg
ICAgKiBmb3IgYSBsb3QuCiAgICAgICAgICoKICAgICAgICAgKiBTbyBoZXJlIHdlIGRvIG5vdCBy
ZXR1cm4gZXJyb3IgaWYgdGhlIGNhbGlicmF0aW9uIGRhdGEgaXMKICAgICAgICAgKiBub3QgYXZh
aWxhYmxlLCBleGNlcHQgdGhlIHByb2JlIG5lZWRzIGRlZmVycmluZy4KICAgICAgICAgKi8KICAg
ICAgICBnb3RvIG91dDsKICAgIH0KCiAgICBjYWxkYXRhID0gbnZtZW1fY2VsbF9yZWFkKGNhbGNl
bGwsICZjYWxsZW4pOwogICAgaWYgKElTX0VSUihjYWxkYXRhKSkgewogICAgICAgIHJldCA9IFBU
Ul9FUlIoY2FsZGF0YSk7CiAgICAgICAgZ290byBvdXQ7CiAgICB9CgogICAgdG1kZXYtPmNoaXAt
PmNhbGlicmF0ZSh0bWRldiwgY2FsZGF0YSwgY2FsbGVuKTsKCiAgICBrZnJlZShjYWxkYXRhKTsK
b3V0OgogICAgcmV0dXJuIHJldDsKfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
