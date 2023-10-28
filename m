Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5442BC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 21:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z6KQrKAVMU1EzgeD8NaFWUV2Luka70p/sovgfZZ3+RU=; b=02KKKukR9Bm761
	LKU1A8mZbsl+WijPtjtLRUv3s1Eq2qeyNEfppFZdtQQsIRvuZH1/h8cG4CIwYK1tPx63uHQsuZkN3
	2xsONQsK7vvHOIjsakW3jMPkmivRTLRYapW0uzTWzeK1LlLpKlJqYLECZ8otnFTZ8yFg584Lm9kYr
	0xzdknmwpaxMexf8CUMWbO8i4HspKOz44mxtYGzCeDiVMkzwemE3nxmpvkpUubmtnZz1SL9uaeGQ7
	vbF/yCZRBdhmj174ff2b2psZ5xwV2cHhBafeFXsaGKwcsWaZCIctUG70ZYIBwosWRZBPf/jxvLTq5
	lGWLQ+Li8J8UuX+8s4Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwqpz-000rCW-1p;
	Sat, 28 Oct 2023 21:27:19 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwqpw-000rBe-0P
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 21:27:17 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-778a20df8c3so243775385a.3
        for <linux-riscv@lists.infradead.org>; Sat, 28 Oct 2023 14:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698528434; x=1699133234; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZNJ5LBHB14fh0G6oAmi/MIh35dXfuQVmtC+jUmWNXY=;
        b=SzYnlshPMhnm/JhZ0DngOcECJXHQEMzVfMN8xrEsmBc99aPkRW+4tfA3AWN4GuUsbW
         6UDK9FRifDDzjHOve71epyDOsY4hYHoON1pLWa7ugg73CHEvrygrTG7FNVKNThjEHo9B
         CMvVH8vZe8cTHQCgyOfIopwDfxmp83r6BGx0/46Wpm1KBXwPvVU/KABT6sv0lIGBylrT
         /lTMNUKmcU2YQSIx/Cr1x8LlQkRFfFCCAEpV94enjLsAH+QqgcfshC5WEyhxMoy7M9+5
         F5AuI30uQRLatbs1yjHp11aqhXNbJ+4Kr+DSBkbT2KYH4am0qS9kxFQE98+Y6s8RNY13
         mCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698528434; x=1699133234;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZNJ5LBHB14fh0G6oAmi/MIh35dXfuQVmtC+jUmWNXY=;
        b=dGpi4AqLFuU6t7I88J2rNwrakqemD/yA1SBSqSzs7g/cL6QkClofzs1ICasJ2K4NxY
         rzwDRt8abYW25qbLIyevvlWCbBZZ6t7H0/wKvlDhUJG054fjEUwwgCNalI13qBtU0lfa
         0BwXiouOjtV9UbVnetm6VF3LhQ9xPCoN7a7c51jt8OaI9S93KyRxpqia4bqCNOO+yzJI
         LirR+NjGXIU6mr6fUkCU1Idn3HYiRhpQvRCn5mpEqM7lyhgQdxvjjUuHnMh5pCuJJZp7
         lZyVo8I+Oqj+LN4gNZyXkAcp7+TARmzuxwzI/UWXFHBQagNM8OFU1svwIPcy/eXN4Nxc
         Cm8A==
X-Gm-Message-State: AOJu0YzxALfddIApGftT3RmSCqxT6dsHPiVcmkQq7XyUEcAbPyhmfgod
	ZNH/azO2wOqibUxAaQei+u+n8cuTqJ70TPRQnRw=
X-Google-Smtp-Source: AGHT+IFzWOHUqGhWWbxiEjFLKVYCsO+qorh1TBlfUNPnoKr8olCLDe3Zo88EiW0+r8N/MtNcg6lYxw==
X-Received: by 2002:a05:620a:19a2:b0:778:9161:c9bd with SMTP id bm34-20020a05620a19a200b007789161c9bdmr6577438qkb.56.1698528434547;
        Sat, 28 Oct 2023 14:27:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:c988:e7b9:36ab:57c6? ([2600:1700:2000:b002:c988:e7b9:36ab:57c6])
        by smtp.gmail.com with ESMTPSA id bl9-20020a05620a1a8900b0076cc4610d0asm1866833qkb.85.2023.10.28.14.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Oct 2023 14:27:14 -0700 (PDT)
Message-ID: <133b60f7-a71c-4fa2-ae19-4cad05596a23@sifive.com>
Date: Sat, 28 Oct 2023 16:27:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] riscv: configs: defconfig: Enable configs required
 for RZ/Five SoC
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, geert@linux-m68k.org
Cc: prabhakar.csengg@gmail.com, magnus.damm@gmail.com, conor+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
References: <mhng-ac92041d-85e9-4725-b61c-bc0fef5549ec@palmer-ri-x1c9a>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <mhng-ac92041d-85e9-4725-b61c-bc0fef5549ec@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_142716_196488_D4E75F4A 
X-CRM114-Status: GOOD (  13.35  )
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

SGkgUGFsbWVyLAoKT24gMjAyMy0xMC0yNyA1OjExIFBNLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToK
PiBPbiBUdWUsIDAzIE9jdCAyMDIzIDA1OjM0OjEzIFBEVCAoLTA3MDApLCBnZWVydEBsaW51eC1t
NjhrLm9yZyB3cm90ZToKPj4gSGkgUHJhYmhha2FyLAo+Pgo+PiBPbiBGcmksIFNlcCAyOSwgMjAy
MyBhdCAyOjA34oCvQU0gUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+PiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAu
cmVuZXNhcy5jb20+Cj4+Pgo+Pj4gRW5hYmxlIHRoZSBjb25maWdzIHJlcXVpcmVkIGJ5IHRoZSBi
ZWxvdyBJUCBibG9ja3Mgd2hpY2ggYXJlCj4+PiBwcmVzZW50IG9uIFJaL0ZpdmUgU29DOgo+Pj4g
KiBBREMKPj4+ICogQ0FORkQKPj4+ICogRE1BQwo+Pj4gKiBlTU1DL1NESEkKPj4+ICogT1NUTQo+
Pj4gKiBSQVZCICgrIE1pY3JlbCBQSFkpCj4+PiAqIFJJSUMKPj4+ICogUlNQSQo+Pj4gKiBTU0kg
KFNvdW5kK1dNODk3OCBjb2RlYykKPj4+ICogVGhlcm1hbAo+Pj4gKiBVU0IgKFBIWS9SRVNFVC9P
VEcpCj4+Pgo+Pj4gQWxvbmcgd2l0aCB0aGUgYWJvdmUgc29tZSBjb3JlIGNvbmZpZ3MgYXJlIGVu
YWJsZWQgdG9vLAo+Pj4gLT4gQ1BVIGZyZXF1ZW5jeSBzY2FsaW5nIGFzIFJaL0ZpdmUgZG9lcyBz
dXBwb3J0IHRoaXMuCj4+PiAtPiBNVEQgaXMgZW5hYmxlZCBhcyBSU1BJIGNhbiBiZSBjb25uZWN0
ZWQgdG8gZmxhc2ggY2hpcHMKPj4+IC0+IEVuYWJsZWQgSTJDIGNoYXJkZXYgc28gdGhhdCBpdCBl
bmFibGVzIHVzZXJzcGFjZSB0byByZWFkL3dyaXRlCj4+PiDCoMKgIGkyYyBkZXZpY2VzIChzaW1p
bGFyIHRvIGFybTY0KQo+Pj4gLT4gVGhlcm1hbCBjb25maWdzIGFzIFJaL0ZpdmUgU29DIGRvZXMg
aGF2ZSB0aGVybWFsIHVuaXQKPj4+IC0+IEdQSU8gcmVndWxhdG9yIGFzIHdlIG1pZ2h0IGhhdmUg
SVAgYmxvY2tzIGZvciB3aGljaCB2b2x0YWdlCj4+PiDCoMKgIGxldmVscyBhcmUgY29udHJvbGxl
ZCBieSBHUElPcwo+Pj4gLT4gT1RHIGNvbmZpZ3MgYXMgUlovRml2ZSBVU0IgY2FuIHN1cHBvcnQg
aG9zdC9mdW5jdGlvbgo+Pj4gLT4gR2FkZ2V0IGNvbmZpZ3Mgc28gdGhhdCB3ZSBjYW4gdGVzdCBV
U0IgZnVuY3Rpb24gKGFzIGRvbmUgaW4gYXJtNjQKPj4+IMKgwqAgYWxsIHRoZSBnYWRnZXQgY29u
ZmlncyBhcmUgZW5hYmxlZCkKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxw
cmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4+Cj4+IFJldmlld2VkLWJ5
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+Pgo+PiBBcyBJ
IGV4cGVjdCB0aGlzIHRvIGdvIGluIHRocm91Z2ggdGhlIFJJU0MtViB0cmVlLCBJIHdpbGwgbGV0
IHRoZQo+PiBSSVNDLVYgcGVvcGxlIGhhbmRsZSBhbnkgZGlzY3Vzc2lvbiBhYm91dCBtb3JlIG9w
dGlvbnMgdGhhdCBzaG91bGQgYmUKPj4gbWFkZSBtb2R1bGFyIGluc3RlYWQgb2YgYnVpbHRpbi4K
PiAKPiBJJ20gcHJldHR5IG11Y2ggYWdub3N0aWMgb24gdGhhdCBmcm9udCwgc28gSSdtIGNvb2wg
anVzdCBwaWNraW5nIHVwIHRoaXMuwqAgSSd2ZQo+IGdvdCBqdXN0IHBhdGNoIDUgaW4gbXkgcXVl
dWUgZm9yIHRlc3RpbmcsIHRoZXJlJ3MgYSBmZXcgb3RoZXIgdGhpbmdzIGluIGZyb250IG9mCj4g
aXQgYnV0IGl0IHNob3VsZCBzaG93IHVwIG9uIGZvci1uZXh0IHNvb24uCgpEb2VzIGl0IG1ha2Ug
c2Vuc2UgdG8gbWVyZ2UgdGhpcywgY29uc2lkZXJpbmcgUlovRml2ZSBzdXBwb3J0IGRlcGVuZHMg
b24KTk9OUE9SVEFCTEUsIGFuZCB0aGVyZWZvcmUgY2Fubm90IGJlIGVuYWJsZWQgaW4gZGVmY29u
ZmlnIGFueXdheT8KClJlZ2FyZHMsClNhbXVlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
