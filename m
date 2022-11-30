Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F97C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 18:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DlKCj/dZCQlTOI+eWtNHby+D98rIx0uRhfFx0bMTCSo=; b=A5afFXyt2AiUTs
	CzXb46PuOf6J6tRiILHWNGgniEx903nV6/WbDWQEKHZQg8827exncASeFRiHmVrbaM5HiQv/dWuul
	ViPnpqNxO4Sl9MguNl1YW/xifglvOuIYiM7RMcgkTJElwsZf8euoyjIrO4bfPz+tYJ5jngUlyKykU
	8x9zcoKzJTmcqoRcrk5MJZ9d5W06hRit2DXavEiMLjm4q0T+P32Ast6gSMB77aIDkasSK8kjw9xeV
	Ig5VKPsamBl8RvQMXqGJ0Zo98mETRB34r3HwnVauB2JwxV43Itp8zS+9+Jq8nekLODcpZSyD3sb+0
	dLR9RjVrtHCNs3e3q7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0RaT-001SRD-OV; Wed, 30 Nov 2022 18:13:37 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0RaQ-001SNP-91
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 18:13:35 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-14263779059so22002777fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 10:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhAn2x63WZZ68iA2xviSqQVQpPqaz48S48picAsw7I0=;
        b=MxnbqH9ImVpm2Omcdngqqsskh1AGO/tv3fUpRKzlHP34X1m6dQF3tGEIXNDHUIvTxl
         c+lEXdequRnVV/7cg0e40i4pU9zakn4SWxpFfey+XRORcwyrM6Oi6FT8k0APK0COxtFI
         gv15NVewiQxQEK9FhwON5DjyUfCujaxLtWsHf+qza9NbEM6btFna1eilEx3f+u6Qf8Wz
         bhOoWjRFB/1Lwg7zVIjxHRFleANv7neXxkFYrs6QdN7OvidplVyzsjSdWC/y8VRnEoH5
         2vA9WVoVy3bvJxHLSEBbDCOQggeKXpPtWqTAybW/afnGca6cns1Vw9XCDjTUbzaUsnSF
         JljA==
X-Gm-Message-State: ANoB5pmoKZAV6mDggUy7b+LD1iHMyU0Hbe8YaYWZN7cMLrCVOwakmVTH
	he0xSYD97KZyKBxBEz77jg==
X-Google-Smtp-Source: AA0mqf6raFDKZhDuGHQdIUhYEFvXW5J36XxEkr5d0/apxVs4KAL5KdUum5LGSusaNhZUvpkRMlSBgw==
X-Received: by 2002:a05:6870:f110:b0:13b:7793:444c with SMTP id k16-20020a056870f11000b0013b7793444cmr35151635oac.59.1669832011901;
        Wed, 30 Nov 2022 10:13:31 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v13-20020a4aaecd000000b0049fd5c02d25sm990051oon.12.2022.11.30.10.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 10:13:31 -0800 (PST)
Received: (nullmailer pid 2552194 invoked by uid 1000);
	Wed, 30 Nov 2022 18:13:30 -0000
Date: Wed, 30 Nov 2022 12:13:30 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: timer: sifive,clint: add compatible for
 OpenC906
Message-ID: <20221130181330.GA2544489-robh@kernel.org>
References: <20221121041757.418645-1-uwu@icenowy.me>
 <20221121041757.418645-3-uwu@icenowy.me>
 <98005150-83a7-5439-0db1-d93d459c3809@linaro.org>
 <b924d37d716fa8b1fd93102b1d51fac221f43d59.camel@icenowy.me>
 <d0f3ce4f-5676-f5e1-f04f-dd069679b2d3@linaro.org>
 <81C2234E-C92D-4F78-8295-7C6DD0A9BBC4@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81C2234E-C92D-4F78-8295-7C6DD0A9BBC4@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_101334_396057_ED2080CB 
X-CRM114-Status: GOOD (  21.88  )
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

T24gVHVlLCBOb3YgMjIsIDIwMjIgYXQgMDM6NDE6MjdQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiAKPiAKPiDkuo4gMjAyMuW5tDEx5pyIMjLml6UgR01UKzA4OjAwIOS4i+WNiDM6MzU6
NDgsIEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4g
5YaZ5YiwOgo+ID5PbiAyMi8xMS8yMDIyIDA4OjE4LCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+ID4+
IOWcqCAyMDIyLTExLTIx5pif5pyf5LiA55qEIDExOjA2ICswMTAw77yMS3J6eXN6dG9mIEtvemxv
d3NraeWGmemBk++8mgo+ID4+PiBPbiAyMS8xMS8yMDIyIDA1OjE3LCBJY2Vub3d5IFpoZW5nIHdy
b3RlOgo+ID4+Pj4gVC1IZWFkIE9wZW5DOTA2IGlzIGEgb3Blbi1zb3VyY2UtbGljZW5zZWQgZml4
ZWQtY29uZmlndXJhdGlvbiBvZgo+ID4+Pj4gQzkwNiwKPiA+Pj4+IHdoaWNoIGlzIG5vdyBwdWJs
aWMgYW5kIGFibGUgdG8gYmUgaW50ZWdyYXRlZC4KPiA+Pj4+Cj4gPj4+PiBBZGQgYSBjb21wYXRp
YmxlIGZvciB0aGUgQ0xJTlQgc2hpcHBlZCBhcyBwYXJ0IG9mIE9wZW5DOTA2LCB3aGljaAo+ID4+
Pj4gc2hvdWxkCj4gPj4+PiBqdXN0IGJlIG9yZGluYXJ5IEM5eHggQ0xJTlQuCj4gPj4+Pgo+ID4+
Pj4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4gPj4+PiAt
LS0KPiA+Pj4+IMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2
ZSxjbGludC55YW1sIHwgMSArCj4gPj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQKPiA+Pj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4gPj4+PiBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbAo+ID4+Pj4gaW5k
ZXggYWFkYTY5NTcyMTZjLi44NjcwM2U5OTVlMzEgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPiA+Pj4+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xp
bnQueWFtbAo+ID4+Pj4gQEAgLTM1LDYgKzM1LDcgQEAgcHJvcGVydGllczoKPiA+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IHNpZml2ZSxjbGludDAKPiA+Pj4+IMKgwqDCoMKgwqDC
oCAtIGl0ZW1zOgo+ID4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOgo+ID4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gdGhlYWQsb3BlbmM5MDYtY2xpbnQKPiA+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbGx3aW5uZXIsc3VuMjBpLWQxLWNsaW50Cj4g
Pj4+Cj4gPj4+IEFkZCBlbnRyaWVzIHNvcnRlZCBhbHBoYWJldGljYWxseS4gVGhpcyBzaG91bGQg
YmUgc3F1YXNoZWQgd2l0aAo+ID4+PiBwcmV2aW91cwo+ID4+PiBwYXRjaC4KPiA+PiAKPiA+PiBJ
IG1ha2UgaXQgYSBzZXBlcmF0ZWQgcGF0Y2ggYmVjYXVzZSBJIHRoaW5rIGl0J3MgYSBxdWVzdGlv
bmFibGUKPiA+PiBhcHByb2FjaC4KPiA+PiAKPiA+PiBJZiB5b3UgdGhpbmsgaXQncyBva2F5LCBJ
IHdpbGwganVzdCBzcXVhc2ggaXQgYW5kIHB1dCBpdCBhcyB0aGUgc2Vjb25kCj4gPj4gcGF0Y2gg
aW4gdGhlIG5leHQgaXRlcmF0aW9uLCB3aXRoIGFkZGluZyBvcGVuYzkwNi1wbGljIGFzIHRoZSBm
aXJzdAo+ID4+IG9uZS4KPiA+Cj4gPldoYXQgaXMgYSBxdWVzdGlvbmFibGUgYXBwcm9hY2g/IFdo
eSBjb21taXQgbXNnIGlzIG5vdCBzYXlpbmcgdGhpcz8KPiAKPiBBaCBJIG1lbnRpb25lZCBpdCBp
biB0aGUgY292ZXIgbGV0dGVyLiBUaGUgcHJvYmxlbSBpcyBqdXN0IEkgZG91YnQgd2hldGhlcgo+
IGJpbmRpbmcgc3RyaW5ncyBmb3Igc2luZ2xlIFNvQ3MgYXJlIG5lY2Vzc2FyeS4KClRoZXkgYXJl
LgoKVW5sZXNzIGFsbCB0aGUgcXVpcmtzL2J1Z3MvZmVhdHVyZXMgYXJlIHNvbWVob3cgZ3VhcmFu
dGVlZCB0byBiZSBleGFjdGx5IAp0aGUgc2FtZSBhcyBvdGhlciBTb0NzIHNoYXJpbmcgdGhlIHNh
bWUgY29tcGF0aWJsZSBzdHJpbmcsIG9yIHRoZXJlIGlzIAphbm90aGVyIG1lY2hhbmlzbSB0byBp
ZGVudGlmeSB0aGUgZXhhY3QgdmVyc2lvbiAoZS5nLiBhIHZlcnNpb24gCnJlZ2lzdGVyKS4KClJv
YgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
