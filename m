Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECEDE784BE
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 15:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKxRwqu1oLhju9tjVjXa3TZgfT3w5XTWUBex1D0GqBI=; b=EjR+tq78L1EbEr
	aVWZAoyAfr7smeiiGshdWwolB17L8+xFrSQ6X3ceUU+7uFZcj1DtjsnqfPC3i1RCVCEbk6z3YMRhU
	cM9nqsWhsfLmuyOuB4evH+U/+KLY41PV/jsib8xadQHl4eoPtiIKEXOphQiHlqjKqeSMWg9WIhtZ6
	dqk2btMu9VNWzKs96vbKqd+XSmhIm0NwVdqtxpYuES4NksouSdxSyTe+FOhPdNtef5nEnAIudS5rJ
	E6cdXX0EooOVQzBuGwNtHT6BC7Gu/0sbrylKigmidiSMdpHsDNkJuIFBF/4PkXVDdAi5uzXmi4+k9
	z1Rvtqbc+zPPqLa6DQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKyA-00Czq9-1A;
	Mon, 02 Oct 2023 15:36:26 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKy7-00CzpC-0n
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 15:36:24 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5892832f8daso358215a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 08:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696260981; x=1696865781; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RgMLD9dSESZx52XLswNxjXiae7bjz6p9TOP3CQJHyA=;
        b=Fy9SowX52cZKo71HwfRp4T42jG2RElAyJLVzx4TqGO7lq7hW1g4er8zIZTNSIMsxjT
         qNxv6/ipljE6Xe3nHzS9my1jv2tpTq05ET7NuH3X/N3PYuZD5Q+oR3oZC40k6IU1ypUo
         qLizXNRSHQZsdcozChQtZG2YjJAMYSCsw9P0wM3Tx7QGWZZTW2hHierNedkjIwSBYoUg
         i3QpamP+CZD25SsQ2xCJ6XsGWs6ImY3pPqp93OS1kS+0gIrf784EH5JmN0ueZDAAjxMO
         xWZhBJ9yMTBlvvpydVpaZ2JWGaWIH17T1vyUNJLdnIFG11r2Bou8U5kgYDx6uPD+Iq5W
         mBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696260981; x=1696865781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RgMLD9dSESZx52XLswNxjXiae7bjz6p9TOP3CQJHyA=;
        b=QDSZJdHOf821jSLNaUwc87431DwkXvtvVfPgFExgXgFNwbHLUtYGkQBX6InFfMyrTs
         Yg7N3+yauvQjl0n30EdlouoLo0Xrc2Wql66yKFj28sWFEKRoyTiiMrkTFGuXiGiSdPWr
         4tA3zCWGaIkdekAsFOxOi/1LhCzX3O0g5bQT+jrW90RIQKWANgIuLJL4t7KpdV+9olSO
         QE5+0RUUeUuOMcw1OpctRMyUP92HPO2xJ/L+RvfEOnwqixDaDMExb5kU9mjTL78iXNv+
         N6iwMGyBVMBCI/0xwPIFg20lQGPcbP09uIKdH6vXA4vHdLuuo+xsaPE/MZCsCOpQSeDe
         M1yg==
X-Gm-Message-State: AOJu0YzS9jiVTTPkUspFRwHHO3EFniZgaTlCcrYuVmuM1kL8obejH+GJ
	H8lJ0CRB7FosS0vtAxi22RsjpbXNDF16UT99h7UUEg==
X-Google-Smtp-Source: AGHT+IHdUbkKZ2bTW3F9Qg4PjCMCpRtqgGBYo+9VzsIQ8Arz7Ddo4OzAJxCLa36qrqP4KqitPbbTePoaUqx96PBwxCI=
X-Received: by 2002:a17:90a:b396:b0:277:422d:3a0f with SMTP id
 e22-20020a17090ab39600b00277422d3a0fmr18387610pjr.17.1696260981095; Mon, 02
 Oct 2023 08:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-2-apatel@ventanamicro.com> <ZRpitP5y1yhzKwbE@infradead.org>
In-Reply-To: <ZRpitP5y1yhzKwbE@infradead.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 2 Oct 2023 21:06:08 +0530
Message-ID: <CAK9=C2XyQtHy3__i+fahbi49=j5Z3Z_Bv5s3Ptqjmuaa5q18LA@mail.gmail.com>
Subject: Re: [PATCH 1/7] RISC-V: Detect XVentanaCondOps from ISA string
To: Christoph Hellwig <hch@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_083623_305960_E1303729 
X-CRM114-Status: GOOD (  10.33  )
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

T24gTW9uLCBPY3QgMiwgMjAyMyBhdCAxMTo1N+KAr0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIFNlcCAxOSwgMjAyMyBhdCAwOToyMzoz
N0FNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gVGhlIFZleXJvbi1WMSBDUFUgc3VwcG9y
dHMgY3VzdG9tIGNvbmRpdGlvbmFsIGFyaXRobWV0aWMgYW5kCj4gPiBjb25kaXRpb25hbC1zZWxl
Y3QvbW92ZSBvcGVyYXRpb25zIHJlZmVycmVkIHRvIGFzIFhWZW50YW5hQ29uZE9wcwo+ID4gZXh0
ZW5zaW9uLiBJbiBmYWN0LCBRRU1VIFJJU0MtViBhbHNvIGhhcyBzdXBwb3J0IGZvciBlbXVsYXRp
bmcKPiA+IFhWZW50YW5hQ29uZE9wcyBleHRlbnNpb24uCj4gPgo+ID4gTGV0IHVzIGRldGVjdCBY
VmVudGFuYUNvbmRPcHMgZXh0ZW5zaW9uIGZyb20gSVNBIHN0cmluZyBhdmFpbGFibGUKPiA+IHRo
cm91Z2ggRFQgb3IgQUNQSS4KPgo+IFVtbSwgSSB0aG91Z2ggTGludXgvcmlzY3Ygd291bGQgbmV2
ZXIgc3VwcG9ydCB2ZW5kb3Igc3BlY2lmaWMKPiBleHRlbnNpb25zPwo+CgpXZSBhbHJlYWR5IGhh
dmUgZmV3IFQtSGVhZCBzcGVjaWZpYyBleHRlbnNpb25zIHNvIExpbnV4IFJJU0MtVgpkb2VzIGFs
bG93IHZlbmRvciBleHRlbnNpb25zLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
