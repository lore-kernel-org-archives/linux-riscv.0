Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD639C41535
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 01:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdOkpAMcEc8c25pjQyNAo6n9X5nEuwtKFnA+tqQjwJw=; b=oP0QeD75CO/iR6
	YM0FNWxJes7fykMU3iRWzqOR1gmlwsOHGHqrPIoDuWGTBIDQ6YpjGSCcrQ+5mKcptiRxD8d+iQ/i2
	ZbLxiygwHYVSB4a4VtH+YMqybRaPn3kULn9fTqC6GdsVyYj3pGs88OAYIAv7qaYpLVJDgJCpzjSN7
	Ml+8daWDf3p6tg8PQJI2+PRxFnNYoHwOQ3IOCFgQYBwmYPOLa5ZQSkE51yrrpYpZ7836DOV7/eK1s
	9oQfahHIIdnlq3LQ9lpD2hXKC+yh1aDfBWdJL15ZPBeCFOZnt48WF8ZSAACRbWC9RbagGqG+KdURG
	njzXkPXIWuhr1xhQcyiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFlcT-00FvJw-3C;
	Wed, 20 Dec 2023 01:43:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFlcP-00FvIU-2r
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 01:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703036607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vjm4paNMTWlCFosQbpjmCNgYAmudj3J1TP/uI6GNhCE=;
	b=H3i7Fr9/CnnXu+QfAOUuG2urlgpn+aNLknhcmNBDogcHQCjHNMtOnL5YEVgZflqsK6SVg/
	fFzrHmEweIdLW5aIUT05ZqovmBr7gIL2S2+hXUlbTDryMyedQwBaspQY0/umBN/FoAOpbF
	9se1YM5sR6A5adUe0ZY0mHlX/YC8UsM=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-r9FKProwNPG9Not8yjYtxQ-1; Tue, 19 Dec 2023 20:43:26 -0500
X-MC-Unique: r9FKProwNPG9Not8yjYtxQ-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6d724647a7fso802141b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 17:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703036605; x=1703641405;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vjm4paNMTWlCFosQbpjmCNgYAmudj3J1TP/uI6GNhCE=;
        b=HNLhsaqpRYkzNjQpFjjcHJnKD2Ya0XTJksMg5A60s4byF2TIXrSS8aQvPu+i9qg/tX
         orfHk1I4iOqT1JMK6Q1ENEt35tSu0MFXslTdRA50ElNUgwTGf6z0I8F3WG7bTr3paqYj
         1J6CcaQlYz7wrLixNIF/Yizmc0qJDgUcQ5KHpo8vTkb7/O6CUImeBJoGpZYzKX3aDZyk
         1O04ucfka8FmKvjOKLmcFMSCMOz4nLIYgvRCyrxm0EJ2EfO0YXcNTCipHaV/pGlRsRhk
         bVnsYQLTo0yt5b3fqgUnQgQw60znZhXDl9EF7yG2K851Kw/+Ma24Fxbtp3ybzsOGk5A4
         i0vQ==
X-Gm-Message-State: AOJu0Yys46aNny4kBSUgfXOqka+fn7TlCbbypToftlBF6+zImOqVPqym
	VN6e8NYaZqS+W4FyXQ5zEM+w67HQvvGBsAVxFGAKy7E0pxfruVkwzL/oFkArqIdsLgSDdfKmkBi
	W+nESoWagReLCiy7G8R66PMNIdrTL
X-Received: by 2002:aa7:9315:0:b0:6d9:383b:d91a with SMTP id cz21-20020aa79315000000b006d9383bd91amr3546100pfb.1.1703036605328;
        Tue, 19 Dec 2023 17:43:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjZoAHkiq7HghdaqdRhR063HFqKc6lsGbuFn9XpaDzkEyDZOV38MaudRUa/eRKBEBtF5qDgg==
X-Received: by 2002:aa7:9315:0:b0:6d9:383b:d91a with SMTP id cz21-20020aa79315000000b006d9383bd91amr3546076pfb.1.1703036604916;
        Tue, 19 Dec 2023 17:43:24 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id fe16-20020a056a002f1000b006d3dd365a76sm6585222pfb.2.2023.12.19.17.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 17:43:24 -0800 (PST)
Date: Wed, 20 Dec 2023 09:43:13 +0800
From: Peter Xu <peterx@redhat.com>
To: James Houghton <jthoughton@google.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Matthew Wilcox <willy@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	linuxppc-dev@lists.ozlabs.org, Rik van Riel <riel@surriel.com>,
	linux-riscv@lists.infradead.org, Yang Shi <shy828301@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH 09/13] mm/gup: Cache *pudp in follow_pud_mask()
Message-ID: <ZYJGsUWpmF1P1Nd0@x1n>
References: <20231219075538.414708-1-peterx@redhat.com>
 <20231219075538.414708-10-peterx@redhat.com>
 <CADrL8HVu8=-DdAwXN_pO91g1A1+F7bKfBRpm6jYfYMk1QZcRFA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADrL8HVu8=-DdAwXN_pO91g1A1+F7bKfBRpm6jYfYMk1QZcRFA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_174329_998066_EC7103C5 
X-CRM114-Status: GOOD (  27.56  )
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

T24gVHVlLCBEZWMgMTksIDIwMjMgYXQgMTE6Mjg6NTRBTSAtMDUwMCwgSmFtZXMgSG91Z2h0b24g
d3JvdGU6Cj4gT24gVHVlLCBEZWMgMTksIDIwMjMgYXQgMjo1N+KAr0FNIDxwZXRlcnhAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogUGV0ZXIgWHUgPHBldGVyeEByZWRoYXQuY29tPgo+
ID4KPiA+IEludHJvZHVjZSAicHVkX3QgcHVkIiBpbiB0aGUgZnVuY3Rpb24sIHNvIHRoZSBjb2Rl
IHdvbid0IGRlcmVmZXJlbmNlICpwdWRwCj4gPiBtdWx0aXBsZSB0aW1lLiAgTm90IG9ubHkgYmVj
YXVzZSB0aGF0IGxvb2tzIGxlc3Mgc3RyYWlnaHRmb3J3YXJkLCBidXQgYWxzbwo+ID4gYmVjYXVz
ZSBpZiB0aGUgZGVyZWZlcmVuY2UgcmVhbGx5IGhhcHBlbmVkLCBpdCdzIG5vdCBjbGVhciB3aGV0
aGVyIHRoZXJlCj4gPiBjYW4gYmUgcmFjZSB0byBzZWUgZGlmZmVyZW50ICpwdWRwIHZhbHVlcyBp
ZiBpdCdzIGJlaW5nIG1vZGlmaWVkIGF0IHRoZQo+ID4gc2FtZSB0aW1lLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gIG1tL2d1
cC5jIHwgMTcgKysrKysrKysrLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9tbS9ndXAuYyBiL21t
L2d1cC5jCj4gPiBpbmRleCA2YzBkODJmYThjYzcuLjk3ZTg3YjdhMTVjMyAxMDA2NDQKPiA+IC0t
LSBhL21tL2d1cC5jCj4gPiArKysgYi9tbS9ndXAuYwo+ID4gQEAgLTc1MywyNiArNzUzLDI3IEBA
IHN0YXRpYyBzdHJ1Y3QgcGFnZSAqZm9sbG93X3B1ZF9tYXNrKHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
aW50IGZsYWdzLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGZvbGxvd19wYWdlX2NvbnRleHQgKmN0eCkKPiA+ICB7Cj4gPiAtICAgICAgIHB1ZF90ICpwdWQ7
Cj4gPiArICAgICAgIHB1ZF90ICpwdWRwLCBwdWQ7Cj4gPiAgICAgICAgIHNwaW5sb2NrX3QgKnB0
bDsKPiA+ICAgICAgICAgc3RydWN0IHBhZ2UgKnBhZ2U7Cj4gPiAgICAgICAgIHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tID0gdm1hLT52bV9tbTsKPiA+Cj4gPiAtICAgICAgIHB1ZCA9IHB1ZF9vZmZzZXQo
cDRkcCwgYWRkcmVzcyk7Cj4gPiAtICAgICAgIGlmIChwdWRfbm9uZSgqcHVkKSkKPiA+ICsgICAg
ICAgcHVkcCA9IHB1ZF9vZmZzZXQocDRkcCwgYWRkcmVzcyk7Cj4gPiArICAgICAgIHB1ZCA9ICpw
dWRwOwo+IAo+IEkgdGhpbmsgeW91IG1pZ2h0IHdhbnQgYSBSRUFEX09OQ0UoKSBvbiB0aGlzIHNv
IHRoYXQgdGhlIGNvbXBpbGVyCj4gZG9lc24ndCBhY3R1YWxseSByZWFkIHRoZSBwdWQgbXVsdGlw
bGUgdGltZXMuCgpNYWtlcyBzZW5zZS4gIEkgcHJvYmFibHkgb25seSBkaWQgdGhlICJzcGxpdCIg
cGFydCB3aGljaCBDaHJpc3RvcGgKcmVxdWVzdGVkLCB3aXRob3V0IHRoaW5raW5nIGZ1dGhlciB0
aGFuIHRoYXQuIDopCgo+IAo+ID4gKyAgICAgICBpZiAocHVkX25vbmUocHVkKSkKPiA+ICAgICAg
ICAgICAgICAgICByZXR1cm4gbm9fcGFnZV90YWJsZSh2bWEsIGZsYWdzLCBhZGRyZXNzKTsKPiA+
IC0gICAgICAgaWYgKHB1ZF9kZXZtYXAoKnB1ZCkpIHsKPiA+IC0gICAgICAgICAgICAgICBwdGwg
PSBwdWRfbG9jayhtbSwgcHVkKTsKPiA+IC0gICAgICAgICAgICAgICBwYWdlID0gZm9sbG93X2Rl
dm1hcF9wdWQodm1hLCBhZGRyZXNzLCBwdWQsIGZsYWdzLCAmY3R4LT5wZ21hcCk7Cj4gPiArICAg
ICAgIGlmIChwdWRfZGV2bWFwKHB1ZCkpIHsKPiA+ICsgICAgICAgICAgICAgICBwdGwgPSBwdWRf
bG9jayhtbSwgcHVkcCk7Cj4gPiArICAgICAgICAgICAgICAgcGFnZSA9IGZvbGxvd19kZXZtYXBf
cHVkKHZtYSwgYWRkcmVzcywgcHVkcCwgZmxhZ3MsICZjdHgtPnBnbWFwKTsKPiA+ICAgICAgICAg
ICAgICAgICBzcGluX3VubG9jayhwdGwpOwo+ID4gICAgICAgICAgICAgICAgIGlmIChwYWdlKQo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHBhZ2U7Cj4gPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIG5vX3BhZ2VfdGFibGUodm1hLCBmbGFncywgYWRkcmVzcyk7Cj4gPiAgICAgICAg
IH0KPiA+IC0gICAgICAgaWYgKHVubGlrZWx5KHB1ZF9iYWQoKnB1ZCkpKQo+ID4gKyAgICAgICBp
ZiAodW5saWtlbHkocHVkX2JhZChwdWQpKSkKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gbm9f
cGFnZV90YWJsZSh2bWEsIGZsYWdzLCBhZGRyZXNzKTsKPiAKPiBOb3QgeW91ciBjaGFuZ2UsIGJ1
dCByZWFkaW5nIHRoaXMsIGl0J3Mgbm90IGNsZWFyIHRvIG1lIHRoYXQKPiBgcHVkX3ByZXNlbnQo
KnB1ZHApYCAoYW5kIG5vbi1sZWFmKSB3b3VsZCBuZWNlc3NhcmlseSBiZSB0cnVlIGF0IHRoaXMK
PiBwb2ludCAtLSBsaWtlLCBJIHdvdWxkIHByZWZlciB0byBzZWUgYCFwdWRfcHJlc2VudChwdWQp
YCBpbnN0ZWFkIG9mCj4gYHB1ZF9iYWQoKWAuIFRoYW5rIHlvdSBmb3IgYWRkaW5nIHRoYXQgaW4g
dGhlIG5leHQgcGF0Y2guIDopCgpJIHRoaW5rIHRoZSBhc3N1bXB0aW9uIGhlcmUgaXMgaXQgaXMg
ZXhwZWN0ZWQgdG8gYmUgYSBkaXJlY3RvcnkgZW50cnkgd2hlbgpyZWFjaGluZyBoZXJlLCBhbmQg
Zm9yIGEgdmFsaWQgZGlyZWN0b3J5IGVudHJ5IHB1ZF9wcmVzZW50KCkgc2hvdWxkIGFsd2F5cwpy
ZXR1cm4gdHJ1ZSAoYSBzaWRlIG5vdGU6IHB1ZF9wcmVzZW50KCkgbWF5IG5vdCBtZWFuICJQUkVT
RU5UIGJpdCBzZXQiLCBzZWUKbTY4aydzIGltcGxlbWVudGF0aW9uIGZvciBleGFtcGxlKS4KClll
YWggSSBhZGRlZCB0aGF0IGluIHRoZSBuZXh0IHBhdGNoLCBteSBpbnRlbnRpb24gd2FzIHRvIGNo
ZWNrCiFwdWRfcHJlc2VudCgpIGZvciBhbGwgY2FzZXMgd2l0aG91dCB0aGUgbmVlZCB0byB0YWtl
IHBndGFibGUgbG9jaywgdGhvdWdoLgoKPiAKPiBGZWVsIGZyZWUgdG8gYWRkOgo+IAo+IEFja2Vk
LWJ5OiBKYW1lcyBIb3VnaHRvbiA8anRob3VnaHRvbkBnb29nbGUuY29tPgoKVGhhbmtzLAoKLS0g
ClBldGVyIFh1CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
