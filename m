Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43418CAC5B0
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 06:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tl+QDze2jwL1a6l5xbjunFsmIjqe0y/ggjaeGyosuqc=; b=wxxbcGCWxNB0I/
	009MLNxNuUOx5UbtF4LWoVlPxquZ3ZCmHgrMEqFM+SO6zhvlPxPuaz3SyFzw5Oy27C6E73aJLJNhO
	rdu+ZK0ho/Pyrhl++IAmpxtw5ULP94vufO5LwZGWOI57E1CZaZKIv4iBJd7103poWB+Xm7hjgUe/d
	SuehkHSqRFiKMmHkjr5ZHAjEGagdJsFAN9cYWCw6d+Cdlsr9dCnPKS0eYcgBHNSMi2FxJ6QgCHzFB
	yK3bUZddMgFLc4eQByUfW4KVsa8yPjBkuWXv2g3x6+4ty/Xjhbc9OFJsizLkC6JO9thzMq0gv5Qrw
	gFyxdALamEQ0024lRDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Cya-00000009k3Q-3AXs;
	Thu, 02 Oct 2025 06:39:40 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CyY-00000009k2f-0a20
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 06:39:39 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-636255b92c9so1078467a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 23:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759387176; x=1759991976; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ap0trZKBpNWQl5/rOaHJpgxg2gWd6IXjcEn0D7NKp8s=;
        b=h9HrxGtfAAVNDYMuMH5td7uZval3nUL/Pi6r/f5L8//HbukhBq2ZudMUMrzUNioJ2M
         qxUIBIvbiyZB9VA07S2JozeY9jD9jg1sjVfIhpN1yoXx9qVkhC1sDzR9vagxdmeozPs1
         fcs+FLoh8l0/KnQLETSoqTIEOaqTlJlbOQlbyXus/+ukMqsyqOhkBVEX9yVmzDj8Nnis
         UFEO2yshgZVkGiIsY7JcpZ7J8Uy0znxLGuACIlNDPA+X98WtJ2EKDm7rt/Zrn4+Hss8q
         tIY4mnjhMGsjmFwaHonS/LWtvdKtLdfjEPzRQo6ol2U2ky8LBEx1MA4dK+1vMyr+o6J1
         1UvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759387176; x=1759991976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ap0trZKBpNWQl5/rOaHJpgxg2gWd6IXjcEn0D7NKp8s=;
        b=Oy/eQt6Dk/vUjROhQeZ78cNSfmtazKwUf7vknpESp9mjGKRmfpWFlIQ43OeeMboAjr
         yLXDm1r4Vmtl2pfuryrLQZdKgcO8rKMnoJh1nCeliquJIpJx0osLu0ft02XSZ8RJOxjS
         svckOW6p87b/qARXm/oenOK/+IrooM32amG1Hr+P8QT6qy2cYCUE4T0dtF1Wt6ai6aTG
         k5zn46QgEirUDP/CdYDNx61kmAAZXYzY8POkpPBKCE0pShKBqIylRSG3v0cWb9dMgY4c
         B/Pej89D1fPB2xeMHh3mvxcKO9NeZ4twRzRBzsZxX71YyGuFUspCMMlRj1pdxpl8r7h+
         dmkg==
X-Forwarded-Encrypted: i=1; AJvYcCWksrLdtomRU+rvVDhKZhGjw5t17klVl4vTVhH0BHloJRm7sP6WqAvtiyTJUvcd9npMcqwQSek8eHj84g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzW3wI2ehGCGFbb/XAb1rl8Gmu9iaZ+faZptt04JXO/ajRN5BwU
	7/Ef3GMj80n/m7DHth6d5MmjSSXRUQzRxXiSfOoyyJt51/y7YzSfVUnITsmWKCWZn8hhNeYkxwm
	Sxr9N2QAl4NDJCjDS0WmuyCUXvnsbdlA6+tnNKWMvuQ==
X-Gm-Gg: ASbGncstB7ehBfXbB1Ij3quP8Y9WsBew9jpW1z1ugljG/JEVH4g8j7yL5MyIWEPQtOf
	JgcMAeZ7imTOLIpV6LutJLH6stZKsQ8LPvYqquY0sno1wAL2dQHbYADxso+EbKktmGuotcoTfrg
	9yg6+adTVi8rvrZBz+lEVMq6dNVvNYrbtLYyLK5Ej4ZpP+7kWnlnIMxq3s7BkPI6AJbcfYHMyIQ
	nhV4CvsPMrJ0Up0EDY6NoAzO0PfDVsW
X-Google-Smtp-Source: AGHT+IGUnzkdj2lcswlCqZDgs5Ku4aNkdI+TCKF6++VOCgMZT/hqD8+gC7knGTQNNiNEvjduQzqESNvMwlxPh6pZTY4=
X-Received: by 2002:a17:907:3cca:b0:b3c:7df0:f4a3 with SMTP id
 a640c23a62f3a-b46e4d7dbcdmr752400266b.17.1759387176253; Wed, 01 Oct 2025
 23:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251002060732.100213-1-apatel@ventanamicro.com> <2025100208-challenge-protrude-d6c3@gregkh>
In-Reply-To: <2025100208-challenge-protrude-d6c3@gregkh>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 2 Oct 2025 12:09:23 +0530
X-Gm-Features: AS18NWDhJNRsJZTZD3Q1-o5Xm6vaJUsnLrA5WXVNJsHWXEPoxcIqYp1hBGzENNI
Message-ID: <CAK9=C2U9FV6crTL1G2X6tUM=RyRnPBm1dPeFc29n3vmrFTcfHw@mail.gmail.com>
Subject: Re: [PATCH 00/11] Linux RISC-V trace framework and drivers
To: Greg KH <gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_233938_192834_AEFBD90B 
X-CRM114-Status: GOOD (  13.16  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Atish Patra <atish.patra@linux.dev>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Liang Kan <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@redhat.com>, Adrian Hunter <adrian.hunter@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBPY3QgMiwgMjAyNSBhdCAxMTo1NuKAr0FNIEdyZWcgS0ggPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDAyLCAyMDI1IGF0IDExOjM3OjIx
QU0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBUaGlzIHNlcmllcyBhZGRzIGluaXRpYWwg
c3VwcG9ydCBmb3IgUklTQy1WIHRyYWNlIGZyYW1ld29yayBhbmQgZHJpdmVycy4KPiA+IFRoZSBS
SVNDLVYgdHJhY2UgdjEuMCBzcGVjaWZpY2F0aW9uIGlzIGFscmVhZHkgcmF0aWZpZWQgYW5kIGNh
biBiZSBmb3VuZCBhdDoKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL2UtdHJh
Y2UtZW5jYXAvcmVsZWFzZXMvdGFnL3YxLjAuMC1yYXRpZmllZAo+ID4gaHR0cHM6Ly9naXRodWIu
Y29tL3Jpc2N2LW5vbi1pc2EvdGctbmV4dXMtdHJhY2UvcmVsZWFzZXMvdGFnLzEuMF9SYXRpZmll
ZAo+ID4KPiA+IFRoZSBSSVNDLVYgdHJhY2UgZnJhbWV3b3JrIGFuZCBkcml2ZXJzIGFyZSBkZXNp
Z25lZCB0byBiZSBhZ25vc3RpYyB0byB0aGUKPiA+IHVuZGVybHlpbmcgdHJhY2UgcHJvdG9jb2wg
aGVuY2UgYm90aCBSSVNDLVYgRS10cmFjZSBhbmQgUklTQy1WIE4tdHJhY2Ugc2hvdWxkCj4gPiB3
b3JrIGZpbmUuIFRoZSBkaXNjb3Zlcnkgb2YgdHJhY2UgcHJvdG9jbCBwYXJhbWV0ZXJzIGFyZSBs
ZWZ0IHRvIHVzZXItc3BhY2UKPiA+IHRyYWNlIGRlY29kZXIuCj4gPgo+ID4gSW4gdGhlciBmdXR1
cmUsIHRoZXJlIHdpbGwgYmUgc3Vic2VxdWVudCBzZXJpZXMgYWRkaW5nOgo+ID4gMSkgU3lzZnMg
c3VwcG9ydAo+Cj4gd2h5IGRvZXMgInRyYWNlIiBuZWVkIHN5c2ZzIHN1cHBvcnQ/ICBObyBvdGhl
ciBjcHUgcGxhdGZvcm0gdXNlcyB0aGF0Cj4gdG9kYXksIHNvIHdoeSBpcyBhIG5ldyB1c2VyL2tl
cm5lbCBhcGkgbmVlZGVkPwoKV2Ugc2F3IHRyYWNlIHN1cHBvcnQgZm9yIG90aGVyIGFyY2hpdGVj
dHVyZXMgKGUuZy4gQVJNIGNvcmVzaWdodCkgYWxsb3dpbmcKdHJhY2Ugc3RhcnQvc3RvcCB0aHJv
dWdoIHN5c2ZzLiBJZiB0aGlzIGlzIGFuIG9ic29sZXRlIG9yIG5vdCBwcmVmZXJyZWQgYXBwcm9h
Y2gKdGhlbiB3ZSB3aWxsIGRlcHJpb3JpdGl6ZSBhbmQgcG9zc2libHkgbmV2ZXIgYWRkIGl0LgoK
UmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
