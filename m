Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0CFC54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 14:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uM1cJi/e+aGF/dJ/bJn50VeOzxK+E+dis4Nw0LvvSMk=; b=y8QZS+AVg68xsF
	mgQIoaHYa7C4L5Va2tvXrWnLvtceCiv0ie7URUqQE7gteHUm+mvzLwG7CVNFn4bRaCgi7c8Vol7/o
	hChsG7Wf/XXyYe72XmYRlMhQbiAtghqhp/rPbZBPzDtBVNYr86Qe74cgBsPq4qvUr/+dRX/U4GVyW
	i8jM9Z3kQni8/ZB6Nfj0KCpeO2oLkuJ/RYrQvmdLHpDZiRBpflzOACidJ0pe8VI1vNaV81sTj/dmR
	Jv7DSsZNqRlEcNiZq7KrnlLTjpiH9rqRroB+cdWZnG/Mib2txzev7gxv427W8kMPz2Y898WEL+w+P
	YQYTuaxNyxe5dEPw1x6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhW2i-0000000E613-3LQ5;
	Tue, 05 Mar 2024 14:45:21 +0000
Received: from mail-yw1-f181.google.com ([209.85.128.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhW2f-0000000E5zw-2N8g
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 14:45:19 +0000
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-607e54b6cf5so39791177b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 06:45:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709649913; x=1710254713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9i6CwydHdc4za10aM3u8vcYxRtgXXdjZlKPLkkrrifs=;
        b=DNS2cQB4b8G2sLWKt6L2HXS/qAQTzyetzVXnPC60OtOyoXWUXfCT1xWyYlw9gi61hy
         xyaub4qEs7ldqRpQZNu97U/Y+mlNMonVphnFCBTIldFEOhpZ7MVvtTH7OaVLgsPtdOyU
         cAc4XjV4KjaufkToxwH7tbl9dJU3kOrXTOqK0/haN3CSJgbBvR/1JsuSNwZMDNFlcu6U
         F7okreXoX1jpKBp1g2LX9RkUUCcFc7yj+u7Os4RL3b6Vkh9yxFiJhN7JyxEr0rB8jx4O
         CSd3L6BhfeXJxPerab2cZibMXdcED55UAJsKMSRIJ2QyIRFxMYw/y8UyEiDgI8H1n0Hk
         DhEA==
X-Forwarded-Encrypted: i=1; AJvYcCVV1bt/qrSB2S837/yju1eM8hckFMvwlQjYchioxjf+EaX4y2SgDDDFzfKs2IFMOLgatHD6bQkO+krHU0+41x3LzvEkKNLIi+8YGv7gA3Ot
X-Gm-Message-State: AOJu0Yw7d8ZV7eDjTowdQA84AV+ndETddRz9PipZGspwg3+736gwXE7+
	CvDONRC8v0xd1mElJOfmHHk3ZmuwvIzd6e7OFk9gzjm/0M9cxdfbGjOHuGAo2SE=
X-Google-Smtp-Source: AGHT+IEA03Ecv1Crx/60o8LWcGuX8A0vgkufAno5nRUZJXs8SNpltNcGdbhLRyFTJagd6/fXzvj5jg==
X-Received: by 2002:a0d:db44:0:b0:609:3cb9:414 with SMTP id d65-20020a0ddb44000000b006093cb90414mr2099358ywe.5.1709649912756;
        Tue, 05 Mar 2024 06:45:12 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id t125-20020a818383000000b005ff846d1f1dsm3165844ywf.134.2024.03.05.06.45.11
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 06:45:11 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6084e809788so52880277b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 06:45:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX8DI4wf8PagQAU48lSy2gDhQ5kAgQ5i1QKn3AQdUdvoj57gOBBkoPsMHCYdA/Z0Q9pO2p34cxljliQzYsuESxdx4ofke4IOnGJz9kzIS+S
X-Received: by 2002:a25:aa85:0:b0:dc6:cf8e:8f97 with SMTP id
 t5-20020a25aa85000000b00dc6cf8e8f97mr2212248ybi.27.1709649911607; Tue, 05 Mar
 2024 06:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20240213144638.341509-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240213144638.341509-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Mar 2024 15:44:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWw0dteXO2jw4cwGvzKcL6vmnb96C=qgPgUqNDMtF6X0Q@mail.gmail.com>
Message-ID: <CAMuHMdWw0dteXO2jw4cwGvzKcL6vmnb96C=qgPgUqNDMtF6X0Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: replace underscores in node names
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk <linux-clk@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_064517_731186_3AA78125 
X-CRM114-Status: GOOD (  18.03  )
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

SGkgS3J6eXN6dG9mCgpPbiBUdWUsIEZlYiAxMywgMjAyNCBhdCAzOjQ44oCvUE0gS3J6eXN6dG9m
IEtvemxvd3NraQo8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPiBVbmRl
cnNjb3JlcyBzaG91bGQgbm90IGJlIHVzZWQgaW4gbm9kZSBuYW1lcyAoZHRjIHdpdGggVz0yIHdh
cm5zIGFib3V0Cj4gdGhlbSksIHNvIHJlcGxhY2UgdGhlbSB3aXRoIGh5cGhlbnMuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFy
by5vcmc+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIHdoaWNoIGlzIG5vdyBjb21taXQgZjAzNjA2
NDcwODg2ZTc4MSAoInJpc2N2OgpkdHM6IHN0YXJmaXZlOiByZXBsYWNlIHVuZGVyc2NvcmVzIGlu
IG5vZGUgbmFtZXMiKSBpbiB2Ni44LXJjNi4KClRoaXMgY2F1c2VzIGUuZy4gQmVhZ2xlViBTdGFy
bGlnaHQgdG8gaGFuZyBkdXJpbmcgYm9vdCB3aXRob3V0IGFueQpvdXRwdXQuICBCb290aW5nIHdp
dGggImVhcmx5Y29uIiByZXZlYWxzOgoKICAgIGR3LWFwYi11YXJ0IDEyNDQwMDAwLnNlcmlhbDog
ZXJyb3IgLUVJTlZBTDogY2xvY2sgcmF0ZSBub3QgZGVmaW5lZAogICAgZHctYXBiLXVhcnQ6IHBy
b2JlIG9mIDEyNDQwMDAwLnNlcmlhbCBmYWlsZWQgd2l0aCBlcnJvciAtMjIKCmFuZCBpbmRlZWQs
IHAtPnVhcnRjbGsgPSAwLgoKPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2po
NzEwMC5kdHNpCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMDAuZHRz
aQo+IEBAIC0xMTMsMjggKzExMywyOCBAQCBjcHVfY3JpdCB7Cj4gICAgICAgICAgICAgICAgIH07
Cj4gICAgICAgICB9Owo+Cj4gLSAgICAgICBvc2Nfc3lzOiBvc2Nfc3lzIHsKPiArICAgICAgIG9z
Y19zeXM6IG9zYy1zeXMgewo+ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLWNs
b2NrIjsKPiAgICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDA+Owo+ICAgICAgICAgICAg
ICAgICAvKiBUaGlzIHZhbHVlIG11c3QgYmUgb3ZlcnJpZGRlbiBieSB0aGUgYm9hcmQgKi8KPiAg
ICAgICAgICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDA+Owo+ICAgICAgICAgfTsKPgo+IC0g
ICAgICAgb3NjX2F1ZDogb3NjX2F1ZCB7Cj4gKyAgICAgICBvc2NfYXVkOiBvc2MtYXVkIHsKPiAg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7Cj4gICAgICAgICAgICAg
ICAgICNjbG9jay1jZWxscyA9IDwwPjsKPiAgICAgICAgICAgICAgICAgLyogVGhpcyB2YWx1ZSBt
dXN0IGJlIG92ZXJyaWRkZW4gYnkgdGhlIGJvYXJkICovCj4gICAgICAgICAgICAgICAgIGNsb2Nr
LWZyZXF1ZW5jeSA9IDwwPjsKPiAgICAgICAgIH07Cj4KPiAtICAgICAgIGdtYWNfcm1paV9yZWY6
IGdtYWNfcm1paV9yZWYgewo+ICsgICAgICAgZ21hY19ybWlpX3JlZjogZ21hYy1ybWlpLXJlZiB7
Cj4gICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOwo+ICAgICAgICAg
ICAgICAgICAjY2xvY2stY2VsbHMgPSA8MD47Cj4gICAgICAgICAgICAgICAgIC8qIFNob3VsZCBi
ZSBvdmVycmlkZGVuIGJ5IHRoZSBib2FyZCB3aGVuIG5lZWRlZCAqLwo+ICAgICAgICAgICAgICAg
ICBjbG9jay1mcmVxdWVuY3kgPSA8MD47Cj4gICAgICAgICB9Owo+Cj4gLSAgICAgICBnbWFjX2dy
X21paV9yeGNsazogZ21hY19ncl9taWlfcnhjbGsgewo+ICsgICAgICAgZ21hY19ncl9taWlfcnhj
bGs6IGdtYWMtZ3ItbWlpLXJ4Y2xrIHsKPiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJm
aXhlZC1jbG9jayI7Cj4gICAgICAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDwwPjsKPiAgICAg
ICAgICAgICAgICAgLyogU2hvdWxkIGJlIG92ZXJyaWRkZW4gYnkgdGhlIGJvYXJkIHdoZW4gbmVl
ZGVkICovCgpUaGUgY2xvY2sgZHJpdmVyIHJlbGllcyBvbiB0aGUgY2xvY2sgbmFtZXMsIHdoaWNo
IGFyZSAoaW4gdGhlIGFic2VuY2UKb2YgY2xvY2stb3V0cHV0LW5hbWVzIHByb3BlcnRpZXMpIGlk
ZW50aWNhbCB0byB0aGUgYWN0dWFsIG5vZGUgbmFtZXM6Cgpkcml2ZXJzL2Nsay9zdGFyZml2ZS9j
bGstc3RhcmZpdmUtamg3MTAwLmM6ICAgIHBhcmVudHNbaV0uZndfbmFtZSA9ICJvc2Nfc3lzIjsK
ZHJpdmVycy9jbGsvc3RhcmZpdmUvY2xrLXN0YXJmaXZlLWpoNzEwMC5jOiAgICBwYXJlbnRzW2ld
LmZ3X25hbWUgPSAib3NjX2F1ZCI7CmRyaXZlcnMvY2xrL3N0YXJmaXZlL2Nsay1zdGFyZml2ZS1q
aDcxMDAuYzogICAgcGFyZW50c1tpXS5md19uYW1lID0KImdtYWNfcm1paV9yZWYiOwpkcml2ZXJz
L2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MTAwLmM6ICAgIHBhcmVudHNbaV0uZndfbmFt
ZSA9CiJnbWFjX2dyX21paV9yeGNsayI7CgpIZW5jZSB0aGVzZSBjbG9ja3MgY2FuIG5vIGxvbmdl
ciBiZSBmb3VuZCwgYW5kIGFsbCBjaGlsZHJlbiBoYXZlIGEKemVybyBjbG9jayByYXRlLCBjYXVz
aW5nIHRoZSBicmVha2FnZS4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
