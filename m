Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08404EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 06:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WEEZJoe7I+lHs5v6E3Q/+ka0aKrS6iozIl6O2KUyl8=; b=zI+fC8SIskHfTO
	YQDvAILY5LSNVBff3twO2Hv9U3RXvp8yNPv/Rke2vk/c7GU7woSovr3QiTGmvSGEtVyQTA6b6eDrb
	nbDOTD77OYdDDlsdff3VDZKnhR8UI2OGRJ1iZgpw58RyrgSp72Lg3JypG13A1OeYhW7AOgJA4qVAg
	tQMrlhica01jQUN8El1aq8+I3QqLNjf4Q3wPqIaJ/KXjoNQy31M4a3wRWyYZ2rK3Jb6sV3OLBwYb4
	RLBvqaBJLEzL3a9cb1NlOxaDE8iX+ZTj6agdzjLTv94OXZalKwhBMMjfILyLGMOXgb3ObAxOWz2eb
	80Q864eXlxbjbFwwewVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHIQM-000dLf-04;
	Thu, 06 Jul 2023 06:25:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHIQG-000dKJ-2X
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 06:25:02 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-314313f127fso243056f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 23:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688624697; x=1691216697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmK8JROVVa8cXcfoU1tcKioXbFqka5rqn6GwgjmSHzI=;
        b=BZUStLrjb+CVfu9O0PBQXLZAWwmRpugb4UPi1jETsjk79i+UQ4NMv5cPq8nvfTOXDO
         SrGzIJKb4jgvGH2BQDJCtEOyw/0C1g0DyXVcdSzimIohzJs0zItofWOP8YAolVFramCv
         zPe4N4DVF1FMTCY9uYfd9BwJNU8bgHN1QtC9/SwBXonThR5IJ6qggggwcLBRq3mBMlv0
         TA3fFn11ADRWeF+kFhSs9xxI4BgUUN+cI0YiCkyrmF67m+Tw95EWYldY2dY9XA5M7wdb
         yoJu/Z0Hg5V850H9FEhUVQK5V6B3oc8CqL6W9367cmGqWwMT9Bg7SFgvRgSF7NOKp1Kt
         4g/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688624697; x=1691216697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmK8JROVVa8cXcfoU1tcKioXbFqka5rqn6GwgjmSHzI=;
        b=iE/4NAVetSXjWvnHgHBsOCdOEFQnQ3EJut3cZKEOoLY8om97vpkfSX7XKd5iwPeyDd
         SM6tIZ4GhNWA9FHfSKucbllNERKoDMWU9xDdqeph6GYhezNkIH8DzN1N2YRmDKLGizri
         4s0alLlzOS8eGzt3Rn7Db6boo8UM6pyhSwro/laIg03xLPtO/EOqR3HXH0FQRpHegWoj
         uml4UOnL+rBOXvF1fxKDPHkVW3xnmYiVE5/c1IdYSzDj5W2Jsom+vG6BPrgN9c7Cin9J
         zQG7aMvvm9cbF8qizYK4ER+Z3uF7UpXnIPV8sKLYyxFISiNUa5CzbL/Wm2LVwJq/uv3v
         CWOw==
X-Gm-Message-State: ABy/qLYLrXOzfhU+mnKA130g8LUnObXZPzOBmhbYTacFQegThLEwsm+1
	CiGPwaayzh/rAYOkyhukDUnFYERUpUXhqgSoByCiDw==
X-Google-Smtp-Source: APBJJlGCbQSscD3J4zU2LybpPeyh6sErh2NjQ91rqSP1OSDL0YqnkrhTZH9VgepEXOd6j7o74TW2PpGZhj2mjamraqE=
X-Received: by 2002:a5d:568f:0:b0:314:5376:f0d6 with SMTP id
 f15-20020a5d568f000000b003145376f0d6mr367792wrv.52.1688624697342; Wed, 05 Jul
 2023 23:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230705114251.661-1-cuiyunhui@bytedance.com> <20230705114251.661-5-cuiyunhui@bytedance.com>
 <20230705-oblivious-unstuffed-8e028a5b243c@spud> <CAEEQ3wmG1OiE3GFqQp9SP+oKUbTfuTPx=rNGd-sjKsW7vv3bew@mail.gmail.com>
 <07f88065-b9ca-5233-4048-5e61e1cdbe0c@linaro.org>
In-Reply-To: <07f88065-b9ca-5233-4048-5e61e1cdbe0c@linaro.org>
From: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date: Thu, 6 Jul 2023 14:24:46 +0800
Message-ID: <CAEEQ3wmY3YrdBEZ_V0+rC-3zbMLRgnL3xt-RtwzPxev5P2h48g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 4/4] dt-bindings: firmware: Document
 ffitbl binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_232500_831279_CB0DFDA9 
X-CRM114-Status: GOOD (  26.95  )
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
Cc: mark.rutland@arm.com, allen-kh.cheng@mediatek.com, rafael@kernel.org, lpieralisi@kernel.org, jdelvare@suse.com, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, ardb@kernel.org, geshijian@bytedance.com, tinghan.shen@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-acpi@vger.kernel.org, lenb@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, robh+dt@kernel.org, paul.walmsley@sifive.com, angelogioacchino.delregno@collabora.com, weidong.wd@bytedance.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, rminnich@gmail.com, palmer@dabbelt.com, yc.hung@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgS3J6eXN6dG9mLAoKT24gVGh1LCBKdWwgNiwgMjAyMyBhdCAyOjAx4oCvUE0gS3J6eXN6dG9m
IEtvemxvd3NraQo8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9u
IDA2LzA3LzIwMjMgMDU6NDMsIOi/kOi+ieW0lCB3cm90ZToKPiA+IEhpIENvbm9yLAo+ID4KPiA+
IEFkZGVkIGR0cyBNYWludGFpbmVycywKPiA+Cj4gPiBPbiBXZWQsIEp1bCA1LCAyMDIzIGF0IDEx
OjA34oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+Pgo+ID4+
IEhleSwKPiA+Pgo+ID4+IE9uIFdlZCwgSnVsIDA1LCAyMDIzIGF0IDA3OjQyOjUxUE0gKzA4MDAs
IFl1bmh1aSBDdWkgd3JvdGU6Cj4gPj4+IEFkZCB0aGUgZGVzY3JpcHRpb24gZm9yIGZmaXRibCBz
dWJub2RlLgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlA
Ynl0ZWRhbmNlLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9m
aXJtd2FyZS9mZml0YmwudHh0ICAgfCAyNyArKysrKysrKysrKysrKysrKysrCj4gPj4+ICBNQUlO
VEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gPj4+ICAy
IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykKPiA+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvZmZpdGJsLnR4dAo+
ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Zpcm13YXJlL2ZmaXRibC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZmlybXdhcmUvZmZpdGJsLnR4dAo+ID4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+PiBpbmRl
eCAwMDAwMDAwMDAwMDAuLmM0MjM2ODYyNjE5OQo+ID4+PiAtLS0gL2Rldi9udWxsCj4gPj4+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS9mZml0YmwudHh0
Cj4gPj4KPiA+PiBGaXJzdGx5LCBuZXcgZHQtYmluZGluZ3MgbmVlZCB0byBiZSBkb25lIGluIHlh
bWwsIG5vdCBpbiB0ZXh0IGZvcm0uCj4gPj4gU2Vjb25kbHksIHlvdSBkaWRuJ3QgcmUtcnVuIGdl
dF9tYWludGFpbmVyLnBsIGFmdGVyIGFkZGluZyB0aGlzIGJpbmRpbmcsCj4gPj4gc28geW91IGhh
dmUgbm90IENDZWQgYW55IG9mIHRoZSBvdGhlciBkdC1iaW5kaW5nIG1haW50YWluZXJzIG5vciB0
aGUKPiA+PiBkZXZpY2V0cmVlIG1haWxpbmcgbGlzdC4KPiA+Cj4gPiBSZS1ydW4gZ2V0X21haW50
YWluZXIucGwgYW5kIGFkZGVkIG1haW50YWluZXJzIGludG8gdGhlIG1haWxsaXN0Lgo+Cj4KPiBU
aGlzIGRvZXMgbm90IHdvcmsgbGlrZSB0aGlzLgo+Cj4gUGxlYXNlIHVzZSBzY3JpcHRzL2dldF9t
YWludGFpbmVycy5wbCB0byBnZXQgYSBsaXN0IG9mIG5lY2Vzc2FyeSBwZW9wbGUKPiBhbmQgbGlz
dHMgdG8gQ0MuICBJdCBtaWdodCBoYXBwZW4sIHRoYXQgY29tbWFuZCB3aGVuIHJ1biBvbiBhbiBv
bGRlcgo+IGtlcm5lbCwgZ2l2ZXMgeW91IG91dGRhdGVkIGVudHJpZXMuICBUaGVyZWZvcmUgcGxl
YXNlIGJlIHN1cmUgeW91IGJhc2UKPiB5b3VyIHBhdGNoZXMgb24gcmVjZW50IExpbnV4IGtlcm5l
bC4KPgo+IFlvdSBtaXNzZWQgYXQgbGVhc3QgRFQgbGlzdCAobWF5YmUgbW9yZSksIHNvIHRoaXMg
d29uJ3QgYmUgdGVzdGVkIGJ5IG91cgo+IHRvb2xzLiBQZXJmb3JtaW5nIHJldmlldyBvbiB1bnRl
c3RlZCBjb2RlIG1pZ2h0IGJlIGEgd2FzdGUgb2YgdGltZSwgdGh1cwo+IEkgd2lsbCBza2lwIHRo
aXMgcGF0Y2ggZW50aXJlbHkgdGlsbCB5b3UgZm9sbG93IHRoZSBwcm9jZXNzIGFsbG93aW5nIHRo
ZQo+IHBhdGNoIHRvIGJlIHRlc3RlZC4KPgo+IFBsZWFzZSBraW5kbHkgcmVzZW5kIGFuZCBpbmNs
dWRlIGFsbCBuZWNlc3NhcnkgVG8vQ2MgZW50cmllcy4KClRoaXMgc2V0IG9mIHBhdGNoZXMgaXMg
YXBwbGllZCBvbiB0aGUgdGFnIG5leHQtMjAyMzA3MDYsIGFuZCB0bwpnZW5lcmF0ZSB0aGUgbWFp
bCBsaXN0IGJ5IHNjcmlwdHMvZ2V0X21haW50YWluZXJzLnBsIG9uIHRoZSB0YWcKCi4vc2NyaXB0
cy9nZXRfbWFpbnRhaW5lci5wbAouLi9yaXNjdi9saW51eC92My0wMDA0LWR0LWJpbmRpbmdzLWZp
cm13YXJlLURvY3VtZW50LWZmaXRibC1iaW5kaW5nLnBhdGNoCll1bmh1aSBDdWkgY3VpeXVuaHVp
QGJ5dGVkYW5jZS5jb20gKG1haW50YWluZXI6RkRUIEZJUk1XQVJFIElOVEVSRkFDRSAoRkZJKSkK
Um9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4gKG1haW50YWluZXI6T1BFTiBGSVJNV0FS
RSBBTkQKRkxBVFRFTkVEIERFVklDRSBUUkVFIEJJTkRJTkdTKQpLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+CihtYWludGFpbmVyOk9QRU4gRklS
TVdBUkUgQU5EIEZMQVRURU5FRCBERVZJQ0UgVFJFRSBCSU5ESU5HUykKQ29ub3IgRG9vbGV5IDxj
b25vcitkdEBrZXJuZWwub3JnPiAobWFpbnRhaW5lcjpPUEVOIEZJUk1XQVJFIEFORApGTEFUVEVO
RUQgREVWSUNFIFRSRUUgQklORElOR1MpCmRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnIChvcGVu
IGxpc3Q6T1BFTiBGSVJNV0FSRSBBTkQgRkxBVFRFTkVECkRFVklDRSBUUkVFIEJJTkRJTkdTKQps
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIChvcGVuIGxpc3QpCgpXaGF0IGFtIEkgbWlzc2lu
ZyA/CgoKPiA+IGVtbS4uIFRoZXJlIGlzIHNvbWUgKnR4dCBpbgo+ID4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlLywgaXNuJ3QgaXQ/Cj4KPiBBbmQgd2hhdCBhYm91
dCBpdD8gRG8geW91IGNsYWltIHRoZXkgd2VyZSBhZGRlZCByZWNlbnRseT8KPgo+IEJlc3QgcmVn
YXJkcywKPiBLcnp5c3p0b2YKPgoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
