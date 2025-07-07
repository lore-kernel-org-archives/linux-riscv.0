Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F76C8303C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 15:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5QO+MTUFsGCEaghmhY1JS5BYMyAm4P3ZpPUtNtD9+c=; b=ZHA6cyX8KEVT/z
	Aohl6H1VYXBVXIzB63MVhFNsHldhW+TvBGCPx5uMmvdKl505Qp8vV+YimdwG7NxcOUnW2jyZ16ZHN
	kQxGjwPloD17jKiNssvQw2QccyvGRv1sM8Y8M+SQdRFWZDjDACmLxwZbmJE1j5rTQ6y6GwNkwDuJc
	oN9n8jdNa4v2Lzn1kYAjdJ3WuIzkHoo08G0SA3gCI0jUYlCBTWo9PvLflQgqiGroBhy13KU7c3rdf
	nNNdhlrlHYhJBWk/3LxU3XK3VgvwQIAIUAGxr2m2pt2F07ZcdmafpS1fieZg+Vf1s+g1Tvr/s0E7X
	XWbaVaSgBpZ49AAhiw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYo8T-00000002vey-3cjY;
	Mon, 07 Jul 2025 15:52:05 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnxv-00000002tpq-2d2S;
	Mon, 07 Jul 2025 15:41:12 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-87ed676e631so2403271241.3;
        Mon, 07 Jul 2025 08:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751902869; x=1752507669; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOso/rpbJ/NgC8eSTkPXsXfGalwkSd1v9wHI3jcpdtU=;
        b=Jgm4Nqj6/WgGo0B4O234Sks2btE697LfmE0xSP8zaXWM5BsZRwRfwkRYxSVZeamYtb
         u0SJH7bLXJ5p15kwTqHeLQw9dldiIXvzRyLDy8nSyZcaPJ/0vj6mMuPwDwyxMtSIdoDT
         CSV847qO4m9cwZl4dRxHMAGmYuJgu7Gvj/EfXqBRfw0M8K4IIOzj6m+KhQqE72zgQbzE
         09mPomNyKg/d3Wb7S9iRujFbrrYST1RHaEVKWzW+MwqtlzUqsKoyNfljVM6++c9pko1c
         B7rY3GJnJtNjQsslJOD7QIhOSVFZAqIvAQqpJDlclodKPmsiVChG2EsE0vex2Edg8Zlm
         oihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751902869; x=1752507669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOso/rpbJ/NgC8eSTkPXsXfGalwkSd1v9wHI3jcpdtU=;
        b=iwBfhBKMBjCTrzLa5h+0Ui/fXLnUhxIyyFQpgAf7OFMvpza20OrQ6ThVNgnjmDYvk5
         XUyBuPbswiM19mcpE4JArmr0dSOPada4svhX8zi3lePlZxLmD+TnXBGR5/LZ3gTR7P/w
         hgtUoGbkgJK+ipeJOdLGbQxk8+JirH55bXA0BMUmHzf9WXGOrc+gJO6Rg2n5AA2MjuSq
         uxMpZtSJ8CRpQVFPrVlEZk7caOBlduTJ4T8Bx8vMaJJPiBguV2MuRhmJ8BAboiSjj4fb
         FvDZRkrfZxa8B/9PPSNhrEXAb00mxngAvWhLNvfmkfb8pJyIJqqeD1LC5PaknpbTeTqv
         +Geg==
X-Forwarded-Encrypted: i=1; AJvYcCUZb4h7IvyLwmO64FhqnqKNnCA4s+WKgLD0cTXS3ogX9WhdlFE0KQxyKYuhX/zGLZM1rU152eBuo3HuPz0=@lists.infradead.org, AJvYcCWkjYCanCTsuOMxG4E2P/VwQUKpX5pLKMOOtrEXdv3j0+zJUWFPDecsQZ3o4u3MHoQysJH+RukPBCVM3NPRuTi8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2igQs41bBYj3nxIBjAsVFX0F3KM0zESL/i2n4ZGDaZPI3sU9x
	yB0OJybc2YQitlx9roN2FoeXjsMujzb2l9Zfgyv0h/ZVDRvrNMungMDeY6oZcvCesI58WuF2YZJ
	tyrLxmWArKCFn/vbHOWot06HbvV88zpM=
X-Gm-Gg: ASbGncvL1z6v1M/tizBvV/J4qAl3KZyb8WOIOCVV2iZnwD9S7J+UQVmhA22vooqB/32
	5jFqMguAh5kx9hOqyDNYHxgZNl6gOIsylX1N0k2RkUSRecTWo8O1/Fy8TdnwFvGKMzowq1I/G5z
	KCPY2eW3pYlVzhzTD7Danm6bPWlEnOLRiO2P5Vkg7l7K0A
X-Google-Smtp-Source: AGHT+IGSN1O8lQpDTPtqxgti1UrH4RQigSLZXKTO63RCc9Ii3DWxoJb0zhIToaSJqmxiqFJzc6TxB9dgjkrGQ0NAAJA=
X-Received: by 2002:a05:6102:5813:b0:4e7:dbd2:4605 with SMTP id
 ada2fe7eead31-4f305bbfb6bmr5513792137.24.1751902868878; Mon, 07 Jul 2025
 08:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250701143100.6970-1-lance.yang@linux.dev> <aGtdwn0bLlO2FzZ6@harry>
In-Reply-To: <aGtdwn0bLlO2FzZ6@harry>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 7 Jul 2025 23:40:55 +0800
X-Gm-Features: Ac12FXzNubUaYli6QAPDLGtouYMN2VMWCTFnQ5iaenP8VAQuo6CN289JAgNG3X4
Message-ID: <CAGsJ_4yk5FPfieyRyzLwrgHu2CYADOtZRZKa0ORo=y4nYd-KrQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org, david@redhat.com, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, 
	riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	mingzhe.yang@ly.com, stable@vger.kernel.org, 
	Lance Yang <lance.yang@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_084111_667381_64E8AFEB 
X-CRM114-Status: GOOD (  28.17  )
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

T24gTW9uLCBKdWwgNywgMjAyNSBhdCAxOjQw4oCvUE0gSGFycnkgWW9vIDxoYXJyeS55b29Ab3Jh
Y2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1bCAwMSwgMjAyNSBhdCAxMDozMTowMFBNICsw
ODAwLCBMYW5jZSBZYW5nIHdyb3RlOgo+ID4gRnJvbTogTGFuY2UgWWFuZyA8bGFuY2UueWFuZ0Bs
aW51eC5kZXY+Cj4gPgo+ID4gQXMgcG9pbnRlZCBvdXQgYnkgRGF2aWRbMV0sIHRoZSBiYXRjaGVk
IHVubWFwIGxvZ2ljIGluIHRyeV90b191bm1hcF9vbmUoKQo+ID4gbWF5IHJlYWQgcGFzdCB0aGUg
ZW5kIG9mIGEgUFRFIHRhYmxlIHdoZW4gYSBsYXJnZSBmb2xpbydzIFBURSBtYXBwaW5ncwo+ID4g
YXJlIG5vdCBmdWxseSBjb250YWluZWQgd2l0aGluIGEgc2luZ2xlIHBhZ2UgdGFibGUuCj4gPgo+
ID4gV2hpbGUgdGhpcyBzY2VuYXJpbyBtaWdodCBiZSByYXJlLCBhbiBpc3N1ZSB0cmlnZ2VyYWJs
ZSBmcm9tIHVzZXJzcGFjZSBtdXN0Cj4gPiBiZSBmaXhlZCByZWdhcmRsZXNzIG9mIGl0cyBsaWtl
bGlob29kLiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBvdXQtb2YtYm91bmRzCj4gPiBhY2Nlc3MgYnkg
cmVmYWN0b3JpbmcgdGhlIGxvZ2ljIGludG8gYSBuZXcgaGVscGVyLCBmb2xpb191bm1hcF9wdGVf
YmF0Y2goKS4KPiA+Cj4gPiBUaGUgbmV3IGhlbHBlciBjb3JyZWN0bHkgY2FsY3VsYXRlcyB0aGUg
c2FmZSBiYXRjaCBzaXplIGJ5IGNhcHBpbmcgdGhlIHNjYW4KPiA+IGF0IGJvdGggdGhlIFZNQSBh
bmQgUE1EIGJvdW5kYXJpZXMuIFRvIHNpbXBsaWZ5IHRoZSBjb2RlLCBpdCBhbHNvIHN1cHBvcnRz
Cj4gPiBwYXJ0aWFsIGJhdGNoaW5nIChpLmUuLCBhbnkgbnVtYmVyIG9mIHBhZ2VzIGZyb20gMSB1
cCB0byB0aGUgY2FsY3VsYXRlZAo+ID4gc2FmZSBtYXhpbXVtKSwgYXMgdGhlcmUgaXMgbm8gc3Ry
b25nIHJlYXNvbiB0byBzcGVjaWFsLWNhc2UgZm9yIGZ1bGx5Cj4gPiBtYXBwZWQgZm9saW9zLgo+
ID4KPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS9hNjk0Mzk4Yy05ZjAz
LTQ3MzctODFiOS03ZTQ5Yzg1N2ZjYmVAcmVkaGF0LmNvbQo+ID4KPiA+IENjOiA8c3RhYmxlQHZn
ZXIua2VybmVsLm9yZz4KPiA+IFJlcG9ydGVkLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRA
cmVkaGF0LmNvbT4KPiA+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbW0v
YTY5NDM5OGMtOWYwMy00NzM3LTgxYjktN2U0OWM4NTdmY2JlQHJlZGhhdC5jb20KPiA+IEZpeGVz
OiAzNTRkZmZkMjk1NzUgKCJtbTogc3VwcG9ydCBiYXRjaGVkIHVubWFwIGZvciBsYXp5ZnJlZSBs
YXJnZSBmb2xpb3MgZHVyaW5nIHJlY2xhbWF0aW9uIikKPiA+IFN1Z2dlc3RlZC1ieTogQmFycnkg
U29uZyA8YmFvaHVhQGtlcm5lbC5vcmc+Cj4gPiBBY2tlZC1ieTogQmFycnkgU29uZyA8YmFvaHVh
QGtlcm5lbC5vcmc+Cj4gPiBSZXZpZXdlZC1ieTogTG9yZW56byBTdG9ha2VzIDxsb3JlbnpvLnN0
b2FrZXNAb3JhY2xlLmNvbT4KPiA+IEFja2VkLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRA
cmVkaGF0LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IExhbmNlIFlhbmcgPGxhbmNlLnlhbmdAbGlu
dXguZGV2Pgo+ID4gLS0tCj4KPiBMR1RNLAo+IFJldmlld2VkLWJ5OiBIYXJyeSBZb28gPGhhcnJ5
Lnlvb0BvcmFjbGUuY29tPgo+Cj4gV2l0aCBhIG1pbm9yIGNvbW1lbnQgYmVsb3cuCj4KPiA+IGRp
ZmYgLS1naXQgYS9tbS9ybWFwLmMgYi9tbS9ybWFwLmMKPiA+IGluZGV4IGZiNjNkOTI1NmYwOS4u
MTMyMGI4OGZhYjc0IDEwMDY0NAo+ID4gLS0tIGEvbW0vcm1hcC5jCj4gPiArKysgYi9tbS9ybWFw
LmMKPiA+IEBAIC0yMjA2LDEzICsyMjEzLDE2IEBAIHN0YXRpYyBib29sIHRyeV90b191bm1hcF9v
bmUoc3RydWN0IGZvbGlvICpmb2xpbywgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgaHVnZXRsYl9yZW1vdmVfcm1hcChmb2xpbyk7Cj4gPiAgICAg
ICAgICAgICAgIH0gZWxzZSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgZm9saW9fcmVtb3Zl
X3JtYXBfcHRlcyhmb2xpbywgc3VicGFnZSwgbnJfcGFnZXMsIHZtYSk7Cj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgZm9saW9fcmVmX3N1Yihmb2xpbywgbnJfcGFnZXMgLSAxKTsKPiA+ICAgICAg
ICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICBpZiAodm1hLT52bV9mbGFncyAmIFZNX0xPQ0tF
RCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICBtbG9ja19kcmFpbl9sb2NhbCgpOwo+ID4gLSAg
ICAgICAgICAgICBmb2xpb19wdXQoZm9saW8pOwo+ID4gLSAgICAgICAgICAgICAvKiBXZSBoYXZl
IGFscmVhZHkgYmF0Y2hlZCB0aGUgZW50aXJlIGZvbGlvICovCj4gPiAtICAgICAgICAgICAgIGlm
IChucl9wYWdlcyA+IDEpCj4gPiArICAgICAgICAgICAgIGZvbGlvX3B1dF9yZWZzKGZvbGlvLCBu
cl9wYWdlcyk7Cj4gPiArCj4gPiArICAgICAgICAgICAgIC8qCj4gPiArICAgICAgICAgICAgICAq
IElmIHdlIGFyZSBzdXJlIHRoYXQgd2UgYmF0Y2hlZCB0aGUgZW50aXJlIGZvbGlvIGFuZCBjbGVh
cmVkCj4gPiArICAgICAgICAgICAgICAqIGFsbCBQVEVzLCB3ZSBjYW4ganVzdCBvcHRpbWl6ZSBh
bmQgc3RvcCByaWdodCBoZXJlLgo+ID4gKyAgICAgICAgICAgICAgKi8KPiA+ICsgICAgICAgICAg
ICAgaWYgKG5yX3BhZ2VzID09IGZvbGlvX25yX3BhZ2VzKGZvbGlvKSkKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICBnb3RvIHdhbGtfZG9uZTsKPgo+IEp1c3QgYSBtaW5vciBjb21tZW50Lgo+Cj4g
V2Ugc2hvdWxkIHByb2JhYmx5IHRlYWNoaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbW0v
NWRiNmZiNGMtMDc5ZC00MjM3LTgwYjMtNjM3NTY1NDU3ZjM5QHJlZGhhdC5jb20vKCkgdG8gc2tp
cCBucl9wYWdlcyBwYWdlcywKPiBvciBqdXN0IHJlbHkgb24gbmV4dF9wdGU6IGRvIHsgLi4uIH0g
d2hpbGUgKHB0ZV9ub25lKHB0ZXBfZ2V0KHB2bXctPnB0ZSkpKQo+IGxvb3AgaW4gcGFnZV92bWFf
bWFwcGVkX3dhbGsoKSB0byBza2lwIHRob3NlIHB0ZXM/Cj4KPiBUYWtpbmcgZGlmZmVyZW50IHBh
dGhzIGRlcGVuZGluZyBvbiAobnJfcGFnZXMgPT0gZm9saW9fbnJfcGFnZXMoZm9saW8pKQo+IGRv
ZXNuJ3Qgc2VlbSBzZW5zaWJsZS4KCkhpIEhhcnJ5LAoKSSBiZWxpZXZlIHdlJ3ZlIGFscmVhZHkg
aGFkIHRoaXMgZGlzY3Vzc2lvbiBoZXJlOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1t
bS81ZGI2ZmI0Yy0wNzlkLTQyMzctODBiMy02Mzc1NjU0NTdmMzlAcmVkaGF0LmNvbS8KCk15IG1h
aW4gcG9pbnQgaXMgdGhhdCBucl9wYWdlcyA9IGZvbGlvX25yX3BhZ2VzKGZvbGlvKSBpcyB0aGUK
dHlwaWNhbC9jb21tb24gY2FzZS4KQWxzbywgbW9kaWZ5aW5nIHBhZ2Vfdm1hX21hcHBlZF93YWxr
KCkgZmVlbHMgbGlrZSBhIGxheWVyaW5nIHZpb2xhdGlvbi4KCj4KPiA+ICAgICAgICAgICAgICAg
Y29udGludWU7Cj4KPiAtLQo+IENoZWVycywKPiBIYXJyeSAvIEh5ZW9uZ2dvbgoKVGhhbmtzCkJh
cnJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
