Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE81CE7A88
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Sep 2023 18:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ayq+UK1lWRTdLWGHrITBkDhBvLJUg4ABeDQmuW3IWr8=; b=smBpnf26FUtO9o
	vCyWoU9pLogsUgh/onUyUAqRhA9jzMDayKzYHcJERuNW7p2lCM9IkHwBgsuXYASd2divANOkqqLSv
	MxECBTa+Jhu5MKH/wzOAHlqZRqGB5g0uXoR4C3MCP3Bew+pWd22MQ+C3Hl3lNqqrXnJ6VB4RUfSkg
	uktKUqdJhRm1JftXEkeT4raPxVKJHboIfmmsnIRnpjvcgKMSFTVfMk4rw8VURUNO3r5H6R3hlOxDl
	bcxWzrXYyJM+Txc555ejVFTTSRCKMwah0FLOLxSJO4nBbnMDFPySCzoCZM1e43jjqYlWiOG6Imhmi
	Gp3okkpRZoMQ0BkJ7stA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkU9k-00CbmS-0L;
	Sun, 24 Sep 2023 18:48:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkU9h-00CblM-1C
	for linux-riscv@lists.infradead.org;
	Sun, 24 Sep 2023 18:48:34 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32329d935d4so260369f8f.2
        for <linux-riscv@lists.infradead.org>; Sun, 24 Sep 2023 11:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695581311; x=1696186111; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xnmXOA+QaS63l50OfXpIek29rfu95uFcEdyHDfaQmtw=;
        b=oc5FdXE8eQq73FmHVni/1HTARkN2ZnclWBaLQHI5bNQLt/CwcYwLJ7nNSR7iQHbgQJ
         4SpCBdnr5K2SLY8Egbp2FSum/aipXIf7c31lHVhywOXKkwNVu7vMtgx9nM7kd8iG8cX8
         s6gVjUEIFHi/WnaRr7bl8TUa/0iQvADaW2enrmwh/75Um21MoqriS1Mf165aGuLVwSe4
         pt0+xcPxO/mdsIDHl17nn1M0UwNUwVeHb6GoG8osGs3f4t0ulZf7WSfaEnupE0BMfu1p
         KGG0zPOWFbqo/GMcPaYbFWPX13EIdjJpdqz8eQ7kEWaF4q6axRmqddpbJonLP4IiMIJY
         fcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695581311; x=1696186111;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xnmXOA+QaS63l50OfXpIek29rfu95uFcEdyHDfaQmtw=;
        b=ss1APKSKPfMMlqyqBQFoOwZvQIadI0gfbMU6OehFtXfvsGSXNz2mQ9Uhh8FGZSzxGk
         HiwMDEc/LGSKV0Oma6ZL4tQMFqcZ25c9a87bgdQLQ8D9VWpZYzFNFBY1fw/fURllrMFs
         wU8iuaLKX2FBDlirgkAb1zSt8KYlaAMD+pkB0mV9RenaoKZxrr46UaCyfQ3ojp2EJlsy
         3iPnGSzU6QDHhKCsaZV/3Fc0MafX8UnXVDg1fK+YIRG/hnHyEfw6DpE5AFugbOXg7QCM
         5jduDhKHPb74m+QRswxNr/vAyXy89ifs+2/X5HAfeztnfnVoUJrOxhdsLj/ZFZV4QwAT
         bkNA==
X-Gm-Message-State: AOJu0Yy3o4ca6hDsgVluViJUhCaVMrKCrmGYH1eZ2JSLWUUiLMPvBB+l
	ipTmiWGfc5qZuDaF7DuQYq5gsQ==
X-Google-Smtp-Source: AGHT+IHyH0HKd5TJnAMW3M3Xdk7i6R8SJsZpVD090tzbS9CszgulAe1FBk9IZWdv21USwgLraypf+g==
X-Received: by 2002:a5d:68c6:0:b0:319:8bb3:ab83 with SMTP id p6-20020a5d68c6000000b003198bb3ab83mr4326273wrw.66.1695581311308;
        Sun, 24 Sep 2023 11:48:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id h4-20020a056000000400b0031aef72a021sm9960058wrx.86.2023.09.24.11.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Sep 2023 11:48:30 -0700 (PDT)
Message-ID: <54d7a712-0b07-462a-8750-4b5b2f3150c4@linaro.org>
Date: Sun, 24 Sep 2023 20:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: use capital "OR" for multiple licenses in
 SPDX
Content-Language: en-US
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230823085238.113642-1-krzysztof.kozlowski@linaro.org>
 <5962565.lOV4Wx5bFT@jernej-laptop>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <5962565.lOV4Wx5bFT@jernej-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_114833_418656_8E6FCBBA 
X-CRM114-Status: UNSURE (   8.73  )
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

T24gMjMvMDgvMjAyMyAyMToxMywgSmVybmVqIMWga3JhYmVjIHdyb3RlOgo+IERuZSBzcmVkYSwg
MjMuIGF2Z3VzdCAyMDIzIG9iIDEwOjUyOjM4IENFU1QgamUgS3J6eXN6dG9mIEtvemxvd3NraSBu
YXBpc2FsKGEpOgo+PiBEb2N1bWVudGF0aW9uL3Byb2Nlc3MvbGljZW5zZS1ydWxlcy5yc3QgYW5k
IGNoZWNrcGF0Y2ggZXhwZWN0IHRoZSBTUERYCj4+IGlkZW50aWZpZXIgc3ludGF4IGZvciBtdWx0
aXBsZSBsaWNlbnNlcyB0byB1c2UgY2FwaXRhbCAiT1IiLiAgQ29ycmVjdCBpdAo+PiB0byBrZWVw
IGNvbnNpc3RlbnQgZm9ybWF0IGFuZCBhdm9pZCBjb3B5LXBhc3RlIGlzc3Vlcy4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5h
cm8ub3JnPgo+Pgo+PiAtLS0KPj4KPj4gUmViYXNlZCBvbiBuZXh0LTIwMjMwODIyLCBzbyBtaWdo
dCBub3QgYXBwbHkgY2xlYW5seS4gIFdoYXQgZG9lcyBub3QKPj4gYXBwbHksIGNhbiBiZSBza2lw
cGVkIGFuZCBJIHdpbGwgZml4IGl0IGFmdGVyIG5leHQgUkMuCj4+IC0tLQo+PiAgYXJjaC9yaXNj
di9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWNvbW1vbi1yZWd1bGF0b3JzLmR0c2kgICAgIHwg
MiArLQo+PiAgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxLWRvbmdzaGFu
LW5lemhhLXN0dS5kdHMgIHwgMiArLQo+PiAgLi4uL2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGkt
ZDEtbGljaGVlLXJ2LTg2LXBhbmVsLTQ4MHAuZHRzICAgIHwgMiArLQo+PiAgLi4uL2Jvb3QvZHRz
L2FsbHdpbm5lci9zdW4yMGktZDEtbGljaGVlLXJ2LTg2LXBhbmVsLTcyMHAuZHRzICAgIHwgMiAr
LQo+PiAgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxLWxpY2hlZS1ydi04
Ni1wYW5lbC5kdHNpIHwgMiArLQo+PiAgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3Vu
MjBpLWQxLWxpY2hlZS1ydi1kb2NrLmR0cyAgICAgIHwgMiArLQo+PiAgYXJjaC9yaXNjdi9ib290
L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxLWxpY2hlZS1ydi5kdHMgICAgICAgICAgIHwgMiArLQo+
PiAgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxLW1hbmdvcGktbXEtcHJv
LmR0cyAgICAgIHwgMiArLQo+PiAgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBp
LWQxLW5lemhhLmR0cyAgICAgICAgICAgICAgIHwgMiArLQo+PiAgYXJjaC9yaXNjdi9ib290L2R0
cy9hbGx3aW5uZXIvc3VuMjBpLWQxLmR0c2kgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+PiAg
YXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxcy1tYW5nb3BpLW1xLmR0cyAg
ICAgICAgIHwgMiArLQo+PiAgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQx
cy5kdHNpICAgICAgICAgICAgICAgICAgIHwgMiArLQo+PiAgYXJjaC9yaXNjdi9ib290L2R0cy9h
bGx3aW5uZXIvc3VueGktZDEtdDExMy5kdHNpICAgICAgICAgICAgICAgIHwgMiArLQo+PiAgYXJj
aC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSAgICAgICAgICAg
ICAgIHwgMiArLQo+IAo+IEFja2VkLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNA
Z21haWwuY29tPgo+IAo+IHN1bnhpIERUIGNoYW5nZXMgYXJlIGFscmVhZHkgY2xvc2VkIGZvciA2
LjUuIEkgY2FuIHRha2UgaXQgYWZ0ZXIgLXJjMSBmb3IgNi42LgoKSG1tbW0gYW5kIHdoYXQgaXMg
dGhlIHN0YXR1cyBvZiB0YWtpbmcgaXQgYWZ0ZXIgcmMxPwoKQmVzdCByZWdhcmRzLApLcnp5c3p0
b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
