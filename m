Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816B1CF9C5B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Sep 2024 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRLdPirGwqvYOhuU1QDB7y2HAemZrhCS446IhbxBflM=; b=AKvAfyySPeU30Y
	JM7GnXEjPsB087F5JNUKqTQVPy2HA0Vh+DSfJ9+6k6iW6N6zM8fvrhqtzKv8kHV7Tb2Zx19dVFLlQ
	EM8H1HefoVcqNC8SyD+wxgXtlOqRGYhj9qUJdJ2fJbV1nf/DrW7fzq0nDPs1ZbaPHzkSSK/3R1v4l
	2vRvgeDwj/0mT2gJ14wKE0snFN18ifFdYdvLS3a50/Lpz/wsGM0q67AHFHtIpDMZDYULBpOqcK3sf
	H62sw8zDkN4JTmP1n+XUyqQT9xYr4Gjsw+QRZcfeNdIUUNlOgX7scLMnFPraP4EVhgEsLM5BcHetA
	ChqFPxndA6dws7xrpi/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssf1n-0000000GlHb-44A6;
	Mon, 23 Sep 2024 09:06:44 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssf1l-0000000GlH7-210D
	for linux-riscv@lists.infradead.org;
	Mon, 23 Sep 2024 09:06:42 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2f74e468aa8so40997961fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Sep 2024 02:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727082399; x=1727687199; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gI+AbpiTkDl6kn2RiQQW+4/uOeZaJelNEMjqGqbZrFg=;
        b=jqAXhKmaJEluhtcUFesMKwRHYhl0eEszstq+4hN9BUXIsun/nxQw0il2buFPkVMT+Y
         H/zMp1q7x+0FameFnHGb6oAmWJSHrwBIM8tPXx734eePBv/sjkBb+ECX3BKemPLoCWG3
         yFQv+Tn6XLRuRijeeWHBlUg9IEvRtGA95e8R29djbDylxNRH8OW9Hva/fwQvTr3rMu5q
         mqkeWLZlHORf9KfEZES5Pwf9d77zqdfL8xI4c8N8QgXHYvAfZSYw13bDKc5MzYSt54Ru
         HTQlffNMgCOeg2doprchKwRSYkY0zemzP84GG03AZizPLkuK3zhNgwvnVUhPmNVBk5vp
         cp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082399; x=1727687199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gI+AbpiTkDl6kn2RiQQW+4/uOeZaJelNEMjqGqbZrFg=;
        b=nlICO89K6QJ+SN3zttadJ6NznozpNJfWADLb9jI9nkJQHJA8qrbnk13UDdqnc8fEI0
         5C2+qpERQKwEwHiyhM4qmHaFDEPH80KNRuf4EcFfK5ui+uOV4qzMuMC9FeIv+3/B0+x8
         PxBTXbL9Y7d7sS42ar89OMAWX1LAIWsQAgCSgTgi5jEoDJmEDwdZZh5HuiJRcEsd45tt
         z8g8H/Ksqe9ywJwF5SHHIV3nEdKLL4hQasvVNmnEuig/SEmMQ/2EbfSdGN0JwoepmBAs
         pUE5PVz+KVp7fIOtbfvTlRACTTrdxX1Wf2BMTAymFxlg7+y0VBHZJkCcMQAJManayHsW
         eGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYtCcS17kVITFxWFQ4I02jmnU91xr/W4C0yBC+2MmU6LFWDP/iOyZwUHj3/638BNNHzvlTTLq0stcOuA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk8qQpaDTZa8gUsrwQGPgKmZy0bh3DwDI/lAsLtVYLLUPdOyCW
	6M2a2g766bYqfkWARONnxE7v/uH3GuX00tKLP2VAyxm/GsGfLWj/AXsl4/eemSPlOdO27Eg757D
	MFBZRy469GNjNGIvv2fgW9peT4j0QnftuWNUOK0XC1+/4ZUlf
X-Google-Smtp-Source: AGHT+IGdGIC0Q0OoO8XccO0CG6LWJ+zYGfstTcDloUaOK1j6nG3XeE48x8Z4GVGdrxN6tEmmP+pZ6cHUO9WoWDX6B1A=
X-Received: by 2002:ac2:4bc4:0:b0:52e:9f43:c13f with SMTP id
 2adb3069b0e04-536acf6a74dmr5045100e87.7.1727082399252; Mon, 23 Sep 2024
 02:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <77f543046d4d5c19206f829ddcf8e093d3e3f6da.1725440917.git.geert+renesas@glider.be>
In-Reply-To: <77f543046d4d5c19206f829ddcf8e093d3e3f6da.1725440917.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Sep 2024 11:06:27 +0200
Message-ID: <CACRpkdZmkfVRunkUii6vhT-58Wa94LcMJGa3mpeS+Rv2+1-ZfQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: k210: Make (p)clk local to k210_fpioa_probe()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_020641_548264_37863A1B 
X-CRM114-Status: UNSURE (   7.27  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCBTZXAgNCwgMjAyNCBhdCAxMTowOOKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbgo8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+IHdyb3RlOgoKPiBUaGVyZSB3ZXJlIG5ldmVyIGFueSB1c2Vy
cyBvZiBrMjEwX2ZwaW9hX2RhdGEuY2xrIGFuZAo+IGsyMTBfZnBpb2FfZGF0YS5wY2xrIG91dHNp
ZGUgazIxMF9mcGlvYV9wcm9iZSgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KClBhdGNoIGFwcGxpZWQhCgpZb3VycywKTGlu
dXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
