Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19606C46CD2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 13:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=63WzUXcF89lOF8gkrgsPdxMPsqYZ/AQv9BdlRLELndo=; b=zw5iTYoAm6RswFBpJwUoL72jNA
	8CiQuDsnP0HPx1wFLH9QYHzLN18HjPMTOM95BLyLYmDmv4CUTAWjqd8WMNQAglBHI9BcEigfhCZgH
	OCi9JyVzH9tedkyl5TOy6ly7yKHUEdtNe5+ZBdqS+nHJ+wUHjm6Iwpv8wjVHaVleJVX29lBBmnczi
	s2jCmjQlZ58ffl55zCij0ScglZfSZFkYot/29nREqx6Lq1A3nbY6C9OFjetdgG62KKuaE/EeIjvSq
	hS+q5azmG/OxAV4Eox9lfWCuqCrvqgd8KmcEwf1aA9WNj59vInzGkhAt8SVxOnvejMAXP/Ia2lvJ/
	VY7oJucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLk6D-00GxDH-0z;
	Fri, 05 Jan 2024 13:18:57 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLk69-00GxCq-2b
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 13:18:55 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D5CDC3F5A6
	for <linux-riscv@lists.infradead.org>; Fri,  5 Jan 2024 13:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704460727;
	bh=IFg9X0cw6KEOe6IAlb6C60OWnstZjElkbRUwRAxmfko=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=KMYooUB6xYtsb9ZERwx38qH2lXDHtvE902FQ9/f/HTeM3wwpDC5XngqS9yHVvN3hU
	 z55KDtNoZaehYCNG4OpiUFlzuVo1TJw1Gt9M+Jf6HJzqFPK33RaZaivoDhv4fFwrtt
	 5704BAE8ALDJ4l+LA7x35TEolbcFvRKJzIKe9oZVxUwqC+bvwYR1cXuAtejjUMRKSd
	 827hOwsildQVSgqNtShYcpzrJeX1O1uaA5N4eUdNZHA/PhO6LX+MoFr6sj/d6qQ62c
	 yt80Ih508K5JhIICIZiPSGJqdFZlvqKvbF9jHRAYZSxKcHp3Xv3WP6yhQK9URnIBhi
	 eWFpjhmIfejvw==
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7830b908355so58708985a.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jan 2024 05:18:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704460727; x=1705065527;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IFg9X0cw6KEOe6IAlb6C60OWnstZjElkbRUwRAxmfko=;
        b=SPz7/i+Z2Iib58UHN5/eRbC6xg9ZhePHQeRJsCZaLBj8xFekeYfzZSkLZp0ViBmI8J
         Ok3Qy+So0wHGgeg1IaTv/AhADxm65JkMolAjCkWkDh1u2yAx7exbFsRqAR2pX5ogRaGr
         iXJ8zuesLivIiJvaImEUak3H0hmnsVxDcoPNCmOO+dUhXO0sYPGrly3Aw87Jpfczuk7t
         mwRPYzEsdVCOhq98H13WjuTFBUS6bvlBFjzqywkWjRp2KFbHAeQUR1+w/YuIfsHFf2PL
         o3hnhgAR4Nxq3eJEgEGKmT2Z9j+dlgS3ri6sir4wbIVKBQM26dRCOXIK6NIKu0+e3exl
         Y+sQ==
X-Gm-Message-State: AOJu0YyqJCXIanV8rgG+s9cdaB7EZSB10RY4imfTkoWvaKRY98511jBI
	jqAtJTwZ5+HLQlOCsxRS6GGJO9y8QIuePHqkXx2f4+U0jOL7v3LGP2uGR/BY57rd/08umqo2fNq
	FibtcFbxu8A9/yk5wx0kG6bsfwd2HkFWYYKcmsRrsYabb6xe3uaT8vvt3J6+OuLa32m9d
X-Received: by 2002:a05:620a:178c:b0:783:de7:f55c with SMTP id ay12-20020a05620a178c00b007830de7f55cmr371569qkb.18.1704460726709;
        Fri, 05 Jan 2024 05:18:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSkJtpgQs5O0P21kOkQPotDAvI+IaEL+Pr5+euH6U094hbx+AkrsKTiUrqQJPzpV5J68/IEZ11z3+15L/lAVc=
X-Received: by 2002:a05:620a:178c:b0:783:de7:f55c with SMTP id
 ay12-20020a05620a178c00b007830de7f55cmr371543qkb.18.1704460726480; Fri, 05
 Jan 2024 05:18:46 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 5 Jan 2024 05:18:45 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <xd2ryic6mr6d6cbljjbhmr56mfpchfzkmc3lnznhmoiwyzip2a@6bhbho267e7c>
References: <20231222094548.54103-1-william.qiu@starfivetech.com>
 <20231222094548.54103-4-william.qiu@starfivetech.com> <CAJM55Z9tyrR7emEBrY0+Fnc_LUFQHkqYHLQ4ptL=XQMy52qtVw@mail.gmail.com>
 <xd2ryic6mr6d6cbljjbhmr56mfpchfzkmc3lnznhmoiwyzip2a@6bhbho267e7c>
Mime-Version: 1.0
Date: Fri, 5 Jan 2024 05:18:45 -0800
Message-ID: <CAJM55Z9DgFCwXjQGhe+urnOg-AkJMbQUR+biXKONQsRcup1GXw@mail.gmail.com>
Subject: Re: [PATCH v10 3/4] riscv: dts: starfive: jh7100: Add PWM node and
 pins configuration
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, 
	Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hal Feng <hal.feng@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_051854_248017_6EA0B5E8 
X-CRM114-Status: GOOD (  11.99  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8gRW1pbCwKPgo+IE9uIFN1biwgRGVjIDI0
LCAyMDIzIGF0IDAyOjQ5OjM0QU0gLTA4MDAsIEVtaWwgUmVubmVyIEJlcnRoaW5nIHdyb3RlOgo+
ID4gV2lsbGlhbSBRaXUgd3JvdGU6Cj4gPiA+IEFkZCBPcGVuQ29yZXMgUFdNIGNvbnRyb2xsZXIg
bm9kZSBhbmQgYWRkIFBXTSBwaW5zIGNvbmZpZ3VyYXRpb24KPiA+ID4gb24gVmlzaW9uRml2ZSAx
IGJvYXJkLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBXaWxsaWFtIFFpdSA8d2lsbGlhbS5x
aXVAc3RhcmZpdmV0ZWNoLmNvbT4KPiA+Cj4gPiBTb3JyeSwgSSB0aG91Z2h0IEkgYWxyZWFkeSBz
ZW50IG15IHJldmlldy4gVGhpcyBsb29rcyBnb29kLgo+ID4KPiA+IFJldmlld2VkLWJ5OiBFbWls
IFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4KPgo+
IElzIHRoaXMgYWxzbyBhbiBpbXBsaWNpdCBBY2sgdG8gdGFrZSB0aGlzIHBhdGNoIHZpYSB0aGUg
cHdtIHRyZWUgb25jZQo+IHRoZSBlYXJsaWVyIHBhdGNoZXMgYXJlIHJlYWR5PyBPciBkbyB5b3Ug
d2FudCB0byB0YWtlIGl0IHZpYSB5b3VyIHRyZWU/Cj4gKE1heWJlIGFscmVhZHkgbm93IHRvZ2V0
aGVyIHdpdGggdGhlIGJpbmRpbmc/IElmIHNvLCB5b3UgY2FuIGFzc3VtZSBteQo+IFJldmlld2Vk
LWJ5IHRvIGJlIGFuIGltcGxpY2l0IEFjayBmb3IgdGhhdC4pCgpZZXMsIHNvcnJ5LiBUaGlzIGlz
IGFsc28gbWVhbnQgdG8gYmUgYW4gQWNrIGZyb20gbWUuCgpJIGltYWdpbmVkIHRoZSBkdCBwYXRj
aGVzIHdvdWxkIGdvIHRocm91Z2ggQ29ub3IncyByaXNjdi1kdC1mb3ItbmV4dCBicmFuY2gsCmJ1
dCB0aGUgcHdtIHRyZWUgaXMgY2VydGFpbmx5IGFsc28gZmluZSBieS4KCi9FbWlsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
