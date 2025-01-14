Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737B2E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 20:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRnfUwlnIw7hMRVWdUnzXbjGEzZwlckBi7isgOmiHFU=; b=rEdYAKUdNM/l01
	DdaBfm0rz9ie0C5mZUE7syTj4j6gj7UlgVgT4YzAiDBvdONjuqszS01by/ZuB3D6bm1EKACdV9rdB
	KscjY+wvaUqIVIzJj0gJwW45G0npyW6lUF41GLjEzY7RUByJ1FwfAkQ04hceV+C8LZa9Rz0Onv0IT
	cG/PPIHkLkMd68fBSpWg1inmM43HTNVZyx8HpjMDs9HI3+YxdxRb0qlbGqYZaGQNVEzEqIKpxaCmR
	huIFhceQxGTiL+q1NXgdFw/i3cG4gnjuD2JsJkCuK5w/I7NlqXi8HZmfE8bxrrpz6Sx+XQJ08dTMn
	dKA7mz/fDJkYLqbZrdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnQB-00000009erh-2KEL;
	Tue, 14 Jan 2025 20:21:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnOu-00000009elR-3MDJ;
	Tue, 14 Jan 2025 20:20:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A25C7A41BBD;
	Tue, 14 Jan 2025 20:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6502AC4CEE5;
	Tue, 14 Jan 2025 20:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736886035;
	bh=I9Ekx6aq/CtvmHlK2JuDkCREj16AUwVV0szqwfvn2B8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JD22uIFW+fdCoYLcYeIsO2Txr02Nmv6PaD3vP9xJM7UUTueYcu0+ONzHQG06vXduq
	 lkoMo+Ps9CQCr69LMbVC2r9TQ2pbJeuo+AKkJiGA41O1f7iirwWhLVUxRW/AUz8kuH
	 jZpbpAJaemRr7wa9BNXuP5WR85oNMonECKjO4soOFO0HIZB1U6fpR0kVfbKf6g947P
	 Y0CUnLeoKueHwxpK6IgZ0MpvJ1xE8c/iapkJ0dgX+jM1tRAv2LScMM/ZaftTdnfnDI
	 dd1+xdcog1URclurHKunuZhxCOkXFYMDTm+uoXHKvSb/xOSY6nu/t6ezK5/fcoCUEJ
	 DvZGIPiGaAZsg==
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3eba559611aso1765144b6e.0;
        Tue, 14 Jan 2025 12:20:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7HnT46gy4c7diljr/3qmUFelG2OpDxeur4Y73hmwTsnUxVNQw0ISEmkCRtB9HmvfB+BHPHU8ZS9LlUHY=@lists.infradead.org, AJvYcCUKhWyRRFmJBkA25vTSlf5keFvvw9tGsySe9TKv48vfpCspJhPsjeA55BDDGPTiSStDi/xYdb+u6A7K3CnMw/7k@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4R7HDLms8Yd3J1A/Z3UVr9u6QJyK8wcP48RIukgyQuUWf4QHH
	LY/JbS7sTxDyujUmJuzSv4dzJM6hzCE8O4rT4EmfHGWVEHPi/LQ7/MgA2xe95ydTPMiVTIlqjgI
	SRFUB8NH5pbVDSljbGERkDd8qkHk=
X-Google-Smtp-Source: AGHT+IHBdFDv09GmJQAPh9/RI61yRA+OUJBTYVfB4ZAfwslXJG+AQnvyEewTo5F7++0A17YOZNGuMRHAq8Q+xsm4lZ0=
X-Received: by 2002:a05:6808:198d:b0:3eb:615a:ece5 with SMTP id
 5614622812f47-3ef2ec54eedmr15212295b6e.15.1736886034615; Tue, 14 Jan 2025
 12:20:34 -0800 (PST)
MIME-Version: 1.0
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com> <20250103-wake_irq-v2-1-e3aeff5e9966@nxp.com>
In-Reply-To: <20250103-wake_irq-v2-1-e3aeff5e9966@nxp.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 14 Jan 2025 21:20:22 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hj7wUU3f_j5QH3fNUFKokaXr0octaP2M1Ho_L_BspoUA@mail.gmail.com>
X-Gm-Features: AbW1kvZ2IsMpRpq9v9cu6FjARLwcHzjMVAJFZcTXGy5umUj9Q22VPlrSsSvyjVE
Message-ID: <CAJZ5v0hj7wUU3f_j5QH3fNUFKokaXr0octaP2M1Ho_L_BspoUA@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] PM: sleep: wakeirq: Introduce device-managed
 variant of dev_pm_set_wake_irq
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_122036_967072_F77D43B7 
X-CRM114-Status: GOOD (  22.49  )
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

T24gRnJpLCBKYW4gMywgMjAyNSBhdCA5OjQy4oCvQU0gUGVuZyBGYW4gKE9TUykgPHBlbmcuZmFu
QG9zcy5ueHAuY29tPiB3cm90ZToKPgo+IEZyb206IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29t
Pgo+Cj4gQWRkIGRldmljZS1tYW5hZ2VkIHZhcmlhbnQgb2YgZGV2X3BtX3NldF93YWtlX2lycSB3
aGljaCBhdXRvbWF0aWNhbGx5Cj4gY2xlYXIgdGhlIHdha2UgaXJxIG9uIGRldmljZSBkZXN0cnVj
dGlvbiB0byBzaW1wbGlmeSBlcnJvciBoYW5kbGluZwo+IGFuZCByZXNvdXJjZSBtYW5hZ2VtZW50
IGluIGRyaXZlcnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9iYXNlL3Bvd2VyL3dha2VpcnEuYyB8IDI2ICsrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvcG1fd2FrZWlycS5oICAgfCAgNiArKysr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9iYXNlL3Bvd2VyL3dha2VpcnEuYyBiL2RyaXZlcnMvYmFzZS9wb3dlci93YWtlaXJx
LmMKPiBpbmRleCA1YTVhOWU5NzhlODVmM2ZjOWQ4OWNiN2Q0MzUyN2RjMWRkNDJhOWIxLi44YWEy
OGMwOGIyODkxZjNhZjQ5MDE3NTM2MmNjMWE3NTkwNjliZDUwIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvYmFzZS9wb3dlci93YWtlaXJxLmMKPiArKysgYi9kcml2ZXJzL2Jhc2UvcG93ZXIvd2FrZWly
cS5jCj4gQEAgLTEwMyw2ICsxMDMsMzIgQEAgdm9pZCBkZXZfcG1fY2xlYXJfd2FrZV9pcnEoc3Ry
dWN0IGRldmljZSAqZGV2KQo+ICB9Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKGRldl9wbV9jbGVhcl93
YWtlX2lycSk7Cj4KPiArc3RhdGljIHZvaWQgZGV2bV9wbV9jbGVhcl93YWtlX2lycSh2b2lkICpk
ZXYpCj4gK3sKPiArICAgICAgIGRldl9wbV9jbGVhcl93YWtlX2lycShkZXYpOwo+ICt9Cj4gKwo+
ICsvKioKPiArICogZGV2bV9wbV9zZXRfd2FrZV9pcnEgLSBkZXZpY2UtbWFuYWdlZCB2YXJpYW50
IG9mIGRldl9wbV9zZXRfd2FrZV9pcnEKPiArICogQGRldjogRGV2aWNlIGVudHJ5Cj4gKyAqIEBp
cnE6IERldmljZSBJTyBpbnRlcnJ1cHQKPiArICoKPiArICoKPiArICogQXR0YWNoIGEgZGV2aWNl
IElPIGludGVycnVwdCBhcyBhIHdha2UgSVJRLCBzYW1lIHdpdGggZGV2X3BtX3NldF93YWtlX2ly
cSwKPiArICogYnV0IHRoZSBkZXZpY2Ugd2lsbCBiZSBhdXRvIGNsZWFyIHdha2UgY2FwYWJpbGl0
eSBvbiBkcml2ZXIgZGV0YWNoLgo+ICsgKi8KPiAraW50IGRldm1fcG1fc2V0X3dha2VfaXJxKHN0
cnVjdCBkZXZpY2UgKmRldiwgaW50IGlycSkKPiArewo+ICsgICAgICAgaW50IHJldDsKPiArCj4g
KyAgICAgICByZXQgPSBkZXZfcG1fc2V0X3dha2VfaXJxKGRldiwgaXJxKTsKPiArICAgICAgIGlm
IChyZXQpCj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKwo+ICsgICAgICAgcmV0dXJu
IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIGRldm1fcG1fY2xlYXJfd2FrZV9pcnEsIGRl
dik7Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9HUEwoZGV2bV9wbV9zZXRfd2FrZV9pcnEpOwo+ICsK
PiAgLyoqCj4gICAqIGhhbmRsZV90aHJlYWRlZF93YWtlX2lycSAtIEhhbmRsZXIgZm9yIGRlZGlj
YXRlZCB3YWtlLXVwIGludGVycnVwdHMKPiAgICogQGlycTogRGV2aWNlIHNwZWNpZmljIGRlZGlj
YXRlZCB3YWtlLXVwIGludGVycnVwdAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3BtX3dh
a2VpcnEuaCBiL2luY2x1ZGUvbGludXgvcG1fd2FrZWlycS5oCj4gaW5kZXggZDk2NDJjNmNmODUy
MTFhZjYwM2NlMzllMjgwYTViNGRlNjYxN2VlNS4uMjViNjNlZDUxYjc2NWMyYzY5MTlmMjU5NjY4
YTEyNjc1MzMwODM1ZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BtX3dha2VpcnEuaAo+
ICsrKyBiL2luY2x1ZGUvbGludXgvcG1fd2FrZWlycS5oCj4gQEAgLTEwLDYgKzEwLDcgQEAgZXh0
ZXJuIGludCBkZXZfcG1fc2V0X3dha2VfaXJxKHN0cnVjdCBkZXZpY2UgKmRldiwgaW50IGlycSk7
Cj4gIGV4dGVybiBpbnQgZGV2X3BtX3NldF9kZWRpY2F0ZWRfd2FrZV9pcnEoc3RydWN0IGRldmlj
ZSAqZGV2LCBpbnQgaXJxKTsKPiAgZXh0ZXJuIGludCBkZXZfcG1fc2V0X2RlZGljYXRlZF93YWtl
X2lycV9yZXZlcnNlKHN0cnVjdCBkZXZpY2UgKmRldiwgaW50IGlycSk7Cj4gIGV4dGVybiB2b2lk
IGRldl9wbV9jbGVhcl93YWtlX2lycShzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+ICtleHRlcm4gaW50
IGRldm1fcG1fc2V0X3dha2VfaXJxKHN0cnVjdCBkZXZpY2UgKmRldiwgaW50IGlycSk7Cj4KPiAg
I2Vsc2UgIC8qICFDT05GSUdfUE0gKi8KPgo+IEBAIC0zMiw1ICszMywxMCBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgZGV2X3BtX2NsZWFyX3dha2VfaXJxKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgewo+
ICB9Cj4KPiArc3RhdGljIGlubGluZSBpbnQgZGV2bV9wbV9zZXRfd2FrZV9pcnEoc3RydWN0IGRl
dmljZSAqZGV2LCBpbnQgaXJxKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiAg
I2VuZGlmIC8qIENPTkZJR19QTSAqLwo+ICAjZW5kaWYgLyogX0xJTlVYX1BNX1dBS0VJUlFfSCAq
Lwo+Cj4gLS0KCkkgY2FuIGFwcGx5IHRoaXMgcGF0Y2ggZm9yIDYuMTQsIGJ1dCB0aGUgcmVzdCBv
ZiB0aGUgc2VyaWVzIHdpbGwgbmVlZAp0byBiZSBwaWNrZWQgdXAgYnkgdGhlIHJlc3BlY3RpdmUg
ZHJpdmVyIG1haW50YWluZXJzLgoKSSBob3BlIHRoaXMgd29ya3MgZm9yIHlvdT8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
