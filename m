Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A88C41535
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 23:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shq/ns781RN36Jeo91E7riL8eEktrBOH98XKERYGW9s=; b=AFSlLmFRw45KHr
	IagytvQMGwATcNDFfBirgjNvWI8i8iLzCG9QsqO6ikHfbb0GW/BdST6Y6k4MMWVsr+4ZCC1nl0WRX
	ZBJfrJLJM4k9hjAAj5AI1fCJ5VrOTOMmySkmnwdDw90txWYg92bzprY0LypydJce7hauk+IeYMeq7
	NkHT4HOla2MKLzbDKKIX7Mk9Yjs+6ugL4JzeQ8E5ehyzQdvRh1eCgTmikNArdYvOxjRIBGkzaS3Xu
	BuNZkuIqkRbS1IteVvMP7xjS+H11OLs6m6CPT9fPU6Yrlfq+Tw7brt/VWdvXCU8dkk8u2s5Fwiz2K
	KKtLAVxQDM0l/0lHcuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEeAe-006r0H-26;
	Sat, 16 Dec 2023 23:34:12 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEeAa-006qz4-0r
	for linux-riscv@lists.infradead.org;
	Sat, 16 Dec 2023 23:34:10 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2cc5ee69960so6359741fa.0
        for <linux-riscv@lists.infradead.org>; Sat, 16 Dec 2023 15:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1702769644; x=1703374444; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFpkZDM6cIT9ckSQvE0/t48hRBP6YwHFDtIgAeFhGig=;
        b=fUTpEBZs1P0SvE9nYz1hnbswOz/GCUkI1IrO84BocK9UPGeTMXUzWCCBbq6Vzz8FqE
         6APlxLuwD8JWKC4XaJqu2lbf2yeBcbbxk75HQCS2hff7g3qWE+8BBk4LJ7AFdXIcyPtS
         k/zzE7OyWgoEMqSKhyE6zZ9qy/E8q2dyxgXJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702769644; x=1703374444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFpkZDM6cIT9ckSQvE0/t48hRBP6YwHFDtIgAeFhGig=;
        b=iWzJh/KHJIk48xSinR3GyzEr8Yqn0rJmoH6Jn1v0ouAVIxTcgEqQLNYZIoLuNOcY4E
         G3N3MHtsb17SqMtxUoY4h3i2x4k7l6erXjYrzjhnrS6b2pyZHR7VJqscZSf6JWphRO7C
         VR4VrdRGS8vMLrEgakD0pzS2uUfG5Em+PS7K4Y3nJHegalYA8Ea2gSN6GNaTb22sPp6S
         5Jg8aQX1i0R3Dm5sQT+D+Lz31DCu5jmR/FcQQRzGJUhtmBN6l483mCIXc95zyxQIyl7Q
         HNMITWHdPvM+goJUar6ZgNrf3q1ZaLaozp5OwW0jieiI3N3QXI7+HHXE9qyehwXM7eKs
         5Fsw==
X-Gm-Message-State: AOJu0YwvLWa7ujt7qS46MW1e4glJnPSpSHgsNXMyJT1QRxnS+rTqrPaz
	VMRhsk5zfDiliNnq56J+4zF+dFoElwV9wD/KbslX
X-Google-Smtp-Source: AGHT+IELyzmmAtyocYVQqJtaMsa3ZKuI8oS362iMMH8aLLh6+kHdK7lVDNZvJliyMwnuxRNTMXAsFt16df/PM1RqBE4=
X-Received: by 2002:a05:651c:c7:b0:2cc:5e72:17ef with SMTP id
 7-20020a05651c00c700b002cc5e7217efmr399673ljr.49.1702769643745; Sat, 16 Dec
 2023 15:34:03 -0800 (PST)
MIME-Version: 1.0
References: <20231205024310.1593100-1-atishp@rivosinc.com> <20231205024310.1593100-6-atishp@rivosinc.com>
 <20231207-unpleased-landlord-8383b4c50aca@wendy>
In-Reply-To: <20231207-unpleased-landlord-8383b4c50aca@wendy>
From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 16 Dec 2023 15:33:52 -0800
Message-ID: <CAOnJCU+x43E4LdNsRspCuS0WRdfejo-B_L+k1zugDftKMJ3yNg@mail.gmail.com>
Subject: Re: [RFC 5/9] RISC-V: Add SBI PMU snapshot definitions
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_153408_479490_A1CB246C 
X-CRM114-Status: GOOD (  18.19  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBEZWMgNywgMjAyMyBhdCA0OjM04oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIERlYyAwNCwgMjAyMyBhdCAwNjo0
MzowNlBNIC0wODAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPiA+IFNCSSBQTVUgU25hcHNob3QgZnVu
Y3Rpb24gb3B0aW1pemVzIHRoZSBudW1iZXIgb2YgdHJhcHMgdG8KPiA+IGhpZ2hlciBwcml2aWxl
Z2UgbW9kZSBieSBsZXZlcmFnaW5nIGEgc2hhcmVkIG1lbW9yeSBiZXR3ZWVuIHRoZSBTL1ZTLW1v
ZGUKPiA+IGFuZCB0aGUgTS9IUyBtb2RlLiBBZGQgdGhlIGRlZmluaXRpb25zIGZvciB0aGF0IGV4
dGVuc2lvbgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3Np
bmMuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCB8IDEwICsr
KysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaAo+ID4gaW5kZXggZjNlZWNhNzlhMDJkLi4yOTgyMWFkZGI5YjcgMTAwNjQ0
Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiBAQCAtMTIyLDYgKzEyMiw3IEBAIGVudW0gc2JpX2V4
dF9wbXVfZmlkIHsKPiA+ICAgICAgIFNCSV9FWFRfUE1VX0NPVU5URVJfU1RPUCwKPiA+ICAgICAg
IFNCSV9FWFRfUE1VX0NPVU5URVJfRldfUkVBRCwKPiA+ICAgICAgIFNCSV9FWFRfUE1VX0NPVU5U
RVJfRldfUkVBRF9ISSwKPiA+ICsgICAgIFNCSV9FWFRfUE1VX1NOQVBTSE9UX1NFVF9TSE1FTSwK
PiA+ICB9Owo+ID4KPiA+ICB1bmlvbiBzYmlfcG11X2N0cl9pbmZvIHsKPiA+IEBAIC0xMzgsNiAr
MTM5LDEzIEBAIHVuaW9uIHNiaV9wbXVfY3RyX2luZm8gewo+ID4gICAgICAgfTsKPiA+ICB9Owo+
ID4KPiA+ICsvKiBEYXRhIHN0cnVjdHVyZSB0byBjb250YWluIHRoZSBwbXUgc25hcHNob3QgZGF0
YSAqLwo+ID4gK3N0cnVjdCByaXNjdl9wbXVfc25hcHNob3RfZGF0YSB7Cj4gPiArICAgICB1aW50
NjRfdCBjdHJfb3ZlcmZsb3dfbWFzazsKPiA+ICsgICAgIHVpbnQ2NF90IGN0cl92YWx1ZXNbNjRd
Owo+ID4gKyAgICAgdWludDY0X3QgcmVzZXJ2ZWRbNDQ3XTsKPiA+ICt9Owo+ID4gKwo+ID4gICNk
ZWZpbmUgUklTQ1ZfUE1VX1JBV19FVkVOVF9NQVNLIEdFTk1BU0tfVUxMKDQ3LCAwKQo+ID4gICNk
ZWZpbmUgUklTQ1ZfUE1VX1JBV19FVkVOVF9JRFggMHgyMDAwMAo+ID4KPiA+IEBAIC0yMzQsOSAr
MjQyLDExIEBAIGVudW0gc2JpX3BtdV9jdHJfdHlwZSB7Cj4gPgo+ID4gIC8qIEZsYWdzIGRlZmlu
ZWQgZm9yIGNvdW50ZXIgc3RhcnQgZnVuY3Rpb24gKi8KPiA+ICAjZGVmaW5lIFNCSV9QTVVfU1RB
UlRfRkxBR19TRVRfSU5JVF9WQUxVRSAoMSA8PCAwKQo+ID4gKyNkZWZpbmUgU0JJX1BNVV9TVEFS
VF9GTEFHX0lOSVRfRlJPTV9TTkFQU0hPVCAoMSA8PCAxKQo+ID4KPiA+ICAvKiBGbGFncyBkZWZp
bmVkIGZvciBjb3VudGVyIHN0b3AgZnVuY3Rpb24gKi8KPiA+ICAjZGVmaW5lIFNCSV9QTVVfU1RP
UF9GTEFHX1JFU0VUICgxIDw8IDApCj4gPiArI2RlZmluZSBTQklfUE1VX1NUT1BfRkxBR19UQUtF
X1NOQVBTSE9UICgxIDw8IDEpCj4KPiBJZiB3ZSBjYW4gdXNlIEdFTk1BU0sgaW4gdGhpcyBmaWxl
LCB3aHkgY2FuIHdlIG5vdCB1c2UgQklUKCk/Cj4KClN1cmUuIERvbmUuIEkgd2lsbCBjaGFuZ2Ug
dGhlIG90aGVyIG9uZXMgaW4gYSBzZXBhcmF0ZSBwYXRjaCBhcyB3ZWxsLgoKPiA+Cj4gPiAgZW51
bSBzYmlfZXh0X2RiY25fZmlkIHsKPiA+ICAgICAgIFNCSV9FWFRfREJDTl9DT05TT0xFX1dSSVRF
ID0gMCwKPiA+IC0tCj4gPiAyLjM0LjEKPiA+CgoKCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
