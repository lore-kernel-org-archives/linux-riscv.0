Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB6CC54756
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tIIoxLqCRYvQXKcwa2vAbo5V74HG49lGqFcjiQ11deE=; b=Ab7W9I84XSEPAU
	UBZKDp6KpNpVL19ueD5QL/XQMEe1Nhp7KTS2axX6KDcNL4Igrj9j+2Pm4/rWbpFBY1rQ22aYiQ+o/
	KXdpfUNrPzk7/VPCAa3SVcqfdafXqIgEA/SAlOi0yStd+8RsL/OQZfmnhIqORG83PwrT6jMrEH9Mo
	sVlZ2X9Vpj2tnTrhKyKkn7jUXm/J+pWsALNrJlZLT0mDSnq9wKbC4wYWqoIbQ9e5k4J1Dsd0QiEeK
	Ev0zL5A5j5vC98FQSezIpiKBJxLPd/bTNlbPFrrq5LYKxY0A9fPN0bQQ+xz0Y+HeRTkPES/L5qDWT
	u5mdvgBkSK/CfOTbXqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHDc-0000000G5Zn-0Hia;
	Wed, 14 May 2025 18:52:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFF4S-0000000Flqf-1gX6
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 16:35:05 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a1f8c85562so3908054f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 09:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747240503; x=1747845303; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AOckZ8P9OykpU46zTLvu6zDFwY48KuX591SKzhfoGSE=;
        b=Joh321GTET8F4rZPbzBvkud1hxuvEnNVWys2l1ZiWUMU7P/2nRsnVTEFgcxg3q507I
         BoPc8dnxx9FF5uZnirXj8EL3psA/CL/9/9sVRVdeyWXJHBlU7vmp1N4Zp2F9+mhoN0wH
         CKk2rIu7UhEA89rEQO0NaSz6vTmKqryxsFGmIauLPh+DDnOJzYMfyoy5cMc0tehahsRW
         GKm/Y3Y8cJLCJithdBapDPrb+2Q8tIPcbCBibkkMgNeulS/lXqwt1MDbKZ+htk5ZpPUy
         ZeMCg/4zx1eGu2jZ6x44QAolbJ8c8k3agxlmEFjSxuzD9fmpuRJBOWmQHZbQ4jFrtKWL
         eT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240503; x=1747845303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOckZ8P9OykpU46zTLvu6zDFwY48KuX591SKzhfoGSE=;
        b=Mz4o22aCV7XPWZ27O7C07i+zpwmjln66hIEyhLnTdidniJrfvKpHMY+yK0u+8baTo4
         9PAHjLOcd9nwlyade880CblrMM6zsuMC/C19WXwEZH/hr9M9s4Oys7qmz3TQjr4p6pH5
         bECAcuE53GRIbaMVibBz8kFTIaQjnax/y2y5kKNpFKzwu3/d2aiW7nYdqlV9q6Ma7YM9
         6m6kBvk+wy7tjRFaGWWYs/1/IK9F2xjc3Qlq8MXd1Gp7u9eBXkErylS9Ddin0ehaYWOA
         vbglsa/eOsVnwozoTs4dFfURnKWXwnR4tp1qjehGuodb4vBIcpNQgwlMWdU12z3gfTtJ
         3LmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV85Klx+5VeATJiQOY1AkwY1rSyAnIqEuKpFE7xMqaz4cmMwGFb3M/kjTcZAU2WRAjv++nkbd/7Bcyzsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtL4jPRBe/4VDLgUfVLaYa9UV057qenE+b++aaon6F6JUW3oHQ
	80uyBzvZ6qWa8oNWAzQ2S/AuOQXB9JdDVbGZbnDTizx1n416YVe3vE0Ne8OiFw==
X-Gm-Gg: ASbGncus+ygkzyOr6BUl4qYfoUiqIPNxl5PdvkUUbsNGtzcxRtOLpL24v71ldKatrO4
	iYJenEVjGCSbs4/i7rdy6XbOic8Drnkr3rf5mVCZMhCoPg+jaBLITqjn8H/iDi1mHv/gWnONUKT
	HFFejTB9YorpRAMnU5dDcqmLY1pv6yxx0TEMPsjelZiK0ZG77yAVZo5nSTnV/BfsZf5LzwE9fJu
	Gjg3pkX1Y5Lztrii3IjdbaP/YRuQVlHYBC5KtW07qV1P9NUFlAYs2sL/yLwqvxSejjOQcnnTtGI
	3KHO9Gkbkinw4Odrhkty2Szy6rp5KYq1OneIgULcteJuaAf2PYc5bE6Ox+c8WwRsU6DaaG4dEB5
	mx2d4jyMODxVKdg==
X-Google-Smtp-Source: AGHT+IGj3+htGnEIyMivpivIivCnjfIy6Tideg6ovbKdF3ZUejVVtTS1+sX05zRZKNfgj9Ou9ozS3A==
X-Received: by 2002:a05:6000:1848:b0:3a0:b4f1:8bb8 with SMTP id ffacd0b85a97d-3a3496c38b8mr3799664f8f.34.1747240502599;
        Wed, 14 May 2025 09:35:02 -0700 (PDT)
Received: from thinkpad (112.8.30.213.rev.vodafone.pt. [213.30.8.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2d3sm20577369f8f.63.2025.05.14.09.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 09:35:02 -0700 (PDT)
Date: Wed, 14 May 2025 17:35:00 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Message-ID: <sotge26h35mcijcu3eqkbf7aimkwnxzhbgltoz74nfnefc7fjd@xct54hpv5ane>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-5-7050093e2b50@linaro.org>
 <1b4b7ee5-1d7e-573c-0647-44aad654354a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b4b7ee5-1d7e-573c-0647-44aad654354a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_093504_465932_BE28D9E5 
X-CRM114-Status: GOOD (  38.41  )
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

T24gV2VkLCBNYXkgMTQsIDIwMjUgYXQgMTE6NTI6MTNBTSArMDUzMCwgS3Jpc2huYSBDaGFpdGFu
eWEgQ2h1bmRydSB3cm90ZToKPiAKPiAKPiBPbiA1LzgvMjAyNSAxMjo0MCBQTSwgTWFuaXZhbm5h
biBTYWRoYXNpdmFtIHdyb3RlOgo+ID4gVGhlIFBDSWUgbGluayBjYW4gZ28gZG93biB1bmRlciBj
aXJjdW1zdGFuY2VzIHN1Y2ggYXMgdGhlIGRldmljZSBmaXJtd2FyZQo+ID4gY3Jhc2gsIGxpbmsg
aW5zdGFiaWxpdHksIGV0Yy4uLiBXaGVuIHRoYXQgaGFwcGVucywgdGhlIFBDSWUgc2xvdCBuZWVk
cyB0bwo+ID4gYmUgcmVzZXQgdG8gbWFrZSBpdCBvcGVyYXRpb25hbCBhZ2Fpbi4gQ3VycmVudGx5
LCB0aGUgZHJpdmVyIGlzIG5vdAo+ID4gaGFuZGxpbmcgdGhlIGxpbmsgZG93biBldmVudCwgZHVl
IHRvIHdoaWNoIHRoZSB1c2VycyBoYXZlIHRvIHJlc3RhcnQgdGhlCj4gPiBtYWNoaW5lIHRvIG1h
a2UgUENJZSBsaW5rIG9wZXJhdGlvbmFsIGFnYWluLiBTbyBmaXggaXQgYnkgZGV0ZWN0aW5nIHRo
ZQo+ID4gbGluayBkb3duIGV2ZW50IGFuZCByZXNldHRpbmcgdGhlIHNsb3QuCj4gPiAKPiA+IFNp
bmNlIHRoZSBRY29tIFBDSWUgY29udHJvbGxlcnMgcmVwb3J0IHRoZSBsaW5rIGRvd24gZXZlbnQg
dGhyb3VnaCB0aGUKPiA+ICdnbG9iYWwnIElSUSwgZW5hYmxlIHRoZSBsaW5rIGRvd24gZXZlbnQg
Ynkgc2V0dGluZyBQQVJGX0lOVF9BTExfTElOS19ET1dOCj4gPiBiaXQgaW4gUEFSRl9JTlRfQUxM
X01BU0sgcmVnaXN0ZXIuCj4gPiAKPiA+IFRoZW4gaW4gdGhlIGNhc2Ugb2YgdGhlIGV2ZW50LCBj
YWxsIHBjaV9ob3N0X2hhbmRsZV9saW5rX2Rvd24oKSBBUEkKPiA+IGluIHRoZSBoYW5kbGVyIHRv
IGxldCB0aGUgUENJIGNvcmUgaGFuZGxlIHRoZSBsaW5rIGRvd24gY29uZGl0aW9uLiBOb3RlCj4g
PiB0aGF0IGJvdGggbGluayB1cCBhbmQgbGluayBkb3duIGV2ZW50cyBjb3VsZCBiZSBzZXQgYXQg
YSB0aW1lIHdoZW4gdGhlCj4gPiBoYW5kbGVyIHJ1bnMuIFNvIGFsd2F5cyBoYW5kbGUgbGluayBk
b3duIGZpcnN0Lgo+ID4gCj4gPiBUaGUgQVBJIHdpbGwgaW50ZXJuYWxseSBjYWxsLCAncGNpX2hv
c3RfYnJpZGdlOjpyZXNldF9zbG90KCknIGNhbGxiYWNrIHRvCj4gPiByZXNldCB0aGUgc2xvdCBp
biBhIHBsYXRmb3JtIHNwZWNpZmljIHdheS4gU28gaW1wbGVtZW50IHRoZSBjYWxsYmFjayB0bwo+
ID4gcmVzZXQgdGhlIHNsb3QgYnkgZmlyc3QgcmVzZXR0aW5nIHRoZSBQQ0llIGNvcmUsIGZvbGxv
d2VkIGJ5IHJlaW5pdGlhbGl6aW5nCj4gPiB0aGUgcmVzb3VyY2VzIGFuZCB0aGVuIGZpbmFsbHkg
c3RhcnRpbmcgdGhlIGxpbmsgYWdhaW4uCj4gPiAKPiBPbmx5IG9uZSBjb21tZW50IHNlZSBiZWxv
dy4KPiA+IFNpZ25lZC1vZmYtYnk6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5z
YWRoYXNpdmFtQGxpbmFyby5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEtyaXNobmEgQ2hhaXRhbnlhIENo
dW5kcnUgPGtyaXNobmEuY2h1bmRydUBvc3MucXVhbGNvbW0uY29tPgo+ID4gLS0tCj4gPiAgIGRy
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL0tjb25maWcgICAgIHwgICAxICsKPiA+ICAgZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLmMgfCAxMTIgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTA1IGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9LY29uZmlnIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvS2NvbmZpZwo+ID4g
aW5kZXggZDlmMDM4NjM5NmVkZjY2YWQwZTUxNGEwZjU0NWVkMjRkODlmY2I2Yy4uY2UwNGVlNmZi
ZDk5Y2JjY2U1ZDJmM2E3NWViZDcyYTE3MDcwYjdiNyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvZHdjL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvZHdjL0tjb25maWcKPiA+IEBAIC0yOTYsNiArMjk2LDcgQEAgY29uZmlnIFBDSUVfUUNPTQo+
ID4gICAJc2VsZWN0IFBDSUVfRFdfSE9TVAo+ID4gICAJc2VsZWN0IENSQzgKPiA+ICAgCXNlbGVj
dCBQQ0lFX1FDT01fQ09NTU9OCj4gPiArCXNlbGVjdCBQQ0lfSE9TVF9DT01NT04KPiA+ICAgCWhl
bHAKPiA+ICAgCSAgU2F5IFkgaGVyZSB0byBlbmFibGUgUENJZSBjb250cm9sbGVyIHN1cHBvcnQg
b24gUXVhbGNvbW0gU29Dcy4gVGhlCj4gPiAgIAkgIFBDSWUgY29udHJvbGxlciB1c2VzIHRoZSBE
ZXNpZ25XYXJlIGNvcmUgcGx1cyBRdWFsY29tbS1zcGVjaWZpYwo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtcWNvbS5jIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpZS1xY29tLmMKPiA+IGluZGV4IGRjOThhZTYzMzYyZGIwNDIyMzg0YjE4Nzlh
MmI5YTdkYzU2NGQwOTEuLmU1Nzc2MTlkMGY4Y2VkZGYwOTU1MTM5YWU2YjkzOTg0MmY4Y2I3YmUg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXFjb20uYwo+
ID4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLmMKPiA+IEBAIC0z
NCw2ICszNCw3IEBACj4gPiAgICNpbmNsdWRlIDxsaW51eC91bml0cy5oPgo+ID4gICAjaW5jbHVk
ZSAiLi4vLi4vcGNpLmgiCj4gPiArI2luY2x1ZGUgIi4uL3BjaS1ob3N0LWNvbW1vbi5oIgo+ID4g
ICAjaW5jbHVkZSAicGNpZS1kZXNpZ253YXJlLmgiCj4gPiAgICNpbmNsdWRlICJwY2llLXFjb20t
Y29tbW9uLmgiCj4gPiBAQCAtNTUsNiArNTYsNyBAQAo+ID4gICAjZGVmaW5lIFBBUkZfSU5UX0FM
TF9TVEFUVVMJCQkweDIyNAo+ID4gICAjZGVmaW5lIFBBUkZfSU5UX0FMTF9DTEVBUgkJCTB4MjI4
Cj4gPiAgICNkZWZpbmUgUEFSRl9JTlRfQUxMX01BU0sJCQkweDIyYwo+ID4gKyNkZWZpbmUgUEFS
Rl9TVEFUVVMJCQkJMHgyMzAKPiA+ICAgI2RlZmluZSBQQVJGX1NJRF9PRkZTRVQJCQkJMHgyMzQK
PiA+ICAgI2RlZmluZSBQQVJGX0JERl9UUkFOU0xBVEVfQ0ZHCQkJMHgyNGMKPiA+ICAgI2RlZmlu
ZSBQQVJGX0RCSV9CQVNFX0FERFJfVjIJCQkweDM1MAo+ID4gQEAgLTEzMCw5ICsxMzIsMTQgQEAK
PiA+ICAgLyogUEFSRl9MVFNTTSByZWdpc3RlciBmaWVsZHMgKi8KPiA+ICAgI2RlZmluZSBMVFNT
TV9FTgkJCQlCSVQoOCkKPiA+ICsjZGVmaW5lIFNXX0NMRUFSX0ZMVVNIX01PREUJCQlCSVQoMTAp
Cj4gPiArI2RlZmluZSBGTFVTSF9NT0RFCQkJCUJJVCgxMSkKPiA+ICAgLyogUEFSRl9JTlRfQUxM
X3tTVEFUVVMvQ0xFQVIvTUFTS30gcmVnaXN0ZXIgZmllbGRzICovCj4gPiAtI2RlZmluZSBQQVJG
X0lOVF9BTExfTElOS19VUAkJCUJJVCgxMykKPiA+ICsjZGVmaW5lIElOVF9BTExfTElOS19ET1dO
CQkJMQo+ID4gKyNkZWZpbmUgSU5UX0FMTF9MSU5LX1VQCQkJCTEzCj4gPiArI2RlZmluZSBQQVJG
X0lOVF9BTExfTElOS19ET1dOCQkJQklUKElOVF9BTExfTElOS19ET1dOKQo+ID4gKyNkZWZpbmUg
UEFSRl9JTlRfQUxMX0xJTktfVVAJCQlCSVQoSU5UX0FMTF9MSU5LX1VQKQo+ID4gICAjZGVmaW5l
IFBBUkZfSU5UX01TSV9ERVZfMF83CQkJR0VOTUFTSygzMCwgMjMpCj4gPiAgIC8qIFBBUkZfTk9f
U05PT1BfT1ZFUlJJREUgcmVnaXN0ZXIgZmllbGRzICovCj4gPiBAQCAtMTQ1LDYgKzE1Miw5IEBA
Cj4gPiAgIC8qIFBBUkZfQkRGX1RPX1NJRF9DRkcgZmllbGRzICovCj4gPiAgICNkZWZpbmUgQkRG
X1RPX1NJRF9CWVBBU1MJCQlCSVQoMCkKPiA+ICsvKiBQQVJGX1NUQVRVUyBmaWVsZHMgKi8KPiA+
ICsjZGVmaW5lIEZMVVNIX0NPTVBMRVRFRAkJCQlCSVQoOCkKPiA+ICsKPiA+ICAgLyogRUxCSV9T
WVNfQ1RSTCByZWdpc3RlciBmaWVsZHMgKi8KPiA+ICAgI2RlZmluZSBFTEJJX1NZU19DVFJMX0xU
X0VOQUJMRQkJCUJJVCgwKQo+ID4gQEAgLTE2OSw2ICsxNzksNyBAQAo+ID4gICAJCQkJCQlQQ0lF
X0NBUF9TTE9UX1BPV0VSX0xJTUlUX1NDQUxFKQo+ID4gICAjZGVmaW5lIFBFUlNUX0RFTEFZX1VT
CQkJCTEwMDAKPiA+ICsjZGVmaW5lIEZMVVNIX1RJTUVPVVRfVVMJCQkxMDAKPiA+ICAgI2RlZmlu
ZSBRQ09NX1BDSUVfQ1JDOF9QT0xZTk9NSUFMCQkoQklUKDIpIHwgQklUKDEpIHwgQklUKDApKQo+
ID4gQEAgLTI3NCwxMSArMjg1LDE0IEBAIHN0cnVjdCBxY29tX3BjaWUgewo+ID4gICAJc3RydWN0
IGljY19wYXRoICppY2NfY3B1Owo+ID4gICAJY29uc3Qgc3RydWN0IHFjb21fcGNpZV9jZmcgKmNm
ZzsKPiA+ICAgCXN0cnVjdCBkZW50cnkgKmRlYnVnZnM7Cj4gPiArCWludCBnbG9iYWxfaXJxOwo+
ID4gICAJYm9vbCBzdXNwZW5kZWQ7Cj4gPiAgIAlib29sIHVzZV9wbV9vcHA7Cj4gPiAgIH07Cj4g
PiAgICNkZWZpbmUgdG9fcWNvbV9wY2llKHgpCQlkZXZfZ2V0X2RydmRhdGEoKHgpLT5kZXYpCj4g
PiArc3RhdGljIGludCBxY29tX3BjaWVfcmVzZXRfc2xvdChzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdl
ICpicmlkZ2UsCj4gPiArCQkJCSAgc3RydWN0IHBjaV9kZXYgKnBkZXYpOwo+ID4gICBzdGF0aWMg
dm9pZCBxY29tX2VwX3Jlc2V0X2Fzc2VydChzdHJ1Y3QgcWNvbV9wY2llICpwY2llKQo+ID4gICB7
Cj4gPiBAQCAtMTI2Myw2ICsxMjc3LDggQEAgc3RhdGljIGludCBxY29tX3BjaWVfaG9zdF9pbml0
KHN0cnVjdCBkd19wY2llX3JwICpwcCkKPiA+ICAgCQkJZ290byBlcnJfYXNzZXJ0X3Jlc2V0Owo+
ID4gICAJfQo+ID4gKwlwcC0+YnJpZGdlLT5yZXNldF9zbG90ID0gcWNvbV9wY2llX3Jlc2V0X3Ns
b3Q7Cj4gPiArCj4gPiAgIAlyZXR1cm4gMDsKPiA+ICAgZXJyX2Fzc2VydF9yZXNldDoKPiA+IEBA
IC0xNTE3LDYgKzE1MzMsNzQgQEAgc3RhdGljIHZvaWQgcWNvbV9wY2llX2ljY19vcHBfdXBkYXRl
KHN0cnVjdCBxY29tX3BjaWUgKnBjaWUpCj4gPiAgIAl9Cj4gPiAgIH0KPiA+ICtzdGF0aWMgaW50
IHFjb21fcGNpZV9yZXNldF9zbG90KHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSwKPiA+
ICsJCQkJICBzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiA+ICt7Cj4gPiArCXN0cnVjdCBwY2lfYnVz
ICpidXMgPSBicmlkZ2UtPmJ1czsKPiA+ICsJc3RydWN0IGR3X3BjaWVfcnAgKnBwID0gYnVzLT5z
eXNkYXRhOwo+ID4gKwlzdHJ1Y3QgZHdfcGNpZSAqcGNpID0gdG9fZHdfcGNpZV9mcm9tX3BwKHBw
KTsKPiA+ICsJc3RydWN0IHFjb21fcGNpZSAqcGNpZSA9IHRvX3Fjb21fcGNpZShwY2kpOwo+ID4g
KwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBwY2llLT5wY2ktPmRldjsKPiA+ICsJdTMyIHZhbDsKPiA+
ICsJaW50IHJldDsKPiA+ICsKPiA+ICsJLyogV2FpdCBmb3IgdGhlIHBlbmRpbmcgdHJhbnNhY3Rp
b25zIHRvIGJlIGNvbXBsZXRlZCAqLwo+ID4gKwlyZXQgPSByZWFkbF9yZWxheGVkX3BvbGxfdGlt
ZW91dChwY2llLT5wYXJmICsgUEFSRl9TVEFUVVMsIHZhbCwKPiA+ICsJCQkJCSB2YWwgJiBGTFVT
SF9DT01QTEVURUQsIDEwLAo+ID4gKwkJCQkJIEZMVVNIX1RJTUVPVVRfVVMpOwo+ID4gKwlpZiAo
cmV0KSB7Cj4gPiArCQlkZXZfZXJyKGRldiwgIkZsdXNoIGNvbXBsZXRpb24gZmFpbGVkOiAlZFxu
IiwgcmV0KTsKPiA+ICsJCWdvdG8gZXJyX2hvc3RfZGVpbml0Owo+ID4gKwl9Cj4gPiArCj4gPiAr
CS8qIENsZWFyIHRoZSBGTFVTSF9NT0RFIHRvIGFsbG93IHRoZSBjb3JlIHRvIGJlIHJlc2V0ICov
Cj4gPiArCXZhbCA9IHJlYWRsKHBjaWUtPnBhcmYgKyBQQVJGX0xUU1NNKTsKPiA+ICsJdmFsIHw9
IFNXX0NMRUFSX0ZMVVNIX01PREU7Cj4gPiArCXdyaXRlbCh2YWwsIHBjaWUtPnBhcmYgKyBQQVJG
X0xUU1NNKTsKPiA+ICsKPiA+ICsJLyogV2FpdCBmb3IgdGhlIEZMVVNIX01PREUgdG8gY2xlYXIg
Ki8KPiA+ICsJcmV0ID0gcmVhZGxfcmVsYXhlZF9wb2xsX3RpbWVvdXQocGNpZS0+cGFyZiArIFBB
UkZfTFRTU00sIHZhbCwKPiA+ICsJCQkJCSAhKHZhbCAmIEZMVVNIX01PREUpLCAxMCwKPiA+ICsJ
CQkJCSBGTFVTSF9USU1FT1VUX1VTKTsKPiA+ICsJaWYgKHJldCkgewo+ID4gKwkJZGV2X2Vycihk
ZXYsICJGbHVzaCBtb2RlIGNsZWFyIGZhaWxlZDogJWRcbiIsIHJldCk7Cj4gPiArCQlnb3RvIGVy
cl9ob3N0X2RlaW5pdDsKPiA+ICsJfQo+ID4gKwo+ID4gKwlxY29tX3BjaWVfaG9zdF9kZWluaXQo
cHApOwo+ID4gKwo+ID4gKwlyZXQgPSBxY29tX3BjaWVfaG9zdF9pbml0KHBwKTsKPiA+ICsJaWYg
KHJldCkgewo+ID4gKwkJZGV2X2VycihkZXYsICJIb3N0IGluaXQgZmFpbGVkXG4iKTsKPiA+ICsJ
CXJldHVybiByZXQ7Cj4gPiArCX0KPiA+ICsKPiA+ICsJcmV0ID0gZHdfcGNpZV9zZXR1cF9yYyhw
cCk7Cj4gPiArCWlmIChyZXQpCj4gPiArCQlnb3RvIGVycl9ob3N0X2RlaW5pdDsKPiA+ICsKPiA+
ICsJLyoKPiA+ICsJICogUmUtZW5hYmxlIGdsb2JhbCBJUlEgZXZlbnRzIGFzIHRoZSBQQVJGX0lO
VF9BTExfTUFTSyByZWdpc3RlciBpcwo+ID4gKwkgKiBub24tc3RpY2t5Lgo+ID4gKwkgKi8KPiA+
ICsJaWYgKHBjaWUtPmdsb2JhbF9pcnEpCj4gPiArCQl3cml0ZWxfcmVsYXhlZChQQVJGX0lOVF9B
TExfTElOS19VUCB8IFBBUkZfSU5UX0FMTF9MSU5LX0RPV04gfAo+ID4gKwkJCSAgICAgICBQQVJG
X0lOVF9NU0lfREVWXzBfNywgcGNpZS0+cGFyZiArIFBBUkZfSU5UX0FMTF9NQVNLKTsKPiA+ICsK
PiA+ICsJcWNvbV9wY2llX3N0YXJ0X2xpbmsocGNpKTsKPiA+ICsJaWYgKCFkd19wY2llX3dhaXRf
Zm9yX2xpbmsocGNpKSkKPiA+ICsJCXFjb21fcGNpZV9pY2Nfb3BwX3VwZGF0ZShwY2llKTsKPiBU
aGlzIGljYyBvcHAgdXBkYXRlIGNhbiB3ZSByZW1vdmVkIGFzIHRoaXMgY2FuIHVwZGF0ZWQgZnJv
bSB0aGUgZ2xvYmFsCj4gSVJRLgoKUmlnaHQuIEkgZm9yZ290IHRvIHJlbW92ZSBpdCBhZnRlciBr
ZWVwaW5nIGxpbmsgdXAgSVJRIGNoYW5nZS4gUmVtb3ZlZCBpdCB3aGlsZQphcHBseWluZy4KCi0g
TWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXg
rq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
