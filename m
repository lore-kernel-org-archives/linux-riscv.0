Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A041C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 23:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5meelx/cDaZFDQFzxPCbHgk5FmufKhAviC/GJos7M9Q=; b=wrTH+4HP3WslB5
	MbwAyE/NdFE406JPkOmvmHSqsYUyxLBqXHHYcZTeaBpraeqbXZOuUaKVxU0J31Q+BtfJWgNsDgiBU
	+YY8nbX0Sa9TgGO8QNgL2F5fz2DYbyHDBITDUqGAC8NKk6G0W5jF7mq7qdehWluU8NJMpwOd4loCt
	gA4QlUOQJVo2zXKJ7/U4P3zzhk9UMo+uceq12O1KeOjmQh1/whmkJNUfNZph/HLgzE4RMwPWttbQA
	5/xjg+YChCI1SeGrqvGOrz0DWAo1OmnbaN32DciEVwZvMRs49jSxqylx6SPhXZ86peecNvOLWY+Yo
	LUhhV037MryUWb7qgnjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzmRN-00000006PsN-32xm;
	Wed, 24 Apr 2024 23:54:17 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzmRK-00000006Prm-0rkd
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 23:54:15 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2a2d0ca3c92so362390a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 16:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714002853; x=1714607653; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZ/IIGjifE//ZRF1QGgVwJ3N+vqoEfQx7orET2JWBFc=;
        b=VYJtOg49VS5WkgEefiOs8CUtTudgQIn6zf0Ab30+YM5jMkWBgUHSeC0ALhcTkEDyXY
         kfdSFbphUkRMKGhAhgoNS//rwcQimoHwBniba6L0x5pzbj7Palt/hBTjdIvrNzBO4BXF
         TcMbOUl440hCeBTQj9jPQryMX1Mw4aAGMRp8fqbHsg3mIyCpwR9Kpp01C+eWuXZEjQ4/
         AcuQlf7aZxL9dVYpIHY7b/52uSt7PJd/u6p+csIjneH8f/WTjW4ULWPLmOn/e7egof7b
         3e83Uv++AVK4FWWcFXE1JA0eg35PIYnsh9NQezgetJz6jXWehio5Sba7Bvhk/7Ky2KoJ
         njPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714002853; x=1714607653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZ/IIGjifE//ZRF1QGgVwJ3N+vqoEfQx7orET2JWBFc=;
        b=eLBrs2Lsu71U2bAkYtiuG2OSXIxXycAvuKcUwjJtPEJJ2fE5d5NTjbm+oKaONc24Pc
         fNO+8LLDHWxWvOS26G+v9e0T+o0GRQgAcD1dDr/deLUkpKAeMvsg5gQJZRB7ydLEVrnM
         naY0/lB+TJBQEresHePqA4H0J9JCQlaESv/YB3FvRuQxJly6dbq1cE1Yg29FMaZuWSX1
         yVBPqNxiGaWYEHETbQpXJAaH0sdPoy9cWovG8wvcwTNiC/zO77UCKaWMrbVmSS4EJ0tR
         9sdtzg3eyabASqJoJdOuZ9spuW5DbaQr8RSQh+w/7y58kupJKZuqR8zKQMZ8F/LNs4GG
         IsRA==
X-Forwarded-Encrypted: i=1; AJvYcCV4BTRG5BMipPxfVzJc+LvxtD9pBxjUfBapq8gYdel1bGpy+M+NDs4ygRul9aN+8FwXxN+seHywnp5Pg47z9rl8sYRmfBNCwvKdlFEISKur
X-Gm-Message-State: AOJu0YxWPzO2bFTI2OvkN+cjXX9cw3IuGrYL085F9VbmA0gBokFebwP2
	pgTeDkjLAOWteoVu6c53EQ1i3gw7Tx7LyKDxkTRSpBVh6A3qABAMLe5FcRoE0ePydVWQj+9o+xB
	KxTSr96QVDAxLdmiucftQCXJGiOZmoN4s/tHKUg==
X-Google-Smtp-Source: AGHT+IHq+LsaEnAL7Mdjn1xb6w6n3S2VmVpQLZlVCCmzLh5lL0i3FHCQL7yRbJf8NEGN1I0YseFNCqLz+9LRbBTztNQ=
X-Received: by 2002:a17:90a:b104:b0:2aa:b377:d29e with SMTP id
 z4-20020a17090ab10400b002aab377d29emr1768305pjq.3.1714002852883; Wed, 24 Apr
 2024 16:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1713456597.git.tjeznach@rivosinc.com> <301244bc3ff5da484b46d3fecc931cdad7d2806f.1713456598.git.tjeznach@rivosinc.com>
 <20240419125627.GD223006@ziepe.ca> <CAH2o1u5+XD9YN=gdMVtfkyhKoKha0UpwKgOVbCAwOQa+saPfRw@mail.gmail.com>
 <20240424233950.GJ231144@ziepe.ca>
In-Reply-To: <20240424233950.GJ231144@ziepe.ca>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Wed, 24 Apr 2024 16:54:01 -0700
Message-ID: <CAH2o1u4eZ-mRO7hiJzA-pwYDOo0+3vObpBZT3_MXW=zC9mXRbA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] iommu/riscv: Paging domain support
To: Jason Gunthorpe <jgg@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_165414_383704_BA3F1DE0 
X-CRM114-Status: GOOD (  28.54  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBcHIgMjQsIDIwMjQgYXQgNDozOeKAr1BNIEphc29uIEd1bnRob3JwZSA8amdnQHpp
ZXBlLmNhPiB3cm90ZToKPgo+IE9uIFdlZCwgQXByIDI0LCAyMDI0IGF0IDA0OjMwOjQ1UE0gLTA3
MDAsIFRvbWFzeiBKZXpuYWNoIHdyb3RlOgo+ID4gPiA+IEBAIC00Niw2ICs0NiwxMCBAQCBNT0RV
TEVfTElDRU5TRSgiR1BMIik7Cj4gPiA+ID4gICNkZWZpbmUgZGV2X3RvX2lvbW11KGRldikgXAo+
ID4gPiA+ICAgICAgIGNvbnRhaW5lcl9vZigoZGV2KS0+aW9tbXUtPmlvbW11X2Rldiwgc3RydWN0
IHJpc2N2X2lvbW11X2RldmljZSwgaW9tbXUpCj4gPiA+ID4KPiA+ID4gPiArLyogSU9NTVUgUFND
SUQgYWxsb2NhdGlvbiBuYW1lc3BhY2UuICovCj4gPiA+ID4gK3N0YXRpYyBERUZJTkVfSURBKHJp
c2N2X2lvbW11X3BzY2lkcyk7Cj4gPiA+ID4gKyNkZWZpbmUgUklTQ1ZfSU9NTVVfTUFYX1BTQ0lE
ICAgICAgICAgICAgICAgIEJJVCgyMCkKPiA+ID4gPiArCj4gPiA+Cj4gPiA+IFlvdSBtYXkgY29u
c2lkZXIgcHV0dGluZyB0aGlzIElEQSBpbiB0aGUgcmlzY3ZfaW9tbXVfZGV2aWNlKCkgYW5kIG1v
dmUKPiA+ID4gdGhlIHBzY2lkIGZyb20gdGhlIGRvbWFpbiB0byB0aGUgYm9uZD8KPiA+ID4KPiA+
Cj4gPiBJJ3ZlIGJlZW4gY29uc2lkZXJpbmcgY29udGFpbmluZyBJREEgaW5zaWRlIHJpc2N2X2lv
bW11X2RldmljZSBhdCBzb21lCj4gPiBwb2ludCwgIGJ1dCBpdCBtYWRlIFBDU0lEIG1hbmFnZW1l
bnQgbW9yZSBjb21wbGljYXRlZC4gIEluIHRoZSBmb2xsb3cKPiA+IHVwIHBhdGNoZXMgaXQgaXMg
ZGVzaXJlZCBmb3IgUFNDSUQgdG8gYmUgdW5pcXVlIGFjcm9zcyBhbGwgSU9NTVVzIGluCj4gPiB0
aGUgc3lzdGVtICh3aXRoaW4gZ3Vlc3QncyBHU0NJRCksIGFzIHRoZSBwcm90ZWN0aW9uIGRvbWFp
bnMgbWlnaHQKPiA+IChhbmQgd2lsbCkgYmUgc2hhcmVkIGJldHdlZW4gbW9yZSB0aGFuIHNpbmds
ZSBJT01NVSBkZXZpY2UuCj4KPiBUaGUgUENTSUQgaXNuJ3Qgc2NvcGVkIHVuZGVyIHRoZSBHU0NJ
RD8gVGhhdCBkb2Vzbid0IHNvdW5kIHZlcnkgZ29vZCwKPiBpdCBtZWFucyBWTSdzIGNhbid0IGRp
cmVjdCBpc3N1ZSBpbnZhbGlkYXRpb24gd2l0aCB0aGVpciBsb2NhbCB2aWV3IG9mCj4gdGhlIFBD
U0lEIHNwYWNlPwo+CgpUbyBjbGFyaWZ5OiBQU0NJRCBuYW1lc3BhY2UgaXMgcGVyIEdTQ0lELgpI
b3dldmVyIHRoZXJlIG1pZ2h0IGJlIG1vcmUgdGhhbiBvbmUgSU9NTVUgaW4gYSBzaW5nbGUgc3lz
dGVtIHNoYXJpbmcKdGhlIHNhbWUgR1NDSUQsIGFuZCB3aXRoIGUuZy4gU1ZBIGRvbWFpbnMgYXR0
YWNoZWQgdG8gbW9yZSB0aGFuIG9uZQpJT01NVS4gSXQgd2FzIHNpbXBsZXIgdG8gbWFuYWdlIFBD
U0lEIGdsb2JhbGx5LgoKUFNDSUQgbWFuYWdlbWVudCBmb3IgdGhlIFZNIGFzc2lnbmVkIEdTQ0lE
IHdpbGwgYmUgdGhlIFZNJ3MgcmVzcG9uc2liaWxpdHkuCgo+ID4gPiBUaGlzIHNlZW1zIHN1Ym9w
dGltYWwsIHlvdSBwcm9iYWJseSB3YW50IHRvIGNvcHkgdGhlIG5ldyBkZXNpZ24gdGhhdAo+ID4g
PiBJbnRlbCBpcyBkb2luZyB3aGVyZSB5b3UgYWxsb2NhdGUgImJvbmRzIiB0aGF0IGFyZSBhbHJl
YWR5Cj4gPiA+IGRlLWR1cGxpY2F0ZWQuIEllIGlmIEkgaGF2ZSAxMCBkZXZpY2VzIG9uIHRoZSBz
YW1lIGlvbW11IHNoYXJpbmcgdGhlCj4gPiA+IGRvbWFpbiB0aGUgYWJvdmUgd2lsbCBpbnZhbGlk
YXRlIHRoZSBQU0NJRCAxMCB0aW1lcy4gSXQgc2hvdWxkIG9ubHkgYmUKPiA+ID4gZG9uZSBvbmNl
Lgo+ID4gPgo+ID4gPiBpZSBhZGQgYSAiYm9uZCIgZm9yIHRoZSAoaW9tbXUscHNjaWQpIGFuZCBy
ZWZjb3VudCB0aGF0IGJhc2VkIG9uIGhvdwo+ID4gPiBtYW55IGRldmljZXMgYXJlIHVzZWQuIFRo
ZW4gYW5vdGhlciAiYm9uZCIgZm9yIHRoZSBBVFMgc3R1ZmYgZXZlbnR1YWxseS4KPiA+ID4KPiA+
Cj4gPiBBZ3JlZSwgbm90IHBlcmZlY3QgdG8gc2VuZCBkdXBsaWNhdGUgaW52YWxpZGF0aW9ucy4K
PiA+IFRoaXMgc2hvdWxkIGltcHJvdmUgd2l0aCBmb2xsb3cgdXAgcGF0Y2hzZXRzIGludHJvZHVj
aW5nIG9mIFNWQQo+ID4gKHJldXNpbmcgdGhlIHNhbWUsIGV4dGVuZGVkIGJvbmQgc3RydWN0dXJl
KSBhbmQgdXBkYXRlIHRvIHNlbmQgSU9UTEIKPiA+IHJhbmdlIGludmFsaWRhdGlvbnMuCj4gPgo+
ID4gRm9yIHRoaXMgY2hhbmdlIEkndmUgZGVjaWRlZCB0byBnbyB3aXRoIGFzIHNpbXBsZSBhcyBw
b3NzaWJsZQo+ID4gaW1wbGVtZW50YXRpb24gYW5kIG92ZXItaW52YWxpZGF0ZSBmb3IgZG9tYWlu
cyB3aXRoIG11bHRpcGxlIGRldmljZXMKPiA+IGF0dGFjaGVkLiBIb3BlIHRoaXMgbWFrZXMgc2Vu
c2UuCj4KPiBJdCBpcyBmaW5lIGFzIGxvbmcgYXMgeW91IGRvIGZpeCBpdC4uCj4KClNHLiBJJ2xs
IGhhdmUgYSBzZWNvbmQgbG9vayBpZiBpdCBjYW4gYmUgZml4ZWQgc29vbmVyLgoKPiBKYXNvbgoK
QmVzdCwKLSBUb21hc3oKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
