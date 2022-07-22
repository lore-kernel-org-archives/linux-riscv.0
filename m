Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7E2C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 08:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N5jLedZPTIUlBR4SRUaWX54cntk9GStyq+7uDw6LWCc=; b=qk53/lJsdVcaEl
	zTz6iDsvNJKvoroBLFn1S03wt8Q8u0rFm2OYDdxGMbJ7Yj7smtIdd8INYxLV9AHQalQOaMSPI4Osh
	nXb+YOUQtCN3/XRMHjCO/P9/TJzChDOj9dtEA7lo6YUWI8kPNPCPMvj4kVTa+7rkmPdYOmM0mChQc
	V1tnY3vlH4LDffsegdq6yWf8rPnDxmLjbwoETyl7hVHmIWZMwc53s7/CHxjp2W10nfBkH0BV682Vz
	OzdtrOn/KC3jMOLcT2eUn4CSCRwyZkzwRxPGBd1s5Pe7sbNtx205ADr5Q/8lioQwC+aIWZCcTUsSI
	NkGiWBeKOs2VMBaeObgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEndk-000qzy-Uo; Fri, 22 Jul 2022 08:04:04 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEndg-000qul-SO
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 08:04:03 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EC1323F12D
	for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 08:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1658477031;
	bh=Djzg8Rc7fhB8CahLsgla9ESBnmAj4BWal3tnU/pT7yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=mhOE1AfSZJe/vfNH6bh89AUUiSEUO34NtCQQpKEXLF9JWVq53QUVb8SGtGx3knv+n
	 7oLxwwuj8lN+K0Ko6EewdTFPgYukh0ml3yQsRHKzLKOS8jjymItBvJKqsIpY6njZVy
	 Kb1wAQQNiegz5k+ORetxXkAedgTo+CSwnDS8csClBtQ6FQrE/rBV8vziBlI/Cfl4D/
	 HbNAnloujE3I7AyiPXj2Ljf5+6xc0EApKcq9AZZlo+SCdqRyMbOHCbSpgrkrjjPf7X
	 6o3oZ09QvhU393tFQyao4VsDhzhBxj/Wq1qzrEySfirnhuBp+RpB94WfZEvC5YitdH
	 45I1gP0+ZlVGQ==
Received: by mail-wm1-f70.google.com with SMTP id c62-20020a1c3541000000b003a30d86cb2dso4038026wma.5
        for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 01:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Djzg8Rc7fhB8CahLsgla9ESBnmAj4BWal3tnU/pT7yo=;
        b=M12B7sreF42M/zgSDBJbujFLC8ntSBVv6ImS1TmgBmj3bK3I6hoGW2C0PNeZSkUyjm
         SwvqTFfyXj7YNV20darPyn3Wj1teD5WQ0g/IMMbo8Vr04tqLQFiFP7lyAFDvLdtxF9Kg
         X5kxH3kLNPAhXTDxwcl3wJ+a4EzAKAdwm5dQT41b2W263CXU/9Q2gikjO+YXFqucjPih
         TJPaz2rc6I2l5/+JDbHCVaGGdvniE5P7vZMoHfay5eRamueNlDaQllFLI2E9E9F8Uku0
         4z6F76xwW9QRPHZsqygQjXbaDAJQAm+aOGlWKAiS6fdgK/OPB6RTGcdcgyW6mLH82pAC
         UYcA==
X-Gm-Message-State: AJIora9dKVLfm2x4FL1ccBdUxLM3YNIMejY7Tf49nZCNEFl9r1OCCw8f
	pIIuByjo/HQ2YV7eKVKzVU5TnfkZvJ2l3hwHVTiF2UGr+XXWgzuvZjn6fD73amgfItoZyUPotfq
	WMLsYkM+zk7Lbxp8YVHuR6Kjl1D/eFMDk2rKkXchL9TLCbA==
X-Received: by 2002:adf:d1c9:0:b0:20f:c3dc:e980 with SMTP id b9-20020adfd1c9000000b0020fc3dce980mr1546711wrd.552.1658477028876;
        Fri, 22 Jul 2022 01:03:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tA1jTiBrAxpC6qHHHD0NVIYpjlM4n6oaJb5EQyYxOibHW6WDgLQ9M4YVcHjnzYvweMnZI90w==
X-Received: by 2002:adf:d1c9:0:b0:20f:c3dc:e980 with SMTP id b9-20020adfd1c9000000b0020fc3dce980mr1546686wrd.552.1658477028567;
        Fri, 22 Jul 2022 01:03:48 -0700 (PDT)
Received: from [192.168.123.67] (ip-062-143-094-109.um16.pools.vodafone-ip.de. [62.143.94.109])
        by smtp.gmail.com with ESMTPSA id j13-20020a5d448d000000b002167efdd549sm3836255wrq.38.2022.07.22.01.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 01:03:48 -0700 (PDT)
Message-ID: <e485aa49-57e3-25d7-6ac8-0eed50e0d48d@canonical.com>
Date: Fri, 22 Jul 2022 10:03:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.1
Subject: Re: [PATCH 1/1] riscv: enable Docker requirements in defconfig
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>,
 guoren@kernel.org, mchitale@ventanamicro.com, arnaud.pouliquen@foss.st.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mhng-679f197d-77a0-4dc5-9523-f7b88a22b30b@palmer-mbp2014>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <mhng-679f197d-77a0-4dc5-9523-f7b88a22b30b@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_010401_098725_6B404579 
X-CRM114-Status: GOOD (  25.91  )
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

T24gNy8yMi8yMiAwNzowNiwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gVHVlLCAwNyBKdW4g
MjAyMiAxNzowMjo1MSBQRFQgKC0wNzAwKSwgCj4gaGVpbnJpY2guc2NodWNoYXJkdEBjYW5vbmlj
YWwuY29tIHdyb3RlOgo+PiBUaGUgZGVmY29uZmlnIGtlcm5lbCBzaG91bGQgYmUgYWJsZSB0byBy
dW4gRG9ja2VyLgo+Pgo+PiBFbmFibGUgdGhlIG1pc3Npbmcgc2V0dGluZ3MgYWNjb3JkaW5nIHRv
IFsxXS4KPj4gbWFrZSBzYXZlZGVmY29uZmlnIGVsaW1pbmF0ZXMgQ09ORklHX1NUQUNLVFJBQ0UK
Pj4gd2hpY2ggaXMgZW5hYmxlZCBieSBkZWZhdWx0Lgo+Pgo+PiBNYW55IG9mIHRoZSBzZXR0aW5n
cyBhcmUgYWxzbyBuZWVkZWQgdG8gcnVuIGEgZGVmY29uZmlnIGtlcm5lbAo+PiBvbiBkZWZhdWx0
IGRpc3RybyBpbnN0YWxsYXRpb25zIG9yIHRvIHJ1biBzbmFwcy4KPj4KPj4gWzFdIGh0dHBzOi8v
Z2l0aHViLmNvbS9tb2J5L21vYnkvYmxvYi9tYXN0ZXIvY29udHJpYi9jaGVjay1jb25maWcuc2gK
Pj4KPj4gU2lnbmVkLW9mZi1ieTogSGVpbnJpY2ggU2NodWNoYXJkdCA8aGVpbnJpY2guc2NodWNo
YXJkdEBjYW5vbmljYWwuY29tPgo+PiAtLS0KPj4gQ2YuIFtQQVRDSF0gYXJtNjQ6IEVuYWJsZSBk
b2NrZXIgc3VwcG9ydCBpbiBkZWZjb25maWcKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC8yMDIyMDYwNjE0MDEwMy4zMjc3OS0xLXZpbmNlbnpvLmZyYXNjaW5vQGFybS5jb20vCj4+IC0t
LQo+PiDCoGFyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcgfCA2NSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0KPj4gwqAxIGZpbGUgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9jb25maWdzL2Rl
ZmNvbmZpZyBiL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcKPj4gaW5kZXggMGNjMTdkYjhh
YWJhLi5kNGZmZmNkM2NjMDUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvY29uZmlncy9kZWZj
b25maWcKPj4gKysrIGIvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwo+PiBAQCAtNiw4ICs2
LDE4IEBAIENPTkZJR19CUEZfU1lTQ0FMTD15Cj4+IMKgQ09ORklHX0lLQ09ORklHPXkKPj4gwqBD
T05GSUdfSUtDT05GSUdfUFJPQz15Cj4+IMKgQ09ORklHX0NHUk9VUFM9eQo+PiArQ09ORklHX01F
TUNHPXkKPj4gK0NPTkZJR19CTEtfQ0dST1VQPXkKPj4gwqBDT05GSUdfQ0dST1VQX1NDSEVEPXkK
Pj4gwqBDT05GSUdfQ0ZTX0JBTkRXSURUSD15Cj4+ICtDT05GSUdfUlRfR1JPVVBfU0NIRUQ9eQo+
PiArQ09ORklHX0NHUk9VUF9QSURTPXkKPj4gK0NPTkZJR19DR1JPVVBfRlJFRVpFUj15Cj4+ICtD
T05GSUdfQ0dST1VQX0hVR0VUTEI9eQo+PiArQ09ORklHX0NQVVNFVFM9eQo+PiArQ09ORklHX0NH
Uk9VUF9ERVZJQ0U9eQo+PiArQ09ORklHX0NHUk9VUF9DUFVBQ0NUPXkKPj4gK0NPTkZJR19DR1JP
VVBfUEVSRj15Cj4+IMKgQ09ORklHX0NHUk9VUF9CUEY9eQo+PiDCoENPTkZJR19OQU1FU1BBQ0VT
PXkKPj4gwqBDT05GSUdfVVNFUl9OUz15Cj4+IEBAIC0yOCw5ICszOCwxMSBAQCBDT05GSUdfS1ZN
PW0KPj4gwqBDT05GSUdfSlVNUF9MQUJFTD15Cj4+IMKgQ09ORklHX01PRFVMRVM9eQo+PiDCoENP
TkZJR19NT0RVTEVfVU5MT0FEPXkKPj4gK0NPTkZJR19CTEtfREVWX1RIUk9UVExJTkc9eQo+PiDC
oENPTkZJR19ORVQ9eQo+PiDCoENPTkZJR19QQUNLRVQ9eQo+PiDCoENPTkZJR19VTklYPXkKPj4g
K0NPTkZJR19YRlJNX1VTRVI9bQo+PiDCoENPTkZJR19JTkVUPXkKPj4gwqBDT05GSUdfSVBfTVVM
VElDQVNUPXkKPj4gwqBDT05GSUdfSVBfQURWQU5DRURfUk9VVEVSPXkKPj4gQEAgLTM4LDcgKzUw
LDQzIEBAIENPTkZJR19JUF9QTlA9eQo+PiDCoENPTkZJR19JUF9QTlBfREhDUD15Cj4+IMKgQ09O
RklHX0lQX1BOUF9CT09UUD15Cj4+IMKgQ09ORklHX0lQX1BOUF9SQVJQPXkKPj4gK0NPTkZJR19J
TkVUX0VTUD1tCj4+ICtDT05GSUdfTkVURklMVEVSPXkKPj4gK0NPTkZJR19CUklER0VfTkVURklM
VEVSPW0KPj4gK0NPTkZJR19ORl9DT05OVFJBQ0s9bQo+PiArQ09ORklHX05GX0NPTk5UUkFDS19G
VFA9bQo+PiArQ09ORklHX05GX0NPTk5UUkFDS19URlRQPW0KPj4gK0NPTkZJR19ORVRGSUxURVJf
WFRfTUFSSz1tCj4+ICtDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0FERFJUWVBFPW0KPj4gK0NP
TkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfQ09OTlRSQUNLPW0KPj4gK0NPTkZJR19ORVRGSUxURVJf
WFRfTUFUQ0hfSVBWUz1tCj4+ICtDT05GSUdfSVBfVlM9bQo+PiArQ09ORklHX0lQX1ZTX1BST1RP
X1RDUD15Cj4+ICtDT05GSUdfSVBfVlNfUFJPVE9fVURQPXkKPj4gK0NPTkZJR19JUF9WU19SUj1t
Cj4+ICtDT05GSUdfSVBfVlNfTkZDVD15Cj4+ICtDT05GSUdfTkZfTE9HX0FSUD1tCj4+ICtDT05G
SUdfTkZfTE9HX0lQVjQ9bQo+PiArQ09ORklHX0lQX05GX0lQVEFCTEVTPW0KPj4gK0NPTkZJR19J
UF9ORl9GSUxURVI9bQo+PiArQ09ORklHX0lQX05GX1RBUkdFVF9SRUpFQ1Q9bQo+PiArQ09ORklH
X0lQX05GX05BVD1tCj4+ICtDT05GSUdfSVBfTkZfVEFSR0VUX01BU1FVRVJBREU9bQo+PiArQ09O
RklHX0lQX05GX1RBUkdFVF9SRURJUkVDVD1tCj4+ICtDT05GSUdfSVBfTkZfTUFOR0xFPW0KPj4g
K0NPTkZJR19ORl9MT0dfSVBWNj1tCj4+ICtDT05GSUdfSVA2X05GX0lQVEFCTEVTPW0KPj4gK0NP
TkZJR19JUDZfTkZfTUFUQ0hfSVBWNkhFQURFUj1tCj4+ICtDT05GSUdfSVA2X05GX0ZJTFRFUj1t
Cj4+ICtDT05GSUdfSVA2X05GX1RBUkdFVF9SRUpFQ1Q9bQo+PiArQ09ORklHX0lQNl9ORl9NQU5H
TEU9bQo+PiArQ09ORklHX0JSSURHRT1tCj4+ICtDT05GSUdfQlJJREdFX1ZMQU5fRklMVEVSSU5H
PXkKPj4gK0NPTkZJR19WTEFOXzgwMjFRPW0KPj4gK0NPTkZJR19ORVRfU0NIRUQ9eQo+PiArQ09O
RklHX05FVF9DTFNfQ0dST1VQPW0KPj4gwqBDT05GSUdfTkVUTElOS19ESUFHPXkKPj4gK0NPTkZJ
R19DR1JPVVBfTkVUX1BSSU89eQo+PiDCoENPTkZJR19ORVRfOVA9eQo+PiDCoENPTkZJR19ORVRf
OVBfVklSVElPPXkKPj4gwqBDT05GSUdfUENJPXkKPj4gQEAgLTU3LDcgKzEwNSwxNSBAQCBDT05G
SUdfU0NTSV9WSVJUSU89eQo+PiDCoENPTkZJR19BVEE9eQo+PiDCoENPTkZJR19TQVRBX0FIQ0k9
eQo+PiDCoENPTkZJR19TQVRBX0FIQ0lfUExBVEZPUk09eQo+PiArQ09ORklHX01EPXkKPj4gK0NP
TkZJR19CTEtfREVWX0RNPW0KPj4gK0NPTkZJR19ETV9USElOX1BST1ZJU0lPTklORz1tCj4+IMKg
Q09ORklHX05FVERFVklDRVM9eQo+PiArQ09ORklHX0RVTU1ZPW0KPj4gK0NPTkZJR19NQUNWTEFO
PW0KPj4gK0NPTkZJR19JUFZMQU49bQo+PiArQ09ORklHX1ZYTEFOPW0KPj4gK0NPTkZJR19WRVRI
PW0KPj4gwqBDT05GSUdfVklSVElPX05FVD15Cj4+IMKgQ09ORklHX01BQ0I9eQo+PiDCoENPTkZJ
R19FMTAwMEU9eQo+PiBAQCAtMTA1LDcgKzE2MSwxMSBAQCBDT05GSUdfUlBNU0dfQ1RSTD15Cj4+
IMKgQ09ORklHX1JQTVNHX1ZJUlRJTz15Cj4+IMKgQ09ORklHX0VYVDRfRlM9eQo+PiDCoENPTkZJ
R19FWFQ0X0ZTX1BPU0lYX0FDTD15Cj4+ICtDT05GSUdfRVhUNF9GU19TRUNVUklUWT15Cj4+ICtD
T05GSUdfQlRSRlNfRlM9bQo+PiArQ09ORklHX0JUUkZTX0ZTX1BPU0lYX0FDTD15Cj4+IMKgQ09O
RklHX0FVVE9GUzRfRlM9eQo+PiArQ09ORklHX09WRVJMQVlfRlM9bQo+PiDCoENPTkZJR19NU0RP
U19GUz15Cj4+IMKgQ09ORklHX1ZGQVRfRlM9eQo+PiDCoENPTkZJR19UTVBGUz15Cj4+IEBAIC0x
MTksNiArMTc5LDEwIEBAIENPTkZJR19ST09UX05GUz15Cj4+IMKgQ09ORklHXzlQX0ZTPXkKPj4g
wqBDT05GSUdfTkxTX0NPREVQQUdFXzQzNz15Cj4+IMKgQ09ORklHX05MU19JU084ODU5XzE9bQo+
PiArQ09ORklHX1NFQ1VSSVRZPXkKPj4gK0NPTkZJR19TRUNVUklUWV9TRUxJTlVYPXkKPj4gK0NP
TkZJR19TRUNVUklUWV9BUFBBUk1PUj15Cj4+ICtDT05GSUdfREVGQVVMVF9TRUNVUklUWV9EQUM9
eQo+PiDCoENPTkZJR19DUllQVE9fVVNFUl9BUElfSEFTSD15Cj4+IMKgQ09ORklHX0NSWVBUT19E
RVZfVklSVElPPXkKPj4gwqBDT05GSUdfUFJJTlRLX1RJTUU9eQo+PiBAQCAtMTM3LDcgKzIwMSw2
IEBAIENPTkZJR19ERUJVR19TUElOTE9DSz15Cj4+IMKgQ09ORklHX0RFQlVHX01VVEVYRVM9eQo+
PiDCoENPTkZJR19ERUJVR19SV1NFTVM9eQo+PiDCoENPTkZJR19ERUJVR19BVE9NSUNfU0xFRVA9
eQo+PiAtQ09ORklHX1NUQUNLVFJBQ0U9eQo+PiDCoENPTkZJR19ERUJVR19MSVNUPXkKPj4gwqBD
T05GSUdfREVCVUdfUExJU1Q9eQo+PiDCoENPTkZJR19ERUJVR19TRz15Cj4gCj4gU29ycnkgZm9y
IGJlaW5nIHNvIHNsb3cgaGVyZS7CoCBJIGRvbid0IGhhdmUgYW55IGlzc3VlcyB3aXRoIHRoaXMg
YXMgYSAKPiBjb25jZXB0LCBidXQgaXQgbWFrZXMgYSBoYW5kZnVsIG9mIG15IHRlc3QgY29uZmln
cyBwYW5pYyBvbiBib290LsKgIFNlZW1zIAo+IGxpa2Ugc29tZXRoaW5nIGlzIHRyaXBwaW5nIHVw
IGEga2FzYW4gZmFpbHVyZS7CoCBJIGd1ZXNzIGl0J3Mga2luZCBvZiAKCkhlbGxvIFBhbG1lciwK
CnRoYW5rcyBmb3Igc2hhcmluZyB5b3VyIHRlc3QgZXhwZXJpZW5jZS4gQ291bGQgeW91LCBwbGVh
c2UsIHByb3ZpZGUgdGhlIApjb25maWcgZmlsZSBhbmQgdGhlIHRlc3QgY29uZmlndXJhdGlvbiB0
aGF0IGxlYWRzIHRoZSByZWdyZXNzaW9uLgoKPiBhcmJpdHJhcnkgdG8gY2FsbCB0aGF0IGEgcmVn
cmVzc2lvbiwgYXMgSSdtIHN1cmUgaXQncyBqdXN0IHVuY292ZXJpbmcgCj4gc29tZSBpc3N1ZSB0
aGF0IGFscmVhZHkgZXhpc3RzLCBidXQgdHVybmluZyBzb21ldGhpbmcgb24gaW4gZGVmY29uZmln
IAo+IHRoYXQgcGFuaWNzIHdpdGgga2FzYW4gaXMgZ29pbmcgdG8gaGF2ZSBhIGJ1bmNoIG9mIGZh
bGxvdXQuCj4gCj4gSXQgbG9va3MgbGlrZSBCTEtfQ0dST1VQIGlzIHRoZSBwcm9ibGVtIGhlcmUs
IHNvIGlmIHlvdSdyZSBPSyB3aXRoIGl0IAo+IHRoZW4gSSdtIGhhcHB5IHRvIHRha2UgdGhlIHJl
c3Qgb2YgdGhlc2UuwqAgSSBwdXQgdGhhdCBvdmVyIGF0IAo+IGtlcm5lbC5vcmcvcGFsbWVyL2xp
bnV4L3Jpc2N2LWRvY2tlcl9ub19ibGtfY2dyb3VwLCBpZiB0aGF0J3MgT0sgSSdsbCAKPiBjaGVy
cnktcGljayBpdCBvbnRvIGZvci1uZXh0LgoKSSBhbSBmaW5lIHdpdGggY2hlcnJ5IHBpY2tpbmcu
CgpCZXN0IHJlZ2FyZHMKCkhlaW5yaWNoCgo+IAo+IFRoZXJlJ3MgYWxtb3N0IGNlcnRhaW5seSBh
IGJ1ZyBoZXJlIHRoYXQgd2FycmFudHMgZml4aW5nLgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
