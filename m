Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38968CD6E4C
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 06:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhfCu2asvuBrYDxR0J/reVZBn5yjrZ7BqxPG2y6aOks=; b=xDBRZLHUFQ4sQF
	oNTdSJEeciSw1NLqZdSpS4uuVJbHjEPia6YPk1pH3rIXXOuodAS0uW6LlH6QzOhEZ3UnIMVtWBpzL
	j0+FcIBbN7dFvGgH2h2WP4as+g/xEp7SRIHHodSDssD2Ctro7Hycnmo9M4A3qd9EFNmMLGEDMoT/d
	OztUUJuEADI38G2rI8mPhP8rx4UKr9peAwWDZFcbrBfLqRo7gwfRwjB6iqoPZ/0bokbDxm/+R+UC6
	2Rz5YldC5m10LPxhBUL9aseJNpokCXwegf+1OgHthsUASjR8kYI9/j5cve50ZpDLaOA3BkORJ0GFh
	4bbCfzDv6N5tEGeFm5XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwSP-0000000AEJi-3Wsp;
	Mon, 01 Jun 2026 06:49:05 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwSN-0000000AEIu-0CmB
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 06:49:04 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-3966c3dbf10so13351921fa.0
        for <linux-riscv@lists.infradead.org>; Sun, 31 May 2026 23:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780296541; x=1780901341; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGxbL9faVDVgrvfQsBar+KVqQ+FJr+nh53Wa1vgTsOQ=;
        b=Hjyt1ZCeRCMed90zRoUthEntF26gW6CEcgOVWGMEf/iz7m5+QUB6jTA2+aUe3DB3rG
         S1ZI+QmVvBg/KgZ/qdW3mbgUN1z03uj7V5vKH56sar2makEAvQ4CyCz9IeVxDVOwFZz+
         +sHJ/qOI4hVYIKVGxUD3RFgPrCedUIV2z3ugtyz8jIZRnqAiVNMN/1SB1bsdq1JUtqk5
         dwKf0b0LdPbngEkBQ461KDXUHzeaR/DeC4tsnpsdgHcLl7SkeZn2cq2+m9PO3lU40t2H
         wys0zXj6Hnh/bFCFim3tcdBQk5itxiu15zcntMyJWGhcVh2cJ/eZncETVgB2FVMtDdvB
         CrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296541; x=1780901341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGxbL9faVDVgrvfQsBar+KVqQ+FJr+nh53Wa1vgTsOQ=;
        b=LVvo4zkrOpfSE6gJKuUUD2F6n9R1KZE32MafogT7MiZ9ZVe3DC20AKsbL58EuHz1ty
         3wwuloTnMW1K0pd0GQMQP560xhtc9lPPI/Lyjp0va9//wklAw4pnglQTM1kFPBhzfC9t
         ByvelcXDc1b4wh38rYpfJs/9bOjdkFjmYL3GgVlonK49atRhx1obVJaVI9jhkpfpnY9o
         aGCmz5G4xAaK/4C5n9anzT1kZGMopwVedePN/eqYjuLHv/Mu0rGGTJSIcwbl02sW488P
         88jZgapGyhCPCoTCMLacivwzj3BybqxXfyubbdddA7mmZWT6X6mzCJdqzW8QYoky/3xU
         3XRA==
X-Forwarded-Encrypted: i=1; AFNElJ9q9mbohQ+35qtXkXd8FdCbUghFOrqeFaKWFY6VFGoRK5CBXJF5ow3IJ+bAoQ9K6c9Pc4y2pDAzMKYtRw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw93s7cWDMw4RtyrycnzgK9Ps78zYSNVeZUxXApRq6xBP/ddtXj
	DG9hzTBBXhPNoBHDAgOORBccLHCjWq8ewvYpsEYk0dbqGoAPE/Hcwrw7
X-Gm-Gg: Acq92OHsZYciLRZz/1etjZuezUVREGr0/hHGn7uDKT+fOv65tKEpUUWTVxqrAhMb8ff
	zeOk15QtSqvAsiskxneXxXuh01uGVv3EOHm6AqD3u8aXk8RfLswf/r8B3dJgNFTfWICmcI1yhOu
	uu84Up8lV7V5U4Qeo2QdQ1qFnt6zesXR9duDwLJ/LK3mrgpDcLq4+SQzO+TSphKRcdvxA2gkw+L
	3wlaKpD+iMCF6/jWg4dKHzk+wtmied4LGLtThQhaajKYSWc+aoIcsOrVWrunH9UmewV/qTKCTIk
	XOhMZ0yWPVSm6usClQf6Xn9C9YB8EADw8D+5U9uFMxTmwdi3SsuAxN6X6zpWSif+sgma8vuIrCX
	TsOS4/ReTFLjRRJUD/2t9Ew8CjzQgW3qC2kBTTuPHVkfq9Hs9oZO4VjtWoEmKJ+jQ0M3GofCWch
	PAozC7i4O6EJT8cdKwtPhHR+wd0GoVTu8mRIk78Ju+iKcX1CCJSxajSAkbgKwajEtbI0p7Gm156
	6MQbmvwPzdE6DFKnB8=
X-Received: by 2002:a05:6512:2306:b0:5a3:f25f:cc30 with SMTP id 2adb3069b0e04-5aa60a32f56mr3289885e87.32.1780296540285;
        Sun, 31 May 2026 23:49:00 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b793e24sm1898970e87.73.2026.05.31.23.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:48:59 -0700 (PDT)
Message-ID: <b509c623-a47f-4216-9202-2c542f3c2e7b@gmail.com>
Date: Mon, 1 Jun 2026 09:48:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Sebastian Reichel <sre@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Andreas Kemnade <andreas@kemnade.info>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Amit Sunil Dhamne <amitsd@google.com>,
 Samuel Kayode <samkay014@gmail.com>, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
 <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_234903_110718_8A604D50 
X-CRM114-Status: UNSURE (   6.80  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjkvMDUvMjAyNiAxMzoxOCwgVXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yikg
d3JvdGU6Cj4gTmFtZWQgaW5pdGlhbGl6ZXJzIGFyZSBiZXR0ZXIgcmVhZGFibGUgYW5kIG1vcmUg
cm9idXN0IHRvIGNoYW5nZXMgb2YgdGhlCj4gc3RydWN0IGRlZmluaXRpb24uIFRoaXMgcm9idXN0
bmVzcyBpcyByZWxldmFudCBmb3IgYSBwbGFubmVkIGNoYW5nZSB0bwo+IHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2VfaWQgcmVwbGFjaW5nIC5kcml2ZXJfZGF0YSBieSBhbiBhbm9ueW1vdXMgdW5pb24u
Cj4gCj4gV2hpbGUgdG91Y2hpbmcgdGhlc2UgYXJyYXlzIHVuaWZ5IHNwYWNpbmcgYW5kIHVzYWdl
IG9mIGNvbW1hcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENh
cGFibGUgSHViKSA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KClJldmlld2VkLWJ5OiBN
YXR0aSBWYWl0dGluZW4gPG1henppZXNhY2NvdW50QGdtYWlsLmNvbT4KCllvdXJzLAoJLS0gTWF0
dGkKCi0tIApNYXR0aSBWYWl0dGluZW4KTGludXgga2VybmVsIGRldmVsb3BlciBhdCBST0hNIFNl
bWljb25kdWN0b3JzCk91bHUgRmlubGFuZAoKfn4gV2hlbiB0aGluZ3MgZ28gdXR0ZXJseSB3cm9u
ZyB2aW0gdXNlcnMgY2FuIGFsd2F5cyB0eXBlIDpoZWxwISB+fgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
