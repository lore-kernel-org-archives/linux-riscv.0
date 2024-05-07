Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C8CC25B5C
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 02:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRHviacfSPazYVJdOI/qpn+aCus2QiqO0rl535NOgXM=; b=gNdvxU9E57RJ9O
	0UXyPbZv75Nbj6XjASvokA1MRnmfAVPH6JY9Sl/lzusEAl1o63YiGhy2K4fSAVjTYAqgAJ/8Nzxiq
	NAB5uISiMB6CMOSqiaQzodZpn7Zst624gPFMMHmK6rgJ/UbBgg+8dAqzG4jhRBUx0NMf7h6sMzoWU
	385KAvG44/f7h76o5SLctQZKofOvtweL6fFJd1ohlcJgsX3+1RyEJYEpBFiosMSGjqm/m33ukY/IN
	CnZK52zUn4EeULAm+LjNIhoc29mnBxL9zpEVbwExsyYWx6qYiHcmiK5hH5FaadtIgEAnll0OkiyuU
	wSVzMlt8Lpr9gpbW7jww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ATS-00000009Lmg-2SPN;
	Tue, 07 May 2024 02:22:34 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ATP-00000009Ljr-0GKc
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 02:22:32 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5e8470c1cb7so1744377a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 May 2024 19:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715048539; x=1715653339; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VG77bwpMyBsulolMGNrr0vukCDyTTCfbCNIB+dj0SFI=;
        b=XmTfWtBqWL11BwHpo+3HZPKGuhxBJude0FLwDec73L3qfmd3PoINgH3R+bOfJFY100
         rK0BVex5l2HKN7+XIE2BUKOj2955KCGavL37fBqVO/COUAcRWcO3WECnGYnpAD9mjI4y
         n+3nr6iIoEzQsqcE8XjZFQl+3BQnq+/4VLF471NFmdffSbrrTB0a2PFiP4PUVTvj6y09
         /43hglchde0oQ36cjAoWP5tL2rzHIXZbz6nq3d89PrgffrPCxFAfiKqRAfRnphDL7vqH
         mTuX0X+5vdVDCu8g1OTcD70CR0Yv5EIA1vkOxrDuX9n6Oqv0r24vRuNOeIM2HidNJjCi
         UjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715048539; x=1715653339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VG77bwpMyBsulolMGNrr0vukCDyTTCfbCNIB+dj0SFI=;
        b=WJM8u2Ng5ReS0qZtFnbiq5kIotbtCKWghxxVo7+nc/MzXdBIXbAW9A+oF4z8OZXL7D
         TG1B+vMnv8fSgYNmcYZzErRTEGI07dOniP7Gx+8dUb/AU28lct75O2ImhPAhCA9vP8LE
         Ye7JdewvsjS4MMkRazPACL+NmzzCVb/Vearc5O8ojjK+kYwer9T6ZYO6r/WGT98McC1Y
         xzQus0ELX/dwsVzs71s4wC74oo4GJAt5X2wfU1uqRwzDxucxsuq0JYYY9MeHjnW6A6Lo
         3qz74RicQPi7kZuO48x3k5Ja0HDJMXycPOSZiqI/ua8EBervunNQS/l0D/twl9syw+0t
         pxLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDeIxO8C9GWye31oMjDoehSAB9bZ/yeh9R6tsIsozvxYtVOW4Ho1nuQwW2PsKIo0Deooj6f23qFD2LinfDOZrXVm+lUCMvYdM9kMJFU3dT
X-Gm-Message-State: AOJu0Yy7P1H+cJ4JJGpBwBFXmEl+f5EIiuMfL79OXEpMLQ5iLiN9brVa
	e1Eu9kA2HTfcyfsBTk+H2O2V5S4+vEoOusCGY4tfuGvRrBkfgv6RsD3lpAR2SAL+CzcQOtuCR6s
	yRJeD9cgQLwxxEquE+5L8TNdui+8qmU5Ciwjfpw==
X-Google-Smtp-Source: AGHT+IHsPu5AukXt1ZMu1k2ndGF0WSfcu6sZVkQkurxCeE8wBMbBgaMnamrYyYvJgB7dN4Uob8QSF+mqBfHri0qP9E4=
X-Received: by 2002:a17:90b:34d:b0:2ae:d03b:9594 with SMTP id
 fh13-20020a17090b034d00b002aed03b9594mr9528356pjb.39.1715048539100; Mon, 06
 May 2024 19:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1714494653.git.tjeznach@rivosinc.com> <b83f81c04d1f3885d860b1eec03761fe63a33183.1714494653.git.tjeznach@rivosinc.com>
 <20240501145621.GD1723318@ziepe.ca> <CAH2o1u63GjMnYrfa8W-c1hdp+TAA0R-FyxXM4dEiFF+KEGWwbA@mail.gmail.com>
 <20240503181059.GC901876@ziepe.ca> <CAH2o1u7av8zMucB2sKxBOZtd1eqEC4Qmgin=8VQ03pWbQdZUUg@mail.gmail.com>
 <20240505154639.GD901876@ziepe.ca>
In-Reply-To: <20240505154639.GD901876@ziepe.ca>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Mon, 6 May 2024 19:22:07 -0700
Message-ID: <CAH2o1u6g87nt=S7id-O43PubR=GaOLj-vmk7+OdTiY=Kw1BU5A@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] iommu/riscv: Paging domain support
To: Jason Gunthorpe <jgg@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_192231_130848_67C53EF0 
X-CRM114-Status: GOOD (  34.49  )
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

T24gU3VuLCBNYXkgNSwgMjAyNCBhdCA4OjQ24oCvQU0gSmFzb24gR3VudGhvcnBlIDxqZ2dAemll
cGUuY2E+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXkgMDMsIDIwMjQgYXQgMTI6NDQ6MDlQTSAtMDcw
MCwgVG9tYXN6IEplem5hY2ggd3JvdGU6Cj4gPiA+IEZvciBkZXRhY2ggSSB0aGluayB5ZXM6Cj4g
PiA+Cj4gPiA+ICAgIEludiBDUFUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERl
dGFjaCBDUFUKPiA+ID4KPiA+ID4gICB3cml0ZSBpb19wdGUgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgVXBkYXRlIGRldmljZSBkZXNjcmlwdG9yCj4gPiA+ICAgcmN1X3JlYWRfbG9jawo+
ID4gPiAgICAgbGlzdF9mb3JfZWFjaAo+ID4gPiAgICAgICA8bWFrZSBpbnZhbGlkYXRpb24gY29t
bWFuZD4gICAgICAgICAgICA8bWFrZSBkZXNjcmlwdGlvbiBpbnYgY21kPgo+ID4gPiAgICAgICBk
bWFfd21iKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkbWFfd21iKCkKPiA+ID4gICAg
ICAgPGRvb3JiZWxsPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGNtZCBkb29yYmVsbD4K
PiA+ID4gICByY3VfcmVhZF91bmxvY2sKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbGlzdF9kZWxfcmN1KCkKPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPHdpcGUgQVNJRD4KPiA+ID4KPiA+ID4gSW4gdGhp
cyBjYXNlIEkgdGhpbmsgd2UgbmV2ZXIgbWlzcyBhbiBpbnZhbGlkYXRpb24sIHRoZSBsaXN0X2Rl
bCBpcwo+ID4gPiBhbHdheXMgYWZ0ZXIgdGhlIEhXIGhhcyBiZWVuIGZ1bGx5IGZlbmNlZCwgc28g
SSBkb24ndCB0aGluayB3ZSBjYW4KPiA+ID4gaGF2ZSBhbnkgaXNzdWUuIE1heWJlIGEgc3Vwcmlv
dXMgaW52YWxpZGF0aW9uIGlmIHRoZSBBU0lEIGdldHMKPiA+ID4gcmUtdXNlZCwgYnV0IHdobyBj
YXJlcy4KPiA+ID4KPiA+ID4gQXR0YWNoIGlzIGRpZmZlcmVudC4uCj4gPiA+Cj4gPiA+ICAgIElu
diBDUFUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEF0dGFjaCBDUFUKPiA+ID4K
PiA+ID4gICB3cml0ZSBpb19wdGUKPiA+ID4gICByY3VfcmVhZF9sb2NrCj4gPiA+ICAgICBsaXN0
X2Zvcl9lYWNoIC8vIGVtcHR5Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxpc3RfYWRkX3JjdSgpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFVwZGF0ZSBkZXZpY2UgZGVzY3JpcHRvcgo+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bWFrZSBkZXNjcmlwdGlv
biBpbnYgY21kPgo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBkbWFfd21iKCkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPGNtZCBkb29yYmVsbD4KPiA+ID4gICByY3VfcmVhZF91bmxvY2sKPiA+ID4KPiA+
ID4gQXMgYWJvdmUgc2hvd3Mgd2UgY2FuICJtaXNzIiBhbiBpbnZhbGlkYXRpb24uIFRoZSBpc3N1
ZSBpcyBuYXJyb3csIHRoZQo+ID4gPiBpb19wdGUgY291bGQgc3RpbGwgYmUgc2l0dGluZyBpbiB3
cml0ZSBidWZmZXJzIGluICJJbnYgQ1BVIiBhbmQgbm90Cj4gPiA+IHlldCBnbG9iYWxseSB2aXNp
YWJsZS4gIkF0dGFjaCBDUFUiIGNvdWxkIGdldCB0aGUgZGV2aWNlIGRlc2NyaXB0b3IKPiA+ID4g
aW5zdGFsbGVkIGluIHRoZSBJT01NVSBhbmQgdGhlIElPTU1VIGNvdWxkIHdhbGsgYW4gaW9fcHRl
IHRoYXQgaXMgaW4KPiA+ID4gdGhlIG9sZCBzdGF0ZS4gRWZmZWN0aXZlbHkgdGhpcyBpcyBiZWNh
dXNlIHRoZXJlIGlzIG5vIHJlbGVhc2UvYWNxdWlyZQo+ID4gPiBiYXJyaWVyIHBhc3NpbmcgdGhl
IGlvX3B0ZSBzdG9yZSBmcm9tIHRoZSBJbnYgQ1BVIHRvIHRoZSBBdHRhY2ggQ1BVIHRvIHRoZQo+
ID4gPiBJT01NVS4KPiA+ID4KPiA+ID4gSXQgc2VlbXMgbGlrZSBpdCBzaG91bGQgYmUgc29sdmFi
bGUgc29tZWhvdzoKPiA+ID4gIDEpIEludiBDUFUgcmVsZWFzZXMgYWxsIHRoZSBpbyBwdGVzCj4g
PiA+ICAyKSBBdHRhY2ggQ1BVIGFjcXVpcmVzIHRoZSBpbyBwdGVzIGJlZm9yZSB1cGRhdGluZyB0
aGUgRERUCj4gPiA+ICAzKSBJbnYgQ1BVIGFjcXVpcmVzIHRoZSBSQ1UgbGlzdCBpbiBzdWNoIGEg
d2F5IHRoYXQgZWl0aGVyIGF0dGFjaAo+ID4gPiAgICAgQ1BVIHdpbGwgYWNxdWlyZSB0aGUgaW9f
cHRlIG9yIGludiBDUFUgd2lsbCBhY3F1aXJlIHRoZSBSQ1UgbGlzdC4KPiA+ID4gIDQpIEVpdGhl
ciBpbnZhbGlkYXRpb24gd29ya3Mgb3Igd2UgcmVsZWFzZSB0aGUgbmV3IGlvcHRlIHRvIHRoZSBT
TU1VCj4gPiA+ICAgICBhbmQgZG9uJ3QgbmVlZCBpdC4KPiA+ID4KPiA+ID4gQnV0ICMzIGlzIGEg
cmVhbGx5IHdlaXJkIHN0YXRlbWVudC4gc21iX21iKCkgb24gYm90aCBzaWRlcyBtYXkgZG8gdGhl
Cj4gPiA+IGpvYj8/Cj4gPiA+Cj4gPgo+ID4gQWN0dWFsIGF0dGFjaCBzZXF1ZW5jZSBpcyBzbGln
aHRseSBkaWZmZXJlbnQuCj4gPgo+ID4gIEludiBDUFUgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgQXR0YWNoIENQVQo+ID4KPiA+ICB3cml0ZSBpb19wdGUKPiA+ICAgcmN1X3JlYWRfbG9jawo+
ID4gICAgIGxpc3RfZm9yX2VhY2ggLy8gZW1wdHkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxpc3RfYWRkX3JjdSgpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBJT1RMQi5JTlZBTChQU0NJRCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDxtYWtlIGRlc2NyaXB0aW9uIGludiBjbWQ+Cj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBkbWFfd21iKCkKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDxjbWQgZG9vcmJlbGw+Cj4gPiAgcmN1X3JlYWRfdW5sb2NrCj4gPgo+
ID4gSSd2ZSB0cmllZCB0byBjb3ZlciB0aGlzIGNhc2Ugd2l0aCByaXNjdl9pb21tdV9pb3RsYl9p
bnZhbCgpIGNhbGxlZAo+ID4gYmVmb3JlIHRoZSBhdHRhY2hlZCBkb21haW4gaXMgdmlzaWJsZSB0
byB0aGUgZGV2aWNlLgo+Cj4gVGhhdCBpbnZhbGlkYXRpb24gc2hvdWxkbid0IGRvIGFueXRoaW5n
LiBJZiB0aGlzIGlzIHRoZSBmaXJzdCBhdHRhY2gKPiBvZiBhIFBTQ0lEIHRoZW4gdGhlIFBTQ0lE
IGhhZCBiZXR0ZXIgYWxyZWFkeSBiZSBlbXB0eSwgaXQgd29uJ3QgYmVjb21lCj4gbm9uLWVtcHR5
IHVudGlsIHRoZSBERFQgZW50cnkgaXMgaW5zdGFsbGVkLgo+Cj4gQW5kIGlmIGl0IGlzIHRoZSBz
ZWNvbmQgYXR0YWNoIHRoZW4gdGhlIEludiBDUFUgaXMgYWxyZWFkeSB0YWtpbmcgY2FyZQo+IG9m
IHRoaW5ncywgbm8gbmVlZCB0byBpbnZhbGlkYXRlIGF0IGFsbC4KPgo+IFJlZ2FyZGxlc3MsIHRo
ZXJlIGlzIHN0aWxsIGEgdGhlb3J0aWNhbCByYWNlIHRoYXQgdGhlIElPUFRFcyBoYXZlbid0Cj4g
YmVlbiBtYWRlIHZpc2libGUgeWV0IGJlY2F1c2UgdGhlcmUgaXMgc3RpbGwgbm8gc3luY2hyb25p
emF0aW9uIHdpdGgKPiB0aGUgQ1BVIHdyaXRpbmcgdGhlbS4KPgo+IFNvLCBJIGRvbid0IHRoaW5r
IHRoaXMgc29sdmVzIGFueSBwcm9ibGVtLiBJIGJlbGl2ZSB5b3UgbmVlZCB0aGUKPiBhcHByb3By
aWF0ZSBraW5kIG9mIENQVSBiYXJyaWVyIGhlcmUgaW5zdGVhZCBvZiBhbiBpbnZhbGlkYXRpb24u
Cj4KClllcy4gVGhlcmUgd2FzIGEgc21hbGwsIGJ1dCBzdGlsbCBwbGF1c2libGUgcmFjZSB3LyBJ
T1BURXMgdmlzaWJpbGl0eQp0byB0aGUgSU9NTVUuCkZvciB2NSBJJ20gYWRkaW5nIHR3byBiYXJy
aWVycyB0byB0aGUgaW52YWwvZGV0YWNoIGZsb3csIEkgYmVsaWV2ZQpzaG91bGQgY292ZXIgaXQu
CgoxKSBJbiByaXNjdl9pb21tdV9pb3RsYl9pbnZhbCgpIHVuY29uZGl0aW9uYWwgZG1hX3dtYigp
IHRvIG1ha2UgYW55CnBlbmRpbmcgd3JpdGVzIHRvIFBURXMgdmlzaWJsZSB0byB0aGUgSU9NTVUg
ZGV2aWNlLiBUaGlzIHNob3VsZCBjb3Zlcgp0aGUgY2FzZSB3aGVuIGxpc3RfYWRkX3JjdSgpIHVw
ZGF0ZSBpcyBub3QgeWV0IHZpc2libGUgaW4gdGhlCl9pb3RsYl9pbnZhbCgpIHNlcXVlbmNlLCBm
b3IgdGhlIGZpcnN0IHRpbWUgdGhlIGRvbWFpbiBpcyBhdHRhY2hlZCB0bwp0aGUgSU9NTVUuCgog
IEludiBDUFUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBdHRhY2ggQ1BVCiAg
d3JpdGUgaW9fcHRlCiAgZG1hX3dtYiAoMSkKICByY3VfcmVhZF9sb2NrCiAgICBsaXN0X2Zvcl9l
YWNoIC8vIGVtcHR5ICAgICAgICAgICAgICAgICAgIGxpc3RfYWRkX3JjdSgpCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNtcF93bWIgKDIpCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFVwZGF0ZSBkZXZpY2UgZGVzY3JpcHRv
cgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bWFrZSBkZXNj
cmlwdGlvbiBpbnYgY21kPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAvLyBQVEVzIGFyZSB2aXNpYmxlIHRvIHRoZSBIVyAoKjEpCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRtYV93bWIoKQogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA8Y21kIGRvb3JiZWxsPgogIHJjdV9yZWFkX3VubG9j
awoKMikgSW4gcmlzY3ZfaW9tbXVfYm9uZF9saW5rKCkgd3JpdGUgbWVtb3J5IGJhcnJpZXIgdG8g
ZW5zdXJlIGxpc3QKdXBkYXRlIGlzIHZpc2libGUgYmVmb3JlIElPTU1VIGRlc2NyaXB0b3IgdXBk
YXRlLiBJZiBzdGFsZSBkYXRhIGhhcwpiZWVuIGZldGNoZWQgYnkgdGhlIEhXLCBpbnZhbCBDUFUg
d2lsbCBydW4gaW90bGItaW52YWxpZGF0aW9uCnNlcXVlbmNlLiBUaGVyZSBpcyBhIHBvc3NpYmls
aXR5IHRoYXQgSU9NTVUgd2lsbCBmZXRjaCBjb3JyZWN0IFBURXMKYW5kIHdpbGwgcmVjZWl2ZSB1
bm5lY2Vzc2FyeSBJT1RMQiBpbnZhbCwgYnV0IEkgZG9uJ3QgdGhpbmsgYW55b25lCndvdWxkIGNh
cmUuCgogIEludiBDUFUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBdHRhY2gg
Q1BVCiAgd3JpdGUgaW9fcHRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpc3RfYWRk
X3JjdSgpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNtcF93
bWIgKDIpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFVwZGF0
ZSBkZXZpY2UgZGVzY3JpcHRvcgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8bWFrZSBkZXNjcmlwdGlvbiBpbnYgY21kPgogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAvLyBIVyBtaWdodCBmZXRjaCBzdGFsZSBQVEVzCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRtYV93bWIoKQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8Y21kIGRvb3JiZWxsPgogIGRt
YV93bWIgKDEpCiAgcmN1X3JlYWRfbG9jawogICAgbGlzdF9mb3JfZWFjaCAvLyBub24tZW1wdHkg
KCoyKQogICAgICA8bWFrZSBpb3RsYiBpbnZhbCBjbWQ+CiAgICAgIGRtYV93bWIoKQogICAgICA8
Y21kIGRvb3JiZWxsPgogIHJjdV9yZWFkX3VubG9jawoKMykgSSd2ZSBhbHNvIHVwZGF0ZWQgcmlz
Y3ZfaW9tbXVfYm9uZF91bmxpbmsoKSB0byB3aXBlIHRoZSBQU0NJRCBjYWNoZQpvbiB0aGUgbGFz
dCBkb21haW4gdW5saW5rIGZyb20gdGhlIElPTU1VLgoKVGhhbmsgeW91IGZvciBwb2ludGluZyB0
aGlzIG91dC4gTGV0IG1lIGtub3cgaWYgdGhhdCBtYWtlcyBzZW5zZS4KCkJlc3QsCi0gVG9tYXN6
Cgo+IEphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
