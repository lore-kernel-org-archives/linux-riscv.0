Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC30AC7618B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 18:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8MzlLkLR2hxUzQIlUSDhb6eYLdykl80rCSaMno8h5Ro=; b=s3k1SFNlfxtv1o
	zprUdrU46HkVzn5Ngs5ovSGNqMMqgTECRZ8ZnFyCqURhKM6C82iFyEHPILNgRIQRG4t/zEIVAcrN8
	/t9GOrohtH2GqFYPckDwC2xHIVxTUjMb4Xo9bQrMwmVpNwJPkoXDS9MGKKctdqREYgUaVsWxFOR+j
	tv0DN4dbQwgL0lkJMf3UpW0nw7g64t7OOA030MQX6YjOU53xl5etpyoKoKkhVGYrT1iNjxCtm+Joi
	ZzeJSPzOINzTB2L2AlS/lP70YJPSmsUB/OvWvoe68HwsJQV/G6j0pd6sotLrOvI+fuXj4I/3/oS3J
	vqR3UZeamv3X5rikjGKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc9Uw-00BD99-1M;
	Tue, 14 Mar 2023 18:35:46 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc9Ut-00BD8J-1q
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 18:35:45 +0000
Received: by mail-qv1-xf36.google.com with SMTP id m6so3716144qvq.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 11:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678818941;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbuPyTjtZPF7OPF+yupul5FSQrj+hiJD5YM/Xn3ImzE=;
        b=RhXHVmCaiwPLRccMA5hIGlVxa9xrFcBP/W4j+g6B7lQKIiSMJeIQMUMsrdsCFiGXVL
         jPEWHUg3G+TyVF3jVOa9Z9xOrfqFc5zUeoQZukyLCORApnxw4jkrbU2zR6tssx39t6Ft
         Q/tJfsPkxV7tUqpI/IishMbAE8v6uJHLHaEE4mGlSBKr3erzjy0pkl0m3cSmZ4WT0QSL
         QVKjAnASogXIDMbSfF5rf4xxJ5n1wE+SFmOWdzRxPtnOzLDrVPIum0N+2nxvDLDiA9kW
         +MrTaP/3CbntgijPGKYj5LdFlbRpkHqbuKelmdNr3Umlv5roRAkv9RK4OoeJH1Db29Bi
         I08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678818941;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbuPyTjtZPF7OPF+yupul5FSQrj+hiJD5YM/Xn3ImzE=;
        b=1YCygcqWawJ6hB4NNhfdXEgilJ1jLL4HtALFhdiU0UOnVuC81u8ZW4r6zTXC2JFYoF
         s9jUtA3wSebgogRj2qS8ECJz6/Lh5JD0lxbabQDhsSzXLMOXUjx2x8efnWbyA4GqEa6y
         O1seJ1xxtU6pL2o04gydB7pJk4BHrpzex/VreyRs4aEZY2j6vHQF6VhxsIXYaeLKUeOA
         C7hAVrvcDqc4bEkgtVSj/9orlbcKijX4S8+UzZFoStuxJ+IS79sLj4X1E4IO9gCtjwJc
         DcKX2B9Aau1QQYjAlNKXrYUW7Bklhx38peqq60nm08Af2Qals8L9p6WvOdG65WZCUlAd
         IDXA==
X-Gm-Message-State: AO0yUKUh9XLfh7QbMZ8n4VKxw+DHP6zYvPtSax43FXchKKp3W3p6MUId
	45EXCBhkuwAnOfGdTPZRcgc=
X-Google-Smtp-Source: AK7set/NLPJ+ot5pa30dDd81YJCU3glEFvfYtS+DdoKz2ryTYscpV5hTdalwhNuUEVW1QVtiGXqn6A==
X-Received: by 2002:a05:622a:390:b0:3af:b6bd:aba7 with SMTP id j16-20020a05622a039000b003afb6bdaba7mr59159758qtx.43.1678818940997;
        Tue, 14 Mar 2023 11:35:40 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id q9-20020a05620a024900b0071eddd3bebbsm2263112qkn.81.2023.03.14.11.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 11:35:40 -0700 (PDT)
Message-ID: <dd45cdec-55d2-1a46-520d-e1468597c18a@gmail.com>
Date: Tue, 14 Mar 2023 14:35:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/3] Add RISC-V 32 NOMMU support
Content-Language: en-US
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yimin Gu <ustcymgu@gmail.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Waldemar Brodkorb <wbx@openadk.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
 <42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org>
 <556ce787-80eb-dc48-f8d6-83e415538e36@opensource.wdc.com>
 <f8f291d9-2723-4ab8-3020-49018757d470@gmail.com>
 <62852ee1-3763-3323-c3a8-f1e84f70204a@infradead.org>
 <c7941231-8ebd-dea5-81f8-3180cfc3f286@gmail.com>
 <1d858dbb-ae85-95a0-3e46-b67017733c04@infradead.org>
 <db3b3412-9616-d13c-3374-48647325e057@infradead.org>
 <7280914e-59e3-ba6d-4324-a29c1c0b4ce8@gmail.com>
 <2ebe4bc5-c11c-89b1-2644-358dc12bdfa5@infradead.org>
 <d3fb242e-646e-50b5-7dba-17b228bb32aa@opensource.wdc.com>
 <416e27cd-0826-9bfa-8ee8-cf70dfb503c1@gmail.com>
 <debe0a4a-126f-2308-d40c-32ed2d9f91e3@opensource.wdc.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <debe0a4a-126f-2308-d40c-32ed2d9f91e3@opensource.wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_113543_653134_6CE6B1B9 
X-CRM114-Status: GOOD (  22.40  )
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

CgpPbiAzLzcvMjMgMjM6MTEsIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+IE9uIDMvOC8yMyAxMjo0
NiwgSmVzc2UgVGF1YmUgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDMvNy8yMyAyMjo0MiwgRGFtaWVuIExl
IE1vYWwgd3JvdGU6Cj4+PiBPbiAzLzgvMjMgMTI6MjMsIFJhbmR5IER1bmxhcCB3cm90ZToKPj4+
Pj4+IE9LLCBJIGRvbid0IGtub3cgaG93IGl0IGhhcHBlbmVkLiBJIGNhbm5vdCByZXByb2R1Y2Ug
aXQgbm93Lgo+Pj4+Pj4gVGhlIGZhaWxpbmcgLmNvbmZpZyBmaWxlcyBoYXMgQ09ORklHX01NVSBp
cyBub3Qgc2V0IChmb3IgUlYzMkkpLCB3aGljaAo+Pj4+Pj4gYXBwZWFycyB0byBiZSBpbXBvc3Np
YmxlLgo+Pj4+PiBUaGVzZSBwYXRjaGVzIGFkZCBgQ09ORklHX01NVSBpcyBub3Qgc2V0YCAoZm9y
IFJWMzJJKS4KPj4+Pj4gQnV0IG5vIHdvcnJpZXMgaXQgc2VlbXMgdG8gYmUgYSBub24gaXNzdWXC
oCBub3cuCj4+Pj4+Cj4+Pj4+IFlvdXIgdGhvdWdodHMgRGFtaWVuPwo+Pj4+Pgo+Pj4+Cj4+Pj4g
VGhhbmtzIGZvciByZW1pbmRpbmcgbWUuCj4+Pj4KPj4+PiBXaXRoIHRoZXNlIDMgcGF0Y2hlcyBh
cHBsaWVkIHRvIGxpbnV4LW5leHQtMjAyMzAzMDcsCj4+Pj4gSSBzdGlsbCBnZXQgdGhpcyBidWls
ZCBlcnJvci4KPj4+Cj4+PiBEb2VzIHRoaXMgaGVscCA/Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc29jL2NhbmFhbi9LY29uZmlnIGIvZHJpdmVycy9zb2MvY2FuYWFuL0tjb25maWcKPj4+
IGluZGV4IDI1MjdjZjU3NTdlYy4uNzc5NmM1ZjFkMTA5IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVy
cy9zb2MvY2FuYWFuL0tjb25maWcKPj4+ICsrKyBiL2RyaXZlcnMvc29jL2NhbmFhbi9LY29uZmln
Cj4+PiBAQCAtNCw3ICs0LDggQEAgY29uZmlnIFNPQ19LMjEwX1NZU0NUTAo+Pj4gICAgICAgICAg
IGJvb2wgIkNhbmFhbiBLZW5kcnl0ZSBLMjEwIFNvQyBzeXN0ZW0gY29udHJvbGxlciIKPj4+ICAg
ICAgICAgICBkZXBlbmRzIG9uIFJJU0NWICYmIFNPQ19DQU5BQU4gJiYgT0YKPj4+ICAgICAgICAg
ICBkZWZhdWx0IFNPQ19DQU5BQU4KPj4+IC0gICAgICAgIHNlbGVjdCBQTQo+Pj4gLSAgICAgICAg
c2VsZWN0IE1GRF9TWVNDT04KPj4+ICsgICAgICAgc2VsZWN0IENPTU1PTl9DTEtfSzIxMAoKT2sg
c28gdGhpcyBoYXMgbm90aGluZyB0byBkbyB3aXRoIG15IHBhdGNoLXNldCBhY3R1YWxseSBhbmQg
d2lsbCBoYXBwZW4gCm9uIDY0QklUIGFzIHdlbGwuCnRoZSBjb21taXQgdGhhdCBicm91Z2h0IGlu
IHRoaXMgYnVnIGlzOgoKUklTQy1WOiBzdG9wIGRpcmVjdGx5IHNlbGVjdGluZyBkcml2ZXJzIGZv
ciBTT0NfQ0FOQUFOIAozYWY1NzdmOTgyNmZkZGRlZmFjNDJiMzVmYzVlYjM5MTJjNWI3ZDg1CgpJ
IGhhdmUgdGVzdGVkIHRoZSBwYXRjaGVzIERhbWllbiBoZXJlIHRoZXkgd29yayBvbiA2NEJJVCBh
bmQgMzJCSVQuClRoZSBjaGFuZ2UgdG8gZHJpdmVycy9jbGsvS2NvbmZpZyBpcyBub3Qgc3RyaWN0
bHkgbmVjZXNzYXJ5IGJ1dCBtYWtlcyAKc2NlbmUuIEkgZG9uJ3QgdGhpbmsgdGhleSBuZWVkIHRv
IGJlIHRlc3RlZCBvbiAzMmJpdCBzbyB3ZSBjYW4gb21pdCAKQ09NUElMRV9URVNULgoKSWYgbmVl
ZGVkIGkgY2FuIHN1Ym1pdCB0aGUgcGF0Y2hlcywgd2hpY2ggSSB3aWxsIGF1dGhvciB1bmRlciBE
YW1pZW4uCgpBcyBmYXIgYXMgSSBjYW4gc2VlIHRoZXJlIGlzIG5vdGhpbmcgaG9sZGluZyBiYWNr
IHRoaXMgc2V0IGFzIHRoZSBpc3N1ZSAKZm91bmQgaGFzIG5vIHJlbGF0aW9uIHRvIHRoaXMgc2V0
LgoKVGhhbmtzLApKZXNzZSBUYXViZQoKPj4+ICsgICAgICAgc2VsZWN0IFBNCj4+PiArICAgICAg
IHNlbGVjdCBNRkRfU1lTQ09OCj4+PiAgICAgICAgICAgaGVscAo+Pj4gICAgICAgICAgICAgQ2Fu
YWFuIEtlbmRyeXRlIEsyMTAgU29DIHN5c3RlbSBjb250cm9sbGVyIGRyaXZlci4KPj4+Cj4+PiAo
anVzdCBub3RpY2VkIHRoYXQgdGhlcmUgYXJlIHdoaXRlc3BhY2UgZXJyb3JzIGhlcmUuLi4pCj4+
Pgo+Pj4gTm90ZSB0aGF0IGJvdGggdGhlIHN5c2N0bCBhbmQgY2xrIGRyaXZlciBkZXBlbmQgb24g
UklTQ1YuIEkgdGhpbmsgdGhlc2Ugc2hvdWxkCj4+PiBwcm9iYWJseSBhbHNvIGRlcGVuZCBvbiA2
NEJJVCwgYW5kIGV2ZW50dWFsbHkgYWRkIGEgInx8IENPTVBJTEVfVEVTVCIgYXMgd2VsbC4KPj4+
IFNvIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xr
L0tjb25maWcgYi9kcml2ZXJzL2Nsay9LY29uZmlnCj4+PiBpbmRleCBiNmM1YmY2OWEyYjIuLjY1
N2EzNmQyNjQwZCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvY2xrL0tjb25maWcKPj4+ICsrKyBi
L2RyaXZlcnMvY2xrL0tjb25maWcKPj4+IEBAIC00MzEsNyArNDMxLDcgQEAgY29uZmlnIENPTU1P
Tl9DTEtfRklYRURfTU1JTwo+Pj4KPj4+ICAgIGNvbmZpZyBDT01NT05fQ0xLX0syMTAKPj4+ICAg
ICAgICAgICBib29sICJDbG9jayBkcml2ZXIgZm9yIHRoZSBDYW5hYW4gS2VuZHJ5dGUgSzIxMCBT
b0MiCj4+PiAtICAgICAgIGRlcGVuZHMgb24gT0YgJiYgUklTQ1YgJiYgU09DX0NBTkFBTgo+Pj4g
KyAgICAgICBkZXBlbmRzIG9uIE9GICYmIFJJU0NWICYmIFNPQ19DQU5BQU4gJiYgKDY0QklUIHx8
IENPTVBJTEVfVEVTVCkKPj4+ICAgICAgICAgICBkZWZhdWx0IFNPQ19DQU5BQU4KPj4+ICAgICAg
ICAgICBoZWxwCj4+PiAgICAgICAgICAgICBTdXBwb3J0IGZvciB0aGUgQ2FuYWFuIEtlbmRyeXRl
IEsyMTAgUklTQy1WIFNvQyBjbG9ja3MuCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvY2Fu
YWFuL0tjb25maWcgYi9kcml2ZXJzL3NvYy9jYW5hYW4vS2NvbmZpZwo+Pj4gaW5kZXggMjUyN2Nm
NTc1N2VjLi4xNzQ1YTYxNGQyYTcgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3NvYy9jYW5hYW4v
S2NvbmZpZwo+Pj4gKysrIGIvZHJpdmVycy9zb2MvY2FuYWFuL0tjb25maWcKPj4+IEBAIC0yLDkg
KzIsMTAgQEAKPj4+Cj4+PiAgICBjb25maWcgU09DX0syMTBfU1lTQ1RMCj4+PiAgICAgICAgICAg
Ym9vbCAiQ2FuYWFuIEtlbmRyeXRlIEsyMTAgU29DIHN5c3RlbSBjb250cm9sbGVyIgo+Pj4gLSAg
ICAgICBkZXBlbmRzIG9uIFJJU0NWICYmIFNPQ19DQU5BQU4gJiYgT0YKPj4+ICsgICAgICAgZGVw
ZW5kcyBvbiBSSVNDViAmJiBTT0NfQ0FOQUFOICYmIE9GICYmICg2NEJJVCB8fCBDT01QSUxFX1RF
U1QpCj4+PiAgICAgICAgICAgZGVmYXVsdCBTT0NfQ0FOQUFOCj4+PiAtICAgICAgICBzZWxlY3Qg
UE0KPj4+IC0gICAgICAgIHNlbGVjdCBNRkRfU1lTQ09OCj4+PiArICAgICAgIHNlbGVjdCBDT01N
T05fQ0xLX0syMTAKPj4+ICsgICAgICAgc2VsZWN0IFBNCj4+PiArICAgICAgIHNlbGVjdCBNRkRf
U1lTQ09OCj4+PiAgICAgICAgICAgaGVscAo+Pj4gICAgICAgICAgICAgQ2FuYWFuIEtlbmRyeXRl
IEsyMTAgU29DIHN5c3RlbSBjb250cm9sbGVyIGRyaXZlci4KPj4+Cj4+PiBDT01QSUxFX1RFU1Qg
aXMgb3B0aW9uYWwgdGhvdWdoLCBidXQgSSBkbyBub3Qgc2VlIGFueSByZWFzb24gd2h5IG5vdCBl
dmVudGhvdWdoCj4+PiBpbiBwcmFjdGljZSB0aGVzZSBkcml2ZXJzIHdpbGwgbGlrZWx5IG5ldmVy
IGVuZCB1cCBpbiAzMi1iaXRzIFNvQy4KPj4+Cj4+Pgo+Pgo+PiBPaCB0aGFua3MgSSB3YXMgaW4g
dGhlIGluIHRoZSBtaWRzdCBvZiBtYWtpbmcgYSBzaW1pbGFyIHBhdGNoLgo+PiBEbyB5b3Ugd2Fu
dCB0byBzdWJtaXQgaXQgb3Igc2hhbGwgSS4gQWxzbyB0aGFua3MgZm9yIHRoZSBoZWxwIHdpdGgg
dGhpcywKPj4gd2FzIHVzaW5nIHRhZyA2LjIuCj4gCj4gSSBhbSBidXN5IHdpdGggb3RoZXIgc3R1
ZmYgYW5kIGRvIG5vdCBoYXZlIHRpbWUgdG8gcHJvcGVybHkgdGVzdCB0aGlzLiBTbyBwbGVhc2UK
PiBmZWVsIGZyZWUgdG8gZ28gYWhlYWQgYW5kIHNlbmQgc29tZXRoaW5nIGZ1bGx5IHRlc3RlZC4K
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
