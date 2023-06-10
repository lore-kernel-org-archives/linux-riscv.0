Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00942C7EE29
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6SuPNpBEXRcQuNryjOz6iTMHuynQTiJo9aVs1dLm30=; b=guaxOL/55BGJVx
	/IXVYdlHI5KRB5OD0NVI0Kjx8jFY1eQfd4Io8LeiIuI6oI/DIVHIwYHUf18+ni7iXxG7N2U59MRVG
	RKxMzeHjyac4+YN/BVYZkh4t9LbFc/J3r2Q3VgaddRvgJb7VN08+/7MOFX39jqinKfUQ2xZ8x2tAC
	RRNh3vsEKFE4+u9M2gRM+b116rI0rdGS3rHl6DfjhK0uowNVGzZOdM7WNI8OMOISZjxvJa/i6UxKw
	zMz2QmzR9p9/bs78kBZGLKppg5mpjSMkLoOaTusyIFjVcJ7KdscN0ape9+xTqZJZq2X9oaxMBsa0A
	AbCDIeUBFztntPyZQ4hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q81G6-00GXOn-0o;
	Sat, 10 Jun 2023 16:16:10 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q81G2-00GXO8-1K;
	Sat, 10 Jun 2023 16:16:07 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-97881a996a0so504356866b.0;
        Sat, 10 Jun 2023 09:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686413764; x=1689005764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iykgIKjjxkQC0iF6CPvpsM3rMPFudjl8N64c3ex61jQ=;
        b=Mtf6He6s/QN8TiwNWeLCZoj5CiJRnWMFhVFukaHoOI1KbHqGnhnl/J6wDRpo8I0fd7
         DIE0pXHUYRQ3V6sInfXdt7i/M2x4DYfm9MCsS4fo7AUVLWkoRcYqtGM/fCiqkIcxYdK1
         hKPPeMAplt+2UGvUJHY8QAbGKFZ4UwoBgox+l8MKei3qg7jHMoaHi+I0K3/rFClznYid
         r+b3V7dhBx/iDlTLg8zODMYiBnvWUkpyKvEKaV9AuUUXpRs8HWqO6tamF444Wj3RH5YZ
         /8ampRyNylIpDBzksaGvcLUrcJVkdhm5AgXJ0BytOlynw9ZYbdkGDmEAb37hG1QdS7AS
         OSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686413764; x=1689005764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iykgIKjjxkQC0iF6CPvpsM3rMPFudjl8N64c3ex61jQ=;
        b=R7vMYo4LRXrs9QbU2koRuahzGxl+JCY16w6UZuvZ3ayZdRujzYd8uy5xbKiuSLqc5l
         DVKhPZGQPiy1xPCOjcuEdGdoIdU171rt958+XQAYx4TGatN5cHCaiQF5g7yRRv+DB4+3
         4YwZP676KpKz2ubvbaIXumT7eeJQ0tX2qre0/NYV/hsUqP0nVPCzwxlvMVQ+bhD+Fzyk
         nykzp6MSYIN5MkRq9SqL9aDDnJ1+0gJjEjcghn1pGi2E72E64WWbKHkokCXeMVWdHZ4f
         zowjAhIL3yZumQXBbsLUX5aIJeX9k4/S7ZnhTnMc7+RlJvVy3NnqxKAMyjdmyJ83WhZi
         T0tA==
X-Gm-Message-State: AC+VfDyM4ns3L7Ic1uQlrqr7pgpJfLAU6jsHE3N5xNXH6+Ri4FWXZNEp
	kJdcEWpDCLsf02ML+j84v9yOUDbh49quNFCYmEo=
X-Google-Smtp-Source: ACHHUZ5MSGxwbWWnndDcYjuv/3cdAQTV5Zw6a33v7H1CVdOEzhJP97/iR4Mnt8zGvf9ZP03fMF0YpgAyTbQP2Lse/UM=
X-Received: by 2002:a17:907:7244:b0:97e:a9ed:16bb with SMTP id
 ds4-20020a170907724400b0097ea9ed16bbmr786437ejc.18.1686413763631; Sat, 10 Jun
 2023 09:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230610122934.953106-1-bigunclemax@gmail.com>
 <20230610122934.953106-3-bigunclemax@gmail.com> <20230610-ranged-outboard-2aaa0cc36cbd@spud>
 <CALHCpMhHxAdDMGmpD9i2Kt93XqyrW_ABzr7FZSE-0+54LwgzPw@mail.gmail.com> <20230610-enchanted-late-e545ab2d74a0@spud>
In-Reply-To: <20230610-enchanted-late-e545ab2d74a0@spud>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sat, 10 Jun 2023 19:15:52 +0300
Message-ID: <CALHCpMg=k8r4o+qhLi-e3qSUFZp_4N0F=U1vDazoDQgJwZs3tg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
To: Conor Dooley <conor@kernel.org>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Cosmin Tanislav <demonsingur@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, William Breathitt Gray <william.gray@linaro.org>, 
	ChiYuan Huang <cy_huang@richtek.com>, Ramona Bolboaca <ramona.bolboaca@analog.com>, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Haibo Chen <haibo.chen@nxp.com>, 
	=?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_091606_472640_C945DAFD 
X-CRM114-Status: GOOD (  11.69  )
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

0YHQsSwgMTAg0LjRjtC9LiAyMDIz4oCv0LMuINCyIDE4OjUzLCBDb25vciBEb29sZXkgPGNvbm9y
QGtlcm5lbC5vcmc+Ogo+Cj4gT24gU2F0LCBKdW4gMTAsIDIwMjMgYXQgMDY6NDg6MDhQTSArMDMw
MCwgTWF4aW0gS2lzZWxldiB3cm90ZToKPiA+IEhleSwKPiA+Cj4gPiDRgdCxLCAxMCDQuNGO0L0u
IDIwMjPigK/Qsy4g0LIgMTg6MDYsIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz46Cj4g
Pgo+ID4gLi4uCj4gPgo+ID4gPiA+Kwo+ID4gPiA+KyAgICByZXF1aXJlZDoKPiA+ID4gPisgICAg
ICAtIHJlZwo+ID4gPiA+Kwo+ID4gPiA+KyAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UK
Pgo+IFsxXQo+Cj4gPiA+ID4rCj4gPiA+ID4rcmVxdWlyZWQ6Cj4gPiA+ID4rICAtICIjaW8tY2hh
bm5lbC1jZWxscyIKPiA+ID4gPisgIC0gY2xvY2tzCj4gPiA+ID4rICAtIGNvbXBhdGlibGUKPiA+
ID4gPisgIC0gaW50ZXJydXB0cwo+ID4gPiA+KyAgLSByZWcKPiA+ID4gPisgIC0gcmVzZXRzCj4g
PiA+ID4rCj4gPiA+ID4rdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gPgo+ID4gPiBI
b3cgY29tZSB0aGlzIG9uZSBjaGFuZ2VkIHRvIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2U/
Cj4gPiA+IFdhc24ndCBpdCBmb3IgdGhlIEFEQyB0aGF0IHdlIHByZXZpb3VzbHkgZGlzY3Vzc2Vk
IHdoZXRoZXIKPiA+ID4gYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlIHdhcyBjb3JyZWN0IG9y
IG5vdD8KPiA+Cj4gPiBIbW0sIEkgY2hhbmdlZCBpdCB0byBgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVz
OiBmYWxzZWAgYXMgeW91IHN1Z2dlc3RlZAo+ID4gaW4gdGhpcyBtZXNzYWdlCj4gPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMwNjA0LWFmdGVybm9vbi1mcmlnaHRlbi00MjIyMjAx
MDU1N2JAc3B1ZC8KPgo+IFRoYXQgd2FzIGFib3V0IHRoZSBhZGMgY2hpbGQgbm9kZXMgWzFdLCBu
b3QgYXQgdGhlIHRvcCBsZXZlbCwgbm8/CgpJbmRlZWQsIEkgY29uZnVzZWQgaXQsIHNvcnJ5LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
