Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E138C0219D
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 12:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/GUT7MfoK4uEoEJGOQ9GvxhNCEwTX/s4AeNk9zfnhPo=; b=m7W3NM7NSyowOW
	dWp20O/qHjVoea0h0bQQEfTYkbdk9UY6sTfV1bra4uFk3+AGLI+TEKew4EUYgFg5dhMNFeIC/fOHg
	R/8tDbVpoLW/6/06dLGXjZYuhWniacurUhm+8/+4VgO8W7adPfdJC6j7NpLKKh+DDJorWAJldQXza
	Q6aStLuctvoYBdvnoOe0wLdjEVGJMKtLCT1kLMfvnM9fdEyZrQ6dK3MFHkfNf5MuubDSg/zmfolzK
	5n6X4AcfS6vf9y584XqZwBrM4CMLKEuLLh7CGM1qp1rqu2E/k5B+Hq8HVQTZD7ffNFr2YhTBGrewt
	JbdfR42rj1fq7QLuY4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSjE-0000000HMrv-2A20;
	Mon, 10 Feb 2025 12:17:32 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thSGi-0000000HIZN-1ciR;
	Mon, 10 Feb 2025 11:48:05 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab7a6758b7fso311605166b.3;
        Mon, 10 Feb 2025 03:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739188083; x=1739792883; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HVl3EUiEdR+2nH8WWZkP4Nhw+7rNyWyQ5wQqq3ShzRs=;
        b=cHs44EUD+l5ppDbqnUH4huSqUkovCpcNu88Aym2fvI9R3y0iKzF8rkwwd2MrZ5LcAw
         4GfpkwlfkVIvVT4H9X7EOeLA6wRE/JKs+w2+oHLJciIartLi1rsXXikjHzO5w/n5Mp/j
         evHVv5Crw7+KGbNF9GiQfFr2fk/KHJwLEewbMAEJg7a8v9u5YDmXvO7gvyLYudF9k9xh
         rhepPPQuSxakLNQgRdwUMkfs5BUts0korBH7tA7VagIcB9TxnawuL7sZRydioT5PnIFI
         PZ7SSi6x/kyOwL5d1cU9KBc8peO1aY5tuEGNTtX507uib1GmVOKp4AX7wgQZIArfI/j+
         xDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739188083; x=1739792883;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HVl3EUiEdR+2nH8WWZkP4Nhw+7rNyWyQ5wQqq3ShzRs=;
        b=I7yWvCh6StAYUSmJYYePxKDrO9av6wsokenoNBezl6CwToDxJnr/36qLiv3xnZT7Kv
         idiR9vT3DBOoxocPQ5AZmeVrqHUxgBgCuyzBKdjVcv+swDDEatxqjlNO4J9j8bRnCTe7
         vNt/G7PDPWQ9jnmy21NrJ8uJnl03d7eURnzeV1KMDbLAU6/hRk2JXbEAgQsu46fRWrFH
         nVJudf5bEQl/Ha7DUEVxCp/b3HR3ky+KVHUPHyUnNgnJt/dr4EvJXQau6E2FRXjYUzuM
         IJWid2nargYcq9733/EnHZXYec+6N0dg7FEjam0cEpOAk/B+2MTf9OkGwM+lMseNNtM7
         ji3w==
X-Forwarded-Encrypted: i=1; AJvYcCULptQVZ+cmt7lsZJBOQc4XOs1V2mGRO9Pimee/YxKmZ2Z0+dAiEbV7FR16vSBqHzstKlxrCMxxCgTSnx36AcDo@lists.infradead.org, AJvYcCWxFRmJm4Wd7cIoOnzFSmgdPPpOnitzpFHj+s2TPQW+gjq113IksPgvWwue5/ahR4l00FQb+NlBXzTi5lQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj7dXTiKfksVmddWe8HzNCQijyrck3PRy2YGdN7oUVPwNgEMYP
	vBUBYIqDaxlYm46ZtpNSCIojgeTMy5hn+vgXROsYFVBOCTXEa6Kf
X-Gm-Gg: ASbGncv3Qh8xijdIlLWXgLPsOQbhQ+i8B9cJAZXwxboVpcswXolbn0DOP11hVO86dOW
	pOtnHTEeGsEme/gNjRppNI5DRuV2ArIo1zoD5zIXNBooMjlyQxOr+IXZ/8575fyfwM8UEeCAqOb
	f4iaU76uTbRGVkOKeufO08ay4z0N4M1qDDvr3uIiYZgbrBmBjSSXhHqscRzV0iDUq003alcIRPG
	TIsj68pkFpFYfI9T90EWGbebZGpXLHpJyjmQ6jI3cpPYuLgnp1Fr+s/bK+lp7brfJ4CwDzm0YYb
	k9JGw0mDls9Hjh+eaND/ZaHYVsF8NPJh
X-Google-Smtp-Source: AGHT+IGY3dILn6ts/Eq3QIZU6ECVgNuSbLxMNRT8V0H+TQxvFHnWdoPp+ST/buUvAjzzmdL3OQMGTA==
X-Received: by 2002:a17:907:9719:b0:aae:8841:2bba with SMTP id a640c23a62f3a-ab789b84353mr1350942666b.22.1739188082366;
        Mon, 10 Feb 2025 03:48:02 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bc28c58csm252975066b.135.2025.02.10.03.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:48:01 -0800 (PST)
Message-ID: <e17ef70f7536bd1bf0b4d0f7258f91cffac76a20.camel@gmail.com>
Subject: Re: [PATCH 08/10] riscv/arm64: dts: cv18xx: Add sysctl and reset
 nodes
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	devicetree@vger.kernel.org, Haylen Chu
 <heylenay@outlook.com>, 	linux-arm-kernel@lists.infradead.org, Sebastian
 Reichel <sre@kernel.org>,  Arnd Bergmann	 <arnd@arndb.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>
Date: Mon, 10 Feb 2025 12:47:59 +0100
In-Reply-To: <h73zitljaig7nrccd3f23i655imswv54tf667dhq3dord7rxsr@unqncqlorvc6>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-9-alexander.sverdlin@gmail.com>
	 <h73zitljaig7nrccd3f23i655imswv54tf667dhq3dord7rxsr@unqncqlorvc6>
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_034804_427447_91EC5EFF 
X-CRM114-Status: GOOD (  17.83  )
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

VGhhbmtzIGZvciBxdWljayBmZWVkYmFjayBJbm9jaGkhCgpPbiBNb24sIDIwMjUtMDItMTAgYXQg
MTM6MTMgKzA4MDAsIElub2NoaSBBbWFvdG8gd3JvdGU6Cj4gT24gU3VuLCBGZWIgMDksIDIwMjUg
YXQgMTE6MDY6MzNQTSArMDEwMCwgQWxleGFuZGVyIFN2ZXJkbGluIHdyb3RlOgo+ID4gQWRkIHJl
c2V0IGNvbnRyb2xsZXIgbm9kZSBhbmQgcmVxdWlyZWQgc3lzY3RsIG5vZGVzLgo+ID4gCj4gPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbWFp
bC5jb20+Cj4gPiAtLS0KPiA+IMKgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTh4eC1w
ZXJpcGguZHRzaSB8IDE2ICsrKysrKysrKysrKysrKysKPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCAx
NiBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NvcGhnby9jdjE4eHgtcGVyaXBoLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9j
djE4eHgtcGVyaXBoLmR0c2kKPiA+IGluZGV4IDUzODM0YjA2NThiMi4uZDc5M2I2ZGI0ZWQxIDEw
MDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxOHh4LXBlcmlwaC5k
dHNpCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4eHgtcGVyaXBoLmR0
c2kKPiA+IEBAIC0zMDksNSArMzA5LDIxIEBAIGRtYWM6IGRtYS1jb250cm9sbGVyQDQzMzAwMDAg
ewo+ID4gwqDCoAkJCXNucHMsZGF0YS13aWR0aCA9IDw0PjsKPiA+IMKgwqAJCQlzdGF0dXMgPSAi
ZGlzYWJsZWQiOwo+ID4gwqDCoAkJfTsKPiA+ICsKPiAKPiA+ICsJCXJ0Y3N5c19jdHJsOiBzeXNj
b25ANTAyNTAwMCB7Cj4gPiArCQkJY29tcGF0aWJsZSA9ICJzb3BoZ28sY3YxODAwLXJ0Y3N5cy1j
dHJsIiwgInN5c2NvbiI7Cj4gPiArCQkJcmVnID0gPDB4MDUwMjUwMDAgMHgxMDAwPjsKPiA+ICsJ
CX07Cj4gPiArCj4gPiArCQlydGNzeXNfY29yZTogc3lzY29uQDUwMjYwMDAgewo+ID4gKwkJCWNv
bXBhdGlibGUgPSAic29waGdvLGN2MTgwMC1ydGNzeXMtY29yZSIsICJzeXNjb24iOwo+ID4gKwkJ
CXJlZyA9IDwweDA1MDI2MDAwIDB4MTAwMD47Cj4gPiArCQl9Owo+ID4gKwo+ID4gKwkJc29jLXJl
c2V0IHsKPiA+ICsJCQljb21wYXRpYmxlID0gInNvcGhnbyxjdjE4MDAtcmVzZXQiOwo+ID4gKwkJ
CXNvcGhnbyxydGNzeXMtY3RybCA9IDwmcnRjc3lzX2N0cmw+Owo+ID4gKwkJCXNvcGhnbyxydGNz
eXMtY29yZSA9IDwmcnRjc3lzX2NvcmU+Owo+ID4gKwkJfTsKPiAKPiBJIHRoaW5rIHRoZXNlIG5v
ZGUgaXMgbm90IHN1aXRhYmxlIGZvciByaXNjdi4gSXQgc2hvdWxkIHVzZSBTQkkgU1JTVAo+IGV4
dGVuc2lvbiB0byByZXN0YXJ0LgoKSW5kZXBlbmRlbnQgZnJvbSB0aGUgcGFydGljdWxhciBmb3Jt
LCBvciBpdHMgY29ycmVjdG5lc3MsIHRoaXMgaXMgc3RpbGwgSFcKZGVzY3JpcHRpb24sIHJpZ2h0
PyBJdCB3b3VsZCBiZSBhICJwb2xpY3kiIGZvciB0aGUga2VybmVsIGNvbmZpZ3VyYXRpb24sIGlm
CnRoZSBwYXJ0aWN1bGFyIGJ1aWxkIHdvdWxkIHJlbHkgb24gdGhlIEZXIG9yIGEga2VybmVsIGRy
aXZlciB0byByZWJvb3QuCgpJbiBvdGhlciB3b3JkcywgdGhlIEhXIGJsb2NrIHJlbWFpbnMgaW4g
cGxhY2UsIG5vIG1hdHRlciBpZiBpdCdzIGNvbnRyb2xsZWQKYnkgYSBrZXJuZWwgbW9kdWxlIG9y
IGEgRlcuIFdoYXQgdGhlIHBvaW50IGluIGhpZGluZyBpdCBmcm9tIHRoZSBSaXNjViBwYXJ0Cm9m
IERULCBrZWVwaW5nIG9uIEFSTTY0IHNpZGUgb25seT8KCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4u
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
