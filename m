Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C48ED3F078
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=psBQp2QnmQ1UtPPpPJuTCq2F7TWeW8NO2UDDTd78ZSc=; b=cHXLhoz+RQR2U0
	4sT0sBMgvXGlyoNmQJsvSoZ+J3fZ4B4isAXqFjcxw1cR6cSdnTldcaODOEroA1CJV2mIxy7vOIwcG
	Qhmx/d3T9QSLmu5zZW5gZbLEnqHWb8PYhOoXnnJbB/+2sislwwa1NZY4YiekbF96udG1pNAUYua5J
	FM9pynGlDm6aze0yZ70iubZdpUH/JONkwLU/QkR9ZJYVeBmSfLu1DLzpXCw+P3yXWFV9Nlg5RLYkq
	xHBqsbEGIXSMFC2qydRCu1Oygaj3LDDLyDQMY3HEeztk3opL+rZPDfxr48b7puLiTUd1YD4x+4wy0
	ZF5iUn+l+YsOznPe2n6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6v3-0000000GDHq-1Bjg;
	Wed, 28 Jan 2026 14:53:21 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6uz-0000000GDHR-3TSu
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 14:53:19 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-45effa36208so723151b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 06:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769611996; x=1770216796; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qmii9fWK0qOIPGEwrFV10/Zom1WAYNaPXJlgvztgTOE=;
        b=CPin3zOtO266ZFHP8qigqF0cpO7Q0D6oUh1JPvhAz4wRD+6MtMWW+lxRAEO9JjHl79
         Bs3Fnd168k9IdZ6AOtlM/R825I3eYId9JthOF8us3vagKGBxV+YQ/y/pYfVBOli2RS4T
         MVz3hggmvw9Wq7iz3CbX8ghtwveo6ZkUbJpmXoNZipmrQ4QXc2K701YVprgACDCPQuYP
         uQg65hp8eDLFaWe2L4qCmdws+0btT8YaXSKto3eigATC4a6/uWZ9emzwGfOBX+F48gMN
         aNxCxUR3CShtp6xlcx7sMrxMl/sx8w/CaVh7UgTMbkU9LJH0HfjpqcXrNQ0cyx497pYK
         /cpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769611996; x=1770216796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qmii9fWK0qOIPGEwrFV10/Zom1WAYNaPXJlgvztgTOE=;
        b=jSN0iaiiouTkRVfBAMzc1Q/9iTtTAa7WYgMx+7qVmDhWhPaH6X3xUt+QUKLTf/bQ9u
         NTnW0U/5Py4SlX7qd3ifPoByK+yAeiTodlscrrBPs9DdTanrdbcEeWa7j0V/5Bf0YQiw
         9Y+QwJIy/st0TB0NTxJsS21PyXzZZpNfMaH+Gf/1xU8CRjeoIwDsPkqAhIy1Xgn8pjXT
         Ar0aFm4xq0/F04T4T3+eQuhQesFFQ35txv8f7dhIX82wwEX7jihcm3OX4AkRHwJc+9jH
         K8gYeCSN3rPd/ZWiXXDoiL0BUJJCx7H67Vucy4kaep9CzVjgQSuGiXWwnY6SRbmTLTOZ
         5BPg==
X-Forwarded-Encrypted: i=1; AJvYcCXuIcIGuJf1pJK63Z7Y7LK2KlmkMr08j0iM1w0bAKQBewAt2z/XVfcaKJi4fSL3TD01+0JU74ZMTn+eFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIpwA5KTuWSgyP8q9p519zQozgCjwFR4fAmvOfeipaJ2OvbI3B
	pd/bd1x2SCaQzzvw/QyhuLjQMmwyXX5AzLrb1krcrPx7tCTkSj+RBk0jUmihqWQQz4g=
X-Gm-Gg: AZuq6aISmYKSitgG6k8onBr+up/Z0gU4jZZ5uFBTPFC7CbOMwa23CGh1k9zorlv9AKl
	TaFgP9pfaySSZUJQrIGLaL8YEhDOLI2cOKlPh8uyBt5ctRwbFTr/ZuclEduEomiPmHOS3ST0NAz
	znJ0xCZUu5Zoa4tk9319x+JUv6KtXuUgwC33gJ2/l6h57ywiEMH7QOfdXMGciV4N+R92W+QYa9I
	zclbYF+kyoN0dnMGa8zbLfrZVUqWK15ND4HcdRzPjpHEROfI5xFAAPv86Y+8w9Drs2NLx+VxZ/N
	TecF+FsPnAliKuHP4lh+VIlkDFqvL1flBvU6MB19tZrB85nwAPPE2RqeoiZNP+Entn6PiDoRppc
	WsMgs+gnouI0x1mvJ3DQ9wR6GYUoRPZfc4e0ij/vB1mi0tRUQSaQka4T1GfICuhfCY/Xxu0X/Tf
	IGxMstS8lO5f6GwlkHimBhzqxQQU+9aKSOumM3LBKmOvMMGlpG7UFmSjtE6U2NMw==
X-Received: by 2002:a05:6808:23cd:b0:45c:a28e:63a5 with SMTP id 5614622812f47-45efc49c5b9mr2979856b6e.9.1769611982108;
        Wed, 28 Jan 2026 06:53:02 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45f08fb3887sm1365549b6e.20.2026.01.28.06.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 06:53:01 -0800 (PST)
Message-ID: <4817d35e-cbca-4b59-ac4b-5f47bde86077@riscstar.com>
Date: Wed, 28 Jan 2026 08:53:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] regulator: spacemit-p1: Update supply names
To: Guodong Xu <guodong@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Yixun Lan <dlan@gentoo.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-3-2c86b06694ba@riscstar.com>
 <4395bea9-44d7-4f0f-81d6-c1e05976a308@riscstar.com>
 <CAH1PCMa_wxX_0YX0=3uMpKpE2FQ=COPafAL-tyJv3Y9kjdAujQ@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAH1PCMa_wxX_0YX0=3uMpKpE2FQ=COPafAL-tyJv3Y9kjdAujQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_065317_876785_2815D28A 
X-CRM114-Status: GOOD (  25.24  )
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

T24gMS8yOC8yNiA4OjQ3IEFNLCBHdW9kb25nIFh1IHdyb3RlOgo+IEhpLCBBbGV4Cj4gCj4gT24g
V2VkLCBKYW4gMjgsIDIwMjYgYXQgOToyOeKAr1BNIEFsZXggRWxkZXIgPGVsZGVyQHJpc2NzdGFy
LmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIDEvMjMvMjYgNjoyMCBQTSwgR3VvZG9uZyBYdSB3cm90ZToK
Pj4+IFVwZGF0ZSBzdXBwbHkgbmFtZXMgdG8gbWF0Y2ggdGhlIFAxIFBNSUMncyBhY3R1YWwgaGFy
ZHdhcmUgcGlub3V0IHdoZXJlCj4+PiBlYWNoIGJ1Y2sgaGFzIGFuIGluZGl2aWR1YWwgVklOIHBp
biAodmluMS12aW42KSBhbmQgTERPIGdyb3VwcyBoYXZlCj4+PiBkZWRpY2F0ZWQgaW5wdXQgcGlu
cyAoYWxkb2luLCBkbGRvaW4xLCBkbGRvaW4yKS4KPj4+Cj4+PiBUaGUgc3VwcGx5IGlzIGEgYm9h
cmQgZGVzaWduIGRlY2lzaW9uIGFuZCBzaG91bGQgbm90IGJlIGhhcmRjb2RlZCB0byBhbnkKPj4+
IGV4aXN0aW5nIHBvd2VyIHNvdXJjZS4gVGhpcyBhbGxvd3MgYm9hcmRzIHRvIHNwZWNpZnkgdGhl
aXIgYWN0dWFsIHBvd2VyCj4+PiB0cmVlIHRvcG9sb2d5IGluIGRldmljZXRyZWUuCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4+Cj4+IFRo
ZXNlIGFyZSBnb29kIGNoYW5nZXMgYnV0IEkgaGF2ZSBhIHN1Z2dlc3Rpb24gb24gdGhlIHdheQo+
PiB5b3UgZGVmaW5lIHRoZSBETERPIGRlc2NyaXB0b3JzLiAgSSBtaWdodCBiZSBtaXN0YWtlbiBi
dXQKPj4gSSB0aGluayB5b3Ugc2hvdWxkIG1ha2UgdGhpcyBjaGFuZ2UuCj4+Cj4+IEFzaWRlIGZy
b20gdGhhdDoKPj4KPj4gUmV2aWV3ZWQtYnk6IEFsZXggRWxkZXIgPGVsZGVyQHJpc2NzdGFyLmNv
bT4KPj4KPj4+IC0tLQo+Pj4gdjI6IE5vIGNoYW5nZS4KPj4+IC0tLQo+Pj4gICAgZHJpdmVycy9y
ZWd1bGF0b3Ivc3BhY2VtaXQtcDEuYyB8IDI1ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0KPj4+
ICAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZWd1bGF0b3Ivc3BhY2VtaXQtcDEuYyBiL2RyaXZl
cnMvcmVndWxhdG9yL3NwYWNlbWl0LXAxLmMKPj4+IGluZGV4IDJiNTg1YmEwMWE5My4uNTdlNmUw
MGE3M2ZhIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9yZWd1bGF0b3Ivc3BhY2VtaXQtcDEuYwo+
Pj4gKysrIGIvZHJpdmVycy9yZWd1bGF0b3Ivc3BhY2VtaXQtcDEuYwo+Pj4gQEAgLTg3LDEzICs4
NywxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGxpbmVhcl9yYW5nZSBwMV9sZG9fcmFuZ2VzW10g
PSB7Cj4+PiAgICAgICAgfQo+Pj4KPj4+ICAgICNkZWZpbmUgUDFfQlVDS19ERVNDKF9uKSBcCj4+
PiAtICAgICBQMV9SRUdfREVTQyhCVUNLLCBidWNrLCBfbiwgInZpbiIsIDB4NDcsIEJVQ0tfTUFT
SywgMjU1LCBwMV9idWNrX3JhbmdlcykKPj4+ICsgICAgIFAxX1JFR19ERVNDKEJVQ0ssIGJ1Y2ss
IF9uLCAidmluIiAjX24sIDB4NDcsIEJVQ0tfTUFTSywgMjU1LCBwMV9idWNrX3JhbmdlcykKPj4K
Pj4gVGhhdCB3YXMgYSBzaW1wbGUgY2hhbmdlLi4uCj4+Cj4+PiAgICAjZGVmaW5lIFAxX0FMRE9f
REVTQyhfbikgXAo+Pj4gLSAgICAgUDFfUkVHX0RFU0MoQUxETywgYWxkbywgX24sICJ2aW4iLCAw
eDViLCBMRE9fTUFTSywgMTI4LCBwMV9sZG9fcmFuZ2VzKQo+Pj4gKyAgICAgUDFfUkVHX0RFU0Mo
QUxETywgYWxkbywgX24sICJhbGRvaW4iLCAweDViLCBMRE9fTUFTSywgMTI4LCBwMV9sZG9fcmFu
Z2VzKQo+Pgo+PiBBcyBzdGF0ZWQgYmVmb3JlLCBJIGJlbGlldmUgdGhlIDEyOCBzaG91bGQgYmUg
MTE3IGhlcmUuICAoSWYKPiAKPiBJIHdpbGwgZXhwbGFpbiB0aGlzIGluIGFub3RoZXIgZW1haWwu
Cj4gCj4+IHlvdSBjaGFuZ2UgdGhlIGVhcmxpZXIgcGF0Y2gsIG1ha2Ugc3VyZSB0aGUgY2hhbmdl
IHRvIDEyOAo+PiBkb2Vzbid0IHBlcnNpc3QgaGVyZS4pICBTYW1lIGNvbW1lbnQgZm9yIHRoZSBE
TERPIHJlZ3VsYXRvcnMuCj4+Cj4+PiAtI2RlZmluZSBQMV9ETERPX0RFU0MoX24pIFwKPj4+IC0g
ICAgIFAxX1JFR19ERVNDKERMRE8sIGRsZG8sIF9uLCAiYnVjazUiLCAweDY3LCBMRE9fTUFTSywg
MTI4LCBwMV9sZG9fcmFuZ2VzKQo+Pj4gKyNkZWZpbmUgUDFfRExETzFfREVTQyhfbikgXAo+Pj4g
KyAgICAgUDFfUkVHX0RFU0MoRExETywgZGxkbywgX24sICJkbGRvaW4xIiwgMHg2NywgTERPX01B
U0ssIDEyOCwgcDFfbGRvX3JhbmdlcykKPj4KPj4gV2h5IGNhbid0IHlvdSB1c2UgX24gaGVyZSBs
aWtlIHlvdSBkaWQgZm9yIFAxX0JVQ0tfREVTQygpIGFib3ZlPwo+IAo+IFRoZSBuYW1pbmcgZm9s
bG93cyB0aGUgUDEgcGlub3V0IGRlZmluaXRpb25zIGluIHRoZSBkYXRhc2hlZXQgWzFdLgo+IAo+
IFVubGlrZSB0aGUgQlVDSyByZWd1bGF0b3JzLCB3aGljaCBoYXZlIGluZGl2aWR1YWwgaW5wdXQg
cGlucyAoZS5nLiwKPiBWSU4zIGZvciBCVUNLMyksIHRoZSBETERPcyBzaGFyZSBwb3dlciBpbnB1
dHMuIEZvciBleGFtcGxlLCBETERPSU4xIChwaW4gMTcpCj4gcG93ZXJzIERMRE8xIHRocm91Z2gg
RExETzQuIERMRE9JTjIgcHJvdmlkZXMgcG93ZXIgdG8gRExETzUsIDYgYW5kIDcuCgpBaGguICBJ
IGRpZG4ndCBub3RpY2UgdGhhdC4gIFRoZXJlIGFyZSB0d28gKmdyb3Vwcyogb2YgRExETwpyZWd1
bGF0b3JzLCBhbmQgZWFjaCBncm91cCBpcyBmZWQgYnkgb25lIG9yIHRoZSBvdGhlciBwb2VyCmlu
cHV0LgoKTm93IEkgZ2V0IGl0LgoKVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24uCgoJCQkJCS1B
bGV4Cgo+IFNpbmNlIHRoZXJlIGFyZSBubyBwaHlzaWNhbCBwaW5zIG5hbWVkIGRsZG9pbjMsIGV0
Yy4sIEkgY2FuJ3QgdXNlIHRoZSBfbiBpbmRleAo+IGZvciB0aGUgc3VwcGx5IG5hbWUgYXJndW1l
bnQgbGlrZSBJIGRpZCBmb3IgdGhlIEJVQ0tzLgo+IAo+IERhdGFzaGVldCBwaW4gZXhhbXBsZXM6
Cj4gOCBWSU4zIFBXUiBCdWNrMyBwb3dlciBpbnB1dCAoMToxIG1hcHBpbmcpCj4gMTcgRExET0lO
MSBQV1IgRExETzF+NCBwb3dlciBpbnB1dCAoMTpNYW55IG1hcHBpbmcpCj4gCj4gTGluazogaHR0
cHM6Ly9kZXZlbG9wZXIuc3BhY2VtaXQuY29tL2RvY3VtZW50YXRpb24/dG9rZW49VDFCdHcyQmRp
aVNsU1hrQWRpYmNvTWV0bmFnCj4gWzFdCj4gCj4gQmVzdCByZWdhcmRzLAo+IEd1b2RvbmcgWHUK
PiAKPj4KPj4+ICsKPj4+ICsjZGVmaW5lIFAxX0RMRE8yX0RFU0MoX24pIFwKPj4+ICsgICAgIFAx
X1JFR19ERVNDKERMRE8sIGRsZG8sIF9uLCAiZGxkb2luMiIsIDB4NjcsIExET19NQVNLLCAxMjgs
IHAxX2xkb19yYW5nZXMpCj4+Cj4+IFNvIHRoaXMgaXMgZ2VuZXJhbGl6aW5nIHRoZSBpbnB1dCwg
d2hpY2ggaXMgZ29vZC4gIFRoZSB1c2UKPj4gb2YgImJ1Y2s1IiBoZXJlIHdhcyBhIEJhbmFuYSBQ
aSBCUEktRjMgZGVzaWduIGFuZCBidXQgaXQKPj4gZG9lc24ndCBoYXZlIHRvIGJlIHRoYXQgd2F5
Lgo+Pgo+Pj4gICAgc3RhdGljIGNvbnN0IHN0cnVjdCByZWd1bGF0b3JfZGVzYyBwMV9yZWd1bGF0
b3JfZGVzY1tdID0gewo+Pj4gICAgICAgIFAxX0JVQ0tfREVTQygxKSwKPj4+IEBAIC0xMDgsMTMg
KzExMSwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ3VsYXRvcl9kZXNjIHAxX3JlZ3VsYXRv
cl9kZXNjW10gPSB7Cj4+PiAgICAgICAgUDFfQUxET19ERVNDKDMpLAo+Pj4gICAgICAgIFAxX0FM
RE9fREVTQyg0KSwKPj4+Cj4+PiAtICAgICBQMV9ETERPX0RFU0MoMSksCj4+PiAtICAgICBQMV9E
TERPX0RFU0MoMiksCj4+PiAtICAgICBQMV9ETERPX0RFU0MoMyksCj4+PiAtICAgICBQMV9ETERP
X0RFU0MoNCksCj4+PiAtICAgICBQMV9ETERPX0RFU0MoNSksCj4+PiAtICAgICBQMV9ETERPX0RF
U0MoNiksCj4+PiAtICAgICBQMV9ETERPX0RFU0MoNyksCj4+PiArICAgICBQMV9ETERPMV9ERVND
KDEpLAo+Pj4gKyAgICAgUDFfRExETzFfREVTQygyKSwKPj4+ICsgICAgIFAxX0RMRE8xX0RFU0Mo
MyksCj4+PiArICAgICBQMV9ETERPMV9ERVNDKDQpLAo+Pj4gKyAgICAgUDFfRExETzJfREVTQyg1
KSwKPj4+ICsgICAgIFAxX0RMRE8yX0RFU0MoNiksCj4+PiArICAgICBQMV9ETERPMl9ERVNDKDcp
LAo+Pj4gICAgfTsKPj4+Cj4+PiAgICBzdGF0aWMgaW50IHAxX3JlZ3VsYXRvcl9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Pj4KPj4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
