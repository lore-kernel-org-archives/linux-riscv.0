Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17C8C25B75
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 18:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDBBgbxCqrX2vfSADEAh+/1xSC+IAhsGBRm6rRiksmM=; b=HjFUUxwsm8aca+
	+OfRvqwrVZ/vQ2CGpFHnFbHTR/aQLkeaS7GLgDF/j8XvGJwmxJ/VqKG1NZHbD5K5Tzs9fJfmWDpwy
	cTBP/oZ/zMJrTUFH+1G5uk+eBUea1OeLwNIo/AZ4jcZZQF+mPwhkr5enrvc0W08d61SoIaZaJV3Q7
	50BXH00d3zvS+cJ/7BSuAgwX91PdDW4jNxOy4TtnwFTp0G4MZJno69SDWLYfhgHe+VBdhQ66CtAs5
	WUZ4np8zKSti0+5G9P+xVY8tPBjDnO7IhulfAoGitlviXB/Drz8G5ehDW/uY6ltcy6QExtSrPDdXF
	QmH/hp+P1zQtxNYLN5nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6x6K-0000000GsG8-21da;
	Tue, 14 May 2024 18:42:12 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6x6I-0000000GsEZ-1FJZ
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 18:42:11 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so780026a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 11:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715712127; x=1716316927; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6ryeUi7qTJoBD/62OgqeYM1G6ocyge361mggTj3ews=;
        b=hbEdpmvl/xKN1OCHspkgrjc+IEdXXvBa0/Nn4cbXoWdpDww+7wcelFoKtG2JwtphAy
         Mc7A594SpsinGPLRqIm3gyw7h+LLhlhnZOOc18MhdqPdak0U6FrFGg+DDc+Q6a4OntQ4
         A1QiCJ1SDCu/Ns3+DiRgks6G8WpDtvtZfKhMyiinGHKcS2TGATcMslOjhJGkZ8qi2qfB
         lPI7bdjRrM2UFp28DPxslWb2ScBG/xiyRuAWVJ+6O0rpPDQU0O9ucbcuHZVUiqexMmzn
         6Bf6orA21xKqnDhY2X4Gal2yiaCKCWDzg5NId4B0MugW0PX5CVBX89g97WYKQ71BdIOW
         TpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715712127; x=1716316927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6ryeUi7qTJoBD/62OgqeYM1G6ocyge361mggTj3ews=;
        b=Ag+N2ZZCVrcHb5QeWCxZWl9ddTxJUBQiPIZ/sarRpyKWzPXM7/hdc4W/niOUXjoJoT
         R6yBc7NLbh4dkFM3At2VBAmUQa2rhXS+V72Bz8hna2DCas1HsHkWrrME7GvUhPJPnDPy
         Eeyv6QjesACzTk4ly0Z0A7WZRWg8PfjmQBl9LSOQwP6xdESRPbARt7jajo6ee05lODZE
         PPUUXd0OK8l7vePGvTYfz80AdkNzTxzUSoweerWztXoOoI5ebf9jVaW+DpKYi26WRoJ4
         aCXeANViuxGKwsP9AGzk/cHKkaDGFddBoKT0W8AcirRlFcjM/nnvcCt3P8EaHcJyi2aZ
         O3GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ0t1Y60sFoEV01xFDGc/r6vDu4+/PUn7y+oBK+sEccerZ+IJLdgTYBsNBOGsqp3pXkR/kkmrPym7ebGEV9ycYNM9EG7JzErnk9RRNolk9
X-Gm-Message-State: AOJu0YxE9Wz3Q05Gc5P6vWvtsaIdFPnYfgHsa1HYM9gmfzYHzZJz58ws
	TGdupwa8Nn6I+Vr/0z+Yh3B9UtNBrsMgScz7a8SEmdeWW+39fUvN57OCdxjNI3pGM4ySdOc2fFZ
	hZEHLNfnUMbCIk+5zeSH3J4jgSFxTlqb1kbz9Jg==
X-Google-Smtp-Source: AGHT+IFbMwiOYUAb7e/8vZthTHtvmc7pKqYbGlejzDyPWTizt9LTFfXax18by9Z28FgBfafwz7WSCj7y4vYaV87ykNE=
X-Received: by 2002:a50:9b05:0:b0:572:47be:a81e with SMTP id
 4fb4d7f45d1cf-5734d707234mr10945519a12.40.1715712127280; Tue, 14 May 2024
 11:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240514140446.538622-1-bjorn@kernel.org> <20240514140446.538622-7-bjorn@kernel.org>
 <CAHVXubi6Hv_FCTi=a5FFoxqiUBucrX_NhVGBAWE6qXRXdzOYsA@mail.gmail.com> <87r0e4l0m6.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87r0e4l0m6.fsf@all.your.base.are.belong.to.us>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 14 May 2024 20:41:56 +0200
Message-ID: <CAHVXubhbckKD=z74_Y+uukf4FQodnz4-fNdB94fK9OK++xz=nQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] riscv: Enable memory hotplugging for RISC-V
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_114210_475084_8F1E5203 
X-CRM114-Status: GOOD (  15.74  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgMTQsIDIwMjQgYXQgODoxN+KAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMu
Y29tPiB3cml0ZXM6Cj4KPiA+IE9uIFR1ZSwgTWF5IDE0LCAyMDI0IGF0IDQ6MDXigK9QTSBCasO2
cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Pgo+ID4+IEZyb206IEJqw7Zy
biBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiA+Pgo+ID4+IEVuYWJsZSBBUkNIX0VOQUJM
RV9NRU1PUllfSE9UUExVRyBhbmQgQVJDSF9FTkFCTEVfTUVNT1JZX0hPVFJFTU9WRSBmb3IKPiA+
PiBSSVNDLVYuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+Cj4gPj4gLS0tCj4gPj4gIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDIgKysKPiA+
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4+IGluZGV4IDZiZWMx
YmNlNjU4Ni4uYjkzOThiNjRiYjY5IDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZp
Zwo+ID4+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4+IEBAIC0xNiw2ICsxNiw4IEBAIGNv
bmZpZyBSSVNDVgo+ID4+ICAgICAgICAgc2VsZWN0IEFDUElfUkVEVUNFRF9IQVJEV0FSRV9PTkxZ
IGlmIEFDUEkKPiA+PiAgICAgICAgIHNlbGVjdCBBUkNIX0RNQV9ERUZBVUxUX0NPSEVSRU5UCj4g
Pj4gICAgICAgICBzZWxlY3QgQVJDSF9FTkFCTEVfSFVHRVBBR0VfTUlHUkFUSU9OIGlmIEhVR0VU
TEJfUEFHRSAmJiBNSUdSQVRJT04KPiA+PiArICAgICAgIHNlbGVjdCBBUkNIX0VOQUJMRV9NRU1P
UllfSE9UUExVRyBpZiBTUEFSU0VNRU0gJiYgNjRCSVQgJiYgTU1VCj4gPgo+ID4gSSB0aGluayB0
aGlzIHNob3VsZCBiZSBTUEFSU0VNRU1fVk1FTU1BUCBoZXJlLgo+Cj4gSG1tLCBjYXJlIHRvIGVs
YWJvcmF0ZT8gSSB0aG91Z2h0IHRoYXQgd2FzIG9wdGlvbmFsLgoKTXkgYmFkLCBJIHRob3VnaHQg
Vk1FTU1BUCB3YXMgcmVxdWlyZWQgaW4geW91ciBwYXRjaHNldC4gU29ycnkgZm9yIHRoZSBub2lz
ZSEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
