Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE94C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 11:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvsWsXik2mbesUlYHIyKI1NdlOpwtyw1UeYUYXy0KDY=; b=4tShlIkNp11fE3
	uSjmKq/whP23rlBCQE1ibGf1r2p7417oaBEc4lphyfZXUnnL2nigMh6zNkrnVwn2aN5N8yI2xMmsH
	uOT/D+At9LmoPGZaU4XX0bN8mnJjE56ZG9zVcHBjvdoLcCLPyGXk6ohKXrs2Mqe77Pdbz2tFC/F8S
	15tYw7+JdWMjzHYca3keaR6p+y5MwUW6KI0dPmMOpteDylgQlgD7CxsbK387/oMEbwixd4dMI4dD9
	RhFuUYHGenRDG6PXPB+ocMm068IbhkXHkPH1ZUcIVJEyJGkERoAJHThtcJEknP029ZZEpR0jB6vFu
	JMK2is/4F/hgNJ4quaZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8lO-000000035gD-3Uvy;
	Wed, 31 Jan 2024 11:28:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8lL-000000035dj-0gHZ
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 11:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706700493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QEgFZrM0WK1zcolOs9UzEgOHw8WztsvnyJnbA5iRSvg=;
	b=dF0NAhvCUXGkmwWm1h5mQ3EpyhN+Fb/JAlCReX65LDCeidOOCm12UuL8TZ7SdhPY49hbOx
	i+4xMbnZEUFoHdDMM67hWvCDC4DyAngfQpnEs6Qw+Az0jTEjdYIhEi+lxVa/sZ4a0kt3Di
	M2xDZI0ZE++tGUfM2bzlbMoft9A/DIo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-83reVY_kN8qM3Bdlg00PGg-1; Wed, 31 Jan 2024 06:28:12 -0500
X-MC-Unique: 83reVY_kN8qM3Bdlg00PGg-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-68c4e69e121so67809756d6.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 03:28:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706700492; x=1707305292;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEgFZrM0WK1zcolOs9UzEgOHw8WztsvnyJnbA5iRSvg=;
        b=UkI459agVzitIpEe+EExI8NpkOFb6nVwNeBQgwu6N+ZsJU7yNaMa+mx8Fe+QL/4iNt
         QvI9ivwhTuKGYg6f7ccOex/KAUDGaLc+bHbYbozbipGwsPQsoKx7VKMlyZfCe35z1As3
         YqJpGEFH0jY8PzfLCuFKZDbxQVTURJbvUFAEZXcfsdYyDRnhnBl7qovAYQzbn22BSvKF
         8SzvClEPoAtKkUX982gQL6ANS0gvloNnGGaEoXIREATxyd6TTbDCTkKUOsgnwbhIlVls
         4FlQlUJTc7BzRT13EVulMmhjgQAKMsYyJ9r4oVKGjxTPQUGU4VOAD0XnQmihwYvPccP+
         moXg==
X-Gm-Message-State: AOJu0YzFOcoX2+Iz2OK/l7c/GXNHCTDOHRVkp5OzHjd6vZAjibaVPRup
	kd7tOG2cbIjb8Nt3D3skucTXr0b6bDu12IyId5PzCGoQoH6LQhjdCrJUOdEBW4Gp2TC/+Ja6lc9
	2JJJBuTeJhyEZaoFew8d/1NqboYcLNzKr8PL1ccKdMiSZp/q1ypWLactIt0zxs5itJw==
X-Received: by 2002:ad4:596f:0:b0:68c:5cd3:7657 with SMTP id eq15-20020ad4596f000000b0068c5cd37657mr1161407qvb.50.1706700491809;
        Wed, 31 Jan 2024 03:28:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnMRI1kY3UTBQ/tm4+uOS8wrOMJMpp0UBTiS3ZHTfv2MyVvtZoSJ5dluKxqhKuk0iXvDsuZw==
X-Received: by 2002:ad4:596f:0:b0:68c:5cd3:7657 with SMTP id eq15-20020ad4596f000000b0068c5cd37657mr1161383qvb.50.1706700491415;
        Wed, 31 Jan 2024 03:28:11 -0800 (PST)
Received: from [10.32.64.237] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id dz11-20020ad4588b000000b0068c493426edsm3433632qvb.104.2024.01.31.03.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 03:28:11 -0800 (PST)
Message-ID: <e6eaba5b-f290-4d1f-990b-a47d89f56ee4@redhat.com>
Date: Wed, 31 Jan 2024 12:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
To: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org
References: <20240129124649.189745-1-david@redhat.com>
 <a335a9d2-9b8f-4eb8-ba22-23a223b59b06@arm.com>
 <a1a0e9b3-dae2-418f-bd63-50e65f471728@redhat.com>
 <57eb82c7-4816-42a2-b5ab-cc221e289b21@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <57eb82c7-4816-42a2-b5ab-cc221e289b21@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_032815_308636_8463B22C 
X-CRM114-Status: GOOD (  20.01  )
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

T24gMzEuMDEuMjQgMTI6MTYsIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPiBPbiAzMS8wMS8yMDI0IDEx
OjA2LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gT24gMzEuMDEuMjQgMTE6NDMsIFJ5YW4g
Um9iZXJ0cyB3cm90ZToKPj4+IE9uIDI5LzAxLzIwMjQgMTI6NDYsIERhdmlkIEhpbGRlbmJyYW5k
IHdyb3RlOgo+Pj4+IE5vdyB0aGF0IHRoZSBybWFwIG92ZXJoYXVsWzFdIGlzIHVwc3RyZWFtIHRo
YXQgcHJvdmlkZXMgYSBjbGVhbiBpbnRlcmZhY2UKPj4+PiBmb3Igcm1hcCBiYXRjaGluZywgbGV0
J3MgaW1wbGVtZW50IFBURSBiYXRjaGluZyBkdXJpbmcgZm9yayB3aGVuIHByb2Nlc3NpbmcKPj4+
PiBQVEUtbWFwcGVkIFRIUHMuCj4+Pj4KPj4+PiBUaGlzIHNlcmllcyBpcyBwYXJ0aWFsbHkgYmFz
ZWQgb24gUnlhbidzIHByZXZpb3VzIHdvcmtbMl0gdG8gaW1wbGVtZW50Cj4+Pj4gY29udC1wdGUg
c3VwcG9ydCBvbiBhcm02NCwgYnV0IGl0cyBhIGNvbXBsZXRlIHJld3JpdGUgYmFzZWQgb24gWzFd
IHRvCj4+Pj4gb3B0aW1pemUgYWxsIGFyY2hpdGVjdHVyZXMgaW5kZXBlbmRlbnQgb2YgYW55IHN1
Y2ggUFRFIGJpdHMsIGFuZCB0bwo+Pj4+IHVzZSB0aGUgbmV3IHJtYXAgYmF0Y2hpbmcgZnVuY3Rp
b25zIHRoYXQgc2ltcGxpZnkgdGhlIGNvZGUgYW5kIHByZXBhcmUKPj4+PiBmb3IgZnVydGhlciBy
bWFwIGFjY291bnRpbmcgY2hhbmdlcy4KPj4+Pgo+Pj4+IFdlIGNvbGxlY3QgY29uc2VjdXRpdmUg
UFRFcyB0aGF0IG1hcCBjb25zZWN1dGl2ZSBwYWdlcyBvZiB0aGUgc2FtZSBsYXJnZQo+Pj4+IGZv
bGlvLCBtYWtpbmcgc3VyZSB0aGF0IHRoZSBvdGhlciBQVEUgYml0cyBhcmUgY29tcGF0aWJsZSwg
YW5kIChhKSBhZGp1c3QKPj4+PiB0aGUgcmVmY291bnQgb25seSBvbmNlIHBlciBiYXRjaCwgKGIp
IGNhbGwgcm1hcCBoYW5kbGluZyBmdW5jdGlvbnMgb25seQo+Pj4+IG9uY2UgcGVyIGJhdGNoIGFu
ZCAoYykgcGVyZm9ybSBiYXRjaCBQVEUgc2V0dGluZy91cGRhdGVzLgo+Pj4+Cj4+Pj4gV2hpbGUg
dGhpcyBzZXJpZXMgc2hvdWxkIGJlIGJlbmVmaWNpYWwgZm9yIGFkZGluZyBjb250LXB0ZSBzdXBw
b3J0IG9uCj4+Pj4gQVJNNjRbMl0sIGl0J3Mgb25lIG9mIHRoZSByZXF1aXJlbWVudHMgZm9yIG1h
aW50YWluaW5nIGEgdG90YWwgbWFwY291bnRbM10KPj4+PiBmb3IgbGFyZ2UgZm9saW9zIHdpdGgg
bWluaW1hbCBhZGRlZCBvdmVyaGVhZCBhbmQgZnVydGhlciBjaGFuZ2VzWzRdIHRoYXQKPj4+PiBi
dWlsZCB1cCBvbiB0b3Agb2YgdGhlIHRvdGFsIG1hcGNvdW50Lgo+Pj4+Cj4+Pj4gSW5kZXBlbmRl
bnQgb2YgYWxsIHRoYXQsIHRoaXMgc2VyaWVzIHJlc3VsdHMgaW4gYSBzcGVlZHVwIGR1cmluZyBm
b3JrIHdpdGgKPj4+PiBQVEUtbWFwcGVkIFRIUCwgd2hpY2ggaXMgdGhlIGRlZmF1bHQgd2l0aCBU
SFBzIHRoYXQgYXJlIHNtYWxsZXIgdGhhbiBhIFBNRAo+Pj4+IChmb3IgZXhhbXBsZSwgMTZLaUIg
dG8gMTAyNEtpQiBtVEhQcyBmb3IgYW5vbnltb3VzIG1lbW9yeVs1XSkuCj4+Pj4KPj4+PiBPbiBh
biBJbnRlbCBYZW9uIFNpbHZlciA0MjEwUiBDUFUsIGZvcmsnaW5nIHdpdGggMUdpQiBvZiBQVEUt
bWFwcGVkIGZvbGlvcwo+Pj4+IG9mIHRoZSBzYW1lIHNpemUgKHN0ZGRldiA8IDElKSByZXN1bHRz
IGluIHRoZSBmb2xsb3dpbmcgcnVudGltZXMKPj4+PiBmb3IgZm9yaygpIChzaG9ydGVyIGlzIGJl
dHRlcik6Cj4+Pj4KPj4+PiBGb2xpbyBTaXplIHwgdjYuOC1yYzEgfMKgwqDCoMKgwqAgTmV3IHwg
Q2hhbmdlCj4+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+
Pj4gIMKgwqDCoMKgwqDCoCA0S2lCIHwgMC4wMTQzMjggfCAwLjAxNDAzNSB8wqDCoCAtIDIlCj4+
Pj4gIMKgwqDCoMKgwqAgMTZLaUIgfCAwLjAxNDI2MyB8IDAuMDExOTbCoCB8wqDCoCAtMTYlCj4+
Pj4gIMKgwqDCoMKgwqAgMzJLaUIgfCAwLjAxNDMzNCB8IDAuMDEwOTTCoCB8wqDCoCAtMjQlCj4+
Pj4gIMKgwqDCoMKgwqAgNjRLaUIgfCAwLjAxNDA0NiB8IDAuMDEwNDQ0IHzCoMKgIC0yNiUKPj4+
PiAgwqDCoMKgwqAgMTI4S2lCIHwgMC4wMTQwMTEgfCAwLjAxMDA2MyB8wqDCoCAtMjglCj4+Pj4g
IMKgwqDCoMKgIDI1NktpQiB8IDAuMDEzOTkzIHwgMC4wMDk5MzggfMKgwqAgLTI5JQo+Pj4+ICDC
oMKgwqDCoCA1MTJLaUIgfCAwLjAxMzk4MyB8IDAuMDA5ODXCoCB8wqDCoCAtMzAlCj4+Pj4gIMKg
wqDCoCAxMDI0S2lCIHwgMC4wMTM5ODYgfCAwLjAwOTgywqAgfMKgwqAgLTMwJQo+Pj4+ICDCoMKg
wqAgMjA0OEtpQiB8IDAuMDE0MzA1IHwgMC4wMTAwNzYgfMKgwqAgLTMwJQo+Pj4KPj4+IEp1c3Qg
YSBoZWFkcyB1cCB0aGF0IEknbSBzZWVpbmcgc29tZSBzdHJhbmdlIHJlc3VsdHMgb24gQXBwbGUg
TTIuIEZvcmsgZm9yCj4+PiBvcmRlci0wIGlzIHNlZW1pbmdseSBjb3N0aW5nIH4xNyUgbW9yZS4g
SSdtIHVzaW5nIEdDQyAxMy4yIGFuZCB3YXMgcHJldHR5IHN1cmUgSQo+Pj4gZGlkbid0IHNlZSB0
aGlzIHByb2JsZW0gd2l0aCB2ZXJzaW9uIDE7IGFsdGhvdWdoIHRoYXQgd2FzIG9uIGEgZGlmZmVy
ZW50Cj4+PiBiYXNlbGluZSBhbmQgSSd2ZSB0aHJvd24gdGhlIG51bWJlcnMgYXdheSBzbyB3aWxs
IHJlcnVuIGFuZCB0cnkgdG8gZGVidWcgdGhpcy4KPj4+Cj4+Cj4+IFNvIGZhciwgb24gbXkgeDg2
IHRlc3RzIChJbnRlbCwgQU1EIEVQWUMpLCBJIHdhcyBub3QgYWJsZSB0byBvYnNlcnZlIHRoaXMu
Cj4+IGZvcmsoKSBmb3Igb3JkZXItMCB3YXMgY29uc2lzdGVudGx5IGVmZmVjdGl2ZWx5IHVuY2hh
bmdlZC4gRG8geW91IG9ic2VydmUgdGhhdAo+PiBvbiBvdGhlciBBUk0gc3lzdGVtcyBhcyB3ZWxs
Pwo+IAo+IE5vcGU7IHJ1bm5pbmcgdGhlIGV4YWN0IHNhbWUga2VybmVsIGJpbmFyeSBhbmQgdXNl
ciBzcGFjZSBvbiBBbHRyYSwgSSBzZWUKPiBzZW5zaWJsZSBudW1iZXJzOwo+IAo+IGZvcmsgb3Jk
ZXItMDogLTEuMyUKPiBmb3JrIG9yZGVyLTk6IC03LjYlCj4gZG9udG5lZWQgb3JkZXItMDogLTAu
NSUKPiBkb250bmVlZCBvcmRlci05OiAwLjElCj4gbXVubWFwIG9yZGVyLTA6IDAuMCUKPiBtdW5t
YXAgb3JkZXItOTogLTY3LjklCj4gCj4gU28gSSBndWVzcyBzb21lIHBpcGVsaW5pbmcgaXNzdWUg
dGhhdCBjYXVzZXMgdGhlIE0yIHRvIHN0YWxsIG1vcmU/CgpXaXRoIG9uZSBlZmZlY3RpdmUgYWRk
ZWQgZm9saW9fdGVzdF9sYXJnZSgpLCBpdCBjb3VsZCBvbmx5IGJlIGEgY29kZSAKbGF5b3V0IHBy
b2JsZW0/IE9yIHRoZSBjb21waWxlciBkb2VzIHNvbWV0aGluZyBzdHVwaWQsIGJ1dCB5b3Ugc2F5
IHRoYXQgCnlvdSBydW4gdGhlIGV4YWN0IHNhbWUga2VybmVsIGJpbmFyeSwgc28gdGhhdCBkb2Vz
bid0IG1ha2Ugc2Vuc2UuCgpJJ20gYWxzbyBzdXJwcmlzZWQgYWJvdXQgdGhlIGRvbnRuZWVkIHZz
LiBtdW5tYXAgbnVtYmVycy4gRG9lc24ndCBtYWtlIAphbnkgc2Vuc2UgKGFnYWluLCB0aGVyZSB3
YXMgdGhpcyBWTUEgbWVyZ2luZyBwcm9ibGVtIGJ1dCBpdCB3b3VsZCBzdGlsbCAKYWxsb3cgZm9y
IGJhdGNoaW5nIHdpdGhpbiBhIHNpbmdsZSBWTUEgdGhhdCBzcGFucyBleGFjdGx5IG9uZSBsYXJn
ZSBmb2xpbykuCgpXaGF0IGFyZSB5b3UgdXNpbmcgYXMgYmFzZWxpbmU/IFJlYWxseSBqdXN0IG1t
LXVuc3RhYmxlIHZzLiAKbW0tdW5zdGFibGUrcGF0Y2hlcz8KCkxldCdzIHNlZSBpZiB0aGUgbmV3
IHRlc3QgY2hhbmdlcyB0aGUgbnVtYmVycyB5b3UgbWVhc3VyZS4KCi0tIApDaGVlcnMsCgpEYXZp
ZCAvIGRoaWxkZW5iCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
