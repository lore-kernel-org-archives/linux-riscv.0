Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7DAC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 07:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvMWTwnZSlSd+3ShjZe5sP7cCuMs80HmXIMcjmuAaQ0=; b=nA79Gnv8qiXT23
	zFXTZaEhUPNk4FbjsOhAzMeycahriNAkTqDiHg9eNHJG97yz3FAq1PCf1kkLjJrLlwoUbDK4dgyoa
	u/cTQ3g3lbnw78ktdV7PAfg8SjZR+btIrwtX8rdqs6AYw7AlLRX/g4SP9q2afqrbyYaCzqbN6tCdP
	/WlA1cW0t2rhsemieOsmBsA7GUTOsSmTY7WA42jjqGxT2OrfaBZl26LguDmzdBumf1D0u2SYF8Utz
	4EWu+Jo9UFz1NYEy6HIuSB+xysOA8y/ee6Ya1kHRZ9Krmop0x7rrYZqnrqJ4/ZZylxECQRyEtUAaq
	rclfs6Y9Brzh4kS6hzQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAQJx-006ZFz-0m;
	Tue, 05 Dec 2023 07:58:21 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAQJu-006ZED-1m;
	Tue, 05 Dec 2023 07:58:19 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50c0478f970so483044e87.3;
        Mon, 04 Dec 2023 23:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701763094; x=1702367894; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDaBQlGZ8UjeyvNNGC2XDs5wlZCfXV5wgyIn7Cj35I0=;
        b=ethQEPZwTi/sPsKIuDKLNmBzQ092vP3HZwcd011EjXq15Zbi8o9dDTOiWm8b8dkLKG
         0HushMJfofdCEa3b6yxXClIG5HrcWbKf4VfahKV/sv7FUPVgDSrCl28ww/Zdz4RMZzzc
         tLVDBPxrNQ5AqfnyNpUj3JiUbXfX+i47r8DGk+BxVyxrkTqgekBp2Gj6KDebX9YNvrSl
         P1dvH+hTsai2NARdhgJD7O1W1B6VTvEU/sZd1oTP6O3N/zDMMjpAmB6TIygSFcwLcZgX
         fSWh0tCRx4NMPzZ9sEukZTtgaflVMEZUTuYe2s1+ENAaqV/DBzU38h/h9QcMIz1ugh6L
         NCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701763094; x=1702367894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDaBQlGZ8UjeyvNNGC2XDs5wlZCfXV5wgyIn7Cj35I0=;
        b=lw0ZnzKOPdAgIsRAGBPaU9aA6r1fhV0q0GivwP4X+j4EK/r8CFlnrD8P+DrE0SP6jD
         mvvBC8GcPGFPD5NoIRU9Qx0n6p+fdj/u9sD/gWDtP7ytQnyWL9kSxDZftiBvGj0TU6+V
         ljKLqU5YEaKVpIwMJ16I0DeNJY41Y4ijJxJof/nQf9fZ95KD+dRlQwPJLE8GTS/OZgMX
         doGTvT1qkyjITuNzjRLRw58k1t7cGzTcPOGhWR5yYeaBNDC91nmlSFrvVHJE5pZsxUFC
         AdmmmFzoOGMiPkuefN0mPJwSEZbp0j6n46X3eP59662KghCa2arWHCkk6wcPsCyTjosD
         B3Bg==
X-Gm-Message-State: AOJu0YxHt7Wx2qVfVS9bRjy+aIlG2Q913x39Ji+QITayOx6YrG1sldDD
	3xjipuFfatuYEXgUnsQTBDoSnVF3ejdOE3/eBds=
X-Google-Smtp-Source: AGHT+IFB7AXgBvjJC6KXRzmHN5fiSmN/CqaafqDV8LUeWsssBRPFI6TrMLt6kXoA/HN17H0Nd9dUlNSsNYRV4on7U8I=
X-Received: by 2002:a05:6512:3b8f:b0:50b:f019:366a with SMTP id
 g15-20020a0565123b8f00b0050bf019366amr2333164lfv.109.1701763094196; Mon, 04
 Dec 2023 23:58:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1694421911.git.haibo1.xu@intel.com> <64e0637cd6f22dd7557ed44bd2242001e7830d1c.1694421911.git.haibo1.xu@intel.com>
 <20230914-d2e594e7d84503ad14036e2d@orel> <CAJve8onhY534T=Hyncjfi4GfdZ+0D2xM+jRSaYCAWCdaKxPUcQ@mail.gmail.com>
 <CAJve8omitHDpijJaLV_wHk+5LXpsBUWF8_eTD4MeWKM-807Siw@mail.gmail.com> <20231204-980c95cca344f718ac6a48b6@orel>
In-Reply-To: <20231204-980c95cca344f718ac6a48b6@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 5 Dec 2023 15:58:02 +0800
Message-ID: <CAJve8okwyPwY3AZcA31=aoc1tyZN7hx_5AmF0KMmn-bZ1VnyHA@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] KVM: riscv: selftests: Add sstc timer test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Vipin Sharma <vipinsh@google.com>, David Matlack <dmatlack@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_235818_590679_F8C3829A 
X-CRM114-Status: GOOD (  30.30  )
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

T24gTW9uLCBEZWMgNCwgMjAyMyBhdCA3OjMy4oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIERlYyAwNCwgMjAyMyBhdCAxMDo0Mjoy
NEFNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+IE9uIEZyaSwgU2VwIDE1LCAyMDIzIGF0IDI6
MjHigK9QTSBIYWlibyBYdSA8eGlhb2JvNTV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IE9uIFRodSwgU2VwIDE0LCAyMDIzIGF0IDU6NTLigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFRodSwgU2VwIDE0LCAy
MDIzIGF0IDA5OjM3OjAzQU0gKzA4MDAsIEhhaWJvIFh1IHdyb3RlOgo+ID4gPiA+ID4gQWRkIGEg
S1ZNIHNlbGZ0ZXN0cyB0byB2YWxpZGF0ZSB0aGUgU3N0YyB0aW1lciBmdW5jdGlvbmFsaXR5Lgo+
ID4gPiA+ID4gVGhlIHRlc3Qgd2FzIHBvcnRlZCBmcm9tIGFybTY0IGFyY2ggdGltZXIgdGVzdC4K
PiA+ID4gPgo+ID4gPiA+IEkganVzdCB0cmllZCB0aGlzIHRlc3Qgb3V0LiBSdW5uaW5nIGl0IG92
ZXIgYW5kIG92ZXIgYWdhaW4gb24gUUVNVSBJIHNlZQo+ID4gPiA+IGl0IHdvcmtzIHNvbWV0aW1l
cywgYnV0IGl0IGZyZXF1ZW50bHkgZmFpbHMgd2l0aCB0aGUKPiA+ID4gPiBHVUVTVF9BU1NFUlRf
RVEoY29uZmlnX2l0ZXIgKyAxLCBpcnFfaXRlcikgYXNzZXJ0IGFuZCBhdCBsZWFzdCBvbmNlIEkK
PiA+ID4gPiBhbHNvIHNhdyB0aGUgX19HVUVTVF9BU1NFUlQoeGNudCA+PSBjbXApIGFzc2VydC4K
PiA+ID4gPgo+ID4gPgo+ID4gPiBHb29kIGNhdGNoIQo+ID4gPgo+ID4gPiBJIGNhbiBhbHNvIHJl
cHJvZHVjZSB0aGlzIGlzc3VlIGFuZCBpdCBpcyBhIGNvbW1vbiBwcm9ibGVtIGZvciBib3RoCj4g
PiA+IGFybTY0IGFuZCByaXNjdiBiZWNhdXNlIGl0IGFsc28gaGFwcGVucyBpbiBhIGFybTY0IFFl
bXUgVk0uCj4gPiA+Cj4gPiA+IEl0IHNlZW1zIGxpa2UgYSBzeW5jaHJvbml6YXRpb24gaXNzdWUg
YmV0d2VlbiBob3N0IGFuZCBndWVzdCBzaGFyZWQKPiA+ID4gdmFyaWFibGVzLiBXaWxsIGRvdWJs
ZSBjaGVjayB0aGUgdGVzdCBjb2RlLgo+ID4gPgo+ID4gPiA+IFRoYW5rcywKPiA+ID4gPiBkcmV3
Cj4gPgo+ID4gSGkgQW5kcmV3LAo+ID4KPiA+IEFmdGVyIHNldmVyYWwgcm91bmRzIG9mIHJlZ3Jl
c3Npb24gdGVzdGluZywgc29tZSBmaW5kaW5nczoKPiA+IDEuIFRoZSBpbnRlcm1pdHRlbnQgZmFp
bHVyZSBhbHNvIGhhcHBlbmVkIG9uIEFSTTY0IFFlbXUgVk0sIGFuZCBldmVuCj4gPiBpbiB0aGUg
aW5pdGlhbCBhcmNoX3RpbWVyIGNvbW1pdCg0OTU5ZDg2NTBlOWY0KS4KPiA+IDIuIGl0IGRpZG4n
dCBoYXBwZW4gb24gYSBBUk02NCBIVyhidXQgYSBkaWZmZXJlbnQgZmFpbHVyZSBvY2N1cmVkCj4g
PiBkdXJpbmcgc3RyZXNzIHRlc3QpCj4gPiAzLiBUaGUgZmFpbHVyZSBoYXZlIGEgY2xvc2UgcmVs
YXRpb25zaGlwIHdpdGgKPiA+IFRJTUVSX1RFU1RfRVJSX01BUkdJTl9VUyhkZWZhdWx0IDEwMCks
IGFuZCBhZnRlciBpbmNyZWFzaW5nCj4gPiAgICAgIHRoZSBtYWNybyB0byAzMDAsIHRoZSBmYWls
dXJlIGNvdWxkbid0IHJlcHJvZHVjZWQgaW4gMTAwMCBsb29wcwo+ID4gc3RyZXNzIHRlc3QgaW4g
UklTQy1WIFFlbXUgVk0KPiA+Cj4gPiBTbyBteSBzdWdnZXN0aW9uIGlzIHdlIGNhbiBleHBvc2Ug
dGhlIFRJTUVSX1RFU1RfRVJSX01BUkdJTl9VUwo+ID4gcGFyYW1ldGVyIGFzIGFuIGFyY2hfdGlt
ZXIgdGVzdCBhcmcgcGFyYW1ldGVyCj4gPiBhbmQgdHVuZSBpdCBiYXNlZCBvbiBhIHNwZWNpZmlj
IHRlc3QgZW52aXJvbm1lbnQuCj4gPgo+ID4gV2hhdCdzIHlvdXIgb3Bpbmlvbj8KPgo+IFRoZSBj
b25jZXB0IG9mICJ0aW1lb3V0IGZvciBhbiBpbnRlcnJ1cHQgdG8gYXJyaXZlIiBpcyBhbHdheXMg
Z29pbmcgdG8KPiBsZWF2ZSB1cyBleHBvc2VkIHRvIHJhbmRvbSBmYWlsdXJlcy4gWW91ciBzdWdn
ZXN0aW9uIG9mIG1ha2luZyB0aGUKPiB0aW1lb3V0IHVzZXIgY29uZmlndXJhYmxlIGlzIHByb2Jh
Ymx5IHRoZSBiZXN0IHdlIGNhbiBkby4gSSB3b3VsZAo+IHN1Z2dlc3QgYWxzbyBhZGRpbmcgbW9y
ZSBkZXNjcmlwdGl2ZSBmYWlsdXJlIHRleHQgYW5kIGEgaGludCBhYm91dAo+IHRyeWluZyB0byBh
ZGp1c3QgdGhlIHRpbWVvdXQuCj4KPiBPciwgb25lIHRoaW5nIHdlIGRvIGluIGt2bS11bml0LXRl
c3RzLCBpcyB0byByZWR1Y2UgdHlwaWNhbCBkZWxheXMgd2hpbGUKPiBhbGxvd2luZyBleHBlY3Rl
ZCBkZWxheXMgdG8gYmUgbG9uZ2VyIGJ5IGxvb3Bpbmcgb3ZlciBhIHNob3J0ZXIgZGVsYXkgYW5k
Cj4gYSBub24tZmF0YWwgY2hlY2ssIGkuZS4KPgo+ICBwYXNzID0gZmFsc2U7Cj4gIGZvciAoaSA9
IDA7IGkgPCAxMDsgaSsrKSB7Cj4gICAgdWRlbGF5KDEwMCk7Cj4gICAgaWYgKGNoZWNrKC4uLikp
IHsKPiAgICAgICBwYXNzID0gdHJ1ZTsKPiAgICAgICBicmVhazsKPiAgICB9Cj4gIH0KPiAgYXNz
ZXJ0KHBhc3MpOwo+Cj4gV2UgY291bGQgdHJ5IHRoYXQgYXBwcm9hY2ggaGVyZSB0b28uCj4KPiBU
aGFua3MsCj4gZHJldwoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2ssIEkgd2lsbCBzZW5kIG91dCBw
YXRjaCBzZXQgdjQgc29vbiEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
