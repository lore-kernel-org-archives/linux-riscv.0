Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9669EC6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 21:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5K8LjoIJrhjVrAMjLO13PSbUvGJeQUoGDxB++Pj29mI=; b=o/jzTkzntsBpDT
	RGsnGw1hdiTCG6gQxjw7eGY+OZ4D7WVXm3qWeGe4lO+2wZP5RykaLbEroQql9VhL6kGjgOT6h9Ce/
	ThdsBa4Mew9karyl0kr/bfadKgcy+/brdM3+Mzfc5+/ysm5spvMTHVvTZYFweEXnhNjYsWx+CsEsq
	InOR1CBrobx48Qgg7ZcgDY966GpRLNSzBBZC9hDATM5bo4PlcyBY383r7YnsCDUeIbwyZfejJ4J62
	dGO+pga/OA3uIsL0vwxSN1EJtZAaojIw5On9m2Db5yV/hhQSscKEE8SBduhiGOsM7bZZEzc2FiPFf
	EP0ki+btCOnhuSXuC3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb75r-001KUB-MG; Sat, 11 Mar 2023 21:49:35 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb75U-001KIa-LJ
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 21:49:14 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5416949b35aso43826507b3.13
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 13:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678571352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TpdXBJ4tecgiTETU5KnmLKGnqvFo0uE6wI/ZwKi060=;
        b=nE/bwkjay8CbXb4jPjZdl/Xsenzw4L3dSxsKJNwylYD1kFCBR/VR29gvUWor8ha8a9
         28VY66ubXweop+orgHdwvtya2h6b46vDvAGq8/5HMdpUy6HndbuJeZ+WwZmpkJnxTPav
         MX0ZDk1UddZSqZ/ChtapzciOcUAyP+xqRa1gLni8+GvQex7Wn5L+r/meix4mfGaWjH8l
         BQEkhMS1JufERKr2Nz4Gj5LTnVTHWLuPOJzsF6U/WBX2qdeeJa3qhpEn9tc9yCbfV3xo
         Pj/5WWV0AOLzBzELjebOlRM33/gK2NCRG6PPnz7Fs9ifuYTqStjgc2AeFAayc7MoncpV
         DjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TpdXBJ4tecgiTETU5KnmLKGnqvFo0uE6wI/ZwKi060=;
        b=R1wEQ8khYWiW3QxfAAI/uQDsbfnE5bJqxqNTJMk6HOK1839RxokW1QWdPz5IRUhMK1
         2q2stDjb3ued5LwmemQ54lGiEzV8PN7UtpkWOrQy58T3GktwyDhUGdH/k9ZQ9/Y2XOjy
         Hc/KPdDuQ2bM/J/sumrmr6JeU34gle2L7WIA3RfdvOLOS9kCQNKuPBPvUJSMn4CLbNcY
         4mMrUA2HqSm3ZBi4VtyVfTuONVFrLQn6X/SyvS/ho7xsrmQWWQwGrRUWBl1nPPAoH8Kh
         2WUa6piBw7KVLQCmMFSgznSjASFu5W6PxBsTYejNqC+uV2ouWL1PiD1T1zDegH8dYXp6
         rkFA==
X-Gm-Message-State: AO0yUKXTbMY2X523tejBufVlSe1zCuFZOTNGYqB4cSnBhrHATUSZbhr3
	YXMU6fRq5xOqN2MpYbCd9yq52tgMFlB9TQZvHFDwXA==
X-Google-Smtp-Source: AK7set963Uvk9/kPnpPMiLrCaYWls2se8kVKHqPvoVj8mQ7gkyPTgu5X5El+InCrUfj2HTmmNHTNnoloTVd+fRthoCw=
X-Received: by 2002:a81:b705:0:b0:535:fe26:acc with SMTP id
 v5-20020a81b705000000b00535fe260accmr19655281ywh.10.1678571351836; Sat, 11
 Mar 2023 13:49:11 -0800 (PST)
MIME-Version: 1.0
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org> <20230311111307.251123-6-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111307.251123-6-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Mar 2023 22:49:00 +0100
Message-ID: <CACRpkdb_t+RNSaxq-h6nz8R6Z6d=SD75m5w1tzVFn-qa5pdyVQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] gpio: sama5d2-piobu: drop of_match_ptr for ID table
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
X-CRM114-CacheID: sfid-20230311_134912_751613_AAADD4AD 
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
bWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLgo+Cj4gICBkcml2ZXJzL2dwaW8vZ3Bpby1zYW1h
NWQyLXBpb2J1LmM6MjMwOjM0OiBlcnJvcjog4oCYc2FtYTVkMl9waW9idV9pZHPigJkgZGVmaW5l
ZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPgo+IFNpZ25l
ZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJv
Lm9yZz4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
