Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E50FCCD193
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 21:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8SK1ufh8IgQ3f0jr08v93TBRTpM6fODsFLuE39pS27Y=; b=GR0s7c4J2vii1h
	L2M+9eIfpzpxZIiJiX1swjlvlCY6QUHaxI+kWGjQQ65HetZQf49PYpDblQknjmNGfv2G5rlsC0q1Y
	OVZMWr9yXFWhCoNGtqe9LNVlfOhKoJTRp/xZbj1cInqlupvAK0JJ9wERIyZuBLmt3H9ZtQjL6Zz7V
	CivDDWj4YsNKFjlITz9e95AoAZdCDNqRrNVJxxoWCFnrjZ5Pai4k1gpuMD67pRFIrtvfjO4TkCJ5/
	s0wxdZsx69r3Xg3z3MetF9FQnXLNen4zfoEf+QovCWwF83RJ6dGftg//Mll+jPdzAKxDn5Q9sCYfV
	1h9t6T4OYzgg8seucwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2ht-00000007cxm-3zMr;
	Thu, 23 Oct 2025 21:18:49 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2hr-00000007cxS-1rfq
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 21:18:48 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b3c2db014easo290222566b.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 14:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761254325; x=1761859125; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zqdMx4BWZftJP4zcBY1Z5+B4QE2/WdMi8WQpGousUlE=;
        b=RA2UmqC7ZuqQAlmZbPyaWNAH2tltT42Q2TMNkmLecRk5v9yG+mmDMgvsSS9jgAa2jC
         +F82gRglORhdKlpcaObQW8+tlgCdENXbl+AFnzr1Ak+mNtFXN3yahQMUkMpt2M1Xg0s8
         vz8EtUIO2efM2sjjmmW7x7BGpLD4MjphpgwT7KJS/lI3U2yQvVzVNrnAqLlolwETvj2Q
         NivwRFtYABHs1pnWyqm86yczwN8d69L7K/FYzCF87r5410Egne4nMbH9RrpX3umbrXcH
         KNES9/DG2qyYLwEplcRsBn9EGeThj7A7QKrYy7F648WlyW7ijdG8gF/lgqoew/XOFkHC
         rXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761254325; x=1761859125;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqdMx4BWZftJP4zcBY1Z5+B4QE2/WdMi8WQpGousUlE=;
        b=MfeaohvxJDaQZ6b2dpzcMPjVNnwTV9tr3YTQidRedJp6Aks7HzIE0rBDHbBWdxpOeU
         2di619fm2IVocU3oHxxT8Wu7abgxLNbrV+qcwWLFJPDIvhm47icQzhWshLnZx9Xv5gxd
         plvXDKW3K9OXMASHeDUoV9Xtn7LSRosL8eupXUk5hg3RluFg7L8JtEfhHz2+L9xYxsx9
         4Uflo5k2CewJ1dwa5Xw6t0Yhin3qI1wHL+D3aXM+uCC5iXxT9qWUE2g4olrU6TaAJpPx
         r1UqouNQjrbkxLHvIw0dnrffx/9+YMu3PROwWTWqpMHj6EJgf6WabYB5STjI1ICv1QJK
         2O2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkRshvbrriekUb7EBUyv+fAQNr9x7MR/SrR5ZNkBp2/+t04v057Y4pxHQblvV4nDDuWkRq0V2hiQDMqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMuIN2dH9bhqc2PJFJhSyyfcdpSjWr3SFpvrthnJgyx4yy3zJo
	LNaNWIrNunsGa7AGPp1YGTxHDxbmJQogkvkufddl3AQidwlPd8sdpiwW
X-Gm-Gg: ASbGncsXYpSm/Kwjxdug8poej/4zHEb1x7v5tcoUudCZ2sFxPnvOK8OcKc2d0c1nw7o
	luYWF6wbtxzbWnTq+hZ2QqM29hEBmFh3Lftv09VdXcY7VAA3rCFmxR2D8Jl7OhBHKyzlnhh9ZKA
	q8WQnTV1WqXT0wyNCWWLqnURCS2HdiYong/cza1caV+Wn4tLPnR5LuAvvQiGM/5v81H5UWuEJax
	Cb+Nvq7gmyYR2gRwpGWe346xqsTbS7Po0j+MCKzp7FOG48iaTUCj7F+XutoV0NJH/c0IIFgguaR
	5X4cz9Uxr23tRJQwNNB+QWC8s9szrGmxBOLXvVjK3MvC13t1A6C3M+c6zX4JoLYsu+HT6Lhn8oI
	NCFVu8EdQWaPEEnH54PPS+nuosWeN1Cb8KBYl42X/rWOupQl2vwUqDps3Xl0yM2+SuyzifpDgYs
	w8YU0wZ8PbiQNtpeTDiFOpMeXeuwbvPPjCQ75RNP75LFcb2X10+FbhUg9u96fqpug5wV+xSEXd0
	/cJxg==
X-Google-Smtp-Source: AGHT+IHwxspN3hm1IKB4H9V+c3IpDHqztSqky8Q11VvJkuMeM6pHmJx5hJJAnadnKwijqWeRSs5KTw==
X-Received: by 2002:a17:907:9415:b0:b6d:2d0b:1ec2 with SMTP id a640c23a62f3a-b6d51c3132amr473461566b.54.1761254324927;
        Thu, 23 Oct 2025 14:18:44 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144ece8sm310786266b.68.2025.10.23.14.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:18:44 -0700 (PDT)
Message-ID: <cd436879784d6843a32c12abff9f9a60d4c6da93.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] riscv: dts: sophgo: Add syscon node for cv18xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Longbin Li <looong.bin@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang	 <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>, Paul Walmsley	 <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Thomas Bonnefille	 <thomas.bonnefille@bootlin.com>, Ze
 Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Thu, 23 Oct 2025 23:18:43 +0200
In-Reply-To: <20251020083838.67522-3-looong.bin@gmail.com>
References: <20251020083838.67522-1-looong.bin@gmail.com>
	 <20251020083838.67522-3-looong.bin@gmail.com>
User-Agent: Evolution 3.58.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_141847_511367_BD66396B 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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

SGkgTG9uZ2JpbiwKCk9uIE1vbiwgMjAyNS0xMC0yMCBhdCAxNjozOCArMDgwMCwgTG9uZ2JpbiBM
aSB3cm90ZToKPiBBZGQgdG9wIHN5c2NvbiBub2RlIGFuZCBhbGwgc3ViZGV2aWNlIG5vZGVzIGZv
ciBjdjE4eHggc2VyaWVzIFNvQy4KPiAKPiBDby1hdXRob3JlZC1ieTogSW5vY2hpIEFtYW90byA8
aW5vY2hpYW1hQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMb25nYmluIExpIDxsb29vbmcu
YmluQGdtYWlsLmNvbT4KClN1Y2Nlc3NmdWxseSB0ZXN0ZWQgaW4gaG9zdCBtb2RlIG9uIE1pbGst
ViBEdW8gTW9kdWxlIDAxIEVWQjoKClRlc3RlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4
YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgoocGxlYXNlIGRvbid0IGZvcmdldCB0byB0YWtlIHRo
aXMgdGFnIGludG8geW91ciB2NCBpZiBpdCBzdGlsbCB3aWxsIGFwcGx5KQoKPiAtLS0KPiDCoGFy
Y2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgweC5kdHNpIHwgMjYgKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCgotLSAKQWxl
eGFuZGVyIFN2ZXJkbGluLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
