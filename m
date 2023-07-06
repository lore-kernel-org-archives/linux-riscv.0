Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044C3EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 06:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/9OlcUF84uknv1a9TI8DJD/zc7rQitb1n0kAwXMVEt0=; b=TsqSbqTKeaIagW
	5x1+VGH+74y+Zoq0EADSNWzQf91H5ou3aJqvKOlsUyCjyd3Wi7/RDchtJ4khZF4NvTHeB7woyNZrx
	HYAoygq4/G4iAUaOzRBNMLDt5gibxZu0kwe2IE0R7hni6u72hG1CLHVrJteAM+FdTj9s8V1cWfqSe
	fwW3t9DtDPfs4z1gw6flcMJbliSwx9PBrlAYhxm8QIFkxgdTtBJciD+N0DaN+m7kTnsFLi45BzCke
	mr6J35ynR07Lh45GviscwBeeBNZ7+MHBrDP/Htdu+/ly90rYeMFwKNF1QbjsUDRvSe1i/lzpu1OeW
	zkXD7cJqXgDu0D8L4zOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHI3B-000Z4t-0P;
	Thu, 06 Jul 2023 06:01:09 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHI35-000Z3G-0H
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 06:01:07 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51d804c7d14so441227a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 23:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688623261; x=1691215261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7IAKmZHpstgstqx8FAeUwkTSQ0YmTIrDH6WIMSRhwcY=;
        b=I+M6QmPKGCRnEMfzENftg1TPHKCy0ZddPOOkuPSprjcIYMG32ZPZwdNQmIDaz39CqC
         PUuZFYNca1tM8oMzE5yGQ8riLsfiR2GR7weI4pkImN7TkMMOt6Kj/VVloFJosJjRqxWz
         vx+Tanp3cJhgfzpc/VGl3eDl6zuGThgTEwVVAc0/8/VC7hZGdaQEFwMY2KdWmdqPoRoS
         4Z0+W8za3G6mAHq0HbYjaCod6eE4FFVc7SZjnGhnNSc2Rr3P0fENVP72xM8imSj3zBiA
         hidsH7MsPEZy/nSXa7FKuqUQcKb4UiGgeR+/3K1ITTql1bF4nHma57iBD3S4yLvbqNIu
         Voeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688623261; x=1691215261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7IAKmZHpstgstqx8FAeUwkTSQ0YmTIrDH6WIMSRhwcY=;
        b=FKbhwBDyUfhKRG5j60zIuuI8NIM/IG35v7hwydKA+umHPhHJHq2hrF/Qh6jgMING77
         kWkEEUZ85eEkL7IxIv/CPKIhgL0trvuh7izFczzUxOEove2AlfSe0cyGkHYQOgTqOj2f
         H4d72zUbjoeLSJr7qpzmfRZcWn07VCo30AY07KPtvuaIRam7nrdR6wuumlyAHaUQCZlm
         PnytDywQPFkmDxr6W3vFJg+rLxGbM7E314QVotXiDLXaTQnCAoTUlj2MoFdfUdv1ZX0x
         qqNwi+db9lk8RvYboE1Ji7stoaj3xFQm4a89oJIRU0UGVQvSefbp8uyYx70pcZAHLiop
         ob9g==
X-Gm-Message-State: ABy/qLbeWCUiRagftPryhJMCCTshRWf4Hfqy6gdj+jwnoTLr+hdQ8Bdm
	iDNVQcUGkHBIj1/6xd7joJR46w==
X-Google-Smtp-Source: APBJJlGxMHI90Bj2KGx+EfXktGS5VOrAEQgqjBzOj+qrgtBRqIHvMlZpEqUF1J65EJCW7Rgcnxk+4A==
X-Received: by 2002:aa7:d70f:0:b0:51e:10d8:e011 with SMTP id t15-20020aa7d70f000000b0051e10d8e011mr815168edq.24.1688623260799;
        Wed, 05 Jul 2023 23:01:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id m18-20020aa7d352000000b0051e27ebb1b3sm343191edr.34.2023.07.05.23.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 23:01:00 -0700 (PDT)
Message-ID: <07f88065-b9ca-5233-4048-5e61e1cdbe0c@linaro.org>
Date: Thu, 6 Jul 2023 08:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [External] Re: [PATCH v3 4/4] dt-bindings: firmware: Document
 ffitbl binding
To: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>,
 Conor Dooley <conor@kernel.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20230705114251.661-1-cuiyunhui@bytedance.com>
 <20230705114251.661-5-cuiyunhui@bytedance.com>
 <20230705-oblivious-unstuffed-8e028a5b243c@spud>
 <CAEEQ3wmG1OiE3GFqQp9SP+oKUbTfuTPx=rNGd-sjKsW7vv3bew@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAEEQ3wmG1OiE3GFqQp9SP+oKUbTfuTPx=rNGd-sjKsW7vv3bew@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_230103_171976_BDC8BA75 
X-CRM114-Status: GOOD (  17.16  )
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
Cc: mark.rutland@arm.com, jdelvare@suse.com, aou@eecs.berkeley.edu, weidong.wd@bytedance.com, allen-kh.cheng@mediatek.com, rafael@kernel.org, geshijian@bytedance.com, lpieralisi@kernel.org, yc.hung@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org, rminnich@gmail.com, palmer@dabbelt.com, paul.walmsley@sifive.com, tinghan.shen@mediatek.com, linux-riscv@lists.infradead.org, angelogioacchino.delregno@collabora.com, linux-acpi@vger.kernel.org, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDYvMDcvMjAyMyAwNTo0Mywg6L+Q6L6J5bSUIHdyb3RlOgo+IEhpIENvbm9yLAo+IAo+IEFk
ZGVkIGR0cyBNYWludGFpbmVycywKPiAKPiBPbiBXZWQsIEp1bCA1LCAyMDIzIGF0IDExOjA34oCv
UE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gSGV5LAo+Pgo+
PiBPbiBXZWQsIEp1bCAwNSwgMjAyMyBhdCAwNzo0Mjo1MVBNICswODAwLCBZdW5odWkgQ3VpIHdy
b3RlOgo+Pj4gQWRkIHRoZSBkZXNjcmlwdGlvbiBmb3IgZmZpdGJsIHN1Ym5vZGUuCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4+PiAt
LS0KPj4+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS9mZml0YmwudHh0ICAgfCAy
NyArKysrKysrKysrKysrKysrKysrCj4+PiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwo+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9u
cygrKQo+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZmlybXdhcmUvZmZpdGJsLnR4dAo+Pj4KPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvZmZpdGJsLnR4dCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS9mZml0YmwudHh0Cj4+PiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jNDIzNjg2MjYxOTkKPj4+IC0tLSAv
ZGV2L251bGwKPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJt
d2FyZS9mZml0YmwudHh0Cj4+Cj4+IEZpcnN0bHksIG5ldyBkdC1iaW5kaW5ncyBuZWVkIHRvIGJl
IGRvbmUgaW4geWFtbCwgbm90IGluIHRleHQgZm9ybS4KPj4gU2Vjb25kbHksIHlvdSBkaWRuJ3Qg
cmUtcnVuIGdldF9tYWludGFpbmVyLnBsIGFmdGVyIGFkZGluZyB0aGlzIGJpbmRpbmcsCj4+IHNv
IHlvdSBoYXZlIG5vdCBDQ2VkIGFueSBvZiB0aGUgb3RoZXIgZHQtYmluZGluZyBtYWludGFpbmVy
cyBub3IgdGhlCj4+IGRldmljZXRyZWUgbWFpbGluZyBsaXN0Lgo+IAo+IFJlLXJ1biBnZXRfbWFp
bnRhaW5lci5wbCBhbmQgYWRkZWQgbWFpbnRhaW5lcnMgaW50byB0aGUgbWFpbGxpc3QuCgoKVGhp
cyBkb2VzIG5vdCB3b3JrIGxpa2UgdGhpcy4KClBsZWFzZSB1c2Ugc2NyaXB0cy9nZXRfbWFpbnRh
aW5lcnMucGwgdG8gZ2V0IGEgbGlzdCBvZiBuZWNlc3NhcnkgcGVvcGxlCmFuZCBsaXN0cyB0byBD
Qy4gIEl0IG1pZ2h0IGhhcHBlbiwgdGhhdCBjb21tYW5kIHdoZW4gcnVuIG9uIGFuIG9sZGVyCmtl
cm5lbCwgZ2l2ZXMgeW91IG91dGRhdGVkIGVudHJpZXMuICBUaGVyZWZvcmUgcGxlYXNlIGJlIHN1
cmUgeW91IGJhc2UKeW91ciBwYXRjaGVzIG9uIHJlY2VudCBMaW51eCBrZXJuZWwuCgpZb3UgbWlz
c2VkIGF0IGxlYXN0IERUIGxpc3QgKG1heWJlIG1vcmUpLCBzbyB0aGlzIHdvbid0IGJlIHRlc3Rl
ZCBieSBvdXIKdG9vbHMuIFBlcmZvcm1pbmcgcmV2aWV3IG9uIHVudGVzdGVkIGNvZGUgbWlnaHQg
YmUgYSB3YXN0ZSBvZiB0aW1lLCB0aHVzCkkgd2lsbCBza2lwIHRoaXMgcGF0Y2ggZW50aXJlbHkg
dGlsbCB5b3UgZm9sbG93IHRoZSBwcm9jZXNzIGFsbG93aW5nIHRoZQpwYXRjaCB0byBiZSB0ZXN0
ZWQuCgpQbGVhc2Uga2luZGx5IHJlc2VuZCBhbmQgaW5jbHVkZSBhbGwgbmVjZXNzYXJ5IFRvL0Nj
IGVudHJpZXMuCgo+IGVtbS4uIFRoZXJlIGlzIHNvbWUgKnR4dCBpbgo+IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS8sIGlzbid0IGl0PwoKQW5kIHdoYXQgYWJvdXQg
aXQ/IERvIHlvdSBjbGFpbSB0aGV5IHdlcmUgYWRkZWQgcmVjZW50bHk/CgpCZXN0IHJlZ2FyZHMs
CktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
