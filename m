Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784A1C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 15:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vtgHGr2O2QmO+crUAVaUfhKC3DpFzpRfZasrL9F4J4Q=; b=n+1tLi+oCtB/1q
	fL8qiNHk6/dxk9EJnVR4/3n6xLogSILd5gpwIloOFXcy98Oxfbb271PaaQLGo6rDwGkylMgsbiIAr
	8G/Kelop6A2fv57x3tZ5m70DCuGawBJVV8P8Y6dhnku4ddWPqufh7jBRlC85uwderFbvkzG0m8wIV
	rnYaZ5U5S2A7iehLirdlxg9dvy/mE1meP4rV9c26Qkxx+bHA9KimbQAw+5kXjDp+d4vVpk5Qq4BJQ
	21TTF2VAPHt77eaZ5PATWgH5hPLiiPWNGBxEW47reeCfKOvymVT6vny+mia33rTtRTYHBE2yJdMP3
	gQ8PzzFfnHhZszMgEReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLQ48-00EZpX-2e;
	Thu, 04 Jan 2024 15:55:28 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLQ45-00EZp6-1N
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 15:55:26 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-49618e09f16so187230e0c.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 07:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704383723; x=1704988523; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPeDIiQjNkPvl4Ik1+JkTjR4o2Soc24WzRcdY8DaVYo=;
        b=KRg7/DGfQVLghnhOLbe/8bLEAqPkI7zG5xGs8U09K4r6AKU6Ld9v+MTdASatrh0JGp
         ZhXjauh5eFLm17Eau4woWsUSMlCF000kvULvduoDBQZ2yopWsBUxiCjt9HYXrBgUrTu1
         MbCzM7NYqwB3QL4RIZ0GhzxSfgbrfYdHlNSOQwXMr7Bx0/6+Hp8nWURhodCDEdspRcyE
         ggawsO/HSUVMKJ7NO+TYUcu+li9plB8zDNYxZzLW51mpkQgE5/GvRdSZAaer7AbCLm4x
         XlV4T8MihWEaIGvWbMIH+X6Wr/PEwt1XI/bY7+Nyhs16ElTDw7rvgGOV/Lcx1U82jp7/
         tVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704383723; x=1704988523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPeDIiQjNkPvl4Ik1+JkTjR4o2Soc24WzRcdY8DaVYo=;
        b=nWH0ZSJMNzIdM67xERentphTA6MTveUt7OZ1IAvDIP8IcnclUGBj2I0vBm1873Q+LU
         zjfpvKMcMOm+H3iDi9Xo/rc9HqKJTKmqEyQA3aNnTGpqgrB/e57rRBAWi3ePx8LjL7Cq
         SA17mVPGksOL5+aPLOuTEpOKMiY8+AUCDfnDSE296rcdGhze0mks+Z+0FpuQaiCvOkrm
         iMISW2NmlKe4Puf4QRfp46uX/pkW0F44ZUENkh4yNcsXmJHKVJ3OkLUO6drAOvd9r2Eu
         sh4wVfMubrNH9CfL3fIt5yWR4nPO6CHRRtAgMWmEt0iFUOa8IBqnmS6UJVK9c9PAkNAE
         RJfw==
X-Gm-Message-State: AOJu0YySf3Zi0U5Zt8Gx8cPmHngBzFcQpRN9d7JW1HrOQ3iVTtCUbm8k
	FZZwfKl/naSIF4T4ad0cLqZsbz8IMd8TN0ASxPc=
X-Google-Smtp-Source: AGHT+IFziaDJ3NSo7BkYW/w+OWVaUUgoZfbD/12fbvF28wfa+TcMRxgPb+Fu8jzlDe/pBw9yISY7j4W7adlO3cvMmnA=
X-Received: by 2002:a05:6122:12d3:b0:4b7:3d44:9b05 with SMTP id
 d19-20020a05612212d300b004b73d449b05mr664953vkp.4.1704383723681; Thu, 04 Jan
 2024 07:55:23 -0800 (PST)
MIME-Version: 1.0
References: <20231201131551.201503-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20231201131551.201503-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUiaL__+CDaFxRbUFgrz69SYBNfZm4JvY_qQRKLMTCY0w@mail.gmail.com>
 <CA+V-a8tTWf8Kx-Ex=DPsSR2ZWHC29N_pAoEZN1sR5Nqobf139A@mail.gmail.com> <CAMuHMdXosvV=EuRtL69r6=UT0SO8Aq-XjWwJMJQpWAhT2z+ffA@mail.gmail.com>
In-Reply-To: <CAMuHMdXosvV=EuRtL69r6=UT0SO8Aq-XjWwJMJQpWAhT2z+ffA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 4 Jan 2024 15:54:29 +0000
Message-ID: <CA+V-a8tNeiyvK90urPF9s3JZOav77TRO8xdAEiCmYurrf3-4RA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] pinctrl: renesas: rzg2l: Include pinmap in
 RZG2L_GPIO_PORT_PACK() macro
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_075525_483819_D72DEAF0 
X-CRM114-Status: GOOD (  35.18  )
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

SGkgR2VlcnQsCgpPbiBUdWUsIEphbiAyLCAyMDI0IGF0IDEwOjE44oCvQU0gR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4K
PiBPbiBUaHUsIERlYyAyMSwgMjAyMyBhdCAxMDowNOKAr1BNIExhZCwgUHJhYmhha2FyCj4gPHBy
YWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+IE9uIFdlZCwgRGVjIDYsIDIwMjMg
YXQgMToxM+KAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdy
b3RlOgo+ID4gPiBPbiBGcmksIERlYyAxLCAyMDIzIGF0IDI6MTbigK9QTSBQcmFiaGFrYXIgPHBy
YWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPiBGcm9tOiBMYWQgUHJhYmhh
a2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gPiA+ID4KPiA+
ID4gPiBDdXJyZW50bHkgd2UgYXNzdW1lIGFsbCB0aGUgcG9ydCBwaW5zIGFyZSBzZXF1ZW50aWFs
IGllIGFsd2F5cyBQWF8wIHRvCj4gPiA+ID4gUFhfbiAobj0xLi43KSBleGlzdCwgYnV0IG9uIFJa
L0ZpdmUgU29DIHdlIGhhdmUgYWRkaXRpb25hbCBwaW5zIFAxOV8xIHRvCj4gPiA+ID4gUDI4XzUg
d2hpY2ggaGF2ZSBob2xlcyBpbiB0aGVtLCBmb3IgZXhhbXBsZSBvbmx5IG9uZSBwaW4gb24gcG9y
dDE5IGlzCj4gPiA+ID4gYXZhaWxhYmxlIGFuZCB0aGF0IGlzIFAxOV8xIGFuZCBub3QgUDE5XzAu
IFNvIHRvIGhhbmRsZSBzdWNoIGNhc2VzCj4gPiA+ID4gaW5jbHVkZSBwaW5tYXAgZm9yIGVhY2gg
cG9ydCB3aGljaCB3b3VsZCBpbmRpY2F0ZSB0aGUgcGluIGF2YWlsYWJpbGl0eQo+ID4gPiA+IG9u
IGVhY2ggcG9ydC4gQXMgdGhlIHBpbmNvdW50IGNhbiBiZSBjYWxjdWxhdGVkIGJhc2VkIG9uIHBp
bm1hcCBkcm9wIHRoaXMKPiA+ID4gPiBmcm9tIFJaRzJMX0dQSU9fUE9SVF9QQUNLKCkgbWFjcm8g
YW5kIHVwZGF0ZSBSWkcyTF9HUElPX1BPUlRfR0VUX1BJTkNOVCgpCj4gPiA+ID4gbWFjcm8uCj4g
PiA+ID4KPiA+ID4gPiBQcmV2aW91c2x5IHdlIGhhZCBhIG1heCBvZiA3IHBpbnMgb24gZWFjaCBw
b3J0IGJ1dCBvbiBSWi9GaXZlIFBvcnQtMjAKPiA+ID4gPiBoYXMgOCBwaW5zLCBzbyBtb3ZlIHRo
ZSBzaW5nbGUgcGluIGNvbmZpZ3VyYXRpb24gdG8gQklUKDYzKS4KPiA+ID4gPgo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5y
ZW5lc2FzLmNvbT4KPiA+ID4KPiA+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+ID4gPgo+ID4g
PiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYwo+ID4gPiA+
ICsrKyBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYwo+ID4gPiA+IEBA
IC04MCwxNSArODAsMTcgQEAKPiA+ID4gPiAgICogbiBpbmRpY2F0ZXMgbnVtYmVyIG9mIHBpbnMg
aW4gdGhlIHBvcnQsIGEgaXMgdGhlIHJlZ2lzdGVyIGluZGV4Cj4gPiA+ID4gICAqIGFuZCBmIGlz
IHBpbiBjb25maWd1cmF0aW9uIGNhcGFiaWxpdGllcyBzdXBwb3J0ZWQuCj4gPiA+ID4gICAqLwo+
ID4gPiA+IC0jZGVmaW5lIFJaRzJMX0dQSU9fUE9SVF9QQUNLKG4sIGEsIGYpICAoKChuKSA8PCAy
OCkgfCAoKGEpIDw8IDIwKSB8IChmKSkKPiA+ID4gPiAtI2RlZmluZSBSWkcyTF9HUElPX1BPUlRf
R0VUX1BJTkNOVCh4KSAgKCgoeCkgJiBHRU5NQVNLKDMwLCAyOCkpID4+IDI4KQo+ID4gPiA+ICsj
ZGVmaW5lIFJaRzJMX0dQSU9fUE9SVF9QQUNLKG4sIGEsIGYpICAoKChuKSA+IDAgPyAoKHU2NCko
R0VOTUFTS19VTEwoKChuKSAtIDEgKyAyOCksIDI4KSkpIDogMCkgfCBcCj4gPiA+Cj4gPiA+IFRo
ZSBtYXNrIGNyZWF0aW9uIGNhbiBiZSBzaW1wbGlmaWVkIHRvCj4gPiA+Cj4gPiA+ICAgICAoKDFV
TEwgPDwgKG4pKSAtIDEpIDw8IDI4Cj4gPiA+Cj4gPiBPSy4KPiA+Cj4gPiA+IGJ1dCBzZWUgYmVs
b3cuLi4KPiA+ID4KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICgoYSkgPDwgMjApIHwgKGYpKQo+ID4gPiA+ICsjZGVmaW5lIFJaRzJMX0dQSU9fUE9SVF9H
RVRfUElOTUFQKHgpICAoKCh4KSAmIEdFTk1BU0tfVUxMKDM1LCAyOCkpID4+IDI4KQo+ID4gPiA+
ICsjZGVmaW5lIFJaRzJMX0dQSU9fUE9SVF9HRVRfUElOQ05UKHgpICAoaHdlaWdodDgoUlpHMkxf
R1BJT19QT1JUX0dFVF9QSU5NQVAoKHgpKSkpCj4gPiA+Cj4gPiA+IEkgdGhpbmsgd2UndmUgcmVh
Y2hlZCB0aGUgcG9pbnQgd2hlcmUgaXQgd291bGQgYmUgZWFzaWVyIGZvciB0aGUKPiA+ID4gY2Fz
dWFsIHJldmlld2VyIHRvICNkZWZpbmUgUElOX0NGR18qX01BU0sgZm9yIGFsbCBmaWVsZHMsIGFu
ZCB1c2UKPiA+ID4gRklFTERfe1BSRVAsR0VUfSgpIHRvIHBhY2sgcmVzcC4gZXh0cmFjdCB2YWx1
ZXMuICBUaGF0IHdvdWxkIGFsc28KPiA+ID4gbWFrZSBpdCBtb3JlIG9idmlvdXMgd2hpY2ggYml0
cyBhcmUgaW4gdXNlLCBhbmQgaG93IG1hbnkgYml0cyBhcmUKPiA+ID4gc3RpbGwgYXZhaWxhYmxl
IGZvciBmdXR1cmUgdXNlLgo+ID4gPgo+ID4gSWYgSSB1c2UgdGhlIEZJRUxEX1BSRVAoKSBtYWNy
byBsaWtlIGJlbG93IEkgZ2V0IGJ1aWxkIGlzc3VlcyBhcyBiZWxvdzoKPiA+Cj4gPiAjZGVmaW5l
IFJaRzJMX0dQSU9fUE9SVF9QSU5fQ05UX01BU0sgICAgR0VOTUFTSygzMSwgMjgpCj4gPiAjZGVm
aW5lIFJaRzJMX0dQSU9fUE9SVF9QSU5fUkVHX01BU0sgICAgR0VOTUFTSygyNywgMjApCj4gPiAj
ZGVmaW5lIFJaRzJMX0dQSU9fUE9SVF9QSU5fQ0ZHX01BU0sgICAgR0VOTUFTSygxOSwgMCkKPiA+
ICNkZWZpbmUgUlpHMkxfR1BJT19QT1JUX1BBQ0sobiwgYSwgZikKPiA+IEZJRUxEX1BSRVAoUlpH
MkxfR1BJT19QT1JUX1BJTl9DTlRfTUFTSywgbikgfCBcCj4gPiAgICAgICAgICAgICAgICAgICAg
IEZJRUxEX1BSRVAoUlpHMkxfR1BJT19QT1JUX1BJTl9SRUdfTUFTSywgYSkgfCBcCj4gPiAgICAg
ICAgICAgICAgICAgICAgIEZJRUxEX1BSRVAoUlpHMkxfR1BJT19QT1JUX1BJTl9DRkdfTUFTSywg
ZikKPiA+Cj4gPgo+ID4gZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jOjkx
OjQxOiBub3RlOiBpbiBleHBhbnNpb24gb2YKPiA+IG1hY3JvICdGSUVMRF9QUkVQJwo+ID4gICAg
OTEgfAo+ID4gRklFTERfUFJFUChSWkcyTF9HUElPX1BPUlRfUElOX0NGR19NQVNLLCBmKQo+ID4g
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fgo+ID4gZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jOjE0ODY6OTogbm90
ZTogaW4gZXhwYW5zaW9uIG9mCj4gPiBtYWNybyAnUlpHMkxfR1BJT19QT1JUX1BBQ0snCj4gPiAg
MTQ4NiB8ICAgICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0soNiwgMHgyYSwKPiA+IFJaRzNTX01Q
WEVEX1BJTl9GVU5DUyhBKSksICAgICAgICAgICAgICAgICAgICAgICAgLyogUDE4ICovCj4gPiAg
ICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4KPiA+Cj4gPiBEbyB5b3UgaGF2ZSBh
bnkgcG9pbnRlcnM/Cj4KPiBZb3UgbGVmdCBvdXQgdGhlIGFjdHVhbCBlcnJvciA6LSgKPgpPb3Bz
IHNvcnJ5LgoKPiBpbmNsdWRlL2xpbnV4L2JpdGZpZWxkLmg6MTEzOjk6IGVycm9yOiBicmFjZWQt
Z3JvdXAgd2l0aGluIGV4cHJlc3Npb24KPiBhbGxvd2VkIG9ubHkgaW5zaWRlIGEgZnVuY3Rpb24K
PiAgIDExMyB8ICAgICAgICAgKHsKPiAgICAgICAgICBcCj4gICAgICAgfCAgICAgICAgIF4KPiBk
cml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmM6OTM6Mzk6IG5vdGU6IGluIGV4
cGFuc2lvbiBvZgo+IG1hY3JvIOKAmEZJRUxEX1BSRVDigJkKPiAgICA5MyB8ICNkZWZpbmUgUlpH
MkxfR1BJT19QT1JUX1BBQ0sobiwgYSwgZikKPiBGSUVMRF9QUkVQKFJaRzJMX0dQSU9fUE9SVF9Q
SU5fQ05UX01BU0ssIG4pIHwgXAo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fn5+Cj4gZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1y
emcybC5jOjE1NTU6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mCj4gbWFjcm8g4oCYUlpHMkxfR1BJ
T19QT1JUX1BBQ0vigJkKPiAgMTU1NSB8ICAgICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0soMiwg
MHgxMCwgUlpHMkxfTVBYRURfUElOX0ZVTkNTKSwKPiAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn4KPgo+IFVzaW5nIEZJRUxEX1BSRVBfQ09OU1QoKSBpbnN0ZWFkIG1ha2VzIGl0
IGJ1aWxkLgo+ClRoYW5rcyBmb3IgdGhlIHBvaW50ZXIsIHRoYXQgZGlkIHRoZSB0cmljay4KCj4g
SSB0aGluayB3ZSd2ZSByZWFjaGVkIHRoZSBwb2ludCB3aGVyZSBpdCB3b3VsZCBiZSBlYXNpZXIg
Zm9yIHRoZQo+IGNhc3VhbCByZXZpZXdlciB0byAjZGVmaW5lIFBJTl9DRkdfKl9NQVNLIGZvciBh
bGwgZmllbGRzLCBhbmQgdXNlCj4gRklFTERfe1BSRVAsR0VUfSgpIHRvIHBhY2sgcmVzcC4KVG8g
Y2xhcmlmeSwgeW91IG1lYW4gdG8gZGVmaW5lIFBJTl9DRkdfKl9NQVNLIGZvciBhbGwKUElOX0NG
R19JT0xIX0EuLlBJTl9DRkdfT0VOIG1hY3Jvcz8gSSBhc2sgYmVjYXVzZSB3ZSBkb250IGV4dHJh
Y3QgdGhlCnJlc3BlY3RpdmUgQ0ZHIGZsYWdzIGluIHRoZSBjb2RlLgoKQ2hlZXJzLApQcmFiaGFr
YXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
