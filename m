Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32EDC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 21:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rcgo/JI0obmTM8YXZohYTwei2UJGJe9AxfgmYGWh14=; b=vyPjR7MncpmIGD
	d/9tLe+wH102kULNdkfzit6VMCoh/RfLhxTVOyBCjwVCBLB9jCDPQ4f+EnWhWBlIdXrKgpOU9ujkT
	xF6GjFhzDSFO5eb9PK6GrLLE6L2Q3j08BOpqjixoOupeP7O3P2cQFhCVgMNb2djLNoMM635NrlCoi
	WyP90jlwpDaaC03uJh9Da2OEWtl2P/1d7h94H3fIXEI82h/1BJwUPnWRZwDVYvbKmznSS/YcmldD9
	oDN6GPV05t+ByeS8/KAy2CyWnEd/NNtih2Z2GUwezvj9K4CGYK9qC8t3P6jVnptj7soRdc2nRwOE9
	zFABH4eenXPXUP7QJkLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBi60-00GZhI-0q;
	Fri, 08 Dec 2023 21:09:16 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBi5x-00GZgj-2b
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 21:09:15 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50be03cc8a3so3267817e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 13:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1702069752; x=1702674552; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRoW6U9K3GCzkZrINWjqMXbujMWIBb9ikA18zBPjrTw=;
        b=nSMPrIx/WhPvOmpBX8amlW8Vk/ozWBBoz9fQoZw/FmE1fta3FpdM1RHewtOqRAKiG2
         /L0HxXyd9Y63SVS3HdKzc0woG1jTXRShx0LjSGfxzPAfxe5nZ+gf0cEWtuxVRJISgKJC
         ynhXT7IAjLGbbIOGDq+fiWC0lUZs7QLZgAyvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702069752; x=1702674552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRoW6U9K3GCzkZrINWjqMXbujMWIBb9ikA18zBPjrTw=;
        b=wpac2SqwHrKnIVHrkorPt9NiPgVAvuqoViEh5ua4iCd9HNdhujRyToDuKTr9jXIMd5
         0rs2OVh7sXRhqR3O1bS9Doud44g9VW9OwQ8T84hDamX8VBL7Xzqf+bCqNCiwfBnLTLmP
         N6OJ67daBsPCAtS9xwMq2Q3nYHUlM06jU6dqWJspcZNAlhgq+hbCoHgQphpu0M0gs5Sg
         errKk7RjOrPzK87/KNX+CUbw9fiyXTxt7WhIdv6x0K6OvIPaFRRTenyZseqQpuAruVNM
         qBVDsvvJaUfpi3w2b/oGh65HuIQ0Se84jfvzDhwT+rTM4kfcEoLRDsSiSF8+AFKkitCz
         fx+w==
X-Gm-Message-State: AOJu0Yx3chQQImUxLcmC7ndqzGWnrCjyJBQs6qJwUkMij/QeHGNkmD/g
	YxZOLymxYl5fpyec4Bwsv3DDkGXc4zUPdTubpKmI
X-Google-Smtp-Source: AGHT+IHMZ7K62AJlySjlMPFIy8zeLAvEkBfdRUPwKwJVobEe9JC/Pf51mYdPvPNOjhtwev3xItUazqZOTc2y/aMTQfc=
X-Received: by 2002:a05:6512:484b:b0:50b:e65e:9511 with SMTP id
 ep11-20020a056512484b00b0050be65e9511mr238815lfb.71.1702069751158; Fri, 08
 Dec 2023 13:09:11 -0800 (PST)
MIME-Version: 1.0
References: <20231205092555.35617-1-vadim.shakirov@syntacore.com>
In-Reply-To: <20231205092555.35617-1-vadim.shakirov@syntacore.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 8 Dec 2023 13:09:00 -0800
Message-ID: <CAOnJCUL-tCn+KNyczz6aXNbgOb1RYeYk45i0rjy0h=rYtcMbAw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drivers: perf: ctr_get_width function for legacy is
 not defined
To: Vadim Shakirov <vadim.shakirov@syntacore.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_130913_851983_3BC51D6F 
X-CRM114-Status: GOOD (  23.41  )
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

T24gVHVlLCBEZWMgNSwgMjAyMyBhdCAxOjI24oCvQU0gVmFkaW0gU2hha2lyb3YKPHZhZGltLnNo
YWtpcm92QHN5bnRhY29yZS5jb20+IHdyb3RlOgo+Cj4gV2l0aCBwYXJhbWV0ZXJzIENPTkZJR19S
SVNDVl9QTVVfTEVHQUNZPXkgYW5kIENPTkZJR19SSVNDVl9QTVVfU0JJPW4KPiBsaW51eCBrZXJu
ZWwgY3Jhc2hlcyB3aGVuIHlvdSB0cnkgcGVyZiByZWNvcmQ6Cj4KPiAkIHBlcmYgcmVjb3JkIGxz
Cj4gWyAgIDQ2Ljc0OTI4Nl0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRl
cmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDAwMDAwMDAwMDAwCj4gWyAgIDQ2Ljc1
MDE5OV0gT29wcyBbIzFdCj4gWyAgIDQ2Ljc1MDM0Ml0gTW9kdWxlcyBsaW5rZWQgaW46Cj4gWyAg
IDQ2Ljc1MDYwOF0gQ1BVOiAwIFBJRDogMTA3IENvbW06IHBlcmYtZXhlYyBOb3QgdGFpbnRlZCA2
LjYuMCAjMgo+IFsgICA0Ni43NTA5MDZdIEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11
IChEVCkKPiBbICAgNDYuNzUxMTg0XSBlcGMgOiAweDAKPiBbICAgNDYuNzUxNDMwXSAgcmEgOiBh
cmNoX3BlcmZfdXBkYXRlX3VzZXJwYWdlKzB4NTQvMHgxM2UKPiBbICAgNDYuNzUxNjgwXSBlcGMg
OiAwMDAwMDAwMDAwMDAwMDAwIHJhIDogZmZmZmZmZmY4MDcyZWU1MiBzcCA6IGZmMjAwMDAwMDAy
MmI4ZjAKPiBbICAgNDYuNzUxOTU4XSAgZ3AgOiBmZmZmZmZmZjgxNTA1OTg4IHRwIDogZmY2MDAw
MDAwMjkwZDQwMCB0MCA6IGZmMjAwMDAwMDAyMmI5YzAKPiBbICAgNDYuNzUyMjI5XSAgdDEgOiAw
MDAwMDAwMDAwMDAwMDAxIHQyIDogMDAwMDAwMDAwMDAwMDAwMyBzMCA6IGZmMjAwMDAwMDAyMmI5
MzAKPiBbICAgNDYuNzUyNDUxXSAgczEgOiBmZjYwMDAwMDAyOGZiMDAwIGEwIDogMDAwMDAwMDAw
MDAwMDAwMCBhMSA6IGZmNjAwMDAwMDI4ZmIwMDAKPiBbICAgNDYuNzUyNjczXSAgYTIgOiAwMDAw
MDAwYWUyNzUxMjY4IGEzIDogMDAwMDAwMDAwMDRmYjcwOCBhNCA6IDAwMDAwMDAwMDAwMDAwMDQK
PiBbICAgNDYuNzUyODk1XSAgYTUgOiAwMDAwMDAwMDAwMDAwMDAwIGE2IDogMDAwMDAwMDAwMDE3
ZmZlMyBhNyA6IDAwMDAwMDAwMDAwMDAwZDIKPiBbICAgNDYuNzUzMTE3XSAgczIgOiBmZjYwMDAw
MDAyOGZiMDAwIHMzIDogMDAwMDAwMGFlMjc1MTI2OCBzNCA6IDAwMDAwMDAwMDAwMDAwMDAKPiBb
ICAgNDYuNzUzMzM4XSAgczUgOiBmZmZmZmZmZjgxNTNlMjkwIHM2IDogZmY2MDAwMDA4NjNiOTAw
MCBzNyA6IGZmNjAwMDAwMDI5NjEwNzgKPiBbICAgNDYuNzUzNTYyXSAgczggOiBmZjYwMDAwMDAy
OTYxMDQ4IHM5IDogZmY2MDAwMDAwMjk2MTA1OCBzMTA6IDAwMDAwMDAwMDAwMDAwMDEKPiBbICAg
NDYuNzUzNzgzXSAgczExOiAwMDAwMDAwMDAwMDAwMDE4IHQzIDogZmZmZmZmZmZmZmZmZmZmZiB0
NCA6IGZmZmZmZmZmZmZmZmZmZmYKPiBbICAgNDYuNzU0MDA1XSAgdDUgOiBmZjYwMDAwMDAyOTIy
NzBjIHQ2IDogZmYyMDAwMDAwMDIyYmIzMAo+IFsgICA0Ni43NTQxNzldIHN0YXR1czogMDAwMDAw
MDIwMDAwMDEwMCBiYWRhZGRyOiAwMDAwMDAwMDAwMDAwMDAwIGNhdXNlOiAwMDAwMDAwMDAwMDAw
MDBjCj4gWyAgIDQ2Ljc1NDY1M10gQ29kZTogVW5hYmxlIHRvIGFjY2VzcyBpbnN0cnVjdGlvbiBh
dCAweGZmZmZmZmZmZmZmZmZmZWMuCj4gWyAgIDQ2Ljc1NDkzOV0gLS0tWyBlbmQgdHJhY2UgMDAw
MDAwMDAwMDAwMDAwMCBdLS0tCj4gWyAgIDQ2Ljc1NTEzMV0gbm90ZTogcGVyZi1leGVjWzEwN10g
ZXhpdGVkIHdpdGggaXJxcyBkaXNhYmxlZAo+IFsgICA0Ni43NTU1NDZdIG5vdGU6IHBlcmYtZXhl
Y1sxMDddIGV4aXRlZCB3aXRoIHByZWVtcHRfY291bnQgNAo+Cj4gVGhpcyBoYXBwZW5zIGJlY2F1
c2UgaW4gdGhlIGxlZ2FjeSBjYXNlIHRoZSBjdHJfZ2V0X3dpZHRoIGZ1bmN0aW9uIHdhcyBub3QK
PiBkZWZpbmVkLCBidXQgaXQgaXMgdXNlZCBpbiBhcmNoX3BlcmZfdXBkYXRlX3VzZXJwYWdlLgo+
Cj4gQWxzbyByZW1vdmUgZXh0cmEgY2hlY2sgaW4gcmlzY3ZfcG11X2N0cl9nZXRfd2lkdGhfbWFz
awo+Cj4gRml4ZXM6IGNjNGMwN2M4OWFhZCAoImRyaXZlcnM6IHBlcmY6IEltcGxlbWVudCBwZXJm
IGV2ZW50IG1tYXAgc3VwcG9ydCBpbiB0aGUgU0JJIGJhY2tlbmQiKQo+IFNpZ25lZC1vZmYtYnk6
IFZhZGltIFNoYWtpcm92IDx2YWRpbS5zaGFraXJvdkBzeW50YWNvcmUuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL3BlcmYvcmlzY3ZfcG11LmMgICAgICAgIHwgMTggKysrKystLS0tLS0tLS0tLS0tCj4g
IGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfbGVnYWN5LmMgfCAgOCArKysrKysrLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXUuYyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXUuYwo+
IGluZGV4IDBkZGE3MGUxZWY5MC4uYzc4YTZmZDZjNTdmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
cGVyZi9yaXNjdl9wbXUuYwo+ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXUuYwo+IEBAIC0x
NTAsMTkgKzE1MCwxMSBAQCB1NjQgcmlzY3ZfcG11X2N0cl9nZXRfd2lkdGhfbWFzayhzdHJ1Y3Qg
cGVyZl9ldmVudCAqZXZlbnQpCj4gICAgICAgICBzdHJ1Y3QgcmlzY3ZfcG11ICpydnBtdSA9IHRv
X3Jpc2N2X3BtdShldmVudC0+cG11KTsKPiAgICAgICAgIHN0cnVjdCBod19wZXJmX2V2ZW50ICpo
d2MgPSAmZXZlbnQtPmh3Owo+Cj4gLSAgICAgICBpZiAoIXJ2cG11LT5jdHJfZ2V0X3dpZHRoKQo+
IC0gICAgICAgLyoqCj4gLSAgICAgICAgKiBJZiB0aGUgcG11IGRyaXZlciBkb2Vzbid0IHN1cHBv
cnQgY291bnRlciB3aWR0aCwgc2V0IGl0IHRvIGRlZmF1bHQKPiAtICAgICAgICAqIG1heGltdW0g
YWxsb3dlZCBieSB0aGUgc3BlY2lmaWNhdGlvbi4KPiAtICAgICAgICAqLwo+IC0gICAgICAgICAg
ICAgICBjd2lkdGggPSA2MzsKPiAtICAgICAgIGVsc2Ugewo+IC0gICAgICAgICAgICAgICBpZiAo
aHdjLT5pZHggPT0gLTEpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgLyogSGFuZGxlIGluaXQg
Y2FzZSB3aGVyZSBpZHggaXMgbm90IGluaXRpYWxpemVkIHlldCAqLwo+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGN3aWR0aCA9IHJ2cG11LT5jdHJfZ2V0X3dpZHRoKDApOwo+IC0gICAgICAgICAg
ICAgICBlbHNlCj4gLSAgICAgICAgICAgICAgICAgICAgICAgY3dpZHRoID0gcnZwbXUtPmN0cl9n
ZXRfd2lkdGgoaHdjLT5pZHgpOwo+IC0gICAgICAgfQo+ICsgICAgICAgaWYgKGh3Yy0+aWR4ID09
IC0xKQo+ICsgICAgICAgICAgICAgICAvKiBIYW5kbGUgaW5pdCBjYXNlIHdoZXJlIGlkeCBpcyBu
b3QgaW5pdGlhbGl6ZWQgeWV0ICovCj4gKyAgICAgICAgICAgICAgIGN3aWR0aCA9IHJ2cG11LT5j
dHJfZ2V0X3dpZHRoKDApOwo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICBjd2lkdGgg
PSBydnBtdS0+Y3RyX2dldF93aWR0aChod2MtPmlkeCk7Cj4KPiAgICAgICAgIHJldHVybiBHRU5N
QVNLX1VMTChjd2lkdGgsIDApOwo+ICB9Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNj
dl9wbXVfbGVnYWN5LmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X2xlZ2FjeS5jCj4gaW5kZXgg
NzlmZGQ2Njc5MjJlLi5hMTc5ZWQ2YWM5ODAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wZXJmL3Jp
c2N2X3BtdV9sZWdhY3kuYwo+ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfbGVnYWN5LmMK
PiBAQCAtMzcsNiArMzcsMTIgQEAgc3RhdGljIGludCBwbXVfbGVnYWN5X2V2ZW50X21hcChzdHJ1
Y3QgcGVyZl9ldmVudCAqZXZlbnQsIHU2NCAqY29uZmlnKQo+ICAgICAgICAgcmV0dXJuIHBtdV9s
ZWdhY3lfY3RyX2dldF9pZHgoZXZlbnQpOwo+ICB9Cj4KPiArLyogY3ljbGUgJiBpbnN0cmV0IGFy
ZSBhbHdheXMgNjQgYml0LCBvbmUgYml0IGxlc3MgYWNjb3JkaW5nIHRvIFNCSSBzcGVjICovCj4g
K3N0YXRpYyBpbnQgcG11X2xlZ2FjeV9jdHJfZ2V0X3dpZHRoKGludCBpZHgpCj4gK3sKPiArICAg
ICAgIHJldHVybiA2MzsKPiArfQo+ICsKPiAgc3RhdGljIHU2NCBwbXVfbGVnYWN5X3JlYWRfY3Ry
KHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCkKPiAgewo+ICAgICAgICAgc3RydWN0IGh3X3BlcmZf
ZXZlbnQgKmh3YyA9ICZldmVudC0+aHc7Cj4gQEAgLTExMSw3ICsxMTcsNyBAQCBzdGF0aWMgdm9p
ZCBwbXVfbGVnYWN5X2luaXQoc3RydWN0IHJpc2N2X3BtdSAqcG11KQo+ICAgICAgICAgcG11LT5j
dHJfc3RvcCA9IE5VTEw7Cj4gICAgICAgICBwbXUtPmV2ZW50X21hcCA9IHBtdV9sZWdhY3lfZXZl
bnRfbWFwOwo+ICAgICAgICAgcG11LT5jdHJfZ2V0X2lkeCA9IHBtdV9sZWdhY3lfY3RyX2dldF9p
ZHg7Cj4gLSAgICAgICBwbXUtPmN0cl9nZXRfd2lkdGggPSBOVUxMOwo+ICsgICAgICAgcG11LT5j
dHJfZ2V0X3dpZHRoID0gcG11X2xlZ2FjeV9jdHJfZ2V0X3dpZHRoOwo+ICAgICAgICAgcG11LT5j
dHJfY2xlYXJfaWR4ID0gTlVMTDsKPiAgICAgICAgIHBtdS0+Y3RyX3JlYWQgPSBwbXVfbGVnYWN5
X3JlYWRfY3RyOwo+ICAgICAgICAgcG11LT5ldmVudF9tYXBwZWQgPSBwbXVfbGVnYWN5X2V2ZW50
X21hcHBlZDsKPiAtLQo+IDIuMzQuMQo+CgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlz
aHBAcml2b3NpbmMuY29tPgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
