Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91302C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 13:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kzOTSujjAj4CqY7mmwXnvGYG8DuFIB1aUMwwvr00GkY=; b=lEJ1GG6BrrHSZf
	syQ1x+bF5S0kq/ZKgBBUkeHG69/cdGDiCis1InMK7oXkA9145FmNZqkfN9/9jAogq5oYKRi5UOAw4
	9PLahV+/kN4hzqiXdfjWw40tZfqKIzR3kZ0B0KasZ0eou7smbfWk2unWM6TKmX+2aH/hsFUo0aMLG
	5kGRM2EOm2ISTHZxo4rl2y6NHcwCoYp91hVZqosvjX6L/36hTtHfKNi7JYXu8LOXBOgr+vNQz6nie
	BVTwmVbUikMWRd6inmlImK1dPnc18poiKWolc9ksG/1kNkO3wSpjoKl4tWQML7QM5Q1I6VT3DY3YM
	VfE79R6f4rOzCINddDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc2yV-00000008L2Q-2due;
	Thu, 08 Aug 2024 13:14:39 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc2yR-00000008L1a-3yxV
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 13:14:37 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7a1d3959ad5so81722285a.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2024 06:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1723122874; x=1723727674; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dgXGNnW/b5f9t+CKB4b5Vyo8s9dDJsUrC85u/qccVjs=;
        b=G0xJpyWVutqx2MJT3QO9hiCVMLorDA+m2SpjljpxuHtQ26y4NQKdtk/A0Fia5H4ucC
         o3h5S5l1bhMIoifHmeaz/RxnSDY4Ghzsy5yRZyYSwZkPwcvrFXBLhG35rG85L/eqlg32
         fyBvgYtyFkPsoddLih6mgwSm5tTXeibn75nzWTFb45RhYBtenvIm0sKM5iaByGe86MZ6
         GPUb75S9E2lX4N3BxTjwnJFXewoJazhZGh1wMigzgrXO8Pt3wP9qUsJ4oCupZMVkH84k
         ucvjyMiQcAA8VzsdcwuZLg8/kmYAVTOd/lHt0uQvNJaYyyCPOoKR+ySvorKwCYjZghBo
         Iu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723122874; x=1723727674;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dgXGNnW/b5f9t+CKB4b5Vyo8s9dDJsUrC85u/qccVjs=;
        b=GSTnXTUiUvEIRkYHUvikV4LiXBHhyxm4PwJexq2ZMzE4BLORSVkWZjPKZ9mnsfRLGI
         gzBFy64dRBLPNuiv4lRMP4jhuSmxnk+qJ/7LfrvZ5ikvueCNjFvseI8UzfXuzb5ZjZmA
         US9Da5nJk86TyLv40OgUnqiGzjowsYR5LSpj6rQMLA0WEzbkTau4i5pM7Kpfw4WzCYbG
         SqCCSAjEKp2Th5q16DbMtBGn7v/r73ozdiQxqYul6ReoJPmNpSXpARrdAOJ4G7qobuYs
         1yCG4WTqDOzulBct2ijyDFVtRkJnZ2OSq3gFYa1/Y2UC7gKmIc4sRk0vi2PuYp8Ca39g
         60pA==
X-Forwarded-Encrypted: i=1; AJvYcCWnrMhNrF0UwO/W5/Gtnu4Spk26sOVGPbgIs05UK6aOZZVM6kJ5ZHJCUUXekVGufY6/R7mLTrznCANruCwLwIDtHyuftYyGX/IlmYO7NKnv
X-Gm-Message-State: AOJu0YzK+oUUDpI7QhLFmE5vmeBcGbbC015q43kne54gBFf7Q5Qn1Xrp
	cQPuuCmD+4qCCH416Ro/BA+L6QsyA4tJevn5sffpBcqClqdEBWALBvUaDFfPgfw=
X-Google-Smtp-Source: AGHT+IHnezL7bVQyZ4vj2ahY4vzl5lMTpzGek5s6d8TdzvnwI8VOuUhjJYFi4WFfdbdI8ZW2URnzyQ==
X-Received: by 2002:a05:620a:4612:b0:79e:fec7:d6e9 with SMTP id af79cd13be357-7a38278a9a4mr249030285a.32.1723122874374;
        Thu, 08 Aug 2024 06:14:34 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a3785e5744sm156520485a.51.2024.08.08.06.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 06:14:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sc2yO-008v8L-5V;
	Thu, 08 Aug 2024 10:14:32 -0300
Date: Thu, 8 Aug 2024 10:14:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: Re: [PATCH v8 7/7] iommu/riscv: Paging domain support
Message-ID: <20240808131432.GB1985367@ziepe.ca>
References: <cover.1718388908.git.tjeznach@rivosinc.com>
 <bdd1e0547e01d012bf40c5e33b752e77c6663c90.1718388909.git.tjeznach@rivosinc.com>
 <389da90e-df78-4ea4-8453-ae2080a68956@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <389da90e-df78-4ea4-8453-ae2080a68956@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_061436_013595_7030D4A1 
X-CRM114-Status: GOOD (  20.23  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBdWcgMDYsIDIwMjQgYXQgMTI6MjQ6NDBQTSAtMDcwMCwgRWFzd2FyIEhhcmloYXJh
biB3cm90ZToKPiBPbiA2LzE0LzIwMjQgMTA6MjcgUE0sIFRvbWFzeiBKZXpuYWNoIHdyb3RlOgo+
ID4gSW50cm9kdWNlIGZpcnN0LXN0YWdlIGFkZHJlc3MgdHJhbnNsYXRpb24gc3VwcG9ydC4KPiA+
IAo+ID4gUGFnZSB0YWJsZSBjb25maWd1cmVkIGJ5IHRoZSBJT01NVSBkcml2ZXIgd2lsbCB1c2Ug
dGhlIGhpZ2hlc3QgbW9kZQo+ID4gaW1wbGVtZW50ZWQgYnkgdGhlIGhhcmR3YXJlLCB1bmxlc3Mg
bm90IGtub3duIGF0IHRoZSBkb21haW4gYWxsb2NhdGlvbgo+ID4gdGltZSBmYWxsaW5nIGJhY2sg
dG8gdGhlIENQVeKAmXMgTU1VIHBhZ2UgbW9kZS4KPiA+IAo+ID4gVGhpcyBjaGFuZ2UgaW50cm9k
dWNlcyBJT1RJTlZBTC5WTUEgY29tbWFuZCwgcmVxdWlyZWQgdG8gaW52YWxpZGF0ZQo+ID4gYW55
IGNhY2hlZCBJT0FUQyBlbnRyaWVzIGFmdGVyIG1hcHBpbmcgaXMgdXBkYXRlZCBhbmQvb3IgcmVt
b3ZlZCBmcm9tCj4gPiB0aGUgcGFnaW5nIGRvbWFpbi4gIEludmFsaWRhdGlvbnMgZm9yIHRoZSBu
b24tbGVhZiBwYWdlIGVudHJpZXMgdXNlCj4gPiBJT1RJTlZBTCBmb3IgYWxsIGFkZHJlc3NlcyBh
c3NpZ25lZCB0byB0aGUgcHJvdGVjdGlvbiBkb21haW4gZm9yCj4gPiBoYXJkd2FyZSBub3Qgc3Vw
cG9ydGluZyBtb3JlIGdyYW51bGFyIG5vbi1sZWFmIHBhZ2UgdGFibGUgY2FjaGUKPiA+IGludmFs
aWRhdGlvbnMuCj4gPiAKPiA+IFJldmlld2VkLWJ5OiBMdSBCYW9sdSA8YmFvbHUubHVAbGludXgu
aW50ZWwuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4K
PiA+IFNpZ25lZC1vZmYtYnk6IFRvbWFzeiBKZXpuYWNoIDx0amV6bmFjaEByaXZvc2luYy5jb20+
Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgfCA2NDIgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYzOSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gCj4gCj4gPiBAQCAtODU2LDcgKzE0NzMsNyBA
QCBzdGF0aWMgc3RydWN0IGlvbW11X2RvbWFpbiByaXNjdl9pb21tdV9pZGVudGl0eV9kb21haW4g
PSB7Cj4gPiAgCj4gPiAgc3RhdGljIGludCByaXNjdl9pb21tdV9kZXZpY2VfZG9tYWluX3R5cGUo
c3RydWN0IGRldmljZSAqZGV2KQo+ID4gIHsKPiA+IC0JcmV0dXJuIElPTU1VX0RPTUFJTl9JREVO
VElUWTsKPiA+ICsJcmV0dXJuIDA7Cj4gPiAgfQo+IAo+IDxzbmlwPgo+IFNvcnJ5IGZvciB0aGUg
ZHJpdmUgYnkgY29tbWVudCwgSSBqdXN0IGhhcHBlbiB0byBiZSBpbiB0aGUgbmVhcmJ5IGNvZGUK
PiBjb250ZXh0Lgo+IAo+IE5pdDogSXQgbWF5IGJlIGJldHRlciB0byB1c2UgSU9NTVVfRE9NQUlO
X0JMT0NLRUQgaGVyZSBmb3IgcmVhZGFiaWxpdHkKPiByYXRoZXIgdGhhbiB0aGUgYmFyZSB2YWx1
ZS4KCkl0IGlzIHdlaXJkIGFuZCBjb25mdXNpbmcsIGJ1dCAwIG1lYW5zICJJIGhhdmUgbm90aGlu
ZyB0byBhZGQiIG5vdApCTE9DS0VELgoKWW91IGNhbid0IHJldHVybiBCTE9DS0VEIGZyb20gdGhp
cyBvcCByaWdodCBub3cuLgoKSmFzb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
