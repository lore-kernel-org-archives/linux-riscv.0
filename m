Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD52C02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 02:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ohN5MpkAOeG58a8iBt9fUZucK5MW7npt2fAIEgo5Y8c=; b=JNgpisrMGsbpK+
	GC9kZoe5X2fWAIATfLy0UzFKfDbVhkBnJ1IkZIU9cWXUbxEAr6u7SdUMdZ3QdwVsGIsPUCjTKKRku
	dtOd/JkLKkRC7sEF620NAY7gP23iMG1hwHyMWYHGSh210uK72JtWy7RrCQUs75TarCnpsULf8375T
	GLmeAwcBW6dZXa7rgct0hzCHdax+5E0xHnjqq5LW87P4WZuaOEf5NzVFLPBspmJpFePIEg1ih3Y7C
	5M+X1IhBIK5iPZK2Oho2QRCQEDqydTMMsA04Ec/7Rd7779zWPcVPgXAO6hygxJX0jmyWFde3PzQhU
	SwSai3zylfHMSoL7fmTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYcB3-0000000Grdx-1ElC;
	Fri, 17 Jan 2025 02:33:41 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYcAp-0000000Grap-23V4
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 02:33:28 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-844bff5ba1dso122504639f.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 18:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1737081205; x=1737686005; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgN1JAAtC4ZDvNdaRKOUkJRyhW7/k4x9pgbFwnsVLtM=;
        b=DUmWdWIlS+YwxIFSXUBAItU5Zh1PrBhcE+xtaW32ZDXH4eNRfMr/3XwOFdGbGMcAEv
         bJCT+4zC8f4sYa1dNX/7WfZtiVVBFR80sbCYtmh1qheBhmQEibRcbakJzNSwTaSXypwP
         RXgffIdWYHJjcziM12bP0GnbUhhFxar3ZpKC2KHz2LJJ8ddAFsexHDydFxcQUJDRAat4
         WQBxOivUf2mSFH2dJCmdd81YT6tYMX0bLhHH9BGzJBBQkAWCyVAv0DsbtoznLMED6I6b
         ITmdHmn9JlNpB0ZDgePlhKbkpVvJt/0ztxcF+z/D28XpoNCSWQauVCmZ2EwpqyCTLBfV
         2Mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737081205; x=1737686005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgN1JAAtC4ZDvNdaRKOUkJRyhW7/k4x9pgbFwnsVLtM=;
        b=XxV0tmaDTa6PPiuBnmMb5NkATT9G3n9cn50uX7veSgZlhPDGHWHlt4h6Mr/0X0jqlO
         gKIPTTkdPVCp3aoOFGCEKov8CicVFOciZLbjpt/Nf1azFQXdbgDUBUCicbL07+6kOrzw
         IT8/4/LfYVII44xS7qUYYO58oPBU4IuGVcQ5m1we3jo24QjIJcFoK1tuZJ+PHDETMokg
         8QRQ74yKiDByavvlnC4xpDnCMRVI/9TRi1IDUJpmDoxaeqOpzVrwEcxgz2vV2naKivvB
         5/dUJ+oy5NqyXH6AR4If7piPRn46ChOvwBMkXmzbdVQJDidudL62/2xz6m3L7bJFGdXN
         Fgqw==
X-Forwarded-Encrypted: i=1; AJvYcCXc9iBmibFZq7TdMd9ptkUbO5OVi/+eUFNke+HUZijF5HMcqOp3S++oNLZFJqk1rrFN4dZ3J2S5rwvmMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIaxEA/970cACQYopBnA9bUKk92aNYMsfrBvLTpa3mQLxlAJM8
	8ASeSyiiIaaS2pHhNXXo1hVEkwhYPrcHDpquEJ8jPWvmJ5AO85zMrZ9J9Qs+yzKU315ZjK8UIjC
	QeBJJpgjt0RmRjgv0TfP5UmshcTUndeYFWl7Qtw==
X-Gm-Gg: ASbGncumyuQOoinWeO81qJ+Bqc5eYcb4nr4z9AMrL5N3eVZ0kJ3Sf+v0Mk+UYYEXXt+
	MXItEeJPdVhffJPWHqUASOha/ijFIEekv6qFjAxFt
X-Google-Smtp-Source: AGHT+IGWfjqzCcQGmdJQgnejUEiIp4GF3vXSpB00+Ht74BX8hKjtjnJTq/Q1I0aCcP43JfYNmc9RNWihsqSG+ffcTI4=
X-Received: by 2002:a05:6602:340c:b0:843:e9c0:8290 with SMTP id
 ca18e2360f4ac-851b61ff66emr68747539f.6.1737081204825; Thu, 16 Jan 2025
 18:33:24 -0800 (PST)
MIME-Version: 1.0
References: <20250115030306.29735-1-zong.li@sifive.com> <20250115030306.29735-3-zong.li@sifive.com>
 <20250115-9d8193b7c67eeee41d18a7dd@orel>
In-Reply-To: <20250115-9d8193b7c67eeee41d18a7dd@orel>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 17 Jan 2025 10:33:13 +0800
X-Gm-Features: AbW1kvbfpckKPbF4z3KmoHMJumhbeq9b8zbKXcCqdM0bd6xdghkg01ZcJTMVGgA
Message-ID: <CANXhq0qc7G8aDYiZ55_=4RQLcB5tLV8Hq8J+8FBaboCt5pp=AQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/riscv: support HPM and interrupt handling
To: Andrew Jones <ajones@ventanamicro.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, luxu.kernel@bytedance.com, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_183327_555594_9B14C086 
X-CRM114-Status: GOOD (  30.55  )
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

T24gV2VkLCBKYW4gMTUsIDIwMjUgYXQgNTo0NOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKYW4gMTUsIDIwMjUgYXQgMTE6MDM6
MDZBTSArMDgwMCwgWm9uZyBMaSB3cm90ZToKPiA+IEluaXRpYWxpemUgdGhlIFBNVSBhbmQgdW5p
bml0aWFsaXplIGl0IHdoZW4gZHJpdmVyIGlzIHJlbW92ZWQuCj4gPiBJbnRlcnJ1cHQgaGFuZGxp
bmcgaXMgYWxzbyBpbXBsZW1lbnRlZCwgYW5kIHRoZSBoYW5kbGVyIG5lZWRzCj4gPiB0byBiZSBh
IHByaW1hcnkgaGFuZGxlciBpbnN0ZWFkIG9mIGEgdGhyZWFkZWQgZnVuY3Rpb24gYmVjYXVzZQo+
ID4gcHRfcmVncyBpcyBlbXB0eSB3aGVuIHRocmVhZGluZyB0aGUgSVJRLiBIb3dldmVyLCBwdF9y
ZWdzIGlzCj4gPiByZXF1aXJlZCBieSBwZXJmX2V2ZW50X292ZXJmbG93Lgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+IFRlc3RlZC1ieTogWHUg
THUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2lvbW11
L3Jpc2N2L2lvbW11LmMgfCA2NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jIGIvZHJpdmVycy9pb21tdS9yaXNjdi9pb21t
dS5jCj4gPiBpbmRleCA4YTA1ZGVmNzc0YmQuLjIwYWU5MDQ3MTQ4NCAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+ID4gKysrIGIvZHJpdmVycy9pb21tdS9yaXNj
di9pb21tdS5jCj4gPiBAQCAtNTUyLDYgKzU1Miw2MiBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qgcmlz
Y3ZfaW9tbXVfZmx0cV9wcm9jZXNzKGludCBpcnEsIHZvaWQgKmRhdGEpCj4gPiAgICAgICByZXR1
cm4gSVJRX0hBTkRMRUQ7Cj4gPiAgfQo+ID4KPiA+ICsvKgo+ID4gKyAqIElPTU1VIEhhcmR3YXJl
IHBlcmZvcm1hbmNlIG1vbml0b3IKPiA+ICsgKi8KPiA+ICsKPiA+ICsvKiBIUE0gaW50ZXJydXB0
IHByaW1hcnkgaGFuZGxlciAqLwo+ID4gK3N0YXRpYyBpcnFyZXR1cm5fdCByaXNjdl9pb21tdV9o
cG1faXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGV2X2lkKQo+ID4gK3sKPiA+ICsgICAgIHN0
cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11ID0gKHN0cnVjdCByaXNjdl9pb21tdV9kZXZp
Y2UgKilkZXZfaWQ7Cj4gPiArCj4gPiArICAgICAvKiBDbGVhciBwZXJmb3JtYW5jZSBtb25pdG9y
aW5nIGludGVycnVwdCBwZW5kaW5nICovCj4gPiArICAgICByaXNjdl9pb21tdV93cml0ZWwoaW9t
bXUsIFJJU0NWX0lPTU1VX1JFR19JUFNSLCBSSVNDVl9JT01NVV9JUFNSX1BNSVApOwo+ID4gKwo+
ID4gKyAgICAgLyogUHJvY2VzcyBwbXUgaXJxICovCj4gPiArICAgICByaXNjdl9pb21tdV9wbXVf
aGFuZGxlX2lycSgmaW9tbXUtPnBtdSk7Cj4gPiArCj4gPiArICAgICByZXR1cm4gSVJRX0hBTkRM
RUQ7Cj4gPiArfQo+ID4gKwo+ID4gKy8qIEhQTSBpbml0aWFsaXphdGlvbiAqLwo+ID4gK3N0YXRp
YyBpbnQgcmlzY3ZfaW9tbXVfaHBtX2VuYWJsZShzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICpp
b21tdSkKPiA+ICt7Cj4gPiArICAgICBpbnQgcmM7Cj4gPiArCj4gPiArICAgICBpZiAoIShpb21t
dS0+Y2FwcyAmIFJJU0NWX0lPTU1VX0NBUEFCSUxJVElFU19IUE0pKQo+ID4gKyAgICAgICAgICAg
ICByZXR1cm4gMDsKPiA+ICsKPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBwdF9yZWdzIGlzIGVt
cHR5IHdoZW4gdGhyZWFkaW5nIHRoZSBJUlEsIGJ1dCBwdF9yZWdzIGlzIG5lY2Vzc2FyeQo+ID4g
KyAgICAgICogYnkgcGVyZl9ldmVudF9vdmVyZmxvdy4gVXNlIHByaW1hcnkgaGFuZGxlciBpbnN0
ZWFkIG9mIHRocmVhZAo+ID4gKyAgICAgICogZnVuY3Rpb24gZm9yIFBNIElSUS4KPiA+ICsgICAg
ICAqCj4gPiArICAgICAgKiBTZXQgdGhlIElSUUZfT05FU0hPVCBmbGFnIGJlY2F1c2UgdGhpcyBJ
UlEgbWlnaHQgYmUgc2hhcmVkIHdpdGgKPiA+ICsgICAgICAqIG90aGVyIHRocmVhZGVkIElSUXMg
Ynkgb3RoZXIgcXVldWVzLgo+ID4gKyAgICAgICovCj4gPiArICAgICByYyA9IGRldm1fcmVxdWVz
dF9pcnEoaW9tbXUtPmRldiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBpb21tdS0+
aXJxc1tyaXNjdl9pb21tdV9xdWV1ZV92ZWMoaW9tbXUsIFJJU0NWX0lPTU1VX0lQU1JfUE1JUCld
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2X2lvbW11X2hwbV9pcnFfaGFu
ZGxlciwgSVJRRl9PTkVTSE9UIHwgSVJRRl9TSEFSRUQsIE5VTEwsIGlvbW11KTsKPiA+ICsgICAg
IGlmIChyYykKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ID4gKwo+ID4gKyAgICAgcmV0
dXJuIHJpc2N2X2lvbW11X3BtdV9pbml0KCZpb21tdS0+cG11LCBpb21tdS0+cmVnLCBkZXZfbmFt
ZShpb21tdS0+ZGV2KSk7Cj4gPiArfQo+ID4gKwo+ID4gKy8qIEhQTSB1bmluaXRpYWxpemF0aW9u
ICovCj4gPiArc3RhdGljIHZvaWQgcmlzY3ZfaW9tbXVfaHBtX2Rpc2FibGUoc3RydWN0IHJpc2N2
X2lvbW11X2RldmljZSAqaW9tbXUpCj4gPiArewo+ID4gKyAgICAgaWYgKCEoaW9tbXUtPmNhcHMg
JiBSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNfSFBNKSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJu
Owo+ID4gKwo+ID4gKyAgICAgZGV2bV9mcmVlX2lycShpb21tdS0+ZGV2LAo+ID4gKyAgICAgICAg
ICAgICAgICAgICBpb21tdS0+aXJxc1tyaXNjdl9pb21tdV9xdWV1ZV92ZWMoaW9tbXUsIFJJU0NW
X0lPTU1VX0lQU1JfUE1JUCldLAo+ID4gKyAgICAgICAgICAgICAgICAgICBpb21tdSk7Cj4gPiAr
Cj4gPiArICAgICByaXNjdl9pb21tdV9wbXVfdW5pbml0KCZpb21tdS0+cG11KTsKPiA+ICt9Cj4g
PiArCj4gPiAgLyogTG9va3VwIGFuZCBpbml0aWFsaXplIGRldmljZSBjb250ZXh0IGluZm8gc3Ry
dWN0dXJlLiAqLwo+ID4gIHN0YXRpYyBzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGMgKnJpc2N2X2lvbW11
X2dldF9kYyhzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSwKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGRldmlkKQo+
ID4gQEAgLTE1OTYsNiArMTY1Miw5IEBAIHZvaWQgcmlzY3ZfaW9tbXVfcmVtb3ZlKHN0cnVjdCBy
aXNjdl9pb21tdV9kZXZpY2UgKmlvbW11KQo+ID4gICAgICAgcmlzY3ZfaW9tbXVfaW9kaXJfc2V0
X21vZGUoaW9tbXUsIFJJU0NWX0lPTU1VX0REVFBfSU9NTVVfTU9ERV9PRkYpOwo+ID4gICAgICAg
cmlzY3ZfaW9tbXVfcXVldWVfZGlzYWJsZSgmaW9tbXUtPmNtZHEpOwo+ID4gICAgICAgcmlzY3Zf
aW9tbXVfcXVldWVfZGlzYWJsZSgmaW9tbXUtPmZsdHEpOwo+ID4gKwo+ID4gKyAgICAgaWYgKGlv
bW11LT5jYXBzICYgUklTQ1ZfSU9NTVVfQ0FQQUJJTElUSUVTX0hQTSkKPiA+ICsgICAgICAgICAg
ICAgcmlzY3ZfaW9tbXVfcG11X3VuaW5pdCgmaW9tbXUtPnBtdSk7Cj4KPiBUaGlzIHNob3VsZCBi
ZQo+Cj4gICAgcmlzY3ZfaW9tbXVfaHBtX2Rpc2FibGUoaW9tbXUpOwo+Cj4gYXMgdGhlIGNvdmVy
IGxldHRlciBzYWlkIGl0IHdvdWxkIGJlLgoKWWVzLCBJIGd1ZXNzIEkgbWVzc2VkIHRoYXQgdXAu
IFRoYW5rcwoKPgo+ID4gIH0KPiA+Cj4gPiAgaW50IHJpc2N2X2lvbW11X2luaXQoc3RydWN0IHJp
c2N2X2lvbW11X2RldmljZSAqaW9tbXUpCj4gPiBAQCAtMTYzNSw2ICsxNjk0LDEwIEBAIGludCBy
aXNjdl9pb21tdV9pbml0KHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11KQo+ID4gICAg
ICAgaWYgKHJjKQo+ID4gICAgICAgICAgICAgICBnb3RvIGVycl9xdWV1ZV9kaXNhYmxlOwo+ID4K
PiA+ICsgICAgIHJjID0gcmlzY3ZfaW9tbXVfaHBtX2VuYWJsZShpb21tdSk7Cj4gPiArICAgICBp
ZiAocmMpCj4gPiArICAgICAgICAgICAgIGdvdG8gZXJyX2hwbV9kaXNhYmxlOwo+Cj4gVGhpcyBz
aG91bGQgYmUKPgo+ICAgZ290byBlcnJfaW9kaXJfb2ZmOwo+Cj4gQW5kIHRoZSBuZXh0IGdvdG8g
KHVuZGVyIHN5c2ZzIGFkZCkgc2hvdWxkIGJlCj4KPiAgIGdvdG8gZXJyX2hwbV9kaXNhYmxlOwo+
CgpZZXMsIHRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhhdC4KCj4gPiArCj4gPiAgICAgICByYyA9IGlv
bW11X2RldmljZV9zeXNmc19hZGQoJmlvbW11LT5pb21tdSwgTlVMTCwgTlVMTCwgInJpc2N2LWlv
bW11QCVzIiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfbmFtZShp
b21tdS0+ZGV2KSk7Cj4gPiAgICAgICBpZiAocmMpIHsKPiA+IEBAIC0xNjUzLDYgKzE3MTYsOCBA
QCBpbnQgcmlzY3ZfaW9tbXVfaW5pdChzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSkK
PiA+ICBlcnJfcmVtb3ZlX3N5c2ZzOgo+ID4gICAgICAgaW9tbXVfZGV2aWNlX3N5c2ZzX3JlbW92
ZSgmaW9tbXUtPmlvbW11KTsKPiA+ICBlcnJfaW9kaXJfb2ZmOgo+ID4gKyAgICAgcmlzY3ZfaW9t
bXVfaHBtX2Rpc2FibGUoaW9tbXUpOwo+ID4gK2Vycl9ocG1fZGlzYWJsZToKPiA+ICAgICAgIHJp
c2N2X2lvbW11X2lvZGlyX3NldF9tb2RlKGlvbW11LCBSSVNDVl9JT01NVV9ERFRQX0lPTU1VX01P
REVfT0ZGKTsKPiA+ICBlcnJfcXVldWVfZGlzYWJsZToKPiA+ICAgICAgIHJpc2N2X2lvbW11X3F1
ZXVlX2Rpc2FibGUoJmlvbW11LT5mbHRxKTsKPgo+IFRoaXMgc2hvdWxkIGJlCj4KPiAgZXJyX3Jl
bW92ZV9zeXNmczoKPiAgICAuLi4KPiAgZXJyX2hwbV9kaXNhYmxlOgo+ICAgIC4uLgo+ICBlcnJf
aW9kaXJfb2ZmOgo+ICAgIC4uLgo+ICBlcnJfcXVldWVfZGlzYWJsZToKPiAgICAuLi4KPgoKTGV0
IG1lIHRyeSB0byBmaXggdGhlbSBpbiB0aGUgbmV4dCB2ZXJzaW9uIGlmIG5lY2Vzc2FyeS4gQXMg
Um9iaW4KbWVudGlvbmVkLCB3ZSBtaWdodCBub3QgbmVlZCB0aGUgSFBNIGNsZWFuZXIgYW5kIGNh
biBzaW1wbHkgZW5hYmxlIEhQTQphdCB0aGUgZW5kLiBUaGFua3MgeW91IGZvciB0aGUgcmV2aWV3
IGFuZCBjYXRjaGluZyB0aGVzZS4KCj4KPiBUaGFua3MsCj4gZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
