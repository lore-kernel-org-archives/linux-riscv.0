Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80262C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 12:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YgBpL/torP6/HUrMg/ZypjtdpIHvkJljsOihZLlMcbk=; b=Z1aP88NTWzdTjC
	CMmY8ZyY1TttCJFM/ml26Rjw0Yegq29nvoW9PaSV+fbEOPw5zhmVe6chgA9/62XExHOYVTi2qoSTX
	k4k3MgVX4EdzrOgabA4svQwhc53zB1p2UBKPSnp/JqCs/9oVVEMjP2FjQ2ePSqd8S9hpOr9B8i/if
	VT81Mj/WJ7pruTQjqP48pfND8fvVS/D68p0j3n84EzE+l8PrP1b0I/E57qbqXc3PS7nZRWoB54sSn
	+6AE9VneDJzk5tZhmct/PR+3DXoi0/dwbE9+AMrGHyKCIyenPaMGvOi4v3qRqsPFLiitMuJRIzoe2
	+y7Urdh35MbTxQEsF1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUniV-0000000GlyG-0alg;
	Tue, 30 Jan 2024 12:59:55 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUniS-0000000Glwp-0Zfz
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 12:59:53 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-4bd7614325eso3456683e0c.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 04:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706619590; x=1707224390; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VimagF6ubxCrk5XysR9xh2L9RrsLERkc1cac+8PgDII=;
        b=hk9qJaDBAoyRHZJEAkpHOtI7CaikaHleW5v/iVWh88y/tLyTaRVZjELVhzejlbrdcb
         4Ahglqw7t2o6Teq5W4LbdOumlgrFgg+zWTEJUkRMM8rZzINEbXgZoh03awwC9fm4kFXi
         0FmI7hybjuhdTY36UFPCj8I+EpKpPFZge1tDuvgPpCz3opk1OUUMhdRWlUNqir2oIi1y
         C3oUslCyE8MpthCsG1xF0CCQmmHsma1OsMwXstsGRmsRuQTlcLYcIyn+mnAId3POOKH8
         FZo4mSmFddH9FU3r6OKGXxuKnD7X5RoXB0yCZLjhiBi1Lkvk2JxlV1L7L+mVS1f/VymR
         tHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706619590; x=1707224390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VimagF6ubxCrk5XysR9xh2L9RrsLERkc1cac+8PgDII=;
        b=MANVV4q9odF90eTZ7YA86T+8PxxJ1UKMYyjsDbzAPMGj9GMxAdivnm0EwquMH2wzFU
         XjiVNQzFdlTFytltS0g0MHCT3g6X0/gK2gj9/nmWrHmafl299v9FlwK2RtKOn6vWJomf
         mO1n53GZsoret3EzTyo+Smfp64cutRE3mqOGlWFfd/Dj6M7YFJ7KbPrZSeryb13IiNKv
         qJom5tFNLLHZ3fiTMS4fWutwpBVTfEIhcTGzUMTRmVKtnnNcklOkZRItA7ndeGqU/0n9
         vT8zuXoka5ihm+fly5L/sH8ClaP6J9mKPjZr1DV1+WDE1ZMh56Zi2a4M/MR1EOOit4yD
         0F6Q==
X-Gm-Message-State: AOJu0YzFtqErw7SrDHCZHz7Bsvv3Su8+ea1KZnjjAsOepiAykhM8lF5A
	g+Pj/rMO2NNYbkHy5tuOJJTH1E7J47P9UBjezP5XhApQm7oqHvmgiiqEMzPzIXvgVFZ+LF5NGa1
	4i04urpSWK2tnNaP0AtclViQRZA0=
X-Google-Smtp-Source: AGHT+IFU2DqyVMQfyAetN1nNeVoTPMKMLlD1AhfHroTRYVH1iRaB38yi97B/YSecvnNVxS/1gAAjx6OH0SqsPzTYXwk=
X-Received: by 2002:a1f:f2c6:0:b0:4bd:5713:f01d with SMTP id
 q189-20020a1ff2c6000000b004bd5713f01dmr420012vkh.15.1706619589951; Tue, 30
 Jan 2024 04:59:49 -0800 (PST)
MIME-Version: 1.0
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240129151618.90922-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240129-magical-unclaimed-e725e2491ccb@spud> <CAMuHMdVhXh_Cd8m00xfVRB9JA8Mfb9+qccu94iVpUMS2z5kmUQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVhXh_Cd8m00xfVRB9JA8Mfb9+qccu94iVpUMS2z5kmUQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 30 Jan 2024 12:59:19 +0000
Message-ID: <CA+V-a8v0tdr-xh__5rcK=xL-yYG1qLtSrAUjPcS_-ZVYy8p9pQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_045952_215929_A9F4BB72 
X-CRM114-Status: GOOD (  25.72  )
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

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBUdWUsIEphbiAzMCwgMjAy
NCBhdCAxMToxM+KAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbgo8Z2VlcnRAbGludXgtbTY4ay5vcmc+
IHdyb3RlOgo+Cj4gSGkgUHJhYmhha2FyLAo+Cj4gT24gTW9uLCBKYW4gMjksIDIwMjQgYXQgNjoz
MOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBNb24s
IEphbiAyOSwgMjAyNCBhdCAwMzoxNjoxNFBNICswMDAwLCBQcmFiaGFrYXIgd3JvdGU6Cj4gPiA+
IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2Fz
LmNvbT4KPiA+ID4KPiA+ID4gRG9jdW1lbnQgUlovRml2ZSAoUjlBMDdHMDQzRikgSVJRQyBiaW5k
aW5ncy4gVGhlIElSUUMgYmxvY2sgb24gUlovRml2ZSBTb0MKPiA+ID4gaXMgYWxtb3N0IGlkZW50
aWNhbCB0byBvbmUgZm91bmQgb24gdGhlIFJaL0cyTCBTb0Mgd2l0aCBiZWxvdyBkaWZmZXJlbmNl
cywKPiA+ID4gKiBBZGRpdGlvbmFsIEJVUyBlcnJvciBpbnRlcnJ1cHQKPiA+ID4gKiBBZGRpdGlv
bmFsIEVDQ1JBTSBlcnJvciBpbnRlcnJ1cHQKPiA+ID4gKiBIYXMgYWRkaXRpb25hbCBtYXNrIGNv
bnRyb2wgcmVnaXN0ZXJzIGZvciBOTUkvSVJRL1RJTlQKPiA+ID4KPiA+ID4gSGVuY2UgbmV3IGNv
bXBhdGlibGUgc3RyaW5nICJyZW5lc2FzLHI5YTA3ZzA0M2YtaXJxYyIgaXMgYWRkZWQgZm9yIFJa
L0ZpdmUKPiA+ID4gU29DLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2Fy
IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4KPiBUaGFua3MgZm9y
IHlvdXIgcGF0Y2ghCj4KPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2ludGVycnVwdC1jb250cm9sbGVyL3JlbmVzYXMscnpnMmwtaXJxYy55YW1sCj4gPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxl
ci9yZW5lc2FzLHJ6ZzJsLWlycWMueWFtbAo+ID4gPiBAQCAtMjMsNiArMjMsNyBAQCBwcm9wZXJ0
aWVzOgo+ID4gPiAgICBjb21wYXRpYmxlOgo+ID4gPiAgICAgIGl0ZW1zOgo+ID4gPiAgICAgICAg
LSBlbnVtOgo+ID4gPiArICAgICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNDNmLWlycWMgICAjIFJa
L0ZpdmUKPiA+ID4gICAgICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDQzdS1pcnFjICAgIyBSWi9H
MlVMCj4gPiA+ICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA0NC1pcnFjICAgICMgUlovRzJ7
TCxMQ30KPiA+ID4gICAgICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDU0LWlycWMgICAgIyBSWi9W
MkwKPiA+ID4gQEAgLTg4LDYgKzg5LDEyIEBAIHByb3BlcnRpZXM6Cj4gPiA+ICAgICAgICAtIGRl
c2NyaXB0aW9uOiBHUElPIGludGVycnVwdCwgVElOVDMwCj4gPiA+ICAgICAgICAtIGRlc2NyaXB0
aW9uOiBHUElPIGludGVycnVwdCwgVElOVDMxCj4gPiA+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBC
dXMgZXJyb3IgaW50ZXJydXB0Cj4gPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBFQ0NSQU0wIFRJ
RTEgaW50ZXJydXB0Cj4KPiBFQ0NSQU0wIDFiaXQgZXJyb3IgaW50ZXJydXB0Pwo+Ck9LLgoKPiA+
ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEVDQ1JBTTAgVElFMiBpbnRlcnJ1cHQKPgo+IEVDQ1JB
TTAgMmJpdCBlcnJvciBpbnRlcnJ1cHQ/Cj4KT0suCj4gPiA+ICsgICAgICAtIGRlc2NyaXB0aW9u
OiBFQ0NSQU0wIG92ZXJmbG93IGludGVycnVwdAo+Cj4gRUNDUkFNMCBlcnJvciBvdmVyZmxvdyBp
bnRlcnJ1cHQ/Cj4KPiA+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEVDQ1JBTTEgVElFMSBpbnRl
cnJ1cHQKPiA+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEVDQ1JBTTEgVElFMiBpbnRlcnJ1cHQK
PiA+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEVDQ1JBTTEgb3ZlcmZsb3cgaW50ZXJydXB0Cj4K
PiBMaWtld2lzZS4KPgpPSy4KCj4gPiA+ICAgIGludGVycnVwdC1uYW1lczoKPiA+ID4gICAgICBt
aW5JdGVtczogNDEKPiA+ID4gQEAgLTEzNCw2ICsxNDEsMTIgQEAgcHJvcGVydGllczoKPiA+ID4g
ICAgICAgIC0gY29uc3Q6IHRpbnQzMAo+ID4gPiAgICAgICAgLSBjb25zdDogdGludDMxCj4gPiA+
ICAgICAgICAtIGNvbnN0OiBidXMtZXJyCj4gPiA+ICsgICAgICAtIGNvbnN0OiBlY2NyYW0wLXRp
ZTEKPiA+ID4gKyAgICAgIC0gY29uc3Q6IGVjY3JhbTAtdGllMgo+ID4gPiArICAgICAgLSBjb25z
dDogZWNjcmFtMC1vdmYKPiA+ID4gKyAgICAgIC0gY29uc3Q6IGVjY3JhbTEtdGllMQo+ID4gPiAr
ICAgICAgLSBjb25zdDogZWNjcmFtMS10aWUyCj4gPiA+ICsgICAgICAtIGNvbnN0OiBlY2NyYW0x
LW92Zgo+Cj4gV2h5IG5vdCB1c2UgdGhlIG5hbWluZyBmcm9tIHRoZSBkb2NzIChhbGwgNiBpbmNs
dWRlICJ0aSIpPwo+IEVDN1RJRTFfMCwgRUM3VElFMl8wLCBFQzdUSU9WRl8wLCBFQzdUSUUxXzEs
IEVDN1RJRTJfMSwgRUM3VElPVkZfMQo+ID0+IGVjN3RpZTEtMCwgZWM3dGllMi0wLCBlYzd0aW92
Zi0wLCAuLi4/Cj4KQWdyZWVkLgoKPiA+IEkgdGhpbmsgdGhlIHJlc3RyaWN0aW9ucyBhbHJlYWR5
IGluIHRoZSBmaWxlIGJlY29tZSBpbmNvcnJlY3Qgd2l0aCB0aGlzCj4gPiBwYXRjaDoKPiA+ICAg
LSBpZjoKPiA+ICAgICAgIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgIGNvbXBhdGlibGU6Cj4gPiAg
ICAgICAgICAgY29udGFpbnM6Cj4gPiAgICAgICAgICAgICBlbnVtOgo+ID4gICAgICAgICAgICAg
ICAtIHJlbmVzYXMscjlhMDdnMDQzdS1pcnFjCj4gPiAgICAgICAgICAgICAgIC0gcmVuZXNhcyxy
OWEwOGcwNDUtaXJxYwo+ID4gICAgIHRoZW46Cj4gPiAgICAgICBwcm9wZXJ0aWVzOgo+ID4gICAg
ICAgICBpbnRlcnJ1cHRzOgo+ID4gICAgICAgICAgIG1pbkl0ZW1zOiA0Mgo+ID4gICAgICAgICBp
bnRlcnJ1cHQtbmFtZXM6Cj4gPiAgICAgICAgICAgbWluSXRlbXM6IDQyCj4gPiAgICAgICByZXF1
aXJlZDoKPiA+ICAgICAgICAgLSBpbnRlcnJ1cHQtbmFtZXMKPiA+Cj4gPiBUaGlzIHVzZWQgdG8g
cmVxdWlyZSBhbGwgNDIgaW50ZXJydXB0cyBmb3IgdGhlIHR3byBjb21wYXRpYmxlcyBoZXJlCj4g
PiBhbmQgYXQgbGVhc3QgdGhlIGZpcnN0IDQxIG90aGVyd2lzZS4gTm93IHlvdSd2ZSBpbmNyZWFz
ZWQgdGhlIG51bWJlciBvZgo+ID4gaW50ZXJydXB0cyB0byA0OCB0aGVyZWJ5IHJlbW92aW5nIHRo
ZSB1cHBlciBsaW1pdHMgb24gdGhlIGV4aXN0aW5nCj4gPiBkZXZpY2VzLgo+Cj4gSSdtIGdvbm5h
IHJlcGVhdCAoYW5kIGV4dGVuZCkgbXkgcXVlc3Rpb24gZnJvbSBbMV06IEhvdyBjb21lIHdlIHRo
b3VnaHQKPiBSWi9HMkwgYW5kIFJaL1YyTCBkbyBub3QgaGF2ZSB0aGUgYnVzIGVycm9yIGFuZCBF
Q0NSQU0gaW50ZXJydXB0cz8KPgpIbW0gbm90IHN1cmUgaG93IHRoaXMgd2FzIG1pc3NlZCBlYXJs
aWVyLgoKPiBMb29rcyBsaWtlIG1vc3Qgb2YgdGhlIGNvbmRpdGlvbmFsIGhhbmRsaW5nIGNhbiBi
ZSByZW1vdmVkIChzZWUgYmVsb3cpLgo+Cj4gPiBHaXZlbiB0aGUgY29tbWl0IG1lc3NhZ2UsIEkg
ZmlndXJlIHRoYXQgcHJvdmlkaW5nIDQ4IGludGVycnVwdHMgZm9yCj4gPiAoYXQgbGVhc3Qgc29t
ZSBvZikgdGhvc2UgZGV2aWNlcyB3b3VsZCBiZSBpbmNvcnJlY3Q/Cj4KPiBMb29rcyBsaWtlIGFs
bCBvZiBSWi9HMkx7LEN9LCBSWi9WMkwsIFJaL0cyVUwsIGFuZCBSWi9GaXZlIHN1cHBvcnQKPiBh
bGwgNDggaW50ZXJydXB0cy4gIFJaL0czUyBsYWNrcyB0aGUgZmluYWwgdGhyZWUgZm9yIEVDQ1JB
TTEuCj4KQWdyZWVkIGZvciBSWi9HMkx7LEN9LCBSWi9WMkwsIFJaL0cyVUwsIGFuZCBSWi9GaXZl
LCBidXQgZm9yIFJaL0czUyBpdApiZWNvbWVzIHRyaWNreSB0aGUgaW50ZXJydXB0cyBmb3IgRUND
UkFNMC8xIGFyZSBjb21iaW5lZCBoZW5jZSB0aGV5CmhhdmUganVzdCAzIGludGVycnVwdHMuIEhv
dyBkbyB5b3UgcHJvcG9zZSB0aGUgYWJvdmUgaW50ZXJydXB0IG5hbWluZz8KCj4gWzFdICJSZTog
W1BBVENIIHYzIDgvOV0gZHQtYmluZGluZ3M6IGludGVycnVwdC1jb250cm9sbGVyOgo+IHJlbmVz
YXMscnpnMmwtaXJxYzogRG9jdW1lbnQgUlovRzNTIgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvQ0FNdUhNZFg4OEtSbnZKY2hVd3JXY2dtUG9vQUVTT1QyNDkyTnIxWl81VU1uZzNxX19RQG1h
aWwuZ21haWwuY29tCj4KU29ycnkgSSBtaXNzZWQgdGhpcyB0aHJlYWQuCgpDaGVlcnMsClByYWJo
YWthcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
