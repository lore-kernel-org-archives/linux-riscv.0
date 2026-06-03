Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ED5CD6E69
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 06:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qJJwmaYC5fNY+UGLScuOvjoqCxVKecvfe/PrJogx6Q=; b=3I6ubzHJccSljh
	0FwZlj+U5bzv+5657JnexwE4tBvws80+7k/x0kWPQmGuKoRDxEZ56O8mBiC+V/GwE/M+jJL1n96gI
	Q3P7SdNP0j1ZWQhrqeKjOVXW3LUZYOAFYV3/QrwJdrY2xUwY9pw3+Y+hV7oSLHc3fRidQ3W3dldMh
	UayBSFxmIWX64QJhaFVgRYoOEBEnOFeYVM9gu+daAoEQbwtYiIxj9occ1v4Us9LOISHf8qmRQztXW
	I6q0WkIPR/Y+94hFv9RW0fH0gGX7kAR5gCj9xMoU2IwPCsoHPaTHlRKbHxgTBOLHuQiZjobGzsGJS
	N0gbVFizNjk+jWPdIjpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfLP-0000000EP5s-2Y8O;
	Wed, 03 Jun 2026 06:44:51 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfLM-0000000EP4p-3AxR
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 06:44:50 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7e6deacafa8so187374a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 23:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780469087; cv=none;
        d=google.com; s=arc-20240605;
        b=HTnrSRDwhqqmQcMSf/PSutvNygQI0HnI+rBmR4dy7qoNdXvgUM3qtvwBh1DnFKZ1Pv
         u5eqhAqlq+F7JJEt/VCNsLvQ5IJTyxPJauRjn47NB8V0NZRJXIxQAQtgG49lyo+EpPUg
         /lo/CmAd2UaxP7er5WvhW4vZF9ROiaBtKSI7Rm+To0uVqARW/PL5d0OCnBsdGa73Zn7S
         ccdJjElkbZbKouLnLhF4Xh+0vTK/8cFdjjG6SuukrNU5ZWmIDRzGplGIxQog9/Cnr5nx
         DUyt1lbsdVenq2cbmYdMEBvJbeQMbP9SA1IGuUTp0Xkbc2VgnPgxRV+3dSFzmqvHktCP
         NrFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vguV3vMU4h/2CSVTFHkBd4daU9WvVPcYCYkqg5eye6Q=;
        fh=ixURo0LLHm4TvxXxaJa8WYnCXdC9dRTFsBSf+kBROYE=;
        b=aPDFB0ddSXXZF9KQRSAcMKI2F8taG3yf49IYwF7C6wKMBo1R2R/I1xDCJKCYg2U+li
         1ZADOoCNa0yeOYWxDi1TKV3PAC4ZsSTu8hNJpTCsall6K84GwQUjZbEIJk1nzg4nlLRX
         WuKX8FYmVRYx0acPhx3INAR4X9/5DjGxDPIJ63icb83oNX+7tpmQII2ovRfZtUTSpgO4
         t+cPttw04vJV7dyDwLN2LFsYUcg7TzOowmXtq20E57WW4DINoA+L7Hq0gHvMfeOViRpo
         xUS+/c2fAeDEOeHSwq9v6/Sk2orWoIIq5AwnRmNM2nelbZgWTHWeCGlmfdsql8+x/ZzA
         O2eQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780469087; x=1781073887; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vguV3vMU4h/2CSVTFHkBd4daU9WvVPcYCYkqg5eye6Q=;
        b=q2H6SgAAhRwRNpCw3Rvp0W8rD+LJTmJOxqHM05GbxHMIen810QCF43UevzoYZeHR7/
         4WQ0bnpFSPArRWGChMIpzPMrOIZFS0Ru67Vzvq516XqD8b/FG9bK+Z2kfD/yjQ54vBB0
         GZfXVf3ZexNnsbt9x0o6PCLFFu/BlYR//BmBzHgEgxiSqIlQtm3OjpySuchK/jEs7PBA
         6k9gEfxnVw0SLVSfnfghY+TCLM4lTlHpT9m8O9NIpC306EMjBqS5UJBGr5CqegCqshXc
         Z6r/wAMjzF5iq1IsvxhLQcvwJc9MIOnY5dkQW38i7PnvgEvkVo/Hzv795s9ept8ocjwr
         Wsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469087; x=1781073887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vguV3vMU4h/2CSVTFHkBd4daU9WvVPcYCYkqg5eye6Q=;
        b=MMRZDoa77VgxoW+FziXBVrDrmp7jc8hSoihE3BrKJGb2+jnI5BdXVEwns1Z9kRaLEe
         bRYgXS/BGThPxrof77CoaGFQvTGAj/t02EGzuCZeI/xKHrpWKUP4AS/djydOQTaaRDm4
         APWMe2SxBpULqyV1LQKrYfNTqRgId/2UTUrSlHM+ZhWqq5WgMznprRg7RDw3vE5GoT/5
         zioNEdxgrOjg4q1llGLsxEvjFVQBoDHe73PIrOwbguDBIljzQOq6jnc7H1DLFAaDbY8I
         Rds9O1k9jdxoiZwfSxOIxmAdno7B/9kSDXLnTKT4nUYFih1rOTR6vdoJ7IxBGARi1wXk
         jlmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/71/9bMgk0oL6vE3E2sRjZOiyllZH+03M2yfH21Kg880HiLE4/dG+hlgLVXMJ6wbnMmCgVEo5qkrZaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJmoVGONnavRCcsHVdaHQmf+UdPXQ1cOW0NyUXf+1WRRe2S0Hd
	4pPyjnreOWBiOd+rI9sdpcbWgAFkwqXj0OxlZG900WHKmTf0RAIMrtsvdr+QbJsg3fR7/zSJ8ZL
	SiIwaZ5HLLHdw5jafAuHjsz0h2NSrnkqvA/VMfnes+A==
X-Gm-Gg: Acq92OEdQUR8Q7QgQFYRNmPblK4oHx7UL8hdrPb3JOz9NP0KCKupm9Qv+ynRIU95OzS
	rF38sGHOOVkl72X+a4bxO1kKrzI5bV2pm80BAIp/e94dgXwvQTQejaOU6DmmOFDh/XqZssIiS75
	i9zTxunVlV/2m+X5C6VCm8Wa2r9C5tnmG0MPc1AoxbhWoCutDpajUjzNB3ExkNXz5Z5Xf11FGko
	dUZBh8zn5fzyXGbzC/FFVjPJ3mV0PDqx4a7LQ3HwptB72vlDZ2CaQeYWlfY9IDdPh3fbiy5DbDL
	AARhIbYLLtaHryB6YWzFoJsab7XMj4hia0EpRWoKW41mh5VrKAg9MDCADPR4Q26GYpOA/RNhSFd
	7CW+rujMGPyoK2wXzQm5AHXM6/kin/QpBq8I74A==
X-Received: by 2002:a05:6820:f014:b0:694:8fe0:152e with SMTP id
 006d021491bc7-69e48cf5960mr936756eaf.31.1780469087406; Tue, 02 Jun 2026
 23:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260526145240.1627200-1-anup.patel@oss.qualcomm.com> <89e1334f-e7c2-4992-ba39-0d23f5605275@arm.com>
In-Reply-To: <89e1334f-e7c2-4992-ba39-0d23f5605275@arm.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 12:14:36 +0530
X-Gm-Features: AVHnY4JmV0zm-0tTvkp_o34WcjHkNEMQ2AMhT0fQwQmHlV9bWdR1bNfsmtDJXa0
Message-ID: <CAAhSdy0dOeCrH2YEkEyrNQU2nyO-41AT3m4-BaYJuQ3GbocqmQ@mail.gmail.com>
Subject: Re: [PATCH] driver core: platform: Setup device MSI domain just
 before driver probe
To: Robin Murphy <robin.murphy@arm.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Tomasz Jeznach <tomasz.jeznach@linux.dev>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Saket Dumbre <saket.dumbre@intel.com>, Rahul Pathak <rahul@summations.net>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	driver-core@lists.linux.dev, iommu@lists.linux.dev, 
	acpica-devel@lists.linux.dev, Sunil V L <sunilvl@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_234449_065553_E3F87CAF 
X-CRM114-Status: GOOD (  41.10  )
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

T24gVHVlLCBNYXkgMjYsIDIwMjYgYXQgODo1M+KAr1BNIFJvYmluIE11cnBoeSA8cm9iaW4ubXVy
cGh5QGFybS5jb20+IHdyb3RlOgo+Cj4gT24gMjYvMDUvMjAyNiAzOjUyIHBtLCBBbnVwIFBhdGVs
IHdyb3RlOgo+ID4gT24gUklTQy1WLCB0aGUgTVNJIGNvbnRyb2xsZXIgKGFrYSBSSVNDLVYgSU1T
SUMpIGlzIHByb2JlZCBhcyBhIHJlZ3VsYXIKPiA+IHBsYXRmb3JtIGRldmljZSBhbmQgTVNJIGNs
aWVudCBkcml2ZXJzIGFyZSBhbHdheXMgcHJvYmVkIGFmdGVyIHRoZSBNU0kKPiA+IGNvbnRyb2xs
ZXIgZHJpdmVyIHVzaW5nIGZ3X2RldmxpbmsuIFVuZm9ydHVuYXRlbHksIHRoaXMgaXMgbm90IHN1
ZmZpY2llbnQKPiA+IHRvIGVuc3VyZSBkZXZpY2UgTVNJIGRvbWFpbiBpcyBzZXQgZm9yIE1TSSBj
bGllbnQgZGV2aWNlcyBiZWZvcmUgZHJpdmVyCj4gPiBwcm9iZSBiZWNhdXNlIE9GIGZyYW1ld29y
ayBzZXRzIGRldmljZSBNU0kgZG9tYWluIGF0IHRoZSB0aW1lIG9mIHBsYXRmb3JtCj4gPiBkZXZp
Y2UgY3JlYXRpb24gd2hlcmVhcyBBQ1BJIGZyYW1ld29yayBleHBlY3RzIGFyY2ggc3BlY2lmaWMg
Y29kZSB0byBzZXQKPiA+IHRoZSBkZXZpY2UgTVNJIGRvbWFpbiBhdCB0aGUgdGltZSBvZiBwbGF0
Zm9ybSBkZXZpY2UgY3JlYXRpb24uCj4gPgo+ID4gQ3VycmVudGx5LCB0byB3b3JrLWFyb3VuZCB0
aGUgcHJvYmxlbSBvZiBtaXNzaW5nIGRldmljZSBNU0kgZG9tYWluLAo+ID4gdmFyaW91cyBSSVND
LVYgTVNJIGNsaWVudCBkcml2ZXJzIGV4cGxpY2l0bHkgc2V0IGRldmljZSBNU0kgZG9tYWluCj4g
PiBpbiB0aGUgZHJpdmVyIHByb2JlIGZ1bmN0aW9uIHVzaW5nIGJlbG93IGNvZGUgcGF0dGVybjoK
PiA+Cj4gPiAgICAgICAvKgo+ID4gICAgICAgICogVGhlIGRldmljZSBNU0kgZG9tYWluIGZvciBw
bGF0Zm9ybSBkZXZpY2VzIG9uIFJJU0MtViBhcmNoaXRlY3R1cmUKPiA+ICAgICAgICAqIGlzIG9u
bHkgYXZhaWxhYmxlIGFmdGVyIHRoZSBNU0kgY29udHJvbGxlciBkcml2ZXIgaXMgcHJvYmVkIHNv
LAo+ID4gICAgICAgICogZXhwbGljaXRseSBjb25maWd1cmUgaGVyZS4KPiA+ICAgICAgICAqLwo+
ID4gICAgICAgaWYgKCFkZXZfZ2V0X21zaV9kb21haW4oZGV2KSkgewo+ID4gICAgICAgICAgICAg
ICAvKgo+ID4gICAgICAgICAgICAgICAgKiBUaGUgZGV2aWNlIE1TSSBkb21haW4gZm9yIE9GIGRl
dmljZXMgaXMgb25seSBzZXQgYXQgdGhlCj4gPiAgICAgICAgICAgICAgICAqIHRpbWUgb2YgcG9w
dWxhdGluZy9jcmVhdGluZyBPRiBkZXZpY2UuIElmIHRoZSBkZXZpY2UgTVNJCj4gPiAgICAgICAg
ICAgICAgICAqIGRvbWFpbiBpcyBkaXNjb3ZlcmVkIGxhdGVyIGFmdGVyIHRoZSBPRiBkZXZpY2Ug
aXMgY3JlYXRlZAo+ID4gICAgICAgICAgICAgICAgKiB0aGVuIHdlIG5lZWQgdG8gc2V0IGl0IGV4
cGxpY2l0bHkgYmVmb3JlIHVzaW5nIGFueSBwbGF0Zm9ybQo+ID4gICAgICAgICAgICAgICAgKiBN
U0kgZnVuY3Rpb25zLgo+ID4gICAgICAgICAgICAgICAgKi8KPiA+ICAgICAgICAgICAgICAgaWYg
KGlzX29mX25vZGUoZndub2RlKSkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgIG9mX21zaV9j
b25maWd1cmUoZGV2LCBkZXZfb2Zfbm9kZShkZXYpKTsKPiA+ICAgICAgICAgICAgICAgfSBlbHNl
IGlmIChpc19hY3BpX2RldmljZV9ub2RlKGZ3bm9kZSkpIHsKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgaXJxX2RvbWFpbiAqbXNpX2RvbWFpbjsKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBtc2lfZG9tYWluID0gaXJxX2ZpbmRfbWF0Y2hpbmdfZndub2RlKGltc2ljX2FjcGlfZ2V0
X2Z3bm9kZShkZXYpLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgRE9NQUlOX0JVU19QTEFURk9STV9NU0kpOwo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIGRldl9zZXRfbXNpX2RvbWFpbihkZXYsIG1zaV9kb21haW4pOwo+ID4g
ICAgICAgICAgICAgICB9Cj4gPgo+ID4gICAgICAgICAgICAgICBpZiAoIWRldl9nZXRfbXNpX2Rv
bWFpbihkZXYpKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRVBST0JFX0RFRkVS
Owo+ID4gICAgICAgfQo+ID4KPiA+IEluc3RlYWQgb2YgdGhlIGFib3ZlIGFwcHJvYWNoLCBleHRl
bmQgdGhlIHBsYXRmb3JtX2RtYV9jb25maWd1cmUoKSB0byBzZXQKPiA+IGRldmljZSBNU0kgZG9t
YWluIGZvciBib3RoIE9GIGFuZCBBQ1BJIGJhc2VkIHBsYXRmb3JtIGRldmljZXMgYmVmb3JlIGRy
aXZlcgo+ID4gcHJvYmUgYW5kIHJlbW92ZSB0aGUgZHVwbGljYXRlIGNvZGUgcGF0dGVybiBmcm9t
IFJJU0MtViBNU0kgY2xpZW50IGRyaXZlcnMuCj4gPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBTdW5p
bCBWIEwgPHN1bmlsdmxAb3NzLnF1YWxjb21tLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFN1bmls
IFYgTCA8c3VuaWx2bEBvc3MucXVhbGNvbW0uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQ
YXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMv
YWNwaS9yaXNjdi9pcnEuYyAgICAgICAgICAgICAgICB8IDEzICsrKysrKysrKysrCj4gPiAgIGRy
aXZlcnMvYWNwaS9zY2FuLmMgICAgICAgICAgICAgICAgICAgICB8IDEwICsrKysrKysrKwo+ID4g
ICBkcml2ZXJzL2Jhc2UvcGxhdGZvcm0uYyAgICAgICAgICAgICAgICAgfCAgNCArKysrCj4gPiAg
IGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGxhdGZvcm0uYyAgICB8ICA5IC0tLS0tLS0tCj4g
PiAgIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbXNpLmMgICB8IDI3IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gPiAgIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtcnBtaS1zeXNt
c2kuYyB8IDI5IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAgZHJpdmVycy9tYWlsYm94
L3Jpc2N2LXNiaS1tcHh5LW1ib3guYyAgIHwgMjkgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ID4gICBpbmNsdWRlL2FjcGkvYWNwaV9idXMuaCAgICAgICAgICAgICAgICAgfCAgMSArCj4gPiAg
IGluY2x1ZGUvbGludXgvYWNwaS5oICAgICAgICAgICAgICAgICAgICB8IDEwICsrKysrKysrKwo+
ID4gICA5IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDk0IGRlbGV0aW9ucygtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvcmlzY3YvaXJxLmMgYi9kcml2ZXJzL2Fj
cGkvcmlzY3YvaXJxLmMKPiA+IGluZGV4IDliODhkMDk5M2U4OC4uMTdmYTVkY2RkMmMwIDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9hY3BpL3Jpc2N2L2lycS5jCj4gPiArKysgYi9kcml2ZXJzL2Fj
cGkvcmlzY3YvaXJxLmMKPiA+IEBAIC01LDggKzUsMTEgQEAKPiA+ICAgICovCj4gPgo+ID4gICAj
aW5jbHVkZSA8bGludXgvYWNwaS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KPiA+
ICAgI2luY2x1ZGUgPGxpbnV4L3NvcnQuaD4KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L2lycS5oPgo+
ID4gKyNpbmNsdWRlIDxsaW51eC9pcnFkb21haW4uaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvaXJx
Y2hpcC9yaXNjdi1pbXNpYy5oPgo+ID4KPiA+ICAgI2luY2x1ZGUgImluaXQuaCIKPiA+Cj4gPiBA
QCAtMzk3LDYgKzQwMCwxNiBAQCBzdGF0aWMgdTMyIHJpc2N2X2FjcGlfYWRkX2lycV9kZXAoYWNw
aV9oYW5kbGUgaGFuZGxlKQo+ID4gICAgICAgcmV0dXJuIGNvdW50Owo+ID4gICB9Cj4gPgo+ID4g
K3ZvaWQgYWNwaV9hcmNoX21zaV9jb25maWd1cmUoc3RydWN0IGRldmljZSAqZGV2KQo+ID4gK3sK
PiA+ICsgICAgIHN0cnVjdCBpcnFfZG9tYWluICptc2lfZG9tYWluOwo+ID4gKwo+ID4gKyAgICAg
bXNpX2RvbWFpbiA9IGlycV9maW5kX21hdGNoaW5nX2Z3bm9kZShpbXNpY19hY3BpX2dldF9md25v
ZGUoZGV2KSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
RE9NQUlOX0JVU19QTEFURk9STV9NU0kpOwo+ID4gKyAgICAgaWYgKG1zaV9kb21haW4pCj4gPiAr
ICAgICAgICAgICAgIGRldl9zZXRfbXNpX2RvbWFpbihkZXYsIG1zaV9kb21haW4pOwo+ID4gK30K
PiA+ICsKPiA+ICAgdTMyIGFyY2hfYWNwaV9hZGRfYXV0b19kZXAoYWNwaV9oYW5kbGUgaGFuZGxl
KQo+ID4gICB7Cj4gPiAgICAgICBpZiAoYWNwaV9oYXNfbWV0aG9kKGhhbmRsZSwgIl9QUlQiKSkK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvc2Nhbi5jIGIvZHJpdmVycy9hY3BpL3NjYW4u
Ywo+ID4gaW5kZXggNTMwNTQ3Y2RhOGIyLi5lNTBlNWQyNDZhNTQgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL2FjcGkvc2Nhbi5jCj4gPiArKysgYi9kcml2ZXJzL2FjcGkvc2Nhbi5jCj4gPiBAQCAt
MTY0OCw2ICsxNjQ4LDE2IEBAIHN0YXRpYyBpbnQgYWNwaV9pb21tdV9jb25maWd1cmVfaWQoc3Ry
dWN0IGRldmljZSAqZGV2LCBjb25zdCB1MzIgKmlkX2luKQo+ID4KPiA+ICAgI2VuZGlmIC8qICFD
T05GSUdfSU9NTVVfQVBJICovCj4gPgo+ID4gKy8qKgo+ID4gKyAqIGFjcGlfbXNpX2NvbmZpZ3Vy
ZSAtIFNldC11cCBNU0kgZG9tYWluIGZvciB0aGUgZGV2aWNlLgo+ID4gKyAqIEBkZXY6IFRoZSBw
b2ludGVyIHRvIHRoZSBkZXZpY2UKPiA+ICsgKi8KPiA+ICt2b2lkIGFjcGlfbXNpX2NvbmZpZ3Vy
ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiArewo+ID4gKyAgICAgYWNwaV9hcmNoX21zaV9jb25m
aWd1cmUoZGV2KTsKPiA+ICt9Cj4gPiArRVhQT1JUX1NZTUJPTF9HUEwoYWNwaV9tc2lfY29uZmln
dXJlKTsKPiA+ICsKPiA+ICAgLyoqCj4gPiAgICAqIGFjcGlfZG1hX2NvbmZpZ3VyZV9pZCAtIFNl
dC11cCBETUEgY29uZmlndXJhdGlvbiBmb3IgdGhlIGRldmljZS4KPiA+ICAgICogQGRldjogVGhl
IHBvaW50ZXIgdG8gdGhlIGRldmljZQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmFzZS9wbGF0
Zm9ybS5jIGIvZHJpdmVycy9iYXNlL3BsYXRmb3JtLmMKPiA+IGluZGV4IGExOWRkMjJkZWVmMi4u
MjI1ZTMzMDgwYmM2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9iYXNlL3BsYXRmb3JtLmMKPiA+
ICsrKyBiL2RyaXZlcnMvYmFzZS9wbGF0Zm9ybS5jCj4gPiBAQCAtMTQ3MCw4ICsxNDcwLDEyIEBA
IHN0YXRpYyBpbnQgcGxhdGZvcm1fZG1hX2NvbmZpZ3VyZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4g
PiAgICAgICBpbnQgcmV0ID0gMDsKPiA+Cj4gPiAgICAgICBpZiAoaXNfb2Zfbm9kZShmd25vZGUp
KSB7Cj4gPiArICAgICAgICAgICAgIGlmICghZGV2X2dldF9tc2lfZG9tYWluKGRldikpCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgb2ZfbXNpX2NvbmZpZ3VyZShkZXYsIGRldi0+b2Zfbm9kZSk7
Cj4gPiAgICAgICAgICAgICAgIHJldCA9IG9mX2RtYV9jb25maWd1cmUoZGV2LCB0b19vZl9ub2Rl
KGZ3bm9kZSksIHRydWUpOwo+ID4gICAgICAgfSBlbHNlIGlmIChpc19hY3BpX2RldmljZV9ub2Rl
KGZ3bm9kZSkpIHsKPiA+ICsgICAgICAgICAgICAgaWYgKCFkZXZfZ2V0X21zaV9kb21haW4oZGV2
KSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBhY3BpX21zaV9jb25maWd1cmUoZGV2KTsKPgo+
IEJ1dCBzdXJlbHkgdGhpcyBuZWVkcyB0byBoYW5kbGUgdGhlIGRlZmVycmFsIGNhc2UgdGhhdCdz
IGJlaW5nIHJlbW92ZWQKPiBmcm9tIHNvbWUgb2YgdGhlIHVzZXJzIGJlbG93PwoKVGhlIGRlZmVy
cmFsIGNhc2VzIHJlbW92ZWQgYnkgdGhpcyBwYXRjaCBhcmUgcmVkdW5kYW50IGJlY2F1c2U6CjEp
IEZvciBkZXZpY2UgdHJlZSwgdGhlIGZ3X2Rldmxpbmsgc3VwcG9ydCBpbiBMaW51eCBERCBjb3Jl
IHRha2VzCmNhc2Ugb2YgcHJvYmUgb3JkZXJpbmcgYW5kIGluZGl2aWR1YWwgZHJpdmVyIGRvbid0
IG5lZWQgdG8gZXhwbGljaXRseQpkbyBFUFJPQkVfREVGRVIKMikgRm9yIEFDUEksIHRoZSBfREVQ
IG9iamVjdHMgaGVscHMgdXMgZW5zdXJlIHByb2JlIG9yZGVyaW5nLgoKSW4gb3RoZXIgd29yZHMs
IHRoZSBpc3N1ZSBvZiBwcm9iZSBvcmRlcmluZyBvciBkZWZlcnJhbCBpcyBhbHJlYWR5CmhhbmRs
ZWQgZm9yIGJvdGggZGV2aWNlIHRyZWUgYW5kIEFDUEkuCgpUaGUgb25seSBwcm9ibGVtIHdoaWNo
IHJlbWFpbnMgaXMgbXNpX2RvbWFpbiBwb2ludGVyIG5vdCBzZXQKaW4gc3RydWN0IGRldmljZSBi
ZWZvcmUgdGhlIGRyaXZlciBpcyBwcm9iZWQuIFRoaXMgaGFwcGVucyBiZWNhdXNlCk1TSSBjb250
cm9sbGVyIGRyaXZlciBpcyBhIHJlZ3VsYXIgcGxhdGZvcm0gZHJpdmVyIGhlbmNlIE1TSSBkb21h
aW4KcG9pbnRlciBpcyBub3Qgc2V0IHdoZW4gcGxhdGZvcm0gZGV2aWNlcyBhcmUgY3JlYXRlZC4K
Cj4KPiBBbHNvIEknbSBub3QgcmVhbGx5IGNvbnZpbmNlZCBhYm91dCBidW5kbGluZyBpdCBpbnRv
IGRtYV9jb25maWd1cmUsCj4gc2luY2UgaXQncyBtcm9lIGFib3V0IElSUXMgdGhhbiBETUEuIEkg
d29uZGVyIGlmIG92ZXJhbGwgaXQgd291bGRuJ3QgYmUKClVzaW5nIHBsYXRmb3JtX2RtYV9jb25m
aWd1cmUoKSB0byB1cGRhdGUgdGhlIE1TSSBkb21haW4KaW4gc3RydWN0IGRldmljZSBpcyBhcHBy
b3ByaWF0ZSBiZWNhdXNlOgoxKSBNU0lzIGFyZSBkZXZpY2UgaW5pdGlhdGVkIHdyaXRlcyBqdXN0
IGxpa2UgRE1BIHdyaXRlcwogICAgaW5pdGlhdGVkIGJ5IHRoZSBkZXZpY2UuCjIpIFRoZSBpb21t
dV9kZXZpY2VfdXNlX2RlZmF1bHRfZG9tYWluKCkgY2FsbGVkIGJ5CiAgIHBsYXRmb3JtX2RtYV9j
b25maWd1cmUoKSB3aWxsIG92ZXJyaWRlIE1TSSBkb21haW4KICAgaW4gc3RydWN0IGRldmljZSBm
b3IgYXJjaGl0ZWN0dXJlcyAoc3VjaCBhcyB4ODYgYW5kCiAgIFJJU0MtVikgd2hlcmUgSU9NTVUg
ZHJpdmVyIGltcGxlbWVudHMgYSBJUlEKICAgcmVtYXAgTVNJIGRvbWFpbiBmb3IgTVNJIGNhcGFi
bGUgZGV2aWNlcy4KCj4gYmV0dGVyIHdpdGggYSBmbG93IGNsb3NlciB0byByZWd1bGFyIHJlcXVl
c3RfaXJxKCksIHdpdGgKPiBtc2lfY3JlYXRlX2RldmljZV9pcnFfZG9tYWluKCkgZ3Jvd2luZyB0
aGUgYWJpbGl0eSB0byBkaXN0aW5ndXNoIGJldHdlZW4KPiAidGhlcmUgaXMgbm8gZG9tYWluIiBh
bmQgInRoZXJlIGlzIG5vIGRvbWFpbiBub3csIGJ1dCBjb3VsZCBiZSBpZiB3ZSB0cnkKPiBhZ2Fp
biBsYXRlciIsIHN1Y2ggdGhhdCBkcml2ZXJzIGNhbiBoYW5kbGUgZGVmZXJyYWwgYXQgdGhlIHBv
aW50IHdoZXJlCj4gdGhleSByZXF1ZXN0IE1TSSB2ZWN0b3JzPwoKTGlrZSBtZW50aW9uZWQgYWJv
dmUsIHRoZSBwcm9ibGVtIGlzIG5vdCBhYm91dCBwcm9iZSBkZWZlcnJhbAooYWthIHJldHVybmlu
ZyBFUFJPQkVfREVGRVIpIGZyb20gcmVxdWVzdF9pcnEoKSBvcgptc2lfY3JlYXRlX2RldmljZV9p
cnFfZG9tYWluKCkgcmF0aGVyIGFib3V0IHVwZGF0aW5nIHRoZQpNU0kgZG9tYWluIHBvaW50ZXIg
aW4gc3RydWN0IGRldmljZSBiZWZvcmUgZHJpdmVyIHByb2JlLgoKUmVnYXJkcywKQW51cAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
