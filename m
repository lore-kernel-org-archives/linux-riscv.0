Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702E0E80AB1
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsl8E0/tj2ywOef15nSQ3o6uk46LA0scvu7Oczavpec=; b=pq4RqzHW3+2Gp6
	K9m3iKPUDlb5I2NDPwIL5raLwIHnAJLXmNHGxw54r8T9OzrmlO5CG/dPpBhaIzon+BAN7nEkExWYO
	H2QwgubYPnVnPwxEme5xXWbLBL16mMi85XDibYPsHofnwEsOr0TR5Alz/5kmdyrNtjQ7qJZEshq2h
	gEvlk3Dn5Rb8dC5g1wCX2TOB54+OB8Q96XqMhN2oBkVJBxqC2cyS6qpy4XzKIl7xNPedst1GWAsjW
	zFcNHZ7/+day5BLV3uivh0vIzpoY8iHEr9CFUf6X9U3J/6DzBYY5q/261d0O1fpOByiFWwP8dV904
	UEUNmbc2rY+RKU7Ky31w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVTQ-00188A-0o;
	Wed, 27 Sep 2023 14:25:08 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVTN-00186n-0i
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 14:25:06 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7a7e11a53c3so8079877241.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 07:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695824701; x=1696429501; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zBtvWgKmM9zJhcy404AwOZ/qden8YZEKEMkYgmkSGM=;
        b=GrTUQy5jg5yXN6AV3FOmPccsJFgYSlSB+Vqy58jb5B+2ZRIFvvRwjWyPoVIPUnI3ym
         i0pDCF/kgTBMKgy5kDMrBOhDsCR90L1iNJc+ANuFv6oWOZdklHtm7jiVM2LWFK/ri5DL
         HRiNKpzn/IWguZxpPG4JKRFGxNsRN0Gww9dGif3KISDtzrgIbFzfCWhf7QRQmsJtN+Cz
         1Q87otWpOwSHrgtbkseJTMlh4q6szt60qpVsAQJgEndMrV3iRC5ZWp+FCJNmvreaWC1z
         YbLmUd2JtNvQqte+5g6Q7M4Xbih5iVWdPVZlLctthRt9NAo7vLgiKdjZShe7PRCB7sot
         WS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695824701; x=1696429501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zBtvWgKmM9zJhcy404AwOZ/qden8YZEKEMkYgmkSGM=;
        b=T4aDd0u14GxOeVJtEAdJA6Zv6xugZi1SZxOUNLs8oQ5fZpmZgJVaiGjJTlwJ15w33I
         +1xNPOdHO4S7oAfJXP4f7oe0PDiQDHAznNqCOL6C4p7+lHuov7jQrFhBkuXULiziihDX
         noJNUsIJTpl5ad4xDT9jFSiVZZl3vFeSDF/9nQ12BkX0vzFmY00vweEZpaCII1fJLiOj
         ZSxYKSBfQSgMWWtdE9mmY4mLW3ufH2tMj/N3tFM/9El2Q3nsMfdTEjBURMLUDvKgP+NS
         Zdy6GWXLkbbyvrZ4OysoduzBw9Gs8FAagXG+9SHJPtqhCZxuQmsxcBqIMa3OySCdVSuK
         zZ0Q==
X-Gm-Message-State: AOJu0YyvMbCkfc6lQF02OTQ7+TymL/2AI0n0u+ht/YvliALivVPMEONi
	6CyUu+3LrmcLfqBFYl+9o8/r0Gt4oIHc7ZcmBOg+Lw==
X-Google-Smtp-Source: AGHT+IEupaxxfC2vLKvvjDNkNI5Xiaf744yeHqsHZNxC5INiulcJS9XScdmDGlNcxeJW5zjArMSL/morCgR2JHbUOjc=
X-Received: by 2002:a05:6102:3f05:b0:452:79da:94a with SMTP id
 k5-20020a0561023f0500b0045279da094amr3772881vsv.4.1695824701267; Wed, 27 Sep
 2023 07:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
 <20230925-gorged-boxer-3804735e2d18@spud> <20230925-reappear-unkind-7f31acdd82de@spud>
In-Reply-To: <20230925-reappear-unkind-7f31acdd82de@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 27 Sep 2023 19:54:49 +0530
Message-ID: <CAK9=C2UBgNWFTdQKt29+bNnWDgHZGd5fU+oP1bqsarkqc5+jgg@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] KVM RISC-V Conditional Operations
To: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_072505_268208_BE27DD2C 
X-CRM114-Status: GOOD (  21.97  )
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

T24gTW9uLCBTZXAgMjUsIDIwMjMgYXQgOTowN+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCAyNSwgMjAyMyBhdCAwNDozMzoxNVBNICsw
MTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBPbiBNb24sIFNlcCAyNSwgMjAyMyBhdCAwNzow
ODo1MFBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gPiBUaGlzIHNlcmllcyBleHRlbmRz
IEtWTSBSSVNDLVYgdG8gYWxsb3cgR3Vlc3QvVk0gZGlzY292ZXIgYW5kIHVzZQo+ID4gPiBjb25k
aXRpb25hbCBvcGVyYXRpb25zIHJlbGF0ZWQgSVNBIGV4dGVuc2lvbnMgKG5hbWVseSBYVmVudGFu
YUNvbmRPcHMKPiA+ID4gYW5kIFppY29uZCkuCj4gPiA+Cj4gPiA+IFRvIHRyeSB0aGVzZSBwYXRj
aGVzLCB1c2UgS1ZNVE9PTCBmcm9tIHJpc2N2X3pieF96aWNudHJfc21zdGF0ZWVuX2NvbmRvcHNf
djEKPiA+ID4gYnJhbmNoIGF0OiBodHRwczovL2dpdGh1Yi5jb20vYXZwYXRlbC9rdm10b29sLmdp
dAo+ID4gPgo+ID4gPiBUaGVzZSBwYXRjaGVzIGFyZSBiYXNlZCB1cG9uIHRoZSBsYXRlc3Qgcmlz
Y3Zfa3ZtX3F1ZXVlIGFuZCBjYW4gYWxzbyBiZQo+ID4gPiBmb3VuZCBpbiB0aGUgcmlzY3Zfa3Zt
X2NvbmRvcHNfdjIgYnJhbmNoIGF0Ogo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vYXZwYXRlbC9s
aW51eC5naXQKPiA+ID4KPiA+ID4gQ2hhbmdlcyBzaW5jZSB2MToKPiA+ID4gIC0gUmViYXNlZCB0
aGUgc2VyaWVzIG9uIHJpc2N2X2t2bV9xdWV1ZQo+ID4gPiAgLSBTcGxpdCBQQVRDSDEgYW5kIFBB
VENIMiBvZiB2MSBzZXJpZXMgaW50byB0d28gcGF0Y2hlcwo+ID4gPiAgLSBBZGRlZCBzZXBhcmF0
ZSB0ZXN0IGNvbmZpZ3MgZm9yIFhWZW50YW5hQ29uZE9wcyBhbmQgWmljb25kIGluIFBBVENINwo+
ID4gPiAgICBvZiB2MSBzZXJpZXMuCj4gPiA+Cj4gPiA+IEFudXAgUGF0ZWwgKDkpOgo+ID4gPiAg
IGR0LWJpbmRpbmdzOiByaXNjdjogQWRkIFhWZW50YW5hQ29uZE9wcyBleHRlbnNpb24gZW50cnkK
PiA+ID4gICBSSVNDLVY6IERldGVjdCBYVmVudGFuYUNvbmRPcHMgZnJvbSBJU0Egc3RyaW5nCj4g
PiA+ICAgZHQtYmluZGluZ3M6IHJpc2N2OiBBZGQgWmljb25kIGV4dGVuc2lvbiBlbnRyeQo+ID4g
PiAgIFJJU0MtVjogRGV0ZWN0IFppY29uZCBmcm9tIElTQSBzdHJpbmcKPiA+Cj4gPiBGb3IgdGhl
c2UgNDoKPiA+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2No
aXAuY29tPgo+Cj4gQWN0dWFsbHksIG5vdyB0aGF0IEkgdGhpbmsgb2YgaXQsIEknbSBnb2luZyB0
byB0ZW1wb3JhcmlseSB1bi1yZXZpZXcgdGhpcy4KPiBGcm9tIHBhdGNoLWFjY2VwdGFuY2UucnN0
Ogo+IHwgQWRkaXRpb25hbGx5LCB0aGUgUklTQy1WIHNwZWNpZmljYXRpb24gYWxsb3dzIGltcGxl
bWVudGVycyB0byBjcmVhdGUKPiB8IHRoZWlyIG93biBjdXN0b20gZXh0ZW5zaW9ucy4gIFRoZXNl
IGN1c3RvbSBleHRlbnNpb25zIGFyZW4ndCByZXF1aXJlZAo+IHwgdG8gZ28gdGhyb3VnaCBhbnkg
cmV2aWV3IG9yIHJhdGlmaWNhdGlvbiBwcm9jZXNzIGJ5IHRoZSBSSVNDLVYKPiB8IEZvdW5kYXRp
b24uICBUbyBhdm9pZCB0aGUgbWFpbnRlbmFuY2UgY29tcGxleGl0eSBhbmQgcG90ZW50aWFsCj4g
fCBwZXJmb3JtYW5jZSBpbXBhY3Qgb2YgYWRkaW5nIGtlcm5lbCBjb2RlIGZvciBpbXBsZW1lbnRv
ci1zcGVjaWZpYwo+IHwgUklTQy1WIGV4dGVuc2lvbnMsIHdlJ2xsIG9ubHkgY29uc2lkZXIgcGF0
Y2hlcyBmb3IgZXh0ZW5zaW9ucyB0aGF0IGVpdGhlcjoKPiB8Cj4gfCAtIEhhdmUgYmVlbiBvZmZp
Y2lhbGx5IGZyb3plbiBvciByYXRpZmllZCBieSB0aGUgUklTQy1WIEZvdW5kYXRpb24sIG9yCj4g
fCAtIEhhdmUgYmVlbiBpbXBsZW1lbnRlZCBpbiBoYXJkd2FyZSB0aGF0IGlzIHdpZGVseSBhdmFp
bGFibGUsIHBlciBzdGFuZGFyZAo+IHwgICBMaW51eCBwcmFjdGljZS4KPgo+IFRoZSB4dmVudGFu
YWNvbmRvcHMgYml0cyBkb24ndCBxdWFsaWZ5IHVuZGVyIHRoZSBmaXJzdCBlbnRyeSwgYW5kIEkK
PiBkb24ndCB0aGluayB0aGV5IHF1YWxpZnkgdW5kZXIgdGhlIHNlY29uZCB5ZXQuIEFtIEkgd3Jv
bmc/CgpUaGUgVmVudGFuYSBWZXlyb24gVjEgd2FzIGFubm91bmNlZCBpbiBEZWMgMjAyMiBhdCBS
SVNDLVYgc3VtbWl0CmZvbGxvd2VkIGJ5IHByZXNzIHJlbGVhc2VzOgpodHRwczovL3d3dy52ZW50
YW5hbWljcm8uY29tL3ZlbnRhbmEtaW50cm9kdWNlcy12ZXlyb24td29ybGRzLWZpcnN0LWRhdGEt
Y2VudGVyLWNsYXNzLXJpc2Mtdi1jcHUtcHJvZHVjdC1mYW1pbHkvCmh0dHBzOi8vd3d3LmVtYmVk
ZGVkLmNvbS92ZW50YW5hLXJldmVhbHMtcmlzYy12LWNwdS1jb21wdXRlLWNoaXBsZXQtZm9yLWRh
dGEtY2VudGVyLwpodHRwczovL3d3dy5wcm5ld3N3aXJlLmNvbS9uZXdzLXJlbGVhc2VzL3ZlbnRh
bmEtaW50cm9kdWNlcy12ZXlyb24td29ybGRzLWZpcnN0LWRhdGEtY2VudGVyLWNsYXNzLXJpc2Mt
di1jcHUtcHJvZHVjdC1mYW1pbHktMzAxNzAwOTg1Lmh0bWwKCkBQYWxtZXIgaWYgdGhlIGFib3Zl
IGxvb2tzIGdvb2QgdG8geW91IHRoZW4gcGxlYXNlIGFjayBQQVRDSDEtdG8tNAoKVGhhbmtzLApB
bnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
