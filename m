Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D77BC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 14:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltQG3qtqRcysZ9k2IaM3hqao9HSmMxKGXYw+li2ppUo=; b=oDuAh38iDASqTR
	fsOPKyUMhjgWRUVwomEuLEkgwKVFS0u/80Z0uNrFmNR15J5GeoMptwIki/7naH83LoXTsI6kmevJH
	EDtZI2JHxOgsPTO30nOKh3qYWKmtSTUIuqEaYtnJiTa3p6r7FPzHDkcoUQ/UHbmiEaRSp/Cr8oFyi
	liDV3Gy7CwFJjTu87gffh21npUijw5+txZntZyp9hRaKU6AC06aZstYeedE8q1LuA1gSweXXvAnvo
	+TlatKE+y4cDVri/vCqUh8FfIZ+9KXmqhI5x19sdpPmSny0PKAaqJrM5IgfyA1cHdxLPTRZkLnF18
	YzTehN6b4p0cPes9CZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7cjZ-002iUT-0q;
	Mon, 27 Nov 2023 14:37:13 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7cjV-002iSn-2q
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 14:37:11 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cfbda041f3so13115205ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 06:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1701095829; x=1701700629; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTOVcypQtVTFXZLfWHCe+N3Q12yUhXgQHc0UVNtkCoA=;
        b=Bhi+E77RAiS8cTgrXUwCXAxRa7PY9E+DBs7XYhP1tdlTcUYVG42khzaP7VdtfBaayS
         89kY1O5dogJ8qkq/kpkvmEB5qwP2qgRBCmISVWa76hT30ANaFPiUE/AwNq629AHOqLXe
         TI1Fj72McORgtNa4Z6pCCKqEMI5d7tZxbobfA0rrLPW8ny35AqqL4AfYRVvoCNLVCLkQ
         hLOyCU2MMlv7Ova90Gm9CfzrpSmoN8x4Vawt278LJUCUOrIthT6QifxyAv4QZ1UbEvXm
         zS8UmhAevy0kyXkb9MV94BdGVcyiA+ev2I3DuRCYIcv1Tm07Ykm/faXBql3x3OEuHtxp
         IP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701095829; x=1701700629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTOVcypQtVTFXZLfWHCe+N3Q12yUhXgQHc0UVNtkCoA=;
        b=bBKOfSQEU67cunqYtceqM/SdPq4Leo24uLBthKOF++NOMGlWXUbsiVjPF5ZL2CNkdk
         Cyvw1LjpyP0vpY7iWrhERyXR6tnGIErHDfi+AXLHk8O8JTiKFr3N2BV4l7VcFDCWnOXL
         6AF9W0hDXgk/Aa8IFicYsKbm2KxlzVA7RgSuVxEIxzq7IsEM46LacVABnNCfNhxgkWVq
         OFtG5b5FHD1v2PYAfFjzty9XeAwNIDwFaMvdpz++y1hsmwTmdNA6PvdeZnkXe0A0bEmJ
         UzFIkl+t2vs57P6LLJDxCnItk2RMdoI8BkEBFbOwXuPr3uwwVW+jQ3rL8tAiMZk6kIKE
         6Q7g==
X-Gm-Message-State: AOJu0YxvmEozTT6nbjC+tJZ9vHe0VmfzsJGOv6m6WQarC+JgfSCBOhg0
	PwOeaTOs/N6LrkQlg6JSGgwrRI/EKRv8Jveofo1qOw==
X-Google-Smtp-Source: AGHT+IEqiGw8cZsLsTuXV7V9RWHgcqAqIuGMwaeWQRzgkPyJ/z9ud9P0jKpwYm+TXJaPLPaE+VQDYAAo3ye99gZjpCI=
X-Received: by 2002:a17:90b:1b07:b0:285:9d0d:7e3 with SMTP id
 nu7-20020a17090b1b0700b002859d0d07e3mr10951786pjb.38.1701095828964; Mon, 27
 Nov 2023 06:37:08 -0800 (PST)
MIME-Version: 1.0
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
 <20231124072142.2786653-3-christoph.muellner@vrull.eu> <2de6d526-918b-44f6-b26a-a0f30c42c5b3@sifive.com>
In-Reply-To: <2de6d526-918b-44f6-b26a-a0f30c42c5b3@sifive.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Mon, 27 Nov 2023 15:36:57 +0100
Message-ID: <CAEg0e7hPvpCcqn4VLsmuUkyoZSZ_oTBLJraR653yUcFPKsq3vw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/5] RISC-V: Expose Ssdtso via hwprobe API
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <apatel@ventanamicro.com>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>, 
	Guo Ren <guoren@kernel.org>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Will Deacon <will@kernel.org>, Daniel Lustig <dlustig@nvidia.com>, 
	Peter Zijlstra <peterz@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_063709_950212_C127F891 
X-CRM114-Status: GOOD (  20.85  )
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

T24gTW9uLCBOb3YgMjcsIDIwMjMgYXQgMzozMuKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIENocmlzdG9waCwKPgo+IE9uIDIwMjMt
MTEtMjQgMToyMSBBTSwgQ2hyaXN0b3BoIE11ZWxsbmVyIHdyb3RlOgo+ID4gRnJvbTogQ2hyaXN0
b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+Cj4gPgo+ID4gVGhpcyBw
YXRjaCBhZGRzIFNzZHRzbyB0byB0aGUgbGlzdCBvZiBleHRlbnNpb25zIHdoaWNoCj4gPiBhcmUg
YW5ub3VuY2VkIHRvIHVzZXItc3BhY2UgdXNpbmcgdGUgaHdwcm9iZSBBUEkuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwu
ZXU+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwg
MyArKysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCj4g
PiAgYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgICAgICAgICB8IDEgKwo+ID4gIDMgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9o
d3Byb2JlLnJzdAo+ID4gaW5kZXggN2IyMzg0ZGU0NzFmLi44ZGUzMzQ5ZTBjYTIgMTAwNjQ0Cj4g
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+ID4gQEAgLTgwLDYgKzgwLDkgQEAg
VGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgo+ID4gICAgKiA6YzptYWNybzpgUklTQ1Zf
SFdQUk9CRV9FWFRfWklDQk9aYDogVGhlIFppY2JveiBleHRlbnNpb24gaXMgc3VwcG9ydGVkLCBh
cwo+ID4gICAgICAgICByYXRpZmllZCBpbiBjb21taXQgM2RkNjA2ZiAoIkNyZWF0ZSBjbW9iYXNl
LXYxLjAucGRmIikgb2YgcmlzY3YtQ01Pcy4KPiA+Cj4gPiArICAqIDpjOm1hY3JvOmBSSVNDVl9I
V1BST0JFX0VYVF9aSUNCT1pgOiBUaGUgU3NkdHNvIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsIGFz
Cj4KPiBTaG91bGQgYmUgUklTQ1ZfSFdQUk9CRV9FWFRfU1NEVFNPLgoKVGhhbmtzIGZvciByZXBv
cnRpbmchCkkndmUgZml4ZWQgdGhpcyBub3cgYXMgd2VsbCBpbiB0aGUgZ2l0aHViIGJyYW5jaDoK
ICBodHRwczovL2dpdGh1Yi5jb20vY211ZWxsbmVyL2xpbnV4L3RyZWUvc3NkdHNvCgpCUgpDaHJp
c3RvcGgKCj4KPiBSZWdhcmRzLAo+IFNhbXVlbAo+Cj4gPiArICAgICAgIGluIHZlcnNpb24gdjEu
MC1kcmFmdDIgb2YgdGhlIGNvcnJlc3BvbmRpbmcgZXh0ZW5zaW9uLgo+ID4gKwo+ID4gICogOmM6
bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0aGF0IGNvbnRh
aW5zIHBlcmZvcm1hbmNlCj4gPiAgICBpbmZvcm1hdGlvbiBhYm91dCB0aGUgc2VsZWN0ZWQgc2V0
IG9mIHByb2Nlc3NvcnMuCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5o
Cj4gPiBpbmRleCBiNjU5ZmZjZmNkYjQuLmVkNDUwYzY0ZTZiMiAxMDA2NDQKPiA+IC0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiA+IEBAIC0zMCw2ICszMCw3IEBAIHN0cnVjdCBy
aXNjdl9od3Byb2JlIHsKPiA+ICAjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX0VY
VF9aQkIgICAgICAgICAgICgxIDw8IDQpCj4gPiAgI2RlZmluZSAgICAgICAgICAgICAgUklTQ1Zf
SFdQUk9CRV9FWFRfWkJTICAgICAgICAgICAoMSA8PCA1KQo+ID4gICNkZWZpbmUgICAgICAgICAg
ICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pJQ0JPWiAgICAgICAgKDEgPDwgNikKPiA+ICsjZGVmaW5l
ICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9TU0RUU08gICAgICAgICgxIDw8IDcpCj4g
PiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAgIDUKPiA+ICAjZGVmaW5lICAg
ICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTiAgICAgICAgKDAgPDwg
MCkKPiA+ICAjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1V
TEFURUQgICAgICAgKDEgPDwgMCkKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9z
eXNfcmlzY3YuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCj4gPiBpbmRleCBjNzEy
MDM3ZGJlMTAuLmM2NTRmNDNiOTY5OSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3N5c19yaXNjdi5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwo+ID4g
QEAgLTE2Miw2ICsxNjIsNyBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCBy
aXNjdl9od3Byb2JlICpwYWlyLAo+ID4gICAgICAgICAgICAgICBFWFRfS0VZKFpCQik7Cj4gPiAg
ICAgICAgICAgICAgIEVYVF9LRVkoWkJTKTsKPiA+ICAgICAgICAgICAgICAgRVhUX0tFWShaSUNC
T1opOwo+ID4gKyAgICAgICAgICAgICBFWFRfS0VZKFNTRFRTTyk7Cj4gPiAgI3VuZGVmIEVYVF9L
RVkKPiA+ICAgICAgIH0KPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
