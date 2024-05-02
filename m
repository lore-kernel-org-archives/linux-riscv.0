Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B971DC4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 02:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2TyQhz4+ApJQ4mflyX/VGx53Wb5WV8joJY1qZlBqTZg=; b=mOrmX4y8uRDhu7
	2kfexkF9duRLhcAbfW1NSPV8+vi3g66V4FxC3RXJNjo8Uyy/bWhr1zMfjYAMU+VGTczbB2SqtWL7g
	1A4MLQP6TdaEH3ixW4iFjUPWv8tQkTeDnEwndjloqcmMD500CV3YvpS3phKFNBDZUyg1Qip4wJQWN
	ufGxIXCoeAgYWMrNTCYu8yGzO4KdaQRQ4ArE4rHmUngBGyFqu5niTi6DYjxMbvwQpkx4yK2LscMs9
	U3j1Vlilg69v+T7l8x3rg6w6bia/O0ZT893oI4CZcs7BwhKjY2jhbgABlSImNm2/utvcZLDqvdVvB
	EiPpaxE1B/T4GlkYc5xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2MRN-0000000BEJC-1z4Y;
	Thu, 02 May 2024 02:44:57 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2MRK-0000000BEIO-1VFq
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 02:44:56 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so1031213a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 19:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714617892; x=1715222692; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euZIhWXjQEYe0bWn32p2A4SfGVqdxpff17R6zQ8P7PI=;
        b=RtTnV+lT7qTWRaZ9rPuQmYJh8FnGveV6iKftRvvhx1nlANDll0p93yc9ISB113cfv7
         jg9A0v5ItqvHt7X9BJSO0IwaFC+B0Wb4CJTVsQji3Q475l/9ajp3ryMbC07HxWmgBOt/
         b4TXLgO62Jz92L+62y2MPmDPx+l/eOmbO8AbjStL8faZVaXdv+h4KU6QxjyM/IS1UbUV
         sQLMK8P/eKoZ3XaiieIwlbkJkFVq7JaK57JDDpolGvK8UArWs6jgDfffPCeYB7mWo7u/
         GVJDlM9rLrAcoHXOwAVCHq/Iu9iJeM+WEtlK1p51IJk1dlxPP35tNf+4eA0hL2JbzhTE
         HdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714617892; x=1715222692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euZIhWXjQEYe0bWn32p2A4SfGVqdxpff17R6zQ8P7PI=;
        b=PFD4NKcs6KYoQPnMpa5BpRR44gN2ZUaX1E5jRncHDtyAdH71XL5G+pjhSTcW6OSnXm
         gTn70pN3NNpyar3R+1P2U0eX7qMgI+2cIY+VuNcUJoB05dPx78WXPD6FP2YQMHEKhStl
         mz6LlDZea4Kix4gmKAzvnp45eCMFnDS5cVd3OpgxfJ34Mn9B/z/kHtCR5OSyfGcuut59
         BQ80of9TLcetSPg+XszV7BYQH9t+knazaQ0iongpJKz+/Z0VH0weeXXothM+15gTBpRt
         bQfUlP1wm5ZFIBFPhyKlbyDDAH9MitaO2hRFY0wnvRCpveAO1jfsCqu9InQ6N/MZxzHL
         oNnA==
X-Forwarded-Encrypted: i=1; AJvYcCXrngHWdeMARnd9cPUjm5EsYhTl8vU5bHCFyXKw/4YeXXeMNPOXwQ1+2a6zMzBuXNx3aK7xZiHXX8GkWMFuYJ06NFqIYVAeVcgaj9P4OyJs
X-Gm-Message-State: AOJu0YyNJUKBF1JIiMaze0Lmu4ScoiF0/pVbfNEIfUaH5etEaZJftT7o
	cYUe+uNlZetITpUalpzRLKrGS/++XMNb81Qo+NWyIjLXoCgTYu3tbJvwFlwLU5BK4uqo95s4yJA
	eQy2uhZLX6ykSbvPE43Z9+1fTTjlrBN12CA/hWg==
X-Google-Smtp-Source: AGHT+IGwSe/xIz3BgUNwPr5sTo42FMHmya+TRXIF+ZH8Uh1IRa75Xl3IrkakU97XG8tf79d3YtP+8s8443YiwDnf8WE=
X-Received: by 2002:a17:90a:e2c6:b0:2b2:8b6f:c00d with SMTP id
 fr6-20020a17090ae2c600b002b28b6fc00dmr2161008pjb.10.1714617892115; Wed, 01
 May 2024 19:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1714494653.git.tjeznach@rivosinc.com> <aa5592da66fe72acd4d4730f544882042e7b5293.1714494653.git.tjeznach@rivosinc.com>
 <6b4a4dc0-ac9e-43cd-bd84-447df2370dde@linux.intel.com> <20240501142037.GC1723318@ziepe.ca>
 <3972c041-d5dd-4b02-9a0d-4541f7adc6d0@linux.intel.com>
In-Reply-To: <3972c041-d5dd-4b02-9a0d-4541f7adc6d0@linux.intel.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Wed, 1 May 2024 19:44:41 -0700
Message-ID: <CAH2o1u4yNM+zq3c92WV_GCP-y0ev+f6eVa2C28-yiNQrB2HY9Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] iommu/riscv: Add RISC-V IOMMU platform device driver
To: Baolu Lu <baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_194454_514269_E5D6088B 
X-CRM114-Status: GOOD (  34.70  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMSwgMjAyNCBhdCA3OjI14oCvUE0gQmFvbHUgTHUgPGJhb2x1Lmx1QGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiA1LzEvMjQgMTA6MjAgUE0sIEphc29uIEd1bnRob3Jw
ZSB3cm90ZToKPiA+IE9uIFdlZCwgTWF5IDAxLCAyMDI0IGF0IDA2OjI2OjIwUE0gKzA4MDAsIEJh
b2x1IEx1IHdyb3RlOgo+ID4+IE9uIDIwMjQvNS8xIDQ6MDEsIFRvbWFzeiBKZXpuYWNoIHdyb3Rl
Ogo+ID4+PiArc3RhdGljIGludCByaXNjdl9pb21tdV9pbml0X2NoZWNrKHN0cnVjdCByaXNjdl9p
b21tdV9kZXZpY2UgKmlvbW11KQo+ID4+PiArewo+ID4+PiArICAgdTY0IGRkdHA7Cj4gPj4+ICsK
PiA+Pj4gKyAgIC8qCj4gPj4+ICsgICAgKiBNYWtlIHN1cmUgdGhlIElPTU1VIGlzIHN3aXRjaGVk
IG9mZiBvciBpbiBwYXNzLXRocm91Z2ggbW9kZSBkdXJpbmcgcmVndWxhcgo+ID4+PiArICAgICog
Ym9vdCBmbG93IGFuZCBkaXNhYmxlIHRyYW5zbGF0aW9uIHdoZW4gd2UgYm9vdCBpbnRvIGEga2V4
ZWMga2VybmVsIGFuZCB0aGUKPiA+Pj4gKyAgICAqIHByZXZpb3VzIGtlcm5lbCBsZWZ0IHRoZW0g
ZW5hYmxlZC4KPiA+Pj4gKyAgICAqLwo+ID4+PiArICAgZGR0cCA9IHJpc2N2X2lvbW11X3JlYWRx
KGlvbW11LCBSSVNDVl9JT01NVV9SRUdfRERUUCk7Cj4gPj4+ICsgICBpZiAoZGR0cCAmIFJJU0NW
X0lPTU1VX0REVFBfQlVTWSkKPiA+Pj4gKyAgICAgICAgICAgcmV0dXJuIC1FQlVTWTsKPiA+Pj4g
Kwo+ID4+PiArICAgaWYgKEZJRUxEX0dFVChSSVNDVl9JT01NVV9ERFRQX01PREUsIGRkdHApID4g
UklTQ1ZfSU9NTVVfRERUUF9NT0RFX0JBUkUpIHsKPiA+Pj4gKyAgICAgICAgICAgaWYgKCFpc19r
ZHVtcF9rZXJuZWwoKSkKPiA+PiBJcyBrZHVtcCBzdXBwb3J0ZWQgZm9yIFJJU0MtViBhcmNoaXRl
Y3R1cmVzPyAgSWYgc28sIHRoZSBkb2N1bWVudGF0aW9uCj4gPj4gaW4gRG9jdW1lbnRhdGlvbi9h
ZG1pbi1ndWlkZS9rZHVtcC9rZHVtcC5yc3QgbWlnaHQgbmVlZCBhbiB1cGRhdGUuCj4gPj4KPiA+
PiBUaGVyZSBpcyBhIHBvc3NpYmlsaXR5IG9mIG9uZ29pbmcgRE1BcyBkdXJpbmcgdGhlIGJvb3Qg
cHJvY2VzcyBvZiB0aGUKPiA+PiBrZHVtcCBjYXB0dXJlIGtlcm5lbCBiZWNhdXNlIHRoZXJlJ3Mg
YSBzbWFsbCBjaGFuY2Ugb2YgbGVnYWN5IERNQSBzZXR1cHMKPiA+PiB0YXJnZXRpbmcgYW55IG1l
bW9yeSBsb2NhdGlvbi4gS2R1bXAgdHlwaWNhbGx5IGFsbG93cyB0aGVzZSBvbmdvaW5nIERNQQo+
ID4+IHRyYW5zZmVycyB0byBjb21wbGV0ZSwgYXNzdW1pbmcgdGhleSB3ZXJlIGludGVuZGVkIGZv
ciB2YWxpZCBtZW1vcnkKPiA+PiByZWdpb25zLgo+ID4+Cj4gPj4gVGhlIElPTU1VIHN1YnN5c3Rl
bSBpbXBsZW1lbnRzIGEgZGVmYXVsdCBkb21haW4gZGVmZXJyZWQgYXR0YWNobWVudAo+ID4+IG1l
Y2hhbmlzbSBmb3IgdGhpcy4gSW4gdGhlIGtkdW1wIGNhcHR1cmUga2VybmVsLCB0aGUgd2hvbGUg
ZGV2aWNlCj4gPj4gY29udGV4dCB0YWJsZXMgYXJlIGNvcGllZCBmcm9tIHRoZSBvcmlnaW5hbCBr
ZXJuZWwgYW5kIHdpbGwgYmUKPiA+PiBvdmVycmlkZGVuIG9uY2UgdGhlIGRldmljZSBkcml2ZXIg
Y2FsbHMgdGhlIGtlcm5lbCBETUEgaW50ZXJmYWNlIGZvciB0aGUKPiA+PiBmaXJzdCB0aW1lLiBU
aGlzIGFzc3VtZXMgdGhhdCBhbGwgb2xkIERNQSB0cmFuc2ZlcnMgYXJlIGNvbXBsZXRlZCBhZnRl
cgo+ID4+IHRoZSBkcml2ZXIncyB0YWtlb3Zlci4KPiA+Pgo+ID4+IFdpbGwgeW91IGNvbnNpZGVy
IHRoaXMgZm9yIFJJU0MtViBhcmNoaXRlY3R1cmUgYXMgd2VsbD8KPiA+IEl0IHNlZW1zIHdlIGRl
Y2lkZWQgbm90IHRvIGRvIHRoYXQgbWVzcyBpbiBBUk0uLgo+ID4KPiA+IE5ldyBhcmNoaXRlY3R1
cmVzIGRvaW5nIGtkdW1wIHNob3VsZCBwdXQgdGhlIGlvbW11IGluIGEgZnVsbCBibG9ja2luZwo+
ID4gc3RhdGUgYmVmb3JlIGhhbmRpbmcgb3ZlciB0aGUgbmV4dCBrZXJuZWwsIGFuZCB0aGlzIGlt
cGxpZXMgdGhhdAo+ID4gZGV2aWNlcyBkcml2ZXJzIG5lZWQgdG8gY2xlYW5seSBzdXNwZW5kIHRo
ZWlyIERNQXMgYmVmb3JlIGdvaW5nIGludG8KPiA+IHRoZSBuZXh0IGtlcm5lbC4KPgo+IEdsYWQg
dG8gaGVhciB0aGF0LiA6LSkKPgo+IFdpdGggdGhlIGFib3ZlIGNvbnNpZGVyYXRpb24sIHRoZSBk
cml2ZXIgc2hvdWxkIGNvbnNpZGVyIGl0IGFuIGVycm9yCj4gY2FzZSB3aGVyZSB0aGUgaW9tbXUg
aXMgbm90IGluIHRoZSBibG9ja2luZyBzdGF0ZSwgYW5kIGl0J3MgaW4gdGhlIGtkdW1wCj4ga2Vy
bmVsLCByaWdodD8KPgo+IElmIHNvLCBwcm9iYWJseSB0aGUgaW9tbXUgZHJpdmVyIHNob3VsZCBh
bHdheXMgcmV0dXJuIGZhaWx1cmUgd2hlbiB0aGUKPiBpb21tdSBpcyBub3QgaW4gdGhlIGJsb2Nr
aW5nIHN0YXRlLiBIb3dldmVyLCB0aGUgUklTQy1WJ3MgbG9naWMgaXM6Cj4KPiAgIC0gaWYgdGhp
cyBpcyBhIGtkdW1wIGtlcm5lbCwganVzdCBkaXNhYmxlIGlvbW11Owo+ICAgLSBvdGhlcndpc2Us
IGZhaWx1cmUgY2FzZS4KPgo+IFRoaXMgbG9naWMgc2VlbXMgcHJvYmxlbWF0aWMuCj4KCkluaXRp
YWwgaW1wbGVtZW50YXRpb24gcmVjb2duaXplIHRoaXMgYXMgYW4gZXJyb3IgYW5kIGZhaWxlZCB0
bwppbml0aWFsaXplIElPTU1VIHdhcyBpbiBub24tZGVmYXVsdCBzdGF0ZSAoZGlzYWJsZWQgb3Ig
cGFzcy10aHJvdWdoKS4KSWRlYWxseSB3ZSBzaG91bGQgaGF2ZSBwcm9wZXIgc2h1dGRvd24gc2Vx
dWVuY2UgZm9yIGtkdW1wIGNhc2UsIGFuZApxdWllc2NlIElPTU1VIGJlZm9yZSBrZHVtcCBrZXJu
ZWwgcnVucy4gSG93ZXZlciwgdGhpcyBwYXRoIGlzCnByb2JsZW1hdGljIGVub3VnaCB0aGF0IEkn
ZCBwcmVmZXIgbm90IHRvIGFkZCBhbnkgb3RoZXIgY29tcGxpY2F0aW9ucwp0byB0aGlzIHBhdGNo
IHNldC4gRGVmaW5pdGVseSBzZXR0aW5nIElPTU1VIGluIGEgZnVsbCBibG9ja2luZyBzdGF0ZQpi
ZWZvcmUgaGFuZGxpbmcgb3ZlciB0byBrZHVtcCBrZXJuZWwuIFdpbGwgZ2V0IGJhY2sgdG8gdGhh
dCBhdCBzb21lCnBvaW50LgoKRHJvcHBpbmcgYWxsIElPTU1VIGNvbmZpZyBpbiBrZHVtcCBwYXRo
IGlzIElNSE8gdGhlIGNvbXByb21pc2Ugd2UgY2FuCmFjY2VwdCwgIGxlYXZpbmcga2R1bXAga2Vy
bmVsIGFuIG9wdGlvbiB0byByZWNvbmZpZ3VyZSBJT01NVSBpbiBsYXRlcgpzdGFnZXMgb2YgdGhl
IElPTU1VIGluaXRpYWxpemF0aW9uLgoKPiBCZXN0IHJlZ2FyZHMsCj4gYmFvbHUKCkJlc3QsCi0g
VG9tYXN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
