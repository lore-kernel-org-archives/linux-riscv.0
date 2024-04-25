Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82512C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 00:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KlMTjpaOqxADbUerFphhW0P8tAie8qUwnBPpn/5G6ic=; b=kucvzwcCksgPd8
	9Y1szW66XrwLKPnexzDraRUkgUM5yNVZQPHMtQ/s7KY5KFcjNMw6lqzO81W0PyJ3LrRj5qf/eaMI+
	TATiw5nLy5EfLYe7SK9+YoqJgn9eXSpzSCS11m+VxneW3GrllYqtPakvNGwyYfdQs9Cgu4bEmtE3K
	NBt4VZLIQU5Iq5+HpddIk1HAgy/DBJo7y28LOivvoDGzuSHBfABHp1dfJ3shYI9quSU8Ag2OypfQc
	3yGh7Q+pOxBktWGe2exfVf5IK+3k8PivSNK6BXUP06jR1/G7UYec+AbXKszwwOFwGB1UVYdOVZYmu
	LZ8J0GWzz+Y7duW2LB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rznHa-00000006Wa9-1hvO;
	Thu, 25 Apr 2024 00:48:14 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rznHW-00000006WZC-1oxK
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 00:48:12 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-234db9dde9bso269671fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 17:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1714006086; x=1714610886; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vuFHLVEWRvr8nT3POIEE+NeoEX4x7+oc0ycZrONvMnY=;
        b=ZHlwgzFn27555PFHAwiVK7RSC2pWZd+KIB4ldKrrLZMbgn8oJvP6cBP0I73YxBLFxZ
         HZgH2ZdvLNe4dJmiLNTHANSP5T4E/SoHSKTTcp9iwRqTHAV7UDYrK2PFr5GPbfc1cm94
         odwg19UkkBdyKaatRQNZ0cbWkDk9ImffM16n2EHu5BIviX5Yc9TcPbklzE7n92uIbpHR
         BuwkjfjaVQoMMlQYcOGQlB5t1mzjFaq9oqxi2/ng5hWWN2ecUOHh6l3Efp606ItwcgL+
         nLc7gntuQKwqIQ8tANVNE+4RJFC1p2bT6w/wZxihaj0g7/SB6ZYtjosi7owGuUlCrQFF
         Zbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714006086; x=1714610886;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vuFHLVEWRvr8nT3POIEE+NeoEX4x7+oc0ycZrONvMnY=;
        b=iE7T0gYTLIZUUCjf/5CCf4RrBQDCME6Qh86LjFa+S2Z/ryjbzi5JVrMz++gQYtUByr
         zn0IHFJLoKFeczuturmVf8a8f/JL7jh9kXWuUt7oQvce38+mKAMyiNXnt0+7zfERjy0o
         17LWkfRhte7JiVOvKU96qQ8Lp4TYaQ0c90o8Oi/PKxh0PYIDaRcDWhLj89+q0AMCTwEe
         39h0CoQ+KU9znL5VKr6ucRbNLGDmXTJdipGix9SBFhMbNzFSE7bPSKPRQs+b2231PZbK
         bAHTdIGG7kExWys1Whe5/QfEsGXVTn80UU760riDeGXid/+dSTn++Fb1mwdghcbxE1IA
         n5Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWm0/xtKULpa+qAoiTLoLcIL+eVgkKklwS1zCkC9EWuf7zaldxseurItlLOsRdTJkCyNgPl8VdJunhDRuqxqtl5+3XgsX8l1WRniQ5qgGM3
X-Gm-Message-State: AOJu0YxLQIthKtsNuT8XX9UZMi6ZkVQUdWvlGI+P1copCbxKz3Hg+FlK
	wX1Ueu0NmJso+TJTkPMlHddQ/0hYp/b23TC2xlv+SWDCpiyMCqBskvE30vnMnWM=
X-Google-Smtp-Source: AGHT+IEPuZwS/Tkiq24z8ESvoiDOcfXfHtKEsJScRX3bkfnzRD6SNCxN7/xPfUqfYppgfpYVzUwNDQ==
X-Received: by 2002:a05:6870:b527:b0:22e:9792:97ed with SMTP id v39-20020a056870b52700b0022e979297edmr5451364oap.38.1714006085784;
        Wed, 24 Apr 2024 17:48:05 -0700 (PDT)
Received: from ziepe.ca ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id xi9-20020a0568704f0900b002392041da7dsm2726725oab.48.2024.04.24.17.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 17:48:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rznHP-00AEjV-Rj;
	Wed, 24 Apr 2024 21:48:03 -0300
Date: Wed, 24 Apr 2024 21:48:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v2 7/7] iommu/riscv: Paging domain support
Message-ID: <20240425004803.GK231144@ziepe.ca>
References: <cover.1713456597.git.tjeznach@rivosinc.com>
 <301244bc3ff5da484b46d3fecc931cdad7d2806f.1713456598.git.tjeznach@rivosinc.com>
 <20240419125627.GD223006@ziepe.ca>
 <CAH2o1u5+XD9YN=gdMVtfkyhKoKha0UpwKgOVbCAwOQa+saPfRw@mail.gmail.com>
 <20240424233950.GJ231144@ziepe.ca>
 <CAH2o1u4eZ-mRO7hiJzA-pwYDOo0+3vObpBZT3_MXW=zC9mXRbA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH2o1u4eZ-mRO7hiJzA-pwYDOo0+3vObpBZT3_MXW=zC9mXRbA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_174810_598141_164D2777 
X-CRM114-Status: GOOD (  21.10  )
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

T24gV2VkLCBBcHIgMjQsIDIwMjQgYXQgMDQ6NTQ6MDFQTSAtMDcwMCwgVG9tYXN6IEplem5hY2gg
d3JvdGU6Cj4gT24gV2VkLCBBcHIgMjQsIDIwMjQgYXQgNDozOeKAr1BNIEphc29uIEd1bnRob3Jw
ZSA8amdnQHppZXBlLmNhPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIEFwciAyNCwgMjAyNCBhdCAw
NDozMDo0NVBNIC0wNzAwLCBUb21hc3ogSmV6bmFjaCB3cm90ZToKPiA+ID4gPiA+IEBAIC00Niw2
ICs0NiwxMCBAQCBNT0RVTEVfTElDRU5TRSgiR1BMIik7Cj4gPiA+ID4gPiAgI2RlZmluZSBkZXZf
dG9faW9tbXUoZGV2KSBcCj4gPiA+ID4gPiAgICAgICBjb250YWluZXJfb2YoKGRldiktPmlvbW11
LT5pb21tdV9kZXYsIHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UsIGlvbW11KQo+ID4gPiA+ID4K
PiA+ID4gPiA+ICsvKiBJT01NVSBQU0NJRCBhbGxvY2F0aW9uIG5hbWVzcGFjZS4gKi8KPiA+ID4g
PiA+ICtzdGF0aWMgREVGSU5FX0lEQShyaXNjdl9pb21tdV9wc2NpZHMpOwo+ID4gPiA+ID4gKyNk
ZWZpbmUgUklTQ1ZfSU9NTVVfTUFYX1BTQ0lEICAgICAgICAgICAgICAgIEJJVCgyMCkKPiA+ID4g
PiA+ICsKPiA+ID4gPgo+ID4gPiA+IFlvdSBtYXkgY29uc2lkZXIgcHV0dGluZyB0aGlzIElEQSBp
biB0aGUgcmlzY3ZfaW9tbXVfZGV2aWNlKCkgYW5kIG1vdmUKPiA+ID4gPiB0aGUgcHNjaWQgZnJv
bSB0aGUgZG9tYWluIHRvIHRoZSBib25kPwo+ID4gPiA+Cj4gPiA+Cj4gPiA+IEkndmUgYmVlbiBj
b25zaWRlcmluZyBjb250YWluaW5nIElEQSBpbnNpZGUgcmlzY3ZfaW9tbXVfZGV2aWNlIGF0IHNv
bWUKPiA+ID4gcG9pbnQsICBidXQgaXQgbWFkZSBQQ1NJRCBtYW5hZ2VtZW50IG1vcmUgY29tcGxp
Y2F0ZWQuICBJbiB0aGUgZm9sbG93Cj4gPiA+IHVwIHBhdGNoZXMgaXQgaXMgZGVzaXJlZCBmb3Ig
UFNDSUQgdG8gYmUgdW5pcXVlIGFjcm9zcyBhbGwgSU9NTVVzIGluCj4gPiA+IHRoZSBzeXN0ZW0g
KHdpdGhpbiBndWVzdCdzIEdTQ0lEKSwgYXMgdGhlIHByb3RlY3Rpb24gZG9tYWlucyBtaWdodAo+
ID4gPiAoYW5kIHdpbGwpIGJlIHNoYXJlZCBiZXR3ZWVuIG1vcmUgdGhhbiBzaW5nbGUgSU9NTVUg
ZGV2aWNlLgo+ID4KPiA+IFRoZSBQQ1NJRCBpc24ndCBzY29wZWQgdW5kZXIgdGhlIEdTQ0lEPyBU
aGF0IGRvZXNuJ3Qgc291bmQgdmVyeSBnb29kLAo+ID4gaXQgbWVhbnMgVk0ncyBjYW4ndCBkaXJl
Y3QgaXNzdWUgaW52YWxpZGF0aW9uIHdpdGggdGhlaXIgbG9jYWwgdmlldyBvZgo+ID4gdGhlIFBD
U0lEIHNwYWNlPwo+ID4KPiAKPiBUbyBjbGFyaWZ5OiBQU0NJRCBuYW1lc3BhY2UgaXMgcGVyIEdT
Q0lELgo+IEhvd2V2ZXIgdGhlcmUgbWlnaHQgYmUgbW9yZSB0aGFuIG9uZSBJT01NVSBpbiBhIHNp
bmdsZSBzeXN0ZW0gc2hhcmluZwo+IHRoZSBzYW1lIEdTQ0lECgpJIGFzc3VtZSB0aGlzIGlzIGJl
Y2F1c2UgR1NDSUQgZW5kcyB1cCBzaGFyZWQgd2l0aCBrdm0/Cgo+IGFuZCB3aXRoIGUuZy4gU1ZB
IGRvbWFpbnMgYXR0YWNoZWQgdG8gbW9yZSB0aGFuIG9uZQo+IElPTU1VLiBJdCB3YXMgc2ltcGxl
ciB0byBtYW5hZ2UgUENTSUQgZ2xvYmFsbHkuCgpJZiB0aGUgUFNDSUQgaXMgbW92ZWQgaW50byB0
aGUgaW52YWxpZGF0aW9uIGxpc3QgbGlrZSBJbnRlbCBzdHJ1Y3R1cmVkCml0IHRoZW4gaXQgZG9l
c24ndCBtYXR0ZXIgZm9yIFNWQSwgb3IgcmVhbGx5IGFueXRoaW5nLgoKQUZBSUsgdGhlIG9ubHkg
cmVhc29uIHRvIGRvIG90aGVyd2lzZSBpcyBpZiB5b3UgaGF2ZSBhIHJlYXNvbiB0byBzaGFyZQp0
aGUgSUQgd2l0aCB0aGUgQ1BVL01NIGFuZCB0aGUgSU9NTVUgcHJvYmFibHkgdG8gY29vcmRpbmF0
ZQppbnZhbGlkYXRpb25zLiBCdXQgaWYgeW91IGRvIHRoaXMgdGhlbiB5b3UgcmVhbGx5IGp1c3Qg
YWx3YXlzIHdhbnQgdG8KdXNlIHRoZSBNTSdzIGdsb2JhbCBJRCBzcGFjZSBpbiB0aGUgZmlyc3Qg
cGxhY2UuLi4KClNvIEknbSBub3Qgc3VyZSA6KQoKSmFzb24KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
