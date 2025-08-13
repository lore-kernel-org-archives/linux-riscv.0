Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626EECA0EC4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 07:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvhrfCJOSBRUdtVyWisbc0sKDDgTZai8DWhdHhoEqmI=; b=UbqIAx17Ucw/HA
	8t0U85BSKWltW81kGmmObzlry2POqANWcFklRu98MRYzKoQlBFbFlDforUqGdICUUdG/dmjXJz2Sz
	994HQdb5rs5KpNRvzzs5aod4nrjrH398oGyiv1JWAZCVW48OBUfU/dbh2lw9BgGBQIbuJiwOH+LJo
	1bHb0ibdPT+nbJn+wfCMQKgKTX34HZmh3MrcltCS3/tty4eKZRS8dYmuv3ksfmzXhKADDWA67qQC2
	Ge2BYoGtoH0mYRC1Q21IDfkAFihYxReJvH9BnRj4huxwM0JYf3GQff9NSR0JuG9tEjlkqHL2TgeyR
	R7VJnB7mNneDQa5T1Tvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um63v-0000000CwyQ-2SUQ;
	Wed, 13 Aug 2025 07:38:19 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um5DW-0000000CpA6-0pPT
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 06:44:11 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-742f798bb20so4391872a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 23:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1755067449; x=1755672249; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kN4SWWkhP+H9aW8tQSuXufONqI8/WS93SoimYt/qVpo=;
        b=ftifBWHIvrnU9AZ7uB6aK6h7yDHdUakqxUoIRFpko5BnuyStM6VTYuUFV4wOVYdqaU
         nJsbXbJLDJTbvdcR9t8uQdHNLoegjyjl25fYc/iAa6S7FNAUwo7C6C0FXpBVAofBJx2P
         HPb9ogrxfgrnXtWyCE8HZTn1U9fVYoMm1iuRKQqY1R76HXe8XbFn+itBWquAkViYTdpg
         Csv495qUVaIejxHD+z4vu3xWVC+w3WAe+Qq59sF4JewEbBeskdx4z+a15NU6PoOgfkZh
         GU/6czBcUmGJ8cv3LThupXk+X+tKULd0NPcMapqtxE/wK8tF2Ii4qSfe8iLZCBi1YBIc
         HVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755067449; x=1755672249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kN4SWWkhP+H9aW8tQSuXufONqI8/WS93SoimYt/qVpo=;
        b=xTZiQMp2waYLcc9I/W39CQttQ6uftb8mkim0DLGurVeh3qOOOwagEIVF7M/leBZUS0
         eegb6NTGR1PQWvJ52d6FxqmbaiDQpOQaVyVMy4gv1qA12vejvjEdOmf00upDyp6uEKaB
         oXPucPWVfFG5liyLyx3F1kXQ2iJvFXNjGqyHsQid+eyHilXbMcT+5jr0DAI10kCm39IG
         RhUScXQxZkEuYQ73rDmE0nRlQTtJv0w7EycNCi6GrCQUcMPaIpSJMY3p57pFXXjefcNY
         AiGwREpO4yr0b1+yOUARbmJyg97wjAWlTnd9IpKWeuhxPI0p3Zgta9ETtwe+FGFZH5k1
         fQDA==
X-Forwarded-Encrypted: i=1; AJvYcCWW4F6wJ7l4c3Sxbq58IN3FbTkVweH2tD2xcq6quDGGoLBXoxGDMoIB80azne2+X0r8pwbVAPTleeqAYw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+dR10I1XCIlufjHFACgJdKrY/Sx6ZjxyRxyaeZjfMoZbXqHzo
	5cpb/V88LcEV9PVfybSLkj+D0ja9HcdFxZ+N2vLbCQKm/lnsJz9RICyBZ9NAk9gzxC90pWS/pEB
	f0pkQYkFkSOFZJlOHY+MeukqWFtIQVYmqn87PaIr7sA==
X-Gm-Gg: ASbGnct3CdNSt/3tXgm9LScsD7AhxBqBdT0zyxKYicpOYsvqWdHJCJxh6CG+x5MBwL9
	4x2PPSP2WM30W01bjrUZ7he7+faEcheL/B2KIgU0GbVLfmjetzgR6xW4wuHMg7aggGm1gOsARMF
	El10SrjLu3t0OwCh5Lr0I/PM3knVE3k1JIqOu7dPJhxbgLi0KzLio3Z9Z353YNJRTlm1QUZ5sYZ
	5fKukjTa3JyXPu597ece21j
X-Google-Smtp-Source: AGHT+IE1kH655r3yAN3e42gjKNXI3YeADBZSD3EwRPhXTz20ecAS64Pguy13srIYgyLsWKp0VZhzjHp56BATXuR+FCg=
X-Received: by 2002:a05:6808:1818:b0:434:3f2:4d05 with SMTP id
 5614622812f47-435d4211298mr1290082b6e.20.1755067449027; Tue, 12 Aug 2025
 23:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250515094301.40016-1-cuiyunhui@bytedance.com>
 <CAEEQ3w=XqoKmVu1kvc5XUbGbQJsHVkRx=T65tXvYEYo0HCTcnQ@mail.gmail.com>
 <aJs-aPH32OxpzR3G@sunil-laptop> <CAEEQ3wnHFPBPC0U59rDBJaZYxJ24uJzJ7NDQO0gfmVqoiQwNOw@mail.gmail.com>
 <aJtKZhvNX0p3obFw@sunil-laptop> <CAEEQ3wmomscuAzuiRyJu4ha8tiM=s1Y-ytQROPTWr1DScMNL3g@mail.gmail.com>
 <aJwiXKWXik8BmpL8@sunil-laptop>
In-Reply-To: <aJwiXKWXik8BmpL8@sunil-laptop>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 13 Aug 2025 14:43:58 +0800
X-Gm-Features: Ac12FXyGVnizD6EyhuBpve20mgaqlAC7Lqkjh6Jm18br-KgPX42SL0ncGyqGwNM
Message-ID: <CAEEQ3wky3LXK=ge1wBkHD0ZWtwUF-aBn44EK0Uxa+_2DB1Giqw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] ACPI: RISC-V: CPPC: Add CSR_CYCLE for CPPC FFH
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: rafael@kernel.org, lenb@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, juwenlong@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_234410_240114_891A78A3 
X-CRM114-Status: GOOD (  38.33  )
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

SGkgU3VuaWwsCgpPbiBXZWQsIEF1ZyAxMywgMjAyNSBhdCAxOjI44oCvUE0gU3VuaWwgViBMIDxz
dW5pbHZsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gSGkgWXVuaHVpLAo+Cj4gT24gV2Vk
LCBBdWcgMTMsIDIwMjUgYXQgMTE6MjM6MzlBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90ZToKPiA+
IEhpIFN1bmlsLAo+ID4KPiA+IE9uIFR1ZSwgQXVnIDEyLCAyMDI1IGF0IDEwOjA24oCvUE0gU3Vu
aWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4gPgo+IFsuLi5dCj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoZSBwdXJwb3NlIG9mIGNwcGNfZmZoX2Nzcl9yZWFkKCkg
aXMgdG8gY2FsY3VsYXRlIHRoZSBhY3R1YWwKPiA+ID4gPiA+ID4gZnJlcXVlbmN5IG9mIHRoZSBD
UFUsIHdoaWNoIGlzIGRlbHRhX0NTUl9DWUNMRS9kZWx0YV9DU1JfWFhYLgo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiBDU1JfWFhYIHNob3VsZCBiZSBhIHJlZmVyZW5jZSBjbG9jayBhbmQgZG9lcyBu
b3QgY291bnQgZHVyaW5nIFdGSQo+ID4gPiA+ID4gPiAoV2FpdCBGb3IgSW50ZXJydXB0KS4KPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gU2ltaWxhciBzb2x1dGlvbnMgaW5jbHVkZTogeDg2J3MgYXBl
cmYvbXBlcmYsIGFuZCBBUk02NCdzIEFNVSB3aXRoCj4gPiA+ID4gPiA+IHJlZ2lzdGVycyBTWVNf
QU1FVkNOVFIwX0NPUkVfRUwwL1NZU19BTUVWQ05UUjBfQ09OU1RfRUwwLgo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiBIb3dldmVyLCB3ZSBrbm93IHRoYXQgQ1NSX1RJTUUgaW4gdGhlIGN1cnJlbnQg
Y29kZSBkb2VzIGNvdW50IGR1cmluZwo+ID4gPiA+ID4gPiBXRkkuIFNvLCBpcyB0aGlzIGRlc2ln
biB1bnJlYXNvbmFibGU/Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFNob3VsZCB3ZSBjb25zaWRl
ciBwcm9wb3NpbmcgYW4gZXh0ZW5zaW9uIHRvIHN1cHBvcnQgc3VjaCBhIGRlZGljYXRlZAo+ID4g
PiA+ID4gPiBjb3VudGVyIChhIHJlZmVyZW5jZSBjbG9jayB0aGF0IGRvZXMgbm90IGNvdW50IGR1
cmluZyBXRkkpPyBUaGlzIHdheSwKPiA+ID4gPiA+ID4gdGhlIHZhbHVlIGNhbiBiZSBvYnRhaW5l
ZCBkaXJlY3RseSBpbiBTLW1vZGUgd2l0aG91dCB0cmFwcGluZyB0bwo+ID4gPiA+ID4gPiBNLW1v
ZGUsIGVzcGVjaWFsbHkgc2luY2UgcmVhZGluZyB0aGlzIGNvdW50ZXIgaXMgdmVyeSBmcmVxdWVu
dC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+IEhpIFl1bmh1aSwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBZ
ZXMsIGJ1dCB3ZSBhbnRpY2lwYXRlZCB0aGF0IHZlbmRvcnMgbWlnaHQgZGVmaW5lIHRoZWlyIG93
biBjdXN0b20gQ1NScy4KPiA+ID4gPiA+IFNvLCB3ZSBpbnRyb2R1Y2VkIEZGSCBlbmNvZGluZyB0
byBhY2NvbW1vZGF0ZSBzdWNoIGNhc2VzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoYW5rcywKPiA+
ID4gPiA+IFN1bmlsCj4gPiA+ID4KPiA+ID4gPiBBcyBtZW50aW9uZWQgZWFybGllciwgaXQgaXMg
YmVzdCB0byBkaXJlY3RseSByZWFkIENTUl9YWFggKGEgcmVmZXJlbmNlCj4gPiA+ID4gY2xvY2sg
dGhhdCBkb2VzIG5vdCBjb3VudCBkdXJpbmcgV0ZJKSBhbmQgQ1NSX0NZQ0xFIGluIFMtbW9kZSwg
cmF0aGVyCj4gPiA+ID4gdGhhbiB0cmFwcGluZyB0byBTQkkuCj4gPiA+ID4KPiA+ID4gTm8uIEkg
bWVhbnQgZGlyZWN0IENTUiBhY2Nlc3MgaXRzZWxmIG5vdCBTQkkuIFBsZWFzZSB0YWtlIGEgbG9v
ayBhdAo+ID4gPiBUYWJsZSA2IG9mIFJJU0MtViBGRkggc3BlYy4KPiA+ID4KPiA+ID4gPiBkcml2
ZXJzL2FjcGkvcmlzY3YvY3BwYy5jIGlzIGEgZ2VuZXJpYyBkcml2ZXIgdGhhdCBpcyBub3Qgc3Bl
Y2lmaWMgdG8KPiA+ID4gPiBhbnkgdmVuZG9yLiBDdXJyZW50bHksIHRoZSB1cHN0cmVhbSBjb2Rl
IGFscmVhZHkgdXNlcyBDU1JfVElNRSwgYW5kCj4gPiA+ID4gdGhlIGxvZ2ljIG9mIENTUl9USU1F
IGlzIGluY29ycmVjdC4KPiA+ID4gPgo+IEFDUEkgc3BlYyBmb3IgIlJlZmVyZW5jZSBQZXJmb3Jt
YW5jZSBSZWdpc3RlciIgc2F5cywKPgo+ICJUaGUgUmVmZXJlbmNlIFBlcmZvcm1hbmNlIENvdW50
ZXIgUmVnaXN0ZXIgY291bnRzIGF0IGEgZml4ZWQgcmF0ZSBhbnkKPiB0aW1lIHRoZSBwcm9jZXNz
b3IgaXMgYWN0aXZlLiBJdCBpcyBub3QgYWZmZWN0ZWQgYnkgY2hhbmdlcyB0byBEZXNpcmVkCj4g
UGVyZm9ybWFuY2UsIHByb2Nlc3NvciB0aHJvdHRsaW5nLCBldGMuIgo+Cj4gPiA+IENTUl9USU1F
IGlzIGp1c3QgYW4gZXhhbXBsZS4gSXQgaXMgdXB0byB0aGUgdmVuZG9yIGhvdyBfQ1BDIG9iamVj
dHMgYXJlCj4gPiA+IGVuY29kZWQgdXNpbmcgRkZILiBUaGUgbGludXggY29kZSBkb2Vzbid0IG1l
YW4gb25lIHNob3VsZCB1c2UgQ1NSX1RJTUUKPiA+ID4gYWx3YXlzLgo+ID4KPiA+IEZpcnN0LCB0
aGUgZXhhbXBsZSBvZiBDU1JfVElNRSBpcyBpbmNvcnJlY3QuIFdoYXQgaXMgbmVlZGVkIGlzIGEK
PiA+IENTUl9YWFggKGEgcmVmZXJlbmNlIGNsb2NrIHRoYXQgZG9lcyBub3QgY291bnQgZHVyaW5n
IFdGSSkuCj4gPgo+ID4gU2Vjb25kLCB5b3UgbWVudGlvbmVkIHRoYXQgZWFjaCB2ZW5kb3IgY2Fu
IGN1c3RvbWl6ZSB0aGVpciBvd24KPiA+IGltcGxlbWVudGF0aW9ucy4gQnV0IHNob3VsZCBhbGwg
dmVuZG9ycycgQ1NSX1hYWC9ZWVkvLi4uIGJlIGFkZGVkIHRvCj4gPiBkcml2ZXJzL2FjcGkvcmlz
Y3YvY3BwYy5jPyBTaG91bGRu4oCZdCBkcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jIGZhbGwKPiA+
IHVuZGVyIHRoZSBzY29wZSBkZWZpbmVkIGJ5IHRoZSBSSVNDLVYgYXJjaGl0ZWN0dXJlPwo+ID4K
PiBOby4gT25lIGNhbiBpbXBsZW1lbnQgc2ltaWxhciB0byBjc3JfcmVhZF9udW0oKSBpbiBvcGVu
c2JpLiBXZSBkaWRuJ3QKPiBhZGQgaXQgc2luY2UgdGhlcmUgd2FzIG5vIEhXIGltcGxlbWVudGlu
ZyBzdWNoIHRoaW5nLiBXaGF0IEkgYW0KPiBzYXlpbmcgaXMgd2UgaGF2ZSBGRkggZW5jb2Rpbmcg
dG8gc3VwcG9ydCBzdWNoIGNhc2UuCj4KPiA+ID4KPiA+ID4gPiBJdCB3b3VsZCBiZSBiZXN0IHRv
IHByb21vdGUgYSBzcGVjaWZpY2F0aW9uIHRvIHN1cHBvcnQgQ1NSX1hYWCwganVzdAo+ID4gPiA+
IGxpa2Ugd2hhdCBoYXMgYmVlbiBkb25lIGZvciB4ODYgYW5kIGFybTY0LiBXaGF0IGRvIHlvdSB0
aGluaz8KPiA+ID4gPgo+ID4gPiBXb3VsZG4ndCBhYm92ZSB3b3JrPyBGb3IgYSBzdGFuZGFyZCBl
eHRlbnNpb24sIHlvdSBtYXkgaGF2ZSB0byBwcm92aWRlCj4gPiA+IG1vcmUgZGF0YSB3aXRoIGFj
dHVhbCBIVy4KPiA+Cj4gPiBUaGlzIHdvbuKAmXQgd29yay4gTWF5IEkgYXNrIGhvdyB0aGUgY3Vy
cmVudCB1cHN0cmVhbSBjb2RlIGNhbiBjYWxjdWxhdGUKPiA+IHRoZSBhY3R1YWwgQ1BVIGZyZXF1
ZW5jeSB1c2luZyBDU1JfVElNRSB3aXRob3V0IHRyYXBwaW5nIHRvIFNCST8KPiA+IFRoaXMgaXMg
YSB0aGVvcmV0aWNhbCBsb2dpY2FsIGlzc3VlLiBXaHkgaXMgZGF0YSBuZWVkZWQgaGVyZT8KPiA+
Cj4gQXMgSSBtZW50aW9uZWQgYWJvdmUsIG9uZSBjYW4gaW1wbGVtZW50IGEgZ2VuZXJpYyBDU1Ig
cmVhZCB3aXRob3V0Cj4gdHJhcHBpbmcgdG8gU0JJLgo+Cj4gPiBDb3VsZCB5b3UgdGFrZSBhIGxv
b2sgYXQgdGhlICJBTVUgZXZlbnRzIGFuZCBldmVudCBudW1iZXJzIiBjaGFwdGVyIGluCj4gPiB0
aGUgQVJNNjQgbWFudWFsPwo+ID4KPiBBcy1wZXIgQUNQSSBzcGVjIHJlZmVyZW5jZSBwZXJmb3Jt
YW5jZSBjb3VudGVyIGlzIG5vdCBhZmZlY3RlZCBieSBDUFUKPiBzdGF0ZS4gVGhlIFJJU0MtViBG
RkggZW5jb2RpbmcgaXMgc3VmZmljaWVudGx5IGdlbmVyaWMgdG8gc3VwcG9ydCB0aGlzCj4gcmVx
dWlyZW1lbnQsIGV2ZW4gaWYgdGhlIHN0YW5kYXJkIENTUl9USU1FIGNhbm5vdCBiZSB1c2VkLiBJ
biBzdWNoCj4gY2FzZXMsIGFuIGFsdGVybmF0aXZlIENTUiBjYW4gYmUgZW5jb2RlZGVkLCBhY2Nl
c3NlZCB2aWEgYW4gT1MtbGV2ZWwKPiBhYnN0cmFjdGlvbiBzdWNoIGFzIGNzcl9yZWFkX251bSgp
LgoKU28gd2hhdCB5b3UncmUgc2F5aW5nIGlzIHRoYXQgd2Ugc2hvdWxkIHN1Ym1pdCBhIHBhdGNo
IGxpa2UgdGhpcywgcmlnaHQ/CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL3Jpc2N2L2NwcGMu
YyBiL2RyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMKaW5kZXggNDQwY2Y5ZmI5MWFhYi4uOTUzYzI1
OWQ0NmM2OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9hY3BpL3Jpc2N2L2NwcGMuYworKysgYi9kcml2
ZXJzL2FjcGkvcmlzY3YvY3BwYy5jCkBAIC02NiwxNiArNjYsOCBAQCBzdGF0aWMgdm9pZCBjcHBj
X2ZmaF9jc3JfcmVhZCh2b2lkICpyZWFkX2RhdGEpCiB7CiAgICAgICAgc3RydWN0IHNiaV9jcHBj
X2RhdGEgKmRhdGEgPSAoc3RydWN0IHNiaV9jcHBjX2RhdGEgKilyZWFkX2RhdGE7CgotICAgICAg
IHN3aXRjaCAoZGF0YS0+cmVnKSB7Ci0gICAgICAgLyogU3VwcG9ydCBvbmx5IFRJTUUgQ1NSIGZv
ciBub3cgKi8KLSAgICAgICBjYXNlIENTUl9USU1FOgotICAgICAgICAgICAgICAgZGF0YS0+cmV0
LnZhbHVlID0gY3NyX3JlYWQoQ1NSX1RJTUUpOwotICAgICAgICAgICAgICAgZGF0YS0+cmV0LmVy
cm9yID0gMDsKLSAgICAgICAgICAgICAgIGJyZWFrOwotICAgICAgIGRlZmF1bHQ6Ci0gICAgICAg
ICAgICAgICBkYXRhLT5yZXQuZXJyb3IgPSAtRUlOVkFMOwotICAgICAgICAgICAgICAgYnJlYWs7
Ci0gICAgICAgfQorICAgICAgIGRhdGEtPnJldC52YWx1ZSA9IGNzcl9yZWFkX251bShkYXRhLT5y
ZWcpOworICAgICAgIGRhdGEtPnJldC5lcnJvciA9IDA7CiB9CgpJZiB0aGF0J3MgdGhlIGNhc2Us
IHRoZSByb2J1c3RuZXNzIG9mIHRoZSBjb2RlIGNhbm5vdCBiZSBndWFyYW50ZWVkLApiZWNhdXNl
IHRoZSByYW5nZSBvZiBDU1JzIGZyb20gZGlmZmVyZW50IHZlbmRvcnMgaXMgdW5rbm93bi4KClNp
bmNlIGVhY2ggdmVuZG9yIHdpbGwgZGVmaW5lIHRoZWlyIG93biBDU1JzLCB3aHkgbm90IGZvcm1h
bGl6ZSB0aGVtCmludG8gYSBzcGVjaWZpY2F0aW9uPwoKPgo+IFRoYW5rcywKPiBTdW5pbAoKVGhh
bmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
