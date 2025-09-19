Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE86CAC592
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 08:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=za70UUjc3cRYJj1ALDgBivLWf9BOlQYWAZrZOxqpYCM=; b=n3jjoITn/Je2mU
	24Z0lGTqDYigrITL+Ilnm+ECFSKaaeNlCnwM166MXIFWmE4t3uJ10VO4deozMbt75MQ+qyQ6wvG4p
	8AGp1vtufg2m//G7PUwXoXt7hnUTqg+iKOG+VFqzINi21J58+x8ZeDYUidGF3ITY0kWDaDRPF2RLj
	yaqg221lUQ4s50FRZSdJjulBjElxW4HN9PWGq4Sv9R/sn4eTKZgocJ4+l3TdGvCEBgK/97wG5GIIA
	DKAKL/pGCbJIl1lhUXNIFJk2UgxNtwQrSMMoADScUgrWJ70o4UcxcC9msf+SkUas58AQt1vC4k0Og
	SCIgTJTnX37U3p4saONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWNo-00000002Ehy-3OuD;
	Fri, 19 Sep 2025 08:22:20 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWNn-00000002EhW-1WZh
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 08:22:20 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32e64d54508so2210684a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 01:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758270138; x=1758874938; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA229zalAfC82US2zOC74f9JOHn8lbCuhIfoOdDNZds=;
        b=XOfOpKYjHQEzSXAhMTCXvIHXc9b9Ac8DYt8CcDvAcYZ8s4Sp+TlEjhleVdw3WxZ7lT
         fZyM3/F9aBNsDMyhBJIpP1HUtl3NFtwnA/3EM8pYmNP5xfxkf1jZIVJGLFOHHYHqJoXk
         WARsEeKfb6cBGE0C5uCo4M7JfozH3js3hUnc+iQ/FaBK2QIT53NsvIVJMD9BkYjK/wJU
         BTVaFf55XG2grQE5mOilfkrKUGIMNI1MKxJuY1nKw/d7OUEx+2dKXYO9/ZcWVITVxml3
         mss12T0kTz3IkM622KdNY6v0zdletpqoD6NWSiTajGJsRhmocXCquuykJXwsC91aOZsx
         EQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758270138; x=1758874938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qA229zalAfC82US2zOC74f9JOHn8lbCuhIfoOdDNZds=;
        b=iRpeF69JjkZGgKysovq+5TA62fAEHLiJds8Ktj8FdmmwIuiCejzBSvscsUZn6oXfK0
         esB00bt4dOv3q/nxmSCj2OjHO9pYPQ3AJJUpE7hu9cP27rF11VUCuuxRWN/xDmitQ2V1
         ePBRm2kltKnmWQOf9En7sF5L27fGh2A/J/EwjH+dGHo+De5bgxvxswSf+0Faph17OtX6
         WDseF2eHy9utk4QTHoeMQzNyNJcksvPPLtSjCGBP9oYwHRnhg+foBkzrZkGEd1sU3Lj5
         Jtjx8hhNkClf/cFGgBStN0sh6sHrC5TeD+e0V0/lB5aEtsn8NM5FpZw1yRmVe42I3m98
         5daA==
X-Forwarded-Encrypted: i=1; AJvYcCVh5N70cvxvTuzsLlhgtoicm7FBUFG7rNoBeOC2ERNY5OkPUrFb+J0Nj3YIeXwUYB2gj6N728CovaMVtA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOhhJulrzrOLe8AcXdevfhlJuDWu9hebC5l4kK5kx2sU8mXugM
	N1FUjZsG7/wAk2SgkfW5B+k+VkJ9p+SOcr6G6dO7mRQGT7vDkNqGgFSvI3bUr8gauFf3ZBYUY50
	8OmVx9iI05uAxGRWA8i+3nrDKORnFYb9AgjnJ9LhazQ==
X-Gm-Gg: ASbGnctb8BJMeSC660ythyZUkXK0sYZ4sohozjCoAIBfMbjW5RwMb3o2WJhpL7blZU2
	NzkNqmTXwlw7IvKiod/MitgVz3j7cwpDRXNmwb5YBWGbOypIrOL0bqjLwIigSRNnIq10I3d98Pr
	b7SCA8xTsUCVGX1FEAMx8OV1BAuOExDf9pLV7ZCOUsVN8OdIx0xuFdxPlwHuJVUYCYUOKNkA7jq
	gIQMu4MU6Xr2rD6gvZawjQqlfS/t3YSBgZhV+CG7k5pLnb3DLzB
X-Google-Smtp-Source: AGHT+IHc9AWs5Zj9Vq2lAb4i6JpeGzmbWNqHiWZsrwK3aNRHtAtv4I0vOi+7LdQMJACXH26JvU5yGr9y2p46N9fxlYA=
X-Received: by 2002:a17:90b:2d85:b0:329:ca48:7090 with SMTP id
 98e67ed59e1d1-3309838e108mr3158820a91.37.1758270138410; Fri, 19 Sep 2025
 01:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250902042432.78960-1-luxu.kernel@bytedance.com>
 <aLciY2putG8g2P9F@andrea> <aMoyntAydNMtcl+3@gmail.com> <aMw3504EwlnDOJI0@gmail.com>
 <CAPYmKFt=5=t_nxY4FadG0_vSgAu1tXyO15OCvo5x6QorqM+BAw@mail.gmail.com> <aM0KBwkdPFD69oui@andrea>
In-Reply-To: <aM0KBwkdPFD69oui@andrea>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 19 Sep 2025 16:22:07 +0800
X-Gm-Features: AS18NWArXT16D1shMWryTOVEhM6i5ozD0QlpBXKJKcBDG2L55VaJoxbihBeMmRQ
Message-ID: <CAPYmKFt7pDEDAb2yVyTfKCQh7iEM1VPNdq_vEMoYFDU2cavfGw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 0/4] riscv: Add Zalasr ISA extension support
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Guo Ren <guoren@kernel.org>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com, 
	brs@rivosinc.com, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_012219_406296_119F9D87 
X-CRM114-Status: GOOD (  11.40  )
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

SGkgQW5kcmVhLAoKT24gRnJpLCBTZXAgMTksIDIwMjUgYXQgMzo0NeKAr1BNIEFuZHJlYSBQYXJy
aSA8cGFycmkuYW5kcmVhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IFRoZSBleGlzdGluZyBpbXBs
ZW1lbnRhdGlvbiBvZiBzcGluX3VubG9jaywgd2hlbiBmb2xsb3dlZCBieQo+ID4gc3Bpbl9sb2Nr
LCBpcyBlcXVhbCB0byAnRkVOQ0UgcncsIHJ3JyBmb3Igb3BlcmF0aW9ucyBiZWZvcmUKPgo+IFRo
aXMgaXMgbm90IHRydWUgd2l0aG91dCBaYWNhcywgdGhhdCBpcywgd2hlbiB1c2luZyBMUi9TQzog
d3JpdGUtdG8tcmVhZAo+IHJlbWFpbnMgdW5vcmRlcmVkIGluIHRoYXQgY2FzZS4KClllcy4gVGhh
bmtzIGZvciB5b3VyIGNvcnJlY3Rpb25zLgoKVGhlIExSL1NDIGhlcmUsIHdoZW4gWmFjYXMgb3Ig
WmFiaGEgaXMgbm90IGltcGxlbWVudGVkLCB3aWxsIGJlaGF2ZXMgbGlrZToKCiAgICBmZW5jZSBy
dywgdwogICAgc2QKICAgIGxyLncKICAgIHNjLHcKICAgIGZlbmNlIHIsIHJ3CgpUaGUgJ2ZlbmNl
IHJ3LCB3JyBlbnN1cmVzIHRoZSBvcmRlciBvZiBvcGVyYXRpb25zIGJlZm9yZSBpdHNlbGYgYW5k
ICdzYy53Jy4KVGhlICdmZW5jZSByLCBydycgZW5zdXJlcyB0aGUgb3JkZXIgb2Ygb3BlcmF0aW9u
cyBhZnRlciBpdHNlbGYgYW5kICdsci53Jy4KVGhlIG9wZXJhdGlvbnMgYmV0d2VlbiAnbHIudycg
YW5kICdzYy53JyBhcmUgYXMgZmV3IGFzIHBvc3NpYmxlIGFuZApjYW5ub3QgY29udGFpbiBsb2Fk
IG9yIHN0b3JlcyBhcyBpcyBzYWlkIGluIHNlY3Rpb24gMTMuMyBvZiByaXNjdgp1bnByaXYgc3Bl
YzoKIlRoZSBkeW5hbWljIGNvZGUgZXhlY3V0ZWQgYmV0d2VlbiB0aGUgTFIgYW5kIFNDIGluc3Ry
dWN0aW9ucyBjYW4gb25seQpjb250YWluIGluc3RydWN0aW9ucyBmcm9tIHRoZSBiYXNlICcnSScn
IGluc3RydWN0aW9uIHNldCwgZXhjbHVkaW5nCmxvYWRzLCBzdG9yZXMsIGJhY2t3YXJkIGp1bXBz
LCB0YWtlbiBiYWNrd2FyZCBicmFuY2hlcywgSkFMUiwgRkVOQ0UsCmFuZCBTWVNURU0gaW5zdHJ1
Y3Rpb25zLiIKClNvIGluIHN1bW1hcnksIHRob3VnaCBpdCBkb2VzIG5vdCBwcm92aWRlICdmZW5j
ZSBydywgcncnIHNlbWFudGljcywKdGhlcmUgaXMgbGltaXRlZCBzcGFjZSBhdmFpbGFibGUgZm9y
IHRoZSBDUFUgdG8gcmVvcmRlci4KCkFuZCwgc3RpbGwsIEkgdGhpbmsgY2FsbGluZyBzcGluX3Vu
bG9jayBpbW1lZGlhdGVseSBmb2xsb3dlZCBieQpzcGluX2xvY2sgb24gdGhlIHNhbWUgY29yZSBp
cyBtdWNoIHJhcmVyIHRoYW4gY2FsbGluZyBzcGluX3VubG9jayBvbgpvbmUgY29yZSBhbmQgc3Bp
bl9sb2NrIG9uIGFub3RoZXIgY29yZS4KCkJlc3QgcmVnYXJkcywKWHUgTHUKCj4KPiAgIEFuZHJl
YQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
