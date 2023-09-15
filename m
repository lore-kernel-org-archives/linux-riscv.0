Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268CFEE6449
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 08:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2nBelj2Gpl1MzIt+aY4xP4W0Helzc1Jhy+O6ZY9CT8=; b=o4y0UVMTMf1y8o
	tnEO8ORAGrLBVnouXv8Rsd11ANBEUrm0lvy3KFouIyQSlvedSf6m7gtIT6+c2uQJDf3l22jecR9gA
	KqiLptG0ryECFGUr9ClvCUTvjr9l0BfADA2BX1waoRBCldUPzZkEmDncTra4FOhWuyNOmOWEhIUb3
	BcpZVw2C6MknludMMyp808RijTUq49oAjblw18dZYks5NyufjVCj4VhIWQ0aj8RBvStAHHoKNhMtK
	Q2Lx1ObKyDOW2x9MsOMiir2aRbduI/dHghHrRMX02GPAPc1bONZtO4UMi+N4UFLiqyE2DzrFnksGk
	ZsDgZ3P2uxreyUW6ReYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4S6-00AAzP-01;
	Fri, 15 Sep 2023 08:45:26 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4S2-00AAwQ-15;
	Fri, 15 Sep 2023 08:45:23 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1c4c7c1b863so142887fac.0;
        Fri, 15 Sep 2023 01:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694767519; x=1695372319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bL0AhYUxrdUzQj4Hs45z84nA3TJ4ToZSnUkbGf3bwUM=;
        b=QUSd50aZcShCezhxVpLygunrHNoyjOa5qIJEHVIWMFgceJezGTEuGzKCP6pv+6aNt2
         FYhYYPze1vIiKTy7OiIBbiSciMwdyC6h+M/G/42j/F1wBOi6s43rPhVUqA1VAQXolc55
         GvoX0t17epfe6DVkJeUjz9OpfWp/aCqzkk+Z4VwfPDBdyvR89Xu7YiV77nsTYwYkQZ+U
         DArZ5/i4OV3tJmjoUgXdEINYqEOYacImyo02Twb2b71Wf0gR7krOD+GGtNw3iGYfK2r7
         YIngtGGw78RSnPOGvpnYqgkl/ndKx8vcN7yU6TaFrfJq0ZeRNnGiJGjtY7WAE4uz8EjA
         /IRA==
X-Gm-Message-State: AOJu0Yx64xTbeV+g9WE0BriIUVYhVnT8vObGmgpqp1+2M1Wy83OFjiCC
	6TJcks0vUCYvX+ytfzyKPTvyWJ7m7U50QbspuG4=
X-Google-Smtp-Source: AGHT+IHl9PRzfbA8hGPGrt3+1ROWaBoHTLPlXkbCHBgq/t81poRMRxjJx/fiwhN8rIFqovs63lEpZzfcdrUxgqBUZyU=
X-Received: by 2002:a05:6870:4250:b0:1d5:8faf:2935 with SMTP id
 v16-20020a056870425000b001d58faf2935mr1048882oac.4.1694767518748; Fri, 15 Sep
 2023 01:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230913163823.7880-1-james.morse@arm.com> <20230913163823.7880-28-james.morse@arm.com>
 <CAMj1kXHRAt7ecB9p_dm3MjDL5wZkAsVh30hMY2SV_XUe=bm6Vg@mail.gmail.com>
 <20230914155459.00002dba@Huawei.com> <CAMj1kXFquiLGCMow3iujHUU4GBZx2t9KfKy1R9iqjBFjY+acaA@mail.gmail.com>
 <f5d9beea95e149ab89364dcdb0f8bf69@huawei.com> <ZQQDJT6MOaIOPmq5@shell.armlinux.org.uk>
In-Reply-To: <ZQQDJT6MOaIOPmq5@shell.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 15 Sep 2023 10:45:07 +0200
Message-ID: <CAJZ5v0jUQ+4G5ArYAtu1gvYF4356CK_QVTO4oWn0ukwdOiZaHA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 27/35] ACPICA: Add new MADT GICC flags fields [code first?]
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Salil Mehta <salil.mehta@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, James Morse <james.morse@arm.com>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "x86@kernel.org" <x86@kernel.org>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, "jianyong.wu@arm.com" <jianyong.wu@arm.com>, 
	"justin.he@arm.com" <justin.he@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_014522_377189_0562FAF7 
X-CRM114-Status: GOOD (  16.74  )
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

T24gRnJpLCBTZXAgMTUsIDIwMjMgYXQgOTowOeKAr0FNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIEZyaSwgU2VwIDE1LCAyMDIzIGF0
IDAyOjI5OjEzQU0gKzAwMDAsIFNhbGlsIE1laHRhIHdyb3RlOgo+ID4gT24geDg2LCBkdXJpbmcg
aW5pdCwgaWYgdGhlIE1BRFQgZW50cnkgZm9yIExBUElDIGlzIGZvdW5kIHRvIGJlCj4gPiBvbmxp
bmUtY2FwYWJsZSBhbmQgaXMgZW5hYmxlZCBhcyB3ZWxsIHRoZW4gcG9zc2libGUgYW5kIHByZXNl
bnQKPgo+IE5vdGUgdGhhdCB0aGUgQUNQSSBzcGVjIHNheXMgZW5hYmxlZCArIG9ubGluZS1jYXBh
YmxlIGlzbid0IGRlZmluZWQuCj4KPiAiVGhlIGluZm9ybWF0aW9uIGNvbnZleWVkIGJ5IHRoaXMg
Yml0IGRlcGVuZHMgb24gdGhlIHZhbHVlIG9mIHRoZQo+IEVuYWJsZWQgYml0LiBJZiB0aGUgRW5h
YmxlZCBiaXQgaXMgc2V0LCB0aGlzIGJpdCBpcyByZXNlcnZlZCBhbmQKPiBtdXN0IGJlIHplcm8u
Igo+Cj4gU28sIGlmIHg4NiBpcyBkb2luZyBzb21ldGhpbmcgd2l0aCB0aGUgZW5hYmxlZCAmJiBv
bmxpbmUtY2FwYWJsZQo+IHN0YXRlIChvdGhlciB0aGFuIGlnbm9yaW5nIHRoZSBvbmxpbmUtY2Fw
YWJsZSkgdGhlbiB0ZWNobmljYWxseSBpdAo+IGlzIGRvaW5nIHNvbWV0aGluZyB0aGF0IHRoZSBz
cGVjIGRvZXNuJ3QgZGVmaW5lCgpBbmQgc28gaXQgaXMgd3JvbmcuCgo+IC0gYW5kIGl0J3MKPiBj
b21wbGV0ZWx5IGZpbmUgaWYgYWFyY2g2NCBkb2VzIHNvbWV0aGluZyBlbHNlIChtYXliZSB0cmVh
dGluZyBpdAo+IHN0cmljdGx5IGFzIHBlciB0aGUgc3BlYyBhbmQgaWdub3Jpbmcgb25saW5lLWNh
cGFibGUuKQoKVGhhdCBhY3R1YWxseSBpcyB0aGUgb25seSBjb21wbGlhbnQgdGhpbmcgdGhhdCBj
YW4gYmUgZG9uZS4KCkFzIHBlciB0aGUgc3BlYyAocXVvdGVkIGFib3ZlKSwgYSBwbGF0Zm9ybSBm
aXJtd2FyZSBzZXR0aW5nCm9ubGluZS1jYXBhYmxlIHRvIDEgd2hlbiBFbmFibGVkIGlzIHNldCBp
cyBub3QgY29tcGxpYW50IGFuZCBpdCBpcwppbnZhbGlkIHRvIHRyZWF0IHRoaXMgYXMgbWVhbmlu
Z2Z1bCBkYXRhLgoKQXMgY3VycmVudGx5IGRlZmluZWQsIG9ubGluZS1jYXBhYmxlIGlzIG9ubHkg
YXBwbGljYWJsZSB0byBDUFVzIHRoYXQKYXJlIG5vdCBlbmFibGVkIHRvIHN0YXJ0IHdpdGggYW5k
IGl0cyByb2xlIGlzIHRvIG1ha2UgaXQgY2xlYXIgd2hldGhlcgpvciBub3QgdGhleSBjYW4gYmUg
ZW5hYmxlZCBsYXRlciBBRkFJQ1MuCgpJZiB0aGVyZSBpcyBhIG5lZWQgdG8gcmVwcmVzZW50IHRo
ZSBjYXNlIGluIHdoaWNoIGEgQ1BJIHRoYXQgaXMKZW5hYmxlZCB0byBzdGFydCB3aXRoIGNhbiBi
ZSBkaXNhYmxlZCwgYnV0IGNhbm5vdCBiZSBlbmFibGVkIGFnYWluLAp0aGUgc3BlYyBuZWVkcyB0
byBiZSB1cGRhdGVkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
