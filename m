Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B2DC07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 14:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kl/4c10f78/8LZRZc5jMN+UgPFZAFfSMUxNP38bzxeQ=; b=To4BRpN2VklAb8
	wUuxLNH6Z9+gGsFYIYI0c4Wk0+FHTqO9s51rciwFdQCI9oB/mWxZG4RuAMHMAlKHMSNMAEQc3rxE6
	mxH00kT7QYJhcPXR3Q8lOSJUGahaz+XY8sw4LHOgYRq6O+DqS+6t60+dIgP4r/z9+ttk71SsCT5wg
	atydlReZsZhJ6zROiV5OQNyCFMlxKyiyWECNRk8FNUE67gkKSdCADWWldPxxb1ut8qrHSZ37qdsic
	9KtrrvfRebjflZhGJ9xiZC58PqsiPB1+slh4W18D8W9lZb/U9KqwJIO5VOyYPyx5uDjyG9Hh8zA4G
	y56VlI4D893PZlRS82AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvIq9-00ABHN-2q;
	Tue, 24 Oct 2023 14:57:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvIq6-00ABGP-3D
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 14:57:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4084de32db5so39221495e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 07:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698159421; x=1698764221; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+PoNElajP8sJ7epQkLSnQ3gBazZcGctrrMBsHdY35wo=;
        b=Eynklu3eT/psI/+TEWHxgA+UhGOUE37UfYoh14uUN7ogIL34Edm1Kwyde+MSZPquQj
         Z0hipvca0VI84CrSEs63SLkDpKbzrel0MkIMKW2aE4j3mXkI83whvJiTd1eYkOS1B2BM
         5AT1jpcjVdKfQt27LN66WuDW8mgjwbBfQSS3mcioxEMHhmGB3F2j6mh2p7TZjhXb8VtE
         jTs0Uw2IY/dLWsY0l99ppN5k5BXzUNG0bkjepaYjAKbnwSmNDfgXtxkbx99S/JTicVAB
         uHRs5bhUJic7HkqE/LMrABfXE1NM6hMJTv2NEj+uTDrKRXUa9r+seOdsTd/g8nWoj9Jq
         5w+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698159421; x=1698764221;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PoNElajP8sJ7epQkLSnQ3gBazZcGctrrMBsHdY35wo=;
        b=RV55wLgZ+66bZpfj6qaTK6iXtVoLQoiNg3arA+tvoIdNlZZgN0pOtBE6WCVozfvZgZ
         UVNNYYvUxvYKCnQ9BbkN1oUq0zA+ZwypKkxHnN8SRMCsBOct0I9joaKscigpPVa4+lPP
         WdL7d2W6BCvA5MjlENmD/FuAecsT3OZ7YYQnQfGnopZ7CbwFlxJnHKKyimR3jPJKGF4/
         QYQhZ426uKz80zol9nfYAiyQXInkVgAcXQnHDONWk+GoVYPYGWKb1aDTeXc3Pyb/L4oJ
         1mhFDgiaL2jwkcMRp7CQfZjUl3rT74hhmt0XbI0t5+6pSj2rQsOaYjl9C59yEYsXYjIz
         r3ZQ==
X-Gm-Message-State: AOJu0YzKuZwABKnh7W0ahWI4MCUE0r0viDizeA3p2ZhivSEmRU7e6qsP
	0CPIIWa6OCHh35u0HprkITZLhw==
X-Google-Smtp-Source: AGHT+IFdw010oLNVepkIReEFPUIX06g7zCHhwwihKO4C480GsZZ9JoH1qy3uCS4da8zpBdBpPsrJkg==
X-Received: by 2002:a05:600c:46c8:b0:409:295:9c44 with SMTP id q8-20020a05600c46c800b0040902959c44mr4489796wmo.14.1698159420856;
        Tue, 24 Oct 2023 07:57:00 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id p5-20020a05600c358500b004053a6b8c41sm12225994wmq.12.2023.10.24.07.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 07:57:00 -0700 (PDT)
Message-ID: <3f76f965-7c7b-109e-2ee0-3033e332e84b@linaro.org>
Date: Tue, 24 Oct 2023 16:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 2/3] clocksource: Add JH7110 timer driver
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Walker Chen <walker.chen@starfivetech.com>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>
References: <20231019053501.46899-1-xingyu.wu@starfivetech.com>
 <20231019053501.46899-3-xingyu.wu@starfivetech.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231019053501.46899-3-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_075703_054866_F9976546 
X-CRM114-Status: GOOD (  27.29  )
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

CkhpIFhpbmd5dSwKCgpPbiAxOS8xMC8yMDIzIDA3OjM1LCBYaW5neXUgV3Ugd3JvdGU6Cj4gQWRk
IHRpbWVyIGRyaXZlciBmb3IgdGhlIFN0YXJGaXZlIEpINzExMCBTb0MuCgpBcyBpdCBpcyBhIG5l
dyB0aW1lciwgcGxlYXNlIGFkZCBhIHByb3BlciBuaWNlIGRlc2NyaXB0aW9uIGV4cGxhaW5pbmcg
CnRoZSB0aW1lciBoYXJkd2FyZSwgdGhhbmtzLgoKPiBTaWduZWQtb2ZmLWJ5OiBYaW5neXUgV3Ug
PHhpbmd5dS53dUBzdGFyZml2ZXRlY2guY29tPgo+IC0tLQo+ICAgTUFJTlRBSU5FUlMgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgNyArCj4gICBkcml2ZXJzL2Nsb2Nrc291cmNlL0tjb25maWcg
ICAgICAgIHwgIDExICsKPiAgIGRyaXZlcnMvY2xvY2tzb3VyY2UvTWFrZWZpbGUgICAgICAgfCAg
IDEgKwo+ICAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1qaDcxMTAuYyB8IDM4MCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAzOTkgaW5zZXJ0aW9u
cygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItamg3
MTEwLmMKPiAKPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4
IDdhN2JkOGJkODBlOS4uOTFjMDliMzk5MTMxIDEwMDY0NAo+IC0tLSBhL01BSU5UQUlORVJTCj4g
KysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtMjA0NzMsNiArMjA0NzMsMTMgQEAgUzoJTWFpbnRhaW5l
ZAo+ICAgRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3N0YXJmaXZl
LGpoNzExMC10ZG0ueWFtbAo+ICAgRjoJc291bmQvc29jL3N0YXJmaXZlL2poNzExMF90ZG0uYwo+
ICAgCj4gK1NUQVJGSVZFIEpINzExMCBUSU1FUiBEUklWRVIKPiArTToJU2FtaW4gR3VvIDxzYW1p
bi5ndW9Ac3RhcmZpdmV0ZWNoLmNvbT4KPiArTToJWGluZ3l1IFd1IDx4aW5neXUud3VAc3RhcmZp
dmV0ZWNoLmNvbT4KPiArUzoJU3VwcG9ydGVkCj4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy90aW1lci9zdGFyZml2ZSxqaDcxMTAtdGltZXIueWFtbAo+ICtGOglkcml2ZXJz
L2Nsb2Nrc291cmNlL3RpbWVyLWpoNzExMC5jCj4gKwo+ICAgU1RBUkZJVkUgSkg3MVgwIENMT0NL
IERSSVZFUlMKPiAgIE06CUVtaWwgUmVubmVyIEJlcnRoaW5nIDxrZXJuZWxAZXNtaWwuZGs+Cj4g
ICBNOglIYWwgRmVuZyA8aGFsLmZlbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmlnIGIvZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmln
Cj4gaW5kZXggMGJhMGRjNGVjZjA2Li44MjFhYmNjMWU1MTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9jbG9ja3NvdXJjZS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmln
Cj4gQEAgLTY0MSw2ICs2NDEsMTcgQEAgY29uZmlnIFJJU0NWX1RJTUVSCj4gICAJICBpcyBhY2Nl
c3NlZCB2aWEgYm90aCB0aGUgU0JJIGFuZCB0aGUgcmRjeWNsZSBpbnN0cnVjdGlvbi4gIFRoaXMg
aXMKPiAgIAkgIHJlcXVpcmVkIGZvciBhbGwgUklTQy1WIHN5c3RlbXMuCj4gICAKPiArY29uZmln
IFNUQVJGSVZFX0pINzExMF9USU1FUgo+ICsJYm9vbCAiVGltZXIgZm9yIHRoZSBTVEFSRklWRSBK
SDcxMTAgU29DIgo+ICsJZGVwZW5kcyBvbiBBUkNIX1NUQVJGSVZFIHx8IENPTVBJTEVfVEVTVAoK
WW91IG1heSB3YW50IHRvIHVzZSBBUkNIX1NUQVJGSVZFIG9ubHkgaWYgdGhlIHBsYXRmb3JtIGNh
biBtYWtlIHRoaXMgCnRpbWVyIG9wdGlvbmFsLiBPdGhlcndpc2UsIHNldCB0aGUgb3B0aW9uIGZy
b20gdGhlIHBsYXRmb3JtIEtjb25maWcgYW5kIApwdXQgdGhlIGJvb2wgImJsYSBibGEiIGlmIENP
TVBJTEVfVEVTVAoKPiArCXNlbGVjdCBUSU1FUl9PRgo+ICsJc2VsZWN0IENMS1NSQ19NTUlPCj4g
KwlkZWZhdWx0IEFSQ0hfU1RBUkZJVkUKCm5vICJkZWZhdWx0IgoKPiArCWhlbHAKPiArCSAgVGhp
cyBlbmFibGVzIHRoZSB0aW1lciBmb3IgU3RhckZpdmUgSkg3MTEwIFNvQy4gT24gUklTQy1WIHBs
YXRmb3JtLAo+ICsJICB0aGUgc3lzdGVtIGhhcyBzdGFydGVkIFJJU0NWX1RJTUVSLCBidXQgeW91
IGNhbiBhbHNvIHVzZSB0aGlzIHRpbWVyCj4gKwkgIHdoaWNoIGNhbiBwcm92aWRlIGZvdXIgY2hh
bm5lbHMgdG8gZG8gYSBsb3QgbW9yZSB0aGluZ3Mgb24gSkg3MTEwIFNvQy4KPiArCj4gICBjb25m
aWcgQ0xJTlRfVElNRVIKPiAgIAlib29sICJDTElOVCBUaW1lciBmb3IgdGhlIFJJU0MtViBwbGF0
Zm9ybSIgaWYgQ09NUElMRV9URVNUCj4gICAJZGVwZW5kcyBvbiBHRU5FUklDX1NDSEVEX0NMT0NL
ICYmIFJJU0NWCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvTWFrZWZpbGUgYi9k
cml2ZXJzL2Nsb2Nrc291cmNlL01ha2VmaWxlCj4gaW5kZXggMzY4YzM0NjFkYWI4Li5iNjZhYzA1
ZWMwODYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS9NYWtlZmlsZQo+ICsrKyBi
L2RyaXZlcnMvY2xvY2tzb3VyY2UvTWFrZWZpbGUKPiBAQCAtODAsNiArODAsNyBAQCBvYmotJChD
T05GSUdfSU5HRU5JQ19USU1FUikJCSs9IGluZ2VuaWMtdGltZXIubwo+ICAgb2JqLSQoQ09ORklH
X0NMS1NSQ19TVF9MUEMpCQkrPSBjbGtzcmNfc3RfbHBjLm8KPiAgIG9iai0kKENPTkZJR19YODZf
TlVNQUNISVApCQkrPSBudW1hY2hpcC5vCj4gICBvYmotJChDT05GSUdfUklTQ1ZfVElNRVIpCQkr
PSB0aW1lci1yaXNjdi5vCj4gK29iai0kKENPTkZJR19TVEFSRklWRV9KSDcxMTBfVElNRVIpCSs9
IHRpbWVyLWpoNzExMC5vCj4gICBvYmotJChDT05GSUdfQ0xJTlRfVElNRVIpCQkrPSB0aW1lci1j
bGludC5vCj4gICBvYmotJChDT05GSUdfQ1NLWV9NUF9USU1FUikJCSs9IHRpbWVyLW1wLWNza3ku
bwo+ICAgb2JqLSQoQ09ORklHX0dYNjYwNVNfVElNRVIpCQkrPSB0aW1lci1neDY2MDVzLm8KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1qaDcxMTAuYyBiL2RyaXZlcnMv
Y2xvY2tzb3VyY2UvdGltZXItamg3MTEwLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAwMC4uNzFkZTI5YTNlYzkxCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZl
cnMvY2xvY2tzb3VyY2UvdGltZXItamg3MTEwLmMKPiBAQCAtMCwwICsxLDM4MCBAQAo+ICsvLyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsvKgo+ICsgKiBTdGFyZml2ZSBKSDcx
MTAgVGltZXIgZHJpdmVyCj4gKyAqCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMi0yMDIzIFN0YXJG
aXZlIFRlY2hub2xvZ3kgQ28uLCBMdGQuCj4gKyAqCj4gKyAqIEF1dGhvcjoKPiArICogWGluZ3l1
IFd1IDx4aW5neXUud3VAc3RhcmZpdmV0ZWNoLmNvbT4KPiArICogU2FtaW4gR3VvIDxzYW1pbi5n
dW9Ac3RhcmZpdmV0ZWNoLmNvbT4KPiArICovCj4gKwo+ICsjaW5jbHVkZSA8bGludXgvY2xrLmg+
Cj4gKyNpbmNsdWRlIDxsaW51eC9jbG9ja2NoaXBzLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9jbG9j
a3NvdXJjZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvZXJyLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9p
bnRlcnJ1cHQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2lvLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9p
b3BvbGwuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2lycS5oPgo+ICsjaW5jbHVkZSA8bGludXgva2Vy
bmVsLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiArI2luY2x1ZGUgPGxpbnV4L29m
Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3Bs
YXRmb3JtX2RldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KPiArI2luY2x1ZGUg
PGxpbnV4L3NjaGVkX2Nsb2NrLmg+CgpQbGVhc2UgZG91YmxlIGNoZWNrIHRoZSBoZWFkZXJzIGFu
ZCByZW1vdmUgdGhlIHBvaW50bGVzcyBvbmVzLgoKCj4gKy8qIEJpYXM6IENoMC0weDAsIENoMS0w
eDQwLCBDaDItMHg4MCwgYW5kIHNvIG9uLiAqLwo+ICsjZGVmaW5lIEpINzExMF9USU1FUl9DSF9M
RU4JCTB4NDAKPiArI2RlZmluZSBKSDcxMTBfVElNRVJfQ0hfQkFTRSh4KQkJKCh4KSAqIEpINzEx
MF9USU1FUl9DSF9MRU4pCj4gKyNkZWZpbmUgSkg3MTEwX1RJTUVSX0NIX01BWAkJNAo+ICsKPiAr
I2RlZmluZSBKSDcxMTBfQ0xPQ0tfU09VUkNFX1JBVElORwkyMDAKPiArI2RlZmluZSBKSDcxMTBf
VkFMSURfQklUUwkJMzIKPiArI2RlZmluZSBKSDcxMTBfREVMQVlfVVMJCQkwCj4gKyNkZWZpbmUg
Skg3MTEwX1RJTUVPVVRfVVMJCTEwMDAwCj4gKyNkZWZpbmUgSkg3MTEwX0NMT0NLRVZFTlRfUkFU
SU5HCTMwMAo+ICsjZGVmaW5lIEpINzExMF9USU1FUl9NQVhfVElDS1MJCTB4ZmZmZmZmZmYKPiAr
I2RlZmluZSBKSDcxMTBfVElNRVJfTUlOX1RJQ0tTCQkweGYKPiArI2RlZmluZSBKSDcxMTBfVElN
RVJfUkVMT0FEX1ZBTFVFCTAKPiArCj4gKyNkZWZpbmUgSkg3MTEwX1RJTUVSX0lOVF9TVEFUVVMJ
CTB4MDAgLyogUk9bMDo0XTogSW50ZXJydXB0IFN0YXR1cyBmb3IgY2hhbm5lbDB+NCAqLwo+ICsj
ZGVmaW5lIEpINzExMF9USU1FUl9DVEwJCTB4MDQgLyogUldbMF06IDAtY29udGludW91cyBydW4s
IDEtc2luZ2xlIHJ1biAqLwo+ICsjZGVmaW5lIEpINzExMF9USU1FUl9MT0FECQkweDA4IC8qIFJX
OiBsb2FkIHZhbHVlIHRvIGNvdW50ZXIgKi8KPiArI2RlZmluZSBKSDcxMTBfVElNRVJfRU5BQkxF
CQkweDEwIC8qIFJXWzBdOiB0aW1lciBlbmFibGUgcmVnaXN0ZXIgKi8KPiArI2RlZmluZSBKSDcx
MTBfVElNRVJfUkVMT0FECQkweDE0IC8qIFJXOiB3cml0ZSAxIG9yIDAgYm90aCByZWxvYWQgY291
bnRlciAqLwo+ICsjZGVmaW5lIEpINzExMF9USU1FUl9WQUxVRQkJMHgxOCAvKiBSTzogdGltZXIg
dmFsdWUgcmVnaXN0ZXIgKi8KPiArI2RlZmluZSBKSDcxMTBfVElNRVJfSU5UX0NMUgkJMHgyMCAv
KiBSVzogdGltZXIgaW50ZXJydXB0IGNsZWFyIHJlZ2lzdGVyICovCj4gKyNkZWZpbmUgSkg3MTEw
X1RJTUVSX0lOVF9NQVNLCQkweDI0IC8qIFJXWzBdOiB0aW1lciBpbnRlcnJ1cHQgbWFzayByZWdp
c3RlciAqLwo+ICsKPiArI2RlZmluZSBKSDcxMTBfVElNRVJfSU5UX0NMUl9FTkEJQklUKDApCj4g
KyNkZWZpbmUgSkg3MTEwX1RJTUVSX0lOVF9DTFJfQVZBX01BU0sJQklUKDEpCj4gKwo+ICtzdHJ1
Y3Qgamg3MTEwX2Nsa2V2dCB7Cj4gKwlzdHJ1Y3QgY2xvY2tfZXZlbnRfZGV2aWNlIGV2dDsKPiAr
CXN0cnVjdCBjbG9ja3NvdXJjZSBjczsKPiArCWJvb2wgY3NfaXNfdmFsaWQ7Cj4gKwlzdHJ1Y3Qg
Y2xrICpjbGs7Cj4gKwlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcnN0Owo+ICsJdTMyIHJhdGU7Cj4g
Kwl1MzIgcmVsb2FkX3ZhbDsKPiArCXZvaWQgX19pb21lbSAqYmFzZTsKPiArCWNoYXIgbmFtZVtz
aXplb2YoImpoNzExMC10aW1lci5jaFgiKV07Cj4gK307Cj4gKwo+ICtzdHJ1Y3Qgamg3MTEwX3Rp
bWVyX3ByaXYgewo+ICsJc3RydWN0IGNsayAqcGNsazsKPiArCXN0cnVjdCByZXNldF9jb250cm9s
ICpwcnN0Owo+ICsJc3RydWN0IGpoNzExMF9jbGtldnQgY2xrZXZ0W0pINzExMF9USU1FUl9DSF9N
QVhdOwoKV2h5IGRvIHlvdSBuZWVkIHNldmVyYWwgY2xvY2sgZXZlbnRzIGFuZCBjbG9jayBzb3Vy
Y2VzID8KClsgLi4uIF0KCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg
4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxo
dHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90
d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3Jn
L2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
