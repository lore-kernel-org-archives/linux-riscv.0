Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249D0C7EE31
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 07:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tfd9dvd807oADV83Tz7LMG+CQum0ymvSwjIWqZd7wZo=; b=u3A8Mel57i7Icx
	MTPJoubcIOXtk6bNkhYhsBylbWyOrgFuQIZYfC1lxhUjCKikmrRgPwqikL6BYafFD3FSWrzIt7cwF
	Pn5yh5e3+sepeZBU8iWGRDBqugRoOAkFxmnaIxm8NJY+yjcg4ydYQm9lAWgM+G1roH37wtlyYZ3l+
	txsLDLBZdJ+ZUFhuIKIA6WkpPnuHq7fUU2+75Ngz9g16yOw+7xeLe+HRAhL5HCM3UI5g5W6phUrUD
	Qfh6vwZm4Mp8eiwIEzzKNwDQ3qi/m6nfcUQ+YfxZz1toCys/7FGQptJ9hfdaLlLmb0tDmyLtnqYW1
	/O7v4qRHagDFGbEqDzWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3jq-0000000DrXV-0piM;
	Fri, 27 Jun 2025 07:43:10 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3e2-0000000DqFp-09Yq;
	Fri, 27 Jun 2025 07:37:11 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-53185535ed9so1785494e0c.0;
        Fri, 27 Jun 2025 00:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751009829; x=1751614629; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h04dW7cvq5MsrTLRcy+l7A8vi+WnZaRzq7TXJn2e26A=;
        b=nrbkViMByj1oYvx8tknIq8z34V2MmlJEFhRW/NdzukAo2iIp8chVUcCd204nQoVE4t
         GvO6FfygROJoP/bptwWNSANiXUl/pwArhGHao9hTQGpozfkwxMWmof1GmFdrEggiZ1dm
         uXqQ43jIvEj+yuR2OzKCcTvjRucMWDubh9R4EXyv+vuVio449zzSaNKJrR0ZrRPwXxzS
         0UnuqR6KgX0QM4pcuKsfXA5LROhFxopwk5Tv+G20xL+dr3R5sd4q4AFRiW3afS4APDAr
         iHXG2CwWBWW3QLnw5c7NPjKlNT90DwKHihywGzsRKNl+h3jbH6+XOQ4FKOBkxjnkfIV9
         /p1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751009829; x=1751614629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h04dW7cvq5MsrTLRcy+l7A8vi+WnZaRzq7TXJn2e26A=;
        b=IozRWtSHd4o46zUlily3fN6jMwGZwxg/B/9ZF8xKp+/8MqWQo92/8qHGewTUBSPJC+
         PBxmA83VykpuiRZL0tqGhBql43UWUNniJ6sjFCLcqCt7m0XgpgdoSJsgW8TYUgQeXevf
         KQBf+kWRH1MYqhDfnHKdC8kP/X8SiX2RUGHU4gH9IzmtRtey7IR4pbEHBUdn+Whn5WH5
         fqVtqNTKjBMWFYyunKoCCqVtzFv+ySYllO8Kr+JDCByZ8MB8Mww50jr4b6h7eq/CdjvD
         AudqsfiJ/BC58BYqbaTW14/vlfooR3sRZCxQCs7m5N3qFnJKtBwEyFGPHNgWDt7UfzdV
         fcAg==
X-Forwarded-Encrypted: i=1; AJvYcCW3R32piJw5x7+NwWmgdEM0S/bLxJFe1pZJ2vbmsATDULbS1tzjkIX1huamCtPcT+wlo2NMrhm/VOxUez8=@lists.infradead.org, AJvYcCWyqf/nEYQvJYeqWafi2DucboKc7fMdXGHFEOJf6TIDgMB7mx5RFRsOPkvw50nwwS5ku9kYwKU0B4fo9iafCI13@lists.infradead.org
X-Gm-Message-State: AOJu0YzW/am/AbuEjFWANPvpv8tjtnOa0VzqZg9eggpCUZzewcduU/7w
	BQ5JYJmxDdIDyuciOetWRY4YD7apLRuWM2aLOYQwrm0unpm7J9cb9Tbdzsq0DgTszfxGGartMq5
	KWVJuHBxDea2K3u+jiwOPuVplHMDhAB0=
X-Gm-Gg: ASbGncvAYTDixUHNzXprY7h5Et1H2UrfYefGmpfFwI4jm5eOGa/bES9SA1W9YnEFLKO
	UnGqxR7rgFse1Xv40n8T20REfz3D62VZy8wGCl0pPMo2Kk7kkBleeeyB1WRJX8PXZ+lXqFYkhdV
	2ktuYpVLMrXgp7pXyP54ew21WmVq1K6jZp2zjQ+c2uu9A=
X-Google-Smtp-Source: AGHT+IHo8FRikknOYfNn2v3zzQQPaCulI/LItL1n+PBYdAHqbmLkfddAtgEKwDf2Q40GboOB26M3NfwuovgELxUJcjQ=
X-Received: by 2002:a05:6122:a05:b0:531:1314:618d with SMTP id
 71dfb90a1353d-5330c227301mr1950474e0c.0.1751009828926; Fri, 27 Jun 2025
 00:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250627062319.84936-1-lance.yang@linux.dev> <CAGsJ_4xQW3O=-VoC7aTCiwU4NZnK0tNsG1faAUgLvf4aZSm8Eg@mail.gmail.com>
 <CAGsJ_4z+DU-FhNk9vkS-epdxgUMjrCvh31ZBwoAs98uWnbTK-A@mail.gmail.com> <1d39b66e-4009-4143-a8fa-5d876bc1f7e7@linux.dev>
In-Reply-To: <1d39b66e-4009-4143-a8fa-5d876bc1f7e7@linux.dev>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 27 Jun 2025 19:36:57 +1200
X-Gm-Features: Ac12FXz5tlMnNgK9S5wGn1B_aw1xub8A6xmoNvbFnezBsQjuxTcX4VyZtOeiAwc
Message-ID: <CAGsJ_4xX+kW1msaXpEPqX7aQ-GYG9QVMo+JYBc18BfLCs8eFyA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@redhat.com, baolin.wang@linux.alibaba.com, 
	chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com, 
	ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org, 
	huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com, 
	mingzhe.yang@ly.com, stable@vger.kernel.org, Lance Yang <ioworker0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_003710_078973_DF5ADDE4 
X-CRM114-Status: GOOD (  21.33  )
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

T24gRnJpLCBKdW4gMjcsIDIwMjUgYXQgNzoxNeKAr1BNIExhbmNlIFlhbmcgPGxhbmNlLnlhbmdA
bGludXguZGV2PiB3cm90ZToKPgo+Cj4KPiBPbiAyMDI1LzYvMjcgMTQ6NTUsIEJhcnJ5IFNvbmcg
d3JvdGU6Cj4gPiBPbiBGcmksIEp1biAyNywgMjAyNSBhdCA2OjUy4oCvUE0gQmFycnkgU29uZyA8
MjFjbmJhb0BnbWFpbC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gRnJpLCBKdW4gMjcsIDIwMjUg
YXQgNjoyM+KAr1BNIExhbmNlIFlhbmcgPGlvd29ya2VyMEBnbWFpbC5jb20+IHdyb3RlOgo+ID4+
Pgo+ID4+PiBGcm9tOiBMYW5jZSBZYW5nIDxsYW5jZS55YW5nQGxpbnV4LmRldj4KPiA+Pj4KPiA+
Pj4gQXMgcG9pbnRlZCBvdXQgYnkgRGF2aWRbMV0sIHRoZSBiYXRjaGVkIHVubWFwIGxvZ2ljIGlu
IHRyeV90b191bm1hcF9vbmUoKQo+ID4+PiBjYW4gcmVhZCBwYXN0IHRoZSBlbmQgb2YgYSBQVEUg
dGFibGUgaWYgYSBsYXJnZSBmb2xpbyBpcyBtYXBwZWQgc3RhcnRpbmcgYXQKPiA+Pj4gdGhlIGxh
c3QgZW50cnkgb2YgdGhhdCB0YWJsZS4gSXQgd291bGQgYmUgcXVpdGUgcmFyZSBpbiBwcmFjdGlj
ZSwgYXMKPiA+Pj4gTUFEVl9GUkVFIHR5cGljYWxseSBzcGxpdHMgdGhlIGxhcmdlIGZvbGlvIDsp
Cj4gPj4+Cj4gPj4+IFNvIGxldCdzIGZpeCB0aGUgcG90ZW50aWFsIG91dC1vZi1ib3VuZHMgcmVh
ZCBieSByZWZhY3RvcmluZyB0aGUgbG9naWMgaW50bwo+ID4+PiBhIG5ldyBoZWxwZXIsIGZvbGlv
X3VubWFwX3B0ZV9iYXRjaCgpLgo+ID4+Pgo+ID4+PiBUaGUgbmV3IGhlbHBlciBub3cgY29ycmVj
dGx5IGNhbGN1bGF0ZXMgdGhlIHNhZmUgbnVtYmVyIG9mIHBhZ2VzIHRvIHNjYW4gYnkKPiA+Pj4g
bGltaXRpbmcgdGhlIG9wZXJhdGlvbiB0byB0aGUgYm91bmRhcmllcyBvZiB0aGUgY3VycmVudCBW
TUEgYW5kIHRoZSBQVEUKPiA+Pj4gdGFibGUuCj4gPj4+Cj4gPj4+IEluIGFkZGl0aW9uLCB0aGUg
ImFsbC1vci1ub3RoaW5nIiBiYXRjaGluZyByZXN0cmljdGlvbiBpcyByZW1vdmVkIHRvCj4gPj4+
IHN1cHBvcnQgcGFydGlhbCBiYXRjaGVzLiBUaGUgcmVmZXJlbmNlIGNvdW50aW5nIGlzIGFsc28g
Y2xlYW5lZCB1cCB0byB1c2UKPiA+Pj4gZm9saW9fcHV0X3JlZnMoKS4KPiA+Pj4KPiA+Pj4gWzFd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1tL2E2OTQzOThjLTlmMDMtNDczNy04MWI5
LTdlNDljODU3ZmNiZUByZWRoYXQuY29tCj4gPj4+Cj4gPj4KPiA+PiBXaGF0IGFib3V0ID8KPiA+
Pgo+ID4+IEFzIHBvaW50ZWQgb3V0IGJ5IERhdmlkWzFdLCB0aGUgYmF0Y2hlZCB1bm1hcCBsb2dp
YyBpbiB0cnlfdG9fdW5tYXBfb25lKCkKPiA+PiBtYXkgcmVhZCBwYXN0IHRoZSBlbmQgb2YgYSBQ
VEUgdGFibGUgd2hlbiBhIGxhcmdlIGZvbGlvIHNwYW5zIGFjcm9zcyB0d28gUE1EcywKPiA+PiBw
YXJ0aWN1bGFybHkgYWZ0ZXIgYmVpbmcgcmVtYXBwZWQgd2l0aCBtcmVtYXAoKS4gVGhpcyBwYXRj
aCBmaXhlcyB0aGUKPiA+PiBwb3RlbnRpYWwgb3V0LW9mLWJvdW5kcyBhY2Nlc3MgYnkgY2FwcGlu
ZyB0aGUgYmF0Y2ggYXQgdm1fZW5kIGFuZCB0aGUgUE1ECj4gPj4gYm91bmRhcnkuCj4gPj4KPiA+
PiBJdCBhbHNvIHJlZmFjdG9ycyB0aGUgbG9naWMgaW50byBhIG5ldyBoZWxwZXIsIGZvbGlvX3Vu
bWFwX3B0ZV9iYXRjaCgpLAo+ID4+IHdoaWNoIHN1cHBvcnRzIGJhdGNoaW5nIGJldHdlZW4gMSBh
bmQgZm9saW9fbnJfcGFnZXMuIFRoaXMgaW1wcm92ZXMgY29kZQo+ID4+IGNsYXJpdHkuIE5vdGUg
dGhhdCBzdWNoIGNhc2VzIGFyZSByYXJlIGluIHByYWN0aWNlLCBhcyBNQURWX0ZSRUUgdHlwaWNh
bGx5Cj4gPj4gc3BsaXRzIGxhcmdlIGZvbGlvcy4KPiA+Cj4gPiBTb3JyeSwgSSBtZWFudCB0aGF0
IE1BRFZfRlJFRSB0eXBpY2FsbHkgc3BsaXRzIGxhcmdlIGZvbGlvcyBpZiB0aGUgc3BlY2lmaWVk
Cj4gPiByYW5nZSBkb2Vzbid0IGNvdmVyIHRoZSBlbnRpcmUgZm9saW8uCj4KPiBIbW0uLi4gSSBn
b3QgaXQgd3JvbmcgYXMgd2VsbCA6KCBJdCdzIHRoZSBwYXJ0aWFsIGNvdmVyYWdlIHRoYXQgdHJp
Z2dlcnMKPiB0aGUgc3BsaXQuCj4KPiBob3cgYWJvdXQgdGhpcyByZXZpc2VkIHZlcnNpb246Cj4K
PiBBcyBwb2ludGVkIG91dCBieSBEYXZpZFsxXSwgdGhlIGJhdGNoZWQgdW5tYXAgbG9naWMgaW4g
dHJ5X3RvX3VubWFwX29uZSgpCj4gbWF5IHJlYWQgcGFzdCB0aGUgZW5kIG9mIGEgUFRFIHRhYmxl
IHdoZW4gYSBsYXJnZSBmb2xpbyBzcGFucyBhY3Jvc3MgdHdvCj4gUE1EcywgcGFydGljdWxhcmx5
IGFmdGVyIGJlaW5nIHJlbWFwcGVkIHdpdGggbXJlbWFwKCkuIFRoaXMgcGF0Y2ggZml4ZXMKPiB0
aGUgcG90ZW50aWFsIG91dC1vZi1ib3VuZHMgYWNjZXNzIGJ5IGNhcHBpbmcgdGhlIGJhdGNoIGF0
IHZtX2VuZCBhbmQgdGhlCj4gUE1EIGJvdW5kYXJ5Lgo+Cj4gSXQgYWxzbyByZWZhY3RvcnMgdGhl
IGxvZ2ljIGludG8gYSBuZXcgaGVscGVyLCBmb2xpb191bm1hcF9wdGVfYmF0Y2goKSwKPiB3aGlj
aCBzdXBwb3J0cyBiYXRjaGluZyBiZXR3ZWVuIDEgYW5kIGZvbGlvX25yX3BhZ2VzLiBUaGlzIGlt
cHJvdmVzIGNvZGUKPiBjbGFyaXR5LiBOb3RlIHRoYXQgc3VjaCBib3VuZGFyeS1zdHJhZGRsaW5n
IGNhc2VzIGFyZSByYXJlIGluIHByYWN0aWNlLCBhcwo+IE1BRFZfRlJFRSB3aWxsIHR5cGljYWxs
eSBzcGxpdCBhIGxhcmdlIGZvbGlvIGlmIHRoZSBhZHZpY2UgcmFuZ2UgZG9lcyBub3QKPiBjb3Zl
ciB0aGUgZW50aXJlIGZvbGlvLgoKSSBhc3N1bWUgdGhlIG91dC1vZi1ib3VuZHMgYWNjZXNzIG11
c3QgYmUgZml4ZWQsIGV2ZW4gdGhvdWdoIGl0IGlzIHZlcnkKdW5saWtlbHkuIEl0IG1pZ2h0IG9j
Y3VyIGFmdGVyIGEgbGFyZ2UgZm9saW8gaXMgbWFya2VkIHdpdGggTUFEVl9GUkVFIGFuZAp0aGVu
IHJlbWFwcGVkIHRvIGFuIHVuYWxpZ25lZCBhZGRyZXNzLCBwb3RlbnRpYWxseSBjcm9zc2luZyB0
d28gUFRFIHRhYmxlcy4KCkEgYmF0Y2ggc2l6ZSBiZXR3ZWVuIDIgYW5kIG5yX3BhZ2VzIC0gMSBp
cyBwcmFjdGljYWxseSByYXJlLCBhcyB3ZSB0eXBpY2FsbHkKc3BsaXQgbGFyZ2UgZm9saW9zIHdo
ZW4gTUFEVl9GUkVFIGRvZXMgbm90IGNvdmVyIHRoZSBlbnRpcmUgZm9saW8gcmFuZ2UuCkNhc2Vz
IHdoZXJlIGEgYmF0Y2ggb2Ygc2l6ZSAyIG9yIG5yX3BhZ2VzIC0gMSBvY2N1cnMgbWF5IG9ubHkg
aGFwcGVuIGlmIGEKbGFyZ2UgZm9saW8gaXMgcGFydGlhbGx5IHVubWFwcGVkIGFmdGVyIGJlaW5n
IG1hcmtlZCBNQURWX0ZSRUUsIHdoaWNoIGlzCnF1aXRlIGFuIHVudXN1YWwgcGF0dGVybiBpbiB1
c2Vyc3BhY2UuCgpMZXQncyB3YWl0IGZvciBEYXZpZCdzIGZlZWRiYWNrIGJlZm9yZSBwcmVwYXJp
bmcgYSBuZXcgdmVyc2lvbiA6LSkKClRoYW5rcwpCYXJyeQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
