Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A16CD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XVXrXuP5mRhqpErOPvlLRRACFhU3iD5gzSzhbYlfQKg=; b=2goYnnhmV0IV22
	KOolmN3fj+tGZq+ZuHd8OguoZlgWWnN5wcBsXBZV8EVfcktlvRZG+M5KOXooA6xc9WUsDtuXCMVG4
	4NAZBSKycVXVnvjnO0CxQFIzCOCspnF0pnPv3YaKZbPPWnMGK61JDg4vHLjtNhtFhwe7I+l6a/b9b
	127YEeEtttwfq92AEIMCvujx2WRFMuAC8J4cUDaB8S0rmSd4XyZJi9dXpNeybx3CxLmo/fERISdpV
	06V2veRZkBnirXih3Zo/mHKjQrlzogNfgyrD390C0Cq1GkMj/jEzsaII/EYUk/NPu+f7tPh2sKm+O
	MgCD8xSG+iS1sl9F7KzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsRcJ-00000003mFf-0FDm;
	Thu, 04 Apr 2024 18:15:15 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsRcG-00000003mEs-21WA
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 18:15:14 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7c7f3f66d17so55700139f.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 11:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712254510; x=1712859310; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7PI0LLP9w1WjXiWU7aCp0TwHBscK/fXXWNmgARMtLns=;
        b=PKeGIQ0huAFTuSKL3m6eadUo/3qdRd0kAtBJlpxWTgunJM+Bh2gSj0yfX7OXL4w1o0
         6gZfX/k4/h5lOZK4OOWlz+ciT9SHLNGU1S9jkBBz3prvEc9QEAhMWWhMjzAKCQL1u2S/
         lFA2k+IbqDTawT40p1H0IbrScE+EmmjQO38fPyol0zU+b2ugutww4tBETI2p02ZfLmvq
         HTOmeZ+l+c/31EaCpWFiPt6eDHazEXayL4g85NFon+EaqoscjlGhJrVDeUNrqEeffgy4
         LshWdwktcn4cEJ25aezBKD4ElL1S7w1r+UfSDjUpJ6GINQe2V9bkzQ8WnBNYQ/Rb9jky
         GvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712254510; x=1712859310;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7PI0LLP9w1WjXiWU7aCp0TwHBscK/fXXWNmgARMtLns=;
        b=CIpCOddlvIcoufFN1jL8aqgp1A98GqSkqRo+lcBYBp3jPvyD9IB4WbQ/H3+fSyPEZ1
         AAEYUHPyXPj5ZHYewzv8kHXfwA3V3KctCK71ORUhZ+5mJizbskaMvBgrVvheqM5yQK1M
         U4MK1ntvbJdTrejSdjU0RRM6DDdg9Z13UH7oRv9dDbKVWUYssEPdozqgeGqFYlmy/KZf
         LLL8IqJAulNxkfnpMRi8E/9pth7F3hdiZz774zz+oPOgtd+TUqpSzF7ODtuJIFgpwHN9
         EwH6WQOFAygc9OwzwM24J9D3mFa9OJEKtkrssRZIoH2BHTsH7aspMem89lmU2IJcQVdS
         CxqA==
X-Forwarded-Encrypted: i=1; AJvYcCWN4Zqp3e2nfBClqOTiqK4OaP0tp0J7OKru3pJ7th0t7uZDePGADDNuHl2VXwQW/ARkCGAA11RaDUyVYw0E7HWIaJJ159PWNUlETbE8Mm4B
X-Gm-Message-State: AOJu0YwFtrVi849DaJj728DK9uV7MIf9c8nuBMk68SuND1WX/SxWnikf
	Pg8GbeAqQswrrtpbq40mAcDXFumvFJPyuMGMz3riFQYsYVzUiZT+i90lXWbkoKo=
X-Google-Smtp-Source: AGHT+IH+Rz2ETv/jL0+emg9tpkztNGdXiBnx5+2D20KLbKT62Y5e+cMqoaoMr9jzNV+C6TVJwJWQdA==
X-Received: by 2002:a05:6602:4250:b0:7c8:55c2:63dc with SMTP id cc16-20020a056602425000b007c855c263dcmr616654iob.9.1712254510496;
        Thu, 04 Apr 2024 11:15:10 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.190])
        by smtp.gmail.com with ESMTPSA id c60-20020a029642000000b00478ac4d9882sm4847957jai.53.2024.04.04.11.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 11:15:09 -0700 (PDT)
Message-ID: <0b817fa8-2a1c-4da4-b5d4-f36ac93dbfd9@sifive.com>
Date: Thu, 4 Apr 2024 13:15:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] riscv: thead: Rename T-Head PBMT to MAEE
To: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 linux-riscv@lists.infradead.org
References: <20240329121414.688391-1-christoph.muellner@vrull.eu>
 <20240329121414.688391-2-christoph.muellner@vrull.eu>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Heiko Stuebner <heiko@sntech.de>, Cooper Qu <cooper.qu@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
 Huang Tao <eric.huang@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
 Qingfang Deng <dqfext@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240329121414.688391-2-christoph.muellner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_111512_741295_D971FC8D 
X-CRM114-Status: GOOD (  23.07  )
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

SGkgQ2hyaXN0b3BoLAoKT24gMjAyNC0wMy0yOSA3OjE0IEFNLCBDaHJpc3RvcGggTcO8bGxuZXIg
d3JvdGU6Cj4gVC1IZWFkJ3MgdmVuZG9yIGV4dGVuc2lvbiB0byBzZXQgcGFnZSBhdHRyaWJ1dGVz
IGhhcyB0aGUgbmFtZQo+IE1BRUUgKE1NVSBhZGRyZXNzIGF0dHJpYnV0ZSBleHRlbnNpb24pLgo+
IExldCdzIHJlbmFtZSBpdCwgc28gaXQgaXMgY2xlYXIgd2hhdCB0aGlzIHJlZmVyZXMgdG8uCj4g
Cj4gU2VlIGFsc286Cj4gICBodHRwczovL2dpdGh1Yi5jb20vVC1oZWFkLVNlbWkvdGhlYWQtZXh0
ZW5zaW9uLXNwZWMvYmxvYi9tYXN0ZXIveHRoZWFkbWFlZS5hZG9jCgpNeSB1bmRlcnN0YW5kaW5n
IGlzIHRoYXQgTUFFRSBpcyB0aGUgbmFtZSBvZiB0aGUgQ1NSIGJpdCBhbmQgc3RhbmRzIGZvciAi
TU1VIChvcgpNZW1vcnkpIEF0dHJpYnV0ZSBFeHRlbnNpb24gRW5hYmxlIiwgc28gdGhlIG5hbWUg
Zm9yIHRoZSBleHRlbnNpb24gaXRzZWxmIHdvdWxkCmJlICJNQUUiIChqdXN0IG9uZSBFKS4gVGhp
cyBpcyBzaW1pbGFyIHRvIFRIRUFESVNBRUUgPT4gVC1IRUFEIElTQSBFeHRlbnNpb24KRW5hYmxl
LiBEb2VzIHRoYXQgc291bmQgcmlnaHQ/CgpSZWdhcmRzLApTYW11ZWwKCj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+Cj4gLS0t
Cj4gIGFyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEgICAgICAgICAgICB8ICA4ICsrKystLS0tCj4g
IGFyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jICAgICB8ICA4ICsrKystLS0tCj4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaCB8IDIwICsrKysrKysrKystLS0tLS0t
LS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEgYi9hcmNoL3Jpc2N2
L0tjb25maWcuZXJyYXRhCj4gaW5kZXggOTEwYmE4ODM3YWRkLi4yYzI0YmVmN2UxMTIgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnLmVycmF0YQo+ICsrKyBiL2FyY2gvcmlzY3YvS2Nv
bmZpZy5lcnJhdGEKPiBAQCAtODIsMTQgKzgyLDE0IEBAIGNvbmZpZyBFUlJBVEFfVEhFQUQKPiAg
Cj4gIAkgIE90aGVyd2lzZSwgcGxlYXNlIHNheSAiTiIgaGVyZSB0byBhdm9pZCB1bm5lY2Vzc2Fy
eSBvdmVyaGVhZC4KPiAgCj4gLWNvbmZpZyBFUlJBVEFfVEhFQURfUEJNVAo+IC0JYm9vbCAiQXBw
bHkgVC1IZWFkIG1lbW9yeSB0eXBlIGVycmF0YSIKPiArY29uZmlnIEVSUkFUQV9USEVBRF9NQUVF
Cj4gKwlib29sICJBcHBseSBULUhlYWQncyBNTVUgYWRkcmVzcyBhdHRyaWJ1dGUgKE1BRUUpIgo+
ICAJZGVwZW5kcyBvbiBFUlJBVEFfVEhFQUQgJiYgNjRCSVQgJiYgTU1VCj4gIAlzZWxlY3QgUklT
Q1ZfQUxURVJOQVRJVkVfRUFSTFkKPiAgCWRlZmF1bHQgeQo+ICAJaGVscAo+IC0JICBUaGlzIHdp
bGwgYXBwbHkgdGhlIG1lbW9yeSB0eXBlIGVycmF0YSB0byBoYW5kbGUgdGhlIG5vbi1zdGFuZGFy
ZAo+IC0JICBtZW1vcnkgdHlwZSBiaXRzIGluIHBhZ2UtdGFibGUtZW50cmllcyBvbiBULUhlYWQg
U29Dcy4KPiArCSAgVGhpcyB3aWxsIGFwcGx5IHRoZSBtZW1vcnkgdHlwZSBlcnJhdGEgdG8gaGFu
ZGxlIFQtSGVhZCdzIE1NVSBhZGRyZXNzCj4gKwkgIGF0dHJpYnV0ZSBleHRlbnNpb24gKE1BRUUp
Lgo+ICAKPiAgCSAgSWYgeW91IGRvbid0IGtub3cgd2hhdCB0byBkbyBoZXJlLCBzYXkgIlkiLgo+
ICAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMgYi9hcmNo
L3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYwo+IGluZGV4IGIxYzQxMGJiYzFhZS4uOGM4YThh
NGIwNDIxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jCj4g
KysrIGIvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKPiBAQCAtMTksMTAgKzE5LDEw
IEBACj4gICNpbmNsdWRlIDxhc20vcGF0Y2guaD4KPiAgI2luY2x1ZGUgPGFzbS92ZW5kb3JpZF9s
aXN0Lmg+Cj4gIAo+IC1zdGF0aWMgYm9vbCBlcnJhdGFfcHJvYmVfcGJtdCh1bnNpZ25lZCBpbnQg
c3RhZ2UsCj4gK3N0YXRpYyBib29sIGVycmF0YV9wcm9iZV9tYWVlKHVuc2lnbmVkIGludCBzdGFn
ZSwKPiAgCQkJICAgICAgdW5zaWduZWQgbG9uZyBhcmNoX2lkLCB1bnNpZ25lZCBsb25nIGltcGlk
KQo+ICB7Cj4gLQlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0VSUkFUQV9USEVBRF9QQk1UKSkKPiAr
CWlmICghSVNfRU5BQkxFRChDT05GSUdfRVJSQVRBX1RIRUFEX01BRUUpKQo+ICAJCXJldHVybiBm
YWxzZTsKPiAgCj4gIAlpZiAoYXJjaF9pZCAhPSAwIHx8IGltcGlkICE9IDApCj4gQEAgLTE0MCw4
ICsxNDAsOCBAQCBzdGF0aWMgdTMyIHRoZWFkX2VycmF0YV9wcm9iZSh1bnNpZ25lZCBpbnQgc3Rh
Z2UsCj4gIHsKPiAgCXUzMiBjcHVfcmVxX2VycmF0YSA9IDA7Cj4gIAo+IC0JaWYgKGVycmF0YV9w
cm9iZV9wYm10KHN0YWdlLCBhcmNoaWQsIGltcGlkKSkKPiAtCQljcHVfcmVxX2VycmF0YSB8PSBC
SVQoRVJSQVRBX1RIRUFEX1BCTVQpOwo+ICsJaWYgKGVycmF0YV9wcm9iZV9tYWVlKHN0YWdlLCBh
cmNoaWQsIGltcGlkKSkKPiArCQljcHVfcmVxX2VycmF0YSB8PSBCSVQoRVJSQVRBX1RIRUFEX01B
RUUpOwo+ICAKPiAgCWVycmF0YV9wcm9iZV9jbW8oc3RhZ2UsIGFyY2hpZCwgaW1waWQpOwo+ICAK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oCj4gaW5kZXggZWEzMzI4OGY4YTI1Li43
YzM3N2UxMzdiNDEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFf
bGlzdC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oCj4gQEAg
LTIzLDcgKzIzLDcgQEAKPiAgI2VuZGlmCj4gIAo+ICAjaWZkZWYgQ09ORklHX0VSUkFUQV9USEVB
RAo+IC0jZGVmaW5lCUVSUkFUQV9USEVBRF9QQk1UIDAKPiArI2RlZmluZQlFUlJBVEFfVEhFQURf
TUFFRSAwCj4gICNkZWZpbmUJRVJSQVRBX1RIRUFEX1BNVSAxCj4gICNkZWZpbmUJRVJSQVRBX1RI
RUFEX05VTUJFUiAyCj4gICNlbmRpZgo+IEBAIC01MywyMCArNTMsMjAgQEAgYXNtKEFMVEVSTkFU
SVZFKCJzZmVuY2Uudm1hICUwIiwgInNmZW5jZS52bWEiLCBTSUZJVkVfVkVORE9SX0lELAlcCj4g
ICAqIGluIHRoZSBkZWZhdWx0IGNhc2UuCj4gICAqLwo+ICAjZGVmaW5lIEFMVF9TVlBCTVRfU0hJ
RlQgNjEKPiAtI2RlZmluZSBBTFRfVEhFQURfUEJNVF9TSElGVCA1OQo+ICsjZGVmaW5lIEFMVF9U
SEVBRF9NQUVFX1NISUZUIDU5Cj4gICNkZWZpbmUgQUxUX1NWUEJNVChfdmFsLCBwcm90KQkJCQkJ
CVwKPiAgYXNtKEFMVEVSTkFUSVZFXzIoImxpICUwLCAwXHRcbm5vcCIsCQkJCQlcCj4gIAkJICAi
bGkgJTAsICUxXHRcbnNsbGkgJTAsJTAsJTMiLCAwLAkJCVwKPiAgCQkJUklTQ1ZfSVNBX0VYVF9T
VlBCTVQsIENPTkZJR19SSVNDVl9JU0FfU1ZQQk1ULAlcCj4gIAkJICAibGkgJTAsICUyXHRcbnNs
bGkgJTAsJTAsJTQiLCBUSEVBRF9WRU5ET1JfSUQsCVwKPiAtCQkJRVJSQVRBX1RIRUFEX1BCTVQs
IENPTkZJR19FUlJBVEFfVEhFQURfUEJNVCkJXAo+ICsJCQlFUlJBVEFfVEhFQURfTUFFRSwgQ09O
RklHX0VSUkFUQV9USEVBRF9NQUVFKQlcCj4gIAkJOiAiPXIiKF92YWwpCQkJCQkJXAo+ICAJCTog
IkkiKHByb3QjI19TVlBCTVQgPj4gQUxUX1NWUEJNVF9TSElGVCksCQlcCj4gLQkJICAiSSIocHJv
dCMjX1RIRUFEID4+IEFMVF9USEVBRF9QQk1UX1NISUZUKSwJCVwKPiArCQkgICJJIihwcm90IyNf
VEhFQUQgPj4gQUxUX1RIRUFEX01BRUVfU0hJRlQpLAkJXAo+ICAJCSAgIkkiKEFMVF9TVlBCTVRf
U0hJRlQpLAkJCQlcCj4gLQkJICAiSSIoQUxUX1RIRUFEX1BCTVRfU0hJRlQpKQo+ICsJCSAgIkki
KEFMVF9USEVBRF9NQUVFX1NISUZUKSkKPiAgCj4gLSNpZmRlZiBDT05GSUdfRVJSQVRBX1RIRUFE
X1BCTVQKPiArI2lmZGVmIENPTkZJR19FUlJBVEFfVEhFQURfTUFFRQo+ICAvKgo+ICAgKiBJTy9O
T0NBQ0hFIG1lbW9yeSB0eXBlcyBhcmUgaGFuZGxlZCB0b2dldGhlciB3aXRoIHN2cGJtdCwKPiAg
ICogc28gb24gVC1IZWFkIGNoaXBzLCBjaGVjayBpZiBubyBvdGhlciBtZW1vcnkgdHlwZSBpcyBz
ZXQsCj4gQEAgLTgzLDExICs4MywxMSBAQCBhc20gdm9sYXRpbGUoQUxURVJOQVRJVkUoCQkJCQkJ
XAo+ICAJInNsbGkgICAgdDMsIHQzLCAlM1xuXHQiCQkJCQlcCj4gIAkib3IgICAgICAlMCwgJTAs
IHQzXG5cdCIJCQkJCVwKPiAgCSIyOiIsICBUSEVBRF9WRU5ET1JfSUQsCQkJCQkJXAo+IC0JCUVS
UkFUQV9USEVBRF9QQk1ULCBDT05GSUdfRVJSQVRBX1RIRUFEX1BCTVQpCQlcCj4gKwkJRVJSQVRB
X1RIRUFEX01BRUUsIENPTkZJR19FUlJBVEFfVEhFQURfTUFFRSkJCVwKPiAgCTogIityIihfdmFs
KQkJCQkJCQlcCj4gLQk6ICJJIihfUEFHRV9NVE1BU0tfVEhFQUQgPj4gQUxUX1RIRUFEX1BCTVRf
U0hJRlQpLAkJXAo+IC0JICAiSSIoX1BBR0VfUE1BX1RIRUFEID4+IEFMVF9USEVBRF9QQk1UX1NI
SUZUKSwJCQlcCj4gLQkgICJJIihBTFRfVEhFQURfUEJNVF9TSElGVCkJCQkJCVwKPiArCTogIkki
KF9QQUdFX01UTUFTS19USEVBRCA+PiBBTFRfVEhFQURfTUFFRV9TSElGVCksCQlcCj4gKwkgICJJ
IihfUEFHRV9QTUFfVEhFQUQgPj4gQUxUX1RIRUFEX01BRUVfU0hJRlQpLAkJCVwKPiArCSAgIkki
KEFMVF9USEVBRF9NQUVFX1NISUZUKQkJCQkJXAo+ICAJOiAidDMiKQo+ICAjZWxzZQo+ICAjZGVm
aW5lIEFMVF9USEVBRF9QTUEoX3ZhbCkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
