Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1184CE79A9
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 20:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e72ibDXBKTap22CyvC2tDYCSeUXrUXq8JXo03NqwSik=; b=kbG0S/8jSiSGEg
	f1tN7KjQat2AlEpqxcL/kq8w9Ps/fN/l4pla/qlwgO1cuRTw9ZkZmqqo1TuwfXuqKF+wVnqAQVpAs
	0tcC4ydmzmueLsyV+cm12jGu2QdgadK8D8+IUmbiW8NHPGbK/vMaIkl6Cs7HPDCCyNjEfpgp7lqow
	5DfJ3gsqqb+Uc6tI2XYlJu8+4BN+iz83a+r5Xu2+wZfgankfiUaYoaZKQ1p74sy9BD2tODfzRtGkL
	sHyImGQcyALHu8oHLuKDEZH6iCSWG/7RCaeRFss1N5EGtx3eKx0DDmsSBr44ePu+5N0nWD8oiivhA
	2fq5dTOGcvoLLHIwVx5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qih5m-001DfM-0C;
	Tue, 19 Sep 2023 20:13:06 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qih5i-001Ddf-2O
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 20:13:04 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-503065c4b25so5483224e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 13:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1695154379; x=1695759179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6ch6RWPf/XAfaKMkUuRJLYD6PuDcDg5GNJHK0YM5ng=;
        b=fYX7bBxnH6423dRN2MgLYrAuZJeu649tKmzo6qYrTT0YubEyJYKq5JXsI4/r02VO7r
         whhIE3AMjjJQOvKvlf5TA4NHlSFBCYhOtJH/vp+xhxEYLVORDA7BQk/oUWnxRYzIMcqP
         vzeQ1yGcSa+1wYvCVE2kDfxUh7xH/ecphRf+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695154379; x=1695759179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6ch6RWPf/XAfaKMkUuRJLYD6PuDcDg5GNJHK0YM5ng=;
        b=h4JP7PCcFUS8I+vGrUZMTo6jI6yOtHBivh4RHVCnW2/Vtlzo2Dj3+93Da8kaOKk0n7
         GOJaZSbzkZb+55wWzIR/lqDoL2MzmS/zsMbvBgdb7gCcHIC7W/koTDXVHjkxOtHtCxF2
         AksCh1x6fgCXYTGiEqJ9F69wf8BO3a2CbNpa8EfW0WCkbMPyrKeNYK8Olh1UtKhM2sZ0
         YhahNYO+84P++k6b9lX0A0TC+d5qdGZLXDszvasoMPBXbA4FP5khj4dxv/jtc2HgA3TL
         vBL3Y8GZqfs1i0YSDo/1rGd/OcgtpcSdVjIbC9ySTIdvEfxCU1F9zNkZHVPzfMuE3MYu
         IsRg==
X-Gm-Message-State: AOJu0Yx+dMy4LskYG0Ol+RKJ18YMuQut0P2Ij5d4hweR9FFT2yMa7LKO
	+vK4s9q5UQiBj4kP8kAnYc1B77TedvSJoQsU+hwN
X-Google-Smtp-Source: AGHT+IGQ6hyYgt2XkleZcYChrWn4Hxuo5o+pyUqe/AgSgyUUhTT4q6QNmrd+sMMqXJB1pMLbt8L5TXnmcjoQ1HS1UKQ=
X-Received: by 2002:ac2:4da7:0:b0:502:9fce:b6cc with SMTP id
 h7-20020ac24da7000000b005029fceb6ccmr589020lfe.11.1695154378656; Tue, 19 Sep
 2023 13:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230918180646.1398384-1-apatel@ventanamicro.com> <20230918180646.1398384-5-apatel@ventanamicro.com>
In-Reply-To: <20230918180646.1398384-5-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 19 Sep 2023 13:12:47 -0700
Message-ID: <CAOnJCU+h-Y_i=HkCf194SLWp-7bqzMhRLC31q0xxQDMuLppapA@mail.gmail.com>
Subject: Re: [PATCH 4/4] KVM: riscv: selftests: Selectively filter-out AIA registers
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_131302_863460_B0D6D26C 
X-CRM114-Status: GOOD (  22.50  )
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

T24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTE6MDfigK9BTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHkgdGhlIEFJQSBPTkVfUkVHIHJlZ2lz
dGVycyBhcmUgcmVwb3J0ZWQgYnkgZ2V0LXJlZy1saXN0Cj4gYXMgbmV3IHJlZ2lzdGVycyBmb3Ig
dmFyaW91cyB2Y3B1X3JlZ19saXN0IGNvbmZpZ3Mgd2hlbmV2ZXIgU3NhaWEKPiBpcyBhdmFpbGFi
bGUgb24gdGhlIGhvc3QgYmVjYXVzZSBTc2FpYSBleHRlbnNpb24gY2FuIG9ubHkgYmUKPiBkaXNh
YmxlZCBieSBTbXN0YXRlZW4gZXh0ZW5zaW9uIHdoaWNoIGlzIG5vdCBhbHdheXMgYXZhaWxhYmxl
Lgo+Cj4gVG8gdGFja2xlIHRoaXMsIHdlIHNob3VsZCBmaWx0ZXItb3V0IEFJQSBPTkVfUkVHIHJl
Z2lzdGVycyBvbmx5Cj4gd2hlbiBTc2FpYSBjYW4ndCBiZSBkaXNhYmxlZCBmb3IgYSBWQ1BVLgo+
Cj4gRml4ZXM6IDQ3NzA2OTM5OGVkNiAoIktWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIGdldC1y
ZWctbGlzdCB0ZXN0IikKPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFu
YW1pY3JvLmNvbT4KPiAtLS0KPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0
LmMgICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjEg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKPiBpbmRleCA3NmMwYWQxMWU0MjMuLjg1
OTA3Yzg2YjgzNSAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlz
Y3YvZ2V0LXJlZy1saXN0LmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlz
Y3YvZ2V0LXJlZy1saXN0LmMKPiBAQCAtMTIsNiArMTIsOCBAQAo+Cj4gICNkZWZpbmUgUkVHX01B
U0sgKEtWTV9SRUdfQVJDSF9NQVNLIHwgS1ZNX1JFR19TSVpFX01BU0spCj4KPiArc3RhdGljIGJv
b2wgaXNhX2V4dF9jYW50X2Rpc2FibGVbS1ZNX1JJU0NWX0lTQV9FWFRfTUFYXTsKPiArCj4gIGJv
b2wgZmlsdGVyX3JlZyhfX3U2NCByZWcpCj4gIHsKPiAgICAgICAgIHN3aXRjaCAocmVnICYgflJF
R19NQVNLKSB7Cj4gQEAgLTQ4LDYgKzUwLDE1IEBAIGJvb2wgZmlsdGVyX3JlZyhfX3U2NCByZWcp
Cj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhU
X1pJRkVOQ0VJOgo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklT
Q1ZfSVNBX0VYVF9aSUhQTToKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gKyAgICAg
ICAvKiBBSUEgcmVnaXN0ZXJzIGFyZSBhbHdheXMgYXZhaWxhYmxlIHdoZW4gU3NhaWEgY2FuJ3Qg
YmUgZGlzYWJsZWQgKi8KPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9DU1IgfCBLVk1fUkVH
X1JJU0NWX0NTUl9BSUEgfCBLVk1fUkVHX1JJU0NWX0NTUl9BSUFfUkVHKHNpc2VsZWN0KToKPiAr
ICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9DU1IgfCBLVk1fUkVHX1JJU0NWX0NTUl9BSUEgfCBL
Vk1fUkVHX1JJU0NWX0NTUl9BSUFfUkVHKGlwcmlvMSk6Cj4gKyAgICAgICBjYXNlIEtWTV9SRUdf
UklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlB
X1JFRyhpcHJpbzIpOgo+ICsgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0NTUiB8IEtWTV9SRUdf
UklTQ1ZfQ1NSX0FJQSB8IEtWTV9SRUdfUklTQ1ZfQ1NSX0FJQV9SRUcoc2llaCk6Cj4gKyAgICAg
ICBjYXNlIEtWTV9SRUdfUklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBIHwgS1ZNX1JF
R19SSVNDVl9DU1JfQUlBX1JFRyhzaXBoKToKPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9D
U1IgfCBLVk1fUkVHX1JJU0NWX0NTUl9BSUEgfCBLVk1fUkVHX1JJU0NWX0NTUl9BSUFfUkVHKGlw
cmlvMWgpOgo+ICsgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0NTUiB8IEtWTV9SRUdfUklTQ1Zf
Q1NSX0FJQSB8IEtWTV9SRUdfUklTQ1ZfQ1NSX0FJQV9SRUcoaXByaW8yaCk6Cj4gKyAgICAgICAg
ICAgICAgIHJldHVybiBpc2FfZXh0X2NhbnRfZGlzYWJsZVtLVk1fUklTQ1ZfSVNBX0VYVF9TU0FJ
QV0gPyB0cnVlIDogZmFsc2U7CgpBaGggSSBndWVzcy4geW91IGRvIG5lZWQgdGhlIHN3aXRjaCBj
YXNlIGZvciBBSUEgQ1NScyBidXQgZm9yIElTQQpleHRlbnNpb25zIGNhbiBiZSBhdm9pZGVkIGFz
IGl0IGlzIGNvbnRpZ3VvdXMuCgo+ICAgICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAg
YnJlYWs7Cj4gICAgICAgICB9Cj4gQEAgLTcxLDE0ICs4MiwyMiBAQCBzdGF0aWMgaW5saW5lIGJv
b2wgdmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGV4dCkKPgo+ICB2b2lk
IGZpbmFsaXplX3ZjcHUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3QgdmNwdV9yZWdfbGlz
dCAqYykKPiAgewo+ICsgICAgICAgaW50IHJjOwo+ICAgICAgICAgc3RydWN0IHZjcHVfcmVnX3N1
Ymxpc3QgKnM7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGlzYV9leHRfc3RhdGVbS1ZNX1JJU0NW
X0lTQV9FWFRfTUFYXSA9IHsgMCB9Owo+ICsKPiArICAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwg
S1ZNX1JJU0NWX0lTQV9FWFRfTUFYOyBpKyspCj4gKyAgICAgICAgICAgICAgIF9fdmNwdV9nZXRf
cmVnKHZjcHUsIFJJU0NWX0lTQV9FWFRfUkVHKGkpLCAmaXNhX2V4dF9zdGF0ZVtpXSk7Cj4KPiAg
ICAgICAgIC8qCj4gICAgICAgICAgKiBEaXNhYmxlIGFsbCBleHRlbnNpb25zIHdoaWNoIHdlcmUg
ZW5hYmxlZCBieSBkZWZhdWx0Cj4gICAgICAgICAgKiBpZiB0aGV5IHdlcmUgYXZhaWxhYmxlIGlu
IHRoZSByaXNjLXYgaG9zdC4KPiAgICAgICAgICAqLwo+IC0gICAgICAgZm9yIChpbnQgaSA9IDA7
IGkgPCBLVk1fUklTQ1ZfSVNBX0VYVF9NQVg7IGkrKykKPiAtICAgICAgICAgICAgICAgX192Y3B1
X3NldF9yZWcodmNwdSwgUklTQ1ZfSVNBX0VYVF9SRUcoaSksIDApOwo+ICsgICAgICAgZm9yIChp
bnQgaSA9IDA7IGkgPCBLVk1fUklTQ1ZfSVNBX0VYVF9NQVg7IGkrKykgewo+ICsgICAgICAgICAg
ICAgICByYyA9IF9fdmNwdV9zZXRfcmVnKHZjcHUsIFJJU0NWX0lTQV9FWFRfUkVHKGkpLCAwKTsK
PiArICAgICAgICAgICAgICAgaWYgKHJjICYmIGlzYV9leHRfc3RhdGVbaV0pCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgaXNhX2V4dF9jYW50X2Rpc2FibGVbaV0gPSB0cnVlOwo+ICsgICAgICAg
fQo+Cj4gICAgICAgICBmb3JfZWFjaF9zdWJsaXN0KGMsIHMpIHsKPiAgICAgICAgICAgICAgICAg
aWYgKCFzLT5mZWF0dXJlKQo+IC0tCj4gMi4zNC4xCj4KCk90aGVyd2lzZSwgTEdUTS4KClJldmll
d2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KCi0tIApSZWdhcmRzLApB
dGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
