Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5630DC48BC3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 08:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yOmttvOxWSH64y5+1UVeKCAbKk82+seId5N0/3YZx90=; b=v+WMbMEbHf794s
	/T2BcETtHYp7CEkk+EwZvcsIgBM/FFCufElPDdCi9sMQuJtxkVhGr/JVpadyENikosi2voKpgWCSZ
	9ykBlc2JaCQCTvbEgk8PsJU7PGiaFepb/0Ghasorx1cLP3gEFIfdSLYn+JxmrhquAsQ5Qp+Esz6rc
	NXcHaPbamPTf8WPXc18iWD4pGur0xpIP/Y8v/ybOAueTBnlzQe4r4YTEBxVogbjGWD29uaX5DgNY2
	jw53XqeuTDiqw0nW1TZomhFqbMolasSelo35Qd49fEBjUfUiq83MHnfEOWWD5jx4hdXP9LPkszG8V
	cbaYwmfi7oqOjVuQZloA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbz1m-00000009aDO-1qDx;
	Mon, 19 Feb 2024 08:29:30 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbz1j-00000009a3w-2zaa
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 08:29:28 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d22b8801b9so24923521fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 00:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708331365; x=1708936165; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kWUWsnfwYVJB3NeJPGabmiQoX5d4BCcDZFFFL55Cbcc=;
        b=DfkGM5o8NkdqlKTpSjiAqP449grQhSZjJJqUng5rwBiiVmwyBDFsgtEXH1WZ8r2TlU
         DhYNAuT83hKFgSTFUbvGnGHJQwTBpebYJ1WQX6V41M+gb/NRnt2QAS0uRY78DK5TxQ/g
         SQxuJdAOieDGdKaIiNi224i9K//ZIRkui/6gq4keLXjpXoiz8zmjfKMs6SeVKDycdJpa
         wDlg+ZFevBgOLLmp9Nbr/tPborqsO/NdxKJzc5adk0z2iSUYCCsu+4InIDnahMM98tlY
         V795pkGq3q1hFEnPLYrz3HL46c7tcJZ6nlUk+l3Ht3n+hXEV5LrE5M324PlKLC2caG6l
         Nafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708331365; x=1708936165;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWUWsnfwYVJB3NeJPGabmiQoX5d4BCcDZFFFL55Cbcc=;
        b=NYemqzJrvewNJc37qF4GiDp+0Jn5s8HcVLiuKweGLWbpaIxfC5UGuW18Va0+uIcU+J
         Vtfqc/XzWpZgtaGycBIl/so0iUzGPSgCL7Nbt4Q4zsxFzEyJ8XQ+y8mrp+VYtlXH2D+6
         xCW3NGZ2oNx+GP6cYky/RQksi7ARNnw0KT9meLI5KyJvVZ4X3TMs57CErsOPgDJqpD6f
         3tYT8BTw5uRmDPPMWjWySccThjhFer8AQYgYWuB2ZX1ha1YAF/VCEbKzVEu9zgSmS3Rp
         rNHYpTrP0XGYVqqQJSkUN6EODS6wwFXFylyFVUTpeVvf3wxo4+W8Mvk+IdWwPvJeysmG
         Pisw==
X-Forwarded-Encrypted: i=1; AJvYcCXmhDk6n9NUha+uNEpTM9adGSLAMcLF3dGSph6f0La7VKZH+9JRULxziFbE5hGCvS7a01vOgNB353cuAsfV0nutWlvGwaBi44lcRT5Kp9NA
X-Gm-Message-State: AOJu0YwLIXCQ0g31L8/4SWINID2uWBcKfSC1DP3++o9Q5OMBRJwcEX35
	eTMq1htKWK0glh77aG/pSWg40Syxjk44FtXxxhl9YkKFVy9AsD9BRqwk9B+pgEI=
X-Google-Smtp-Source: AGHT+IGJbZ1oXtdXJ0tTWHvHxj794/54tKPc/gXozHxyRNAZCzrqi/Be9hQAFy18RTkyv7AzQAYNmA==
X-Received: by 2002:a05:651c:604:b0:2d2:4314:8c06 with SMTP id k4-20020a05651c060400b002d243148c06mr47798lje.15.1708331365518;
        Mon, 19 Feb 2024 00:29:25 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id g2-20020a2e9382000000b002d09bdb7e1fsm983394ljh.24.2024.02.19.00.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 00:29:24 -0800 (PST)
Message-ID: <3c47c45d-be37-415b-b38c-2185a2108d40@tuxon.dev>
Date: Mon, 19 Feb 2024 10:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] arm64: dts: renesas: rzg3s-smarc-som: Guard the
 ethernet IRQ GPIOs with proper flags
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-13-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdX3=KJ6=qOW__KxWisj7Fguwr=SdP7XGvFD+BKgZbRo9A@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdX3=KJ6=qOW__KxWisj7Fguwr=SdP7XGvFD+BKgZbRo9A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_002927_778457_9C0772E7 
X-CRM114-Status: GOOD (  12.34  )
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

CgpPbiAxNi4wMi4yMDI0IDE2OjE3LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gSGkgQ2xh
dWRpdSwKPiAKPiBPbiBUaHUsIEZlYiA4LCAyMDI0IGF0IDE6NDTigK9QTSBDbGF1ZGl1IDxjbGF1
ZGl1LmJlem5lYUB0dXhvbi5kZXY+IHdyb3RlOgo+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xh
dWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+Cj4+Cj4+IEV0aGVybmV0IElSUSBHUElPcyBh
cmUgbWFya2VkIGFzIGdwaW8taG9nLiBUaHVzLCB0aGVzZSBHUElPcyBhcmUgcmVxdWVzdGVkCj4+
IGF0IHByb2JlIHcvbyBjb25zaWRlcmluZyBpZiB0aGVyZSBhcmUgb3RoZXIgcGVyaXBoZXJhbHMg
dGhhdCBuZWVkcyB0aGVtLgo+PiBUaGUgRXRoZXJuZXQgSVJRIEdQSU9zIGFyZSBzaGFyZWQgdy8g
U0RISTIuIFNlbGVjdGlvbiBiL3cgRXRoZXJuZXQgYW5kCj4+IFNESEkyIGlzIGRvbmUgdGhyb3Vn
aCBhIGhhcmR3YXJlIHN3aXRjaC4gVG8gYXZvaWQgc2NlbmFyaW9zIHdoZXJlIG9uZSB3YW50cwo+
PiB0byBib290IHdpdGggU0RISTIgc3VwcG9ydCBhbmQgc29tZSBTREhJIHBpbnMgYXJlIG5vdCBw
cm9wZXJ0bHkgY29uZmlndXJlZAo+PiBiZWNhdXNlIG9mIGdwaW8taG9nIGd1YXJkIEV0aGVybmV0
IElSUSBHUElPIHdpdGggcHJvcGVyIGJ1aWxkIGZsYWcuCj4+Cj4+IEZpeGVzOiA5MzJmZjBjODAy
YzYgKCJhcm02NDogZHRzOiByZW5lc2FzOiByemczcy1zbWFyYy1zb206IEVuYWJsZSB0aGUgRXRo
ZXJuZXQgaW50ZXJmYWNlcyIpCj4+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUgQmV6bmVhIDxjbGF1
ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4KPiAKPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gh
ICh3aGljaCB3YXMgd2VsbC1oaWRkZW4gYmV0d2VlbiBub24tZml4ZXMgOy0pCgpTb3JyeSBhYm91
dCB0aGF0LgoKPiAKPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5l
c2FzQGdsaWRlci5iZT4KPiBpLmUuIHdpbGwgcXVldWUgaW4gcmVuZXNhcy1kZXZlbCBmb3IgdjYu
OS4KPiAKPiBBcyBFdGhlcm5ldCBpcyBlbmFibGVkIGJ5IGRlZmF1bHQsIEkgdGhpbmsgdGhlcmUg
aXMgbm8gbmVlZCB0byBmYXN0LXRyYWNrCj4gdGhpcyBmb3IgdjYuOC4KClJpZ2h0IQoKVGhhbmsg
eW91LApDbGF1ZGl1IEJlem5lYQoKPiAKPiBHcntvZXRqZSxlZXRpbmd9cywKPiAKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
