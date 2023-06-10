Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F08C7EE29
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 20:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V70Mjc+AHzcyydTquvlh8Qvqt5VePR+enZ3iTsFaYQ4=; b=CbnXH/WrHKcXK+
	Gnzeb0QsQUpqxKZMKzPrIww0cyhBwjHeBtJ9iY3CdiTYPf4za1F2O+H5KmdUFgPlBCwjQXrRSfoEZ
	eud7E4+++2KUEjpwdA0WFkf0OiiGhmlEQ1gn7VVbT2wyXtwsqEpHTwiiIbrPw/CQQBgYzi1Bp2WJG
	ysGJYvwvDffAnPXqkd6E2ZFCKStfzBeondLsnTsGKGUBgKXhuSFvdxNyjX6Hk2s1wGVrMCHm8kcxC
	+jOxdN0sgoGxH4RtEQHaHWg677I9PLs1r/KPtsQk6p8pS7GKiRIQLfuEF4+h4rGj1RbOCL7+lUr1W
	oh3ZYUl4U+kts0lxNWSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q85F7-00H0Le-0C;
	Sat, 10 Jun 2023 20:31:25 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q85F3-00H0JU-3C;
	Sat, 10 Jun 2023 20:31:23 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9788554a8c9so518211266b.2;
        Sat, 10 Jun 2023 13:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686429075; x=1689021075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CUfh0ADpVTOvYtA/QmP/1yzn/jTq6xsCBbjiRAuVBc=;
        b=M47Bs76cJZduUe2jX233QqIV+egitW4UlsEXHue+q2T4KOH4cAqzlb7wCpSXUpI5ei
         /Pi7TGIp+sOjRdi+kTM4L67E/u7YIbJu5mtyl5qUDc4RFchU5c7uHXsAAwTt2H1uoxCV
         Hfqzlj8/B7SADPb/+YEln2DmCrLl/Yo+Yzv6RjbzPMQEMW6/YascdgSIY28YE+Wec9/X
         dX91y+QUiMlkJ54z+Gc8eIHBpvT+1ngCWfGJUg4QW5plYiX6uWT0y75UJ+SRiTpW0A0o
         i+q82f/xOnog1S1/ovoy3GKVHDZl0Ns+Ce2hERd9m+gppCFbqIY+AmGOFjnmi9V37reW
         2Cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686429075; x=1689021075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CUfh0ADpVTOvYtA/QmP/1yzn/jTq6xsCBbjiRAuVBc=;
        b=YQwLVqbFu0Q9MpJ4WzpjNmDCio1oON9566KXCUWblxCeVAd4FdSahj1eBlpgRwHhys
         pVH0g606zEtH6z1aQmIlomembvIvpPOwSgEj/otc7odeoU7oLAStdad3cXsKSSDPpMx4
         FxFRKlkFjySC71DAM8I2IMho4GYOn92RoGXjPbm/CCaj/JdnFF82ty3eQ9dRaEylkEAl
         p6r+3xlEy9OB47Z0iY2AFhfHVkSSZ9jmI1kXTfh882RaCzLOWJT0eFMvoFzS+9QoUfwh
         XYhRPZFI690bZEV4vbGYC03ibFsrrmfaFkV/+e49ffhQ6w+Oir9hwSpuZwezvK3hkvKy
         vPsA==
X-Gm-Message-State: AC+VfDwzhN8I/KGVUcE2fPS7okxaOb/lBi5qCIbRbooNzw5BQSq5FhhE
	FYdGn3YomHCtks0YoOga9CwQfvZkhaGP5TyNzuY=
X-Google-Smtp-Source: ACHHUZ4dpstWeM5AQfuAw9+nOwca/wduEjuy/62JuC2LfBIkzmkX6x8lh9InUH1M4rzcmOxdrSkt3SvaUvu4hsiDGbc=
X-Received: by 2002:a17:907:9724:b0:979:7624:1f70 with SMTP id
 jg36-20020a170907972400b0097976241f70mr6808874ejc.18.1686429075593; Sat, 10
 Jun 2023 13:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230610141739.999268-1-bigunclemax@gmail.com>
 <20230610141739.999268-4-bigunclemax@gmail.com> <20230610-rehire-amid-2517f43504c0@spud>
 <CALHCpMiEmc8L=O86_x7-KkBHFwf2QpuP0M7ugz7dNPr71cpJmQ@mail.gmail.com>
 <20230610-enlarged-agonize-0e9219f9921d@spud> <20230610-crumpet-spender-4133090a4728@spud>
In-Reply-To: <20230610-crumpet-spender-4133090a4728@spud>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sat, 10 Jun 2023 23:31:03 +0300
Message-ID: <CALHCpMjFNvJAnd2_3-1n_L3QRz4eNc-Egm-BD6jcS6H694dSyg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230610_133122_035650_15F6D052 
X-CRM114-Status: GOOD (  18.64  )
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

0YHQsSwgMTAg0LjRjtC9LiAyMDIz4oCv0LMuINCyIDIxOjAxLCBDb25vciBEb29sZXkgPGNvbm9y
QGtlcm5lbC5vcmc+OgoKLi4uCgo+ID4gPiA+ICsgIC0gfAo+ID4gPiA+ICsgICAgdGhlcm1hbC1z
ZW5zb3JAMjAwOTQwMCB7Cj4gPiA+ID4gKyAgICAgICAgICBjb21wYXRpYmxlID0gImFsbHdpbm5l
cixzdW4yMGktZDEtdGhzIjsKPiA+ID4gPiArICAgICAgICAgIHJlZyA9IDwweDAyMDA5NDAwIDB4
NDAwPjsKPiA+ID4gPiArICAgICAgICAgIGludGVycnVwdHMgPSA8MCA5MCAwPjsKPiA+ID4gPiAr
ICAgICAgICAgIGNsb2NrcyA9IDwmY2N1IDA+Owo+ID4gPiA+ICsgICAgICAgICAgY2xvY2stbmFt
ZXMgPSAiYnVzIjsKPiA+ID4gPiArICAgICAgICAgIHJlc2V0cyA9IDwmY2N1IDI+Owo+ID4gPiA+
ICsgICAgICAgICAgbnZtZW0tY2VsbHMgPSA8JnRoc19jYWxpYnJhdGlvbj47Cj4gPiA+ID4gKyAg
ICAgICAgICBudm1lbS1jZWxsLW5hbWVzID0gImNhbGlicmF0aW9uIjsKPiA+ID4gPiArICAgICAg
ICAgICN0aGVybWFsLXNlbnNvci1jZWxscyA9IDwwPjsKPiA+ID4gPgo+ID4gPiA+PiBJcyB0aGlz
IGNhbGlicmF0aW9uIHJlcXVpcmVkLCBvciBvcHRpb25hbCwgZm9yIHRoZSBkMT8KPiA+ID4KPiA+
ID4gQ2FsaWJyYXRpb24gZGF0YSBmb3IgdGhlIEQxIGlzIG9wdGlvbmFsIGFzIGZvciB0aGUgSDYu
Cj4gPiA+IChCdXQgd2l0aG91dCBpdCwgdGhlIHNlbnNvciBkYXRhIHdpbGwgYmUgaW5hY2N1cmF0
ZSkuCj4gPgo+ID4gT2theS4gTW9kdWxvIHRoZSBzaWdub2ZmOgo+ID4gUmV2aWV3ZWQtYnk6IENv
bm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4KPiBXYWl0LCB0aGF0J3Mg
bm90IHdoYXQgSSBtZWFudCB0byBzYXkuLi4gQ2xlYXJseSB0dXJuZWQgbXkgYnJhaW4gb2ZmIGZv
cgo+IGEgbW9tZW50LiBJZiBpdCBpcyBub3QgZ29pbmcgdG8gZnVuY3Rpb24gY29ycmVjdGx5IHdp
dGhvdXQgdGhlCj4gY2FsaWJyYXRpb24gZGF0YSwgd2h5IG5vdCBtYWtlIHRoZSBjYWxpYnJhdGlv
biBkYXRhIHJlcXVpcmVkIGZvciB0aGUKPiBkMSdzIHRocz8KCkkgZG9uJ3QgcmVhbGx5IGtub3cg
d2h5LCBidXQgdGhlIGNhbGlicmF0aW9uIGRhdGEgaXMgb3B0aW9uYWwgZm9yCm90aGVyIGNvbnRy
b2xsZXJzLgpTbyBJIGp1c3QgZGlkIGl0IHRoZSBzYW1lIHdheS4KSGVyZSBpcyBleHBsYW5hdGlv
biBjb21tZW50IGFib3V0IGl0IGZyb20gdGhlIGRyaXZlcjoKICAgICAgICAvKgogICAgICAgICAq
IEV2ZW4gaWYgdGhlIGV4dGVybmFsIGNhbGlicmF0aW9uIGRhdGEgc3RvcmVkIGluIHNpZCBpcwog
ICAgICAgICAqIG5vdCBhY2Nlc3NpYmxlLCB0aGUgVEhTIGhhcmR3YXJlIGNhbiBzdGlsbCB3b3Jr
LCBhbHRob3VnaAogICAgICAgICAqIHRoZSBkYXRhIHdvbid0IGJlIHNvIGFjY3VyYXRlLgogICAg
ICAgICAqCiAgICAgICAgICogVGhlIGRlZmF1bHQgdmFsdWUgb2YgY2FsaWJyYXRpb24gcmVnaXN0
ZXIgaXMgMHg4MDAgZm9yCiAgICAgICAgICogZXZlcnkgc2Vuc29yLCBhbmQgdGhlIGNhbGlicmF0
aW9uIHZhbHVlIGlzIHVzdWFsbHkgMHg3eHgKICAgICAgICAgKiBvciAweDh4eCwgc28gdGhleSB3
b24ndCBiZSBhd2F5IGZyb20gdGhlIGRlZmF1bHQgdmFsdWUKICAgICAgICAgKiBmb3IgYSBsb3Qu
CiAgICAgICAgICoKICAgICAgICAgKiBTbyBoZXJlIHdlIGRvIG5vdCByZXR1cm4gZXJyb3IgaWYg
dGhlIGNhbGlicmF0aW9uIGRhdGEgaXMKICAgICAgICAgKiBub3QgYXZhaWxhYmxlLCBleGNlcHQg
dGhlIHByb2JlIG5lZWRzIGRlZmVycmluZy4KICAgICAgICAgKi8KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
