Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4F1D111B6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 07:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XP8PODlyBveqmUdpBoLIZkNxzBwRyQ1YEgRbc4LaqOE=; b=zB4oVQq5SB4QZW
	AEXzjnrHxrqdDQmdbHs20+wv2++3hTCvWxIo2CgROppnM6RDc50hxwAOMh7p+zD6cXs+8U7wlSrCJ
	aYZErOsUErER+1C5dlGjWhksFkrRHT1eJl16J97dBQl0IKKj/69+zOj9ZrMIz/Q6ZiUEo/bNC+26i
	nP3expAdsdLe0pojKz7SIe02QFstjiwnr4Hj5Z+CSJU06Li6kqBiJnf1yt1Cc4JBgbEyZVODd0W3G
	npynknKXBViD6t8r6n2ky6ZbAy0OuXQLpS6pU+pmmXiu7gxRBXaojkB6btS0Bg1ziHlam0edgILvg
	E12RPNM7zA9IApQC7Gxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rlO-0000000CsmP-3qTO;
	Mon, 04 Nov 2024 07:44:38 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rlL-0000000CslL-1RMy
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 07:44:37 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5cecbddb574so1671289a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 23:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730706273; x=1731311073; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1UzoUW+225YzvqE1f3m2N8UQrWxc0odLIz4t11IfNg=;
        b=htZZ188zGmpOhcGlVUAzA3ENbR3TgJwKjNVTbfASPzuPJ2cPyhhHGClc8M6hV2eHm+
         l8OVi67CM0F2kY32zIzFo3bvVR4mZTCdHvtyycGRo6PQfcm+qvKwNn3X4Xa2C0cUXvrS
         iCMyhIStzh6r9cwakN2ggS5Q4w3dO0Qv3bF5mgJddd3XB6vTUrmdh7mTlAFqjEEH1YBb
         B+gqi0w08nXN1AqauAS1FElx3s2lOB8JDx2V2SxBiTYpgCGAm5OnwsujwAy6SRyPbFsE
         yGK31BB+5iiyVffsCKeKKFjXQsHw8HBRB8Oh8+d+4IT2eIXc2emOyyhLjKZcFu64dTbM
         vn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730706273; x=1731311073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1UzoUW+225YzvqE1f3m2N8UQrWxc0odLIz4t11IfNg=;
        b=k0ixMzrnQ/Elw2gkvB4ZhXbE+TM8NYw6JApzJfyfXKWr4KYcyoss3J8aOkKzYGoI8N
         KAJnk25dz8swDKki0/baX6dINJg3w0zA/R7dwM5ZVBBykcFAiCNlKFfOeSUZ0z0lAAW3
         lNV5AqZ4eDA+5dgqvEnXfxlGyFs77hNcWis0li34JNyFEfhRQXipliHRvVQPk1e7tX9C
         W+McmBISay62ZnRCwQ6vKhY/JKkSxMtGOvX9JW3+HR04JM1Vg5jkgYGMnqB9kz83uyay
         A583lTWyl0RkDCCEzVsuEuwCBlCGk+eMoOG+stfs/8tGxPe3KeRoUSbhM9mKoTLo/y+U
         ZVMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ8hKp+DG9C7rHh5FoSvAcFFNMRC3VHGkp9TccmbhVaJSDmzDUCIm+HNbWzgj3iXhFm5SXWuUkqtK0/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6fGLXEP/N8OQtMgvZ28msjRv1FkTUBiueL5ssAU48HqvDKEbs
	AqPzT/Uxa5HFs+Vv+g5SCN55wZOlwY0W3d+/3JlengI8gg1P8MX0jEHief/tvNDJPU0Gn/74P0Z
	S1nJnXH3cWxa1R1N1H2XX5mJzqSBZgecT5J5gnA==
X-Google-Smtp-Source: AGHT+IEksnR3vuhAnQrwH3mab69+1/DkM6JOYCLAfgomVfAxSyJ+/4yRefXDNLq7hexWVnxdTSNFTCh1cLhgy0PD5yI=
X-Received: by 2002:a17:907:7245:b0:a99:f8e2:edec with SMTP id
 a640c23a62f3a-a9de5d6f21cmr3120143866b.21.1730706273092; Sun, 03 Nov 2024
 23:44:33 -0800 (PST)
MIME-Version: 1.0
References: <20240927-dev-maxh-svukte-rebase-2-v2-0-9afe57c33aee@sifive.com>
 <20240927-dev-maxh-svukte-rebase-2-v2-3-9afe57c33aee@sifive.com> <CAAhSdy0ncLTAjEE1s-GWL95sscxwQFsKn1rXyA1_VVfk1bQBiw@mail.gmail.com>
In-Reply-To: <CAAhSdy0ncLTAjEE1s-GWL95sscxwQFsKn1rXyA1_VVfk1bQBiw@mail.gmail.com>
From: Max Hsu <max.hsu@sifive.com>
Date: Mon, 4 Nov 2024 15:44:21 +0800
Message-ID: <CAHibDywpKUE7r4UfcudDSBZCM=JAC5s40uf+PwQE+oMvZy4aVA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/3] riscv: KVM: Add Svukte extension support for Guest/VM
To: Anup Patel <anup@brainfault.org>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@sifive.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_234435_402555_D57C989A 
X-CRM114-Status: GOOD (  18.98  )
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

SGkgQW51cCwKClRoYW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rpb24uCgpJ4oCZbSBub3QgZW50aXJl
bHkgc3VyZSBpZiBJIGZ1bGx5IHVuZGVyc3RhbmQgaXQsIGJ1dCBJIGJlbGlldmUgdGhlCmh5cGVy
dmlzb3Igc2hvdWxkIGJlIGFibGUgdG8gZGlzYWJsZSB0aGUgU3Z1a3RlIGV4dGVuc2lvbi4KCklu
c2lkZSB0aGUgc3dpdGNoLWNhc2Ugb2Yga3ZtX3Jpc2N2X3ZjcHVfaXNhX2Rpc2FibGVfYWxsb3dl
ZCgpLAp0aGUgZGVmYXVsdCBjYXNlIGJyZWFrcyBhbmQgcmV0dXJucyB0cnVlLgoKU28gdGhhdCBt
ZWFucyB3aGVuIHRoZSBLVk1fUklTQ1ZfSVNBX0VYVF9TVlVLVEUgcGFzc2VkIGludG8Ka3ZtX3Jp
c2N2X3ZjcHVfaXNhX2Rpc2FibGVfYWxsb3dlZCgpIGl0IHdpbGwgcmV0dXJuIHRydWUuCgpJZiBJ
J3ZlIG1pc3VuZGVyc3Rvb2QsIHBsZWFzZSBsZXQgbWUga25vdy4KCkJlc3QgcmVnYXJkcywKTWF4
IEhzdQoKT24gRnJpLCBPY3QgMjUsIDIwMjQgYXQgMzoxN+KAr0FNIEFudXAgUGF0ZWwgPGFudXBA
YnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBTZXAgMjcsIDIwMjQgYXQgNzoxMuKA
r1BNIE1heCBIc3UgPG1heC5oc3VAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQWRkIEtWTSBJ
U0EgZXh0ZW5zaW9uIE9ORV9SRUcgaW50ZXJmYWNlIHRvIGFsbG93IFZNTSB0b29scyB0bwo+ID4g
ZGV0ZWN0IGFuZCBlbmFibGUgU3Z1a3RlIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0uCj4gPgo+ID4g
UmV2aWV3ZWQtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+
ID4gU2lnbmVkLW9mZi1ieTogTWF4IEhzdSA8bWF4LmhzdUBzaWZpdmUuY29tPgo+ID4gLS0tCj4g
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIHwgMSArCj4gPiAgYXJjaC9yaXNj
di9rdm0vdmNwdV9vbmVyZWcuYyAgICAgIHwgMSArCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gPiBpbmRleCBl
OTdkYjMyOTY0NTZlMTlmNzljYTAyZTRjNGY3MGFlMWI0YWJiNDhiLi40MWI0NjZiN2ZmYWVjNDIx
ZTgzODlkM2Y1YjE3ODU4MDA5MWEyYzk4IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2t2bS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20v
a3ZtLmgKPiA+IEBAIC0xNzUsNiArMTc1LDcgQEAgZW51bSBLVk1fUklTQ1ZfSVNBX0VYVF9JRCB7
Cj4gPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDRiwKPiA+ICAgICAgICAgS1ZNX1JJU0NW
X0lTQV9FWFRfWkNNT1AsCj4gPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pBV1JTLAo+ID4g
KyAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9TVlVLVEUsCj4gPiAgICAgICAgIEtWTV9SSVNDVl9J
U0FfRVhUX01BWCwKPiA+ICB9Owo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+ID4gaW5kZXggYjMx
OWM0YzEzYzU0Y2UyMmQyYTc1NTJmNGM5ZjI1NmEwYzUwNzgwZS4uNjcyMzdkNmU1Mzg4MmE5ZmNk
MmNmMjY1YWExNzA0ZjI1Y2M0YTcwMSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfb25lcmVnLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiA+IEBA
IC00MSw2ICs0MSw3IEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBsb25nIGt2bV9pc2FfZXh0X2Fy
cltdID0gewo+ID4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZJTlZBTCksCj4gPiAgICAgICAg
IEtWTV9JU0FfRVhUX0FSUihTVk5BUE9UKSwKPiA+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFNW
UEJNVCksCj4gPiArICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVlVLVEUpLAo+ID4gICAgICAgICBL
Vk1fSVNBX0VYVF9BUlIoWkFDQVMpLAo+ID4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkFXUlMp
LAo+ID4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkJBKSwKPgo+IFRoZSBLVk1fUklTQ1ZfSVNB
X0VYVF9TVlVLVEUgc2hvdWxkIGJlIGFkZGVkIHRvIHRoZQo+IHN3aXRjaC1jYXNlIGluIGt2bV9y
aXNjdl92Y3B1X2lzYV9kaXNhYmxlX2FsbG93ZWQoKSBiZWNhdXNlCj4gaHlwZXJ2aXNvciBzZWVt
cyB0byBoYXZlIG5vIHdheSB0byBkaXNhYmxlIFN2dWt0ZSBmb3IgdGhlIEd1ZXN0Cj4gd2hlbiBp
dCdzIGF2YWlsYWJsZSBvbiB0aGUgSG9zdC4KPgo+IFJlZ2FyZHMsCj4gQW51cAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
