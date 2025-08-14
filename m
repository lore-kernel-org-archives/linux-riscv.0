Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388D9CA0EDC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 18:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LVd+M3eU51JqJSULcIrwNpd/giANkXbI062C7RYf+Y=; b=RB0pT0qaBzs/sc
	urMYGscheJlDl9hVwwdcS51WO0goTo1zsJMuGRSrC/Fd4bteIaZq/a1JMWylG10Zd77Kz4Cc6zFqA
	CBIabbr2G6zhCinylcNhG3r8ob0ytiIb08ItseJhHfcbaI6DEmguEkAFpAP4NZaOX/kJjMvIrB0Wu
	EYcIXDD32INPCKnvzSdcWbXDaXIMNuGUTQcT32TOQ74T8+SdA9NWNFzXXFJ0M4ZmmMW1DqxdEqBlT
	YJFcqnHEZamkVQUI4bRHe5iv1NvxvCmMCycKsf/I2hBwTX/wtPC+It/UIsbr5Ps2CdLrraWYBq/8Q
	JelY3+QjKSNrBgXxovDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umcGn-00000000HHV-0yuE;
	Thu, 14 Aug 2025 18:01:45 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbGC-000000007me-0plf
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 16:57:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45a1b0990b2so7636105e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 09:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1755190622; x=1755795422; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nehsJsbxpmsuOIRfNqAphy85HakrhWnyrgyBK0Nsdg4=;
        b=ZOBaSvk/pcL+xzQlKn8SGq4UgK1VwHPGAO2cS8P8mmolw6KPaqOhCzb9vQeS0m3aOy
         HjT3xKvVjKcG3rJDzBL2YgSSSjvUyrSFa1AEVYYXgiedk/qNCRYYxdT7l/EsyeW1gPG4
         FJEsEIyniWfFoGtZLSBmb+9vPWnTXizUbLc/mcQV3cEthhVMAthWUQElFjYnZBRlogUE
         uh4WBjwfJerjxZkDkumw9l3Dv+t2ZLOkqCVtGUMWOKq2jOPnUwAx6/RgULe67zXcVMfX
         kPwURN9I8/TiDoPbyrtIf7Ru1CPdcq0hudQ4cE8wcPLJDt6xWVogg9Ouyv3gXoOrRz0D
         hjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755190622; x=1755795422;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nehsJsbxpmsuOIRfNqAphy85HakrhWnyrgyBK0Nsdg4=;
        b=DmUZ1CDvXp9ATTnUKhXJ+skC+Bcj6sFd3vXbR7cCjpBED7/swMbH/iZkuCgL2NDGqL
         p8qTXS1G+AdeO02jk5E0Yuvt57SRzEancADeTgo2+gldxOJGtpvzCw6I7bwngy2GyAva
         TbMpbkXM8hgrH6MJOYyXrP4fh1Ra7ZAJ3AKOzf3aeD1uDUoj3+DjT5OwSwqRD04OFYnY
         uCMUM9NI0ZVluexDnZIKOi1QOCTPZZlZGm4VbJAmQ6NdAmH5eS1kl7XrKF2xUrFAuwJJ
         8cpmWi5UJ/mm1Amn878HX9zLm/L4sXKgQpCW3JpSMjRIs64seCl37NUszoP0XiwNXKsW
         WVrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD2ovph+yAmEiOHnVdXpeJjUhM665F9yUclymY4TpW559E4FVa3SNS+mnFo7t+Jf9MHGeFI5FNkgXNUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzG4do4SZNsEok96HZrfW4AFeTABo2dFbrzDxAxgqR5X6eSgyTX
	ZeWASWGt8kT6eIFBamy1S5teWdQRCBEKPEsmJjDTQ3WcJZyTzefNRTi5GqTifeXfp8Y=
X-Gm-Gg: ASbGncsO2xPhiIxJFPXcExUm/RljKOw81dy+kZFvYYaT0NdnxzWlSitAnf5NNsGKKle
	Y8QdZIpMT7+OFdm3VMaSZq+dIlUBAUnwDHchIsljhjl/i3Jk77y6eH04x1xXEG/8te6PK/Sdrdb
	B2zAoDjGk3McJOcAv4p8gplY9NBR8L3yBZjbuEm95yb4tn8BAOgOr0hP3pddi1fSuMi4vkeEcHH
	5vMsvo9VxwvI/CzB8aGy+w9uRV9kGAungVg5r7wqzWbpHjTqzFNBHmOPc/9nOwY3jQ38Q7hbaLN
	G/xr6KUUU/MA9s8HRCA9cczjQJPUsG2+DJPjuFDFFK9cW/tIDiQh7w0BGlW1m/Z2vHTWFkG+j1w
	EsF6DzHBGQs9GMSNyJ2OionGAJwY8wlprBJ8Tl5a54d27a9oijYS4Jlh3OSfsVY54uSo=
X-Google-Smtp-Source: AGHT+IHKMn03UYm2I2J4TPmc1jy6+XybZkm8kaxxP3i30WStDU/ht3x7BfIAILNbbP0EfBkMTPEVjQ==
X-Received: by 2002:a05:600c:3509:b0:458:bd2a:496f with SMTP id 5b1f17b1804b1-45a1b646dc0mr29225375e9.21.1755190622048;
        Thu, 14 Aug 2025 09:57:02 -0700 (PDT)
Received: from smtpclient.apple (global-184-7.n-1.net.cam.ac.uk. [131.111.184.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b789d68sm19043135e9.1.2025.08.14.09.57.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Aug 2025 09:57:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [External] [PATCH] ACPI: RISC-V: CPPC: Add CSR_CYCLE for CPPC FFH
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAK9=C2UDVnpHs04VmzmjjmTYkE--dX2NtoWXGXoX=vVm=SF_5Q@mail.gmail.com>
Date: Thu, 14 Aug 2025 17:56:50 +0100
Cc: yunhui cui <cuiyunhui@bytedance.com>,
 aou@eecs.berkeley.edu,
 juwenlong@bytedance.com,
 alex@ghiti.fr,
 rafael@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org,
 palmer@dabbelt.com,
 paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org,
 Rahul Pathak <rpathak@ventanamicro.com>,
 lenb@kernel.org
Message-Id: <4A3F784D-4844-48D8-AE84-B4D25BCB78B4@jrtc27.com>
References: <20250515094301.40016-1-cuiyunhui@bytedance.com>
 <CAEEQ3w=XqoKmVu1kvc5XUbGbQJsHVkRx=T65tXvYEYo0HCTcnQ@mail.gmail.com>
 <aJs-aPH32OxpzR3G@sunil-laptop>
 <CAEEQ3wnHFPBPC0U59rDBJaZYxJ24uJzJ7NDQO0gfmVqoiQwNOw@mail.gmail.com>
 <aJtKZhvNX0p3obFw@sunil-laptop>
 <CAEEQ3wmomscuAzuiRyJu4ha8tiM=s1Y-ytQROPTWr1DScMNL3g@mail.gmail.com>
 <aJwiXKWXik8BmpL8@sunil-laptop>
 <CAEEQ3wky3LXK=ge1wBkHD0ZWtwUF-aBn44EK0Uxa+_2DB1Giqw@mail.gmail.com>
 <CAK9=C2VOaAJZxCeM-5QPj5B-ie68LivJyQcM8KwKjdL9u00RJg@mail.gmail.com>
 <CAEEQ3wmDygvLn-EK_hCumOuCkPjKWfnmwiA+kz4p9N=thG0pXA@mail.gmail.com>
 <CAK9=C2X+6vs=Xa7XnreRs4+e5OjeJA-XtwwUM4GHq7pT=Fs-5A@mail.gmail.com>
 <CAEEQ3wm9shktdzUeO5RczE-=qdDUS30TGASOFtnMEcuw7L7jZw@mail.gmail.com>
 <CAK9=C2UDVnpHs04VmzmjjmTYkE--dX2NtoWXGXoX=vVm=SF_5Q@mail.gmail.com>
To: Anup Patel <apatel@ventanamicro.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_095704_250611_2A54032C 
X-CRM114-Status: GOOD (  35.98  )
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

T24gMTQgQXVnIDIwMjUsIGF0IDE0OjM3LCBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3Jv
LmNvbT4gd3JvdGU6Cj4gCj4gT24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgMTE6NDnigK9BTSB5dW5o
dWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4+IAo+PiBIaSBBbnVwLAo+
PiAKPj4gT24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgMTo0OOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRl
bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4+IAo+Pj4gT24gVGh1LCBBdWcgMTQsIDIwMjUg
YXQgOTowOOKAr0FNIHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToK
Pj4+PiAKPj4+PiBIaSBBbnVwLAo+Pj4+IAo+Pj4+IE9uIFdlZCwgQXVnIDEzLCAyMDI1IGF0IDc6
MTLigK9QTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+Pj4+
IAo+Pj4+PiBPbiBXZWQsIEF1ZyAxMywgMjAyNSBhdCAxMjoxNOKAr1BNIHl1bmh1aSBjdWkgPGN1
aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPj4+Pj4+IAo+Pj4+Pj4gSGkgU3VuaWwsCj4+
Pj4+PiAKPj4+Pj4+IE9uIFdlZCwgQXVnIDEzLCAyMDI1IGF0IDE6MjjigK9QTSBTdW5pbCBWIEwg
PHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+Pj4+Pj4gCj4+Pj4+Pj4gSGkgWXVu
aHVpLAo+Pj4+Pj4+IAo+Pj4+Pj4+IE9uIFdlZCwgQXVnIDEzLCAyMDI1IGF0IDExOjIzOjM5QU0g
KzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4+Pj4+Pj4+IEhpIFN1bmlsLAo+Pj4+Pj4+PiAKPj4+
Pj4+Pj4gT24gVHVlLCBBdWcgMTIsIDIwMjUgYXQgMTA6MDbigK9QTSBTdW5pbCBWIEwgPHN1bmls
dmxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+Pj4+Pj4+PiAKPj4+Pj4+PiBbLi4uXQo+Pj4+
Pj4+Pj4+Pj4gCj4+Pj4+Pj4+Pj4+PiBUaGUgcHVycG9zZSBvZiBjcHBjX2ZmaF9jc3JfcmVhZCgp
IGlzIHRvIGNhbGN1bGF0ZSB0aGUgYWN0dWFsCj4+Pj4+Pj4+Pj4+PiBmcmVxdWVuY3kgb2YgdGhl
IENQVSwgd2hpY2ggaXMgZGVsdGFfQ1NSX0NZQ0xFL2RlbHRhX0NTUl9YWFguCj4+Pj4+Pj4+Pj4+
PiAKPj4+Pj4+Pj4+Pj4+IENTUl9YWFggc2hvdWxkIGJlIGEgcmVmZXJlbmNlIGNsb2NrIGFuZCBk
b2VzIG5vdCBjb3VudCBkdXJpbmcgV0ZJCj4+Pj4+Pj4+Pj4+PiAoV2FpdCBGb3IgSW50ZXJydXB0
KS4KPj4+Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+Pj4gU2ltaWxhciBzb2x1dGlvbnMgaW5jbHVkZTog
eDg2J3MgYXBlcmYvbXBlcmYsIGFuZCBBUk02NCdzIEFNVSB3aXRoCj4+Pj4+Pj4+Pj4+PiByZWdp
c3RlcnMgU1lTX0FNRVZDTlRSMF9DT1JFX0VMMC9TWVNfQU1FVkNOVFIwX0NPTlNUX0VMMC4KPj4+
Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+Pj4gSG93ZXZlciwgd2Uga25vdyB0aGF0IENTUl9USU1FIGlu
IHRoZSBjdXJyZW50IGNvZGUgZG9lcyBjb3VudCBkdXJpbmcKPj4+Pj4+Pj4+Pj4+IFdGSS4gU28s
IGlzIHRoaXMgZGVzaWduIHVucmVhc29uYWJsZT8KPj4+Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+Pj4g
U2hvdWxkIHdlIGNvbnNpZGVyIHByb3Bvc2luZyBhbiBleHRlbnNpb24gdG8gc3VwcG9ydCBzdWNo
IGEgZGVkaWNhdGVkCj4+Pj4+Pj4+Pj4+PiBjb3VudGVyIChhIHJlZmVyZW5jZSBjbG9jayB0aGF0
IGRvZXMgbm90IGNvdW50IGR1cmluZyBXRkkpPyBUaGlzIHdheSwKPj4+Pj4+Pj4+Pj4+IHRoZSB2
YWx1ZSBjYW4gYmUgb2J0YWluZWQgZGlyZWN0bHkgaW4gUy1tb2RlIHdpdGhvdXQgdHJhcHBpbmcg
dG8KPj4+Pj4+Pj4+Pj4+IE0tbW9kZSwgZXNwZWNpYWxseSBzaW5jZSByZWFkaW5nIHRoaXMgY291
bnRlciBpcyB2ZXJ5IGZyZXF1ZW50Lgo+Pj4+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+Pj4+IEhpIFl1bmh1
aSwKPj4+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+Pj4+IFllcywgYnV0IHdlIGFudGljaXBhdGVkIHRoYXQg
dmVuZG9ycyBtaWdodCBkZWZpbmUgdGhlaXIgb3duIGN1c3RvbSBDU1JzLgo+Pj4+Pj4+Pj4+PiBT
bywgd2UgaW50cm9kdWNlZCBGRkggZW5jb2RpbmcgdG8gYWNjb21tb2RhdGUgc3VjaCBjYXNlcy4K
Pj4+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+Pj4+IFRoYW5rcywKPj4+Pj4+Pj4+Pj4gU3VuaWwKPj4+Pj4+
Pj4+PiAKPj4+Pj4+Pj4+PiBBcyBtZW50aW9uZWQgZWFybGllciwgaXQgaXMgYmVzdCB0byBkaXJl
Y3RseSByZWFkIENTUl9YWFggKGEgcmVmZXJlbmNlCj4+Pj4+Pj4+Pj4gY2xvY2sgdGhhdCBkb2Vz
IG5vdCBjb3VudCBkdXJpbmcgV0ZJKSBhbmQgQ1NSX0NZQ0xFIGluIFMtbW9kZSwgcmF0aGVyCj4+
Pj4+Pj4+Pj4gdGhhbiB0cmFwcGluZyB0byBTQkkuCj4+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+PiBOby4g
SSBtZWFudCBkaXJlY3QgQ1NSIGFjY2VzcyBpdHNlbGYgbm90IFNCSS4gUGxlYXNlIHRha2UgYSBs
b29rIGF0Cj4+Pj4+Pj4+PiBUYWJsZSA2IG9mIFJJU0MtViBGRkggc3BlYy4KPj4+Pj4+Pj4+IAo+
Pj4+Pj4+Pj4+IGRyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMgaXMgYSBnZW5lcmljIGRyaXZlciB0
aGF0IGlzIG5vdCBzcGVjaWZpYyB0bwo+Pj4+Pj4+Pj4+IGFueSB2ZW5kb3IuIEN1cnJlbnRseSwg
dGhlIHVwc3RyZWFtIGNvZGUgYWxyZWFkeSB1c2VzIENTUl9USU1FLCBhbmQKPj4+Pj4+Pj4+PiB0
aGUgbG9naWMgb2YgQ1NSX1RJTUUgaXMgaW5jb3JyZWN0Lgo+Pj4+Pj4+Pj4+IAo+Pj4+Pj4+IEFD
UEkgc3BlYyBmb3IgIlJlZmVyZW5jZSBQZXJmb3JtYW5jZSBSZWdpc3RlciIgc2F5cywKPj4+Pj4+
PiAKPj4+Pj4+PiAiVGhlIFJlZmVyZW5jZSBQZXJmb3JtYW5jZSBDb3VudGVyIFJlZ2lzdGVyIGNv
dW50cyBhdCBhIGZpeGVkIHJhdGUgYW55Cj4+Pj4+Pj4gdGltZSB0aGUgcHJvY2Vzc29yIGlzIGFj
dGl2ZS4gSXQgaXMgbm90IGFmZmVjdGVkIGJ5IGNoYW5nZXMgdG8gRGVzaXJlZAo+Pj4+Pj4+IFBl
cmZvcm1hbmNlLCBwcm9jZXNzb3IgdGhyb3R0bGluZywgZXRjLiIKPj4+Pj4+PiAKPj4+Pj4+Pj4+
IENTUl9USU1FIGlzIGp1c3QgYW4gZXhhbXBsZS4gSXQgaXMgdXB0byB0aGUgdmVuZG9yIGhvdyBf
Q1BDIG9iamVjdHMgYXJlCj4+Pj4+Pj4+PiBlbmNvZGVkIHVzaW5nIEZGSC4gVGhlIGxpbnV4IGNv
ZGUgZG9lc24ndCBtZWFuIG9uZSBzaG91bGQgdXNlIENTUl9USU1FCj4+Pj4+Pj4+PiBhbHdheXMu
Cj4+Pj4+Pj4+IAo+Pj4+Pj4+PiBGaXJzdCwgdGhlIGV4YW1wbGUgb2YgQ1NSX1RJTUUgaXMgaW5j
b3JyZWN0LiBXaGF0IGlzIG5lZWRlZCBpcyBhCj4+Pj4+Pj4+IENTUl9YWFggKGEgcmVmZXJlbmNl
IGNsb2NrIHRoYXQgZG9lcyBub3QgY291bnQgZHVyaW5nIFdGSSkuCj4+Pj4+Pj4+IAo+Pj4+Pj4+
PiBTZWNvbmQsIHlvdSBtZW50aW9uZWQgdGhhdCBlYWNoIHZlbmRvciBjYW4gY3VzdG9taXplIHRo
ZWlyIG93bgo+Pj4+Pj4+PiBpbXBsZW1lbnRhdGlvbnMuIEJ1dCBzaG91bGQgYWxsIHZlbmRvcnMn
IENTUl9YWFgvWVlZLy4uLiBiZSBhZGRlZCB0bwo+Pj4+Pj4+PiBkcml2ZXJzL2FjcGkvcmlzY3Yv
Y3BwYy5jPyBTaG91bGRu4oCZdCBkcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jIGZhbGwKPj4+Pj4+
Pj4gdW5kZXIgdGhlIHNjb3BlIGRlZmluZWQgYnkgdGhlIFJJU0MtViBhcmNoaXRlY3R1cmU/Cj4+
Pj4+Pj4+IAo+Pj4+Pj4+IE5vLiBPbmUgY2FuIGltcGxlbWVudCBzaW1pbGFyIHRvIGNzcl9yZWFk
X251bSgpIGluIG9wZW5zYmkuIFdlIGRpZG4ndAo+Pj4+Pj4+IGFkZCBpdCBzaW5jZSB0aGVyZSB3
YXMgbm8gSFcgaW1wbGVtZW50aW5nIHN1Y2ggdGhpbmcuIFdoYXQgSSBhbQo+Pj4+Pj4+IHNheWlu
ZyBpcyB3ZSBoYXZlIEZGSCBlbmNvZGluZyB0byBzdXBwb3J0IHN1Y2ggY2FzZS4KPj4+Pj4+PiAK
Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+IEl0IHdvdWxkIGJlIGJlc3QgdG8gcHJvbW90ZSBhIHNwZWNp
ZmljYXRpb24gdG8gc3VwcG9ydCBDU1JfWFhYLCBqdXN0Cj4+Pj4+Pj4+Pj4gbGlrZSB3aGF0IGhh
cyBiZWVuIGRvbmUgZm9yIHg4NiBhbmQgYXJtNjQuIFdoYXQgZG8geW91IHRoaW5rPwo+Pj4+Pj4+
Pj4+IAo+Pj4+Pj4+Pj4gV291bGRuJ3QgYWJvdmUgd29yaz8gRm9yIGEgc3RhbmRhcmQgZXh0ZW5z
aW9uLCB5b3UgbWF5IGhhdmUgdG8gcHJvdmlkZQo+Pj4+Pj4+Pj4gbW9yZSBkYXRhIHdpdGggYWN0
dWFsIEhXLgo+Pj4+Pj4+PiAKPj4+Pj4+Pj4gVGhpcyB3b27igJl0IHdvcmsuIE1heSBJIGFzayBo
b3cgdGhlIGN1cnJlbnQgdXBzdHJlYW0gY29kZSBjYW4gY2FsY3VsYXRlCj4+Pj4+Pj4+IHRoZSBh
Y3R1YWwgQ1BVIGZyZXF1ZW5jeSB1c2luZyBDU1JfVElNRSB3aXRob3V0IHRyYXBwaW5nIHRvIFNC
ST8KPj4+Pj4+Pj4gVGhpcyBpcyBhIHRoZW9yZXRpY2FsIGxvZ2ljYWwgaXNzdWUuIFdoeSBpcyBk
YXRhIG5lZWRlZCBoZXJlPwo+Pj4+Pj4+PiAKPj4+Pj4+PiBBcyBJIG1lbnRpb25lZCBhYm92ZSwg
b25lIGNhbiBpbXBsZW1lbnQgYSBnZW5lcmljIENTUiByZWFkIHdpdGhvdXQKPj4+Pj4+PiB0cmFw
cGluZyB0byBTQkkuCj4+Pj4+Pj4gCj4+Pj4+Pj4+IENvdWxkIHlvdSB0YWtlIGEgbG9vayBhdCB0
aGUgIkFNVSBldmVudHMgYW5kIGV2ZW50IG51bWJlcnMiIGNoYXB0ZXIgaW4KPj4+Pj4+Pj4gdGhl
IEFSTTY0IG1hbnVhbD8KPj4+Pj4+Pj4gCj4+Pj4+Pj4gQXMtcGVyIEFDUEkgc3BlYyByZWZlcmVu
Y2UgcGVyZm9ybWFuY2UgY291bnRlciBpcyBub3QgYWZmZWN0ZWQgYnkgQ1BVCj4+Pj4+Pj4gc3Rh
dGUuIFRoZSBSSVNDLVYgRkZIIGVuY29kaW5nIGlzIHN1ZmZpY2llbnRseSBnZW5lcmljIHRvIHN1
cHBvcnQgdGhpcwo+Pj4+Pj4+IHJlcXVpcmVtZW50LCBldmVuIGlmIHRoZSBzdGFuZGFyZCBDU1Jf
VElNRSBjYW5ub3QgYmUgdXNlZC4gSW4gc3VjaAo+Pj4+Pj4+IGNhc2VzLCBhbiBhbHRlcm5hdGl2
ZSBDU1IgY2FuIGJlIGVuY29kZWRlZCwgYWNjZXNzZWQgdmlhIGFuIE9TLWxldmVsCj4+Pj4+Pj4g
YWJzdHJhY3Rpb24gc3VjaCBhcyBjc3JfcmVhZF9udW0oKS4KPj4+Pj4+IAo+Pj4+Pj4gU28gd2hh
dCB5b3UncmUgc2F5aW5nIGlzIHRoYXQgd2Ugc2hvdWxkIHN1Ym1pdCBhIHBhdGNoIGxpa2UgdGhp
cywgcmlnaHQ/Cj4+Pj4+PiAKPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvcmlzY3Yv
Y3BwYy5jIGIvZHJpdmVycy9hY3BpL3Jpc2N2L2NwcGMuYwo+Pj4+Pj4gaW5kZXggNDQwY2Y5ZmI5
MWFhYi4uOTUzYzI1OWQ0NmM2OSAxMDA2NDQKPj4+Pj4+IC0tLSBhL2RyaXZlcnMvYWNwaS9yaXNj
di9jcHBjLmMKPj4+Pj4+ICsrKyBiL2RyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMKPj4+Pj4+IEBA
IC02NiwxNiArNjYsOCBAQCBzdGF0aWMgdm9pZCBjcHBjX2ZmaF9jc3JfcmVhZCh2b2lkICpyZWFk
X2RhdGEpCj4+Pj4+PiB7Cj4+Pj4+PiAgICAgICAgc3RydWN0IHNiaV9jcHBjX2RhdGEgKmRhdGEg
PSAoc3RydWN0IHNiaV9jcHBjX2RhdGEgKilyZWFkX2RhdGE7Cj4+Pj4+PiAKPj4+Pj4+IC0gICAg
ICAgc3dpdGNoIChkYXRhLT5yZWcpIHsKPj4+Pj4+IC0gICAgICAgLyogU3VwcG9ydCBvbmx5IFRJ
TUUgQ1NSIGZvciBub3cgKi8KPj4+Pj4+IC0gICAgICAgY2FzZSBDU1JfVElNRToKPj4+Pj4+IC0g
ICAgICAgICAgICAgICBkYXRhLT5yZXQudmFsdWUgPSBjc3JfcmVhZChDU1JfVElNRSk7Cj4+Pj4+
PiAtICAgICAgICAgICAgICAgZGF0YS0+cmV0LmVycm9yID0gMDsKPj4+Pj4+IC0gICAgICAgICAg
ICAgICBicmVhazsKPj4+Pj4+IC0gICAgICAgZGVmYXVsdDoKPj4+Pj4+IC0gICAgICAgICAgICAg
ICBkYXRhLT5yZXQuZXJyb3IgPSAtRUlOVkFMOwo+Pj4+Pj4gLSAgICAgICAgICAgICAgIGJyZWFr
Owo+Pj4+Pj4gLSAgICAgICB9Cj4+Pj4+PiArICAgICAgIGRhdGEtPnJldC52YWx1ZSA9IGNzcl9y
ZWFkX251bShkYXRhLT5yZWcpOwo+Pj4+Pj4gKyAgICAgICBkYXRhLT5yZXQuZXJyb3IgPSAwOwo+
Pj4+Pj4gfQo+Pj4+Pj4gCj4+Pj4+PiBJZiB0aGF0J3MgdGhlIGNhc2UsIHRoZSByb2J1c3RuZXNz
IG9mIHRoZSBjb2RlIGNhbm5vdCBiZSBndWFyYW50ZWVkLAo+Pj4+Pj4gYmVjYXVzZSB0aGUgcmFu
Z2Ugb2YgQ1NScyBmcm9tIGRpZmZlcmVudCB2ZW5kb3JzIGlzIHVua25vd24uCj4+Pj4+IAo+Pj4+
PiBBQ1BJIEZGSCBpcyBhbGxvd3MgbWFwcGluZyB0byBhbnkgQ1NSLgo+Pj4+IAo+Pj4+IFllcywg
RkZIIGNhbiBtYXAgYW55IENTUiwgYW5kIHRoaXMgaXMgbm90IHRoZSBwb2ludCBvZiBjb250ZW50
aW9uLgo+Pj4+IAo+Pj4+IElmIHRoYXQncyB0aGUgY2FzZSwgdGhlIENTUl9USU1FIHVzZWQgaW4g
dGhlIGN1cnJlbnQga2VybmVsIGNvZGUgaXMKPj4+PiBpbmFwcHJvcHJpYXRlLiBTb21lIHZlbmRv
cnMgbWF5IGRlc2lnbiBhIGNvdW50ZXIgdGhhdCBkb2VzIG5vdCBjb3VudAo+Pj4+IGR1cmluZyBX
RkksIG1ha2luZyBDU1JfVElNRSBpcnJlbGV2YW50LiBFdmVuIGlmIGNvdW50aW5nIGNvbnRpbnVl
cwo+Pj4+IGR1cmluZyBXRkksIGFyZSB5b3UgcGxhbm5pbmcgdG8gaGF2ZSBvbmUgY291bnRlciBv
cGVyYXRlIGluIFMtbW9kZQo+Pj4+IHdoaWxlIHRoZSBvdGhlciB0cmFwcyB0byBNLW1vZGU/Cj4+
Pj4gCj4+Pj4gSW4gdGhhdCBjYXNlLCB0aGUgY29kZSB3b3VsZCBuZWVkIHRvIGJlIG1vZGlmaWVk
IGFzIHByb3Bvc2VkIGFib3ZlLiBEbwo+Pj4+IHlvdSBhZ3JlZT8KPj4+IAo+Pj4gSSBkaXNhZ3Jl
ZS4KPj4+IAo+Pj4gTGlrZSBTdW5pbCBhbHJlYWR5IGV4cGxhaW5lZCwgaWYgYW4gaW1wbGVtZW50
YXRpb24gaGFzIHJlZmVyZW5jZSBjb3VudGVyCj4+PiB3aGljaCBkb2VzIG5vdCBjb3VudCBkdXJp
bmcgV0ZJIHN0YXRlIHRoZW4gZm9yIHN1Y2ggaW1wbGVtZW50YXRpb24gdGhlCj4+PiBkZWxpdmVy
ZWQgcGVyZm9ybWFuY2UgY291bnRlciBzaG91bGQgYWxzbyBub3QgaW5jcmVtZW50IGR1cmluZyBX
RkkKPj4+IHRvIG1haW50YWluIHRoZSByZWxhdGl2ZSBkZWx0YSBvZiBpbmNyZW1lbnRzLiBUaGlz
IG1lYW5zIGlmIGFuIGltcGxlbWVudGF0aW9uCj4+PiB1c2VzIFRJTUUgQ1NSIGFzIHJlZmVyZW5j
ZSBjb3VudGVyIHRoZW4gZm9yIHN1Y2ggaW1wbGVtZW50YXRpb24KPj4+IHRoZSBkZWxpdmVyZWQg
cGVyZm9ybWFuY2UgY291bnRlciBzaG91bGQgaW5jcmVtZW50IGFjY29yZGluZ2x5LiBVbHRpbWF0
ZWx5LAo+Pj4gd2hhdCBtYXR0ZXJzIGlzIE9TIGJlaW5nIGFibGUgdG8gY29ycmVjdGx5IGNvbXB1
dGUgdGhlIHBlcmZvcm1hbmNlIGxldmVsCj4+PiB1c2luZyByZWZlcmVuY2UgYW5kIGRlbGl2ZXJl
ZCBwZXJmb3JtYW5jZSBjb3VudGVycy4KPj4gCj4+IAo+PiBGb3IgY2FsY3VsYXRpbmcgdGhlIGFj
dHVhbCBDUFUgZnJlcXVlbmN5LCBib3RoIGltcGxlbWVudGF0aW9ucyBhcmUKPj4gYWNjZXB0YWJs
ZSB3aGVyZSBlaXRoZXIgYm90aCBjb3VudGVycyBjb250aW51ZSBjb3VudGluZyBkdXJpbmcgV0ZJ
IG9yCj4+IGJvdGggc3RvcCBjb3VudGluZy4KPj4gSW4gdGhlIGN1cnJlbnQgY29kZSwgaG93IGRv
IHlvdSByZWFkIHRoZSBvdGhlciBjb3VudGVyPwo+PiBTaG91bGRuJ3QgaXQgYmUgbW9kaWZpZWQg
bGlrZSB0aGlzIHRvIHN1cHBvcnQgaXQ/IFRoaXMgd2F5LCBhbGwKPj4gY291bnRlcnMgY2FuIGJl
IHJlYWQgZGlyZWN0bHkgaW4gUy1tb2RlIHdpdGhvdXQgdHJhcHBpbmcgdG8gTS1tb2RlOgo+PiAr
ICAgICAgIGRhdGEtPnJldC52YWx1ZSA9IGNzcl9yZWFkX251bShkYXRhLT5yZWcpOwo+PiArICAg
ICAgIGRhdGEtPnJldC5lcnJvciA9IDA7Cj4gCj4gWWVzLCB0aGUgY3VycmVudCBzd2l0Y2gtY2Fz
ZSBuZWVkcyB0byByZXBsYWNlZCBieSBjb21tb24KPiBjc3JfcmVhZF9udW0oKSBhbmQgY3NyX3dy
aXRlX251bSgpIGltcGxlbWVudGVkIGluIGFyY2gvcmlzY3YvCj4gCj4gVGhlIFJJU0MtViBDU1Ig
c3BhY2UgaXMgbGltaXRlZCBzbyB3aXRoIGl0IGlzIHN0cmFpZ2h0Zm9yd2FyZAo+IHRvIGltcGxl
bWVudCBjc3JfcmVhZF9udW0oKSBhbmQgY3NyX3dyaXRlX251bSgpIHVzaW5nCj4gbWFjcm9zIHdo
ZXJlIGVhY2ggQ1NSIGFjY2VzcyB3aWxsIHR1cm4tb3V0IHRvIGJlIHJvdWdobHkKPiAzLTQgaW5z
dHJ1Y3Rpb25zLgoKMTIgYml0cywgb3IgNDA5NiBDU1JzLiBBcmUgeW91IHNheWluZyB5b3Ugd2Fu
dCB0byBoYXZlIGEganVtcCB0YWJsZQp0aGF0IGRpc3BhdGNoZXMgdG8gb25lIG9mIDQwOTYgZW50
cnkgcG9pbnRzPwoKTWF5YmUgeW91IGNhbiBjdXQgdGhhdCBkb3duIGEgYml0IGZvciBTLW1vZGUg
YmFzZWQgb24gdGhlIGVuY29kaW5nCmNvbnZlbnRpb24sIGJ1dCB0aGF0IG9ubHkgZWxpbWluYXRl
cyAxLzQsIHNvIHlvdeKAmXJlIHN0aWxsIGxvb2tpbmcgYXQKMzA3MiBlbnRyeSBwb2ludHMsIHBl
cmhhcHMgYWxzbyBtaW51cyB0aGUgZmV3IHRoYXQgYXJlIGFsbG9jYXRlZCBhbmQKY2xlYXJseSBu
b3Qgc2Vuc2libGUgdGhpbmdzIHRvIHVzZSBmb3IgdGhpcywgbGlrZSBzdHZhbC4KCkJ1dCBJIHRo
aW5rIHRoYXTigJlzIG5vdCBhIHJlYXNvbmFibGUgYXBwcm9hY2ggdG8gdGFrZSwgYW5kIGlmIHRo
ZXJlIGlzCm5vIENTUiBpbiB0aGUgY3VycmVudCBSSVNDLVYgc3BlYyB0aGF0IGZpdHMgdGhlIG5l
ZWRzIG9mIEFDUEkgdGhlbiBvbmUKbmVlZHMgdG8gYmUgZGVmaW5lZCBzbyB0aGF0IHdlIGRvbuKA
mXQgbmVlZCBldmVyeSB2ZW5kb3IgdG8gaW52ZW50IHRoZWlyCm93bi4gSWYgdGhlcmUgaXMgYSBD
U1IgYWxyZWFkeSB0aGVuIHRoYXQgc2hvdWxkIGJlIHRoZSBvbmx5IG9uZSB0aGF04oCZcwphbGxv
d2VkIHRvIGJlIHVzZWQgaGVyZS4gSWYgeW91IGxvb2sgYXQgYXJtNjQsIGl0IGhhcmQtY29kZXMg
d2hpY2gKY291bnRlciB0byB1c2UgZm9yIGVhY2ggb2YgdGhlIHR3byBjYWxscyBpdCBzdXBwb3J0
cy4gVGhhdOKAmXMgYSBtdWNoCmJldHRlciB3b3JsZCB0byBiZSBpbi4KCkplc3NpY2EKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
