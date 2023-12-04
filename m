Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E363C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 11:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/STvUNMPDqtTvHOYLRgaUfrhhOsbghVdg9Co9bjA5k0=; b=eJqBGRsIbo5Nlw
	SZESesyMiIimAt8fAhO20b4jY6L7gDfFeYYO9I3DhBC1pXfYyMEemuTGHMnb3KlBtJsIFZUH2ciDp
	THqsgT7Z25I4oL6VG8tSoWcDn19NH7JFhOy+PKHaw/ble/nNniB/vFpuFjNr9wKgJ4Q0NR+AJLK9v
	jMN+efMbBODRwSymoEtOQqU8Gepzm72oFH0IxJec6+NctqVIfNBlmL5h6DgBVZbexsUfBZvkKyPYn
	0vTGCuKD5stKQjJ7NPcxllEjSOywCY5it8Jw8k8m5McvOi/b4q0/TB6XFVQR7ttWlsTrRkAP68uI7
	7bxuvdq5Lm9KmFoyhhCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA7Bi-003eVP-03;
	Mon, 04 Dec 2023 11:32:34 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA7Bc-003eUF-2F
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 11:32:31 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40bd5eaa66eso23410185e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 03:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701689545; x=1702294345; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k24kTPlVkd21kNiwlx5AXtWzxUb1iLhkKqVaC17WY/Y=;
        b=R8JumpUG1L/C2X03lGTne96Objwp+OgpNzcvojWCWWRmyV6Ie+PNDqLnTp4JUwZWoU
         b1rywLX2umU5OAl+mYI/njmAVZg8Dw7c0VNoBTbcyw2FXzIdjK+HmHrK/n/0uJ4En4/l
         EIXd/OIwXv5jzduLdA2DuJAWifh3f3Kj5zH/IxzyxJJbB6loipvANdUONTXKuRP+uM3f
         YZyg89Fa1XUyTkdlYR+YkD07WvbCSCvgV2TqdRopqTwtMTLfjbcYdDKYyrv9jjhr54qw
         UPwktFKtI4MUyCoLwUsnIRa8SsuH28Hb3eE/l6OO0GxTlVfu62eMKjdXxd8RzIt9ubvP
         V0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701689545; x=1702294345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k24kTPlVkd21kNiwlx5AXtWzxUb1iLhkKqVaC17WY/Y=;
        b=Mhqk9BVe/MRq2daSaCg3zikqHmJkSYTIsTvWuUKgymtxaFYmS0CwTpj43okjFkxyoL
         ClV0aKSPMonUN+UO/PwWG3GX7ZnNl9jI3YbTu4rZ2mTCoGgJiW6LHm16TR2ti4Nb4f8R
         Hd2CmkkBjFcI8nLTWLApu8mzn5wY9KvlTWtG+Jr3qVYPL/BwvNreNRnEJSPKtKJ56bN4
         joW+7QuzrWATdFOwibnyV7sEcxz+aIkVH6A7ACTZJtdqBQzvoSW/7puEC94CuuaGLYjJ
         a0bcPOJAwfaU2WdXew27LNej0i+F5WzBH0I858bUre6f6FRX1L7/AdhKKBTd5cn3Kne/
         n0OA==
X-Gm-Message-State: AOJu0YxaHS5LlbYLuDp5rTKCELcxRx6s4kDREqmfx72AvkBXSup+KmaQ
	w1DckglwVH/zEY/gaOotnuAcN6vAY3EbMK5EyVc=
X-Google-Smtp-Source: AGHT+IErNZnZcr/TyviXxvsAwPQtN/v+Nlqzyb1HJSfOFwnV8njyLvYHhsJtg7HkXjuZQ5dLEL6OcQ==
X-Received: by 2002:a05:600c:5d5:b0:40b:5e21:ec33 with SMTP id p21-20020a05600c05d500b0040b5e21ec33mr2310718wmd.101.1701689545469;
        Mon, 04 Dec 2023 03:32:25 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id u2-20020a05600c138200b00405d9a950a2sm18390025wmf.28.2023.12.04.03.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 03:32:24 -0800 (PST)
Date: Mon, 4 Dec 2023 12:32:24 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Vipin Sharma <vipinsh@google.com>, David Matlack <dmatlack@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 9/9] KVM: riscv: selftests: Add sstc timer test
Message-ID: <20231204-980c95cca344f718ac6a48b6@orel>
References: <cover.1694421911.git.haibo1.xu@intel.com>
 <64e0637cd6f22dd7557ed44bd2242001e7830d1c.1694421911.git.haibo1.xu@intel.com>
 <20230914-d2e594e7d84503ad14036e2d@orel>
 <CAJve8onhY534T=Hyncjfi4GfdZ+0D2xM+jRSaYCAWCdaKxPUcQ@mail.gmail.com>
 <CAJve8omitHDpijJaLV_wHk+5LXpsBUWF8_eTD4MeWKM-807Siw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8omitHDpijJaLV_wHk+5LXpsBUWF8_eTD4MeWKM-807Siw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_033228_942953_45EDA8F0 
X-CRM114-Status: GOOD (  27.45  )
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

T24gTW9uLCBEZWMgMDQsIDIwMjMgYXQgMTA6NDI6MjRBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gT24gRnJpLCBTZXAgMTUsIDIwMjMgYXQgMjoyMeKAr1BNIEhhaWJvIFh1IDx4aWFvYm81NXhA
Z21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIFNlcCAxNCwgMjAyMyBhdCA1OjUy4oCv
UE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IE9uIFRodSwgU2VwIDE0LCAyMDIzIGF0IDA5OjM3OjAzQU0gKzA4MDAsIEhhaWJvIFh1IHdy
b3RlOgo+ID4gPiA+IEFkZCBhIEtWTSBzZWxmdGVzdHMgdG8gdmFsaWRhdGUgdGhlIFNzdGMgdGlt
ZXIgZnVuY3Rpb25hbGl0eS4KPiA+ID4gPiBUaGUgdGVzdCB3YXMgcG9ydGVkIGZyb20gYXJtNjQg
YXJjaCB0aW1lciB0ZXN0Lgo+ID4gPgo+ID4gPiBJIGp1c3QgdHJpZWQgdGhpcyB0ZXN0IG91dC4g
UnVubmluZyBpdCBvdmVyIGFuZCBvdmVyIGFnYWluIG9uIFFFTVUgSSBzZWUKPiA+ID4gaXQgd29y
a3Mgc29tZXRpbWVzLCBidXQgaXQgZnJlcXVlbnRseSBmYWlscyB3aXRoIHRoZQo+ID4gPiBHVUVT
VF9BU1NFUlRfRVEoY29uZmlnX2l0ZXIgKyAxLCBpcnFfaXRlcikgYXNzZXJ0IGFuZCBhdCBsZWFz
dCBvbmNlIEkKPiA+ID4gYWxzbyBzYXcgdGhlIF9fR1VFU1RfQVNTRVJUKHhjbnQgPj0gY21wKSBh
c3NlcnQuCj4gPiA+Cj4gPgo+ID4gR29vZCBjYXRjaCEKPiA+Cj4gPiBJIGNhbiBhbHNvIHJlcHJv
ZHVjZSB0aGlzIGlzc3VlIGFuZCBpdCBpcyBhIGNvbW1vbiBwcm9ibGVtIGZvciBib3RoCj4gPiBh
cm02NCBhbmQgcmlzY3YgYmVjYXVzZSBpdCBhbHNvIGhhcHBlbnMgaW4gYSBhcm02NCBRZW11IFZN
Lgo+ID4KPiA+IEl0IHNlZW1zIGxpa2UgYSBzeW5jaHJvbml6YXRpb24gaXNzdWUgYmV0d2VlbiBo
b3N0IGFuZCBndWVzdCBzaGFyZWQKPiA+IHZhcmlhYmxlcy4gV2lsbCBkb3VibGUgY2hlY2sgdGhl
IHRlc3QgY29kZS4KPiA+Cj4gPiA+IFRoYW5rcywKPiA+ID4gZHJldwo+IAo+IEhpIEFuZHJldywK
PiAKPiBBZnRlciBzZXZlcmFsIHJvdW5kcyBvZiByZWdyZXNzaW9uIHRlc3RpbmcsIHNvbWUgZmlu
ZGluZ3M6Cj4gMS4gVGhlIGludGVybWl0dGVudCBmYWlsdXJlIGFsc28gaGFwcGVuZWQgb24gQVJN
NjQgUWVtdSBWTSwgYW5kIGV2ZW4KPiBpbiB0aGUgaW5pdGlhbCBhcmNoX3RpbWVyIGNvbW1pdCg0
OTU5ZDg2NTBlOWY0KS4KPiAyLiBpdCBkaWRuJ3QgaGFwcGVuIG9uIGEgQVJNNjQgSFcoYnV0IGEg
ZGlmZmVyZW50IGZhaWx1cmUgb2NjdXJlZAo+IGR1cmluZyBzdHJlc3MgdGVzdCkKPiAzLiBUaGUg
ZmFpbHVyZSBoYXZlIGEgY2xvc2UgcmVsYXRpb25zaGlwIHdpdGgKPiBUSU1FUl9URVNUX0VSUl9N
QVJHSU5fVVMoZGVmYXVsdCAxMDApLCBhbmQgYWZ0ZXIgaW5jcmVhc2luZwo+ICAgICAgdGhlIG1h
Y3JvIHRvIDMwMCwgdGhlIGZhaWx1cmUgY291bGRuJ3QgcmVwcm9kdWNlZCBpbiAxMDAwIGxvb3Bz
Cj4gc3RyZXNzIHRlc3QgaW4gUklTQy1WIFFlbXUgVk0KPiAKPiBTbyBteSBzdWdnZXN0aW9uIGlz
IHdlIGNhbiBleHBvc2UgdGhlIFRJTUVSX1RFU1RfRVJSX01BUkdJTl9VUwo+IHBhcmFtZXRlciBh
cyBhbiBhcmNoX3RpbWVyIHRlc3QgYXJnIHBhcmFtZXRlcgo+IGFuZCB0dW5lIGl0IGJhc2VkIG9u
IGEgc3BlY2lmaWMgdGVzdCBlbnZpcm9ubWVudC4KPiAKPiBXaGF0J3MgeW91ciBvcGluaW9uPwoK
VGhlIGNvbmNlcHQgb2YgInRpbWVvdXQgZm9yIGFuIGludGVycnVwdCB0byBhcnJpdmUiIGlzIGFs
d2F5cyBnb2luZyB0bwpsZWF2ZSB1cyBleHBvc2VkIHRvIHJhbmRvbSBmYWlsdXJlcy4gWW91ciBz
dWdnZXN0aW9uIG9mIG1ha2luZyB0aGUKdGltZW91dCB1c2VyIGNvbmZpZ3VyYWJsZSBpcyBwcm9i
YWJseSB0aGUgYmVzdCB3ZSBjYW4gZG8uIEkgd291bGQKc3VnZ2VzdCBhbHNvIGFkZGluZyBtb3Jl
IGRlc2NyaXB0aXZlIGZhaWx1cmUgdGV4dCBhbmQgYSBoaW50IGFib3V0CnRyeWluZyB0byBhZGp1
c3QgdGhlIHRpbWVvdXQuCgpPciwgb25lIHRoaW5nIHdlIGRvIGluIGt2bS11bml0LXRlc3RzLCBp
cyB0byByZWR1Y2UgdHlwaWNhbCBkZWxheXMgd2hpbGUKYWxsb3dpbmcgZXhwZWN0ZWQgZGVsYXlz
IHRvIGJlIGxvbmdlciBieSBsb29waW5nIG92ZXIgYSBzaG9ydGVyIGRlbGF5IGFuZAphIG5vbi1m
YXRhbCBjaGVjaywgaS5lLgoKIHBhc3MgPSBmYWxzZTsKIGZvciAoaSA9IDA7IGkgPCAxMDsgaSsr
KSB7CiAgIHVkZWxheSgxMDApOwogICBpZiAoY2hlY2soLi4uKSkgewogICAgICBwYXNzID0gdHJ1
ZTsKICAgICAgYnJlYWs7CiAgIH0KIH0KIGFzc2VydChwYXNzKTsKCldlIGNvdWxkIHRyeSB0aGF0
IGFwcHJvYWNoIGhlcmUgdG9vLgoKVGhhbmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
