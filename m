Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD878EF4ED4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 12:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18RHCLowLHaQIYfAefLSLNMuo81vCH/RcVKDQRWvrS8=; b=hEtkW5qKMumxaz
	O8DS3an3N6ne5sQq4cw7uXQJcA+emayI8bVq3/SHCeTP/+8Pyu46feOWz20W4wtnAzFbv+cTGR97s
	fbOOx5/cJ+lac0HuwJEwPWoYMQIWI6WYWPw8web3WXgX2K6lHhwYPTEMcVkzXyVHqYtkGMhqr1zot
	W8fPYgXNWFry3sw+Cj3N8c6dunu/C4K4UStLO3DSFamUVlmvkAvJPosqDAiOsLBrW0GDl2O60u7Oj
	EogZ/0g8zNNngV0B/avhExzZHoqMs3S09g8XQrPcSDV3s9TApLTNIbuB0ulmcT75yA0+TYmW0Vr2m
	dfC7OqcoREIxLSE2s+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jO7-000000057gc-2kZl;
	Mon, 06 Apr 2026 12:49:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jO5-000000057gG-21AY
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 12:49:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46E1B43F9B
	for <linux-riscv@lists.infradead.org>; Mon,  6 Apr 2026 12:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B9EC2BC9E
	for <linux-riscv@lists.infradead.org>; Mon,  6 Apr 2026 12:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775479744;
	bh=1xKAa+PmppcswDIZ9pTEbngJ2OJ2BeS/GY3dfaa7/T4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g7aj0ce0coQJdeZPkirlUShfaiPIPTIvaqCFe4IrEThY6PEZuCv07crRmwKsd+Uo+
	 xlEgpmYylk8jyPBfW5UrguBqAFg6WWNzgwA62nt0N7pJIT2ilFYf2D2/06pUmORv7T
	 bSeILY7bxzcGRVKxPwgWke/AdLNYqH+VyWRT1uWsmVsik8aqMzSdCgSvgBqml98nnb
	 3HSPxJTXiH/hR7xcuzL3riyKf9P7zX0T6wGu/ch//MdAKL9LtopnaE0Pz5CYBhXC8l
	 aziKq2GXHnG+bpD4DwU9M+s7t7M2WIkH9FE4atkFDopek+OXDRbIlwImZiTr87oaCT
	 /e3Pm1TxFmtcw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b980785a0bfso486652166b.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Apr 2026 05:49:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQw7D3FFWzXwx1tk0/ZxCDC/UtoIWZFLsTr0kdgPPLy4mq4+gtg4qgJt8ZCjFsMPIezLbPyGBj9fm0wQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAXaatmdp5IRU1Sdzj63BLJ2RS2aRxnCW9NBGn+X6UR6PwhdZ+
	HYjxqMi4v7LZfmFlYHuQsS4j9is1ZrZ93PVS5aVCL/1V2qFqzWLbRSNHDprO149ZE8ncHH/1GEU
	GdNmIlGOt6lT21urwzcultEuzWBqgGQ==
X-Received: by 2002:a17:907:9617:b0:b9c:4fa:9141 with SMTP id
 a640c23a62f3a-b9c672a5d61mr620807066b.9.1775479742733; Mon, 06 Apr 2026
 05:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn> <adHofcKAr7C5YCSA@zatzit>
In-Reply-To: <adHofcKAr7C5YCSA@zatzit>
From: Rob Herring <robh@kernel.org>
Date: Mon, 6 Apr 2026 07:48:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJFv3+UJ-bjLGk0i7Wc+spsowCrqQZ_s3P4gN8r1W-Q-w@mail.gmail.com>
X-Gm-Features: AQROBzC4_AzDK3DGYWlPXKw1OmT3onlC3gJu87rKdHQYHaYN_zOxh7MaJpfvdwg
Message-ID: <CAL_JsqJFv3+UJ-bjLGk0i7Wc+spsowCrqQZ_s3P4gN8r1W-Q-w@mail.gmail.com>
Subject: Re: Devicetree spec: Specifying /cpus/cpu@* unit address format?
To: David Gibson <david@gibson.dropbear.id.au>, Vivian Wang <wangruikang@iscas.ac.cn>
Cc: devicetree-spec@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_054905_614683_113A8AF1 
X-CRM114-Status: GOOD (  13.67  )
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

T24gU2F0LCBBcHIgNCwgMjAyNiBhdCAxMTo0M+KAr1BNIERhdmlkIEdpYnNvbgo8ZGF2aWRAZ2li
c29uLmRyb3BiZWFyLmlkLmF1PiB3cm90ZToKPgo+IE9uIEZyaSwgQXByIDAzLCAyMDI2IGF0IDA2
OjA2OjE3UE0gKzA4MDAsIFZpdmlhbiBXYW5nIHdyb3RlOgo+ID4gKEFsc28gcG9zdGVkIGF0OiBo
dHRwczovL2dpdGh1Yi5jb20vZGV2aWNldHJlZS1vcmcvZGV2aWNldHJlZS1zcGVjaWZpY2F0aW9u
L2lzc3Vlcy84NiApCj4gPgo+ID4gSGkgYWxsLAo+ID4KPiA+IFByZXNlbnRseSwgdGhlcmUgc2Vl
bXMgdG8gYmUgc29tZSBjb25mdXNpb24gaW4gdGhlIGNvbW11bml0eSBhYm91dCB0aGUKPiA+IGZv
cm1hdCBvZiB1bml0IGFkZHJlc3NlcyBmb3IgIi9jcHVzL2NwdUAqIiBub2RlcyBmb3IgYSBDUFUg
d2l0aCBJRCA+IDksIGUuZy4KPiA+Cj4gPiAgICAgY3B1QD8/PyB7Cj4gPiAgICAgICAgIHJlZyA9
IDwxMD47Cj4gPiAgICAgICAgIC8qIHJlZyA9IDwweGE+OyAqLyAvKiBUaGlzIHNob3VsZCBiZSBl
cXVpdmFsZW50ICovCj4gPiAgICAgfQo+ID4KPiA+Cj4gPiBTaG91bGQgdGhpcyBiZSBhIGRlY2lt
YWwgImNwdUAxMCIsIG9yIGhleGFkZWNpbWFsICJjcHVAYSI/IEkgY2FuJ3QgZmluZAo+ID4gYW55
IGV4cGxpY2l0IHNwZWNpZmljYXRpb24uCj4KPiBJdCBzaG91bGQgYmUgaGV4LiAgVGhhdCdzIGEg
Z2VuZXJhbCBjb252ZW50aW9uIGZvciB1bml0IGFkZHJlc3Nlcy4KPiBCZWZvcmUgZmxhdHRlbmVk
IHRyZWVzLCBPRiBlc3NlbnRpYWxseSBuZXZlciB1c2VkIGRlY2ltYWwKPiByZXByZXNlbnRhdGlv
bnMgb2YgdGhpbmdzLgoKVGhlIG9ubHkgZGVjaW1hbCB1c2FnZSBpbiBGRFQgd2VyZSBtaXN0YWtl
cy4KClJhdGhlciB0aGFuIHdvcnJ5aW5nIGFib3V0IHdoYXQgdGhlIHNwZWMgc2F5cywgcGxlYXNl
IHdvcnJ5IGFib3V0IHdoYXQKdGhlIHRvb2xzIGNoZWNrLiBVbmZvcnR1bmF0ZWx5LCB0aGlzIGlz
IHN0aWxsIG9ubHkgY2hlY2tlZCBmb3IKc3BlY2lmaWMgYnVzIHR5cGVzIGFuZCB0aGUgZGVmYXVs
dCBpcyBub3QgY2hlY2tlZC4KClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
