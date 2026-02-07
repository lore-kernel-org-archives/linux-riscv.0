Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C93CEE6B74
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 04:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwEN4VDqS7bsgb/0outUK40kvcQaHuRu7cM0xrNMGrE=; b=b3D2CpM5tetdcx
	uJTbQN/qKYidheYBUSso/vbAH7qnqM3tlMUz8Zscf893pSPjoTAfLGQ53Od7cdwu9t4DKHrZYG+BH
	aXjY6n/xgRSrirmBSKTyo+0V8SzsyKnJWRRQHsjYk/Ibl7M+OYxNXPsMi9OpTk0jJOC0u6GzwTLAS
	0Ao6vkB8gA2//FNvVPurSNPuhbdFEEvLi4ON7FmY2GDB2DLGK/0lLGNB7KkQPaiAqrhUTadvT1Phk
	x8TlfdFr9gvZOibgNhcEoUr9tgNuPqbkUbWYeRG7whDFPfTcROWXSJrbf2+Ex4ooWoUg7jJv++pFg
	iUOJFRt2dlbNxoeoq64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voZm8-0000000C6y9-1JBr;
	Sat, 07 Feb 2026 04:18:28 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voZm5-0000000C6x1-3dOs
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 04:18:27 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-79088484065so26228767b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 20:18:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770437904; cv=none;
        d=google.com; s=arc-20240605;
        b=TbnKLL3tYFRYsJiHqPMZXHJQuH3PR8u2shbG+GtLsr0fB1XT/nechunrUUu9bN5Q/9
         Yd+yjAfd3/hH3uMKHE0+adbgnTDWcOU/ICZaA4T2O7WptXZLSjsaCn3ZIpguSqQl8CyV
         pRLmBwc2f0o3/MRCoN5MT+eOM9IisApJqXBa6xgRWTOKksMBccDRdbl09QHJtoAWpD07
         ghK8eSbuOWKXMX0b4tKMQD5PbSpEUL2d2N4LxnHomBqhgDrAXtDfgGAtf2vjiKD5ysJ3
         NRtNKAD/WnPh+qg4jgwOtmHHr94/rRwHmbzCrkhGB/+A+qc0lB8XBA8u2srJboBarZpE
         sJTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rlqj60mTlKp9vljDo1EyV+FIHM/jq0ew3HejDNdwclg=;
        fh=41UXHNDff3ivnsl+70G9DWekB/kxg0VA/vI6vVU5lQM=;
        b=hPlrdXUSH+Vz0+G4VwHD6Cb8w0G2noMKU0Va/XUevRwDDB7ze9fGHG+3rptuCFS6bo
         FXbY7UJiKJT9inocAUAj+BBZuWKqdtfQTYNwEOb+b48/kB7381vYYWSL/UvYrqeQyx5x
         flXO7vC6P+v/wjwuq8/TDjtFvynIWMNhVjKzXVHN2TkJrPuBF/i1EXXbm5wCv88q1uo/
         Z6iDUFGiXqyXsRc53kCC8r7y1fZF8NU1XcMvIZ1DodJxeONfqxz+ZhJD2Xlsae3EtfX9
         KK+7fnFtRGx4n9hf7SJSaRc8KWIjLtFt22DGuJMLnvr4ZeXwKeyb4SqxR1dmLf1hrpzA
         Kd4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1770437904; x=1771042704; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlqj60mTlKp9vljDo1EyV+FIHM/jq0ew3HejDNdwclg=;
        b=cRxBxMSQQAIg9DinR9+PeP1J5BGkbBiiWQNSKI1Ie61rVrY5CC2pOlG2T2TGqGiymi
         OBqSW8a0Maxjrht0AsaVJucryRaAAwCehXHUCL9le1e7KRPSb25zMmXeC2s26yNeIDxP
         KqYWELU1xvbvio/kDNCbMkvg8hQrFPDAYC2hC8j/U4IS9i0ZQ9YzDPmg3u08PcDNZCvn
         KjdegwQ2ubFOF7RtuzdhflqKQiPIFZB+GdsFz3Tc0QtRL9UE5Su5fCDfOKaHmJzS9vAP
         hldsCpe6vCc+LXkVtHbSVFuL2ZZKPIbWo3loQgRtOkxK/YSAGEq64hT9EsvJff04ZZnt
         mIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770437904; x=1771042704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rlqj60mTlKp9vljDo1EyV+FIHM/jq0ew3HejDNdwclg=;
        b=GKr52VekxWS4t7YrgRbX0p6AY8jSDgSJHpoiNhCJ8ISNoFX2gT+X7/9JO9+n5YWSxw
         P2UVHAE8mvWhrICMHyM+pmPMTbb8bq5KLnOh2bFhO71dL++1Z4H0fTU7Dxu7Ew/oN7as
         fKcf+jMMPa/Urv4pBrCDMjRVy9fLFXB7wP/PmGx5Mhs4DlBuMjCEsWWy/UaXmRs0TT4J
         35ZWrvy9TNZl02iHyA4DVm6Q26d9feRRVqZR7sfESPkWXw3yx3OmJrU+opBUvIgvE1B+
         kR7Szr2RAHmANJhKgKEwzG8HCLtvXr/FYUqRkb8y/Y8qtr9xypXF4AM3cHWYJnhvc1uV
         k7lw==
X-Forwarded-Encrypted: i=1; AJvYcCWnS0TRBC1xQqa4Rg3cRJjuHVCXOOQ7IqmMsxqSZyfCYomW7u18jzELSrkhL7q3dPqfDlourMNawVIqIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOSlEnqTj9m6AHUloRRr+CO3XZ6UPD8ugBnpgeL+cxTn0mIQdi
	Gv1IjTLqcj3+qpWPaduprDOqUutAgC7u89bGQFxuenHIFArKl3qbVwCLLc3AifcrQmuuEQ43UGx
	/2ZpRqEP77TakzPmwzC2etQaX7z6KW4ZcTjtnpS4vjw==
X-Gm-Gg: AZuq6aK7qAtYSo35wXVHZLBlvmveVtxstHTTSANeZIvmBuVV2/YjXhBCFUtb6/JzyXe
	cyCYNk4XJkR7DtbtYgI4Fioqo1CFhFGAERaxsEslbh+FqcieQq0NwuRx69Gb8JtljkcKZmxg3eV
	LJMTyBMwSSEjCnufKtLpL4VmnBzDELbQa8EFAS0UO//l01waXxpB1ZuzBz2QYqzJWopFXUJAQXr
	pC51H++bUEcMIeCc+C1st124JyWZ+B/5Wh9spjne+veHOWZTmsaY/nCIe5my6DyVx+F+47frGxr
	RshszCwZgBLqYtVF6mXw7S9n+H8ukJC4ePs58NViV7otOzHD4hMtZh3kEq2g
X-Received: by 2002:a05:690c:61c2:b0:793:c9d4:3c8c with SMTP id
 00721157ae682-7952a92b6b7mr103670897b3.0.1770437904547; Fri, 06 Feb 2026
 20:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-1-0922e43acaba@oss.tenstorrent.com>
 <20260205-upbeat-tortoise-of-admiration-b3c0eb@quoll> <CAEev2e8_4LSLNvHsiC4d7Rrd2GmjQ_5GRHU6b9-Ha69+yvn5cA@mail.gmail.com>
 <92512903-4651-4ac3-b3ea-c9297e866a3a@kernel.org>
In-Reply-To: <92512903-4651-4ac3-b3ea-c9297e866a3a@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 6 Feb 2026 22:18:13 -0600
X-Gm-Features: AZwV_QiHNac6LgRRtfDmS7__jtmHqoGGjoj97IGh3VIDiCdpb8PGDE9Igjmveao
Message-ID: <CAEev2e99LEoi83_d09NEJwzcSiYdFFZvLOFZUTRRrYtL_qCErw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, bmasney@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_201825_920462_3F6F7B6C 
X-CRM114-Status: GOOD (  19.83  )
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

T24gVGh1LCBGZWIgNSwgMjAyNiBhdCAxMjo0NeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAwNS8wMi8yMDI2IDE1OjMxLCBBbmlydWRoIFNy
aW5pdmFzYW4gd3JvdGU6Cj4gPj4+ICtleGFtcGxlczoKPiA+Pj4gKyAgLSB8Cj4gPj4+ICsgICAg
Y2xvY2stY29udHJvbGxlckBhODAwMDAwMCB7Cj4gPj4+ICsgICAgICBjb21wYXRpYmxlID0gInRl
bnN0b3JyZW50LGF0bGFudGlzLXByY20tcmNwdSI7Cj4gPj4+ICsgICAgICByZWcgPSA8MHhhODAw
MDAwMCAweDEwMDAwPjsKPiA+Pj4gKyAgICAgIGNsb2NrcyA9IDwmb3NjXzI0bT47Cj4gPj4+ICsg
ICAgICAjY2xvY2stY2VsbHMgPSA8MT47Cj4gPj4+ICsgICAgICAjcmVzZXQtY2VsbHMgPSA8MT47
Cj4gPj4+ICsgICAgfTsKPiA+Pj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5F
UlMKPiA+Pj4gaW5kZXggZGM3MzFkMzdjOGZlLi4wZmM3YmM2ZDA0NTggMTAwNjQ0Cj4gPj4+IC0t
LSBhL01BSU5UQUlORVJTCj4gPj4+ICsrKyBiL01BSU5UQUlORVJTCj4gPj4+IEBAIC0yMjUzNCw4
ICsyMjUzNCwxMCBAQCBNOiAgIEpvZWwgU3RhbmxleSA8am1zQG9zcy50ZW5zdG9ycmVudC5jb20+
Cj4gPj4+ICBMOiAgIGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+Pj4gIFM6ICAg
TWFpbnRhaW5lZAo+ID4+PiAgVDogICBnaXQgaHR0cHM6Ly9naXRodWIuY29tL3RlbnN0b3JyZW50
L2xpbnV4LmdpdAo+ID4+PiArRjogICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Y2xvY2svdGVuc3RvcnJlbnQsYXRsYW50aXMtcHJjbS55YW1sCj4gPj4+ICBGOiAgIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi90ZW5zdG9ycmVudC55YW1sCj4gPj4+ICBG
OiAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvdGVuc3RvcnJlbnQvCj4gPj4+ICtGOiAgIGluY2x1ZGUv
ZHQtYmluZGluZ3MvY2xvY2svdGVuc3RvcnJlbnQsYXRsYW50aXMtcHJjbS5oCj4gPj4+Cj4gPj4+
ICBSSVNDLVYgVEhFQUQgU29DIFNVUFBPUlQKPiA+Pj4gIE06ICAgRHJldyBGdXN0aW5pIDxmdXN0
aW5pQGtlcm5lbC5vcmc+Cj4gPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Ns
b2NrL3RlbnN0b3JyZW50LGF0bGFudGlzLXByY20uaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xv
Y2svdGVuc3RvcnJlbnQsYXRsYW50aXMtcHJjbS5oCj4gPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gPj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzgyMDc4MTEyN2MzCj4gPj4+IC0tLSAvZGV2L251
bGwKPiA+Pj4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay90ZW5zdG9ycmVudCxhdGxh
bnRpcy1wcmNtLmgKPiA+Pgo+ID4+IFN0aWxsIHdyb25nIG5hbWUuLi4gTG9vayBhdCB5b3VyIGNv
bXBhdGlibGUuCj4gPj4KPiA+PiBQbGVhc2UgcmVhZCB3cml0aW5nIGJpbmRpbmdzIGRvYyBpbiBE
VCBkaXIuCj4gPgo+ID4gV2Ugd2lsbCBoYXZlIG11bHRpcGxlIGNvbXBhdGlibGVzIGluIHRoZSBm
dXR1cmUgKEkgZHJvcHBlZCB0aGVzZSBpbgo+Cj4gTWF5YmUgeW91IHdpbGwsIG1heWJlIG5vdC4g
QnV0IHlvdSBkbyBub3QgaGF2ZSBub3cuCgpMZXQgbWUgYWRkIHRoZW0gbm93LgoKPgo+ID4gdGhp
cyB2ZXJzaW9uIGFuZCBJIGhhdmUgbWVudGlvbmVkIHRoaXMgaW4gdGhlIGNoYW5nZWxvZyBpbiB0
aGUgY292ZXIKPiA+IGxldHRlcikgbmFtZWQgInRlbnN0b3JyZW50LGF0bGFudGlzLXByY20teHl6
Ii4gVGhlIGJpbmRpbmdzIGRvY3VtZW50Cj4KPiBXaGVyZSBkaWQgeW91IG1lbnRpb24gaXQ/IEkg
d2VudCBUV0lDRSB0aHJvdWdoIGl0LgoKQ29ub3IgYW5kIEkgd2VyZSBkaXNjdXNzaW5nIHRoZXNl
IGluIGEgcHJldmlvdXMgc2VyaWVzIGFuZCB3ZXJlCnJlZmVycmluZyB0byB0aGVtIGFzIHJjcHUg
cHJjbSBhbmQgIXJjcHUgcHJjbXMuIEkgdXNlIHRoZXNlIHRlcm1zIHRvCnJlZmVyIHRvIGl0IGlu
ICJDaGFuZ2VzIGluIHY0Ii4KCj4KPiA+IHN1Z2dlc3RzIHBpY2tpbmcgYSBtb3JlIGdlbmVyaWMg
bmFtZSBpbiB0aGlzIGNhc2UsIHNvIGlzbid0Cj4gPiAidGVuc3RvcnJlbnQsYXRsYW50aXMtcHJj
bSIgb2theSBmb3IgdGhhdD8KPgo+IE5vLCBiZWNhdXNlIEkgZG9uJ3Qgd2FudCB0byBrZWVwIGd1
ZXNzaW5nIHRoaXMuIFRoZSBkb2NzIGNsZWFybHkgYXNrIHlvdQo+IHRvIHBvc3QgY29tcGxldGUg
YmluZGluZ3MsIHdoaWNoIG5vdyBiZWNhbWUgbGVzcy1jb21wbGV0ZSwgYnV0IGZpbmUuCj4gVGhl
biB0aGUgbmV4dCBydWxlIGFza3MgeW91IHRvIHVzZSBjb21wYXRpYmxlIGFzIGZpbGVuYW1lLiBZ
b3UgY2Fubm90Cj4ga2VlcCBza2lwcGluZyB0aGUgcnVsZXMuCgpJIHdpbGwgYWRkIGFsbCB0aGUg
Y29tcGF0aWJsZXMgYmFjaywgc28gdGhlcmUgd2lsbCBiZSA0IG9mIHRoZW0gbmFtZWQKInRlbnN0
b3JyZW50LGF0bGFudGlzLXByY20teHl6Ii4gSW4gdGhhdCBjYXNlIGlzIGl0IGFwcHJvcHJpYXRl
IGZvcgp0aGUgZmlsZW5hbWUgdG8gYmUgInRlbnN0b3JyZW50LGF0bGFudGlzLXByY20ueWFtbCI/
Cgo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
