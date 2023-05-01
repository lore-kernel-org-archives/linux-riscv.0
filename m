Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37879C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 15:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ap738SGUdbz428q0Pqt8GOu+Dsx8RExvXCvsvIhVybA=; b=mYsapkHXkS+wxl
	9ySEMqvkyXfegMs4bfbOqsb0As023jcCPVejJrD59vCrsArT8FOzoJT9S7GxAQqQNTkqlIZ6PxVmT
	WW3g8vzA2IagwfhitNBjjdmOJhi1TsGXLrxKs5k7sD60gQ1Vh4E1y+QB5DKXaOyZK//obGnY8IHRx
	rRlMz3RM7ulkW4lkwNdQnBn04WaCcWNEfBny1gQ0QRo0kmb6/+kqNAjZCOTVB455caznuPrSbZaor
	8OXQnWpPz8xMBZ/Q+0GOe4wevmQh0zwOpMQzdK2UQE4g49K+T8/n4W0CYWBEBgLKYDyibStSr1gpC
	fpA2Y1SFkBlEYdpI5XKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptVXb-00GEgP-0i;
	Mon, 01 May 2023 15:34:15 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptVXV-00GEdl-0L
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 15:34:13 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2a7af0cb2e6so25441331fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 08:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682955243; x=1685547243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOUg2Qc8aphe+30HNqY5ybX4gjABL3Ib/MKnnLtzDrs=;
        b=cjIapAexQolPOJup6sm/QwTf4sMOe74fhKip8P0hVHqe2uBZV2gPyiY2kmDq94orez
         sQyh4Ypk7uCS74wWWjh+ZaQw6RCHpsvzzGa5WaopghrovB/P1YzkePHy5w1+2tPyfA1p
         IBEJleXckQ7WtwIDpU9iQQ7GnZUDjnkJUVBMqKxSMfYrOSUWOLOcnyPbkUZagObFSuah
         EDpubk2wNji3BPh5mOZ6Lw0kYu8i2t9ZmRT2IFTlx9sf9gFHi44jThiNm97M+AJSnVDk
         tHcK6pC/DuqrJ6BBeQbvepcxHsEUr5nhBYpMZk+IwMe/gd9/vwajrlLLSQZXQtH61Ng2
         i6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682955243; x=1685547243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOUg2Qc8aphe+30HNqY5ybX4gjABL3Ib/MKnnLtzDrs=;
        b=X8nEB1aAkVukgOS9rYt63J2z7avz7ToeVcAgx6dm2KcvOXshUwQ7H+H40sNQ9/kev0
         +c46N/ToTobqTzfxXAtSDwD0PQaNKepCLF2oq9Rhh0+mkqYXK2l0IPTbUi43E7O5HTVc
         IREDyvhUIVzGLeiyWh0u3FBy7OTc4XpJq0rObOvYIIZw0Dpb4PPcXFjXqTeJwVnugZHp
         N8SKByH+rGVVZkMAop9rsGx4PXUfw1AXIL7yD9j2JoOxulVb8zuWmb5n5IAhXwkAHQh/
         +HmIT1C1TObtTHLBd/7s0thrfoDhWSCEpyuzOs23/h3TCSBuZS1xcobusVzgA/rWcrXP
         rrAg==
X-Gm-Message-State: AC+VfDxJr8gzLwxiI/29lGiUu+IBuFQmFJ1yEqSZMlG9D4UP9bIl6PqN
	LsmAHOc8b9boH8RdT+YFpewONX15VEgMFXklhQuLrQ==
X-Google-Smtp-Source: ACHHUZ6IU1u2FvDTXJXMw4IA/nV32AFHoZw5qaY7705jJwaFYxe2yKKPjDwdVUL9OpvJlWKadFzOU1Hesphz9OxjV0k=
X-Received: by 2002:a2e:3c05:0:b0:2a8:c75d:8167 with SMTP id
 j5-20020a2e3c05000000b002a8c75d8167mr3689817lja.4.1682955243666; Mon, 01 May
 2023 08:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230429-gruffly-chrome-fd94628cc5ff@spud> <mhng-8585bbf5-7d6a-4e09-9c5f-8c6f36092b76@palmer-ri-x1c9a>
In-Reply-To: <mhng-8585bbf5-7d6a-4e09-9c5f-8c6f36092b76@palmer-ri-x1c9a>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 1 May 2023 08:33:27 -0700
Message-ID: <CALs-HsuxeN4O5VYCRDebs0qLpojTzeafCSkWWEhx0eTqvG9X1A@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: hwprobe: Expose Zba and Zbb
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, aou@eecs.berkeley.edu, abrestic@rivosinc.com, 
	ajones@ventanamicro.com, coelacanthus@outlook.com, 
	Conor Dooley <conor.dooley@microchip.com>, heiko.stuebner@vrull.eu, corbet@lwn.net, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_083409_141256_C9D042F0 
X-CRM114-Status: GOOD (  18.80  )
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

T24gU2F0LCBBcHIgMjksIDIwMjMgYXQgMTowN+KAr1BNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
ZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCAyOSBBcHIgMjAyMyAwNjo0MDo1MSBQRFQg
KC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gRnJpLCBBcHIgMjgsIDIwMjMgYXQg
MTI6MDY6MDhQTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+PiBBZGQgdHdvIG5ldyBiaXRz
IHRvIHRoZSBJTUFfRVhUXzAga2V5IGZvciBaQkEgYW5kIFpCQiBleHRlbnNpb25zLiBUaGVzZQo+
ID4+IGFyZSBhY2N1cmF0ZWx5IHJlcG9ydGVkIHBlciBDUFUuCj4gPj4KPiA+PiBTaWduZWQtb2Zm
LWJ5OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPiA+Pgo+ID4+IC0tLQo+ID4+Cj4g
Pj4gIERvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QgICAgICAgfCAgNyArKysrKwo+ID4+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgIDIgKysKPiA+PiAgYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgICAgICAgICB8IDQzICsrKysrKysrKysrKysrKysr
KysrKystLS0tLQo+ID4+ICAzIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3By
b2JlLnJzdCBiL0RvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QKPiA+PiBpbmRleCA5ZjBk
ZDYyZGNiNWQuLjIxZjQ0NGEzODM1OSAxMDA2NDQKPiA+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL3Jp
c2N2L2h3cHJvYmUucnN0Cj4gPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJz
dAo+ID4+IEBAIC02NCw2ICs2NCwxMyBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmluZWQ6
Cj4gPj4gICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9JTUFfQ2A6IFRoZSBDIGV4dGVuc2lv
biBpcyBzdXBwb3J0ZWQsIGFzIGRlZmluZWQKPiA+PiAgICAgIGJ5IHZlcnNpb24gMi4yIG9mIHRo
ZSBSSVNDLVYgSVNBIG1hbnVhbC4KPiA+Pgo+ID4+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJP
QkVfRVhUX1pCQWA6IFRoZSBaYmEgYWRkcmVzcyBnZW5lcmF0aW9uIGV4dGVuc2lvbiBpcwo+ID4+
ICsgICAgICAgc3VwcG9ydGVkLCBhcyBkZWZpbmVkIGluIHZlcnNpb24gMS4wIG9mIHRoZSBCaXQt
TWFuaXB1bGF0aW9uIElTQQo+ID4+ICsgICAgICAgZXh0ZW5zaW9ucy4KPiA+PiArCj4gPj4gKyAg
KiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9JTUFfWkJCYDogVGhlIFpiYiBleHRlbnNpb24gaXMg
c3VwcG9ydGUsIGFzIGRlZmluZWQKPiA+Cj4gPiBXaHkgaXMgb25lIEVYVF9aQkEgYW5kIHRoZSBv
dGhlciBpcyBJTUFfWkJCPyBZb3UgZG8gbm90IHVzZSBJTUEgYmVsb3csCj4gPiBzbyBJIGFzc3Vt
ZSB0aGlzIGlzIGEgY29weS1wYXN0ZSBtaXN0YWtlLgo+Cj4gTG9va3MgbGlrZSBpdC4gIEVpdGhl
ciB3YXkgdGhpcyB3YXMgdG9vIGxhdGUgZm9yIHRoZSBjdXJyZW50IG1lcmdlCj4gd2luZG93LCBz
byBubyBiaWcgZGVhbC4KCkNvcHlwYXN0YSEgSSdsbCBmaXggaXQuCi1FdmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
