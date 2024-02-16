Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5F9C48BC4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8AejE2JsRcnw1wSWmAy6hmRZBxRaR23c/bjdYQdsS08=; b=PSCVtNnFAnu/oo
	qUrQhRfIwipD6BWx7sEOLflh3YbWVCNht/gwdNryW0MQAw6unA1QI+rcXaFcQqt7X/T1V1r+H9hv+
	iKM/pBZDF2IsMafY9bMN5vpdp8sIUOjG+DuPdFKtRumDr4j1tgi8TyfmiYSx0uyTmKTRuq7WyN8xt
	aGL/Jdk6aMI2mqvNB6hDGTPw9FtwPeXHR874+RPz/xsYTPqAa1tE4RJRQq88xKwRcyadMpWY9pddS
	+lXxqDmxAre9VRqw92k98xFPdMRtOAe3NysJNHaAKOg0EkYQ+ryKa5GJDR/azitq09Puz6igihjhn
	yA68zsjzdqD0BSSV9Zlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raz3O-00000002afe-34Eu;
	Fri, 16 Feb 2024 14:19:02 +0000
Received: from mail-io1-f54.google.com ([209.85.166.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raz3L-00000002aeB-1s8U
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 14:19:01 +0000
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7bfd527d443so63052939f.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708093138; x=1708697938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeuOE0EFMegO/dS0ehIexjTqXFt2216JGNfZrumvThs=;
        b=DbCDShgoUx73J1S76wRlD7sQGtRZQheGYEtioHcFKLpIZ7HnzgKEuuj3Vw+7v/3/5+
         snGFkobnaHlBGovwiEuzGEFQ4p6+p554q+NFQpq6LMBr73I4Lf3m8k6GSoWNKHTY9bBQ
         JPV7qC3ZkYDdRfrABTlDnbewPa4rJlWM1E2RNkUsXHBsLRzvaI9CloWuwCZQGMGvyia+
         KTPnp5BZnjw/+hjZg7wPsHjbtqIs1mMTAZtW7RbvxhJLD/FNqAVMlfpZLogcQFgnCEJu
         qW1LLqIz0AlEppF0SgRWfSMZOf52DkpszRCF1lsBzlAdILZ6AdYg5r2RWdmWxNjhROjN
         sAiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv3TaU7eSoE0maxXWwtnFKL3blroMhl5BOByNgftSIESe0J4CE/oksTmy4VfF+l5yf6xTBQTCL6NLLcj2LTQ8gzLjkeH1M64XmsHqycCuK
X-Gm-Message-State: AOJu0Yy8BRgsCjw+KAwH8qusdCKwYtEZICHFXZa3QBLhYIRFcfGITk1V
	i/QEHMfc3WEBjZSf4030Jusu/VMLQxwo4FVoi8cHg1HUsDMUrgl/sQQ+QEsDQeI=
X-Google-Smtp-Source: AGHT+IFXSlS4uM1rpMvg4thWnrMF1HAlykFJm3ze4OXqNL4QVcqmcQlt7gmibvIhiMpicF7pbVd9NA==
X-Received: by 2002:a05:6602:3404:b0:7c4:583:bdfe with SMTP id n4-20020a056602340400b007c40583bdfemr7529338ioz.1.1708093138294;
        Fri, 16 Feb 2024 06:18:58 -0800 (PST)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id fh18-20020a056638629200b00473f31f96desm769001jab.90.2024.02.16.06.18.58
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:18:58 -0800 (PST)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-364efe11f6aso10333545ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:18:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1sAfKrSh9XiTAEC/WC2IUXEbTI6ZQ+dwQR3u0R9RFvJlugjiMwwtMIgq1TvwuBBJWn0eeTKYvN4ffsDdG9TOoOlsg7cwteG29zlXkukDy
X-Received: by 2002:a25:6905:0:b0:dcd:1b8f:e6d3 with SMTP id
 e5-20020a256905000000b00dcd1b8fe6d3mr5491918ybc.48.1708092735326; Fri, 16 Feb
 2024 06:12:15 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-17-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-17-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:12:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXhu9H71w0oB_3NGL9xJWirfxgwjt+ngB-BMcD7KEgMHg@mail.gmail.com>
Message-ID: <CAMuHMdXhu9H71w0oB_3NGL9xJWirfxgwjt+ngB-BMcD7KEgMHg@mail.gmail.com>
Subject: Re: [PATCH 16/17] arm64: dts: renesas: r9a08g045: Update
 #power-domain-cells = <1>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_061859_511216_F952D827 
X-CRM114-Status: GOOD (  15.71  )
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

SGkgQ2xhdWRpdSwKCk9uIFRodSwgRmViIDgsIDIwMjQgYXQgMTo0NOKAr1BNIENsYXVkaXUgPGNs
YXVkaXUuYmV6bmVhQHR1eG9uLmRldj4gd3JvdGU6Cj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNs
YXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgo+Cj4gVXBkYXRlIENQRyAjcG93ZXItZG9t
YWluLWNlbGxzID0gPDE+IGFuZCBtb3ZlIGFsbCB0aGUgSVBzIHRvIGJlIHBhcnQgb2YgdGhlCj4g
SVAgc3BlY2lmaWMgcG93ZXIgZG9tYWluIGFzIHRoZSBkcml2ZXIgaGFzIGJlZW4gbW9kaWZpZWQg
dG8gc3VwcG9ydCBtdWx0aXBsZQo+IHBvd2VyIGRvbWFpbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBD
bGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+CgpUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghCgo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEw
OGcwNDUuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOGcwNDUu
ZHRzaQo+IEBAIC0xNjgsNyArMTY4LDcgQEAgaXJxYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAMTEw
NTAwMDAgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY3BnIENQR19NT0Qg
UjlBMDhHMDQ1X0lBNTVfQ0xLPiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
JmNwZyBDUEdfTU9EIFI5QTA4RzA0NV9JQTU1X1BDTEs+Owo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGNsb2NrLW5hbWVzID0gImNsayIsICJwY2xrIjsKPiAtICAgICAgICAgICAgICAgICAgICAg
ICBwb3dlci1kb21haW5zID0gPCZjcGc+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIHBvd2Vy
LWRvbWFpbnMgPSA8JmNwZyBSOUEwOEcwNDVfUERfQUxXQVlTX09OPjsKClI5QTA4RzA0NV9QRF9J
QTU1Cgo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlc2V0cyA9IDwmY3BnIFI5QTA4RzA0NV9J
QTU1X1JFU0VUTj47Cj4gICAgICAgICAgICAgICAgIH07Cj4KClRoZSByZXN0IExHVE0uCgpHcntv
ZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgoKLS0KR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRv
IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRo
YXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
