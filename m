Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E071C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 07:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZglsGn/U1AA5/iroe9DmUJOWwNSWRrSni6d1QX8fO8=; b=Xr6Xb7gX3wg8kq
	ERNNfB0C3D0djyWVCjJW6HR/6JbtVaqseIg4aTLo8zuFXVMfgZWmfAj4/tvuHK588kYltecDAAIlX
	yel6Un+QyF28nhLMpwqL0DJPgp5LckDCOaTiF0pQH5UANRmll//+XjYFpoBNEb+1HhPhMl2P8ECRK
	ZC9YitqJg//LupdD/hddlq4CGnX4aw/h6NCv8NUwiQRwwB7MVcwEcSI38c4i1CBporaOAKEdVuLcf
	Yeh5rCFDHBBUlxkZnXACF2S2r2Zt9at9C5v3/hdZmpEQn8o1qbEsXSDVHfgR5xBYedqB4OA/tPPRP
	MgE26gL/Kqz60I3HfO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUhm4-00000001syT-3Fvl;
	Fri, 19 Jul 2024 07:11:29 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUhm0-00000001sxr-44SX
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 07:11:27 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-36872b6d9bcso21513f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 00:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721373083; x=1721977883; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jk306sEtt+KWaIxzvPA3Rfg8FT2T2O98W/TT8wSXjjI=;
        b=EYV3pT+lA+8cUIhXCjXDWicUJomuKHaORaOk2xuDAvP7T5xEcPc9zrIQemcRmJK7ux
         cunqVXsornbfroyahZr1+FP6Rd2UQ8KpJULkIIM6323uV3yVJWBfiYMAdHR6bBK6HldH
         x7x9N738fAsVB7BDNtIkvJj2RrcM+Ojk+Xf9rZxCQ8bKEHITNHA3r5VM3OEi8IB2crr5
         G+a7I9mUPMM/m3+lM3hDm7MAsbXU1ZrHiVa9g8lgAKZjjwhV5NqozCExLHpf1wU0Krgo
         hf0KINFlHu0LKDvN8RZyl3fQynVhtXGuUrNWz1etJEqs/N5uKPmNLi0xNh5yES+XotV7
         jB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721373083; x=1721977883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jk306sEtt+KWaIxzvPA3Rfg8FT2T2O98W/TT8wSXjjI=;
        b=FmyJB1WfDub0QITUXwxslhIw10hHZWKInjbiSdU/GdrgQWY4MlSvclUjpuvZMyjSVD
         1lWHGws/0xcmbZjy8CTaJUxNT1eovpJ+540SIl5NgC0RJ2felcMXdURMnvkTwoqSmz3Q
         KFmirWOpjcywOj3Q7+b0xYXjK0MHCEouXv2N8R3lU8Fn371qcn6TgHqxLMfgLwyNCsJ+
         OeObROpYImciJg4UrP/DqmcGTgXKBqRbkU2qEA72YewtQdlucLIARaRHfBRBh0pWM3Fa
         4fHOAAe1XrOv0cKUZIkeqaVf33U6yvzhZkwcbfO5n+7UZOBFHEu+S6cgKMMHnREO3LbW
         9xUA==
X-Forwarded-Encrypted: i=1; AJvYcCVQfKL9x6z8gOcVoX/++FC8Cxq1lsv7wv5grRhN+E7SyCsvfPvq1A0hzzGHqe0qHjD5EFjgwF+FW7WMk2/kN+wV4uLK5cfXUioaOe/VDYKY
X-Gm-Message-State: AOJu0YyQ22NZKR1y1uQtllvSJch+yrRR9KomMJ5aDFJglyDQoiTIBDqt
	z6FnWwa0DEDMmJwOPV/wf4kqUnktjAxEkWB8FUYF2YonmopsIZtPkdAWnCZ3MYg=
X-Google-Smtp-Source: AGHT+IFFa900iN8dkh57FH8wZ/8l1M9ljJMs0GMKFosTl1JPDR750e2hW2JZvmRu6cWA8I4/lSFCJw==
X-Received: by 2002:a5d:64e1:0:b0:35f:2a75:91fd with SMTP id ffacd0b85a97d-36872c9ce9cmr760384f8f.6.1721373082617;
        Fri, 19 Jul 2024 00:11:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36878684757sm791766f8f.10.2024.07.19.00.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 00:11:22 -0700 (PDT)
Message-ID: <a36e07a1-f4da-4d6f-9e68-929b77b70836@rivosinc.com>
Date: Fri, 19 Jul 2024 09:11:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes] riscv: cpufeature: Do not drop Linux-internal
 extensions
To: Andrew Jones <ajones@ventanamicro.com>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>,
 Evan Green <evan@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel@vger.kernel.org
References: <20240718213011.2600150-1-samuel.holland@sifive.com>
 <20240718-a5097a4070f457529d2fff91@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240718-a5097a4070f457529d2fff91@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_001125_295574_3E0F1574 
X-CRM114-Status: GOOD (  23.34  )
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

CgpPbiAxOC8wNy8yMDI0IDIzOjU3LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gVGh1LCBKdWwg
MTgsIDIwMjQgYXQgMDI6Mjk6NTlQTSBHTVQsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+PiBUaGUg
TGludXgtaW50ZXJuYWwgWGxpbnV4ZW52Y2ZnIElTQSBleHRlbnNpb24gaXMgb21pdHRlZCBmcm9t
IHRoZQo+PiByaXNjdl9pc2FfZXh0IGFycmF5IGJlY2F1c2UgaXQgaGFzIG5vIERUIGJpbmRpbmcg
YW5kIHNob3VsZCBub3QgYXBwZWFyCj4+IGluIC9wcm9jL2NwdWluZm8uIFRoZSBsb2dpYyBhZGRl
ZCBpbiBjb21taXQgNjI1MDM0YWJkNTJhICgicmlzY3Y6IGFkZAo+PiBJU0EgZXh0ZW5zaW9ucyB2
YWxpZGF0aW9uIGNhbGxiYWNrIikgYXNzdW1lcyBhbGwgZXh0ZW5zaW9ucyBhcmUgaW5jbHVkZWQK
Pj4gaW4gcmlzY3ZfaXNhX2V4dCwgYW5kIHNvIHJpc2N2X3Jlc29sdmVfaXNhKCkgd3JvbmdseSBk
cm9wcyBYbGludXhlbnZjZmcKPj4gZnJvbSB0aGUgZmluYWwgSVNBIHN0cmluZy4gSW5zdGVhZCwg
YWNjZXB0IHN1Y2ggTGludXgtaW50ZXJuYWwgSVNBCj4+IGV4dGVuc2lvbnMgYXMgaWYgdGhleSBo
YXZlIG5vIHZhbGlkYXRpb24gY2FsbGJhY2suCj4gCj4gVGhpcyBhc3N1bWVzIHdlJ2xsIG5ldmVy
IG5lZWQgYSB2YWxpZGF0aW9uIGNhbGxiYWNrIGZvciBhIExpbnV4LWludGVybmFsCj4gSVNBIGV4
dGVuc2lvbi4gV2UgY2FuIG1ha2UgdGhhdCBhc3N1bXB0aW9uIG5vdyBhbmQgY2hhbmdlIG91ciBt
aW5kCj4gbGF0ZXIsIGJ1dCB3ZSBjb3VsZCBhbHNvIGFkZCBYbGludXhlbnZjZmcgdG8gcmlzY3Zf
aXNhX2V4dCBub3cgYW5kCj4gbW9kaWZ5IHRoZSBwbGFjZXMgd2hlcmUgaXQgbWF0dGVycyAoanVz
dCBwcmludF9pc2E/KS4gSWYgd2UgYWRkCj4gWGxpbnV4ZW52Y2ZnIHRvIHRoZSBhcnJheSB3aXRo
IGEgTlVMTCBuYW1lIHRoZW4gd2UgY291bGQgZG8gc29tZXRoaW5nCj4gbGlrZQo+IAo+ICBwcmlu
dF9pc2EoKQo+ICB7Cj4gICAgIGZvciAoLi4uKSB7Cj4gICAgICAgICAuLi4KPiAgICAgICAgIGlm
ICghcmlzY3ZfaXNhX2V4dFtpXS5uYW1lKQo+IAkgICBjb250aW51ZTsKPiAgICAgfQo+ICB9CgpJ
IHdvdWxkIHJhdGhlciBhZGQgaXQgdG8gdGhlIHJpc2N2X2lzYV9leHRbXSBhcnJheSBhbmQgYXZv
aWQgaGFuZGxpbmcgaXQKZGlmZmVyZW50bHkuIFRoZXJlIGlzIGFscmVhZHkgdGhlIHhhbmRlc3Bt
dSBleHRlbnNpb24gaW4gdGhpcyBhcnJheSBzbwp4bGludXhlbnZjZmcgY2FuIGJlIGFkZGVkIGFz
IHdlbGwuCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPj4KPj4gRml4ZXM6IDYyNTAzNGFiZDUyYSAo
InJpc2N2OiBhZGQgSVNBIGV4dGVuc2lvbnMgdmFsaWRhdGlvbiBjYWxsYmFjayIpCj4+IFNpZ25l
ZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+PiAt
LS0KPj4KPj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDE0ICsrKysrKy0tLS0t
LS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4+IGluZGV4IDAzNjZkYzNiYWYzMy4uZGQyNTY3N2Q2
MGRlIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPj4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4+IEBAIC00NTcsMjggKzQ1NywyNiBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgcmlzY3ZfcmVzb2x2ZV9pc2EodW5zaWduZWQgbG9uZyAqc291
cmNlX2lzYSwKPj4gIAkJYml0bWFwX2NvcHkocHJldl9yZXNvbHZlZF9pc2EsIHJlc29sdmVkX2lz
YSwgUklTQ1ZfSVNBX0VYVF9NQVgpOwo+PiAgCQlmb3JfZWFjaF9zZXRfYml0KGJpdCwgc291cmNl
X2lzYSwgUklTQ1ZfSVNBX0VYVF9NQVgpIHsKPj4gIAkJCWV4dCA9IHJpc2N2X2dldF9pc2FfZXh0
X2RhdGEoYml0KTsKPj4gLQkJCWlmICghZXh0KQo+PiAtCQkJCWNvbnRpbnVlOwo+PiAgCj4+IC0J
CQlpZiAoZXh0LT52YWxpZGF0ZSkgewo+PiArCQkJaWYgKGV4dCAmJiBleHQtPnZhbGlkYXRlKSB7
Cj4+ICAJCQkJcmV0ID0gZXh0LT52YWxpZGF0ZShleHQsIHJlc29sdmVkX2lzYSk7Cj4+ICAJCQkJ
aWYgKHJldCA9PSAtRVBST0JFX0RFRkVSKSB7Cj4+ICAJCQkJCWxvb3AgPSB0cnVlOwo+PiAgCQkJ
CQljb250aW51ZTsKPj4gIAkJCQl9IGVsc2UgaWYgKHJldCkgewo+PiAgCQkJCQkvKiBEaXNhYmxl
IHRoZSBleHRlbnNpb24gZW50aXJlbHkgKi8KPj4gLQkJCQkJY2xlYXJfYml0KGV4dC0+aWQsIHNv
dXJjZV9pc2EpOwo+PiArCQkJCQljbGVhcl9iaXQoYml0LCBzb3VyY2VfaXNhKTsKPj4gIAkJCQkJ
Y29udGludWU7Cj4+ICAJCQkJfQo+PiAgCQkJfQo+PiAgCj4+IC0JCQlzZXRfYml0KGV4dC0+aWQs
IHJlc29sdmVkX2lzYSk7Cj4+ICsJCQlzZXRfYml0KGJpdCwgcmVzb2x2ZWRfaXNhKTsKPj4gIAkJ
CS8qIE5vIG5lZWQgdG8ga2VlcCBpdCBpbiBzb3VyY2UgaXNhIG5vdyB0aGF0IGl0IGlzIGVuYWJs
ZWQgKi8KPj4gLQkJCWNsZWFyX2JpdChleHQtPmlkLCBzb3VyY2VfaXNhKTsKPj4gKwkJCWNsZWFy
X2JpdChiaXQsIHNvdXJjZV9pc2EpOwo+PiAgCj4+ICAJCQkvKiBTaW5nbGUgbGV0dGVyIGV4dGVu
c2lvbnMgZ2V0IHNldCBpbiBod2NhcCAqLwo+PiAtCQkJaWYgKGV4dC0+aWQgPCBSSVNDVl9JU0Ff
RVhUX0JBU0UpCj4+IC0JCQkJKnRoaXNfaHdjYXAgfD0gaXNhMmh3Y2FwW2V4dC0+aWRdOwo+PiAr
CQkJaWYgKGJpdCA8IFJJU0NWX0lTQV9FWFRfQkFTRSkKPj4gKwkJCQkqdGhpc19od2NhcCB8PSBp
c2EyaHdjYXBbYml0XTsKPj4gIAkJfQo+PiAgCX0gd2hpbGUgKGxvb3AgJiYgbWVtY21wKHByZXZf
cmVzb2x2ZWRfaXNhLCByZXNvbHZlZF9pc2EsIHNpemVvZihwcmV2X3Jlc29sdmVkX2lzYSkpKTsK
Pj4gIH0KPj4gLS0gCj4+IDIuNDUuMQo+Pgo+IAo+IElmIHdlJ2QgcmF0aGVyIGxlYXZlIFhsaW51
eGVudmNmZyBvdXQgb2YgdGhlIGFycmF5IChhbmQgZ2VuZXJhbGx5IHN1cHBvcnQKPiBleHRlbnNp
b25zIG5vdCBpbiB0aGUgYXJyYXkpLCB0aGVuIExHVE0KPiAKPiBSZXZpZXdlZC1ieTogQW5kcmV3
IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiAKPiBUaGFua3MsCj4gZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
