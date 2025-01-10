Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA33E7719C
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 20:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+X1HYGA9YYRpOSMvm/53zjlPYPkvReFlrIAgL7FkI00=; b=5CE+whbKCpvxHC
	bM2IvYbt7VDOgLr3farXGjMGj05FxmY9DIJ5YdfnPkQo56MVxee9mgDPYhuyxAX3CbleH360Xt0Rn
	RSBRD0RLKvPC80b2C3I2nxLK6+UIj03a6ZUGFsis995VMRlgXKq6FA2vh6gUrLIID0EHAuFGPIhsw
	ZMT7C0G3pp/c7l2zMc2UTmxLz4ZlSZKpP6PtTxte1YLABGZwXhYT2d9IsLpvB3fIFs2mCZRbFjXbE
	VpBWyC/ZRNwDhPMe9e6NjUnVvj9y7EEssic3aWyzvT33DJXPL/4NxqsiUSTQd2zEMH0Wr2eRH4OEj
	nD9ppWcUI3Soa7ybhNXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWLvf-0000000GwSX-3kz5;
	Fri, 10 Jan 2025 20:48:27 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWLvc-0000000GwRp-2jz9
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 20:48:26 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3a9caa3726fso7993265ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 12:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736542103; x=1737146903; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3JFV56nbjgPx94a42Ef7RFHZlbLzNHms4G/1GzXED8=;
        b=edT7jQvMn6fOxoz8lbdF7FL/I68yN/avT0AvhEq7fk8axkvxrTy2NScGV5LMJKh4Tj
         WnKQlIIz1vzWvtuKFtY2O0ZoqGH7UE6YHhLcp9PuBChUagyxE5RI4Mu96Op+5wJ/ktMQ
         47li8cJO1c39hU24hbvrXi2jqebljCxH5KZd/jA3zLVFohkN6iKXnVr0Wu6iYkEa3Z6J
         Ov4FZA9kQTf/TV1LP2tnNSIQ/sD3i371Xl4hTom9XHCOZZawq/ZPaX878wg8k4dkKHEt
         /SuDx3OhZ1FcnoxRs/BWyNaaGUt5muqYW0c6otb7adun76bPKzCmeboQ5mgfHBGLsbY0
         kBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736542103; x=1737146903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3JFV56nbjgPx94a42Ef7RFHZlbLzNHms4G/1GzXED8=;
        b=BXnxv0uQQh//Xn6TqRmUP7KTfOz3IO6HPFbZmBTlXpJFICw5DyWaynDaihbtMI6jqm
         DFcrkwQ4putODZDGQqBsxex2mhhS1dm9cIg8e1QmjgQOhMqaQGzK+kEV8yDmLgPjA4uA
         HlljqTW/gQp01s4ki6DvGXALdqiHb4U1v1kByPw1hr7DdU8vUlRSU4fYIwLMjjP+ryDV
         px162L95iCe1lLBScUhB5+H/2Ff3iKgdY/OQxv3+t9jFktlTPSK4fS7UCUuQyc1vZtbD
         U1euEciCr9IeJk0ZUcLNcOsExu5Kjj6dULHB8KR05XY642YlTyL37AiPvC2FufpAFADi
         PEEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwbgw5qh52Jwl6K88zUHISOfNEJpDDNG0/Fca4vBywaUAER3eCkq4A8wf+5Sly0F/PepOizhxvc7z+yA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBCUHYIjE6F4LRclPZYfBPmd9OhJzmJ4UndEymc27JV/6q4e9K
	0cOJ8qjMqpmSG++CbV6vat561p0KMkYuFvnjFc+jfMry4e1UCBTJcLURO8xXuVHpZ1Hfluy9Pf+
	ba4DUNU/3p3Un98gh/hVN2EdD3VM1L9VvuK0Dww==
X-Gm-Gg: ASbGncvwj2YVP2C29uPs0WE1S009sD6MunUwAoY0XiaZyLpOkSulrBxp2BfYKW28wA2
	beaYySi1DiNdFSAsIs8HoF9Bs6FGHLI0KRZ1bRw==
X-Google-Smtp-Source: AGHT+IGaVBsQzJt2X5m/CW4/nbtDNJCmepn0QUZ4oXFhVYof2srhepeK9PBG9lGW9sbM4bw2dOIf1oolgAzWwgcTprU=
X-Received: by 2002:a05:6e02:3313:b0:3cd:e9a0:3c3d with SMTP id
 e9e14a558f8ab-3ce4af9463cmr66122455ab.2.1736542102941; Fri, 10 Jan 2025
 12:48:22 -0800 (PST)
MIME-Version: 1.0
References: <20250103024616.3359159-1-guoren@kernel.org> <a110be11-923e-4943-8741-43b5513c9691@ghiti.fr>
 <92eb2691-3b40-4549-83cf-fbdd0e98bf63@sifive.com> <CAJF2gTQomhrkYZORgG4ufRfQW3LhD4tG21GhX0v2Q=mR77mOKg@mail.gmail.com>
In-Reply-To: <CAJF2gTQomhrkYZORgG4ufRfQW3LhD4tG21GhX0v2Q=mR77mOKg@mail.gmail.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Fri, 10 Jan 2025 12:48:12 -0800
X-Gm-Features: AbW1kvaUzgPnWKD6v5lrZokE5U8BwE1gIyIKM9yEaUeUfakmC3sPneNPZHxJNzg
Message-ID: <CAH2o1u7UiNpAKfyJJ6t+yaQY_VpCOeXjki4BQLwsQuEEyG=c9A@mail.gmail.com>
Subject: Re: [PATCH] iommu/riscv: Fixup compile warning
To: Guo Ren <guoren@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, baolu.lu@linux.intel.com, zong.li@sifive.com, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_124824_960572_E7F3FC1A 
X-CRM114-Status: GOOD (  23.87  )
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

T24gVHVlLCBKYW4gNywgMjAyNSBhdCAxMDo0OOKAr1BNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IEhpIFNhbXVlbCAmIEFsZXhhbmRyZSwKPgo+IE9uIFR1ZSwgSmFuIDcs
IDIwMjUgYXQgMTo0N+KAr0FNIFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUu
Y29tPiB3cm90ZToKPiA+Cj4gPiBIaSBBbGV4LAo+ID4KPiA+IE9uIDIwMjUtMDEtMDYgNDozMSBB
TSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gPiBPbiAwMy8wMS8yMDI1IDAzOjQ2LCBndW9y
ZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+ID4+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5h
bGliYWJhLmNvbT4KPiA+ID4+Cj4gPiA+PiBXaGVuIF9fQklUU19QRVJfTE9ORyA9PSAzMiwgc2l6
ZV90IGlzIGRlZmluZWQgYXMgdW5zaWduZWQgaW50IHJhdGhlcgo+ID4gPgo+ID4gPgo+ID4gPiBS
SVNDVl9JT01NVSBkZXBlbmRzIG9uIDY0QklUIHNvIGhvdyBkbyB5b3UgZ2V0IF9fQklUU19QRVJf
TE9ORyA9PSAzMj8KPiA+Cj4gPiBJIGFtIGd1ZXNzaW5nIHRoaXMgaXMgZnJvbSBzb21lIGRvd25z
dHJlYW0gZWZmb3J0IHRvIGNvbXBpbGUgYSA2NC1iaXQga2VybmVsCj4gPiB3aXRoIGFuIElMUDMy
IEFCSS4gSG93ZXZlciB1bnN1cHBvcnRlZCB0aGF0IG1heSBiZSwgc2l6ZV90IGlzIHRoZSBub21p
bmFsIHR5cGUKPiA+IHVzZWQgaW4gYm90aCByaXNjdl9pb21tdV9wdGVfZmV0Y2goKSBhbmQgYWJv
dmUgaW4gaW9tbXVfaW90bGJfZ2F0aGVyX2FkZF9wYWdlKCksCj4gPiBzbyB0aGUgY2hhbmdlIGRv
ZXMgbWFrZSBzZW5zZS4KPiBZZXMsIEknbSB3b3JraW5nIG9uIElMUDMyIEFCSSBvbiBDT05GSUdf
NjRCSVQ9eS4gU28sIEkgZ290IHRoZSB3YXJuaW5nCj4gd2hlbiBfX0JJVFNfUEVSX0xPTkcgPT0g
MzIuCj4KPiBJbiByaXNjdl9pb21tdV91bm1hcF9wYWdlcygpLCB3ZSd2ZSB3cml0dGVuICJzaXpl
X3QgcHRlX3NpemU7LiIgU28sIHdlCj4gc2hvdWxkIGRvIHRoYXQgaW4gInJpc2N2X2lvbW11X2lv
dmFfdG9fcGh5cygpIi4KPgoKVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dC4KRG8gd2UgaGF2
ZSB0byBjaGFuZ2Ugb3RoZXIgcmVsZXZhbnQgdXNlcyBvZiBgdW5zaWduZWQgbG9uZ2AgdG8gZWl0
aGVyCmBwaHlzX2FkZHJfdGAgb3IgYGRtYV9hZGRyX3RgIHRvIGF2b2lkIHR5cGUgbWlzbWF0Y2gg
YW5kIGdldCBJTFAzMgp3b3JraW5nIGNvcnJlY3RseT8KCkFueXdheSwgZm9yIHF1aWNrIHdhcm5p
bmcgZml4OgpSZXZpZXdlZC1ieTogVG9tYXN6IEplem5hY2ggPHRqZXpuYWNoQHJpdm9zaW5jLmNv
bT4KCj4gPgo+ID4gUmVnYXJkcywKPiA+IFNhbXVlbAo+ID4KPiA+ID4+IHRoYW4gdW5zaWduZWQg
bG9uZy4gVGhlcmVmb3JlLCB3ZSBzaG91bGQgdXNlIHNpemVfdCB0byBhdm9pZAo+ID4gPj4gdHlw
ZS1jaGVja2luZyBlcnJvcnMuCj4gPiA+Pgo+ID4gPj4gRml4ZXM6IDQ4OGZmYmYxODE3MSAoImlv
bW11L3Jpc2N2OiBQYWdpbmcgZG9tYWluIHN1cHBvcnQiKQo+ID4gPj4gU2lnbmVkLW9mZi1ieTog
R3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPj4gU2lnbmVkLW9mZi1ieTog
R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiA+PiBDYzogVG9tYXN6IEplem5hY2ggPHRq
ZXpuYWNoQHJpdm9zaW5jLmNvbT4KPiA+ID4+IC0tLQo+ID4gPj4gICBkcml2ZXJzL2lvbW11L3Jp
c2N2L2lvbW11LmMgfCAyICstCj4gPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+ID4gPj4KPiA+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11
L3Jpc2N2L2lvbW11LmMgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPiA+ID4+IGluZGV4
IDhhMDVkZWY3NzRiZC4uMzhkMzgxMTY0Mzg1IDEwMDY0NAo+ID4gPj4gLS0tIGEvZHJpdmVycy9p
b21tdS9yaXNjdi9pb21tdS5jCj4gPiA+PiArKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LmMKPiA+ID4+IEBAIC0xMjcwLDcgKzEyNzAsNyBAQCBzdGF0aWMgcGh5c19hZGRyX3QgcmlzY3Zf
aW9tbXVfaW92YV90b19waHlzKHN0cnVjdAo+ID4gPj4gaW9tbXVfZG9tYWluICppb21tdV9kb21h
aW4sCj4gPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIGRtYV9hZGRyX3QgaW92YSkKPiA+
ID4+ICAgewo+ID4gPj4gICAgICAgc3RydWN0IHJpc2N2X2lvbW11X2RvbWFpbiAqZG9tYWluID0g
aW9tbXVfZG9tYWluX3RvX3Jpc2N2KGlvbW11X2RvbWFpbik7Cj4gPiA+PiAtICAgIHVuc2lnbmVk
IGxvbmcgcHRlX3NpemU7Cj4gPiA+PiArICAgIHNpemVfdCBwdGVfc2l6ZTsKPiA+ID4+ICAgICAg
IHVuc2lnbmVkIGxvbmcgKnB0cjsKPiA+ID4+ICAgICAgICAgcHRyID0gcmlzY3ZfaW9tbXVfcHRl
X2ZldGNoKGRvbWFpbiwgaW92YSwgJnB0ZV9zaXplKTsKPiA+Cj4KPgo+IC0tCj4gQmVzdCBSZWdh
cmRzCj4gIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
