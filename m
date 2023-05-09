Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB65C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 17:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQp0emHMGF1riFv6sNreeRpM8/gK5Lzpy5DaE+aRG4Y=; b=LEnMCRdQHrElti
	mYwlGPmemrgXJ9w8X0DrFVHL3GHTF22ZRNEI7yfBAggSUK/tlSRDUAnUKriwUWDCrzsa/lrBn9na3
	brRhJuWW9W2kqDaC2rXXEpTaSkqi75+qEdGrFG27WaRc+TXRQJVVPD6nCerwc9xJT/71shC7YZDRk
	+7CSwUgm6vtonYIrx+WCT2tDqphWmCpd1A3oc9NAKTTvZYNYCBpklUKP0MFnAlKCiphJiD7ufVysV
	LnPTDR29yfCjwlymZrlooUKSaw9WKO4vkqA218Aq4PlvcpIXLHchoAU79tPspPuIgcaR9XrsFp6jl
	phq5FqAabMi/c/47yJGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwRCf-003uc4-0I;
	Tue, 09 May 2023 17:32:45 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwRCc-003ubD-0P
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 17:32:43 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f00d41df22so36279827e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 10:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683653560; x=1686245560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsBc4OUVKU79CuNh6s1CDRhWpEPdYDoZ5WJAHHiWarw=;
        b=3/wV+jhO6GMHOISz4RaIHmCizn5M2+0JiQOMpqDz3sviYuJI0d1U+LLWPLttP9lYxD
         incEKswQ8XIImYR2XkWPBfEXDEJ+witiKdQBn17Nj87kMI3VETXQNc17oLNwPhP4lJov
         ncARr3jdW+fiE/LWBrsFX8G3pcr6tn818cLD2QDMdkAj24M0f1SO5NSsnJwJ1nCShyuC
         bGUmZ7P517lAlZLrIOsETSfbSq86OXeRdkAUKw/LVN2/k+BrausuNryrm8Z6ZDB6eo56
         Hvfoyb/LdJxa286/3y/709Khk8B5h12BPkqPqyPNuEY2ZY3fyFXr/0HBYYW2yq0D2+xK
         tSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653560; x=1686245560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsBc4OUVKU79CuNh6s1CDRhWpEPdYDoZ5WJAHHiWarw=;
        b=IdBpvrKfx08+iIhaP3KOIdbk1zcLCUTSgZoCf37RuDedaDM4gw4LjyMOe1ouIrrB1x
         Qh3LlTgFMmVNXe+gRimvxKF5WARFDFGuqPjLZBiqvC6W6d9zjn4UOBCnt+FRtkaCwH8W
         bX7BkYOu0P3aCW1g1vLHWN4lzOc07RosiaNm+HMLgBQy16njEFMaBrNGypjWgq3psfQt
         qIk3/XSUwa4aRMVU8FQhTPOS41OxsYzrhLpYBW0CIm+aWEv/Cn62G6wuF2olurX6io0U
         GCp+QVBPMmPWgVQB0vecopAO2dJf/vDuECWUDYdkcKHl/6F5enMrovHwV81PsCtzH0fc
         PbWQ==
X-Gm-Message-State: AC+VfDyKNNXSWIlcDuJrgvGKmZ3IEw2xNeAThi+p0GI6L78eG9prIaaN
	9T/SUT3joA/DUzVnG9zkT6UDWLqBLU7j2xhjNokcLg==
X-Google-Smtp-Source: ACHHUZ70lBjWokfJLkTr58sjXyruW1neYyvWrkYTXIj2WyT3RMBbAg3l5wPYYz8tDqPxUg5BGbMOazH33xA5yJ+prxM=
X-Received: by 2002:ac2:4d03:0:b0:4ef:ebbb:2cf5 with SMTP id
 r3-20020ac24d03000000b004efebbb2cf5mr1045596lfi.17.1683653559811; Tue, 09 May
 2023 10:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230509103033.11285-1-andy.chiu@sifive.com> <20230509103033.11285-4-andy.chiu@sifive.com>
 <2172277.NgBsaNRSFp@diego> <CABgGipW0U6=4AhaM9zWPDKZYdKEYDi04Gm-uRmf_WoOioTaf6w@mail.gmail.com>
In-Reply-To: <CABgGipW0U6=4AhaM9zWPDKZYdKEYDi04Gm-uRmf_WoOioTaf6w@mail.gmail.com>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 9 May 2023 10:32:03 -0700
Message-ID: <CALs-Hss8L478Pg7zdcVZkL-jGGqdXtQd+uy+JdNEey90+eBYiA@mail.gmail.com>
Subject: Re: [PATCH -next v19 03/24] riscv: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_V
To: Andy Chiu <andy.chiu@sifive.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Celeste Liu <coelacanthus@outlook.com>, 
	Andrew Bresticker <abrestic@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_103242_170682_BA454775 
X-CRM114-Status: GOOD (  40.62  )
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

T24gVHVlLCBNYXkgOSwgMjAyMyBhdCA5OjQx4oCvQU0gQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lm
aXZlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSA5LCAyMDIzIGF0IDc6MDXigK9QTSBIZWlr
byBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPiA+Cj4gPiBBbSBEaWVuc3RhZywg
OS4gTWFpIDIwMjMsIDEyOjMwOjEyIENFU1Qgc2NocmllYiBBbmR5IENoaXU6Cj4gPiA+IFByb2Jp
bmcga2VybmVsIHN1cHBvcnQgZm9yIFZlY3RvciBleHRlbnNpb24gaXMgYXZhaWxhYmxlIG5vdy4K
PiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNv
bT4KPiA+ID4gLS0tCj4gPiA+ICBEb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0ICAgICAg
IHwgMTAgKysrKysrKysrKwo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgg
ICAgICB8ICAyICstCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5o
IHwgIDMgKysrCj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyAgICAgICAgIHwg
IDkgKysrKysrKysrCj4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vcmlzY3Yv
aHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0Cj4gPiA+IGluZGV4
IDlmMGRkNjJkY2I1ZC4uYjg3NTVlMTgwZmJmIDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL3Jpc2N2L2h3cHJvYmUucnN0Cj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vcmlzY3YvaHdw
cm9iZS5yc3QKPiA+ID4gQEAgLTUzLDYgKzUzLDkgQEAgVGhlIGZvbGxvd2luZyBrZXlzIGFyZSBk
ZWZpbmVkOgo+ID4gPiAgICAgICAgcHJvZ3JhbXMgKGl0IG1heSBzdGlsbCBiZSBleGVjdXRlZCBp
biB1c2Vyc3BhY2UgdmlhIGEKPiA+ID4gICAgICAgIGtlcm5lbC1jb250cm9sbGVkIG1lY2hhbmlz
bSBzdWNoIGFzIHRoZSB2RFNPKS4KPiA+ID4KPiA+ID4gKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQ
Uk9CRV9CQVNFX0JFSEFWSU9SX1ZgOiBTdXBwb3J0IGZvciBWZWN0b3IgZXh0ZW5zaW9uLCBhcwo+
ID4gPiArICAgIGRlZmluZWQgYnkgdmVyaW9uIDEuMCBvZiB0aGUgUklTQy1WIFZlY3RvciBleHRl
bnNpb24uCj4gPgo+ID4gICAgICAgICBeXiB2ZXJzaW9uIFttaXNzaW5nIHRoZSBTXQo+ID4KPiA+
ID4gKwo+ID4gPiAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfSU1BX0VYVF8wYDogQSBi
aXRtYXNrIGNvbnRhaW5pbmcgdGhlIGV4dGVuc2lvbnMKPiA+ID4gICAgdGhhdCBhcmUgY29tcGF0
aWJsZSB3aXRoIHRoZSA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9SX0lNQWA6
Cj4gPiA+ICAgIGJhc2Ugc3lzdGVtIGJlaGF2aW9yLgo+ID4gPiBAQCAtNjQsNiArNjcsMTMgQEAg
VGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgo+ID4gPiAgICAqIDpjOm1hY3JvOmBSSVND
Vl9IV1BST0JFX0lNQV9DYDogVGhlIEMgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMgZGVmaW5l
ZAo+ID4gPiAgICAgIGJ5IHZlcnNpb24gMi4yIG9mIHRoZSBSSVNDLVYgSVNBIG1hbnVhbC4KPiA+
ID4KPiA+ID4gKyogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX1ZfRVhUXzBgOiBBIGJpdG1h
c2sgY29udGFpbmluZyB0aGUgZXh0ZW5zaW9ucwo+ID4gPiArICAgdGhhdCBhcmUgY29tcGF0aWJs
ZSB3aXRoIHRoZSA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9SX1ZgOiBiYXNl
Cj4gPiA+ICsgICBzeXN0ZW0gYmVoYXZpb3IuCj4gPiA+ICsKPiA+ID4gKyAgKiA6YzptYWNybzpg
UklTQ1ZfSFdQUk9CRV9WYDogVGhlIFYgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMgZGVmaW5l
ZCBieQo+ID4gPiArICAgIHZlcnNpb24gMS4wIG9mIHRoZSBSSVNDLVYgVmVjdG9yIGV4dGVuc2lv
biBtYW51YWwuCj4gPiA+ICsKPiA+Cj4gPiB0aGlzIHNlZW1zIHRvIGJlIGRvdWJsaW5nIHRoZSBS
SVNDVl9IV1BST0JFX0JBU0VfQkVIQVZJT1JfViBzdGF0ZSB3aXRob3V0Cj4gPiBhZGRpbmcgYWRk
aXRpb25hbCBpbmZvcm1hdGlvbj8gQm90aCBlc3NlbnRpYWxseSB0ZWxsIHRoZSBzeXN0ZW0gdGhh
dAo+ID4gViBleHRlbnNpb24gImRlZmluZWQgYnkgdmVyaW9uIDEuMCBvZiB0aGUgUklTQy1WIFZl
Y3RvciBleHRlbnNpb24iIGlzIHN1cHBvcnRlZC4KPgo+IEkgd2FzIHRoaW5raW5nIHRoYXQgUklT
Q1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9SX1YgaW5kaWNhdGVzIHRoZSBrZXJuZWwKPiBoYXMgYSBw
cm9iZSBmb3IgdmVjdG9yIChqdXN0IGxpa2UgUklTQ1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9SX0lN
QSkgYW5kCj4gUklTQ1ZfSFdQUk9CRV9LRVlfVl9FWFRfMCBpcyB3aGVyZSB0aGUga2VybmVsIHJl
cG9ydHMgd2hhdCBleGFjdGx5IHRoZQo+IGV4dGVuc2lvbiBpcy4gVGhpcyBtYXBzIHRvIHRoZSBj
b25kaXRpb24gbWF0Y2hpbmcgb2YgRixELCBhbmQgQyBpbgo+IElNQS4gSWYgdGhhdCBpcyBub3Qg
dGhlIGNhc2UgdGhlbiBJIHRoaW5rIHRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoaXMKPiBlbnRyeS4K
Pgo+ID4KPiA+IEkgZG9uJ3QgcXVlc3Rpb24gdGhhdCB3ZSdsbCBwcm9iYWJseSBuZWVkIGEga2V5
IGZvciBkZWVwZXIgdmVjdG9yLQo+ID4gc3BlY2lmaWNzIGJ1dCBJIGd1ZXNzIEknZCB0aGUgY29t
bWl0IG1lc3NhZ2Ugc2hvdWxkIGRlZmluaXRseSBleHBsYWluCj4gPiB3aHkgdGhlcmUgaXMgYSBk
dXBsaWNhdGlvbiBoZXJlLgo+Cj4gSSBzdXBwb3NlIHNvbWV0aGluZyBsaWtlIFp2Zmggc2hvdWxk
IGZhbGwgaW50byB0aGUgY2F0ZWdvcnkgb2YKPiBSSVNDVl9IV1BST0JFX0tFWV9WX0VYVF8wLiBJ
IHdpbGwgYWRkIHRoaXMgZXhhbXBsZSBpbnRvIHRoZSBjb21taXQKPiBtZXNzYWdlIGlmIHlvdSBh
Z3JlZSB0aGF0IGlzIGEgZ29vZCBleGFtcGxlLgo+Cj4gPgo+ID4KPiA+ID4gICogOmM6bWFjcm86
YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0aGF0IGNvbnRhaW5zIHBl
cmZvcm1hbmNlCj4gPiA+ICAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3RlZCBzZXQgb2Yg
cHJvY2Vzc29ycy4KPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgKPiA+ID4gaW5k
ZXggNzg5MzZmNGZmNTEzLi4zOWRmODYwNGZlYTEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vaHdwcm9iZS5oCj4gPiA+IEBAIC04LDYgKzgsNiBAQAo+ID4gPgo+ID4gPiAgI2luY2x1ZGUg
PHVhcGkvYXNtL2h3cHJvYmUuaD4KPiA+ID4KPiA+ID4gLSNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9N
QVhfS0VZIDUKPiA+ID4gKyNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIDYKPiA+ID4KPiA+
ID4gICNlbmRpZgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiA+ID4g
aW5kZXggOGQ3NDVhNGFkOGEyLi45M2E3ZmQzZmQzNDEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+ID4gPiBAQCAtMjIsNiArMjIsNyBAQCBzdHJ1Y3Qg
cmlzY3ZfaHdwcm9iZSB7Cj4gPiA+ICAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX01JTVBJRCAg
ICAgMgo+ID4gPiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9CQVNFX0JFSEFWSU9SICAgICAg
Mwo+ID4gPiAgI2RlZmluZSAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9S
X0lNQSAoMSA8PCAwKQo+ID4gPiArI2RlZmluZSAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9C
QVNFX0JFSEFWSU9SX1YgICAoMSA8PCAxKQo+ID4gPiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tF
WV9JTUFfRVhUXzAgIDQKPiA+ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVf
SU1BX0ZEICAgICAgICAgICAgKDEgPDwgMCkKPiA+ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJ
U0NWX0hXUFJPQkVfSU1BX0MgICAgICAgICAgICAgKDEgPDwgMSkKPiA+ID4gQEAgLTMyLDYgKzMz
LDggQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewo+ID4gPiAgI2RlZmluZSAgICAgICAgICAgICAg
UklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0ZBU1QgICAgICAgICAgICgzIDw8IDApCj4gPiA+ICAj
ZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5TVVBQT1JURUQg
ICAgKDQgPDwgMCkKPiA+ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfTUlT
QUxJR05FRF9NQVNLICAgICAgICAgICAoNyA8PCAwKQo+ID4gPiArI2RlZmluZSBSSVNDVl9IV1BS
T0JFX0tFWV9WX0VYVF8wICAgIDYKPiA+ID4gKyNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hX
UFJPQkVfViAgICAgICAgICAgICAgICAgKDEgPDwgMCkKPiA+ID4gIC8qIEluY3JlYXNlIFJJU0NW
X0hXUFJPQkVfTUFYX0tFWSB3aGVuIGFkZGluZyBpdGVtcy4gKi8KPiA+ID4KPiA+ID4gICNlbmRp
Zgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwo+ID4gPiBpbmRleCA1ZGIyOTY4M2ViZWUuLjYyODBh
N2Y3NzhiMyAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMK
PiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKPiA+ID4gQEAgLTEwLDYg
KzEwLDcgQEAKPiA+ID4gICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZS5oPgo+ID4gPiAgI2luY2x1
ZGUgPGFzbS9od3Byb2JlLmg+Cj4gPiA+ICAjaW5jbHVkZSA8YXNtL3NiaS5oPgo+ID4gPiArI2lu
Y2x1ZGUgPGFzbS92ZWN0b3IuaD4KPiA+ID4gICNpbmNsdWRlIDxhc20vc3dpdGNoX3RvLmg+Cj4g
PiA+ICAjaW5jbHVkZSA8YXNtL3VhY2Nlc3MuaD4KPiA+ID4gICNpbmNsdWRlIDxhc20vdW5pc3Rk
Lmg+Cj4gPiA+IEBAIC0xNjEsNiArMTYyLDcgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9vbmVfcGFp
cihzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPiA+ID4gICAgICAgICovCj4gPiA+ICAgICAg
IGNhc2UgUklTQ1ZfSFdQUk9CRV9LRVlfQkFTRV9CRUhBVklPUjoKPiA+ID4gICAgICAgICAgICAg
ICBwYWlyLT52YWx1ZSA9IFJJU0NWX0hXUFJPQkVfQkFTRV9CRUhBVklPUl9JTUE7Cj4gPiA+ICsg
ICAgICAgICAgICAgcGFpci0+dmFsdWUgfD0gUklTQ1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9SX1Y7
Cj4gPgo+ID4gRG9lc24ndCB0aGlzIGFsc28gbmVlZCBhCj4gPiAgICAgICAgIGlmIChoYXNfdmVj
dG9yKCkpCj4gPgo+Cj4gSWYgdGhlIFJJU0NWX0hXUFJPQkVfS0VZX0JBU0VfQkVIQVZJT1IgcGFy
dCBqdXN0IHRlbGxzIHdoZXRoZXIgaHdwcm9iZQo+IHN1cHBvcnRzIHByb2Jpbmcgb2YgYSBzZXQg
b2YgZXh0ZW5zaW9ucyB0aGVuIEkgdGhpbmsgd2Ugc2hvdWxkIG5vdCBhZGQKPiB0aGUgaWYgc3Rh
dGVtZW50IGhlcmUsIGJ1dCBtYXliZSBJIG1pc3VuZGVyc3Rvb2Qgc29tZXRoaW5nLi4KClRoZSBp
bnRlbnRpb24gd2FzIHRvIHNob3cgdGhhdCB0aGUgSSwgTSwgYW5kIEEgZXh0ZW5zaW9ucyBhcmUg
YWN0dWFsbHkKcHJlc2VudCBvbiB0aGlzIG1hY2hpbmUsIG5vdCB0aGF0IHRoZSBvdGhlciBwcm9i
ZSBrZXlzIGV4aXN0LiBVc2VybW9kZQppcyBhbGxvd2VkIHRvIHF1ZXJ5IGFueSBod3Byb2JlIGtl
eSwgdGhleSBqdXN0IGdldCBiYWNrIHRoZSBrZXkgc2V0IHRvCi0xIGFuZCB2YWx1ZSBzZXQgdG8g
MCBvbiB1bmtub3duIGtleXMuIFdlICJjaGVhdGVkIiBhIGJpdCBmb3IKZGV0ZXJtaW5pbmcgSSwg
TSwgYW5kIEEgZXhpc3Qgc2luY2UgdGhleSdyZSBhbHJlYWR5IHByZXJlcXVpc2l0ZXMgb2YKTGlu
dXgsIHdoaWNoIGlzIHdoeSB0aGVyZSdzIG5vIGNvbmRpdGlvbmFsIHRoZXJlLgotRXZhbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
