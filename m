Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685B4C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 20:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvCFqGO0Mq5C/XuywKy6pjRP8IPwvwTkshIHIIINWjE=; b=IuLr6CLCEqCrd1jIp1Oi981zTM
	AX5WGNGkZf1NcrOLvidIITVhHktex+nm25EZ0rZ8iRWkTXdV0dDjCUZDN95HgJd9E4GC6r0fFQJY+
	SE+Ir2G8kiHpyUo4MFn4DzNrriq5r3vbS7TioJUdjGdeh5K3gAwVCgMtGWEzHv8yia4oMhP9dhTbt
	lvrp9asg5WVWcR2u0N4hJi38kTTyGz6FN3jDfgkDlThw4yFvufwGEv9/sYgqIg8AhlJ7jqNlNeKaP
	Yzo1+Z/QMebIdTmrGrC6OQYo6P+OE2UCo7B55eOJJSW19CA8uq5XfBQL6HyktkxP8K8NXkNx1S9d8
	MZrmm6WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6yx3-0000000H796-1PfI;
	Tue, 14 May 2024 20:40:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6yx0-0000000H77f-3Vp4
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 20:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715719241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ERFfx8GtL0+KBqPg/EG0Vzt3dGykVLSh9fvS/DwTqDg=;
	b=N4UzNWuYx13KT6Jx0cquCTnMmhcx9PI6DQ3pE4pnWyhOI6aV3/U056cqRQHXuTd6U1P7yS
	K1OdVArMvlmCTLxdsb3B7EB3z6Fz3IZdRhTS965VX5mtntka3tjuxQkvo0VgbpBGyYRZwL
	0TR2YqeOL3gElCAJZFnrmxtcJH3m4qM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-K5EjK04wMjq84Yx0d2Y5Sw-1; Tue, 14 May 2024 16:40:30 -0400
X-MC-Unique: K5EjK04wMjq84Yx0d2Y5Sw-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1ec263943d0so56667475ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 13:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715719229; x=1716324029;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ERFfx8GtL0+KBqPg/EG0Vzt3dGykVLSh9fvS/DwTqDg=;
        b=OPuXkMRzoAeml9YqES1t4dxCrua3c3E2TAHiT4wkYx9vx2Ad3EvG9qxAauOsVrHeEK
         /PBasciJ5zAKf1f8MYguiNmkoBmWNwLKh/hzh5GoToH/i/uuLwsi+SHa2oBTohh7Z5BP
         2dplcFzyLpthdvBC5hQ+VWR26KzIgS4u6la17JRlNFzhqeb2eyw0/oWwmAax4ImXaSWk
         qzTZvkDbREOeQpKQ0yggHZPHA5fZtNnJaJnUgOJWZU1kvVFsYXx+ZzsKnKofsn12H9I2
         gjQkMdJpGFpevU/+15we57xHyKz3SrcY4qeQARash8oPQS3sls3eEG17WOhMl+qVvTsn
         NSqw==
X-Forwarded-Encrypted: i=1; AJvYcCVfISVpIj0RSjO0j46TJC4eA2sbq+pR0Yh+m1aiTkdXYH5If3iCGacK+ze/clvnu0fR6xIf5KPo3yzLV91+Rmib1fdkb783VzTtbEE1Ug1F
X-Gm-Message-State: AOJu0Yy6G26RWT+4Du6vYbv5AuKoLcIfr2vs8MfIYP6ck1BffNPo1m+8
	iSooHYz2EofNy4CL0+YAwnXzy+xDkUNUVr+f181GZkCwDWNAxX8zon7gSOb2Psk7rUdCvhmhB5z
	w+MqDpinyyG9vaD0kQV9UTjIO9AHQAmf7D39y5S5Uqr+ANDbdp++HkYG0RfJTR0j0OA==
X-Received: by 2002:a17:902:e84e:b0:1ec:b6e2:da89 with SMTP id d9443c01a7336-1ef440505b8mr190128645ad.61.1715719229642;
        Tue, 14 May 2024 13:40:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6bA/pLrH5fULGMGrMKQoSFgbTk9N93hyM2xdgCcaLr0iqz/N5xBJQZ4SbpuoqpUbPjsyoFg==
X-Received: by 2002:a17:902:e84e:b0:1ec:b6e2:da89 with SMTP id d9443c01a7336-1ef440505b8mr190128335ad.61.1715719229168;
        Tue, 14 May 2024 13:40:29 -0700 (PDT)
Received: from [172.21.1.2] ([50.204.89.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d40besm104795205ad.42.2024.05.14.13.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 13:40:28 -0700 (PDT)
Message-ID: <6f6b0577-51af-4fdf-a46a-d50787346150@redhat.com>
Date: Tue, 14 May 2024 22:40:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] riscv: Enable memory hotplugging for RISC-V
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20240514140446.538622-1-bjorn@kernel.org>
 <20240514140446.538622-7-bjorn@kernel.org>
 <CAHVXubi6Hv_FCTi=a5FFoxqiUBucrX_NhVGBAWE6qXRXdzOYsA@mail.gmail.com>
 <87r0e4l0m6.fsf@all.your.base.are.belong.to.us>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <87r0e4l0m6.fsf@all.your.base.are.belong.to.us>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_134043_133189_4C73D7D5 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTQuMDUuMjQgMjA6MTcsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gQWxleGFuZHJlIEdoaXRp
IDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cj4gCj4+IE9uIFR1ZSwgTWF5IDE0LCAy
MDI0IGF0IDQ6MDXigK9QTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToK
Pj4+Cj4+PiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4+Pgo+Pj4g
RW5hYmxlIEFSQ0hfRU5BQkxFX01FTU9SWV9IT1RQTFVHIGFuZCBBUkNIX0VOQUJMRV9NRU1PUllf
SE9UUkVNT1ZFIGZvcgo+Pj4gUklTQy1WLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPj4+IC0tLQo+Pj4gICBhcmNoL3Jpc2N2L0tjb25m
aWcgfCAyICsrCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+PiBp
bmRleCA2YmVjMWJjZTY1ODYuLmI5Mzk4YjY0YmI2OSAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlz
Y3YvS2NvbmZpZwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+PiBAQCAtMTYsNiArMTYs
OCBAQCBjb25maWcgUklTQ1YKPj4+ICAgICAgICAgIHNlbGVjdCBBQ1BJX1JFRFVDRURfSEFSRFdB
UkVfT05MWSBpZiBBQ1BJCj4+PiAgICAgICAgICBzZWxlY3QgQVJDSF9ETUFfREVGQVVMVF9DT0hF
UkVOVAo+Pj4gICAgICAgICAgc2VsZWN0IEFSQ0hfRU5BQkxFX0hVR0VQQUdFX01JR1JBVElPTiBp
ZiBIVUdFVExCX1BBR0UgJiYgTUlHUkFUSU9OCj4+PiArICAgICAgIHNlbGVjdCBBUkNIX0VOQUJM
RV9NRU1PUllfSE9UUExVRyBpZiBTUEFSU0VNRU0gJiYgNjRCSVQgJiYgTU1VCj4+Cj4+IEkgdGhp
bmsgdGhpcyBzaG91bGQgYmUgU1BBUlNFTUVNX1ZNRU1NQVAgaGVyZS4KPiAKPiBIbW0sIGNhcmUg
dG8gZWxhYm9yYXRlPyBJIHRob3VnaHQgdGhhdCB3YXMgb3B0aW9uYWwuCgpUaGVyZSB3YXMgYSBk
aXNjdXNzaW9uIGF0IExTRi9NTSB0b2RheSB0byBtYXliZSByZXF1aXJlIApTUEFSU0VNRU1fVk1F
TU1BUCBmb3IgaG90cGx1Zy4gV291bGQgdGhhdCB3b3JrIGhlcmUgYXMgd2VsbD8KCi0tIApDaGVl
cnMsCgpEYXZpZCAvIGRoaWxkZW5iCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
