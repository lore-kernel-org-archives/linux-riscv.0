Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35FEFF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 14:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlh8SYqdlIPXfgpc9xTDnOSqD8iIUJeqStqEFB0Xt+g=; b=VKqlYzmQeYR7Ma
	YwvkrNmlBDNZR0/A7Zi9vLQ9U2LXO4+MLcGARuFku1BZC6JT6LZNXfoL7lz35ATArj+RfFh5ewtto
	NVqUaLzkutcyruRPqQW8KM01DLGlvsRrHw4q/bNL+SpoL3sikABjVEHK2XTjmmMBUqR/QUKsUzmWB
	ovJT8wFyo5LDjpOJnColzNiK1wTcXwvcfTgUsQ/MGRxaJ+yUMLC1CBrOzokZAVTHX2/tD0QJlwtWm
	aZ4z1Ily6/Uh/XkLyEPRJXVWIl1ugv5Av2HDjqM5QyoORSBepchCriAl95QRqFhfmG5kl+i7bpRhG
	xKgW+WAV4/6cEkpan8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6LT-00000003nja-2jZJ;
	Wed, 29 Apr 2026 14:56:59 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6LQ-00000003nif-2g3L
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 14:56:57 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-628086439b6so1584718137.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Apr 2026 07:56:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777474615; cv=none;
        d=google.com; s=arc-20240605;
        b=MAotHCew8pooJ7Nh56Fysi7fZM5u1kKzPHx5xLfeHM9hJb+W5d8eBugj4XCU2vxtuz
         Nu2K1ZSp/oQo1MvefEXt2ecAqrf/c4qb48oINr1DqXJJi5TLNkTBoy27aUCypHNazc7d
         4qnWsi4P/8+KrZChZuJeuYJISqRbTEXS5Exe0v5qd6+gO6aTH1ObOZ6E0kLGVXR0G6OT
         a1mdVRrkiQuh7N/ytHWG7/L+nIJIlEXWymDZiC69hc38uXQPp2QfGsnYCfdoqiPyaB7G
         URxk4fjJVR9a+7K9bN4CU8+/xjTC8kh6nIJszk/tkP/Rq0r3dBYavbVsYZLP7aCEnkSe
         eyoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H2V/dl3hFGCQb28gU5v23wIi7Ed5aKdIv5xoz6Kk1o8=;
        fh=fgDQDNvUDCTxUVFLWj+DU1B9uEMTQkR0P8WLkmEPEX4=;
        b=HQQp4IdUjPMzPHtMwi4e7jh3N8jffGPec3ofbDiZESA289HTG5+XtdZVFXqiGCgWl4
         FTLqt8DRYmp8dcvXooKaDYsAKObqHsRaD2D4eHGJOW/U33VbYBd18j/d88qZEsD1r9BV
         RGjWCn66//BDPpUSLQLwG+ytcdGMX43clckZgA9kr1NQh2PW1en17mxNAdCJaZPPvZeL
         3dXjQe8W5lgkjtNF9i77MMgj30x+NEIfMe6bmqOytIW9+B2WuhfFUfgqXn6CdU/AuZOg
         v9pYtqFXZT9BFzkOln/YrEwGdmhzwzxG7pGfyFoxWjMBLOsDc5KhE10ZdmqkeU2FzJuu
         nCRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1777474615; x=1778079415; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2V/dl3hFGCQb28gU5v23wIi7Ed5aKdIv5xoz6Kk1o8=;
        b=bxFHYHI1s856wZGwP+eUK3mh9VIlMZFlWw7wpJDVZlBhBiad5iFRf8Gxmgx5co089f
         c3Fv3FFVBF9HMbF5oTxA443l+7H9QO13SV+QGyJU93BfxT8fcThmfshSW5yrKRvDoNkX
         0BJED8zW0hFMPUHhtxO+TysGZi+LwiE32spUDALX2Trs71NpbzXOROczaH17FMIsY0jf
         /Yf5BbxvufrBIkEIwH5qVD+J74ehzqDrRRom3QFLswbIbKPslhSvYbkIbxiOX40NJdD5
         0G2SvfUFL1LMY+yt886QO5kvl4YK/3aZVXuLmCV0Gq+AgCr5kOlPfMO7qRbSswNQBCwD
         Ha3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777474615; x=1778079415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H2V/dl3hFGCQb28gU5v23wIi7Ed5aKdIv5xoz6Kk1o8=;
        b=V6S+beN1XxetAoXbBpF3uJZBtu0ooYUtSvlZDSsi5pqZsOz9xv5d0it+zA/cb4wpq4
         a/Fzg99uYhNsRO/XpkQk/lyvhiDX37q6fFDEx+86nVTXTD+wLYFDNPA93GuiAufgQ1U6
         WBHdt42VUeAFPTC//YUjcu4DLSKTgZDIzP7LPRWvmiJp+2c4vHQ8w8L2QjQXd5BYPBl0
         orQwUe2uxQj52E2b49GOOqZmCtlw1+G0nqQ6HPtSof5N3Y+OjyAXgRLguBt6RTtI1r8/
         mFyLRmS3b8qc8492+wl8SD7MtUCDG72FRxrndFxXPMxf8dgRBE1rugzC5MFVJHtxkOW8
         JdZA==
X-Forwarded-Encrypted: i=1; AFNElJ9Nap/3jbHFY89oiM7i+QoKQceUuiJW6l58dyzgGg+LrfHHjCLlQ75o6VppU8bcdOlqJBRIVrPaCKn3IA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSVzCcSbx9lN1dhdWrW6hHHEsK2GxefCeNWH0UkgEmTlr+DjFL
	wqfIUhttaLj3R4+3MIjELkR/hRgX4bn9WbJWYK5cojb7qJcCeheeFKXPs2qwLyJuL6hiPQ24kbf
	1aazBIFaALIMoJZpAHHhfetelw6hp1+nE0AYnS24Qeg==
X-Gm-Gg: AeBDievofhAg3C5Gv4z1DLjij4OBHEewgjJVwuvCn23lsZu6WPNMNCRiat+YxiS+Sa1
	+Mr4EjXMAWY5O8C2nnnfIZpfhNNgdWZXxVMoIQRpxspzSnh62StEsqwTQ7Epj6ARhAf97Hs1vTi
	CLL8GTfGv1pAO/xOtp/QBhRXgQIhB128EbGiDlYLBPXPqjPt/j45ZaBl7FOMM2KpJzPcHktDnMT
	OapPQzUykmdOON3HmfgqWn+34a3fszPFm8bs/RTPfCvw8UF/Dxd9SdR/i29wiqjKI/jY0RaRMII
	SlZ/8YHA+cjRbWkbWlAH
X-Received: by 2002:a05:6102:304d:b0:618:3503:5659 with SMTP id
 ada2fe7eead31-6280a9bbbccmr4235225137.14.1777474614805; Wed, 29 Apr 2026
 07:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260426-vendor-v1-1-041fbde8918f@sifive.com> <20260427-landside-bush-45bf90908635@spud>
In-Reply-To: <20260427-landside-bush-45bf90908635@spud>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed, 29 Apr 2026 22:56:43 +0800
X-Gm-Features: AVHnY4IMqma4OediWparMs16ybDcic3N3gMoc9UVxiTJji2lPPcs156VOGULFgA
Message-ID: <CAMWQL2gvV6+zTmDw2pizCVfQUcJrtQc7RWDpbeP8ErVmU8m6CA@mail.gmail.com>
Subject: Re: [PATCH] riscv/sifive: remove warning in errata
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_075656_703309_0603D98C 
X-CRM114-Status: GOOD (  18.35  )
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

SGkgQ29ub3IsCgpPbiBNb24sIEFwciAyNywgMjAyNiBhdCAxMToxMuKAr1BNIENvbm9yIERvb2xl
eSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIEFwciAyNiwgMjAyNiBhdCAw
Nzo1Mzo0NlBNIC0wNzAwLCBZb25nLVh1YW4gV2FuZyB3cm90ZToKPiA+IFRoZSBwYXRjaF9pZCBv
ZiB0aGUgYXZhaWxhYmlsaXR5IGNoZWNraW5nIGZvciBTaUZpdmUgdmVuZG9yIGV4dGVuc2lvbnMK
PiA+IHdpbGwgYWx3YXlzIGxhcmdlciB0aGFuIEVSUkFUQV9TSUZJVkVfTlVNQkVSLiBSZW1vdmUg
dGhpcyB1bm5lY2Vzc2FyeQo+ID4gd2FybmluZy4KPgo+IEknbSBzb3JyeSwgSSBkb24ndCBxdWl0
ZSB1bmRlcnN0YW5kIHRoaXMgY29tbWl0IG1lc3NhZ2UuIFdoZXJlIGlzIHRoZQo+IG90aGVyIHdh
cm5pbmcgdGhhdCBtYWtlcyB0aGlzIG9uZSB1bm5lZWRlZD8KPiBJIHRoaW5rIHRoZSBjb21taXQg
bWVzc2FnZSBuZWVkcyB0byBwb2ludCBvdXQgd2hlcmUgdGhhdCBpcy4KPgoKU29ycnkgaXQncyBt
eSBmYXVsdC4gSSB3aWxsIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgaW4gdGhlIG5leHQgdmVy
c2lvbi4KClJlZ2FyZHMsCllvbmctWHVhbgoKPiBDaGVlcnMsCj4gQ29ub3IuCj4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2FuZ0BzaWZpdmUuY29tPgo+
ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9lcnJhdGEvc2lmaXZlL2VycmF0YS5jIHwgMSAtCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9lcnJhdGEvc2lmaXZlL2VycmF0YS5jIGIvYXJjaC9yaXNjdi9lcnJhdGEvc2lmaXZlL2Vy
cmF0YS5jCj4gPiBpbmRleCBkMGM2MWY4NmNiYTMuLjk4ZWRkOTE0MzMyMSAxMDA2NDQKPiA+IC0t
LSBhL2FyY2gvcmlzY3YvZXJyYXRhL3NpZml2ZS9lcnJhdGEuYwo+ID4gKysrIGIvYXJjaC9yaXNj
di9lcnJhdGEvc2lmaXZlL2VycmF0YS5jCj4gPiBAQCAtOTQsNyArOTQsNiBAQCB2b2lkIHNpZml2
ZV9lcnJhdGFfcGF0Y2hfZnVuYyhzdHJ1Y3QgYWx0X2VudHJ5ICpiZWdpbiwgc3RydWN0IGFsdF9l
bnRyeSAqZW5kLAo+ID4gICAgICAgICAgICAgICBpZiAoYWx0LT52ZW5kb3JfaWQgIT0gU0lGSVZF
X1ZFTkRPUl9JRCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ICAgICAg
ICAgICAgICAgaWYgKGFsdC0+cGF0Y2hfaWQgPj0gRVJSQVRBX1NJRklWRV9OVU1CRVIpIHsKPiA+
IC0gICAgICAgICAgICAgICAgICAgICBXQVJOKDEsICJUaGlzIGVycmF0YSBpZDolZCBpcyBub3Qg
aW4ga2VybmVsIGVycmF0YSBsaXN0IiwgYWx0LT5wYXRjaF9pZCk7Cj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgY29udGludWU7Cj4gPiAgICAgICAgICAgICAgIH0KPiA+Cj4gPgo+ID4gLS0tCj4g
PiBiYXNlLWNvbW1pdDogZGRiZjljNzZjNDAyMGJmNjNhMDc5OWIwMGZhYWQ0MGNhYTNkZTZjMgo+
ID4gY2hhbmdlLWlkOiAyMDI2MDQyNi12ZW5kb3ItNGI0NDI3ZTBiNjcwCj4gPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
