Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A29CDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 10:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ID/WlagrbU20zP5dyPOiNAOjYGKZPyUCw3C4qfmzEWE=; b=i5eHFuHp8Pte2G
	fTmnw4fUuoijQ/YY9nVGI8PjL8yg2+bh4uOuoMBPw58u9N3aV/AK05KEn2x4s7P+dRO15+3EzeDEJ
	8l9oeY891FQ6Fdo8uCT43cQfmPtQUD+8IIsTR7dHV8NhVtB2Pyr2L62VWM1AOBr3uV6TlCa1BBEeV
	75BKuKwdgrQ4fNKHrZOujicXThANwUsAWyn4CHcFCIln7X03cpkDxixfnABDgY9f6U4+MVeSL4RRs
	Z6lfMU6Y7QwnIu80KDvXwEtwyKzihehnVDTOLijCd9kJr4VWY8QdbQPka6+zx64j0YvqJBi+2PgLw
	PaYmoTfyk4FvvrDXXHMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qshZO-00C77A-1b;
	Tue, 17 Oct 2023 10:45:02 +0000
Received: from mail-yb1-f175.google.com ([209.85.219.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qshZL-00C75h-2f
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 10:45:01 +0000
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d9b2ca542e5so4416725276.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 03:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697539495; x=1698144295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPRdJ+3TN8Zmg5SzFNo5gq2GpoI/z77WwxmQGbYRfiU=;
        b=oG/bBXay/db0fRZ/mQV6Tmv+1jtnfrwnnL++ZqCR+9/fnk+G8e1gcWaP9BZrK2e83M
         cjkQvB0j7SIk42OjHtNZaqrbGU6uz5wBuzyALXk8JXiEAoCtzrXIQPypBD9lBlkszHmh
         B5ndNYeLyfMmo7JUzsVuOU7GyUql68dYlwnlZMW+7QNFRey89czLpHru253Ayd5c9P+7
         WzZ0Fa8a5oiqzpKEO+ySQ0NPlG95f8HZNoza90KJSEjAxj6YECLgpqP+ta4C0BW0iLhA
         YJaYqF3ayXj+2x72obhkJ2UyBin3/w62DpQHG/iaeFXuFiFdnOInv5ckl6FQ2FN3dQCm
         n6kA==
X-Gm-Message-State: AOJu0YxH2SV3OvscYxEDGf1mQvaKVfq6La7O8xpL3E+Lf7AHPwFIub00
	QAVX9G8FttKznPBMCngrxaQ+yNQQf5v+ng==
X-Google-Smtp-Source: AGHT+IFZrhAmXBNyKDto6Kf82Gyep71EWyv+PDwhbCiSwXh5Ofzu00mgtO7bEkT2XWPiqQdpo6+T/Q==
X-Received: by 2002:a25:abab:0:b0:d9a:dfd2:cce4 with SMTP id v40-20020a25abab000000b00d9adfd2cce4mr1900122ybi.55.1697539495365;
        Tue, 17 Oct 2023 03:44:55 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 187-20020a250ac4000000b00d9ac1f0e23csm417581ybk.56.2023.10.17.03.44.54
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 03:44:54 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a7e5dc8573so68078867b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 03:44:54 -0700 (PDT)
X-Received: by 2002:a81:4996:0:b0:592:ffc:c787 with SMTP id
 w144-20020a814996000000b005920ffcc787mr1937845ywa.30.1697539494112; Tue, 17
 Oct 2023 03:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de>
 <20231016-pantyhose-tall-7565b6b20fb9@wendy> <20231016131745.GB26484@lst.de>
In-Reply-To: <20231016131745.GB26484@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Oct 2023 12:44:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVZz=YWMAgzUzme-U3qxYeLdi66xw2CGubpesGy+ZjRw@mail.gmail.com>
Message-ID: <CAMuHMdXVZz=YWMAgzUzme-U3qxYeLdi66xw2CGubpesGy+ZjRw@mail.gmail.com>
Subject: Re: [PATCH 04/12] soc: renesas: select RISCV_DMA_NONCOHERENT from ARCH_R9A07G043
To: Christoph Hellwig <hch@lst.de>
Cc: Conor Dooley <conor.dooley@microchip.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	iommu@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>, arm-soc <soc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_034459_865993_397379A3 
X-CRM114-Status: GOOD (  18.15  )
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

SGkgQ2hyaXN0b3BoLAoKT24gTW9uLCBPY3QgMTYsIDIwMjMgYXQgMzoxN+KAr1BNIENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPiBPbiBNb24sIE9jdCAxNiwgMjAyMyBhdCAw
MTo1Mjo1N1BNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiA+ICsgICBzZWxlY3QgUklT
Q1ZfRE1BX05PTkNPSEVSRU5UCj4gPiA+ICAgICBzZWxlY3QgRVJSQVRBX0FOREVTIGlmIFJJU0NW
X1NCSQo+ID4gPiAgICAgc2VsZWN0IEVSUkFUQV9BTkRFU19DTU8gaWYgRVJSQVRBX0FOREVTCj4g
Pgo+ID4gU2luY2UgdGhpcyBLY29uZmlnIG1lbnUgaGFzIGNoYW5nZWQgYSBiaXQgaW4gbGludXgt
bmV4dCwgdGhlIHNlbGVjdHMKPiA+IGFyZSB1bmNvbmRpdGlvbmFsIGhlcmUsIGFuZCBFUlJBVEFf
QU5ERVNfQ01PIHdpbGwgaW4gdHVybiBzZWxlY3QKPiA+IFJJU0NWX0RNQV9OT05DT0hFUkVOVC4K
Pgo+IE9oLCBsb29rcyBsaWtlIGFub3RoZXIgcGF0Y2ggbGFuZGVkIHRoZXJlIGluIGxpbnV4LW5l
eHQuICBJIGhhZAo+IHdhaXRlZCBmb3IgdGhlIHByZXZpb3VzIG9uZSBnbyBnbyB1cHN0cmVhbSBp
biAtcmM2LiAgTm90IHN1cmUKPiBob3cgdG8gYmVzdCBoYW5kbGUgdGhpcyBjb25mbGljdC4KCkkg
dGhpbmsgdGhlIGVhc2llc3QgaXMgdG8gYXNrIHNvYyB0byBhcHBseSB0aGlzIHNlcmllcz8KCkdy
e29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5p
Y2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcg
dG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2Ug
dGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
