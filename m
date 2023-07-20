Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD17EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 18:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oX6fIF3AEgbfkTP7Oha5THdRd1bS9eKRN77asVMyseY=; b=X23f21by8wcK5D
	WLTF6B+/DNud3CwxHTJ7jsAp32HhJw89PNSsepwa8Bhi3k9SGUS9oWqGhEJ1Omgmc1oQtiK/2r7P+
	Fk/p44Y/99YhQvOU03kpHkGHN7TxSpjq5YnuiwRL4TUm0SyRLmSiuBsP/gmXpn9e7l8ia2NNxrDD1
	O76MD5syuEEkZPb5uSJlb4uuSDbN7o707ZAFPPnHbc9IAzmjRQ1DN0DrUGLACsl3QjrHI24yg3g4u
	aapqVXpJ0oYQ/tFKGz9MaglHCm9QLrZDewdDFbrYh8a/FL1Z7g6kUyVo6e/FjNfdJuanw7dseXqR9
	M+nhB3c7FSejrptJT3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXwv-00Br6M-2c;
	Thu, 20 Jul 2023 18:00:25 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXws-00Br52-31
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 18:00:24 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3a1ebb85f99so780361b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 11:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689876021; x=1690480821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbYc3nOyz3w0g5N21KHrIHLBOSDWflXwjWJQLgw2CWk=;
        b=ZTcWs0IsdaJVr+puZZx6YFyGQGkpYLbfH6SJWfFTUCXLhR665GcAL8lMLKOKXPPAv5
         Y/+03uQ3B2pMx1HBNXQq6JdI0nexaVwAEyWoz/3PYY+Jq8p1tok1DbVd02FVSaQbEdup
         Zn+BQdURIvNu/YUHsDIR2PbCYn2M+KK/R3KrKracp43QGkgPOTzpZbPrvCvA/Pylp+r8
         rYxcjm18i1UK/m4Lv3FUmeKmYI0hACI1kcFneRYjQfq+DqluC4XlLZWF3PhHC3iaSddF
         adjD9CanElVSXbIofcTmQriFiEUwHJbCW1ZkPL5bGWNUTT/vllerVdN0nCw1m1BH3Sad
         gtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689876021; x=1690480821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbYc3nOyz3w0g5N21KHrIHLBOSDWflXwjWJQLgw2CWk=;
        b=gOUDVdmjTOkkase7/UZBE4B7eUBNcqToDAFX7VF3T+L/X1YWSTeG6zxRTPpvh5iDrN
         1+nLnddJMWy6XQR5R31qNwPovfkZXxhteFdtPnZFUffUUC32QMwH5iwFGWGzhGYu0UTG
         PnX6Q+ndRLjag7Pj8bvhXJg+g7UVB7hLrHlraZGzp8kUn8ygPnZ0tbiRICQ+GIYxVzV4
         05ey5giCiVXPeuoLCXj1WEmztrB0cvA/xgpAcFeoxITvPDOhlFBFG25Mq193d88EIR+r
         AhQrfrIrWomTqvwwMX6jFrdEKRlSqPaGuO8AumBbDdCj0lWjptlEFBkRc7XO4URFVbx8
         VinQ==
X-Gm-Message-State: ABy/qLYvbXQQeBA7n5SJceYHo+qI6B9OCOeZB/92nYFTVlKMxh0PLkGA
	cAAAEhF48qk+Vg/qr+cLdH44qS/mbjhB+s9Y6WGbzQ==
X-Google-Smtp-Source: APBJJlG52Rb02KkBG7WCWyzJeoWISmJNBOh4rKJA34OBgfty1aWkRdipEyXQi+tR07GSAKJXWo2n35OGLa+TciKgCEM=
X-Received: by 2002:a05:6808:11c9:b0:3a3:7248:252a with SMTP id
 p9-20020a05680811c900b003a37248252amr222247oiv.0.1689876021113; Thu, 20 Jul
 2023 11:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <1fd79e5c53d9d6ed2264f60dd4261f293cc00472.1689792825.git.tjeznach@rivosinc.com>
 <5b8fd18e-8dfa-96bf-cdd4-4498b1d15ab9@ics.forth.gr>
In-Reply-To: <5b8fd18e-8dfa-96bf-cdd4-4498b1d15ab9@ics.forth.gr>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Thu, 20 Jul 2023 11:00:10 -0700
Message-ID: <CAH2o1u7uAuXsD6+6Dvam4kzQuUj8s98G0sR26_-q31wvSUYZNA@mail.gmail.com>
Subject: Re: [PATCH 06/11] RISC-V: drivers/iommu/riscv: Add command, fault,
 page-req queues
To: Nick Kossifidis <mick@ics.forth.gr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_110022_973269_A7C12B16 
X-CRM114-Status: GOOD (  21.04  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMTksIDIwMjMgYXQgODoxMuKAr1BNIE5pY2sgS29zc2lmaWRpcyA8bWlja0Bp
Y3MuZm9ydGguZ3I+IHdyb3RlOgo+Cj4gSGVsbG8gVG9tYXN6LAo+Cj4gT24gNy8xOS8yMyAyMjoz
MywgVG9tYXN6IEplem5hY2ggd3JvdGU6Cj4gPiBFbmFibGVzIG1lc3NhZ2Ugb3Igd2lyZSBzaWdu
YWwgaW50ZXJydXB0cyBmb3IgUENJZSBhbmQgcGxhdGZvcm1zIGRldmljZXMuCj4gPgo+Cj4gVGhl
IGRlc2NyaXB0aW9uIGRvZXNuJ3QgbWF0Y2ggdGhlIHN1YmplY3Qgbm9yIHRoZSBwYXRjaCBjb250
ZW50ICh3ZQo+IGRvbid0IGp1cyBlbmFibGUgaW50ZXJydXB0cywgd2UgYWxzbyBpbml0IHRoZSBx
dWV1ZXMpLgo+Cj4gPiArICAgICAvKiBQYXJzZSBRdWV1ZSBsZW5ndHMgKi8KPiA+ICsgICAgIHJl
dCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYtPmRldi5vZl9ub2RlLCAiY21kcV9sZW4iLCAm
aW9tbXUtPmNtZHFfbGVuKTsKPiA+ICsgICAgIGlmICghcmV0KQo+ID4gKyAgICAgICAgICAgICBk
ZXZfaW5mbyhkZXYsICJjb21tYW5kIHF1ZXVlIGxlbmd0aCBzZXQgdG8gJWlcbiIsIGlvbW11LT5j
bWRxX2xlbik7Cj4gPiArCj4gPiArICAgICByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihwZGV2
LT5kZXYub2Zfbm9kZSwgImZsdHFfbGVuIiwgJmlvbW11LT5mbHRxX2xlbik7Cj4gPiArICAgICBp
ZiAoIXJldCkKPiA+ICsgICAgICAgICAgICAgZGV2X2luZm8oZGV2LCAiZmF1bHQvZXZlbnQgcXVl
dWUgbGVuZ3RoIHNldCB0byAlaVxuIiwgaW9tbXUtPmZsdHFfbGVuKTsKPiA+ICsKPiA+ICsgICAg
IHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYtPmRldi5vZl9ub2RlLCAicHJpcV9sZW4i
LCAmaW9tbXUtPnByaXFfbGVuKTsKPiA+ICsgICAgIGlmICghcmV0KQo+ID4gKyAgICAgICAgICAg
ICBkZXZfaW5mbyhkZXYsICJwYWdlIHJlcXVlc3QgcXVldWUgbGVuZ3RoIHNldCB0byAlaVxuIiwg
aW9tbXUtPnByaXFfbGVuKTsKPiA+ICsKPiA+ICAgICAgIGRtYV9zZXRfbWFza19hbmRfY29oZXJl
bnQoJnBkZXYtPmRldiwgRE1BX0JJVF9NQVNLKDY0KSk7Cj4gPgo+Cj4gV2UgbmVlZCB0byBhZGQg
dGhvc2UgdG8gdGhlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jIChvciB0aHJvdyB0aGVtIGF3YXks
Cj4gSSB0aG91Z2h0IGl0IHdvdWxkIGJlIGJldHRlciB0byBoYXZlIHRoZW0gYXMgcGFydCBvZiB0
aGUgZGV2aWNlCj4gZGVzY2lwdGlvbiB0aGFuIGEgbW9kdWxlIHBhcmFtZXRlcikuCj4KCldlIGNh
biBhZGQgdGhlbSBhcyBhbiBvcHRpb25hbCBmaWVsZHMgdG8gRFQuCkFsdGVybmF0aXZlbHksIEkn
dmUgYmVlbiBsb29raW5nIGludG8gYW4gb3B0aW9uIHRvIGF1dG8tc2NhbGUgQ1EvUFEKYmFzZWQg
b24gbnVtYmVyIG9mIGF0dGFjaGVkIGRldmljZXMsIGJ1dCB0aGlzIGdldHMgdHJpY2tpZXIgZm9y
CmhvdC1wbHVnZ2FibGUgc3lzdGVtcy4gSSd2ZSBhZGRlZCBtb2R1bGUgcGFyYW1ldGVycyBhcyBh
IGJhcmUtbWluaW11bSwKYnV0IHN0aWxsIGxvb2tpbmcgZm9yIGJldHRlciBzb2x1dGlvbnMuCgo+
Cj4gPiArc3RhdGljIGlycXJldHVybl90IHJpc2N2X2lvbW11X3ByaXFfaXJxX2NoZWNrKGludCBp
cnEsIHZvaWQgKmRhdGEpOwo+ID4gK3N0YXRpYyBpcnFyZXR1cm5fdCByaXNjdl9pb21tdV9wcmlx
X3Byb2Nlc3MoaW50IGlycSwgdm9pZCAqZGF0YSk7Cj4gPiArCj4KPiA+ICsgICAgIGNhc2UgUklT
Q1ZfSU9NTVVfUEFHRV9SRVFVRVNUX1FVRVVFOgo+ID4gKyAgICAgICAgICAgICBxID0gJmlvbW11
LT5wcmlxOwo+ID4gKyAgICAgICAgICAgICBxLT5sZW4gPSBzaXplb2Yoc3RydWN0IHJpc2N2X2lv
bW11X3BxX3JlY29yZCk7Cj4gPiArICAgICAgICAgICAgIGNvdW50ID0gaW9tbXUtPnByaXFfbGVu
Owo+ID4gKyAgICAgICAgICAgICBpcnEgPSBpb21tdS0+aXJxX3ByaXE7Cj4gPiArICAgICAgICAg
ICAgIGlycV9jaGVjayA9IHJpc2N2X2lvbW11X3ByaXFfaXJxX2NoZWNrOwo+ID4gKyAgICAgICAg
ICAgICBpcnFfcHJvY2VzcyA9IHJpc2N2X2lvbW11X3ByaXFfcHJvY2VzczsKPiA+ICsgICAgICAg
ICAgICAgcS0+cWJyID0gUklTQ1ZfSU9NTVVfUkVHX1BRQjsKPiA+ICsgICAgICAgICAgICAgcS0+
cWNyID0gUklTQ1ZfSU9NTVVfUkVHX1BRQ1NSOwo+ID4gKyAgICAgICAgICAgICBuYW1lID0gInBy
aXEiOwo+ID4gKyAgICAgICAgICAgICBicmVhazsKPgo+Cj4gSXQgbWFrZXMgbW9yZSBzZW5zZSB0
byBhZGQgdGhlIGNvZGUgZm9yIHRoZSBwYWdlIHJlcXVlc3QgcXVldWUgaW4gdGhlCj4gcGF0Y2gg
dGhhdCBhZGRzIEFUUy9QUkkgc3VwcG9ydCBJTUhPLiBUaGlzIGNvbW1lbnQgYWxzbyBhcHBsaWVz
IHRvIGl0cwo+IGludGVycnVwdCBoYW5kbGVycyBiZWxvdy4KPgoKYWNrLiB3aWxsIGRvLgoKPgo+
ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCByaXNjdl9pb21tdV9jbWRfaW52YWxfc2V0X2FkZHIoc3Ry
dWN0IHJpc2N2X2lvbW11X2NvbW1hbmQgKmNtZCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHU2NCBhZGRyKQo+ID4gK3sKPiA+ICsgICAgIGNtZC0+
ZHdvcmQwIHw9IFJJU0NWX0lPTU1VX0NNRF9JT1RJTlZBTF9BVjsKPiA+ICsgICAgIGNtZC0+ZHdv
cmQxID0gYWRkcjsKPiA+ICt9Cj4gPiArCj4KPiBUaGlzIG5lZWRzIHRvIGJlIChhZGRyID4+IDIp
IHRvIG1hdGNoIHRoZSBzcGVjLCBzYW1lIGFzIGluIHRoZSBpb2ZlbmNlCj4gY29tbWFuZC4KPgoK
b29wcy4gVGhhbmtzIQoKPiBSZWdhcmRzLAo+IE5pY2sKPgoKcmVnYXJkcywKLSBUb21hc3oKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
