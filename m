Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E98C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 21:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rO+AttfGFzhuy2c4fnRZgI8lESOVXdJ/RlXqrIYy7Qw=; b=eMDlZVUzswQeJF
	CM9hwXkuURNWhhK4vUb996qqwALr4g/Zy7pIphmvVkY2Ctpod7wMUp9WoFz6LEUmwAbvqplCCpZQO
	wG9lx1K+71chaljxG08i+eyNBwzdTkHpjjMob/KrndxEs2wOiQ3xhdOIf+eu6VJrGPqTXKb5MaMKV
	IzzkLxUI2eZGTdc+rFFWofLH3ErH33qLzP2Mge6vafTJU3Sp7sQ9b+DP7iXkL5/KvWktKahvMrSyi
	iRqCa1uChU0cahG5ixtJ9XfTn0OXgrGo7JTrBpeeoGKIXfNPeDDSgUsxoVs+x+FKoQpR3E1b4nQ0Y
	1kXIGFdqJUFaAJb4DHHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb74y-001K1G-Tg; Sat, 11 Mar 2023 21:48:40 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb74j-001Jsl-Th
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 21:48:27 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id h97so1466277ybi.5
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 13:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678571304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jF4jSS4OasbZk4U9XuZ/wAPD2HfWZvgc6z7TV94mIo0=;
        b=xGxTaeZQGxhou3gJGzNPPC0r1ZSbKzbb96fonKZLFMczDO62qIJwLSfk0Cw5yNgxdo
         e7wKPTskfPixT0ahvxJmEo7SmBqfYaohdVVIwKQhcWzR8COHFQKthSnm2IZOLchQA9Ko
         OEOc3cq1q6BslwpN/Qvxg0dIT52GOUFjMRE41dBs5YsfovcrtQ6TlWGV58Ht5Lgo2aAW
         fbo2AS08fJuj3QeMXXy6Ap03fBMmF2uHvjna4pD4Wx3VmA5N1O+2TTZsvXWo/ugORIgc
         Vzy3jaNfuarZ3Na+WOD1V8EIaJt47Quk/lNRTlOe86A++aXXRe161nyhrAlujgfJGm3r
         0/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jF4jSS4OasbZk4U9XuZ/wAPD2HfWZvgc6z7TV94mIo0=;
        b=TlBgamiwkicttF2YbeyiMAUO/jbxePFlsDuvmfcP7p3162+y5JZjwqpxGklcYQvS56
         PFMvu6w7D1dnzyYxbh1b3z0M4FRlVkliMuPJfdmgWkezrHJPSc3JSDyyOJqvKGqL6d2n
         D05on0G/N2rw6Q1jHoPtvl/04YcOiiDCSVNBFMhmy6Qbj6fzH97zryDfNazj2hv0HKNH
         fEr4Ku3xVT2EngwQklfoS6CmGTbqjqz4cwUzCFiA5LSYXQTpT/Ewe9WlKwzLwuqMgmmN
         ure6Pd9wBPi0KsvmcTNNGlsuwIiOKqqcrpxgDu5NBj71D+RmUdaS3jldXPoRJE5D4dQJ
         qkuw==
X-Gm-Message-State: AO0yUKVXmE2IEBgtyhaQRc8hWl/sOlG0DMy929zo8Ww6Xbo7THFhlaXC
	zkIUA3XrqM+VpQCp5RupzWt5OGYjc0Vusu/5dht6lycAeV+O9bABFSw=
X-Google-Smtp-Source: AK7set+RBXbsTa+ZxAOTcuKBxqKu2MRGa2ZBNeMZvsqp53WuxZEYmcTvI047DvIsyfSBCmdCVtl5FogFQtNmQitOTGo=
X-Received: by 2002:a25:f904:0:b0:b27:65ca:f35d with SMTP id
 q4-20020a25f904000000b00b2765caf35dmr6534892ybe.5.1678571304594; Sat, 11 Mar
 2023 13:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org> <20230311111307.251123-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111307.251123-4-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Mar 2023 22:48:11 +0100
Message-ID: <CACRpkdY6Dyq8VHLDqBxfiU6spLdNXOScja7JSe3-hwXqW1je6g@mail.gmail.com>
Subject: Re: [PATCH 4/8] gpio: visconti: drop of_match_ptr for ID table
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mun Yew Tham <mun.yew.tham@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Nandor Han <nandor.han@ge.com>, 
	Semi Malinen <semi.malinen@ge.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_134826_018490_630D8ECF 
X-CRM114-Status: UNSURE (   7.77  )
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

T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMTI6MTPigK9QTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBUaGUgZHJpdmVyIGNhbiBt
YXRjaCBvbmx5IHZpYSB0aGUgRFQgdGFibGUgc28gdGhlIHRhYmxlIHNob3VsZCBiZSBhbHdheXMK
PiB1c2VkIGFuZCB0aGUgb2ZfbWF0Y2hfcHRyIGRvZXMgbm90IGhhdmUgYW55IHNlbnNlICh0aGlz
IGFsc28gYWxsb3dzIEFDUEkKPiBtYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZlbiB0aG91Z2ggaXQg
bWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLgo+Cj4gICBkcml2ZXJzL2dwaW8vZ3Bpby12aXNj
b250aS5jOjE4NzozNDogZXJyb3I6IOKAmHZpc2NvbnRpX2dwaW9fb2ZfbWF0Y2jigJkgZGVmaW5l
ZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPgo+IFNpZ25l
ZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJv
Lm9yZz4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
