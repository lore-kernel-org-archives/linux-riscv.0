Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A4CC369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 02:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGsXQnZyB2G0ym9hPLUQXgSG0/Vv9/KpQlg2sLxfoDI=; b=RIlGESEh2y0oZn
	6DxHDp2ImM+KBWG4PatLQvYQiM28deIsRbIluI56gsw9o5u8kT6A1DpEzLvSgSqgK1ksMF5JknUH0
	ri3BRmHeFBhe1VhzcVbygs9VTqTN6zJTqIYA8eJR6p35b5jug+P8pL+xenl/4TDnTQsugIcOOVQaL
	uxuUli0DtMB3ieXMl+9v5x3+d24IHDjojhX8gKWvLutkTiqnEd/GP6ingNag6ZKImYFNml2ofeQJW
	Ji8gh6o1fb3x12EEneWT4byncbxYv/T1P7lC7QJBNT+WY6l7LYTZz85MPwI0tsRgNAIkSbqltmJjB
	r9lrOz2wkKC0yuPumZjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bnF-0000000EtwW-2GCm;
	Fri, 18 Apr 2025 02:49:29 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bnD-0000000Etw9-1xTj
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 02:49:28 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e7270e0edf5so1462767276.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 19:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744944566; x=1745549366; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Dj8GhW50UrAUMkoalDHqFuyFbqo3nnRECKX4Bf5Ge4=;
        b=UCRbU7XTdvTSH3eBqne5l7ID+a1pLoRNnsXiWMc0ei6Sz7tSgH4y7h654W+SrLF6ml
         Xv+BSidRk2eADLEQj8uPkHkj8zIlaB/cIZmPlcWaPwzvPiWqXzy+w0s59ULSjUSQjqib
         YU8EsFNkWG2BvEf1V71rIfp8UHNOeSVA7c+JifFw3B1O+WryN429S3sO9qGs4PfmQciJ
         XuDdxZNxaUj/rXhJw1E8wAVds2U9fxxZlJ7rNznUun3/yHmXFhc/cgnq8vnUJEYs04ku
         7Ee6Hh+I2G0vTvSNvDURNG8E6ZoVnEUQHK3kNq0zCxRpniF0IC19I2/3GOCSKQucd1q0
         WBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744944566; x=1745549366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Dj8GhW50UrAUMkoalDHqFuyFbqo3nnRECKX4Bf5Ge4=;
        b=H7A+YKCvVv2g9VZj1nZObnVUkVLLBFBUxeratVVo1omw8ROsa3T9teY64LFztOdtCj
         JSz++EOkeUvlmYc+vOswiVuGbW+GLOFAgQGv0yhFfnvKr54wABQ5sadXPHQXHzS3YDQH
         w3orKSmdkA03O4tmIJaMK0fS2vg2TRhiXq/OjbiCdSHfZNdC+oIYelUifQ2Jyv8Q6UsV
         wPNJUl7F6nU+gQgs+xxfFbq4/R+7DTW0DgKy2yWAHf46wEWX/u8C6BwOGytWMsnmBroV
         +BTPfIhLD5Kk1z3kgyJwnXdkdAvlsjZ+GL2JnH++74Hb/gaM3zes2zK3csYnHc5q1h4h
         jHxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtvHCn4Vh3F+ITduB6U5/FelMIbOvpV1PVQW183CbrfvQfxn8E/8NXZv8V4EE8NN9TGt4vrBXcldlu4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywykuz09KtPKZcGeSbEwDw1inKPDomp8R8X8HlypmvNdPBZiLMG
	7PPQeOrKjigg5JLwC6uxsGbPC+Aqawncvvq5az5b+7aCAUlxViA7aZmbltxqNExrVJn74+CE+Fy
	R+yBfwNxw6xAZQH5nwccLiQsKmvE=
X-Gm-Gg: ASbGncvOmGDXJ6wfj6JMCkV2zjCnBNVguKPUjXSgUkyJ62xT4igXkgdmgKfgLLIKyaT
	Cfe5eygDTf7CkrExnng6zyy7iL022WRfUoHiRzjuHdgXAzFvhcrTBmXJ3HGNlqriidFe77MXtCr
	jZUFzwXPcJf0o6LRwzDQZEg4nNEDV5qfC31V3L7A==
X-Google-Smtp-Source: AGHT+IFOw2jiDXl3bt6tyk3aoTpA5w5vhRYg4GCxEMlUgP7Q+jQU34k6Rpv4Sr8sgqmg+aVZeAJ5xQLgahHc75hZMLE=
X-Received: by 2002:a05:6902:2290:b0:e72:871e:fc3e with SMTP id
 3f1490d57ef6-e7297db6e4emr1580309276.12.1744944566311; Thu, 17 Apr 2025
 19:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250417064940.68469-1-dqfext@gmail.com> <20250417170902.GC800@quark.localdomain>
In-Reply-To: <20250417170902.GC800@quark.localdomain>
From: Qingfang Deng <dqfext@gmail.com>
Date: Fri, 18 Apr 2025 10:49:11 +0800
X-Gm-Features: ATxdqUHy7zDRa-eA71VWFff5HhwdMV8ZyAjRDc9UL_LnWdHSkCoRmm8Tv5GBb9Y
Message-ID: <CALW65jZmLx+dh+cYpsynXnZnzmNwA9QFA-q77zHWT=fNKEbW5g@mail.gmail.com>
Subject: Re: [RFC PATCH] crypto: riscv: scalar accelerated GHASH
To: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-crypto@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_194927_506209_29083F0D 
X-CRM114-Status: GOOD (  15.41  )
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

SGkgRXJpYywKCk9uIEZyaSwgQXByIDE4LCAyMDI1IGF0IDE6MDnigK9BTSBFcmljIEJpZ2dlcnMg
PGViaWdnZXJzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gUGxlYXNlIGhlbHAgcHJvcGVybHkgb3B0
aW1pemUgc3dhYiooKSBhbmQge2dldCxwdXR9X3VuYWxpZ25lZF8qIGZvciBSSVNDLVYKPiBmaXJz
dCwgYmVmb3JlIGNvbnNpZGVyaW5nIHJhbmRvbSBoYWNrcyBsaWtlIHRoaXMuCj4KPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjUwNDAzLXJpc2N2LXN3YWItdjMtMC0zYmY3MDVkODBlMzNA
aWVuY2luYXMuY29tCj4gaXMgd29ya2luZyBvbiBzd2FiKigpLgoKSW5kZWVkIOKAlCBpbiBmYWN0
LCBvdXIgZG93bnN0cmVhbSBOT05QT1JUQUJMRSB2ZXJzaW9uIGN1cnJlbnRseSB1c2VzCntnZXQs
cHV0fV91bmFsaWduZWRfYmU2NCwgYXMgd2UndmUgbW9kaWZpZWQgdGhlIE1ha2VmaWxlIHRvIGVu
c3VyZSB0aGUKY29tcGlsZXIgb3B0aW1pemVzIGZvciBib3RoIHVuYWxpZ25lZCBhY2Nlc3MgYW5k
IGVmZmljaWVudCBzd2FiKigpCmhhbmRsaW5nLgoKPgo+ID4gKyAgICAgICAgICAgICAvKiBNdWx0
aXBsaWNhdGlvbiAod2l0aG91dCBLYXJhdHN1YmEpICovCj4gPiArICAgICAgICAgICAgIHQwID0g
Y2xtdWwxMjgocF9sbywga19sbyk7Cj4gPiArICAgICAgICAgICAgIHQxID0gY2xtdWwxMjgocF9s
bywga19oaSk7Cj4gPiArICAgICAgICAgICAgIHQyID0gY2xtdWwxMjgocF9oaSwga19sbyk7Cj4g
PiArICAgICAgICAgICAgIHQzID0gY2xtdWwxMjgocF9oaSwga19oaSk7Cj4gPiArICAgICAgICAg
ICAgIG1pZCA9IHQxIF4gdDI7Cj4gPiArICAgICAgICAgICAgIGxvID0gdDAgXiAobWlkIDw8IDY0
KTsKPiA+ICsgICAgICAgICAgICAgaGkgPSB0MyBeIChtaWQgPj4gNjQpOwo+Cj4gVGhlcmUgaXMg
bm8gbmVlZCB0byBleHBsaWNpdGx5IFhPUiAnbWlkIDw8IDY0JyBpbnRvIGxvIGFuZCAnbWlkID4+
IDY0JyBpbnRvIGhpLgo+IFRha2UgYSBsb29rIGF0IGhvdyBhcmNoL3g4Ni9jcnlwdG8vYWVzLWdj
bS0qLlMgZG8gaXQuCgpUaGFua3MsIEkgc2F3IHlvdXIgY29tbWVudHMgaW4gYWVzLWdjbS1hdngx
MC14ODZfNjQuUyBhbmQgbm93CnVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbnQuCgpIb3dldmVyLCBz
aW5jZSB3ZSdyZSB3b3JraW5nIHdpdGggNjQtYml0IHNjYWxhciByZWdpc3RlcnMgb24gUklTQy1W
CihhcyBvcHBvc2VkIHRvIDEyOC1iaXQgU0lNRCByZWdpc3RlcnMgb24geDg2KSwgdGhlcmUncyBu
byByZWR1Y3Rpb24gaW4KdGhlIG51bWJlciBvZiBYT1IgaW5zdHJ1Y3Rpb25zLiBSZWdhcmRsZXNz
IG9mIHdoZXRoZXIgd2UgZXhwbGljaXRseQpjb21wdXRlIG1pZCBhbmQgc2hpZnQgaXQsIG9yIGRp
cmVjdGx5IFhPUiB0aGUgaW50ZXJtZWRpYXRlIHJlc3VsdHMsIHdlCnN0aWxsIGVuZCB1cCB3aXRo
IDggaW5kaXZpZHVhbCA2NC1iaXQgWE9ScyB0byBjb21iaW5lIHQwLCB0MSwgdDIsIGFuZAp0My4K
ClNvIHdoaWxlIHRoZSBvcHRpbWl6YXRpb24gaGVscHMgb24geDg2IGR1ZSB0byB3aWRlciByZWdp
c3RlcnMgYW5kCnZlY3RvciBpbnN0cnVjdGlvbnMsIGl0IGRvZXNuJ3Qgb2ZmZXIgYSBiZW5lZml0
IGluIG91ciBzY2FsYXIgUklTQy1WCmltcGxlbWVudGF0aW9uLgoKPgo+IEFsc28sIHNpbmNlIHRo
aXMgaXMgb25seSBkb2luZyBvbmUgYmxvY2sgYXQgYSB0aW1lIGFuZCBkb2VzIG5vdCB1c2UgS2Fy
YXRzdWJhCj4gbXVsdGlwbGljYXRpb24sIHRoZSBzaW5nbGUtc3RlcCByZWR1Y3Rpb24gd291bGQg
d29yayB3ZWxsIGhlcmUuICBTZWUKPiBhZXMtZ2NtLWFlc25pLXg4Nl82NC5TLgoKSSBzYXcgdGhl
IHByZS1jb21wdXRlIGtleSBzdGVwLiBJcyBpdCB0aGUgc2FtZSBhcyB0aGUgc3RlcCBtZW50aW9u
ZWQKb24gcGFnZSAxMiBvZiB0aGlzIFBERj8KClsxXSBodHRwczovL2J1aWxkZXJzLmludGVsLmNv
bS9kb2NzL25ldHdvcmtidWlsZGVycy9hZHZhbmNlZC1lbmNyeXB0aW9uLXN0YW5kYXJkLWdhbG9p
cy1jb3VudGVyLW1vZGUtb3B0aW1pemVkLWdoYXNoLWZ1bmN0aW9uLXRlY2hub2xvZ3ktZ3VpZGUt
MTY5MzMwMDc0Ny5wZGYKCj4KPiAtIEVyaWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
