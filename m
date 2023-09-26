Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B8CE81817
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 04:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zBplY2I7Wzn48dus/1kE3mrqKLBpYen14SenAcIKC3w=; b=kXhrjBqvUmKZAj
	qKM89OBwzErTFxLzdpvrFDuYMGOoiptSKbr20tol+4M7/z/AVX4e4bYK1iAthVNJF3ajFFzoQ/8FU
	fhjl2lJde9JaYAXG867PBIXLeHBe48oYveVI2/ENIl/jQw2gHvrnhLvr7HCtM9S03CsrMVHliYyp3
	O87LOzUjZfH2NEfaYhTOcT0ukC0qoXlqZownUyQeVlBFN33/QXwVPDwLZK5dZybg1RQz94XScTkmo
	QYG2Ss1Den5h3rDjSHrZ1cIZmdAL00gQwn8kI0nJoXjngcrGDkYau621xr24jD3duhwd9jIkITTFD
	pkcFq8reV9Lg0KczBgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkzTK-00FXf1-24;
	Tue, 26 Sep 2023 04:14:54 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkzTH-00FXe8-1t
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 04:14:53 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-578afd8b46cso5643154a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 21:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695701690; x=1696306490; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0Uz9m0Lpyj2Up3M7ljAj872e7YEcYxbkjr4aA3fxoM=;
        b=WrnvkSiU75xZIglfXvGnprJJSyO1Qt6gh6QbvJw2JOxamWHtjSyxJxSque9QeD5NsU
         hYnW+auAqP6dwhTuvhTioMlH0I8LhFy4zSt2OmrlFUcoI8QaBBoGLteH5aCbAyYc9Dpu
         cwlT+OQShE8GGgoij8E4hNZ4j/PBro6eTyNKwEsTI3s1K2zH7Zmxy3NWlVHMiGu7Pi7h
         HCymX0geyxfWaWfwHJw7ol4MWxBAGL/qQgw3QHNfyMQgs/Dd3EdQCNziuOktJruFTtRr
         fNSUdspimarzJjquH5h89SlJGVDOAihgbyN8R3xkN0liuz09OcbkrpeJN7r+BnU7K0wD
         DFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695701690; x=1696306490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0Uz9m0Lpyj2Up3M7ljAj872e7YEcYxbkjr4aA3fxoM=;
        b=DQlK/417u1fy6NGGn/mX23WirFryb9VYGis964jgxTXH1sYFLXgNwrsE3vNou9fxRw
         gvjmN/IkyhZ7kcu2EgO0lBU7wRHpyNLUmYOvOhMDHDDRTVIRC03cBHYHU1xV8QA+Wff0
         HUQkqIt7b3F3MpaLTDqqzgivynKacJVf1+RBpoSFEhgYkyZNKIGvBnJ9mSVZW+u2gpHG
         uaLqt6vWxwbTlyFNpeyQzyBuVeU/8Qx7fqzFdytvd9hQ/j8xpsfG3uEidp5RvHdg6dEh
         GK8V7j8KhF040gYaVma9y6a3itLjBe08Pa328AfBcSmziYMD6+I9/inK1gZx6XLcut95
         PGAg==
X-Gm-Message-State: AOJu0YwEjZrX7QLGMxboIkIE31j1sCTaTvB2lULPfxum7Wk3U8YSaQH9
	SRDAx2uKycQdi+1GAOMQAeu6dBUVuX2zTZmbegI0cA==
X-Google-Smtp-Source: AGHT+IGlrqzBQynTQ2ZOIqd8C6kbA5Z3vGoWbVXr0mUzMrb0AxrCfYzkhQU9qD+Ac1FboN94cMy4dyuKkXku+Op/CWc=
X-Received: by 2002:a05:6a20:a11e:b0:153:5832:b31b with SMTP id
 q30-20020a056a20a11e00b001535832b31bmr9309947pzk.53.1695701689540; Mon, 25
 Sep 2023 21:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
 <20230925133859.1735879-3-apatel@ventanamicro.com> <ZRHH25IyJJLWSolC@ghost> <CAK9=C2UoKxM+wknB4n8=okyXCCE6t0Vvz4jU_tBW6DMm6Vb3DA@mail.gmail.com>
In-Reply-To: <CAK9=C2UoKxM+wknB4n8=okyXCCE6t0Vvz4jU_tBW6DMm6Vb3DA@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 26 Sep 2023 09:44:38 +0530
Message-ID: <CAK9=C2X9FpLTW4mDTNUWkoRLAXZonPzhrsOD5xrCfrqKSbaLhg@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] RISC-V: Detect XVentanaCondOps from ISA string
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_211451_624786_C63B5371 
X-CRM114-Status: GOOD (  35.42  )
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

T24gVHVlLCBTZXAgMjYsIDIwMjMgYXQgOTozOOKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgU2VwIDI1LCAyMDIzIGF0IDExOjE44oCv
UE0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
T24gTW9uLCBTZXAgMjUsIDIwMjMgYXQgMDc6MDg6NTJQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiA+ID4gVGhlIFZleXJvbi1WMSBDUFUgc3VwcG9ydHMgY3VzdG9tIGNvbmRpdGlvbmFsIGFy
aXRobWV0aWMgYW5kCj4gPiA+IGNvbmRpdGlvbmFsLXNlbGVjdC9tb3ZlIG9wZXJhdGlvbnMgcmVm
ZXJyZWQgdG8gYXMgWFZlbnRhbmFDb25kT3BzCj4gPiA+IGV4dGVuc2lvbi4gSW4gZmFjdCwgUUVN
VSBSSVNDLVYgYWxzbyBoYXMgc3VwcG9ydCBmb3IgZW11bGF0aW5nCj4gPiA+IFhWZW50YW5hQ29u
ZE9wcyBleHRlbnNpb24uCj4gPiA+Cj4gPiA+IExldCB1cyBkZXRlY3QgWFZlbnRhbmFDb25kT3Bz
IGV4dGVuc2lvbiBmcm9tIElTQSBzdHJpbmcgYXZhaWxhYmxlCj4gPiA+IHRocm91Z2ggRFQgb3Ig
QUNQSS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50
YW5hbWljcm8uY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdj
YXAuaCB8IDEgKwo+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCj4g
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9od2NhcC5oCj4gPiA+IGluZGV4IDBmNTIwZjdkMDU4YS4uYjdlZmU5ZTJmYTg5IDEwMDY0
NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+ID4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiA+IEBAIC01OSw2ICs1OSw3IEBACj4g
PiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklGRU5DRUkgICAgICAgICAgICAgICA0MQo+ID4g
PiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJSFBNICAgICAgICAgIDQyCj4gPiA+ICAjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfU01TVEFURUVOICAgICAgICAgICAgICA0Mwo+ID4gPiArI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1hWRU5UQU5BQ09ORE9QUyAgICAgICAgNDQKPiA+ID4KPiA+ID4gICNkZWZp
bmUgUklTQ1ZfSVNBX0VYVF9NQVggICAgICAgICAgICA2NAo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jCj4gPiA+IGluZGV4IDM3NTVhOGMyYTlkZS4uM2EzMWQzNGZlNzA5IDEwMDY0NAo+
ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+ID4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiA+IEBAIC0xODIsNiArMTgyLDcgQEAgY29u
c3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7Cj4gPiA+ICAg
ICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHN2aW52YWwsIFJJU0NWX0lTQV9FWFRfU1ZJTlZBTCks
Cj4gPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHN2bmFwb3QsIFJJU0NWX0lTQV9FWFRf
U1ZOQVBPVCksCj4gPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHN2cGJtdCwgUklTQ1Zf
SVNBX0VYVF9TVlBCTVQpLAo+ID4gPiArICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh4dmVudGFu
YWNvbmRvcHMsIFJJU0NWX0lTQV9FWFRfWFZFTlRBTkFDT05ET1BTKSwKPiA+ID4gIH07Cj4gPiA+
Cj4gPiA+ICBjb25zdCBzaXplX3QgcmlzY3ZfaXNhX2V4dF9jb3VudCA9IEFSUkFZX1NJWkUocmlz
Y3ZfaXNhX2V4dCk7Cj4gPiA+IC0tCj4gPiA+IDIuMzQuMQo+ID4gPgo+ID4gPgo+ID4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKPiA+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cj4gPgo+ID4gSSB3b3JyeSBhYm91dCBzdG9yaW5nIHZlbmRvciBleHRlbnNpb25zIGluIHRo
aXMgZmlsZS4gQmVjYXVzZSB2ZW5kb3IKPiA+IGV4dGVuc2lvbnMgYXJlIG5vdCBzdGFuZGFyZGl6
ZWQsIHRoZXkgY2FuIG9ubHkgYmUgZXhwZWN0ZWQgdG8gaGF2ZSB0aGUKPiA+IGRlc2lyZWQgYmVo
YXZpb3Igb24gaGFyZHdhcmUgd2l0aCB0aGUgYXBwcm9wcmlhdGUgdmVuZG9yIGlkLiBBIGNvdXBs
ZQo+Cj4gQXNzdW1pbmcgdGhhdCBhIHZlbmRvciBleHRlbnNpb24gaXMgb25seSBhdmFpbGFibGUg
b24gaGFyZHdhcmUgd2l0aAo+IGFwcHJvcHJpYXRlIHZlbmRvciBpZCBpcyBub3QgY29ycmVjdCBi
ZWNhdXNlOgo+IDEpIHZlbmRvciBBIGNhbiBhbGxvdyB2ZW5kb3IgQiB0byBpbXBsZW1lbnQgYSBj
dXN0b20gZXh0ZW5zaW9uCj4gICAgIGRlZmluZWQgYnkgdmVuZG9yIEIKClR5cG8gY29ycmVjdGlv
bjogInZlbmRvciBBIGNhbiBhbGxvdyB2ZW5kb3IgQiB0byBpbXBsZW1lbnQgYSBjdXN0b20KZXh0
ZW5zaW9uIGRlZmluZWQgYnkgdmVuZG9yIEEiCgo+IDIpIHZlbmRvciBBIGFuZCB2ZW5kb3IgQiBj
YW4gam9pbnRseSBkZXZlbG9wIGEgUklTQy1WIENQVSB3aGVyZQo+ICAgICBib3RoIHZlbmRvcnMg
aW50ZWdyYXRlIHRoZWlyIGN1c3RvbSBleHRlbnNpb25zLgo+Cj4gSXQgaXMgYmVzdCB0byBpZGVu
dGlmeSBhIHZlbmRvciBleHRlbnNpb24gaW5kZXBlbmRlbnRseSB3aXRoIGEKPiAiWDx2ZW5kb3Jf
bmFtZT48ZXh0ZW5zaW9uX25hbWU+IiBzdHJpbmcgdG8ga2VlcCBpdCBzaW1wbGUKPiBhbmQgc2Nh
bGFibGUuCj4KPiBBbG9uZyB0aGVzZSBsaW5lcywgZWFjaCBULUhlYWQgY3VzdG9tIGV4dGVuc2lv
biBzaG91bGQgaGF2ZSBhCj4gIlhUaGVhZDx4eXo+IiBuYW1lIGFzc29jaWF0ZWQgd2l0aCBpdC4K
Pgo+ID4gbW9udGhzIGFnbyBJIHNlbnQgYSBwYXRjaCB0byBhZGRyZXNzIHRoaXMgYnkgaGFuZGxp
bmcgdmVjdG9yIGV4dGVuc2lvbnMKPiA+IGluZGVwZW5kZW50bHkgZm9yIGVhY2ggdmVuZG9yIFsx
XS4gSSBkcm9wcGVkIHRoZSBwYXRjaCBiZWNhdXNlIGl0Cj4gPiByZWxpZWQgdXBvbiBIZWlrbydz
IFQtSGVhZCB2ZWN0b3IgZXh0ZW5zaW9uIHN1cHBvcnQgdGhhdCBoZSBzdG9wcGVkCj4gPiB3b3Jr
aW5nIG9uLiBIb3dldmVyLCBJIGNhbiByZXZpdmUgdGhpcyBwYXRjaCBzbyB5b3UgY2FuIGJ1aWxk
IG9mZiBvZiBpdC4KPgo+IEF0IGxlYXN0LCB0aGUgY29uZGl0aW9uYWwgb3BlcmF0aW9ucyBkb24n
dCBuZWVkIGEgaHdwcm9iZSBpbnRlcmZhY2UKPiBiZWNhdXNlIGFuIGFwcGxpY2F0aW9uIGlzIGVp
dGhlciBjb21waWxlZCB3aXRoIG9yIHdpdGhvdXQgY29uZGl0aW9uYWwKPiBvcGVyYXRpb25zLiBJ
biBvdGhlciB3b3JkcywgZWZmZWN0aXZlIHVzZSBvZiBjb25kaXRpb25hbCBvcGVyYXRpb24gaXMK
PiBvbmx5IHBvc3NpYmxlIGlmIGNvbXBpbGVyIGdlbmVyYXRlcyB0aGVzZSBpbnN0cnVjdGlvbnMg
YmFzZWQgb24KPiBjb2RlIHBhdHRlcm5zLgo+Cj4gPgo+ID4gVGhpcyBzY2hlbWUgaGFzIHRoZSBh
ZGRlZCBiZW5lZml0IHRoYXQgdmVuZG9ycyBkbyBub3QgaGF2ZSB0byB3b3JyeQo+ID4gYWJvdXQg
Y29uZmljdGluZyBleHRlbnNpb25zLCBhbmQgdGhlIGtlcm5lbCBkb2VzIG5vdCBoYXZlIHRvIGFj
dCBhcyBhCj4gPiBrZXkgcmVnaXN0cnkgZm9yIHZlbmRvcnMuCj4KPiBIb3cgY2FuIHZlbmRvciBl
eHRlbnNpb25zIGNvbmZsaWN0IGlmIHRoZXkgYWxsIGZvbGxvdyB0aGUKPiAiWDx2ZW5kb3JfbmFt
ZT48ZXh0ZW5zaW9uX25hbWU+IiBuYW1pbmcgc2NoZW1lID8KPgo+ID4KPiA+IFdoYXQgYXJlIHlv
dXIgdGhvdWdodHM/Cj4gPgo+ID4gLSBDaGFybGllCj4gPgo+ID4gWzFdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvMjAyMzA3MDUtdGhlYWRfdmVuZG9yX2V4dGVuc2lvbnMtdjEtMi1hZDY5
MTUzNDljNGRAcml2b3NpbmMuY29tLwo+ID4KPgo+IFJlZ2FyZHMsCj4gQW51cAoKUmVnYXJkcywK
QW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
