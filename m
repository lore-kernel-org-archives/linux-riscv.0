Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366FAE69E82
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 18:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n00/MnaoDNJIQWPFC1qDg1MYaHjVcr2Tm2S/+JMnyWM=; b=rFbKRsenuQc/xu
	TgRaz2sFs0jHuL6hcHWqLw2r9QfMX+/wRQ6YbcOCmZfpIUTPHD0MgbK5EI4m6oTiEku/frO7JvOZb
	eJeS1fMZdKHeB1c3DwOyhaAlUr2U6s+RykwX1ZBG/+dfDxyHUeCJgAbEKWIlCOizj+f4wIrTDjK5B
	kdjzdydP+qWlZ01aoNw0B7oU1b0dMfRCkdJvXNymnAxefX+wNOfcUVMBCEl9r4jazvMMch9ZW2AkK
	2V56BDd0m50pyXAOgucDruHiN+Ctq+UCjsDpgSq30lFqe+x1xI4wKdLrA0CAF6YJlF6eWuwARc1Hj
	VfZCcM6F4OrOGl080z4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIB7s-000000079rh-1wIc;
	Mon, 02 Dec 2024 18:26:28 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIB7p-000000079qJ-1Wvu
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 18:26:27 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21290973bcbso45783855ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Dec 2024 10:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733163984; x=1733768784; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1fSjzDB3EYral3FJfD5w5SvZiqHwVm4ThrouSzXoG0=;
        b=dew7p8cE1ZTX5NFMGMd6ijLah/jyP4jOooISgU5H5U9Rb6+g7KKZaFGwXyKYPN5zP7
         +euJM0yEa1zt573pED/WU38pHmqiD2V8KW9adCUYqxh08o5NLvw9+TaFEHc9TcD7m4Il
         bmEqFl5ZEsj/i+5fxe7/ygoJnKPtT+tYMy/0JNXANGprKDKRUZXZvBem2xsMoDBoiK31
         bC/A1UPOLYqwtwjAGcv4jZHVAsx1rRi31d9dGjRJdM+K3As+L/wdruKXCvD3aJbKlhx7
         Pkhrlhy4hn2euOxIBU/SsPpdQHvCBmWabb6Dn9Y6EeGOIKwUUrD00v234piTlcZLJFhM
         1FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733163984; x=1733768784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1fSjzDB3EYral3FJfD5w5SvZiqHwVm4ThrouSzXoG0=;
        b=PxcH35PXYY//S/iCjVJkx90sWUYCRT1/OG1/hdgmtyVHspFZI8hi4+zjh0n4VUiUVp
         dmXUTw6zD34aHKBmQp1v8zP2dd8UK7QE4VLlXl9mGDilJXDKLfUh+HjRKsp21dJkNSCE
         C803hr6Gslz7ohVB5wYVeB6s0R+1Uo923ZsMhH+mJwpXdg/d0psgr+DbQVu5Hy21ZNXO
         DJDXYTBP+HI41lcDCoPG+47jji3uleWL+ktVet5RehKbhjPBOBQVyH0UnDFZ47rkr1Qp
         8DMdbu3HqPWwATPOdnlPF1MawiG9KfMfPe9sNnnYrdb0pal3czi8tAtiFOm9wDOenWtR
         rIHw==
X-Forwarded-Encrypted: i=1; AJvYcCUZKGNJLICG2IRmroqcK2L6+/GP3TENJfiwMcBJWYeyEJ5jtA1V+P4KMRv3aB6qwhMjABTTEkxM2sz3lQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFslbnsWEdqHZhL1pi+k4iEWbnbGzaICvlzJ2DvH1snH0jJsDB
	8OVhG6vFRrGDD/FTCOsYJESN9l6cduHrtRcIKM/+MICiUtC9S+N8EKW5F/KUHuCP6RyuZbmMdIl
	bX+YoVanjnTSpNCEjJcXdfH6V9GktO6aBtB17Lg==
X-Gm-Gg: ASbGncuS7pag3/IxrN9sr4Q0VaHL6mfx4YslRa5e97sdcQsFW19a+H9TzyOZ4flmKbX
	Y4/P1kX7ppdHC5LNEsKYLMEUGhgHDEg==
X-Google-Smtp-Source: AGHT+IHisvs3rWpMuRQOWixPnTvVtgjxW+u1yNS90T+VjRikLrDQHeBjU8J20X11uqJqFe47EIY9Qqlj+A9dyAN+3sc=
X-Received: by 2002:a17:902:f54c:b0:215:8695:ef91 with SMTP id
 d9443c01a7336-2158695f663mr92656975ad.6.1733163984202; Mon, 02 Dec 2024
 10:26:24 -0800 (PST)
MIME-Version: 1.0
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-2-a4f9691421f8@rivosinc.com> <77b7b44f-e05a-4845-8d45-0e0d831bb8e7@ghiti.fr>
In-Reply-To: <77b7b44f-e05a-4845-8d45-0e0d831bb8e7@ghiti.fr>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 2 Dec 2024 10:26:13 -0800
Message-ID: <CAHBxVyHZvLrKNCAPJfHxYYn30Mm++J=mff+tVU9GZ_8rt3WnEg@mail.gmail.com>
Subject: Re: [PATCH 2/8] drivers/perf: riscv: Fix Platform firmware event data
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_102625_401108_3BE9A0D0 
X-CRM114-Status: GOOD (  26.57  )
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

T24gVGh1LCBOb3YgMjgsIDIwMjQgYXQgNToxMOKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cj4KPiBIaSBBdGlzaCwKPgo+IE9uIDE5LzExLzIwMjQgMjE6MjksIEF0
aXNoIFBhdHJhIHdyb3RlOgo+ID4gUGxhdGZvcm0gZmlybXdhcmUgZXZlbnQgZGF0YSBmaWVsZCBp
cyBhbGxvd2VkIHRvIGJlIDYyIGJpdHMgZm9yCj4gPiBMaW51eCBhcyB1cHBwZXIgbW9zdCB0d28g
Yml0cyBhcmUgcmVzZXJ2ZWQgdG8gaW5kaWNhdGUgU0JJIGZ3IG9yCj4gPiBwbGF0Zm9ybSBzcGVj
aWZpYyBmaXJtd2FyZSBldmVudHMuCj4gPiBIb3dldmVyLCB0aGUgZXZlbnQgZGF0YSBmaWVsZCBp
cyBtYXNrZWQgYXMgcGVyIHRoZSBoYXJkd2FyZSByYXcKPiA+IGV2ZW50IG1hc2sgd2hpY2ggaXMg
bm90IGNvcnJlY3QuCj4gPgo+ID4gRml4IHRoZSBwbGF0Zm9ybSBmaXJtd2FyZSBldmVudCBkYXRh
IGZpZWxkIHdpdGggcHJvcGVyIG1hc2suCj4gPgo+ID4gRml4ZXM6IGYwYzkzNjNkYjJkZCAoInBl
cmYvcmlzY3Ytc2JpOiBBZGQgcGxhdGZvcm0gc3BlY2lmaWMgZmlybXdhcmUgZXZlbnQgaGFuZGxp
bmciKQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMu
Y29tPgo+ID4gLS0tCj4gPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCAgMSArCj4g
PiAgIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgfCAxMiArKysrKy0tLS0tLS0KPiA+ICAg
MiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3NiaS5oCj4gPiBpbmRleCA5OGY2MzFiMDUxZGIuLjliZTM4YjA1ZjRhZCAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiA+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiA+IEBAIC0xNTgsNiArMTU4LDcgQEAgc3RydWN0IHJp
c2N2X3BtdV9zbmFwc2hvdF9kYXRhIHsKPiA+ICAgfTsKPiA+Cj4gPiAgICNkZWZpbmUgUklTQ1Zf
UE1VX1JBV19FVkVOVF9NQVNLIEdFTk1BU0tfVUxMKDQ3LCAwKQo+ID4gKyNkZWZpbmUgUklTQ1Zf
UE1VX1BMQVRfRldfRVZFTlRfTUFTSyBHRU5NQVNLX1VMTCg2MSwgMCkKPiA+ICAgI2RlZmluZSBS
SVNDVl9QTVVfUkFXX0VWRU5UX0lEWCAweDIwMDAwCj4gPiAgICNkZWZpbmUgUklTQ1ZfUExBVF9G
V19FVkVOVCAweEZGRkYKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3Bt
dV9zYmkuYyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+IGluZGV4IGNiOThlZmE5
YjEwNi4uNTBjYmRiZjY2YmI3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9wZXJmL3Jpc2N2X3Bt
dV9zYmkuYwo+ID4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ID4gQEAgLTUw
OCw3ICs1MDgsNiBAQCBzdGF0aWMgaW50IHBtdV9zYmlfZXZlbnRfbWFwKHN0cnVjdCBwZXJmX2V2
ZW50ICpldmVudCwgdTY0ICplY29uZmlnKQo+ID4gICB7Cj4gPiAgICAgICB1MzIgdHlwZSA9IGV2
ZW50LT5hdHRyLnR5cGU7Cj4gPiAgICAgICB1NjQgY29uZmlnID0gZXZlbnQtPmF0dHIuY29uZmln
Owo+ID4gLSAgICAgdTY0IHJhd19jb25maWdfdmFsOwo+ID4gICAgICAgaW50IHJldDsKPiA+Cj4g
PiAgICAgICAvKgo+ID4gQEAgLTUyOSwyMSArNTI4LDIwIEBAIHN0YXRpYyBpbnQgcG11X3NiaV9l
dmVudF9tYXAoc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50LCB1NjQgKmVjb25maWcpCj4gPiAgICAg
ICBjYXNlIFBFUkZfVFlQRV9SQVc6Cj4gPiAgICAgICAgICAgICAgIC8qCj4gPiAgICAgICAgICAg
ICAgICAqIEFzIHBlciBTQkkgc3BlY2lmaWNhdGlvbiwgdGhlIHVwcGVyIDE2IGJpdHMgbXVzdCBi
ZSB1bnVzZWQKPiA+IC0gICAgICAgICAgICAgICogZm9yIGEgcmF3IGV2ZW50Lgo+ID4gKyAgICAg
ICAgICAgICAgKiBmb3IgYSBoYXJkd2FyZSByYXcgZXZlbnQuCj4gPiAgICAgICAgICAgICAgICAq
IEJpdHMgNjM6NjIgYXJlIHVzZWQgdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiByYXcgZXZlbnRzCj4g
PiAgICAgICAgICAgICAgICAqIDAwIC0gSGFyZHdhcmUgcmF3IGV2ZW50Cj4gPiAgICAgICAgICAg
ICAgICAqIDEwIC0gU0JJIGZpcm13YXJlIGV2ZW50cwo+ID4gICAgICAgICAgICAgICAgKiAxMSAt
IFJpc2MtViBwbGF0Zm9ybSBzcGVjaWZpYyBmaXJtd2FyZSBldmVudAo+ID4gICAgICAgICAgICAg
ICAgKi8KPiA+IC0gICAgICAgICAgICAgcmF3X2NvbmZpZ192YWwgPSBjb25maWcgJiBSSVNDVl9Q
TVVfUkFXX0VWRU5UX01BU0s7Cj4gPiArCj4gPiAgICAgICAgICAgICAgIHN3aXRjaCAoY29uZmln
ID4+IDYyKSB7Cj4gPiAgICAgICAgICAgICAgIGNhc2UgMDoKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICByZXQgPSBSSVNDVl9QTVVfUkFXX0VWRU5UX0lEWDsKPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAqZWNvbmZpZyA9IHJhd19jb25maWdfdmFsOwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICplY29uZmlnID0gY29uZmlnICYgUklTQ1ZfUE1VX1JBV19FVkVOVF9NQVNLOwo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gICAgICAgICAgICAgICBjYXNlIDI6Cj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgcmV0ID0gKHJhd19jb25maWdfdmFsICYgMHhGRkZGKSB8Cj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoU0JJX1BNVV9FVkVOVF9UWVBFX0ZXIDw8IDE2
KTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXQgPSAoY29uZmlnICYgMHhGRkZGKSB8IChT
QklfUE1VX0VWRU5UX1RZUEVfRlcgPDwgMTYpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ID4gICAgICAgICAgICAgICBjYXNlIDM6Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
LyoKPiA+IEBAIC01NTIsNyArNTUwLDcgQEAgc3RhdGljIGludCBwbXVfc2JpX2V2ZW50X21hcChz
dHJ1Y3QgcGVyZl9ldmVudCAqZXZlbnQsIHU2NCAqZWNvbmZpZykKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgKiBFdmVudCBkYXRhIC0gcmF3IGV2ZW50IGVuY29kaW5nCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICovCj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gU0JJX1BNVV9F
VkVOVF9UWVBFX0ZXIDw8IDE2IHwgUklTQ1ZfUExBVF9GV19FVkVOVDsKPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAqZWNvbmZpZyA9IHJhd19jb25maWdfdmFsOwo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICplY29uZmlnID0gY29uZmlnICYgUklTQ1ZfUE1VX1BMQVRfRldfRVZFTlRfTUFTSzsK
PiA+ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgICAgICAgICAgfQo+ID4g
ICAgICAgICAgICAgICBicmVhazsKPiA+Cj4KPiBJdCBzZWVtcyBpbmRlcGVuZGVudCBmcm9tIHRo
ZSBvdGhlciBwYXRjaGVzLCBzbyBJIGd1ZXNzIHdlIHNob3VsZCB0YWtlCj4gaXQgZm9yIDYuMTMg
cmNYLgo+CgpZZXMuIFRoaXMgcGF0Y2ggZG9lc24ndCBoYXZlIGFueSBTQkkgdjMuMCBkZXBlbmRl
bmNpZXMuIEkgd2lsbCBzZW5kCnRoaXMgcGF0Y2ggc2VwYXJhdGVseQpzbyB0aGF0IGl0IGNhbiBi
ZSBhcHBsaWVkIGZvciA2LjEzIHJjWAoKPiBMZXQgbWUga25vdyBpZiB0aGF0J3Mgbm90IHRoZSBj
YXNlLgo+Cj4gVGhhbmtzLAo+Cj4gQWxleAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
