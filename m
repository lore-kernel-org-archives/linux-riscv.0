Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B309C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dwZz5rqjUYYYqcj5fw+TcXlFHBMzHIcYDPoRDOigNIg=; b=15/30djb8ZoUyk
	XdpeCOM3gYFVnPeyuaO3fPxSm/qKHLrJxXurkLd7io2HKVhOGU/+jOe6WGKXLQb0JjzsTBHnZ95BP
	Oi9GZb8QBo+8vwbRqe5tEfEM554uLuBaOxxW0k5oO6aZAivQivepeG2Fl1PWXC26wV5roKfeWfZzf
	T7xZD6rTmcMdiS1WFEVchHM8kHFqT9LPi9vZnuGv9RgnrIRFNlGe8yJfPZxuOZiL709ffl4e/ngns
	vQ3evwbvX+WVOBUqexZWnvn3bBUHstz/fi3qjqbmhLw4yaW3koa6yJ7fcvBwgcKrYRo0HFv+iiLAj
	pbFGbmdYZ9UZQz6m2dvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpoF-00B5kk-2g;
	Mon, 22 Jan 2024 08:37:35 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpoA-00B5jm-2I
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 08:37:34 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2cd1232a2c7so37187241fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 00:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705912648; x=1706517448; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUhLxvQpB2444R2OwanB1oURS4LSeIrP1mx21iy3zi4=;
        b=J0QGtCMae6dcmCBLYp8sjB8y+K1HkJy8quCuSWC4BL38sYH6qBUlBs9CCKZi+BWQsN
         B40aR7XXXr6uHuZh9EYwPdsvW53VfmpdMHA5d76ReuuWCJW8LivrIDSuk0DmednmF4Zp
         LPyCcj72tNKjRckjCEHgZglRB0v+GB6Rx/a4jxMRcl9jAj1AVQQ79NXIVZGiQi5eqtPz
         ewZ8pzOq9/yNP0EmxcgChthQBONVBQqP+chgn8m95+gPZQa1UWHeqQMQqJpEm7ACYx76
         jzRv4t1W6lrAMHQAY/5BhHQO7aceqTPlH+Sk+LW6FzK+2DsxJf9TWkvldBbBLo6k/7Hh
         s6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705912648; x=1706517448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUhLxvQpB2444R2OwanB1oURS4LSeIrP1mx21iy3zi4=;
        b=PzJbgA7K5U1HYHXkQLEU9KcphZK03IR2hLZdtLaZZ1aUHZ6MsrQVseQwogoDXunggO
         aqg+rGqcFFCQClwLvr/6FxIipy4tbg9PJT1D8wQWV4MqGhShMS4DHEhJY1IXdunEorM4
         vNONdZnSDN7lf3RBmvObjrYsyawyF8KDlqAq31xk2Eytkag8j/wusqrnL2LF8aPwfyVi
         k1fSuUQavRIRjVENIExMnweCHfWGI00cMQuQn4D7B8ln0n2hpAQdZv4/7SYTKdoR0Lyj
         fYk5RiD6RAme3mqT7Wbyxa80YGqcW5yYWrnS/w7w959bk3LihMUjMymp/wXv8Obsdo1l
         pdhg==
X-Gm-Message-State: AOJu0YwuiG31A94wI80Oh9bf/NewJ3lBjK6wwq/K1MvDIjGSl0qXxqeu
	uvENw9p+sxq3EMDG7fF078v00Zrw/mVTr9CdMw8mdmd0GDr1dqR3X18A/pHno/U=
X-Google-Smtp-Source: AGHT+IEUJOQf4Ld0srroyNXWH3OQiDWPRqtkiPiCuP69Ymdllv/sFpV9ONm/e4QkT1gx5Ahl5reJJw==
X-Received: by 2002:a2e:9d99:0:b0:2cc:78be:9551 with SMTP id c25-20020a2e9d99000000b002cc78be9551mr1222957ljj.2.1705912647781;
        Mon, 22 Jan 2024 00:37:27 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id q6-20020a5d6586000000b0033921f48044sm7892690wru.55.2024.01.22.00.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 00:37:27 -0800 (PST)
Message-ID: <fcd64bbb-9f3c-4e62-96a4-84cb1e3ac59d@linaro.org>
Date: Mon, 22 Jan 2024 09:37:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
Content-Language: en-US
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, chao.wei@sophgo.com, unicorn_wang@outlook.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dlan@gentoo.org
References: <20240122080631.2880-1-qiujingbao.dlmu@gmail.com>
 <20240122081722868bdda5@mail.local>
 <CAJRtX8QU8iHY1oQJ1uDN3YOmCeN7SH+vPC8nD29WS5+2DT1oKQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAJRtX8QU8iHY1oQJ1uDN3YOmCeN7SH+vPC8nD29WS5+2DT1oKQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_003730_757127_5C178792 
X-CRM114-Status: GOOD (  10.19  )
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

T24gMjIvMDEvMjAyNCAwOTozNCwgSmluZ2JhbyBRaXUgd3JvdGU6Cj4gT24gTW9uLCBKYW4gMjIs
IDIwMjQgYXQgNDoxN+KAr1BNIEFsZXhhbmRyZSBCZWxsb25pCj4gPGFsZXhhbmRyZS5iZWxsb25p
QGJvb3RsaW4uY29tPiB3cm90ZToKPj4KPj4gT24gMjIvMDEvMjAyNCAxNjowNjozMCswODAwLCBK
aW5nYmFvIFFpdSB3cm90ZToKPj4+IEltcGxlbWVudCB0aGUgUlRDIGRyaXZlciBmb3IgQ1YxODAw
LCB3aGljaCBhYmxlIHRvIHByb3ZpZGUgdGltZSBhbGFybQo+Pj4gYW5kIGNhbGlicmF0ZSBmdW5j
dGlvbmFsaXR5Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEppbmdiYW8gUWl1IDxxaXVqaW5nYmFv
LmRsbXVAZ21haWwuY29tPgo+Pj4gLS0tCj4+Pgo+Pj4gRGVwZW5kcyBvbiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvSUExUFIyME1CNDk1M0M3NzRENDFFREYxRUFEQjZFQzE4QkI2RDJASUEx
UFIyME1CNDk1My5uYW1wcmQyMC5wcm9kLm91dGxvb2suY29tLwo+Pgo+PiBXaGF0IGlzIHRoZSBk
ZXBlbmRlbmN5Pwo+Pgo+IAo+IFRoYW5rIHlvdSwgdGhpcyBkcml2ZXIgcmVxdWlyZXMgc3VwcG9y
dCBmcm9tIHRoZSBDTEsgZHJpdmVyLgoKSG93PyBUaGlzIGlzIHJlYWxseSB1bnVzdWFsLiBKdXN0
IHRvIHJlbWluZDogd2UgdGFsayBhYm91dCBidWlsZApkZXBlbmRlbmNpZXMuIE90aGVyIGRvIG5v
dCBtYXR0ZXIgZm9yIG5ldyBkcml2ZXJzLCByaWdodD8gT3RoZXJ3aXNlIHdoYXQKaXMgYmVpbmcg
YnJva2VuIGFuZCBob3cgaXQgY291bGQgYmUgZXZlbiBicm9rZW4/CgoKQmVzdCByZWdhcmRzLApL
cnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
