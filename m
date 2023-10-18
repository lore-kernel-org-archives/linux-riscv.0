Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA00CDB485
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 11:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmcDSXJNmPhPFuSjNNSmYdmTwbb0euudY72TRuBqvC8=; b=ElLQQua+bZxj68
	y1cef1e+5e7xeCg6P8o5mKKeUZnZDm+R+YICbwWqKV6s+i4LLl3bytQFEfNGzdcumj6VUaZiZsGs6
	sOG0FfKE4+Zs1X2F15LeP9xuZtDjJWIE07x99ZnUl8YAJy+qfUCn6G97XvM6AQ1eWKpIDpyBUHO8z
	xzLBW9UWn/k8htwZGN9Sh+rQ+MNJpSWvnei5WGk0XYd+U6ffbBfB8gATWSHJYd2IMCsSeo5VvWa1Y
	cPXdLOeTQim/OoK0eXBZZN1k0ps0xkOBWjUQk3X99xWFQLIaYppwuyJa9xj2eHw3/b0HUiqbqjfDl
	DvEzbMYY/7ltQe/W69WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4n6-00EYyW-0h;
	Wed, 18 Oct 2023 11:32:44 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4n2-00EYso-35
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 11:32:42 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so5795049f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 04:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697628755; x=1698233555; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHg4mM71KXb5DEEj0eqsenmzI1spOu0jlYYbZtbcLDI=;
        b=MKH0PFwjAE2qFXwmc5dTdOEHCTHWHxKAAHTWZi3OxYa5mKSHAPfT4wob0eJHFfovoe
         GxYVR3F12UkLv59X/wl98IqLAHYZyAcLInmpEC87/rSFBktxNHj7gcVFUL47yKe/Qi6q
         NvjWkhGZXO1r8mTQJUlxO0XsggHdeFHC7X4qYWqaxOZB/CtHW7jGKHB8fz1cccDacMU7
         MSWhom2PpDrRrFORzjuNQ1RUNgCaxImVJ1dJVzQ8rjf9yXOc649GiYQmoyb5FrTdC6QX
         m5X8jkZo2Hccm4u6R/7EKsSw4D5ByNW0Kg9XYwe3VBzSlMeSAkzrDG1tmdsdRDCdNe9t
         EJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697628755; x=1698233555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHg4mM71KXb5DEEj0eqsenmzI1spOu0jlYYbZtbcLDI=;
        b=PahJTWaBHE/a4dfq6dElTEWuAiEWGWQS0WppWhP2/I33snqG3Cw9S3t1qbA/+dlxCT
         FyGfQcj2dDsm4Xeetr82WZhAJfGwfCM7IVSFkITg4npzmx/ix6gXT6GZFoRL2XYjii10
         gIH9SWydd5hqDPdkEkXKKkkr2TW4A+O6DpY3ON4aNnA+EW5H11npW5ByPF1ORLr3hB0G
         yAYLwhjH3XbZZYT773WJDL/5Hk0kUENJJ9bl5RJRB8BKSvu54TQQhlDNi1uYi9bNavXT
         4EQlbzS9rs5zbqCrX3ix0jN++pZtPZq1TtOE8U2wiW021G1L8pBQ19VgPDw09/LmEByk
         R4UA==
X-Gm-Message-State: AOJu0Yz4VQ7iiyAFy3Wvg6mZPEAD67ZfoVxoUW2+z1qfNboQZ2meqsBA
	4cVvS5BQhVkt+9bFGqfUkAFdYvFgtl0NNYevPeL5xg==
X-Google-Smtp-Source: AGHT+IE7XG0RKk8s+uBzZafDLTDJ6fdrdFzovu8zj80LYFemlglr4j6DZXpsSClEETmOBCTzjgEKBb3b1Jy3x7exweE=
X-Received: by 2002:a5d:668d:0:b0:32d:9789:6066 with SMTP id
 l13-20020a5d668d000000b0032d97896066mr4216230wru.5.1697628755552; Wed, 18 Oct
 2023 04:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230911131224.61924-1-alexghiti@rivosinc.com>
 <20230911131224.61924-3-alexghiti@rivosinc.com> <79d8ca23-478d-4f88-afb3-343a85ed0fe6@sifive.com>
In-Reply-To: <79d8ca23-478d-4f88-afb3-343a85ed0fe6@sifive.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 18 Oct 2023 13:32:24 +0200
Message-ID: <CAHVXubiaYwQ3PeiA-688cKuBscdEb5QpNerbYSMWYqiXCm-FRw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] riscv: Improve flush_tlb_range() for hugetlb pages
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Samuel Holland <samuel@sholland.org>, Lad Prabhakar <prabhakar.csengg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_043240_994758_60DC4164 
X-CRM114-Status: GOOD (  25.89  )
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

T24gTW9uLCBPY3QgOSwgMjAyMyBhdCA3OjUz4oCvUE0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5o
b2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQWxleCwKPgo+IE9uIDIwMjMtMDktMTEg
ODoxMiBBTSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gZmx1c2hfdGxiX3JhbmdlKCkgdXNl
cyBhIGZpeGVkIHN0cmlkZSBvZiBQQUdFX1NJWkUgYW5kIGluIGl0cyBjdXJyZW50IGZvcm0sCj4g
PiB3aGVuIGEgaHVnZXRsYiBtYXBwaW5nIG5lZWRzIHRvIGJlIGZsdXNoZWQsIGZsdXNoX3RsYl9y
YW5nZSgpIGZsdXNoZXMgdGhlCj4gPiB3aG9sZSB0bGI6IHNvIHNldCBhIHN0cmlkZSBvZiB0aGUg
c2l6ZSBvZiB0aGUgaHVnZXRsYiBtYXBwaW5nIGluIG9yZGVyIHRvCj4gPiBvbmx5IGZsdXNoIHRo
ZSBodWdldGxiIG1hcHBpbmcuIEhvd2V2ZXIsIGlmIHRoZSBodWdlcGFnZSBpcyBhIE5BUE9UIHJl
Z2lvbiwKPiA+IGFsbCBQVEVzIHRoYXQgY29uc3RpdHV0ZSB0aGlzIG1hcHBpbmcgbXVzdCBiZSBp
bnZhbGlkYXRlZCwgc28gdGhlIHN0cmlkZQo+ID4gc2l6ZSBtdXN0IGFjdHVhbGx5IGJlIHRoZSBz
aXplIG9mIHRoZSBQVEUuCj4gPgo+ID4gTm90ZSB0aGF0IFRIUHMgYXJlIGRpcmVjdGx5IGhhbmRs
ZWQgYnkgZmx1c2hfcG1kX3RsYl9yYW5nZSgpLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbmRy
ZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNj
di9tbS90bGJmbHVzaC5jIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jIGIvYXJjaC9yaXNj
di9tbS90bGJmbHVzaC5jCj4gPiBpbmRleCBmYTAzMjg5ODUzZDguLjViZGE2ZDRmZWQ5MCAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4gKysrIGIvYXJjaC9yaXNj
di9tbS90bGJmbHVzaC5jCj4gPiBAQCAtMyw2ICszLDcgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgv
bW0uaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvc21wLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3Nj
aGVkLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2h1Z2V0bGIuaD4KPiA+ICAjaW5jbHVkZSA8YXNt
L3NiaS5oPgo+ID4gICNpbmNsdWRlIDxhc20vbW11X2NvbnRleHQuaD4KPiA+Cj4gPiBAQCAtMTQ3
LDcgKzE0OCw0MyBAQCB2b2lkIGZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hLCB1bnNpZ25lZCBsb25nIGFkZHIpCj4gPiAgdm9pZCBmbHVzaF90bGJfcmFuZ2Uoc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gPiAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgbG9uZyBlbmQpCj4gPiAgewo+ID4gLSAgICAgX19mbHVzaF90bGJf
cmFuZ2Uodm1hLT52bV9tbSwgc3RhcnQsIGVuZCAtIHN0YXJ0LCBQQUdFX1NJWkUpOwo+ID4gKyAg
ICAgdW5zaWduZWQgbG9uZyBzdHJpZGVfc2l6ZTsKPiA+ICsKPiA+ICsgICAgIHN0cmlkZV9zaXpl
ID0gaXNfdm1faHVnZXRsYl9wYWdlKHZtYSkgPwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaHVnZV9wYWdlX3NpemUoaHN0YXRlX3ZtYSh2bWEpKSA6Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBQQUdFX1NJWkU7Cj4gPiArCj4gPiArI2lmZGVmIENPTkZJR19SSVND
Vl9JU0FfU1ZOQVBPVAo+ID4gKyAgICAgLyoKPiA+ICsgICAgICAqIEFzIHN0YXRlZCBpbiB0aGUg
cHJpdmlsZWdlZCBzcGVjaWZpY2F0aW9uLCBldmVyeSBQVEUgaW4gYSBOQVBPVAo+ID4gKyAgICAg
ICogcmVnaW9uIG11c3QgYmUgaW52YWxpZGF0ZWQsIHNvIHJlc2V0IHRoZSBzdHJpZGUgaW4gdGhh
dCBjYXNlLgo+ID4gKyAgICAgICovCj4gPiArICAgICBpZiAoaGFzX3N2bmFwb3QoKSkgewo+Cj4g
VGhpcyB3aG9sZSBibG9jayBzaG91bGQgcHJvYmFibHkgZ28gaW5zaWRlIHRoZSBpc192bV9odWdl
dGxiX3BhZ2Uodm1hKSBjaGVjaywKPiBzaW5jZSB3ZSBoYXZlIHRvIHBlcmZvcm0gdGhhdCBjaGVj
ayBhbnl3YXkuCgpZZXMsIHlvdSdyZSByaWdodC4KCj4KPiA+ICsgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBvcmRlciwgbmFwb3Rfc2l6ZTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgZm9yX2Vh
Y2hfbmFwb3Rfb3JkZXIob3JkZXIpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBuYXBvdF9z
aXplID0gbmFwb3RfY29udF9zaXplKG9yZGVyKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBpZiAoc3RyaWRlX3NpemUgIT0gbmFwb3Rfc2l6ZSkKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlm
IChuYXBvdF9zaXplID49IFBHRElSX1NJWkUpCj4KPiBDYW4geW91IGNoZWNrIHN0cmlkZV9zaXpl
IGhlcmUgZGlyZWN0bHksIGFuZCBkcm9wIHRoZSBsb29wPyBXZSBzaG91bGQgYmUgYWJsZSB0bwo+
IGFzc3VtZSB0aGF0IHRoZSBodWdlIHBhZ2Ugc2l6ZSBpcyB2YWxpZC4gTm9uLU5BUE9UIGh1Z2Vw
YWdlcyB3aWxsIGhpdCBvbmUgb2YgdGhlCj4gZXF1YWwtdG8gY2FzZXMgYmVsb3csIHdoaWNoIGlz
IGZpbmUuCgpZZXMsIGFnYWluLCB5b3UncmUgcmlnaHQuCgpJJ2xsIHJlc3BpbiBhIG5ldyB2ZXJz
aW9uIG5vdywgbGV0IGl0IGdvIHRocm91Z2ggb3VyIENJIGFuZCBzZW5kIGl0IHRvbW9ycm93LAoK
VGhhbmtzLAoKQWxleAoKPgo+IFJlZ2FyZHMsCj4gU2FtdWVsCj4KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cmlkZV9zaXplID0gUEdESVJfU0laRTsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBlbHNlIGlmIChuYXBvdF9zaXplID49IFA0RF9TSVpFKQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RyaWRlX3NpemUgPSBQNERfU0laRTsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBlbHNlIGlmIChuYXBvdF9zaXplID49IFBVRF9TSVpFKQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RyaWRlX3NpemUgPSBQVURfU0laRTsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBlbHNlIGlmIChuYXBvdF9zaXplID49IFBNRF9TSVpFKQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RyaWRlX3NpemUgPSBQTURfU0laRTsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBlbHNlCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJpZGVfc2l6ZSA9IFBBR0VfU0laRTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBicmVhazsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gKyAgICAgfQo+ID4gKyNlbmRpZgo+ID4g
Kwo+ID4gKyAgICAgX19mbHVzaF90bGJfcmFuZ2Uodm1hLT52bV9tbSwgc3RhcnQsIGVuZCAtIHN0
YXJ0LCBzdHJpZGVfc2l6ZSk7Cj4gPiAgfQo+ID4gICNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRf
SFVHRVBBR0UKPiA+ICB2b2lkIGZsdXNoX3BtZF90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
