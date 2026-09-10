Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464A6C79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvzJn3tsdJM5pN1idS6zcBYM2R37yHE7OsgO2riz0Q0=; b=WwJXuIUTYZrxQD
	Qm8j0dD2KgejD9VJraaA/cbHIt6DQSMJdW6VFcojSQZMBKhZlZRZZtTtI18n2gGM7yeYtCj+CYkNl
	L85KhcyJ1MS0nbaMYMdVF3cYhXoWby7S4k2R44fMHvM75tLtDa+lmNZW+FOc3lrKHj5khzt337sOP
	fTOQU2mSGcBPy6tfIctReSpcEWLjEpdG37wyDQBjedjgQp5vzYTGK86wn0o7UIaZQxxWy3v47FFl8
	ss06dlLJQ/THSgisCQmfNkwMWaMGGPJxVRsaF1FK3tiys4lakWLNT4WEm3Lb9wqWaOwGHUD17SoeC
	feoEE5UtV0mYvFsA/ICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aOp-0000000DmpK-2BtG;
	Thu, 10 Sep 2026 08:44:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aOm-0000000Dmo2-3l4G
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 08:44:50 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4957eefd361so53457655e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 01:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789029887; cv=none;
        d=google.com; s=arc-20260327;
        b=SrQ335JcwlFH/PhwKSxrmM8wqVQP1XUpL+0tdnuzcfKyVvXlEaNNrQ42ieQYSIDC03
         mtj7AkfFtbQWrmoI1zD5BoA84WiWu23Sj1jRWWdExAYjie1O3kZMXD3Nt3z6vqwThMYN
         5CIbDKl05LTUr0IklWhbzmTbV6XF3ZdjdVm/ZEeYqTIhOEpJ9dRHRFnUhCiJtiOh0rF3
         JbTeQzUUtAl4ox81UZA8sjEtRoGS9cOYl19cVMpaaGYT0UJFbeRZpBnl+b5URYRSMuzH
         2mKRkJXrSu+cPqdJ0lsxXFGw5Y+we3YDlLnuIOjmtVfr+XagLTOWTgiZ/l/pYk3h2o7p
         YEfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=scbEHeSfgSCcxK7Ny73Kn4g0gC7DW9iSvZ1f2Vwg208=;
        fh=xsJHB3VA6np5pAJpQnu9k/T4BP8VpkKOB78lxrYdLlE=;
        b=h04Tm0qoFInGq13eLSWlAC1joUPyI0MADGQEENNIVoPUXThjlYJEUmQi536cONseU8
         C5ukv6Bb37jrjEuFmwUvHwTvv0HoraC1ol5Q8raX+49tFq/gYX1J1Yy0gvep2C5oFe41
         kLAJ1Q6AmrQ8uCH0Cjh7JqmL0qNnpMf5pBpWtr1epbxrIcfh7XU+IbUAPXMwlU9zJ5in
         UUDTvNxKVLyHQnD2dUWRiMXKlIihHwgkXIU2lDKXvtsaujfP+kEZdIih6V+XxDQnhM0L
         1ey1PER/xSl6DwwsHqYVeNUm/5I18QG2py9kMwx1h4zGHpSRqeiFL9jpkKXYy8lHwt9J
         0KdQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789029887; x=1789634687; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=scbEHeSfgSCcxK7Ny73Kn4g0gC7DW9iSvZ1f2Vwg208=;
        b=FsYTkcnpM+8LBUyLmaIeds2qRwqL+aC+gPJUWgysHuJV/BwaUMgOlOq+oqybaJsYmR
         r7VbqCGVY9yBnY4MaLnPMOPVeSW0k9BiuYdc/f1iBoFFoz5ZyyfhKM8iNEZ0/qyo6BYj
         TVwz12EOfS5omOo9e5HjTKkbNFIYzvNSeFzej2qvWOiyP9vkjo/OqNskxU23PPKUAINJ
         Ezc9QowKnC0jUc8sOvfoj6t3DICQ5KfCUt31jza0T/5Ax/TpXgTnO79LCxpzBwsf+n/p
         BR9XdFiuoAs36+Xa8LYKNqhvK2CjYNDsCOwlSffooSDHd2ctq65tF7snP9rJwAgcXF1a
         tjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029887; x=1789634687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scbEHeSfgSCcxK7Ny73Kn4g0gC7DW9iSvZ1f2Vwg208=;
        b=OlcRxqctHGtef7eqVyv8viruNdHJsY4dT4CeUkn+OzXrNJFgOcNwDMgsB92NAjZNQb
         XqDcd1AqgB3cLGRg70UEFH43NJKCoLMyvR5GXBtZcKfS6zMgXzSSCG2iriPxelPSxWLj
         VQcz4iv9aWo+qD4qZbOFQVMyyPGVcZasDjf73rGEylJhLh5nUIMw65/R2Ttjuing/JAv
         U3RxgRYmBZylG9+V9HC66E1xISejlRNhuI4n/QRLXMzEJEbL6KjTMuAEb4+8ncU8FZYr
         5qoUYR/YO7fSZn9J93h7OQrCG0nBn16ri37jg6thOhELe++EQwM9Ku30K4o+NQKVG6N+
         QtWw==
X-Forwarded-Encrypted: i=1; AKwUvBw3lctQX8vC2rW62wfYd9VvUwSP7Ot5qb1RDbqohCbPFrX0W1BE1mg/JUoosC0d7MwB1/OxeSzqh5+axw==@lists.infradead.org
X-Gm-Message-State: AFuF++mqKAJo1ru8HWO18bDb4xWnIatnlUAIETDRlkzaUjLNmQpkx87G
	djSrvJG6uhz+i35NZ9MFrnEGZrHdjDBoV3dGbZRWMpS+CFIK100UR3dMT92qul6NwmveF0fjSxn
	meFjUqQAdh1/SGZ0NC2NElN8vu0qN4e78u9xzB+6tQmp/DE9WmcDv4G1FiA==
X-Gm-Gg: AYBFou0SCOKqU/AqRB1BQ85qy88HyVuM/vkPinREtXuuJ4zOLNvNwKeSK/VSjnF4qD8
	xarQ2W+mHo9o3j01ujwQ15LyvcZuR9C/WBrLfUb7vhH25VeU14fhnfWyjXIrdMyBNTqQbDjM+C8
	C2tFVE0cDwTa3L/UZSAIOqvw77sVVnIWXayhdKXs7+OdaynpWl04uDn0gawuuM17ltrzUt+DI2w
	JIbYNXjWDD+fhXXSZXCPcHw52x5px+XitLpFt+aLQn60ADLsgCyfJvBi+VCjmxD8NJECer1asdI
	kUxwfHbbmeHa4ELGUc6C5hk/XoIrezGJI9L9ZvJ/4jow+ZDQYyQz7A4CSM+B6/s/n2H8U0KzdMB
	FF3Oo30v8zDRPSkd9LnpIp0gNSkqpJR3FFeDbTA7yf6rwFBZcDY3aJq7laO5EJn1GSBZzx0gDDD
	U=
X-Received: by 2002:a05:600c:3148:b0:49d:1e3d:3b3f with SMTP id
 5b1f17b1804b1-49d1e3d3b56mr116962455e9.8.1789029886716; Thu, 10 Sep 2026
 01:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAGEsz8GNHFCOZ=-_y56rK1aX+Ze7w8qVqZSQ-OuGo_dPC4bXCw@mail.gmail.com>
 <20260731163550.46991-1-mhun512@gmail.com>
In-Reply-To: <20260731163550.46991-1-mhun512@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Sep 2026 14:14:34 +0530
X-Gm-Features: AcwNN1V28fjgBOHn1dVY71XHW4M_hQYvtSbbXwHks3Yz0rwxCZGQBzSs1WPsOfE
Message-ID: <CAAhSdy27Ou5CJ8CaKE+QdnK_n+rq9nBJHWOu2V02DvUDQFXWcg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Synchronize hrtimer callback during teardown
To: Myeonghun Pak <mhun512@gmail.com>
Cc: atish.patra@linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_014449_374091_0AA5BE37 
X-CRM114-Status: GOOD (  25.43  )
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

T24gRnJpLCBKdWwgMzEsIDIwMjYgYXQgMTA6MDXigK9QTSBNeWVvbmdodW4gUGFrIDxtaHVuNTEy
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgbm9uLVNzdGMgaHJ0aW1lciBjYWxsYmFjayBjbGVh
cnMgbmV4dF9zZXQgYmVmb3JlIGl0cyBmaW5hbCB1c2VzIG9mCj4gdGhlIGVuY2xvc2luZyB2Q1BV
LiAgSWYgdGVhcmRvd24gb2JzZXJ2ZXMgbmV4dF9zZXQgYXMgZmFsc2Ugd2hpbGUgdGhlCj4gY2Fs
bGJhY2sgaXMgc3RpbGwgcnVubmluZywga3ZtX3Jpc2N2X3ZjcHVfdGltZXJfY2FuY2VsKCkgc2tp
cHMKPiBocnRpbWVyX2NhbmNlbCgpIGFuZCBrdm1fZGVzdHJveV92Y3B1cygpIGNhbiBmcmVlIHRo
ZSB2Q1BVIGJlZm9yZSB0aGUKPiBjYWxsYmFjayBlbnRlcnMga3ZtX3Jpc2N2X3ZjcHVfc2V0X2lu
dGVycnVwdCgpLgo+Cj4gQSBndWVzdCBjYW4gYXJtIHRoZSB0aW1lciB3aXRoIFNCSSBUSU1FIGFu
ZCByZXF1ZXN0IHNodXRkb3duIHdpdGggU0JJCj4gbGVnYWN5IHNodXRkb3duIG9yIFNSU1QuICBB
IFZNTSB0aGF0IGhvbm9ycyBLVk1fRVhJVF9TWVNURU1fRVZFTlQgYW5kCj4gZGVzdHJveXMgdGhl
IFZNIHN1cHBsaWVzIHRoZSB0ZWFyZG93biBzaWRlIG9mIHRoZSByYWNlOyBubyBwb3N0LWxhdW5j
aAo+IGhvc3QgaW9jdGwgaXMgbmVlZGVkIHRvIGFybSBvciByZXF1ZXN0IHRlYXJkb3duLgo+Cj4g
T24gdXBzdHJlYW0gbWFzdGVyIDYyY2M5MDI0MTU0OCwgZ2VuZXJpYyBLQVNBTiByZXBvcnRlZDoK
Pgo+ICAgQlVHOiBLQVNBTjogc2xhYi11c2UtYWZ0ZXItZnJlZSBpbiBkb19yYXdfc3Bpbl9sb2Nr
Cj4gICBXcml0ZSBvZiBzaXplIDQgYXQgYWRkciBmZjYwMDAwMDA1ZTU4ODk4Cj4KPiAgIGt2bV9y
aXNjdl92Y3B1X3NldF9pbnRlcnJ1cHQKPiAgIGt2bV9yaXNjdl92Y3B1X2hydGltZXJfZXhwaXJl
ZAo+ICAgX19ocnRpbWVyX3J1bl9xdWV1ZXMKPiAgIGhydGltZXJfaW50ZXJydXB0Cj4KPiBUaGUg
b2JqZWN0IHdhcyBhbGxvY2F0ZWQgYnkgS1ZNX0NSRUFURV9WQ1BVIGFuZCBmcmVlZCBjb25jdXJy
ZW50bHkgYnk6Cj4KPiAgIGt2bV9kZXN0cm95X3ZjcHVzCj4gICBrdm1fYXJjaF9kZXN0cm95X3Zt
Cj4gICBrdm1fZGVzdHJveV92bQo+ICAgX19mcHV0Cj4KPiBGb3IgZGV0ZXJtaW5pc3RpYyB2YWxp
ZGF0aW9uLCBJIGFkZGVkIG1kZWxheSgxMDAwKSBpbW1lZGlhdGVseSBhZnRlcgo+IHRoZSBleGlz
dGluZyBuZXh0X3NldCA9IGZhbHNlIGFzc2lnbm1lbnQuICBUaGlzIG9ubHkgd2lkZW5zIHRoZQo+
IGV4aXN0aW5nIHBvc3QtY2xlYXIgY2FsbGJhY2sgd2luZG93LiAgQSBuby1kZWxheSB0cmFjZSBi
dWlsZCBuYXR1cmFsbHkKPiByZWFjaGVkIHRoZSBjYWxsYmFjay1hZnRlci10ZWFyZG93bi1zdGFy
dC9iZWZvcmUtZGVpbml0IG9yZGVyaW5nIGluIDEyCj4gb2YgMjAwIHJ1bnMsIGJ1dCAxLDUwMCBz
dG9jay1rZXJuZWwgc3RyZXNzIGl0ZXJhdGlvbnMgZGlkIG5vdCBwcm9kdWNlIGEKPiBLQVNBTiBy
ZXBvcnQsIHNvIG5hdHVyYWwgcmVwcm9kdWN0aW9uIGlzIHRpbWluZy1zZW5zaXRpdmUuCj4KPiBB
bHdheXMgaW52b2tlIGhydGltZXJfY2FuY2VsKCkgZm9yIGFuIGluaXRpYWxpemVkIHRpbWVyLiAg
UHJlc2VydmUgdGhlCj4gZXhpc3RpbmcgLUVJTlZBTCByZXN1bHQgd2hlbiB0aGUgdGltZXIgaXMg
bm8gbG9uZ2VyIHNldCwgYnV0IG9ubHkgYWZ0ZXIKPiBzeW5jaHJvbml6aW5nIHdpdGggYSBydW5u
aW5nIGNhbGxiYWNrLgo+Cj4gV2l0aCB0aGlzIHBhdGNoLCBocnRpbWVyX2NhbmNlbCgpIGJsb2Nr
ZWQgZm9yIHRoZSBmdWxsIHdpZGVuZWQgY2FsbGJhY2sKPiB3aW5kb3cgYmVmb3JlIHZDUFUgZGVz
dHJ1Y3Rpb24uICBLQVNBTiByZXBvcnRlZCBubyBlcnJvciBpbiAxMDAKPiBmaXhlZC1hbmQtd2lk
ZW5lZCBydW5zIG9yIDIwMCBmaXgtb25seSB0aW1pbmctc3dlZXAgcnVucy4KPgo+IEZpeGVzOiAz
YTlmNjZjYjI1ZTEgKCJSSVNDLVY6IEtWTTogQWRkIHRpbWVyIGZ1bmN0aW9uYWxpdHkiKQo+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gQXNzaXN0ZWQtYnk6IE9wZW5BSTpHUFQtNS42Cj4g
U2lnbmVkLW9mZi1ieTogTXllb25naHVuIFBhayA8bWh1bjUxMkBnbWFpbC5jb20+CgpMR1RNLgoK
UmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhp
cyBwYXRjaCBhcyBmaXggZm9yIExpbnV4LTcuMy1yY1gKClRoYW5rcywKQW51cAoKPiAtLS0KPiBD
aGFuZ2VzIGluIHYyOgo+IC0gQWRkIHRoZSByZXF1aXJlZCBBc3Npc3RlZC1ieSB0cmFpbGVyLgo+
IC0gRHJvcCBzZWN1cml0eUBrZXJuZWwub3JnIGZyb20gdGhlIHJlY2lwaWVudHMuCj4KPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdV90aW1lci5jIHwgNyArKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBBSSBkaXNjbG9zdXJlOiBJIHVzZWQg
QUkgYXNzaXN0YW5jZSBkdXJpbmcgdGhlIGF1ZGl0IGFuZCBhbSB0cmVhdGluZyB0aGUKPiBpc3N1
ZSBhcyBwdWJsaWMgYXMgcmVxdWlyZWQgYnkgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3NlY3VyaXR5
LWJ1Z3MucnN0Lgo+IFRoZSByZXByb2R1Y2VyIGFuZCBmdWxsIEtBU0FOIHRyYWNlIGhhdmUgbm90
IGJlZW4gcG9zdGVkIHB1YmxpY2x5IGFuZAo+IGFyZSBhdmFpbGFibGUgb24gcmVxdWVzdC4KPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3RpbWVyLmMgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3RpbWVyLmMKPiBpbmRleCBhZTUzMTMzYzdhYjAuLmEyY2QyNzdhNDA1OSAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3RpbWVyLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3RpbWVyLmMKPiBAQCAtNjEsMTAgKzYxLDEzIEBAIGt2bV9yaXNjdl92Y3B1X2hydGlt
ZXJfZXhwaXJlZChzdHJ1Y3QgaHJ0aW1lciAqaCkKPgo+ICBzdGF0aWMgaW50IGt2bV9yaXNjdl92
Y3B1X3RpbWVyX2NhbmNlbChzdHJ1Y3Qga3ZtX3ZjcHVfdGltZXIgKnQpCj4gIHsKPiAtICAgICAg
IGlmICghdC0+aW5pdF9kb25lIHx8ICF0LT5uZXh0X3NldCkKPiArICAgICAgIGlmICghdC0+aW5p
dF9kb25lKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPgo+ICAgICAgICAgaHJ0
aW1lcl9jYW5jZWwoJnQtPmhydCk7Cj4gKwo+ICsgICAgICAgaWYgKCF0LT5uZXh0X3NldCkKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gICAgICAgICB0LT5uZXh0X3NldCA9IGZh
bHNlOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAtLQo+IDIuNDcuMgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
