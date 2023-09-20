Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E331CCE79CE
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Tqyo6DmdlxkK+rTEI6RIrrdlq8kWgz7A1Up9z3hlxs=; b=gdTUEeRSu0KgfI
	laIhY22QoW4BVysBQpqcJnC+2yoNxraZsX8ZGW2lA3rJzoXsfLrKY1wb6jIXYa7zA/mjTZBgHXcp4
	QjEBRIvf3MZdyOf+PSDXM4yXHNDX9RfsxBcy2K/Kw5B2JSsr/mrH6fRqYfcb4E+oUj9Km+XCYirhR
	r5ng1C7n1uyIglzkGTvu0U+j9xvqP4iA5VgSjMM5xeATmhiiO6cnhQEaJVMYMGvtE8XhL0tgInEy8
	XJfGeOcsVVrSkdMdqnsNDRrW2Gf9l8DwjepjonRT53DJ8yMIA0alJfCeM4T3Eb/yjY2PJZRGtEZVq
	vqkmVwZOkfqSrxDorUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qixh1-003Fbq-0z;
	Wed, 20 Sep 2023 13:56:39 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qixgy-003FZN-0x
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 13:56:37 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-573e67cc6eeso5270584a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 06:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695218193; x=1695822993; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWvN1Bpbs1PF50qBbgm5YoDriWQXveHOdhR/Dx6i6jg=;
        b=CblyG5oho2ZbUE+MmARkkvLf3YO8NJ5rOnPqoCeGlILnHl5RbsvVMPMEexdLocydeZ
         yndk+wZz6qeGk+PDnTRWd9SxPr8ZxUVo1dG3cEPra3BtpMyrri+z8A0QuNyI9aw2/5Qu
         YrmlnvFY6VfKILutWWrux3dig8SBnW9NIaKnW1As7oPQ7cUN/gC9OI4BH7vIf6Dn1bJ8
         mFNq0TPbgRHdfpFuZ5jwWL7qmEgphE4SKopLflGlRU1ergmUJA4qCG0/zw8vQY5fZpFM
         EPwR69S5DPRoOxuLcU3eVyNg4jYf81lfnvA257f9z/w16UyQ1RtWQQZ2aHREOXTnUBh3
         htDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695218193; x=1695822993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWvN1Bpbs1PF50qBbgm5YoDriWQXveHOdhR/Dx6i6jg=;
        b=tXbwq5BFVMUcxQKejNsgBgoieZfMPAhhiBnxNHoipmV60C6/5rpvEO///uxRaaekXE
         w1lbURT2+Iv+6S9BHJA3hY4ImpeQvYVbQMFDs1l2+Vc8XcaXBF2099UFmEb3LtK/6Y3j
         9GDlqVyli11ui0Yfoaon3K0LVg1bTBJOTA2LwBDmpyBF29hkGJRfIK0P4xZXkpGi97FC
         Y/6uP1vQ+5H2oEyBVLy248XBAy3Mmc6qYXjmKZEOIEFBy1b3HtKggEy5GESb5UpK6VIJ
         TYXgBkXnvcXqr/6UuD0/+lOtaGEoDECpR3/MkHNILJ9aDXF7VufoBZODEgsc+YftzVEp
         kCzA==
X-Gm-Message-State: AOJu0YxaFjkFYXXXCZFPUNkiPqKCf70by/dREDTdw8A17QvXeKRs9bge
	OdI1ibMxCvwRNve7RHyDcZNMZSrl6y1H0+wP/YCerQ==
X-Google-Smtp-Source: AGHT+IFb9PPNvdqtSUNwQS6mJlCIQK/y8XDdGfu9RdEx32Z3P7W7GzvDtIiLZCDP6pBGCTmuF0vbzKB6JetQRNt81ig=
X-Received: by 2002:a05:6a20:6a27:b0:14c:383b:294a with SMTP id
 p39-20020a056a206a2700b0014c383b294amr2839055pzk.5.1695218193018; Wed, 20 Sep
 2023 06:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
 <20230918180646.1398384-4-apatel@ventanamicro.com> <CAOnJCUJYDHtbYS4js7PSAeLqT4sL5zi7DT5xeSww+5Nvs2UhcA@mail.gmail.com>
In-Reply-To: <CAOnJCUJYDHtbYS4js7PSAeLqT4sL5zi7DT5xeSww+5Nvs2UhcA@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 20 Sep 2023 19:26:21 +0530
Message-ID: <CAK9=C2UbjOGyxo8oP36Tinjhv1jRpCb+hVbZCOJ70G4-WiHw1g@mail.gmail.com>
Subject: Re: [PATCH 3/4] KVM: riscv: selftests: Fix ISA_EXT register handling
 in get-reg-list
To: Atish Patra <atishp@atishpatra.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_065636_348655_B1B9FBED 
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMToyNOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRp
c2hwYXRyYS5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTE6MDfigK9B
TSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gU2Ft
ZSBzZXQgb2YgSVNBX0VYVCByZWdpc3RlcnMgYXJlIG5vdCBwcmVzZW50IG9uIGFsbCBob3N0IGJl
Y2F1c2UKPiA+IElTQV9FWFQgcmVnaXN0ZXJzIGFyZSB2aXNpYmxlIHRvIHRoZSBLVk0gdXNlciBz
cGFjZSBiYXNlZCBvbiB0aGUKPiA+IElTQSBleHRlbnNpb25zIGF2YWlsYWJsZSBvbiB0aGUgaG9z
dC4gQWxzbywgZGlzYWJsaW5nIGFuIElTQQo+ID4gZXh0ZW5zaW9uIHVzaW5nIGNvcnJlc3BvbmRp
bmcgSVNBX0VYVCByZWdpc3RlciBkb2VzIG5vdCBhZmZlY3QKPiA+IHRoZSB2aXNpYmlsaXR5IG9m
IHRoZSBJU0FfRVhUIHJlZ2lzdGVyIGl0c2VsZi4KPiA+Cj4gPiBCYXNlZCBvbiB0aGUgYWJvdmUs
IHdlIHNob3VsZCBmaWx0ZXItb3V0IGFsbCBJU0FfRVhUIHJlZ2lzdGVycy4KPiA+Cj4KPiBJbiB0
aGF0IGNhc2UsIHdlIGRvbid0IG5lZWQgdGhlIHN3aXRjaCBjYXNlIGFueSBtb3JlLiBKdXN0IGEK
PiBjb25kaXRpb25hbCBjaGVjayB3aXRoIEtWTV9SSVNDVl9JU0FfRVhUX01BWCBzaG91bGQgYmUg
c3VmZmljaWVudC4KCklmIHdlIGNvbXBhcmUgYWdhaW5zdCBLVk1fUklTQ1ZfSVNBX0VYVF9NQVgg
dGhlbiB3ZSB3aWxsIGZvcmdldAphZGRpbmcgdGVzdCBjb25maWdzIGZvciBuZXdlciBJU0EgZXh0
ZW5zaW9ucy4KCj4KPiA+IEZpeGVzOiA0NzcwNjkzOThlZDYgKCJLVk06IHJpc2N2OiBzZWxmdGVz
dHM6IEFkZCBnZXQtcmVnLWxpc3QgdGVzdCIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVs
IDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9zZWxmdGVzdHMva3Zt
L3Jpc2N2L2dldC1yZWctbGlzdC5jICAgICAgICB8IDM1ICsrKysrKysrKysrLS0tLS0tLS0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVn
LWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3Qu
Ywo+ID4gaW5kZXggZDhlY2FjZDAzZWNmLi43NmMwYWQxMWU0MjMgMTAwNjQ0Cj4gPiAtLS0gYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKPiA+ICsrKyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+ID4gQEAg
LTE0LDE3ICsxNCwzMyBAQAo+ID4KPiA+ICBib29sIGZpbHRlcl9yZWcoX191NjQgcmVnKQo+ID4g
IHsKPiA+ICsgICAgICAgc3dpdGNoIChyZWcgJiB+UkVHX01BU0spIHsKPiA+ICAgICAgICAgLyoK
PiA+IC0gICAgICAgICogU29tZSBJU0EgZXh0ZW5zaW9ucyBhcmUgb3B0aW9uYWwgYW5kIG5vdCBw
cmVzZW50IG9uIGFsbCBob3N0LAo+ID4gLSAgICAgICAgKiBidXQgdGhleSBjYW4ndCBiZSBkaXNh
YmxlZCB0aHJvdWdoIElTQV9FWFQgcmVnaXN0ZXJzIHdoZW4gcHJlc2VudC4KPiA+IC0gICAgICAg
ICogU28sIHRvIG1ha2UgbGlmZSBlYXN5LCBqdXN0IGZpbHRlcmluZyBvdXQgdGhlc2Uga2luZCBv
ZiByZWdpc3RlcnMuCj4gPiArICAgICAgICAqIFNhbWUgc2V0IG9mIElTQV9FWFQgcmVnaXN0ZXJz
IGFyZSBub3QgcHJlc2VudCBvbiBhbGwgaG9zdCBiZWNhdXNlCj4gPiArICAgICAgICAqIElTQV9F
WFQgcmVnaXN0ZXJzIGFyZSB2aXNpYmxlIHRvIHRoZSBLVk0gdXNlciBzcGFjZSBiYXNlZCBvbiB0
aGUKPiA+ICsgICAgICAgICogSVNBIGV4dGVuc2lvbnMgYXZhaWxhYmxlIG9uIHRoZSBob3N0LiBB
bHNvLCBkaXNhYmxpbmcgYW4gSVNBCj4gPiArICAgICAgICAqIGV4dGVuc2lvbiB1c2luZyBjb3Jy
ZXNwb25kaW5nIElTQV9FWFQgcmVnaXN0ZXIgZG9lcyBub3QgYWZmZWN0Cj4gPiArICAgICAgICAq
IHRoZSB2aXNpYmlsaXR5IG9mIHRoZSBJU0FfRVhUIHJlZ2lzdGVyIGl0c2VsZi4KPiA+ICsgICAg
ICAgICoKPiA+ICsgICAgICAgICogQmFzZWQgb24gYWJvdmUsIHdlIHNob3VsZCBmaWx0ZXItb3V0
IGFsbCBJU0FfRVhUIHJlZ2lzdGVycy4KPiA+ICAgICAgICAgICovCj4gPiAtICAgICAgIHN3aXRj
aCAocmVnICYgflJFR19NQVNLKSB7Cj4gPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0Ff
RVhUIHwgS1ZNX1JJU0NWX0lTQV9FWFRfQToKPiA+ICsgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NW
X0lTQV9FWFQgfCBLVk1fUklTQ1ZfSVNBX0VYVF9DOgo+ID4gKyAgICAgICBjYXNlIEtWTV9SRUdf
UklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX0Q6Cj4gPiArICAgICAgIGNhc2UgS1ZN
X1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JJU0NWX0lTQV9FWFRfRjoKPiA+ICsgICAgICAgY2Fz
ZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1ZfSVNBX0VYVF9IOgo+ID4gKyAgICAg
ICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX0k6Cj4gPiAr
ICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JJU0NWX0lTQV9FWFRfTToK
PiA+ICsgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1ZfSVNBX0VY
VF9TVlBCTVQ6Cj4gPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JJ
U0NWX0lTQV9FWFRfU1NUQzoKPiA+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQg
fCBLVk1fUklTQ1ZfSVNBX0VYVF9TVklOVkFMOgo+ID4gICAgICAgICBjYXNlIEtWTV9SRUdfUklT
Q1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX1pJSElOVFBBVVNFOgo+ID4gKyAgICAgICBj
YXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX1pJQ0JPTToKPiA+
ICsgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1ZfSVNBX0VYVF9a
SUNCT1o6Cj4gPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JJU0NW
X0lTQV9FWFRfWkJCOgo+ID4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtW
TV9SSVNDVl9JU0FfRVhUX1NTQUlBOgo+ID4gKyAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNB
X0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX1Y6Cj4gPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVND
Vl9JU0FfRVhUIHwgS1ZNX1JJU0NWX0lTQV9FWFRfU1ZOQVBPVDoKPiA+ICAgICAgICAgY2FzZSBL
Vk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQkE6Cj4gPiAgICAgICAg
IGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkJTOgo+ID4g
ICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX1pJ
Q05UUjoKPiA+IEBAIC01MCwxMiArNjYsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgdmNwdV9oYXNf
ZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGV4dCkKPiA+ICAgICAgICAgdW5zaWduZWQg
bG9uZyB2YWx1ZTsKPiA+Cj4gPiAgICAgICAgIHJldCA9IF9fdmNwdV9nZXRfcmVnKHZjcHUsIFJJ
U0NWX0lTQV9FWFRfUkVHKGV4dCksICZ2YWx1ZSk7Cj4gPiAtICAgICAgIGlmIChyZXQpIHsKPiA+
IC0gICAgICAgICAgICAgICBwcmludGYoIkZhaWxlZCB0byBnZXQgZXh0ICVkIiwgZXh0KTsKPiA+
IC0gICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiAtICAgICAgIH0KPiA+IC0KPiA+IC0g
ICAgICAgcmV0dXJuICEhdmFsdWU7Cj4gPiArICAgICAgIHJldHVybiAocmV0KSA/IGZhbHNlIDog
ISF2YWx1ZTsKPiA+ICB9Cj4gPgo+ID4gIHZvaWQgZmluYWxpemVfdmNwdShzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsIHN0cnVjdCB2Y3B1X3JlZ19saXN0ICpjKQo+ID4gQEAgLTUwNiwxMCArNTE3LDYg
QEAgc3RhdGljIF9fdTY0IGJhc2VfcmVnc1tdID0gewo+ID4gICAgICAgICBLVk1fUkVHX1JJU0NW
IHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfVElNRVIgfCBLVk1fUkVHX1JJU0NW
X1RJTUVSX1JFRyh0aW1lKSwKPiA+ICAgICAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0la
RV9VNjQgfCBLVk1fUkVHX1JJU0NWX1RJTUVSIHwgS1ZNX1JFR19SSVNDVl9USU1FUl9SRUcoY29t
cGFyZSksCj4gPiAgICAgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZN
X1JFR19SSVNDVl9USU1FUiB8IEtWTV9SRUdfUklTQ1ZfVElNRVJfUkVHKHN0YXRlKSwKPiA+IC0g
ICAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VTE9ORyB8IEtWTV9SRUdfUklTQ1Zf
SVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX0EsCj4gPiAtICAgICAgIEtWTV9SRUdfUklTQ1Yg
fCBLVk1fUkVHX1NJWkVfVUxPTkcgfCBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1Zf
SVNBX0VYVF9DLAo+ID4gLSAgICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1VMT05H
IHwgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JJU0NWX0lTQV9FWFRfSSwKPiA+IC0gICAg
ICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VTE9ORyB8IEtWTV9SRUdfUklTQ1ZfSVNB
X0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX00sCj4gPiAgICAgICAgIEtWTV9SRUdfUklTQ1YgfCBL
Vk1fUkVHX1NJWkVfVUxPTkcgfCBLVk1fUkVHX1JJU0NWX1NCSV9FWFQgfCBLVk1fUkVHX1JJU0NW
X1NCSV9TSU5HTEUgfCBLVk1fUklTQ1ZfU0JJX0VYVF9WMDEsCj4gPiAgICAgICAgIEtWTV9SRUdf
UklTQ1YgfCBLVk1fUkVHX1NJWkVfVUxPTkcgfCBLVk1fUkVHX1JJU0NWX1NCSV9FWFQgfCBLVk1f
UkVHX1JJU0NWX1NCSV9TSU5HTEUgfCBLVk1fUklTQ1ZfU0JJX0VYVF9USU1FLAo+ID4gICAgICAg
ICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1VMT05HIHwgS1ZNX1JFR19SSVNDVl9TQklf
RVhUIHwgS1ZNX1JFR19SSVNDVl9TQklfU0lOR0xFIHwgS1ZNX1JJU0NWX1NCSV9FWFRfSVBJLAo+
ID4gLS0KPiA+IDIuMzQuMQo+ID4KPgo+Cj4gLS0KPiBSZWdhcmRzLAo+IEF0aXNoCgpSZWdhcmRz
LApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
