Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF732D16261
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 13:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwVF72np4ofu2Gh9tvAztSdmj4smkaVjqfNcaXqM98o=; b=K6wd1DoYNsdadF
	gPy63BcNgG+80he5hVs8yI9IkcRBkvG6xeUsxHxiki//87Sp6xNWkmPH18hJp8IN7z7qAmA5KOL+6
	gt2F59PMzBkNuGt3je+mFldxM3AOGa+94W0zh3Slu4z2mkQg9pb19yyVRn29rsds10W0u2pdSDrhq
	v6V+lRn/6D/obrR8cpiLWUnYzev7Is8rXEVvKTdQ1mV9x0KUTqMttXfqpvV0kJcEeDOARTFzO9J8t
	hlZxJD0YixjLfv6ei2yq3/XkxcfAt3r1E/zcRlkPpOvC/CEFZldwsJB8Pt5GEoEQibuNtJLcgLVY2
	Qsd+VY8pvN4+To/LxCdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0LHn-00000005Jxz-2Fsf;
	Mon, 14 Oct 2024 13:38:59 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KCX-0000000558v-07X2
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 12:29:30 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5e5b5715607so2145975eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 05:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1728908967; x=1729513767; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obYwGkvze5brDSPVKwCxBn24HUjtTBUUJpgF04yDya0=;
        b=OQmKECIMC3ISCLkf4Mzvn0TKuebI4fHWjPdBlmVNQpjXcYDEBycMpbYAPSt2C0WtRn
         hyPm9UKrviQQODz60M63Zn9wu+OM432uaSH0UN/ZuSmJyBPw910Vb4bPfLz6R1OLJPnZ
         XZNmT2hC3tYPuB7MMyLPqu8Xjao73KTRmrkzCDmKud7NnITzwDn/KR/nOYdrb8bslqhr
         l2k9jIlQmleB0ON5LGRJrmw8F0OwIwHR/E0Pm5mQbP4mvtdYs99A0anPPOXUs9WgxMAK
         kZz0QqZwyOoKvP3R/8u7D2FnXa9nqCNnh7d3a/eiRdhy4JADAU9wss4PmpDMCYCYT7nG
         8bQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728908967; x=1729513767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obYwGkvze5brDSPVKwCxBn24HUjtTBUUJpgF04yDya0=;
        b=aMTGQoz+qUB70iRyoEkXXTjbtb2rKgBcDD5nSPEMnFoVJN0NXSZIBwjIpeeMIOO/VB
         6a+8seSNrjrBaj0KmaZ9g8h1YXytB6dEXpJL8lOb9ECmqTqXxkHe/XrhGToy99abSIx5
         guVsJE3pKKhUQCnPMjC1favN1+7U7IXTX7XCCp11j3oL2kRAbfdkPScIrTKvMieIH2SW
         NsbQR52acH8EZl0qfuH9ouiAZxHrdtuwY4oV5g9kDhdi3fkCKPDNmw3qvGWdBNMfW8Vt
         4j88KOov+8b39gXKkI54XmFW/EE6nwWmaVkI+lb4/JRevUyzrtzCfRxtkc70IlG3pZAj
         +9WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXnkzb+WZrPJEhQi1HvF1mSNKWCwTH3OW+3qE9rz1zLjlvgWdEN6+DqDP6b3FtH0B6GJ4mDPNjgH6BWA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0tVHhxYqm+arCRXGc5dAF5BG7pA3sJrOuAHYEy/2tYzvG4GEN
	rx0ZpHqJyqX2JRc/xXS05ZcyVnTIdOeBdeDJxpAlj4jB2cMN1h4xfhqvz8C6IgYdbiRNu3oUwx5
	crWO+TbPlUN1Mr6MmSIR8kPrE+nmHB3WsIY4O6g==
X-Google-Smtp-Source: AGHT+IGquwzzJq3TSHzHDk59BGV7hfB4VOx7ysqUP6B9j2bTJgjryU0p6MgswYU9kQMvvdQq5iI60yybmFuLgD4vqBo=
X-Received: by 2002:a05:6820:1ac6:b0:5d6:ab0:b9a6 with SMTP id
 006d021491bc7-5eb18d8d9eamr5308659eaf.4.1728908966736; Mon, 14 Oct 2024
 05:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241014094705.71775-1-cuiyunhui@bytedance.com> <Zw0B6_k7ejVtBTRC@sunil-laptop>
In-Reply-To: <Zw0B6_k7ejVtBTRC@sunil-laptop>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 14 Oct 2024 20:29:15 +0800
Message-ID: <CAEEQ3wnZaTnUDgKr3tTmD0q=G118u4RReiShNAfxScxiOcKqmg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: ACPI: fix early_ioremap to early_memremap
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, ajones@ventanamicro.com, alexghiti@rivosinc.com, 
	jeeheng.sia@starfivetech.com, haibo1.xu@intel.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_052929_308474_36BE76E2 
X-CRM114-Status: GOOD (  20.39  )
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

SGkgU3VuaWwsCgpPbiBNb24sIE9jdCAxNCwgMjAyNCBhdCA3OjM14oCvUE0gU3VuaWwgViBMIDxz
dW5pbHZsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gSGkgWXVuaHVpLAo+IE9uIE1vbiwg
T2N0IDE0LCAyMDI0IGF0IDA1OjQ3OjA1UE0gKzA4MDAsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiBX
aGVuIFNWUEJNVCBpcyBlbmFibGVkLCBfX2FjcGlfbWFwX3RhYmxlKCkgd2lsbCBkaXJlY3RseSBh
Y2Nlc3MgdGhlCj4gPiBkYXRhIGluIEREUiB0aHJvdWdoIHRoZSBJTyBhdHRyaWJ1dGUsIHJhdGhl
ciB0aGFuIHRocm91Z2ggaGFyZHdhcmUKPiA+IGNhY2hlIGNvbnNpc3RlbmN5LCByZXN1bHRpbmcg
aW4gaW5jb3JyZWN0IGRhdGEgaW4gdGhlIG9idGFpbmVkIEFDUEkKPiA+IHRhYmxlLgo+ID4KPiA+
IFRoZSBsb2c6IEFDUEk6IFtBQ1BJOjB4MThdIEludmFsaWQgemVybyBsZW5ndGguCj4gPgo+ID4g
V2UgZG8gbm90IGFzc3VtZSB3aGV0aGVyIHRoZSBib290bG9hZGVyIGZsdXNoZXMgb3Igbm90LiBX
ZSBzaG91bGQKPiA+IGFjY2VzcyBpbiBhIGNhY2hlYWJsZSB3YXkgaW5zdGVhZCBvZiBtYWludGFp
bmluZyBjYWNoZSBjb25zaXN0ZW5jeQo+ID4gYnkgc29mdHdhcmUuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiAtLS0KPiA+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9hY3BpLmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL2FjcGkuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYwo+ID4gaW5kZXggNmUwZDMz
M2Y1N2U1Li4zMTc3YzlhZjg3NjQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9h
Y3BpLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYwo+ID4gQEAgLTIxMCw3ICsy
MTAsNyBAQCB2b2lkIF9faW5pdCBfX2lvbWVtICpfX2FjcGlfbWFwX3RhYmxlKHVuc2lnbmVkIGxv
bmcgcGh5cywgdW5zaWduZWQgbG9uZyBzaXplKQo+ID4gICAgICAgaWYgKCFzaXplKQo+ID4gICAg
ICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+Cj4gPiAtICAgICByZXR1cm4gZWFybHlfaW9yZW1h
cChwaHlzLCBzaXplKTsKPiA+ICsgICAgIHJldHVybiBlYXJseV9tZW1yZW1hcChwaHlzLCBzaXpl
KTsKPiA+ICB9Cj4gPgo+IEkgdGhpbmsgX19hY3BpX3VubWFwX3RhYmxlKCkgYWxzbyBuZWVkcyBz
aW1pbGFyIGNoYW5nZS4gWW91IG1pZ2h0IG5lZWQKPiB0byB0eXBlY2FzdCB0byBzdXBwcmVzcyB0
aGUgc3BhcnNlIGVycm9yIFsxXSB0aGVuLgoKT0suIEkgd2lsbCBtYWtlIHRoZSBjaGFuZ2VzIGlu
IHYyLiBSZWdhcmRpbmcgdGhlIHNwYXJzZSBlcnJvciwgSSB3aWxsCnVzZSBhbm90aGVyIHBhdGNo
IHNwZWNpZmljYWxseSB0byBzb2x2ZSBpdC4gSXMgdGhhdCBva2F5PwoKPgo+IFsxXSAtIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzA1MjAxNDI3Lkk3UWhQak5XLWxr
cEBpbnRlbC5jb20vI3IKPgo+IFRoYW5rcywKPiBTdW5pbAoKVGhhbmtzLApZdW5odWkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
