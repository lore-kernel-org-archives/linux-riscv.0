Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EF5CCD1BF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 21:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/wLxUiCivQ6x05dD00Okugb1XN+qsT4dDyX6iqZaq8=; b=CKlAmHIk1GlUpg
	8iAKiyz7DiMXg4RUcFsqdG13/rdHmI551UK5/icPNAgwCXueN+V4mDCbrxAsT8HSWAPR+VKFdZVms
	i7sA9pT4QbS7SQkygjeDdno0OIctsw27LHyIBCuO4Fq5hxtlGK1pJh0tTIETwqzx1X96iWHO2SXlO
	vGNHb35h8KG0d1uTX8VuuGfeAEpCJf1FYtAFbZQKc2O9vihf8gqRPMZZ2nnGyMCmRvuxKbqjdMzju
	cTMgLBio+VhJmMykeP9WV/7Ndaw44kmfbEOOTP5s3vQHXmrv+8Lyme7n+WbIW6G0DTa5fQqvTSEsS
	JYtLYRbYa725HjZ03+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2ik-00000007d3r-1WnW;
	Thu, 23 Oct 2025 21:19:42 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2ih-00000007d3H-3IuK
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 21:19:41 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so292254366b.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 14:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761254378; x=1761859178; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ei9tWnP6+7R+pnEA92XXsitmlozCSw49trfMXT8LTVk=;
        b=WP9rfC84MyM04W3orIS9QtkWgP6wqzXEIKrukI/lBfeYgCOy6fEsKspRo0aqUpTByC
         oaxvZaRI9m3IkmpPE6Af7KgjICKfcSmguT2mx2XRfELBIC7giJF+B9m1SmswxLb0r77i
         ZeoVVMBqW5d2fqk3TSpPznzEv/WU6zTr35h7K8PnnScL5Gir55CfnYhxZ43QR5Hdr3HM
         CCnJeQJKCAlYwoGHqWc4IgA5JKZeQSGy1u1j1nkBoL8niTDz2vHN+w3Cy/VSCk5vZREv
         3vIPdLQ00XQKbVP6JkziEA0Ou/ZgXMbqaqVYlfwF1O+iwtGANeJwDIkbV11KUQWB9DYi
         avfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761254378; x=1761859178;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ei9tWnP6+7R+pnEA92XXsitmlozCSw49trfMXT8LTVk=;
        b=faE4d/cMXGupBH1dIE/Eymavs+uWp3bNufYrajNF8FgSZw9oikQb8Uv8n9iQkzdFuk
         0Bt1oiebZlhNdTnL4ipVCxENHLg4A2GmS2IR8TIgXFi+Ls+zftcLL+JsO+MUFSUmI3Bh
         uUxyMREouHnUDSOvAd3BCDSLLoekQoyTXiWh058k7YP7pMPhqd0or/Nr+fC+7qyj3t4I
         VtOMLeCz/rPq3CocHCcy8ncxXC9D0Giy02YFMRlP8PJFnKIxr77S7DIq8oMcu+AApxMr
         FbJX+G9HjZ6989QjN1s5C9VPwXSB/LbaausAmSgzyNe85ZWTeRr8fD2qp+1mhDieI0Uz
         wnlA==
X-Forwarded-Encrypted: i=1; AJvYcCVh2RNJT2pCqE9i4zOU8odhFUV9L4T3OfGQefyKJj8B0CTwVN5unWKWkqiWecBMcE7KzeWryToOMPLhjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLIDyD4qSAXX+QhstfEtD0evC0/mdVeZ4wT0zsANmXci6PLACQ
	Em/PuHgOqADdTj3RCTz8hcHcbhkgDzqxIY46enh4cen7Ai2yfedNkTUQ
X-Gm-Gg: ASbGnctshCckg4/dFOwcOOqeiqTLLSUNhjVhiO4LYhaCBx5q9LF0+jPKcn1pgdO4tiE
	m4lSFwTc0LBlBhhX1q68D6RyaCXH6wv2+aLln9HYgYIHXSy87TeYmH06psqxo2xSNRJHwgKyaH0
	1mMsHvDnO86rAFroSOg+wVMceYz7mE6Nydv02d2Y4TT6HIfvmTbssyqxSrtIUpZ1Gz40w0DEHR6
	1XKgxzBMz7njz8kim4IncA6lzEsIyljvcrCai1mAIpAfiJ7sE/Dx6lm2icuP20muejjCz3bTTjC
	T4971XU26Z6TnNz6yyboBd+fz8uVH5ca0uxRIo2up11BitHVs8NieIeqdVv5SsONC3Eu7GHKw4X
	OuI2lj9+Z/6hr4BeUzP9h4ad7j6DiARN7uSILfWNhc/FnK8QTqEU/eZB8uWYACQKtWmZnFQiVhS
	aH+6Gx9VaMFYPtCuucIo2QMJo2MRXeZJ+MNp4dgZAVGkrUThP+1f6OjDi4
X-Google-Smtp-Source: AGHT+IH0ilIhNZdTBWk7XhboQCM74tx7jK8m/eLziXPEBEYUaJoG0DUF30XGDfE2ZBdmNNzQKYsHEQ==
X-Received: by 2002:a17:907:9810:b0:b6d:6b56:bd7d with SMTP id a640c23a62f3a-b6d6b56c15cmr55871566b.16.1761254377896;
        Thu, 23 Oct 2025 14:19:37 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144f786sm308476866b.59.2025.10.23.14.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:19:37 -0700 (PDT)
Message-ID: <d0af71bf7db6743dfcd0c53c2eacd32c56fa5b6e.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: Add USB support for cv18xx
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
Date: Thu, 23 Oct 2025 23:19:37 +0200
In-Reply-To: <20251020083838.67522-4-looong.bin@gmail.com>
References: <20251020083838.67522-1-looong.bin@gmail.com>
	 <20251020083838.67522-4-looong.bin@gmail.com>
User-Agent: Evolution 3.58.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_141939_842334_3313DAB7 
X-CRM114-Status: UNSURE (   8.48  )
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
aSB3cm90ZToKPiBBZGQgVVNCIGNvbnRyb2xsZXIgbm9kZSBmb3IgY3YxOHh4IGFuZCBlbmFibGUg
aXQgZm9yIEh1YXNoYW4gUGksIG1pbGt2LWR1by4KPiAKPiBDby1hdXRob3JlZC1ieTogSW5vY2hp
IEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMb25nYmluIExp
IDxsb29vbmcuYmluQGdtYWlsLmNvbT4KClN1Y2Nlc3NmdWxseSB0ZXN0ZWQgaW4gaG9zdCBtb2Rl
IG9uIE1pbGstViBEdW8gTW9kdWxlIDAxIEVWQjoKClRlc3RlZC1ieTogQWxleGFuZGVyIFN2ZXJk
bGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgoocGxlYXNlIGRvbid0IGZvcmdldCB0
byB0YWtlIHRoaXMgdGFnIGludG8geW91ciB2NCBpZiBpdCBzdGlsbCB3aWxsIGFwcGx5KQoKPiAt
LS0KPiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGItbWlsa3YtZHVvLmR0cyB8
wqAgNSArKysrKwo+IMKgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODB4LmR0c2nCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDE2ICsrKysrKysrKysrKysrKysKPiDCoC4uLi9yaXNjdi9ib290
L2R0cy9zb3BoZ28vY3YxODEyaC1odWFzaGFuLXBpLmR0cyB8wqAgNSArKysrKwo+IMKgLi4uL2Jv
b3QvZHRzL3NvcGhnby9zZzIwMDItbGljaGVlcnYtbmFuby1iLmR0c8KgwqAgfMKgIDUgKysrKysK
PiDCoDQgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQoKLS0gCkFsZXhhbmRlciBTdmVy
ZGxpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
