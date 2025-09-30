Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABDFCAC5B9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 07:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zxt9HzhfuH0LDwo/82wiJJKBNWsrRWetzMdap8UfZeE=; b=ZegSym8U5ZdCz8
	lB8m1BaNO9ZGmc3k116XA8Vyn/Ozm4qGVlBQhVuR9EWCiqy0yneGPhKZNk3mQm4ToNPFCk8UKXDD8
	PtVrFU/oJ5KDsoLOb5s1PFHfRxHEnokPjMSGlEaBtt+NrMjZec/C0iMSE1SCkneXAJElXWzKpD+Fm
	Kk3VzEUfSaOm24AkYfijFcCCqvYrVFx8WYnwKC+NPFE0YhDODIp7WuxoVoWZ+KtQd2iJRL06ShPSw
	NbR6mv9BcmejK4diI/yCcEPoAMdkTETnamytYHaxoBtd3IRqjaUZ/jOGCkIsqE9+a0GAOsNsNIfMS
	H5Pf78ddTlbTaMzvfeOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UWQ-00000004SEd-2jLU;
	Tue, 30 Sep 2025 07:11:38 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UWO-00000004SC5-0VWa
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 07:11:37 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7b06f879d7bso1910949a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Sep 2025 00:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1759216294; x=1759821094; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR+v3DYyPIQfSuBgQSD/F1YEBoxZbmD+6/3elV5THH0=;
        b=I/ZVMfC8QvUE2jv42oZhyrg00ADiwk2hq7KSKEGXt3xJHzkD9Z8oW0mu0LOoI0cb0f
         1a6CBYxloGxhJQYVyxM2owTCxPAS8T8eZIWmiOfLm+HKxm+XiyKtfxi9aVhWfGBJSBpa
         AQ96nIflUeOxl7zR3CJTMfj44+ZGtNSsMIIIivHmyVWbxi/I98zaJT0FjhlaKLZda5WF
         /SWlJMUkPpwZFDVWTeUAVMQyORBRvfLEmqe5ASARscyp13+fcn3xQBSdBVuQYxSqsRTW
         wc4kMooxwYMsfMQvCs5hIB7SEsuRpZdXGfQscqvpA/e3YHVG/25sUD54M5aODKSiOSg6
         5u0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759216294; x=1759821094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CR+v3DYyPIQfSuBgQSD/F1YEBoxZbmD+6/3elV5THH0=;
        b=mmdz0vrs5dbIZ7uT2easzvDdRGAwuh5tYt7z8CkJbuxjmU387U+fBsNQIRLeGESzYw
         hNCpz7Mfq+WWYdhWgmL6le53QaQoGfHLuRkE3sygSake59hckcxV7w3fskaGUzfng6jL
         j+jIJWtAd1BLCuic1j0YT1PSAuLItcNbqTcHL384d+1p9aDzr9CjbwvWfvpK/LTdRcp3
         /E2stO4FruX8jQf1Zn8b5Cf5qxXpyoQLD3PgjpVIOFiTMVIyKUZKicB0r/QWVe6QUU57
         PPevyhAPl29sgZeDAtj8PDV+wVkxtTGDsDfQai0snfLC5MA19nUpfyVt891FLdFWvvNH
         SgAw==
X-Forwarded-Encrypted: i=1; AJvYcCUdL8+NwC/wexO0XKXI1wp/5SWWP5QnTG5raxXoHwLmlFitngwHEkoz79KBYrP2QeVbizZaKMuwbTZkIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkxaESueHMEr4p2szA1eqjoF3QrMIZ8k7Sxgooi0RXk3kPTFUF
	9jFVW182Qvhk8ZmDdEVCZaLO3ASRTkKg+1KOU0GPO41WeOuMzIvtGXo9fXFhyQ0isx7rbC7tMlA
	aAATqBAMzu0tgSdYxNs9TiBFGPrbyPybW3LALuJHlEQ==
X-Gm-Gg: ASbGncvQnMpY8gY0QDgy49zjdbN+jhoNB8uKwHzQhK/1v+jEoOHfn/exN9FY3DFTOzT
	NnTkFR10Arkh3c+xdyDRO9gLASpiV0jk97c/cUFv/N+AfYfwpEL5z4ZIPs6IviJ1rHco3s9MhOt
	GxvDvj1bpZG9IdX4seWE82P9OZ+lsYfQ5wD1AohDJK28SP1bQ9si2rOmxhMVWukP9NfrnmC/aHV
	wq2tPMpM5OGduMCu2z+O99JORnyuxlU0apPMFsFAELUTpwEFH0=
X-Google-Smtp-Source: AGHT+IG13enBpViuqbJkl3egtFONm0MWRV/sewI1GNsujGwdIAgHii202fyE/GTui5/tKuBeRANEDhPr69i6SXBk7hQ=
X-Received: by 2002:a05:6808:158d:b0:437:d0a7:e7aa with SMTP id
 5614622812f47-43f9401fe52mr1763089b6e.19.1759216292941; Tue, 30 Sep 2025
 00:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250925084806.89715-1-cuiyunhui@bytedance.com>
 <20250925084806.89715-2-cuiyunhui@bytedance.com> <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
 <CAEEQ3wnwNdTgt6ByHCzM43fhZMLSxwXvYx-AGBpsktraXqif2Q@mail.gmail.com>
 <CAD=FV=X6Xv_WYPMXKtOWLJX7skCoQmia3JbQej_u38qxqAbqDg@mail.gmail.com>
 <CAEEQ3wn0UckgNTJCPCNDtHW8DwWAJR1PXURvH57yfHATYqs7Gw@mail.gmail.com>
 <CAD=FV=XoUw6HWoFLMcgyHhYm7oeTOXCAyvBdpOghggmdvYzp6Q@mail.gmail.com> <CAEEQ3w==Ekffs4+Z55AXMV52f+8ht1pWm3JexXCSiB7T6rzppA@mail.gmail.com>
In-Reply-To: <CAEEQ3w==Ekffs4+Z55AXMV52f+8ht1pWm3JexXCSiB7T6rzppA@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 30 Sep 2025 15:11:21 +0800
X-Gm-Features: AS18NWBdZh_HxwD18sk9IRGlss7IupBdkXT8d-g2velRw5frfqvDCFq41tp_kn0
Message-ID: <CAEEQ3wkUai4-noA6CQDsOs=Hn3bSB5cdV9tZJZR8_g+o9e-Mpg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/2] watchdog: move arm64 watchdog_hld
 into common code
To: Doug Anderson <dianders@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	ziqianlu@bytedance.com, akpm@linux-foundation.org, alex@ghiti.fr, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	catalin.marinas@arm.com, johannes@sipsolutions.net, lihuafei1@huawei.com, 
	mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_001136_293150_996DB8ED 
X-CRM114-Status: GOOD (  46.45  )
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

SGkgRG91ZywKCk9uIFR1ZSwgU2VwIDMwLCAyMDI1IGF0IDk6NTPigK9BTSB5dW5odWkgY3VpIDxj
dWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBIaSBEb3VnLAo+Cj4gT24gVHVlLCBT
ZXAgMzAsIDIwMjUgYXQgNjo1NuKAr0FNIERvdWcgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVt
Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGksCj4gPgo+ID4gT24gU2F0LCBTZXAgMjcsIDIwMjUgYXQg
NzozOOKAr1BNIHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gSGkgRG91ZywKPiA+ID4KPiA+ID4gT24gU2F0LCBTZXAgMjcsIDIwMjUgYXQgNDo1
OOKAr0FNIERvdWcgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gPiA+
ID4KPiA+ID4gPiBIaSwKPiA+ID4gPgo+ID4gPiA+IE9uIEZyaSwgU2VwIDI2LCAyMDI1IGF0IDI6
MzfigK9BTSB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gSGkgRG91ZywKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBGcmksIFNlcCAy
NiwgMjAyNSBhdCA0OjAw4oCvQU0gRG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3Jn
PiB3cm90ZToKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSGksCj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+IE9uIFRodSwgU2VwIDI1LCAyMDI1IGF0IDE6NDjigK9BTSBZdW5odWkgQ3VpIDxjdWl5dW5o
dWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBAQCAt
MTcsNiArMTcsNyBAQAo+ID4gPiA+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvY3B1X3BtLmg+Cj4g
PiA+ID4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KPiA+ID4gPiA+ID4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ID4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvbm1p
Lmg+Cj4gPiA+ID4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9wZXJmL2FybV9wbXUuaD4KPiA+ID4g
PiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiA+ID4gPiA+ID4gPiAgI2luY2x1ZGUg
PGxpbnV4L3NjaGVkL2Nsb2NrLmg+Cj4gPiA+ID4gPiA+ID4gQEAgLTY5NiwxMCArNjk3LDEyIEBA
IHN0YXRpYyBpbnQgYXJtcG11X2dldF9jcHVfaXJxKHN0cnVjdCBhcm1fcG11ICpwbXUsIGludCBj
cHUpCj4gPiA+ID4gPiA+ID4gICAgICAgICByZXR1cm4gcGVyX2NwdShod19ldmVudHMtPmlycSwg
Y3B1KTsKPiA+ID4gPiA+ID4gPiAgfQo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gLWJvb2wg
YXJtX3BtdV9pcnFfaXNfbm1pKHZvaWQpCj4gPiA+ID4gPiA+ID4gKyNpZmRlZiBDT05GSUdfSEFS
RExPQ0tVUF9ERVRFQ1RPUl9QRVJGCj4gPiA+ID4gPiA+ID4gK2Jvb2wgYXJjaF9wZXJmX25taV9p
c19hdmFpbGFibGUodm9pZCkKPiA+ID4gPiA+ID4gPiAgewo+ID4gPiA+ID4gPiA+ICAgICAgICAg
cmV0dXJuIGhhc19ubWk7Cj4gPiA+ID4gPiA+ID4gIH0KPiA+ID4gPiA+ID4gPiArI2VuZGlmCj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFNob3VsZCB0aGUgcHJldmlvdXMgY29tbWVudCBtb3ZlIGhl
cmUsIEFLQToKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gLyoKPiA+ID4gPiA+ID4gICogaGFyZGxv
Y2t1cF9kZXRlY3Rvcl9wZXJmX2luaXQoKSB3aWxsIHN1Y2Nlc3MgZXZlbiBpZiBQc2V1ZG8tTk1J
IHR1cm5zIG9mZiwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPa2F5LCB3ZSBhbHNvIG5lZWQgdG8gY2hh
bmdlIGl0IHRvIOKAnHdhdGNoZG9nX2hhcmRsb2NrdXBfcHJvYmUoKeKAnQo+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gICogaG93ZXZlciwgdGhlIHBtdSBpbnRlcnJ1cHRzIHdpbGwgYWN0IGxpa2UgYSBu
b3JtYWwgaW50ZXJydXB0IGluc3RlYWQgb2YKPiA+ID4gPiA+ID4gICogTk1JIGFuZCB0aGUgaGFy
ZGxvY2t1cCBkZXRlY3RvciB3b3VsZCBiZSBicm9rZW4uCj4gPiA+ID4gPiA+ICovCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gK3N0YXRpYyBpbnQgX19pbml0IGluaXRfd2F0
Y2hkb2dfZnJlcV9ub3RpZmllcih2b2lkKQo+ID4gPiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiA+ID4g
KyAgICAgICByZXR1cm4gY3B1ZnJlcV9yZWdpc3Rlcl9ub3RpZmllcigmd2F0Y2hkb2dfZnJlcV9u
b3RpZmllciwKPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIENQVUZSRVFfUE9MSUNZX05PVElGSUVSKTsKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
SSB0aGluayB5b3UgbmVlZCB0byBkbyBzb21ldGhpbmcgdG8gcHJldmVudCB0aGlzIGZyb20gaGFw
cGVuaW5nIG9uIGFueQo+ID4gPiA+ID4gPiBwbGF0Zm9ybXMgdGhhdCBvdmVycmlkZSBod19ubWlf
Z2V0X3NhbXBsZV9wZXJpb2QoKSwgcmlnaHQ/IFRoZXNlCj4gPiA+ID4gPiA+IGNwdWZyZXEgbm90
aWZpZXJzIHdpbGwgYmUgdXNlbGVzcyBpbiB0aGF0IGNhc2UuLi4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBJIHVuZGVyc3RhbmQgdGhpcyBpcyBub3QgYSBwcm9ibGVtLiB3YXRjaGRvZ19wZXJmIHVzZXMK
PiA+ID4gPiA+IFBFUkZfQ09VTlRfSFdfQ1BVX0NZQ0xFUywgd2hpY2ggbWVhbnMgaXQgaXMgaW5o
ZXJlbnRseSBsaW1pdGVkIGJ5IHRoZQo+ID4gPiA+ID4gQ1BVJ3MgbWFpbiBmcmVxdWVuY3kuIEFm
dGVyIHdlIG1ha2Ugc3VjaCBhIGNoYW5nZSwgYSBsYXJnZXIgdmFsdWUgbWF5Cj4gPiA+ID4gPiBi
ZSB1c2VkIGFzIHRoZSBwZXJpb2QsIHNvIHRoZSBOTUkgcGVyaW9kIHdpbGwgYmVjb21lIGxvbmdl
ciwgYnV0IHRoaXMKPiA+ID4gPiA+IHZhbHVlIHdpbGwgbm90IGNoYW5nZSBhZnRlciB0aGUgc3lz
dGVtIHN0YXJ0cy4KPiA+ID4gPgo+ID4gPiA+IEknbSBub3Qgc3VyZSBJIGZvbGxvdy4gT24geDg2
LCBod19ubWlfZ2V0X3NhbXBsZV9wZXJpb2QoKSBpczoKPiA+ID4gPgo+ID4gPiA+IHU2NCBod19u
bWlfZ2V0X3NhbXBsZV9wZXJpb2QoaW50IHdhdGNoZG9nX3RocmVzaCkKPiA+ID4gPiB7Cj4gPiA+
ID4gICByZXR1cm4gKHU2NCkoY3B1X2toeikgKiAxMDAwICogd2F0Y2hkb2dfdGhyZXNoOwo+ID4g
PiA+IH0KPiA+ID4KPiA+ID4gSSBoYXZlIGFkZGVkIHRoZSBtYWludGFpbmVycyBmb3IgYXJjaC94
ODYuCj4gPiA+Cj4gPiA+IDEuIGNwdV9raHogY2FuIGJlIHVuZGVyc3Rvb2QgYXMgcmV0dXJuaW5n
IHRoZSBiYXNlIG9wZXJhdGluZyBmcmVxdWVuY3kKPiA+ID4gb2YgYSBDUFUsIHN1Y2ggYXMgMi4z
R0h6LiBJbiBwcmFjdGljZSwgdGhlIENQVSdzIGNvcmUgZnJlcXVlbmN5IG1heQo+ID4gPiBkb3du
Y2xvY2sgdG8gODAwTUh6IHVuZGVyIGxvdyBsb2FkIGFuZCBvdmVyY2xvY2sgdG8gNC40R0h6IHVu
ZGVyIGhpZ2gKPiA+ID4gbG9hZC4KPiA+ID4KPiA+ID4gMi4gQmVjYXVzZSB0aGUgZXZlbnQgcHJv
dmlkZWQgdG8gdGhlIFBNVSBoYXMgdGhlCj4gPiA+IFBFUkZfQ09VTlRfSFdfQ1BVX0NZQ0xFUyBh
dHRyaWJ1dGUsIGFuZCB0aGUgY291bnRlcidzIHZhbHVlIGlzIGJhc2VkCj4gPiA+IG9uIDIuM0dI
eiwgdGhlIGV4ZWN1dGlvbiBjeWNsZSBvZiB3YXRjaGRvZ19vdmVyZmxvd19jYWxsYmFjaygpIGlz
IG5vdAo+ID4gPiBmaXhlZDsgaXQgdmFyaWVzIHdpdGggdGhlIENQVSdzIGNvcmUgZnJlcXVlbmN5
LiBXaGVuIHRoZSBDUFUgcnVucyBhdCBhCj4gPiA+IGZyZXF1ZW5jeSBoaWdoZXIgdGhhbiAyLjNH
SHosIHRoZSBOTUkgY3ljbGUgd2lsbCBzaG9ydGVuOyBvdGhlcndpc2UsCj4gPiA+IGl0IHdpbGwg
bGVuZ3RoZW4uCj4gPiA+Cj4gPiA+IDMuIEFmdGVyIG91ciBtb2RpZmljYXRpb24sIGlmIHRoZSBh
cmNoaXRlY3R1cmUgaXMgbm90IGludGVncmF0ZWQgd2l0aAo+ID4gPiBjcHVmcmVxLCBpdCByZXR1
cm5zIDAgYW5kIHdpbGwgbm90IHVwZGF0ZSB0aGUgY3ljbGUuIElmIGludGVncmF0ZWQKPiA+ID4g
d2l0aCBjcHVmcmVxLCBpdCByZXR1cm5zIHRoZSBtYXhpbXVtIGZyZXF1ZW5jeSBzdXBwb3J0ZWQg
YnkgdGhlIENQVSwKPiA+ID4gc28gdGhlIE5NSSBjeWNsZSBpcyBvbmx5IHNsaWdodGx5IGxlbmd0
aGVuZWQsIHdpdGggbm8gaW1wYWN0IG9uIHRoZQo+ID4gPiBhY3R1YWwgaGFyZGxvY2t1cCBkZXRl
Y3Rpb24gZnVuY3Rpb24uCj4gPiA+Cj4gPiA+IDQuIEkgaGF2ZSBhbHNvIGNvbmR1Y3RlZCB0ZXN0
czoKPiA+ID4gc3RyZXNzLW5nIC0tY3B1IDEgLS10YXNrc2V0IDEgLS1jcHUtbG9hZCA4MAo+ID4g
PiBlY2hvIDgwMDAwMCA+IHNjYWxpbmdfbWF4X2ZyZXEKPiA+ID4gdHVyYm9zdGF0IHNob3dzIHRo
YXQgQnp5X01IeiBhbmQgVFNDX01IeiBhcmUgODAwIGFuZCAyMzAwIHJlc3BlY3RpdmVseS4KPiA+
ID4gQW5kIHRoZSBOTUkgY3ljbGUgYmVjYW1lIGFwcHJveGltYXRlbHkgMzAgc2Vjb25kczoKPiA+
ID4gWyAyMzA5LjQ0Mjc0M10gTk1JIHdhdGNoZG9nOiAtLS0tLS0gd2F0Y2hkb2cgb3ZlcmZsb3cg
Y2FsbGJhY2ssIGNwdSA9IDEKPiA+ID4gWyAyMzQxLjUyNjAzMl0gTk1JIHdhdGNoZG9nOiAtLS0t
LS0gd2F0Y2hkb2cgb3ZlcmZsb3cgY2FsbGJhY2ssIGNwdSA9IDEKPiA+Cj4gPiBXaGV0aGVyIG9y
IG5vdCBoYXZpbmcgeDg2IGFuZCBwb3dlcnBjIHN0YXJ0IGxvb2tpbmcgYXQgY3B1ZnJlcSBpcyBh
bgo+ID4gaW1wcm92ZW1lbnQsIGNlcnRhaW5seSBpdCBpcyBhIGNoYW5nZSBpbiBiZWhhdmlvciwg
cmlnaHQ/IElmIHdlJ3JlCj4gPiByZWFsbHkgY2hhbmdpbmcgdGhlIGJlaGF2aW9yIGhlcmUgdGhl
biB0aGUgY29tbWl0IHN1YmplY3QgYW5kIGNvbW1pdAo+ID4gbWVzc2FnZSBuZWVkIHRvIG1lbnRp
b24gdGhpcy4gUmlnaHQgbm93IHRoaXMgaXMgYmlsbGVkIGFzIGEgc2ltcGxlCj4gPiByZW5hbWUu
Li4KPiA+Cj4gPiBJIGRvbid0IHBlcnNvbmFsbHkgaGF2ZSBsb3RzIG9mIGV4cGVyaWVuY2Ugd2l0
aCB4ODYgY3B1ZnJlcSBidXQgSSBkbwo+ID4ga25vdyBpdCBkb2Vzbid0IHdvcmsgcXVpdGUgdGhl
IHNhbWUgYXMgaG93IGl0IGRvZXMgb24gYXJtLiBJdCB3b3VsZAo+ID4gZGVmaW5pdGVseSBiZSBn
b29kIHRvIGdldCBzb21lb25lIG9uIHg4NiAvIHBvd2VycGMgdG8gbWFrZSBzdXJlIHRoYXQKPiA+
IHRoZXkgYXJlIGhhcHB5IHdpdGggdGhpcy4gLi4ub3IgeW91IGp1c3Qga2VlcCBtYWtpbmcgaXQg
d29yayB0aGUgd2F5Cj4gPiBpdCBkaWQgYmVmb3JlIGFuZCB0aGVuIHlvdSBkb24ndCBoYXZlIHRv
IHdvcnJ5IGFib3V0IGdldHRpbmcgYW55Cj4gPiBidXktaW4gZnJvbSB4ODYgLyBwb3dlcnBjIGZv
bGtzLiBVcCB0byB5b3UsIEkgZ3Vlc3MuCj4KPiBXZWxsLCBJIGZ1bGx5IGFncmVlIHdpdGggeW91
ciBzdWdnZXN0aW9uLiBXaGF0IEkgY2FuIHRoaW5rIG9mIGZvciBub3cKPiBpcyB3cmFwcGluZyB0
aGUgbmV3bHkgYWRkZWQgY29udGVudCB3aXRoICNpZiBkZWZpbmVkKENPTkZJR19BUk02NCkgfHwK
PiBkZWZpbmVkKENPTkZJR19SSVNDVikuCgpJ4oCZdmUgYWxzbyB0aG91Z2h0IG9mIGFuIGFsdGVy
bmF0aXZlIGFwcHJvYWNoOiBhZGQgYSBnZW5lcmljCldBVENIRE9HX1BFUkZfQURKVVNUX1BFUklP
RCB0byAvbGliL0tjb25maWcuZGVidWcsIHRoZW4gaGF2ZSB0aGUKS2NvbmZpZyBmaWxlcyBmb3Ig
YXJjaC9hcm02NCBhbmQgcmlzY3Ygc2VsZWN0CldBVENIRE9HX1BFUkZfQURKVVNUX1BFUklPRC4g
V2hhdOKAmXMgeW91ciB0YWtlIG9uIHRoaXM/CgpEbyB5b3UgaGF2ZSBhIG1vcmUgZWxlZ2FudCBh
cHByb2FjaCB0bwo+IHJlY29tbWVuZD8KPgo+ID4KPiA+IE5vdGUgdGhhdCBmb2xrcyBvbiB4ODYg
aGF2ZSBkZWZpbml0ZWx5IGhhZCB0byBkZWFsIHdpdGggdHVyYm8gbW9kZQo+ID4gYmVmb3JlLiAg
U2VlIGNvbW1pdCA3ZWRhZWI2ODQxZGYgKCJrZXJuZWwvd2F0Y2hkb2c6IFByZXZlbnQgZmFsc2UK
PiA+IHBvc2l0aXZlcyB3aXRoIHR1cmJvIG1vZGVzIikuCj4gPgo+ID4gLURvdWcKPiA+Cj4KPiBU
aGFua3MsCj4gWXVuaHVpCgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
