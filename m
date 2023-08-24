Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4935AC3DA6F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 07:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bzzd5n6X2Xu/PicXRmlgLf7m5VVLmYjF2ROhZ/K7vfY=; b=hSF50Q3kchG4si
	7je8FD72yuKLc6nQtaJTo8S3abedNa8N7eqRI8O4s/VTpgmmIW1jP0f4gfycE1CjL0lf55RSj+u0d
	uzC6EplLSjBdQcaSUlS8ExuZ/C3ibRT4dWB4Cl5AVsYFHtlHwgzqjjhGpHRzuQLuN6lLgd5TovSkr
	eBS/GpPp4c4Y2K7TEeaQ5tmXYtMv0bknvpklrNwSDCRUGjpvBnfXuIQFn1W9zH9m/4gUb/5x4ALhv
	ZRJQ/2YGz0o6lyTUtfEntSTN8chKx4znDlrHrOYkMI8LG41V0W15ueDqUagZi+vtcN3a5F0V8NFX1
	ZmOgeqdRO7tn/SnDe0pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ4N6-002NAB-1V;
	Thu, 24 Aug 2023 07:03:12 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ4N3-002N98-1Q
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 07:03:10 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99df431d4bfso832356866b.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 00:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692860588; x=1693465388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P45nAftBMkI9aO/uXRibti5ezjszBIQ2T+bQqiHAg7Y=;
        b=J/3793hrGTYLIQrFLs/3h4rLwByn+HYPUKOvdOVBZlRd49ONEBMKcLI2nh5WpE7pOo
         UsO/Bvg2lPXd1bP9iKhA5AWiUX6XfhUQ9I7QIgiG0uwfzuW8NctmXlwOh/F8qgAiJyKH
         nQpgGOy6tYTYHe06Z8P5v1zwdNuegaggmRC4G0ZkHv8NM7TXLgDRQzWq1L81IEoj6HgL
         p8VZmyGRCuFgu7t3pVqyL6T8NSQ95KBB+hbbbBjBHx2wMwnztJGjGSXdwmyfvG7r9p7E
         d2nJS14n/zfM5s3aoHnG3GMK8MrT1Gfh+3NFsWKnF7uuIFix3AXhtQkqZPYGyZN571kZ
         ZrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692860588; x=1693465388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P45nAftBMkI9aO/uXRibti5ezjszBIQ2T+bQqiHAg7Y=;
        b=lggzM1vKB21IHg/P1cadAuWOR6EiVW0zR1LBXSZgLtre/IBzLohAAd4c6tTk02A5Uz
         sEADa9A9uN/nHSjTnnCGiXEQxg3APvrVbNvjmHZ0Wg2glBdkKdoJ1/tSw3e1vuVrdAaW
         ft+uUX+iVxxq1jgxp4nBJG1ZkLHY3wfhMdTtyyvF0PYH+DqZGBQuwn9oX462ruoF8vx6
         t2NZwc564zcSZvmn1gnYBRavP8IGl239XAlhU4SLOSXdNZ2BV2+GKUCA9XfQG/yq0+0r
         gBjf2UrKHBX6MQNJ7ysNB87OE2BBLQL2gCdyThRtyFpzy1F0G+eNbAazMN4Kq2SSSHqz
         uGcg==
X-Gm-Message-State: AOJu0YxMI0K9P+VphJ1oIP/CL76H2Y0s5NJAocedIICq7kDMd9x4G82g
	6OK3guNPCN74L019UY8C5jWtAA==
X-Google-Smtp-Source: AGHT+IG9k8iOK1esFA6zAJ01EbUnrxPhvANPyRf1UsmBAx7WseNQfibQsTJkl94LBBFoLMX8n0VUjQ==
X-Received: by 2002:a17:907:2c54:b0:9a2:1e03:1572 with SMTP id hf20-20020a1709072c5400b009a21e031572mr305572ejc.19.1692860587958;
        Thu, 24 Aug 2023 00:03:07 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id c8-20020a170906528800b009887f4e0291sm10559750ejm.27.2023.08.24.00.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 00:03:07 -0700 (PDT)
Message-ID: <413bb886-a734-e607-8dd3-79ee501416b2@linaro.org>
Date: Thu, 24 Aug 2023 09:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: Add schema for
 "allwinner,sun20i-d1-codec-analog"
Content-Language: en-US
To: Maxim Kiselev <bigunclemax@gmail.com>, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20230805180506.718364-1-bigunclemax@gmail.com>
 <20230805180506.718364-3-bigunclemax@gmail.com>
 <20230821154739.GA1720453-robh@kernel.org>
 <CALHCpMjoxV+sUh6KSVXfEcWgc_ETBHWo2a7xHMT-nKS2xBYOvQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CALHCpMjoxV+sUh6KSVXfEcWgc_ETBHWo2a7xHMT-nKS2xBYOvQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_000309_506349_DABBD706 
X-CRM114-Status: GOOD (  13.25  )
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

T24gMjMvMDgvMjAyMyAxODoxMywgTWF4aW0gS2lzZWxldiB3cm90ZToKPiDQv9C9LCAyMSDQsNCy
0LMuIDIwMjPigK/Qsy4g0LIgMTk6NDcsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ogo+
Pgo+PiBPbiBTYXQsIEF1ZyAwNSwgMjAyMyBhdCAwOTowNTowMlBNICswMzAwLCBNYWtzaW0gS2lz
ZWxldiB3cm90ZToKPj4+IEFkZCBhIERUIHNjaGVtYSB0byBkZXNjcmliZSB0aGUgYW5hbG9nIHBh
cnQgb2YgdGhlIEFsbHdpbm5lciBEMS9UMTEzcwo+Pj4gaW50ZXJuYWwgYXVkaW8gY29kZWMuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWFrc2ltIEtpc2VsZXYgPGJpZ3VuY2xlbWF4QGdtYWlsLmNv
bT4KPj4+IC0tLQo+Pj4gIC4uLi9hbGx3aW5uZXIsc3VuMjBpLWQxLWNvZGVjLWFuYWxvZy55YW1s
ICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5z
ZXJ0aW9ucygrKQo+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc291bmQvYWxsd2lubmVyLHN1bjIwaS1kMS1jb2RlYy1hbmFsb2cueWFtbAo+
Pgo+PiBMb29rcyB0aGUgc2FtZSBhcyBhbGx3aW5uZXIsc3VuOGktYTIzLWNvZGVjLWFuYWxvZy55
YW1sLiBXaHkgY2FuJ3QgeW91Cj4+IHVzZSB0aGF0Pwo+Pgo+IEhtbS4gWW91J3JlIHJpZ2h0LiBC
dXQgbGV0IG1lIGV4cGxhaW4gbXkgZGVjaXNpb24gOikKPiBXaGVuIEkgYWRkZWQgYSBuZXcgZmls
ZSwgSSBhc3N1bWVkIHRoYXQgc2luY2UgdGhpcyBpcyBhIHNlcGFyYXRlIGRyaXZlciwKPiB0aGVu
IHRoZSBiaW5kaW5nIHNob3VsZCBiZSBpbiBhIHNlcGFyYXRlIGZpbGUuCgpEcml2ZXIgYXJjaGl0
ZWN0dXJlIG9mIG9uZSBnaXZlIE9TIGRvZXMgbm90IG1hdHRlciBmb3IgdGhlIGJpbmRpbmdzLgoK
QmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
