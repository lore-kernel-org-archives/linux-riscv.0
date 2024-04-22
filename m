Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F67C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 08:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRRCQXHNrIsWCOjXn7SpYmTvhaW4tUbhGljyD8YhNSM=; b=OGeaj3QSsWLP2v
	X7qv7EWUxS4yDwTern0xA5+y7tF8/hgyGmk/w6Vpeq9Mo7Z4eKg7IZxZYr+FvToiFekL6PVhi2v/B
	N6Wsv0Px2vouuQCXh0+EkRfP/3BnTALr4HIFGp8mtPJarjZG3LUmphZ+gEByc3Ih9kMh+dBkpjl6K
	lLIN/BpI3KsLuM1gc9G5TSt4I9Nv+LqARaITfoMvdRWdERXnkF2cZy4j32ylGi8MpTSl1zwfqkmkI
	baDXLIQbTxHzPPlwX3O/egPt8bVdqlZpEbqQdSON54E9XrL3hFya6UsBXIZwn6+h/83yvLJsXea5Z
	xpKG2xlWpoE0Jp6CQKPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rypQX-0000000Cmg0-2FnC;
	Mon, 22 Apr 2024 08:53:29 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rypQI-0000000CmSd-2uHG
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 08:53:26 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-34b39ecbcccso53131f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Apr 2024 01:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713775992; x=1714380792; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BSJifQLOOtjWe2caLguw5JxOp3zY6VKsL2huHk/+dLw=;
        b=ZsklkxLrnnt20pt8cQdoTw7yz4BV0tqycyn6BbNwZXOkUPo8wKTeQAKH1StioMPeoA
         FIcKA+gx5xAMYIHARbEI/MopgpZGtIPIfIUl54lY5dlVLzKYn8m71Lc9cii6sGNi0ZSo
         PjA9kPItMQt1Xo5NY0uitFqWryKGJYT4dwe6/bJNFXdT8pbRvXT1Ga1xoFd7bdIvE1Id
         c5HqyycfGqazZQB4X3hJHPqr5Mk2qg4gBh9QdpRMJpscv/7R57mTpa6py0zvy+DnCpbx
         cJwpDrOfTB91PHZKAtysGJebjwTL2aAz0lIdlgOIEX3nBtc3//JuKhT0UUPYevh1WOJ4
         ovDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713775992; x=1714380792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BSJifQLOOtjWe2caLguw5JxOp3zY6VKsL2huHk/+dLw=;
        b=Eypj+1vSxY8tvnUxSpXGupqjmco5S2zy4E1aAs5BirrpAtFtYHfXJFN3Z6ewFggBMQ
         B/rxteDMDTA4dQGRBA7E/V54Yj8uFfFNWqY5PIL4qZD45pFyW5H9Hlj4Py0abkOJ9MSh
         y3C/P1fpdef0nsWWR8Z92ZMElPp8iAAGx958oSdX0E/3ZkAVZ8aTz4VwbY+K9wa4V5AA
         LGDFI5DLuqMOQUW/pB29z4ekkOIANvDY2UVA1YgTEyT0vwfQEJYlpnpcC+G/176yJ3IU
         TOkzpUIl3mUeQ18TuTjcXNiTmfb36LkGYQ04W5pRzk2qLdk3b/TH+PR8/LvjfJrtvuNR
         eSHg==
X-Forwarded-Encrypted: i=1; AJvYcCXrC8B3GYU+x/MiUCTFqZk41u1IPTuftTMe0PSYFArSPo8K+UDfOrv9RwSuXp03Zyc6pdpE2y2TkkxvJweIavFwgRx2GRaFX/BycpsIklYb
X-Gm-Message-State: AOJu0YydUFSqZJ8KLramCBnkq0sNa08d6bIkVbnFhSE9SRvheMPnRLZI
	GwcBKgzJyxBsa/66XpftoYDbFAm7/zBr6e+OH2GggNjYQrZdktv/ZVQeLzQSmfQ=
X-Google-Smtp-Source: AGHT+IHRas3l39C/N5OldWvLjh8/Ocyg0dgZzgEEfR5deo9HXajPzyL+wuWZHMyf6dRNz3xpRu97wA==
X-Received: by 2002:a05:600c:3b09:b0:418:ef65:4b11 with SMTP id m9-20020a05600c3b0900b00418ef654b11mr7146190wms.2.1713775991653;
        Mon, 22 Apr 2024 01:53:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:dc65:11af:998:225e? ([2a01:e0a:999:a3a0:dc65:11af:998:225e])
        by smtp.gmail.com with ESMTPSA id g7-20020a05600c310700b0041a92bb0c10sm25826wmo.2.2024.04.22.01.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 01:53:11 -0700 (PDT)
Message-ID: <6ab9e591-f2f2-4267-8bdd-169ef0243e14@rivosinc.com>
Date: Mon, 22 Apr 2024 10:53:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-5-cleger@rivosinc.com>
 <20240419-clinic-amusing-d23b1b6d2af2@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240419-clinic-amusing-d23b1b6d2af2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_015315_360816_952024E2 
X-CRM114-Status: GOOD (  12.33  )
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

CgpPbiAxOS8wNC8yMDI0IDE3OjUxLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTgsIDIwMjQgYXQgMDI6NDI6MjdQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBU
aGUgWmMqIHN0YW5kYXJkIGV4dGVuc2lvbiBmb3IgY29kZSByZWR1Y3Rpb24gaW50cm9kdWNlcyBu
ZXcgZXh0ZW5zaW9ucy4KPj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIFpjYSwgWmNmLCBa
Y2QgYW5kIFpjYi4gWmNlLCBaY210IGFuZCBaY21wCj4+IGFyZSBsZWZ0IG91dCBvZiB0aGlzIHBh
dGNoIHNpbmNlIHRoZXkgYXJlIHRhcmdldGluZyBtaWNyb2NvbnRyb2xsZXJzLwo+PiBlbWJlZGRl
ZCBDUFVzIGluc3RlYWQgb2YgYXBwbGljYXRpb24gcHJvY2Vzc29ycy4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+PiAtLS0KPj4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDQgKysrKwo+PiAgYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1ZmVhdHVyZS5jIHwgNCArKysrCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4+IGluZGV4IDU0M2UzZWEyZGEwZS4uYjc1
NTFiYWQzNDFiIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgK
Pj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4+IEBAIC04Miw2ICs4Miwx
MCBAQAo+PiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pBQ0FTCQk3Mwo+PiAgI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1hBTkRFU1BNVQkJNzQKPj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSU1PUAkJ
NzUKPj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0EJCTc2Cj4+ICsjZGVmaW5lIFJJU0NWX0lT
QV9FWFRfWkNCCQk3Nwo+PiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pDRAkJNzgKPj4gKyNkZWZp
bmUgUklTQ1ZfSVNBX0VYVF9aQ0YJCTc5Cj4+ICAKPj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9Y
TElOVVhFTlZDRkcJMTI3Cj4+ICAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2Nw
dWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+PiBpbmRleCAxMTVi
YTAwMWYxYmMuLjA5ZGVlMDcxMjc0ZCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1ZmVhdHVyZS5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+PiBA
QCAtMjYxLDYgKzI2MSwxMCBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2
X2lzYV9leHRbXSA9IHsKPj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmEsIFJJU0NWX0lTQV9F
WFRfWkZBKSwKPj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmgsIFJJU0NWX0lTQV9FWFRfWkZI
KSwKPj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmhtaW4sIFJJU0NWX0lTQV9FWFRfWkZITUlO
KSwKPj4gKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2EsIFJJU0NWX0lTQV9FWFRfWkNBKSwKPj4g
KwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2IsIFJJU0NWX0lTQV9FWFRfWkNCKSwKPj4gKwlfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6Y2QsIFJJU0NWX0lTQV9FWFRfWkNEKSwKPj4gKwlfX1JJU0NWX0lT
QV9FWFRfREFUQSh6Y2YsIFJJU0NWX0lTQV9FWFRfWkNGKSwKPj4gIAlfX1JJU0NWX0lTQV9FWFRf
REFUQSh6YmEsIFJJU0NWX0lTQV9FWFRfWkJBKSwKPj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6
YmIsIFJJU0NWX0lTQV9FWFRfWkJCKSwKPj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmMsIFJJ
U0NWX0lTQV9FWFRfWkJDKSwKPiAKPiBZZSwgdGhpcyBsb29rcyBleGFjdGx5IGxpa2Ugd2hhdCBJ
ICJmZWFyZWQiLgoKT2sgYnV0IGZvciBpbnN0YW5jZSwgUWVtdSBhY3R1YWxseSBzZXQgWmMqIGJh
c2VkIG9uIEMvRi9ELiBTbyB0aGUgSVNBCnN0cmluZyBjb250YWluaW5nIHRoZXNlcyBkZXBlbmRl
bmNpZXMgc2hvdWxkIGFjdHVhbGx5IGFsc28gYmUgYWxsb3dlZC4KU28gc2hvdWxkIHdlIHNpbXBs
eSBpZ25vcmUgdGhlbSBpbiB0aGUgSVNBIHN0cmluZyBhbmQgYWx3YXlzIGRvIG91ciBvd24KInBv
c3QtcHJvY2Vzc2luZyIgYmFzZWQgb24gQy9GL0QgPwoKVGhhbmtzLAoKQ2zDqW1lbnQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
