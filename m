Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22979C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 23:01:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9BD860F9B
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 23:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9BD860F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BgD6IgF34C0knidBuZdQeClDkDe/gw0IFnAFtCGtVw=; b=FQCjWAkNo6DLcM
	KPANX9H5gfWrlSLzjOBK6rBQ0wRTlEbXgV3yCEoZsUknr3a1xrE5d1pkoqGVm85r8w62J5KFslNEl
	lqMRzVvGRlt71quuFKkXS+1lT5v0ztld3Rv2Sc01ty0HVde1lYw7i7Ni7Ka2MoaaR7jTFtHh2rXUL
	dfCGpug+OSaTpAeSjk2+i8OkKETkhV7+O/AegRCRblXINATkF3AV0xCX0vMhy0yItCoIi/9Wl1N6n
	rXKJgcW/V8k/ZWCiuirWuf+AoRMPtN4xr3dgT7irI4VE2ZQA2YCoXvdUJ9eiC+li0Z38hDkimv2Qd
	fJ8T7FrHPPMpA3wScSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfrvB-006S75-PC; Wed, 27 Oct 2021 23:01:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfrv8-006S5v-7t
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 23:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635375679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=slhdlXIZouU3TKY0ZbemsIVdWTFlzqB2fSO2ZsS3sYo=;
 b=T+LZexvmA2XfP9C+RvwPZ0FK+TZSUihptO/wswj9QYjtt8+MeH0awNoTt5cF+88ChiLckN
 itegaHUWJ7HgeZOxtTv741RnahE8HV63duAtJUtoD8ROs87CcN1y8nlxAJTPOzL9/TCCx2
 YnagoMHWFYP9YADxgiqe15NKAmyGpCw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-hMDeYkgGPVeNYN6ztHYePw-1; Wed, 27 Oct 2021 19:01:17 -0400
X-MC-Unique: hMDeYkgGPVeNYN6ztHYePw-1
Received: by mail-ed1-f70.google.com with SMTP id
 z1-20020a05640235c100b003dcf0fbfbd8so3764025edc.6
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 16:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=slhdlXIZouU3TKY0ZbemsIVdWTFlzqB2fSO2ZsS3sYo=;
 b=sRRQA1vMeAJOn40gn54Brnr4U3QlfD2Ke6alqi1O2j5g59tF9fydr4s/4Y/p9sPh1R
 BMoxPPWUESGmz+FLqsAtL6TK4mv7jF9OzTMndBSWdrTESqMI2vmXoR5qwC64sflnAFIN
 0TxuGOqD5M8YDmaEdC75+wSdhN+IP5IhCelKAa843ZQ/3KUydOjbnHt2T3320nZ9uDIg
 SxxDJLkqR/+FSKhzrsFEdrczC9One28XCAThnKgkW019glJNSw6B3rfO13wlgIGoTisf
 qG+03bUsvxcUmUvqWXJtFtuouLBVONPNPWjPDkis+rFipxk275t4hst7/cT/ozhMkSSA
 b8FQ==
X-Gm-Message-State: AOAM532R9qoWMPscdNBgAFS6rbj1AgRkvkT8CGjoIVz8D3Yqg6OUd59Z
 X0f5hZco2uALFpc6t+/xgP12B58NwaG/BZSG0RynhnkyWdrNVgrfsuwhP0vgAzVI2iErCPi9Zf7
 T2DfByxkfa3DBmskmRQE/5z+yPL2S
X-Received: by 2002:a05:6402:35c5:: with SMTP id
 z5mr1051183edc.388.1635375676041; 
 Wed, 27 Oct 2021 16:01:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5j9O0+MnaAbrieUDtYr3ch1nbMXWnRtZk1a1pXiQnGgA26y4bxzvvUHHCk6CBGPVv830i9A==
X-Received: by 2002:a05:6402:35c5:: with SMTP id
 z5mr1051145edc.388.1635375675781; 
 Wed, 27 Oct 2021 16:01:15 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id h7sm696798edt.37.2021.10.27.16.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 16:01:14 -0700 (PDT)
Message-ID: <c8941c0a-959a-d6fc-fd9c-4c743371a733@redhat.com>
Date: Thu, 28 Oct 2021 01:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/3] RISC-V: Enable KVM in RV64 and RV32 defconfigs as a
 module
To: Palmer Dabbelt <palmerdabbelt@google.com>, Anup Patel <Anup.Patel@wdc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, anup@brainfault.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <mhng-1044c135-bede-498b-b244-9f9c5f5ea89b@palmerdabbelt-glaptop>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <mhng-1044c135-bede-498b-b244-9f9c5f5ea89b@palmerdabbelt-glaptop>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_160122_492046_374F7921 
X-CRM114-Status: GOOD (  16.05  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjgvMTAvMjEgMDA6MTIsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+IE9uIFR1ZSwgMjYgT2N0
IDIwMjEgMTA6MDE6MzQgUERUICgtMDcwMCksIEFudXAgUGF0ZWwgd3JvdGU6Cj4+IExldCdzIGVu
YWJsZSBLVk0gUklTQy1WIGluIFJWNjQgYW5kIFJWMzIgZGVmY29uZmlncyBhcyBtb2R1bGUKPj4g
c28gdGhhdCBpdCBhbHdheXMgYnVpbHQgYWxvbmcgd2l0aCB0aGUgZGVmYXVsdCBrZXJuZWwgaW1h
Z2UuCj4gCj4gVHVybmluZyBvbiBLVk0gaW4gdGhlIGRlZmNvbmZpZ3Mgc2VlbXMgbGlrZSB0aGUg
cmlnaHQgd2F5IHRvIGdvLCBidXQgCj4gdGhpcyBoYXMgbW9yZSBkaWZmIHRoYW4ganVzdCB0aGF0
LsKgIE5vdCBzdXJlIGlmIHRoYXQncyBhbGwganVzdCAKPiBzYXZlZGVmY29uZmlnIHN0dWZmLCBJ
IHVzdWFsbHkgdHJ5IGFuZCBzcGxpdCBvdXQgdGhlIG5vbi1mdW5jdGlvbmFsIAo+IGNoYW5nZXMg
ZnJvbSBhbnl0aGluZyB0aGF0IG1ha2VzIGEgY2hhbmdlLgo+IAo+IElmIHlvdSBjaGVja2VkIHRo
ZW4KPiAKPiBBY2tlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lcmRhYmJlbHRAZ29vZ2xlLmNv
bT4KPiAKPiBhc3N1bWluZyB5b3Ugd2FudCB0byBrZWVwIHRoZXNlIHRvZ2V0aGVyLsKgIExNSyBp
ZiB5b3Ugd2FudCBtZSB0byB0YWtlIAo+IHRoaXMgb24gaXRzIG93biAoSSdsbCBzcGxpdCBpdCB1
cCBpZiB5b3UgZG8pLgoKSSB0aGluayBpdCdzIGVhc2llc3QgaWYgeW91IGp1c3QgbWVyZ2UgaXQg
Zm9yIC1yYzIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KClBhb2xvCgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBBbnVwIFBhdGVsIDxhbnVwLnBhdGVsQHdkYy5jb20+Cj4+IC0tLQo+PiDCoGFyY2gvcmlz
Y3YvY29uZmlncy9kZWZjb25maWfCoMKgwqDCoMKgIHwgMTUgKysrKysrKy0tLS0tLS0tCj4+IMKg
YXJjaC9yaXNjdi9jb25maWdzL3J2MzJfZGVmY29uZmlnIHzCoCA4ICsrKystLS0tCj4+IMKgMiBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcgYi9hcmNoL3Jpc2N2L2NvbmZp
Z3MvZGVmY29uZmlnCj4+IGluZGV4IDRlYmM4MDMxNWYwMS4uNDA1MDZkZmFiNWNmIDEwMDY0NAo+
PiAtLS0gYS9hcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnCj4+ICsrKyBiL2FyY2gvcmlzY3Yv
Y29uZmlncy9kZWZjb25maWcKPj4gQEAgLTIsNiArMiw3IEBAIENPTkZJR19TWVNWSVBDPXkKPj4g
wqBDT05GSUdfUE9TSVhfTVFVRVVFPXkKPj4gwqBDT05GSUdfTk9fSFpfSURMRT15Cj4+IMKgQ09O
RklHX0hJR0hfUkVTX1RJTUVSUz15Cj4+ICtDT05GSUdfQlBGX1NZU0NBTEw9eQo+PiDCoENPTkZJ
R19JS0NPTkZJRz15Cj4+IMKgQ09ORklHX0lLQ09ORklHX1BST0M9eQo+PiDCoENPTkZJR19DR1JP
VVBTPXkKPj4gQEAgLTEzLDEyICsxNCwxNCBAQCBDT05GSUdfVVNFUl9OUz15Cj4+IMKgQ09ORklH
X0NIRUNLUE9JTlRfUkVTVE9SRT15Cj4+IMKgQ09ORklHX0JMS19ERVZfSU5JVFJEPXkKPj4gwqBD
T05GSUdfRVhQRVJUPXkKPj4gLUNPTkZJR19CUEZfU1lTQ0FMTD15Cj4+ICsjIENPTkZJR19TWVNG
U19TWVNDQUxMIGlzIG5vdCBzZXQKPj4gK0NPTkZJR19TT0NfTUlDUk9DSElQX1BPTEFSRklSRT15
Cj4+IMKgQ09ORklHX1NPQ19TSUZJVkU9eQo+PiDCoENPTkZJR19TT0NfVklSVD15Cj4+IC1DT05G
SUdfU09DX01JQ1JPQ0hJUF9QT0xBUkZJUkU9eQo+PiDCoENPTkZJR19TTVA9eQo+PiDCoENPTkZJ
R19IT1RQTFVHX0NQVT15Cj4+ICtDT05GSUdfVklSVFVBTElaQVRJT049eQo+PiArQ09ORklHX0tW
TT1tCj4+IMKgQ09ORklHX0pVTVBfTEFCRUw9eQo+PiDCoENPTkZJR19NT0RVTEVTPXkKPj4gwqBD
T05GSUdfTU9EVUxFX1VOTE9BRD15Cj4+IEBAIC02OCwxNCArNzEsMTIgQEAgQ09ORklHX0hXX1JB
TkRPTT15Cj4+IMKgQ09ORklHX0hXX1JBTkRPTV9WSVJUSU89eQo+PiDCoENPTkZJR19TUEk9eQo+
PiDCoENPTkZJR19TUElfU0lGSVZFPXkKPj4gKyMgQ09ORklHX1BUUF8xNTg4X0NMT0NLIGlzIG5v
dCBzZXQKPj4gwqBDT05GSUdfR1BJT0xJQj15Cj4+IMKgQ09ORklHX0dQSU9fU0lGSVZFPXkKPj4g
LSMgQ09ORklHX1BUUF8xNTg4X0NMT0NLIGlzIG5vdCBzZXQKPj4gLUNPTkZJR19QT1dFUl9SRVNF
VD15Cj4+IMKgQ09ORklHX0RSTT15Cj4+IMKgQ09ORklHX0RSTV9SQURFT049eQo+PiDCoENPTkZJ
R19EUk1fVklSVElPX0dQVT15Cj4+IC1DT05GSUdfRlJBTUVCVUZGRVJfQ09OU09MRT15Cj4+IMKg
Q09ORklHX1VTQj15Cj4+IMKgQ09ORklHX1VTQl9YSENJX0hDRD15Cj4+IMKgQ09ORklHX1VTQl9Y
SENJX1BMQVRGT1JNPXkKPj4gQEAgLTg1LDEwICs4NiwxMCBAQCBDT05GSUdfVVNCX09IQ0lfSENE
PXkKPj4gwqBDT05GSUdfVVNCX09IQ0lfSENEX1BMQVRGT1JNPXkKPj4gwqBDT05GSUdfVVNCX1NU
T1JBR0U9eQo+PiDCoENPTkZJR19VU0JfVUFTPXkKPj4gK0NPTkZJR19NTUM9eQo+PiDCoENPTkZJ
R19NTUNfU0RIQ0k9eQo+PiDCoENPTkZJR19NTUNfU0RIQ0lfUExURk09eQo+PiDCoENPTkZJR19N
TUNfU0RIQ0lfQ0FERU5DRT15Cj4+IC1DT05GSUdfTU1DPXkKPj4gwqBDT05GSUdfTU1DX1NQST15
Cj4+IMKgQ09ORklHX1JUQ19DTEFTUz15Cj4+IMKgQ09ORklHX1ZJUlRJT19QQ0k9eQo+PiBAQCAt
MTM5LDUgKzE0MCwzIEBAIENPTkZJR19SQ1VfRVFTX0RFQlVHPXkKPj4gwqAjIENPTkZJR19GVFJB
Q0UgaXMgbm90IHNldAo+PiDCoCMgQ09ORklHX1JVTlRJTUVfVEVTVElOR19NRU5VIGlzIG5vdCBz
ZXQKPj4gwqBDT05GSUdfTUVNVEVTVD15Cj4+IC0jIENPTkZJR19TWVNGU19TWVNDQUxMIGlzIG5v
dCBzZXQKPj4gLUNPTkZJR19FRkk9eQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9jb25maWdz
L3J2MzJfZGVmY29uZmlnIAo+PiBiL2FyY2gvcmlzY3YvY29uZmlncy9ydjMyX2RlZmNvbmZpZwo+
PiBpbmRleCA0MzRlZjViNjQ1OTkuLjQ0MDIyZTA0OGVmZCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9y
aXNjdi9jb25maWdzL3J2MzJfZGVmY29uZmlnCj4+ICsrKyBiL2FyY2gvcmlzY3YvY29uZmlncy9y
djMyX2RlZmNvbmZpZwo+PiBAQCAtMiw2ICsyLDcgQEAgQ09ORklHX1NZU1ZJUEM9eQo+PiDCoENP
TkZJR19QT1NJWF9NUVVFVUU9eQo+PiDCoENPTkZJR19OT19IWl9JRExFPXkKPj4gwqBDT05GSUdf
SElHSF9SRVNfVElNRVJTPXkKPj4gK0NPTkZJR19CUEZfU1lTQ0FMTD15Cj4+IMKgQ09ORklHX0lL
Q09ORklHPXkKPj4gwqBDT05GSUdfSUtDT05GSUdfUFJPQz15Cj4+IMKgQ09ORklHX0NHUk9VUFM9
eQo+PiBAQCAtMTMsMTIgKzE0LDE0IEBAIENPTkZJR19VU0VSX05TPXkKPj4gwqBDT05GSUdfQ0hF
Q0tQT0lOVF9SRVNUT1JFPXkKPj4gwqBDT05GSUdfQkxLX0RFVl9JTklUUkQ9eQo+PiDCoENPTkZJ
R19FWFBFUlQ9eQo+PiAtQ09ORklHX0JQRl9TWVNDQUxMPXkKPj4gKyMgQ09ORklHX1NZU0ZTX1NZ
U0NBTEwgaXMgbm90IHNldAo+PiDCoENPTkZJR19TT0NfU0lGSVZFPXkKPj4gwqBDT05GSUdfU09D
X1ZJUlQ9eQo+PiDCoENPTkZJR19BUkNIX1JWMzJJPXkKPj4gwqBDT05GSUdfU01QPXkKPj4gwqBD
T05GSUdfSE9UUExVR19DUFU9eQo+PiArQ09ORklHX1ZJUlRVQUxJWkFUSU9OPXkKPj4gK0NPTkZJ
R19LVk09bQo+PiDCoENPTkZJR19KVU1QX0xBQkVMPXkKPj4gwqBDT05GSUdfTU9EVUxFUz15Cj4+
IMKgQ09ORklHX01PRFVMRV9VTkxPQUQ9eQo+PiBAQCAtNjcsMTEgKzcwLDkgQEAgQ09ORklHX0hX
X1JBTkRPTV9WSVJUSU89eQo+PiDCoENPTkZJR19TUEk9eQo+PiDCoENPTkZJR19TUElfU0lGSVZF
PXkKPj4gwqAjIENPTkZJR19QVFBfMTU4OF9DTE9DSyBpcyBub3Qgc2V0Cj4+IC1DT05GSUdfUE9X
RVJfUkVTRVQ9eQo+PiDCoENPTkZJR19EUk09eQo+PiDCoENPTkZJR19EUk1fUkFERU9OPXkKPj4g
wqBDT05GSUdfRFJNX1ZJUlRJT19HUFU9eQo+PiAtQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEU9
eQo+PiDCoENPTkZJR19VU0I9eQo+PiDCoENPTkZJR19VU0JfWEhDSV9IQ0Q9eQo+PiDCoENPTkZJ
R19VU0JfWEhDSV9QTEFURk9STT15Cj4+IEBAIC0xMzAsNCArMTMxLDMgQEAgQ09ORklHX1JDVV9F
UVNfREVCVUc9eQo+PiDCoCMgQ09ORklHX0ZUUkFDRSBpcyBub3Qgc2V0Cj4+IMKgIyBDT05GSUdf
UlVOVElNRV9URVNUSU5HX01FTlUgaXMgbm90IHNldAo+PiDCoENPTkZJR19NRU1URVNUPXkKPj4g
LSMgQ09ORklHX1NZU0ZTX1NZU0NBTEwgaXMgbm90IHNldAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
