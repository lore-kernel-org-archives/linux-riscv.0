Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47137C369BD
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 11:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mbOJgQHM0A9UVvuQsa5W5xDZBiQEcVRNwXQPc1BZGI=; b=Kk7NX+lDTTuhEt
	sLADpzvE+MAg28eGDigA4k3imTqPIXOwVWf9+OFPvkPnrw9bsi8UdMFpV3NblYDiDE+HsJXV7iA70
	hU66PcZoQD4etM2+2W3BHoSqfILIrZasT8tLiWaNBQCvJXZqW+A+dJSMOsuYhLchkeMeTs2uRfg9G
	KAl9vdyHI2uSQFdZ8X36ccX3FCjaw7B6RYZhkNmnyL0HlE+9goDd/yIMMoq12LXZOfv4ohUxQLgtx
	vA9WkH8a+ulWKy53+ni6tLnaPYMnoxqsI0jn3Uio5i3PYLtnFVBNqkxBrEuXdmFGqVo1oL8IAZ+F5
	KNGH0P1GbQcQW6QDMGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u511Z-00000009MJu-1nsK;
	Wed, 16 Apr 2025 11:33:49 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u511W-00000009MJQ-1V3O
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 11:33:47 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-85b41281b50so191759539f.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Apr 2025 04:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744803225; x=1745408025; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WUKLRPozuEL+beG7gwcwBgRjJD70PGCGuYuOaYbRFSU=;
        b=wlHSOWBoI+SVJ5cN90TfkUl6SUlfu10LeDeGI6PqSshgijEjcno8yscQu7iZbDdQEd
         PT692wTmL1KhhwiP3dd0kIgwzpUvoml1puQjFig4RwlLIJR75wz7GfQM0gmioUB3hfgq
         P7BTw943enCTgtOqZVUpit40O05bpXpxFxgwq1e9OUbCbf6GoOA9GmPXI/dXt9zs+/TK
         qEMLbKIXc0ns4nNaE2jINMwtZR2pQIOhIUmLalEDo0H6eS+UkgvF/9C4rqAC+hkGE1wA
         oAVgMQqsMDD3S9GcQTbF9SAiiJ6Et3mI4BsBb5nxvpvcNSifleHMBzxShMOx/mGez5KN
         OgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744803225; x=1745408025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUKLRPozuEL+beG7gwcwBgRjJD70PGCGuYuOaYbRFSU=;
        b=uFy5XBjgVb66eYqE5Rr3/OlQkd1gJreCnhYTAo6decnYsmUzKwzcuHNjs+mZNGRc0q
         VnZsWhAlE52+PJ7EJ6OoCHeFjM75wtGRu7Qp/89MyIIuvSZv42jyQGv2tXwXjf3Hwlbq
         B1q9X+YZoowrNxllsEQVEtCFVGHoIAtWxwnBXJzgtRgbXa3jDyghdjrDb4Yi884GX9C0
         VYnYtiA3Tq+63zMSHu2Am9460ipd2sWNiHPk2RPjhuylnBIRZIMOunwBzU2nb3Dsgrt/
         VGBGNVMZ/QVigESINnYKU4BuvFpf+4Nida071ST3pH9W7H4aW3tEHm//BXKpIPZtb1+Y
         wLfg==
X-Forwarded-Encrypted: i=1; AJvYcCWhxfTQojFo8L0SnlZHT4PDneK+ZmkIq/aeKzta6kFb29Rfg9/td9C9LHHOwenVb/JvMda+m+Ys5E2M4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJEXE1dasaLG/RrR7VDFFkk93G2lvxgbN+iOGGVlQHHsyVw9A6
	40MCOpQFSwG7/ABcYgMosc7PqecsfgCMgkvYrpkrsZZMpGnOOXYd80Bawvyk5QI=
X-Gm-Gg: ASbGncsQIybbZHu52Fm3DNLnlfwb9iFrXgq/eeKDz0OE7w5nnlTzShb9PVvfcrYeEka
	QUIzJTmLEMN6+mixZt9TpDcOEu0L54adxXRYLta0YLDuJC7TNbbHGBnnaf1yxSzwyGFxzyPTD9Y
	HRnWf1xjmiQtc9zWreSdkBBCqUElyT0JlDZTHFqCEG+CSyLM3hcDxL0eie9jpzcs0yJ7fUJ2ro+
	7t/cit4ITMDaekBO3ZUObnyWfqwtkXnaJIOZuWNRne/iZG+V+chDtA0nMKc4/iCiRU9GShEDzIL
	XTaWZ1aPXrmkcrw7rC6Nx9jySFz0rRZbkhsKWvboLcdldlHl+c3NWTPr6V+1xe2PaGlZ99kuEwj
	6auRL
X-Google-Smtp-Source: AGHT+IGUlzNooKv6H53Lv+4jj0Zw67S54d15RSAIPzhmPstWQkhOlgh0PpMBph3Z+r1w+yJha2JiPw==
X-Received: by 2002:a05:6e02:1fe4:b0:3d6:ca61:5f67 with SMTP id e9e14a558f8ab-3d815b5e5bcmr11964315ab.14.1744803224840;
        Wed, 16 Apr 2025 04:33:44 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e02105sm3566624173.90.2025.04.16.04.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 04:33:44 -0700 (PDT)
Message-ID: <3dfc300f-081c-4824-97c3-842f72d2a7d3@riscstar.com>
Date: Wed, 16 Apr 2025 06:33:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property
 resets
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Yixun Lan <dlan@gentoo.org>
Cc: Guodong Xu <guodong@riscstar.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, drew@pdp7.com,
 inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org,
 tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com,
 duje.mihanovic@skole.hr, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-2-guodong@riscstar.com>
 <20250411-confider-spinster-35f23040d188@spud>
 <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
 <CAH1PCMZnJDcYKJR35WirQT95hte0NWvGBe4fjDuyZEgagvunAA@mail.gmail.com>
 <20250415101249-GYA30674@gentoo>
 <0bbd2842-72bc-47a7-832a-fc8833163e32@riscstar.com>
 <20250415122807-GYA30943@gentoo>
 <hogqotzzpzcow2xjrwh34qcuiu7ooc2qnvlhuvexzvqkrcsfop@mhz26t5vu35p>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <hogqotzzpzcow2xjrwh34qcuiu7ooc2qnvlhuvexzvqkrcsfop@mhz26t5vu35p>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_043346_598190_90B246BA 
X-CRM114-Status: GOOD (  12.31  )
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

T24gNC8xNi8yNSAxMjoxOCBBTSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gT24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgMTI6Mjg6MDdQTSArMDAwMCwgWWl4dW4gTGFuIHdy
b3RlOgo+PiBtYXliZSB0aGVyZSBhcmUgY2FzZXMgdGhhdCB1c2VycyBkb24ndCB3YW50IHRvIGlz
c3VlIGEgcmVzZXQuLgo+PiBzbywgd2FudCB0byBtYWtlIGl0IG9wdGlvbmFsLi4gSSBjYW4gdGhp
bmsgb25lIGV4YW1wbGUgdGhhdCwKPj4gZGlzcGxheSBjb250cm9sbGVyIGlzIHVwIGFuZCB3b3Jr
aW5nIGZyb20gYm9vdGxvYWRlciB0byBsaW51eCwKPj4gcmVzZXQgaXQgd2lsbCBnb3QgYSBmbGlj
a2VyIHBpY3R1cmUuLgo+IAo+IEFncmVlZC4gWW91IGNhbiBqdXN0IGRlYXNzZXJ0IHRoZSByZXNl
dCBhdCBwcm9iZSB0aW1lLiBUaGF0IHNob3VsZG4ndAo+IGludGVyZmVyZSB3aXRoIGEgUFdNIHRo
YXQgaXMgYWxyZWFkeSBwcm9kdWNpbmcgYW4gb3V0cHV0LgoKSSB0aGluayB5b3UncmUgc2F5aW5n
IHJlc2V0IGNhbiBiZSBhIHJlcXVpcmVkIHByb3BlcnR5LCB0byBiZQpoYXJtbGVzc2x5IGRlYXNz
ZXJ0ZWQgYXQgcHJvYmUgdGltZT8gIFlpeHVuIHdhcyBzdWdnZXN0aW5nIGl0CnNob3VsZCBub3Qg
YmUgcmVxdWlyZWQsIGJlY2F1c2UgaXQgbWlnaHQgYWxyZWFkeSBiZSBkZWFzc2VydGVkLgoKQW55
d2F5LCBJIGRvbid0IGZlZWwgc3Ryb25nbHkgZWl0aGVyIHdheS4gIE1heWJlIHRoZSBEVFMKbWFp
bnRhaW5lcnMgY2FuIHJlY29tbWVuZCB3aGF0IHRvIGRvLgoKCQkJCQktQWxleAoKPiAKPj4gR1BH
IEtleSBJRCBBQUJFRkQ1NQo+IAo+IElmIHlvdSBhZHZlcnRpc2UgeW91ciBPcGVuUEdQIGNlcnRp
ZmljYXRlLCBJIHJlY29tbWVuZCB1c2luZyB0aGUgbG9uZwo+IGlkLiBTZWUgZm9yIGV4YW1wbGUg
aHR0cHM6Ly9rZXlzLm9wZW5wZ3Aub3JnL3NlYXJjaD9xPUFBQkVGRDU1LgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
