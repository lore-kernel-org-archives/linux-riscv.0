Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B98CCD4F50
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 19:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIfFMIiGAwZbJ51gQmsHeOtnVB7FxbhivVrYsTpp8J0=; b=muTXN/iydJVIz2
	DaHAqFhodzdH7jRzOnTPWvOVAn0RaBn8zSahMhnaUOHEf5v+aZCkEAiT7+Fggev1DXKUbPQ9E4Olj
	XCh3+jHGcbYBQK7eNyaFbDRqnVzWhG1ELyBjfpFgMmVwLTjnYDNErmE1b9ZxPcIyl35NfIxAc/CZK
	FGU4vdJtWEXwU1qr7+WmX+xWd+4n4+SdB2DUnW6oNdTeGPdBWCxXXDkGDNwn1i/HG7v6WDnSxhxq9
	PjZnLjERoSiMHzR6PLEz/49MqB1s3njlwMMWwa6jn6GwDC9bZ3dzXDq/dRCtmDZ9hGkH/ydqOWkVZ
	Rc3+MizpBHXtekWt5MQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3CE-0000000Gcts-3VK8;
	Mon, 18 May 2026 19:00:10 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3CB-0000000GcrN-0I6R
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 19:00:08 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7dbec19732eso3249394a34.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 12:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779130805; cv=none;
        d=google.com; s=arc-20240605;
        b=blmLd9VmzclIxoTh8fi7oE7N6/J2ZRKIGhmWqZIWRolrqv007iaWOqg2/MISfaM2Xi
         Ldte5JQ+cTNHe1KzPCSJ4gQco/8LVXiXA7wsJpbI2LppOv/foYKhlWm+B15xPmdMv8Kn
         SQWII4wEQ9C4xr/o9uFq69UsqOo0dWaVNPsr/Kgq2c0SzJzkid2Lz8vnQR+qwznQ6BFV
         Eoq5SCa7AohXomKwq7PjrS4cXm5nqnT8Mv6N+ZqGLRi+Gh6xDgXSwtziERHv03BXKqUg
         xm2eFUM9oOkKR5TjMPL+20WOFy2tZnhm9DHiBz/j5atY7BHC/BUe0WUWLrn0tAJO5Njw
         YwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dN9lGLFTPIfMJmdzYT+BtnPWS2u85N9lXDRoCULArAs=;
        fh=vr9neYN6eUNO9d+7D90/GgzRH+OxdgjV9rHya2qMVtk=;
        b=c4UKJmL/ByYAYtlSReRIDOpgHGTOiTZmJWcl4v0UzifRNAjo7XIfIzDcMDrmj+A3BY
         UpS9Dli63CmlNX6neCLmeWheKHytOjd+xZwxNoPZXV0UXCe+6hEktT6lFo/tRRvUFIM5
         eKPiq/P8LcB1YHetoSwEEMofIAQOjZyv9oCd/uKkw0+tTZAy+CcloUK52I3jcALESN5i
         QeGRQXAJMokLvRHg0PtSUifvzcVaIQGX+ryEXgnZkIcIJzNQP+k4awc+Jha23LYv07Nm
         92i8pdfd78y1ZU4z+pW36GRV+0n6adAtZFPvB2vEZrnAeWRlTQm/UFyJunEa3kVfTw0h
         qJXQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779130805; x=1779735605; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dN9lGLFTPIfMJmdzYT+BtnPWS2u85N9lXDRoCULArAs=;
        b=UcWpkL8pEyKIDVfQSjpgCP+YDHVStvqkxHIm0Vn0czFvEzWuEvWVWpZKQqcfg0kxW0
         e0TQjCtQaOQeokb6zDQPawSpt/aQzbWBholw8bQ62H5NH5nhB5Ds2EckkuavfUB3CieW
         x8dro8i5hc8maipxeWtfgyIWF8lvVhY7ZTQwKlBnvFpIRvlDvOC32MCHHMaCEEuXrxkY
         mUCP28jfFcbWRyksKHaU0Z1cXi64NvkY3si4Xakb+mvemGBnvlHfFWH8oTipyTzCq2r0
         i/8+XvfbjPdCebSJnNnRFFPsA4NFPdeARdkHF0/fbQo+hHlZh9Om6Jb52mB0Tc8i5bXu
         EsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130805; x=1779735605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dN9lGLFTPIfMJmdzYT+BtnPWS2u85N9lXDRoCULArAs=;
        b=ICclJI5p9MlSLVHj73ne2tIVosY25kzAZdO8yDe3Ok4Ykx3hYTNOdRhRUYt4WjZ2Mw
         NaSmnLhOERSHv4EUmPMEcSOeXt0hpX+ChQ8p8uuv/2zUycGfpuW1l9PaCg6uB/7wgoDo
         /qEDlFnxlJUqiSgCCgFSO+cdwVXwT+Z2zvVjrVNAa6Pn3p1Ywm8i/cksieANV45GbYe2
         L5mLXQz19QWriCQkLqkMMoxBEilG1ZmjcKUw/aFeV9kMsRXkBERpg5RkGbSsmIVSTMds
         h0BgGshDX0Tm/PdGlSECJNYQ30Lv9eKCBmp6CdBMAEJlvkPvFDr80m63ghA/8YRTx0Lv
         2F4w==
X-Forwarded-Encrypted: i=1; AFNElJ8OaMZSmIsLMotA6A8hNQNknWB/u824B6tQRQoYZDr7/fgGLs9juzV5QApYbC+cK97+mLK0aXFa9nzoJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyY4LdGNfusXVprq2VuzbE/nuzyBn+s350pemaO6/cn7y/6dgxW
	12pALOQwkIYhR3nLGBQvsoyLC5rG8JG1pQgfeKZXaFEy353tCjwPpJxD3PuC62HVNcXW1kGyZAk
	TcgJGNGjr2MpuuS3GrTb9L0XFwEPj0zQ=
X-Gm-Gg: Acq92OHp43XF208e0efaWF4E/O/uY1ug1mY/jSA8TIXpwVBudfSSrTWVIbl69p45G59
	QG4BvDFmqTRf55dbWKG22Ruj3Tfd6yA2itKYYlpTKTWNA8GK4LLOsN7qZ3T3hygJsBubBB02fcf
	CoBdYHj9kVbach1MPHlo7TalLTaOtfEXg9C2doINNpQlDRhfCYXUwnltRGoEybBTf+lgyl+pGK0
	y9qyxu8c1zx/MU1o5fHzbbIrGQcYnxX2mzrLS7nJrNrn4+HnYeopgP/qW5p4zJzf28vexruv1Eg
	mHLThkO/
X-Received: by 2002:a05:6830:2b10:b0:7dc:d7e8:cb30 with SMTP id
 46e09a7af769-7e4fa076918mr10786794a34.26.1779130805592; Mon, 18 May 2026
 12:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260514-reopen-purity-0e8914bf3c51@spud>
In-Reply-To: <20260514-reopen-purity-0e8914bf3c51@spud>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 13:59:54 -0500
X-Gm-Features: AVHnY4L2v8Sl80JimJP69yA9JQF0doEbljbJ8NBr1DX3Sc7YDtYlhP0bw3nynKI
Message-ID: <CABb+yY1LXYsmbEvcXJ_wjPHhD21BsBkcf9oC04dvcYT7oKvKkg@mail.gmail.com>
Subject: Re: [PATCH v1] mailbox: mpfs: fix check for syscon presence in mpfs_mbox_inbox_isr()
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Valentina.FernandezAlanis@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_120007_119225_3CA10B57 
X-CRM114-Status: GOOD (  16.23  )
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

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMTE6MznigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KPgo+IG1wZnNfbWJveF9pbmJveF9pc3IoKSB3cml0ZXMgdG8gdGhlIHN5c3Jl
ZyBzY2Igc3lzY29uLCBub3QgdGhlIGNvbnRyb2wKPiBzY2Igc3lzY29uLCBidXQgY2hlY2tzIGZv
ciB0aGUgcHJlc2VuY2Ugb2YgdGhlIGxhdHRlci4gVWx0aW1hdGVseSB0aGlzCj4gbWFrZXMgbGl0
dGxlIGRpZmZlcmVuY2UgYmVjYXVzZSBpZiBvbmUgc3lzY29uIGlzIHByZXNlbnQsIGJvdGggd2ls
bCBiZS4KPgo+IEZpeGVzOiBhNDEyM2ZmYWI5ZWNlICgibWFpbGJveDogbXBmczogc3VwcG9ydCBu
ZXcsIHN5c2NvbiBiYXNlZCwgZGV2aWNldHJlZSBjb25maWd1cmF0aW9uIikKPiBTaWduZWQtb2Zm
LWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+IEND
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IENDOiBEYWlyZSBN
Y05hbWFyYSA8ZGFpcmUubWNuYW1hcmFAbWljcm9jaGlwLmNvbT4KPiBDQzogSmFzc2kgQnJhciA8
amFzc2lzaW5naGJyYXJAZ21haWwuY29tPgo+IENDOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gQ0M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiBDQzogVmFsZW50aW5h
LkZlcm5hbmRlekFsYW5pc0BtaWNyb2NoaXAuY29tCj4gLS0tCj4gIGRyaXZlcnMvbWFpbGJveC9t
YWlsYm94LW1wZnMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tYWlsYm94L21haWxib3gtbXBm
cy5jIGIvZHJpdmVycy9tYWlsYm94L21haWxib3gtbXBmcy5jCj4gaW5kZXggZDVkOWVmZmVjZTk3
OS4uZWY0MGZlMmJlMzBkNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21haWxib3gvbWFpbGJveC1t
cGZzLmMKPiArKysgYi9kcml2ZXJzL21haWxib3gvbWFpbGJveC1tcGZzLmMKPiBAQCAtMjAxLDcg
KzIwMSw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBtcGZzX21ib3hfaW5ib3hfaXNyKGludCBpcnEs
IHZvaWQgKmRhdGEpCj4gICAgICAgICBzdHJ1Y3QgbWJveF9jaGFuICpjaGFuID0gZGF0YTsKPiAg
ICAgICAgIHN0cnVjdCBtcGZzX21ib3ggKm1ib3ggPSAoc3RydWN0IG1wZnNfbWJveCAqKWNoYW4t
PmNvbl9wcml2Owo+Cj4gLSAgICAgICBpZiAobWJveC0+Y29udHJvbF9zY2IpCj4gKyAgICAgICBp
ZiAobWJveC0+c3lzcmVnX3NjYikKPiAgICAgICAgICAgICAgICAgcmVnbWFwX3dyaXRlKG1ib3gt
PnN5c3JlZ19zY2IsIE1FU1NBR0VfSU5UX09GRlNFVCwgMCk7Cj4gICAgICAgICBlbHNlCj4gICAg
ICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKDAsIG1ib3gtPmludF9yZWcpOwo+IC0tCj4gMi41
My4wCj4KQXBwbGllZCB0byBtYWlsYm94L2Zvci1uZXh0ClRoYW5rcwpKYXNzaQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
