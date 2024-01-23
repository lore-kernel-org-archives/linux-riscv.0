Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C97C47DDC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZFfBC4UBhnH6UjbHY6wTP3ImqX/YUkrfwPCEXT3xzQ=; b=bYzwvDSnDew5O3
	gkJbXy2OIpae/iftUT1XsLe1T9e9RFzjUOtR/cv3G1SSFz9Og3yDt0sjecx8oCzxBDJfM4Wkp91Qm
	diJ0keeKuj3ASVi/1KZuynAnbngFrCyRv9NvwTtbBU0Zi1BG5GEB+ClqehR8oRxgdOvbq92hzwR4B
	fSfKvYaJP/CnupEUpOewFp94mZtM58U2YSsT3PEa+MsiL4uk3/8PAYdgGdu2//w/EAdEugyjD/Ohx
	fAKa35aMSBnSRqjK0yxTg7jut5r2zOO9Aa331zs1zFhp1Qj0X21364HVTNzLFB24MzZtYCegvZVjv
	2r89Nl0IRLjI+FGZTOBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSF2L-00GD1A-2v;
	Tue, 23 Jan 2024 11:33:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSF2I-00GCxO-32
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 11:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706009625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uYc245fmLpfbj4/lgjLqWN/cr5PYPrgDXzu14mAh+7Q=;
	b=IXBWdZHQVyLwAP22cNyIsMlL2xe6dHgiyCyAv7N4lUhlq+rmMIfRaFgS9xTZI3FBsEsIzt
	FQLQrmvYM4fuO2lh2A9DuZoLDsTgnK7osZJYGA0s6pOrSvQoim9AWJDR8sTrgIs9jihTeK
	iVEFjIrm7ben4N1v4OBsR62sPeJj0JQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-zauHkOHiOnC9aKLFvKUO4A-1; Tue, 23 Jan 2024 06:33:44 -0500
X-MC-Unique: zauHkOHiOnC9aKLFvKUO4A-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40e863cb806so40637145e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 03:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706009623; x=1706614423;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYc245fmLpfbj4/lgjLqWN/cr5PYPrgDXzu14mAh+7Q=;
        b=vd8w1otqfhUST1GYKt2yUrmcjJI8llHYqwjvsI/F1Cn3rWJWp4z/8PAMik6QLvXTxq
         a04TL0VF6jRYr363bcIPEYk2mP2C1DdIkRSiUnLTqscOR9JX+vXpsucLDNPSaRV9spwf
         +pfGmizTigb3QU0E9KuoMp6R8Knb7xnlzDADHg5Yj6A5bfqAClmjzV5RPXliJO3n/Xv5
         0sKqjeBRneaQ2JqYOv+95r28vJNhLH4rRp6L5qXzFCbgYNZNoAuKugALFFzBSHq+wL8Q
         pRP818bHyjTCPxAa0t0CAnxxmoEM4aiaEpZ7lL4vxJ/lEX2nIp5+I2HJHDtLO12ZF98M
         1fXA==
X-Gm-Message-State: AOJu0YzWRPuOLZa/PlT6J3UvJmucTITQMSUnFcw5h0codq7eFBpujg7g
	VmoPT3RCD9jFyof9w+vhdYkfowJGXfbZ6sxRPvIlZyz9DkvntKZAjoDjPruvaXuuuUGRf2fJaNC
	TpLgGF2mdNzpE9BvLhB46O5pHGbkH0/vr8YZNh3yHZ48zYxu/y1okVcernZknuR1M5g==
X-Received: by 2002:a05:600c:18a6:b0:40e:4806:7f9b with SMTP id x38-20020a05600c18a600b0040e48067f9bmr227462wmp.307.1706009623417;
        Tue, 23 Jan 2024 03:33:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFJvXfwJB2xAbV09x8KiTq4J32uzT4FvDsoae6ebynNFGjmyUFY1Tg60erzHgnrvVXUOqPHw==
X-Received: by 2002:a05:600c:18a6:b0:40e:4806:7f9b with SMTP id x38-20020a05600c18a600b0040e48067f9bmr227451wmp.307.1706009622974;
        Tue, 23 Jan 2024 03:33:42 -0800 (PST)
Received: from ?IPV6:2003:cb:c741:de00:bf0f:cd46:dc1c:2de9? (p200300cbc741de00bf0fcd46dc1c2de9.dip0.t-ipconnect.de. [2003:cb:c741:de00:bf0f:cd46:dc1c:2de9])
        by smtp.gmail.com with ESMTPSA id e7-20020a5d4e87000000b00337d56264d4sm13181557wru.8.2024.01.23.03.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 03:33:42 -0800 (PST)
Message-ID: <08607590-3115-46e6-8f1f-bcc60c33cc20@redhat.com>
Date: Tue, 23 Jan 2024 12:33:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
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
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-2-david@redhat.com>
 <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
 <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
 <02d42161-a867-424d-bef8-efd67d592cbc@redhat.com>
 <75e99c49-734a-47f4-b7a5-7e346bd2487b@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <75e99c49-734a-47f4-b7a5-7e346bd2487b@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_033347_058796_9C6C91EF 
X-CRM114-Status: GOOD (  18.25  )
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

T24gMjMuMDEuMjQgMTI6MTcsIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPiBPbiAyMy8wMS8yMDI0IDEx
OjAyLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gT24gMjMuMDEuMjQgMTE6NDgsIERhdmlk
IEhpbGRlbmJyYW5kIHdyb3RlOgo+Pj4gT24gMjMuMDEuMjQgMTE6MzQsIFJ5YW4gUm9iZXJ0cyB3
cm90ZToKPj4+PiBPbiAyMi8wMS8yMDI0IDE5OjQxLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToK
Pj4+Pj4gV2Ugd2FudCB0byBtYWtlIHVzZSBvZiBwdGVfbmV4dF9wZm4oKSBvdXRzaWRlIG9mIHNl
dF9wdGVzKCkuIExldCdzCj4+Pj4+IHNpbXBsaXkgZGVmaW5lIFBGTl9QVEVfU0hJRlQsIHJlcXVp
cmVkIGJ5IHB0ZV9uZXh0X3BmbigpLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBI
aWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICDCoMKgIGFyY2gv
YXJtL2luY2x1ZGUvYXNtL3BndGFibGUuaMKgwqAgfCAyICsrCj4+Pj4+ICDCoMKgIGFyY2gvYXJt
NjQvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgMiArKwo+Pj4+PiAgwqDCoCAyIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vaW5j
bHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+Pj4+
IGluZGV4IGQ2NTdiODRiNmJmNzAuLmJlOTFlMzc2ZGY3OWUgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL3BndGFibGUuaAo+Pj4+PiArKysgYi9hcmNoL2FybS9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmgKPj4+Pj4gQEAgLTIwOSw2ICsyMDksOCBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgX19zeW5jX2ljYWNoZV9kY2FjaGUocHRlX3QgcHRldmFsKQo+Pj4+PiAgwqDCoCBleHRlcm4g
dm9pZCBfX3N5bmNfaWNhY2hlX2RjYWNoZShwdGVfdCBwdGV2YWwpOwo+Pj4+PiAgwqDCoCAjZW5k
aWYKPj4+Pj4gIMKgwqAgKyNkZWZpbmUgUEZOX1BURV9TSElGVMKgwqDCoMKgwqDCoMKgIFBBR0Vf
U0hJRlQKPj4+Pj4gKwo+Pj4+PiAgwqDCoCB2b2lkIHNldF9wdGVzKHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBwdGVfdCAqcHRlcCwgcHRlX3QgcHRldmFsLCB1bnNpZ25lZCBpbnQgbnIpOwo+Pj4+
PiAgwqDCoCAjZGVmaW5lIHNldF9wdGVzIHNldF9wdGVzCj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+Pj4+PiBiL2FyY2gvYXJtNjQvaW5jbHVkZS9h
c20vcGd0YWJsZS5oCj4+Pj4+IGluZGV4IDc5Y2U3MGZiYjc1MWMuLmQ0YjNiZDk2ZTMzMDQgMTAw
NjQ0Cj4+Pj4+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+Pj4+ICsr
KyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+Pj4+IEBAIC0zNDEsNiArMzQx
LDggQEAgc3RhdGljIGlubGluZSB2b2lkIF9fc3luY19jYWNoZV9hbmRfdGFncyhwdGVfdCBwdGUs
Cj4+Pj4+IHVuc2lnbmVkIGludCBucl9wYWdlcykKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG10ZV9zeW5jX3RhZ3MocHRlLCBucl9wYWdlcyk7Cj4+Pj4+ICDCoMKgIH0KPj4+Pj4gIMKgwqAg
KyNkZWZpbmUgUEZOX1BURV9TSElGVMKgwqDCoMKgwqDCoMKgIFBBR0VfU0hJRlQKPj4+Pgo+Pj4+
IEkgdGhpbmsgdGhpcyBpcyBidWdneS4gQW5kIHNvIGlzIHRoZSBhcm02NCBpbXBsZW1lbnRhdGlv
biBvZiBzZXRfcHRlcygpLiBJdAo+Pj4+IHdvcmtzIGZpbmUgZm9yIDQ4LWJpdCBvdXRwdXQgYWRk
cmVzcywgYnV0IGZvciA1Mi1iaXQgT0FzLCB0aGUgaGlnaCBiaXRzIGFyZSBub3QKPj4+PiBrZXB0
IGNvbnRpZ291c2x5LCBzbyBpZiB5b3UgaGFwcGVuIHRvIGJlIHNldHRpbmcgYSBtYXBwaW5nIGZv
ciB3aGljaCB0aGUKPj4+PiBwaHlzaWNhbCBtZW1vcnkgYmxvY2sgc3RyYWRkbGVzIGJpdCA0OCwg
dGhpcyB3b24ndCB3b3JrLgo+Pj4KPj4+IFJpZ2h0LCBhcyBzb29uIGFzIHRoZSBQVEUgYml0cyBh
cmUgbm90IGNvbnRpZ3VvdXMsIHRoaXMgc3RvcHMgd29ya2luZywKPj4+IGp1c3QgbGlrZSBzZXRf
cHRlcygpIHdvdWxkLCB3aGljaCBJIHVzZWQgYXMgb3JpZW50YXRpb24uCj4+Pgo+Pj4+Cj4+Pj4g
VG9kYXksIG9ubHkgdGhlIDY0SyBiYXNlIHBhZ2UgY29uZmlnIGNhbiBzdXBwb3J0IDUyIGJpdHMs
IGFuZCBmb3IgdGhpcywKPj4+PiBPQVs1MTo0OF0gYXJlIHN0b3JlZCBpbiBQVEVbMTU6MTJdLiBC
dXQgNTIgYml0cyBmb3IgNEsgYW5kIDE2SyBiYXNlIHBhZ2VzIGlzCj4+Pj4gY29taW5nIChob3Bl
ZnVsbHkgdjYuOSkgYW5kIGluIHRoaXMgY2FzZSBPQVs1MTo1MF0gYXJlIHN0b3JlZCBpbiBQVEVb
OTo4XS4KPj4+PiBGb3J0dW5hdGVseSB3ZSBhbHJlYWR5IGhhdmUgaGVscGVycyBpbiBhcm02NCB0
byBhYnN0cmFjdCB0aGlzLgo+Pj4+Cj4+Pj4gU28gSSB0aGluayBhcm02NCB3aWxsIHdhbnQgdG8g
ZGVmaW5lIGl0cyBvd24gcHRlX25leHRfcGZuKCk6Cj4+Pj4KPj4+PiAjZGVmaW5lIHB0ZV9uZXh0
X3BmbiBwdGVfbmV4dF9wZm4KPj4+PiBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9uZXh0X3Bmbihw
dGVfdCBwdGUpCj4+Pj4gewo+Pj4+ICDCoMKgwqDCoHJldHVybiBwZm5fcHRlKHB0ZV9wZm4ocHRl
KSArIDEsIHB0ZV9wZ3Byb3QocHRlKSk7Cj4+Pj4gfQo+Pj4+Cj4+Cj4+IERpZ2dpbmcgaW50byB0
aGUgZGV0YWlscywgb24gYXJtNjQgd2UgaGF2ZToKPj4KPj4gI2RlZmluZSBwdGVfcGZuKHB0ZSnC
oMKgwqDCoMKgwqDCoMKgwqDCoCAoX19wdGVfdG9fcGh5cyhwdGUpID4+IFBBR0VfU0hJRlQpCj4+
Cj4+IGFuZAo+Pgo+PiAjZGVmaW5lIF9fcHRlX3RvX3BoeXMocHRlKcKgwqDCoMKgIChwdGVfdmFs
KHB0ZSkgJiBQVEVfQUREUl9NQVNLKQo+Pgo+PiBCdXQgdGhhdCBpbXBsaWVzLCB0aGF0IHVwc3Ry
ZWFtIHRoZSBQRk4gaXMgYWx3YXlzIGNvbnRpZ3VvdXMsIG5vPwo+Pgo+IAo+IAo+IEJ1dCBfX3B0
ZV90b19waHlzKCkgYW5kIF9fcGh5c190b19wdGVfdmFsKCkgZGVwZW5kIG9uIGEgS2NvbmZpZy4g
SWYgUEEgYml0cyBpcwo+IDUyLCB0aGUgYml0cyBhcmUgbm90IGFsbCBjb250aWd1b3VzOgo+IAo+
ICNpZmRlZiBDT05GSUdfQVJNNjRfUEFfQklUU181Mgo+IHN0YXRpYyBpbmxpbmUgcGh5c19hZGRy
X3QgX19wdGVfdG9fcGh5cyhwdGVfdCBwdGUpCj4gewo+IAlyZXR1cm4gKHB0ZV92YWwocHRlKSAm
IFBURV9BRERSX0xPVykgfAo+IAkJKChwdGVfdmFsKHB0ZSkgJiBQVEVfQUREUl9ISUdIKSA8PCBQ
VEVfQUREUl9ISUdIX1NISUZUKTsKPiB9Cj4gc3RhdGljIGlubGluZSBwdGV2YWxfdCBfX3BoeXNf
dG9fcHRlX3ZhbChwaHlzX2FkZHJfdCBwaHlzKQo+IHsKPiAJcmV0dXJuIChwaHlzIHwgKHBoeXMg
Pj4gUFRFX0FERFJfSElHSF9TSElGVCkpICYgUFRFX0FERFJfTUFTSzsKPiB9Cj4gI2Vsc2UKPiAj
ZGVmaW5lIF9fcHRlX3RvX3BoeXMocHRlKQkocHRlX3ZhbChwdGUpICYgUFRFX0FERFJfTUFTSykK
PiAjZGVmaW5lIF9fcGh5c190b19wdGVfdmFsKHBoeXMpCShwaHlzKQo+ICNlbmRpZgo+IAoKQWgs
IGhvdyBjb3VsZCBJJ3ZlIG1pc3NlZCB0aGF0LiBBZ3JlZWQsIHNldF9wdGVzKCkgYW5kIHRoaXMg
cGF0Y2ggYXJlIApicm9rZW4uCgpEbyB5b3Ugd2FudCB0byBzZW5kIGEgcGF0Y2ggdG8gaW1wbGVt
ZW50IHB0ZV9uZXh0X3BmbigpIG9uIGFybTY0LCBhbmQgCnRoZW4gdXNlIHB0ZV9uZXh0X3Bmbigp
IGluIHNldF9wdGVzKCk/IFRoZW4gSSBjYW4gZHJvcCB0aGlzIHBhdGNoIGhlcmUgCmNvbXBsZXRl
bHkgZnJvbSB0aGlzIHNlcmllcy4KCi0tIApDaGVlcnMsCgpEYXZpZCAvIGRoaWxkZW5iCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
