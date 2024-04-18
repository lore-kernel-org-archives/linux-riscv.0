Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CEAC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 13:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRvLxT6cWktJpkiZ5AFsm8+ilGHJKXjGu0AORZT1x5A=; b=yvb5barx8Z5gKx
	W68RoQ7zo81nrz08AwALVfjZz/xB8Hfrln/OkbE4mAwEtg/QCAsTv3uBjfn/bl4ZNEVJz8OthYdMI
	64nZpag+lumVHhVJ0EAk0pl+p86dcNsOBjBY5WFYR4PNzEHhkqN4FHAJBO8kJBpi0Wah6cClLermx
	tqg9wq/HCUA2EcOLS+0qws1H7wB6uhnpjnrtHB1VlpNa8sSQSu4t43GcwdAV6EjMYiGyRAPbzbBhY
	JamVnEsejGs2TcDXUXi+4VzVvT/jZTFy4WuJWqw6Ocp2qcGRZmIPbMBj2Fr5K/WZkA1c1aIiCSU/B
	G+C8QpQcZDa9JyDwxLHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRhP-00000002M7s-35rb;
	Thu, 18 Apr 2024 13:21:11 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRhI-00000002M3Y-1OeM
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 13:21:09 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-36b146836d7so2796905ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 06:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713446462; x=1714051262; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RDk8w/VcIuRs4a1b2sKCJYfS/2Ok3UGeivw5IblcRI=;
        b=sCEDyFCiydghFKEPSD2HQ+IiPk6/ZlR0RWAfM4CSXdKFOPQOsE6tCbCjlwFZ/55V16
         0dkrQRM2jNC8oSGmzwZG3Gqn3BpJSvdlQx27t0NTCLwLbCJvCV1AqaC3KBU4wmwXjsQL
         pIA4guQcg+Hiwg3RUMqWuXE6gQ8Ry/dKIpI7u2dgbH6FtRZF3gfwUa1eGbfZK/UXSEEK
         X8QaUnThJbMiS9/IGq/cpr5zLmag1z5McSyOHEPX+Q8Sl7aZYgOT7at9OwTFspNWUQD1
         qRJilsU1kFUv8+IOP0m3oRunkxm0kCzm2pCQSeWcBHBxz/AtZS+g89dyjlS12rNsP0Vz
         zN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713446462; x=1714051262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RDk8w/VcIuRs4a1b2sKCJYfS/2Ok3UGeivw5IblcRI=;
        b=EtvFxhYc+sZOonoCeevSYxOPDL5F6nP2XIpKjI6nIf4ruoOX+B62USbJp5//YXVJMV
         UyN7XlziHpcfEF2MHN6IKER3HllG3qcAV6dcuXJ5cjALIn/HB8F7f5Z9janDCZDkztNH
         NDUN6tIZL6Zb2RPumLWxr5B5ZOCJaXC6f2bN2B1HZryBnO2JqeeAYyBqDhYYkjGAmngU
         YILsKxAWEoV8SMoacvBYX64++5jfiRummYTwfu4lVkaEv2kBThhwMw1zu0Od8lRsb+7Q
         F8ebu/DlP1hS8szOC1QzX/szwRjEOhTu6C5zRbpc9/ukwOU0ez6fq/wjX30YNpWPTORt
         iqjA==
X-Forwarded-Encrypted: i=1; AJvYcCXjp7iK0nIjm+zmyuKud2yLaIZ0e/IR30rDSU/9yAudsREbjCdJGq6pa7D1pXjAsXzVd1lr/hkDTCKCwA57O9t+s4E+qRoz7ujwN38PwjDM
X-Gm-Message-State: AOJu0YxCHnoO28iotD1W8BXBU6KOlNJfMiF9ODL6pYoJrCSfTBxdKbPl
	jmSDdie2BJa9KlSZe2sp3et39RkQX6l0bXrUz/Q5ibpVYP03Yo7Nce7pNt/Etkg3x0AFU5MI5Cq
	mbJP7G+gex2MdfLu8n05xgPrWuCYAUVXhaSWsEw==
X-Google-Smtp-Source: AGHT+IF4F3+EsOd9Km5fe/tUcyJysRUEm3trePDQa9sseGq5flNeCiOAYf6iwo1deI+stz+PjTd2Ud2CltxcxL5sdMA=
X-Received: by 2002:a05:6e02:1787:b0:36b:e53:57ea with SMTP id
 y7-20020a056e02178700b0036b0e5357eamr3796568ilu.16.1713446462126; Thu, 18 Apr
 2024 06:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240418124300.1387978-1-cleger@rivosinc.com> <20240418124300.1387978-8-cleger@rivosinc.com>
In-Reply-To: <20240418124300.1387978-8-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Apr 2024 18:50:50 +0530
Message-ID: <CAAhSdy2fVUYqYySn8rbdD5Dgc2fqXXjG_u=qe7=_MHPfqVBoBg@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] KVM: riscv: selftests: Add some Zc* extensions
 to get-reg-list test
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_062104_427319_BD8F3F39 
X-CRM114-Status: GOOD (  12.98  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgNjoxNOKAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgS1ZNIFJJU0MtViBhbGxvd3MgWmNhLCBaY2Ys
IFpjZCBhbmQgWmNiIGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNIHNvCj4gYWRkIHRoZXNlIGV4dGVu
c2lvbnMgdG8gZ2V0LXJlZy1saXN0IHRlc3QuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBM
w6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0
ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CkFja2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgfCAxNiArKysrKysrKysrKysrKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gaW5kZXggNDAxMDdiYjYxOTc1Li42MWNh
ZDQ1MTQxOTcgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2
L2dldC1yZWctbGlzdC5jCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2
L2dldC1yZWctbGlzdC5jCj4gQEAgLTU1LDYgKzU1LDEwIEBAIGJvb2wgZmlsdGVyX3JlZyhfX3U2
NCByZWcpCj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklT
Q1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pCS0M6Cj4gICAgICAgICBjYXNlIEtW
TV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVND
Vl9JU0FfRVhUX1pCS1g6Cj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtW
TV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pCUzoKPiArICAgICAg
IGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwg
S1ZNX1JJU0NWX0lTQV9FWFRfWkNBOgo+ICsgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9F
WFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0I6Cj4g
KyAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJ
TkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pDRDoKPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVND
Vl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRf
WkNGOgo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NW
X0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aRkE6Cj4gICAgICAgICBjYXNlIEtWTV9S
RUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9J
U0FfRVhUX1pGSDoKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JF
R19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkZITUlOOgo+IEBAIC00MjEs
NiArNDI1LDEwIEBAIHN0YXRpYyBjb25zdCBjaGFyICppc2FfZXh0X3NpbmdsZV9pZF90b19zdHIo
X191NjQgcmVnX29mZikKPiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpCS0MpLAo+
ICAgICAgICAgICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkJLWCksCj4gICAgICAgICAgICAgICAg
IEtWTV9JU0FfRVhUX0FSUihaQlMpLAo+ICsgICAgICAgICAgICAgICBLVk1fSVNBX0VYVF9BUlIo
WkNBKSwKPiArICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpDQiksCj4gKyAgICAgICAg
ICAgICAgIEtWTV9JU0FfRVhUX0FSUihaQ0QpLAo+ICsgICAgICAgICAgICAgICBLVk1fSVNBX0VY
VF9BUlIoWkNGKSwKPiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpGQSksCj4gICAg
ICAgICAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaRkgpLAo+ICAgICAgICAgICAgICAgICBLVk1f
SVNBX0VYVF9BUlIoWkZITUlOKSwKPiBAQCAtOTQ1LDYgKzk1MywxMCBAQCBLVk1fSVNBX0VYVF9T
SU1QTEVfQ09ORklHKHpia2IsIFpCS0IpOwo+ICBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpi
a2MsIFpCS0MpOwo+ICBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpia3gsIFpCS1gpOwo+ICBL
Vk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpicywgWkJTKTsKPiArS1ZNX0lTQV9FWFRfU0lNUExF
X0NPTkZJRyh6Y2EsIFpDQSksCj4gK0tWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemNiLCBaQ0Ip
LAo+ICtLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjZCwgWkNEKSwKPiArS1ZNX0lTQV9FWFRf
U0lNUExFX0NPTkZJRyh6Y2YsIFpDRiksCj4gIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemZh
LCBaRkEpOwo+ICBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpmaCwgWkZIKTsKPiAgS1ZNX0lT
QV9FWFRfU0lNUExFX0NPTkZJRyh6ZmhtaW4sIFpGSE1JTik7Cj4gQEAgLTEwMDEsNiArMTAxMywx
MCBAQCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqdmNwdV9jb25maWdzW10gPSB7Cj4gICAgICAgICAm
Y29uZmlnX3pia2MsCj4gICAgICAgICAmY29uZmlnX3pia3gsCj4gICAgICAgICAmY29uZmlnX3pi
cywKPiArICAgICAgICZjb25maWdfemNhLAo+ICsgICAgICAgJmNvbmZpZ196Y2IsCj4gKyAgICAg
ICAmY29uZmlnX3pjZCwKPiArICAgICAgICZjb25maWdfemNmLAo+ICAgICAgICAgJmNvbmZpZ196
ZmEsCj4gICAgICAgICAmY29uZmlnX3pmaCwKPiAgICAgICAgICZjb25maWdfemZobWluLAo+IC0t
Cj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
