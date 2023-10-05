Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A86E93700
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Oct 2023 05:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IaC7dYApaTZjhauAjiqguf9NSncfkpr/gXMM98AgmmE=; b=rGfCUH0utT6A8q
	+/Rz2q3S5NN7mbMMC8fEJysu8xt8pLtARdqrgOhG1gB710i751FVJcDj/2Cc2oGSekBgSmjeQRIoI
	+qiaUjgzUITmQNf9SKLnsM0hvtxWxK2nhXlfp6ISUwc0FXNrvdL9bRDaaVnhQaK85K0Cwp1MYkIwc
	/KR62+n7AVVimIN8W+9EOKRoajU09jgfAT0ss7y3fQJTP1aWokzv9YURf6BCcdNGt6P/ytpEfXj0L
	9OQVyuTu4syMt4A1OSbbdz4z0PK8WtMimBQ/nGlVsWFoaOdlmjnvPbrwXZoVy3FnRZ3tE006zTS4h
	RXDAuwcVeQyFeo7PVPjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoHGM-001TCU-1G;
	Thu, 05 Oct 2023 05:51:06 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoHGH-001TBM-0j
	for linux-riscv@lists.infradead.org;
	Thu, 05 Oct 2023 05:51:04 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2774f6943b1so440622a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 22:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1696485060; x=1697089860; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAn7kTF76MX4baCsjz/DD87LgbEJOFPnszS1gD87MLo=;
        b=rBPG+FxD+zZOPY3XTj+uYQsG6km2uvVwTAU76VUWAyD/6Z4X8cbWujse+9TuzxhTdT
         ncxtwWbypwYNGfKIUmYy5/SwU5SPGoIbpFtLTee6qifglKol1lmHOlf3iku+hWEcxWMw
         ai9NWcjy4S/qikrijPK3xxx+vpcunJplq2jZSwweCHpeJE5uLNGTBWpP2QKcJ34qxru5
         p1PmljmsXrH3DE8KP+u6OxsxrE2KJmzDxFepDDxn/xpnKo8FDAIQBbrFEC1Qs1soXna0
         NR40jtTXdckbLUZzOu8z/rYkqUz+clsZ85c7BsxbtbvV+9othPJ1YPK0bhrV86Hk2WW/
         Xa5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696485060; x=1697089860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAn7kTF76MX4baCsjz/DD87LgbEJOFPnszS1gD87MLo=;
        b=h8wDMRGU6Ik+Hl1DN2ofsvXskYbYBYyFcKT3g0JJMdB/p5tokkqu6opBPFAqXF3FOW
         VYZo4eNq2e+u0tcnuxrl6OkLZajCn9lRnqMUre0zFvkkN7amWX5/bHIe5i4aC90MOX3t
         zNtwazZGrc6Z8IRcvW+bO8o3bfFtcfpUlGFTIBZxmpbvlLrhkJqeeH5A7N6+t0gRJTjV
         lFBFosGH7RNh4dmzN+aOVM1Hyc81VzPYMHdNIO9N9XXYjnfxJ7b4FBEFhNng3JPm4J7A
         2XwouER8CH2mS25Ci5hUBCYZFyk0DovD5ApzNkQYU+irdzT6UnHGI7vhFWJw/rgCvWqb
         g0LQ==
X-Gm-Message-State: AOJu0YywNNBL5Y1VQZF2+9mdHtbm+kdj+RJuKJawBf1XT2zHO5TFAY06
	S2EPWofu1YhOByICZgDVCMd4Z5K+2J6tJta1NlJv6A==
X-Google-Smtp-Source: AGHT+IEtGbIHdTfL2yZTTDLPgQj3me/hsvVuKvB4XaXv1nNxUCov3SGcpN7sdI1I388p/AKgKTr/0lfdATge9YktJw8=
X-Received: by 2002:a17:90b:a04:b0:26d:416a:b027 with SMTP id
 gg4-20020a17090b0a0400b0026d416ab027mr4208863pjb.31.1696485059836; Wed, 04
 Oct 2023 22:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231003035226.1945725-3-apatel@ventanamicro.com> <mhng-4ec1093a-4542-429e-a9f0-8a976cff9ac4@palmer-ri-x1c9>
In-Reply-To: <mhng-4ec1093a-4542-429e-a9f0-8a976cff9ac4@palmer-ri-x1c9>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 5 Oct 2023 11:20:48 +0530
Message-ID: <CAAhSdy2CxWw9ny7vdBoEzsXkm_J882NGKTDQ7BfykrjuB1QR+w@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] RISC-V: Detect Zicond from ISA string
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: apatel@ventanamicro.com, pbonzini@redhat.com, atishp@atishpatra.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, shuah@kernel.org, ajones@ventanamicro.com, 
	mchitale@ventanamicro.com, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_225101_654501_DF16C141 
X-CRM114-Status: GOOD (  18.01  )
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

T24gV2VkLCBPY3QgNCwgMjAyMyBhdCA3OjM34oCvUE0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBk
YWJiZWx0LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIDAyIE9jdCAyMDIzIDIwOjUyOjIyIFBEVCAo
LTA3MDApLCBhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbSB3cm90ZToKPiA+IFRoZSBSSVNDLVYgaW50
ZWdlciBjb25kaXRpb25hbCAoWmljb25kKSBvcGVyYXRpb24gZXh0ZW5zaW9uIGRlZmluZXMKPiA+
IHN0YW5kYXJkIGNvbmRpdGlvbmFsIGFyaXRobWV0aWMgYW5kIGNvbmRpdGlvbmFsLXNlbGVjdC9t
b3ZlIG9wZXJhdGlvbnMKPiA+IHdoaWNoIGFyZSBpbnNwaXJlZCBmcm9tIHRoZSBYVmVudGFuYUNv
bmRPcHMgZXh0ZW5zaW9uLiBJbiBmYWN0LCBRRU1VCj4gPiBSSVNDLVYgYWxzbyBoYXMgc3VwcG9y
dCBmb3IgZW11bGF0aW5nIFppY29uZCBleHRlbnNpb24uCj4gPgo+ID4gTGV0IHVzIGRldGVjdCBa
aWNvbmQgZXh0ZW5zaW9uIGZyb20gSVNBIHN0cmluZyBhdmFpbGFibGUgdGhyb3VnaAo+ID4gRFQg
b3IgQUNQSS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFu
YW1pY3JvLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5h
bWljcm8uY29tPgo+ID4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1p
Y3JvY2hpcC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgg
fCAxICsKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAxICsKPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgK
PiA+IGluZGV4IDBmNTIwZjdkMDU4YS4uNmZjNTFjMWIzNGNmIDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3Y2FwLmgKPiA+IEBAIC01OSw2ICs1OSw3IEBACj4gPiAgI2RlZmluZSBSSVNDVl9JU0Ff
RVhUX1pJRkVOQ0VJICAgICAgICAgICAgICAgNDEKPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRf
WklIUE0gICAgICAgICAgNDIKPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU01TVEFURUVOICAg
ICAgICAgICAgICA0Mwo+ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUNPTkQgICAgICAgICA0
NAo+ID4KPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFYICAgICAgICAgICAgNjQKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiBpbmRleCAzNzU1YThjMmE5ZGUuLmUzODAzODIyYWI1
YSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiBAQCAtMTY3LDYgKzE2Nyw3IEBA
IGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewo+ID4g
ICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoemljYm9tLCBSSVNDVl9JU0FfRVhUX1pJQ0JPTSks
Cj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWNib3osIFJJU0NWX0lTQV9FWFRfWklD
Qk9aKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppY250ciwgUklTQ1ZfSVNBX0VY
VF9aSUNOVFIpLAo+ID4gKyAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoemljb25kLCBSSVNDVl9J
U0FfRVhUX1pJQ09ORCksCj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWNzciwgUklT
Q1ZfSVNBX0VYVF9aSUNTUiksCj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWZlbmNl
aSwgUklTQ1ZfSVNBX0VYVF9aSUZFTkNFSSksCj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFU
QSh6aWhpbnRwYXVzZSwgUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSksCj4KPiBBY2tlZC1ieTog
UGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4KPiBDYW4gd2UgZG8gYSBzaGFy
ZWQgdGFnLCB0aG91Z2g/ICBUaGVzZSB3aWxsIGNvbmZsaWN0LgoKVGhhbmtzIFBhbG1lci4KCkkg
d2lsbCBwcm92aWRlIGEgc2hhcmVkIHRhZyBiYXNlZCBvbiA2LjYtcmM1IHNvbWV0aW1lCm5leHQg
d2Vlay4gSSBob3BlIHRoaXMgaXMgb2theSBmb3IgeW91LgoKUmVnYXJkcywKQW51cAoKPgo+IC0t
Cj4ga3ZtLXJpc2N2IG1haWxpbmcgbGlzdAo+IGt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
