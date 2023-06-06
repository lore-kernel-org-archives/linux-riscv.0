Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341D2C77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 05:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IbXefqyp8WOhaTLXtFjbjZBrq8vInKNZq3E2kUkrXrM=; b=o2lndsZgaryjK+
	JNMW68m/RZd0gLipFOg3ZUCUc635iXX3QpANeTgxABKYR9R202RBdgEOjFr6DWREPzQBWFK9WCqTU
	4mWQ+l0ZTsG3JZ38sAz0yAVZHfTh5rz37oCN7J7GZcyhIvQZjHBkXsxsXjagS1WZbx+HqTXOP9j8r
	Dz2Od5lEufl8CN9ZVkwHS/LqJbiE4jW1B4BXgs8B9rj4vlri2KUPe2BV06ltT8XBexPqK7PBKiCmv
	x9BT99e7Nc44zzMRlydFyW3H6FOTm3tOC+/4jejlZ85Yj0e/ShNRjjugHSBTAUrgMiUcNf5aK8lII
	/yeBanHezbhX4vvSwXCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Pfm-000IZu-0x;
	Tue, 06 Jun 2023 05:56:02 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Pfj-000IYE-32
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 05:56:01 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b1afe57bdfso52427081fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 22:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1686030942; x=1688622942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9cYsr8BE005YqSwHldqcQlfE/E+jt1/6Q7IewZthS0=;
        b=fKGGM50jQNjUWYec1QqVOrTDQafk69wIB6OS7099wypBxJvlq9YJXsUCRUA+/T3P+z
         +m68bmLJtrgpmPXtXv1NjiM2R+H5cyStE+KNIWRolDjvYo+O00lb5AnKxmmqcwqmN/Sm
         mhbGGBt52YtydbPIWNCdYg2CBus0K3AxVWOFDPQVM85jrVQrdBg45xwNUymsavFNFCCm
         v0e4jRco3ctZi3ePVlEt+vn6KjtZcwJs18qb2F8tnBGPqMKxjAK+WGdNE3bXpk5EnT+P
         d9rhMfKCDnv+ESgyL1VfMRvCL7SefubDg0IR/ngL505Yn2p09an8fkwvcW1uIo4WJ/Oc
         RAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686030942; x=1688622942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9cYsr8BE005YqSwHldqcQlfE/E+jt1/6Q7IewZthS0=;
        b=i803qqRJhpeQhHS2GIcUuuNIXYGZyDOvzv8JAD98vUwm+gnoMFCHvd4vydVYx2uLck
         tzVijyCDSEgunBrXv7ZeZBzlojkxrehmwbURKCkuQHz8gogA5lJqmgrFkM9GsKg6QemG
         6tX/HydMlq1l337XFdGUnLoaTP4Hr+MEXgkVBCgaT/GZpTv0OjqPpusOT92oQ33hPP9e
         GOzZRQP0BZ2avmEQjAfI8nQK31Onm9KnZvrZukA4jOqIwFfdJwy4WNVSqE/Du61z4w9p
         fvIt9X2BOOMHhSHpr2QZwN1ixqf0zF4rhDbY8bycwLdiXZkXrpGXb8lq9sJf5poAe+aD
         pIGw==
X-Gm-Message-State: AC+VfDxCI3k3W0vChUv6asa4vVyzdPDSedolTLuxFxaYHqwjBneyMrL2
	k42yh1xRIDCjnogpIj/yHAZvOn3Dtkhne3mUvHWi
X-Google-Smtp-Source: ACHHUZ7h5KkekPy9yuKYV5PS43w3+C+ebc7U9QdFitacbQ8DnQrwLysCK+J6FOUztdQAK1Xx6ieWg0k1gtl7K3fKZ0k=
X-Received: by 2002:a2e:7302:0:b0:298:ad8e:e65 with SMTP id
 o2-20020a2e7302000000b00298ad8e0e65mr774092ljc.21.1686030941912; Mon, 05 Jun
 2023 22:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230425102828.1616812-1-woodrow.shen@sifive.com>
In-Reply-To: <20230425102828.1616812-1-woodrow.shen@sifive.com>
From: Woodrow Shen <woodrow.shen@sifive.com>
Date: Tue, 6 Jun 2023 13:55:30 +0800
Message-ID: <CABquHAQJfRDNyHgC6WzDjUQR2if6GC=en5CCOXuVrG+=i8q8RA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: Ensure prot of VM_WRITE and VM_EXEC must be readable
To: paul.walmsley@sifive.com, palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, 
	alexghiti@rivosinc.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_225600_016316_3E294FA4 
X-CRM114-Status: GOOD (  18.87  )
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

SGkgYWxsLAoKQ2FuIHNvbWVvbmUgaGVscCB0byByZXZpZXcgdGhpcyBhbmQgc2VlIGlmIGl0IGNh
biBiZSBxdWV1ZWQgaW50byA2LjU/IFRoYW5rcy4KCldvb2Ryb3cKCgpPbiBUdWUsIEFwciAyNSwg
MjAyMyBhdCA2OjI44oCvUE0gV29vZHJvdyBTaGVuIDx3b29kcm93LnNoZW5Ac2lmaXZlLmNvbT4g
d3JvdGU6Cj4KPiBGcm9tOiBIc2llaC1Uc2VuZyBTaGVuIDx3b29kcm93LnNoZW5Ac2lmaXZlLmNv
bT4KPgo+IENvbW1pdCA4YWViN2IxN2YwNGUgKCJSSVNDLVY6IE1ha2UgbW1hcCgpIHdpdGggUFJP
VF9XUklURSBpbXBseSBQUk9UX1JFQUQiKQo+IGFsbG93cyByaXNjdiB0byB1c2UgbW1hcCB3aXRo
IFBST1RfV1JJVEUgb25seSwgYW5kIG1lYW53aGlsZSBtbWFwIHdpdGggdyt4Cj4gaXMgYWxzbyBw
ZXJtaXR0ZWQuIEhvd2V2ZXIsIHdoZW4gdXNlcnNwYWNlIHRyaWVzIHRvIGFjY2VzcyB0aGlzIHBh
Z2Ugd2l0aAo+IFBST1RfV1JJVEV8UFJPVF9FWEVDLCB3aGljaCBjYXVzZXMgaW5maW5pdGUgbG9v
cCBhdCBsb2FkIHBhZ2UgZmF1bHQgYXMKPiB3ZWxsIGFzIGl0IHRyaWdnZXJzIHNvZnQgbG9ja3Vw
LiBBY2NvcmRpbmcgdG8gcmlzY3YgcHJpdmlsZWdlZCBzcGVjLAo+ICJXcml0YWJsZSBwYWdlcyBt
dXN0IGFsc28gYmUgbWFya2VkIHJlYWRhYmxlIi4gVGhlIGZpeCB0byBkcm9wIHRoZQo+IGBQQUdF
X0NPUFlfUkVBRF9FWEVDYCBhbmQgdGhlbiBgUEFHRV9DT1BZX0VYRUNgIHdvdWxkIGJlIGp1c3Qg
dXNlZCBpbnN0ZWFkLgo+IFRoaXMgYWxpZ25zIHRoZSBvdGhlciBhcmNoZXMgKGkuZSBhcm02NCkg
Zm9yIHByb3RlY3Rpb25fbWFwLgo+Cj4gRml4ZXM6IDhhZWI3YjE3ZjA0ZSAoIlJJU0MtVjogTWFr
ZSBtbWFwKCkgd2l0aCBQUk9UX1dSSVRFIGltcGx5IFBST1RfUkVBRCIpCj4gU2lnbmVkLW9mZi1i
eTogSHNpZWgtVHNlbmcgU2hlbiA8d29vZHJvdy5zaGVuQHNpZml2ZS5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiBDaGFu
Z2Vsb2cgVjI6Cj4gIC0gUmVuYW1lIFBBR0VfQ09QWV9SRUFEX0VYRUMgaW50byBQQUdFX0NPUFlf
RVhFQyBhbmQgcmVtb3ZlCj4gICAgUEFHRV9DT1BZX1JFQURfRVhFQy4KPiAtLS0KPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAzICstLQo+ICBhcmNoL3Jpc2N2L21tL2luaXQu
YyAgICAgICAgICAgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+IGluZGV4IGY2NDE4
MzdjY2YzMS4uMDVlZGEzMjgxYmE5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiBA
QCAtMTY1LDggKzE2NSw3IEBAIGV4dGVybiBzdHJ1Y3QgcHRfYWxsb2Nfb3BzIHB0X29wcyBfX2lu
aXRkYXRhOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX1BBR0Vf
RVhFQyB8IF9QQUdFX1dSSVRFKQo+Cj4gICNkZWZpbmUgUEFHRV9DT1BZICAgICAgICAgICAgICBQ
QUdFX1JFQUQKPiAtI2RlZmluZSBQQUdFX0NPUFlfRVhFQyAgICAgICAgIFBBR0VfRVhFQwo+IC0j
ZGVmaW5lIFBBR0VfQ09QWV9SRUFEX0VYRUMgICAgUEFHRV9SRUFEX0VYRUMKPiArI2RlZmluZSBQ
QUdFX0NPUFlfRVhFQyAgICAgICAgIFBBR0VfUkVBRF9FWEVDCj4gICNkZWZpbmUgUEFHRV9TSEFS
RUQgICAgICAgICAgICBQQUdFX1dSSVRFCj4gICNkZWZpbmUgUEFHRV9TSEFSRURfRVhFQyAgICAg
ICBQQUdFX1dSSVRFX0VYRUMKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBi
L2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gaW5kZXggMGYxNGY0YThkMTc5Li5jYzQ4YjBkOTNhOTgg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiArKysgYi9hcmNoL3Jpc2N2L21t
L2luaXQuYwo+IEBAIC0yODYsNyArMjg2LDcgQEAgc3RhdGljIGNvbnN0IHBncHJvdF90IHByb3Rl
Y3Rpb25fbWFwWzE2XSA9IHsKPiAgICAgICAgIFtWTV9FWEVDXSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgID0gUEFHRV9FWEVDLAo+ICAgICAgICAgW1ZNX0VYRUMgfCBWTV9S
RUFEXSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSBQQUdFX1JFQURfRVhFQywKPiAgICAg
ICAgIFtWTV9FWEVDIHwgVk1fV1JJVEVdICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gUEFH
RV9DT1BZX0VYRUMsCj4gLSAgICAgICBbVk1fRVhFQyB8IFZNX1dSSVRFIHwgVk1fUkVBRF0gICAg
ICAgICAgICAgICAgICA9IFBBR0VfQ09QWV9SRUFEX0VYRUMsCj4gKyAgICAgICBbVk1fRVhFQyB8
IFZNX1dSSVRFIHwgVk1fUkVBRF0gICAgICAgICAgICAgICAgICA9IFBBR0VfQ09QWV9FWEVDLAo+
ICAgICAgICAgW1ZNX1NIQVJFRF0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
PSBQQUdFX05PTkUsCj4gICAgICAgICBbVk1fU0hBUkVEIHwgVk1fUkVBRF0gICAgICAgICAgICAg
ICAgICAgICAgICAgICA9IFBBR0VfUkVBRCwKPiAgICAgICAgIFtWTV9TSEFSRUQgfCBWTV9XUklU
RV0gICAgICAgICAgICAgICAgICAgICAgICAgID0gUEFHRV9TSEFSRUQsCj4gLS0KPiAyLjM0LjEK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
