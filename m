Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868B7CAC5B0
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 01:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgMaxWa3ItYzQosq+RQIofUgQYOF5utHnqIMl/39UQM=; b=uK+RXfM211LWA7
	GEYzlNn1mI3Z90Lpoyrbot1OTVOHO+Utq1NzTmZv77YmKJ8Oy5cFZ6eHPzMUZdVB+UR7S2KzykUUK
	liQQxBFDDRWvpFsvJ6q58TtM+SXjlNPgr3HNsmytcvzzwq+EoNtC8wuaY4Ag04HjJLcHwUIfHDnkU
	7Cs4k4sIUwUmoVhFNjsdHOlurD9YQy20NDoFoCr1gAIi1UVJ8BYB//HprKav/DTsPNKYIPfPXwemM
	S5bYvhxEgo7eYed3mgNamFYZ3v9Mb0drzBQ/mv6pJssMaeRVUjN94adUyfVk/2UVwZbRDSLuVHjtb
	w/TSOlv7CisnlMBJPwuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ur6-0000000BWEp-1eJJ;
	Fri, 03 Oct 2025 01:45:08 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ur2-0000000BWE6-3QHZ
	for linux-riscv@lists.infradead.org;
	Fri, 03 Oct 2025 01:45:06 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4df2911ac5aso10273471cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Oct 2025 18:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759455903; x=1760060703; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dbZX0YDGEzlIF8RIsG89+OMY5rd2Shf5AWwsJNOua3s=;
        b=PPyBvSadncOsOjMJ3mpTx4Dl7rBLuLzoOVPmOXU/pP2noIZ8bCRgXOgWeA6QsUfJqm
         0LqEL/QogMw7humzpFQNbie6XAzvZVODu7PgnzOttmv2XCUBw8Ju2aTkW49ZYI1G66yU
         bUn6tsWYM6L24jH1CKfLOGf4hXsS8YktLq76bl9DKlK5xmPlUl4scThe67o6d+UfJwUP
         ubaOv+/A7ZWSTPKxdFOpMchwt1Ih0glA2GFtfo0pPomQSz2cRv3HSvPAMVpdCWF6velF
         QVqlH4nDka0i7P3f2DT07VJ3Aom/SBknFb6ZmjmIZtvbk3BrHYpshfS21nL1uZWmWLTF
         v0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759455903; x=1760060703;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dbZX0YDGEzlIF8RIsG89+OMY5rd2Shf5AWwsJNOua3s=;
        b=KRgbkeBohfMly8x9tJzX2ZW8QFWbyIjrL68K8oywpWfxE+gFiCoFwyJSfSdwawKK1P
         E618P6AtmEQXcTWMtxhCNT4ibVVR016kLl5PnF9nPYiVdmjGngKLZmXCnkkzFU2sns1p
         J3O0En9iK8Paupg4oPPM6LVNvRVL74MejTZehymzsWgAyzJ6EUVTjBthqfam076yABL7
         UxrBYDWZrh7xoOilD4N+9tmh6ZnD0K5nFHJv05JuMFb5lHSmc0dW9oxfj6PlQ5Eyl31Q
         TV5VbeBvESaYWZP5wnFdAIZ54V1vc4rnaZ/AxDJa5kWSZ12tmGzZMi8VT2vOXLQ8Qh5f
         GFHw==
X-Forwarded-Encrypted: i=1; AJvYcCURi8ZTwu1i8S0zcB9n5m/9T1jIZw1kvG25MbSYiUHsNaGBAymvOVSwpzrJXdRQVHRKyEcwxKno3ZF0gA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywry9FO4x12+la9eYzQw2tNgwlDXr75/5GF/uQe9EqncIkLRCjs
	Cqg8jFf+ieyh8Hrb1Gjt/1kKyP0/mfB2JyxnTP5zZzpG/MOqZKbe4PHP
X-Gm-Gg: ASbGncvSZ4zhqpAfLqEKba6mQzlY7gp1J+9GCRXeqrSYCDED58326MbcYRzgDurJdtq
	y5u887gYHlQmNJC4nQJG/1fXF1R+ycUiCcXI78sRCn232GFTi6Og4LqkxIX2Z+7FgFW2nBrW327
	nnoqwjXY2P1ZMVQh4njHqwSokMZ0OMGrX7265vKOMeK1IZJvyocGdtHaNUgW50+3Z/u4dQcbdNQ
	V+0pcYEHFGqeECcQ93GQpw1+2rI/EgGo/YAggF16VT7Xd4I7IX9ADF0AnY3UunIU0odsalXjiKb
	ITsLXC5GrL4cvvFbLOjgdpfinlQUFaSsTscqJBYYpEuinB9L4aF5Ptsntk3vrvi+anY88E6dALR
	3pCj508QoU5ZKUMF4JwNaqkqp61IxJWpxALpgDr7YwGuPjH8UM99Qmw==
X-Google-Smtp-Source: AGHT+IGC0q3AbzHcjA6VvVLioJ3pS8dU7d4NDAjw+ySW6Kf0eeIpzDpoeH8ZNTFGtaSizi9pWO9g4Q==
X-Received: by 2002:a05:622a:1989:b0:4df:8368:4adf with SMTP id d75a77b69052e-4e576a7ec79mr18266781cf.31.1759455903053;
        Thu, 02 Oct 2025 18:45:03 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8777a7e02e7sm309707585a.62.2025.10.02.18.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 18:45:02 -0700 (PDT)
Date: Thu, 2 Oct 2025 21:45:01 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc1
Message-ID: <aN8qnSfzFjdovsjn@yury>
References: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org>
 <066d70c7-b0a7-45e5-9337-17901bc95664@codethink.co.uk>
 <CAHk-=wgfpswvq0TypePyjv3dofO5YaUC_fSd_MjzY7jogCUnCg@mail.gmail.com>
 <CAHk-=wgYcOiFvsJzFb+HfB4n6Wj6zM5H5EghUMfpXSCzyQVSfA@mail.gmail.com>
 <20251001183321.GA2760@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251001183321.GA2760@quark>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_184504_868282_E531F1E6 
X-CRM114-Status: GOOD (  39.58  )
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

T24gV2VkLCBPY3QgMDEsIDIwMjUgYXQgMTE6MzM6MjFBTSAtMDcwMCwgRXJpYyBCaWdnZXJzIHdy
b3RlOgo+IE9uIFR1ZSwgU2VwIDMwLCAyMDI1IGF0IDA0OjUzOjI0UE0gLTA3MDAsIExpbnVzIFRv
cnZhbGRzIHdyb3RlOgo+ID4gT24gVHVlLCAzMCBTZXB0IDIwMjUgYXQgMDk6MDQsIExpbnVzIFRv
cnZhbGRzCj4gPiA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4gPgo+
ID4gPiBPaCBDaHJpc3QuIElzIHNvbWVib2R5IHNlcmlvdXNseSB3b3JraW5nIG9uIEJFIHN1cHBv
cnQgaW4gMjAyNT8KPiA+IAo+ID4gT2ssIEkganVzdCBnb29nbGVkIHRoaXMsIGFuZCBJIGFtIHB1
dHRpbmcgbXkgZm9vdCBkb3duOgo+ID4gCj4gPiAgV0UgQVJFIE5PVCBQUkVFTVBUSVZFTFkgU1VQ
UE9SVElORyBCSUctRU5ESUFOIE9OIFJJU0MtVgo+ID4gCj4gPiBUaGUgZG9jdW1lbnRlZCAicmVh
c29uaW5nIiBmb3IgdGhhdCBjcmF6aW5lc3MgaXMgdG9vIHN0dXBpZCBmb3Igd29yZHMsCj4gPiBi
dXQgc2luY2UgcmlzY3Yub3JnIGRpZCBwdXQgaXQgaW4gd29yZHMsIEknbGwganVzdCBxdW90ZSB0
aG9zZSB3b3Jkcwo+ID4gaGVyZToKPiA+IAo+ID4gICJUaGVyZSBhcmUgc3RpbGwgYXBwbGljYXRp
b25zIHdoZXJlIHRoZSB3YXkgZGF0YSBpcyBzdG9yZWQgbWF0dGVycywKPiA+IHN1Y2ggYXMgdGhl
IHByb3RvY29scyB0aGF0IG1vdmUgZGF0YSBhY3Jvc3MgdGhlIEludGVybmV0LCB3aGljaCBhcmUK
PiA+IGRlZmluZWQgYXMgYmlnLWVuZGlhbi4gU28gd2hlbiBhIGxpdHRsZS1lbmRpYW4gc3lzdGVt
IG5lZWRzIHRvIGluc3BlY3QKPiA+IG9yIG1vZGlmeSBhIG5ldHdvcmsgcGFja2V0LCBpdCBoYXMg
dG8gc3dhcCB0aGUgYmlnLWVuZGlhbiB2YWx1ZXMgdG8KPiA+IGxpdHRsZS1lbmRpYW4gYW5kIGJh
Y2ssIGEgcHJvY2VzcyB0aGF0IGNhbiB0YWtlIGFzIG1hbnkgYXMgMTAtMjAKPiA+IGluc3RydWN0
aW9ucyBvbiBhIFJJU0MtViB0YXJnZXQgd2hpY2ggZG9lc27igJl0IGltcGxlbWVudCB0aGUgWmJi
Cj4gPiBleHRlbnNpb24iCj4gPiAKPiA+IEluIG90aGVyIHdvcmRzLCBpdCBpcyBzdWdnZXN0aW5n
IHRoYXQgUklTQy1WIGFkZCBhIGJpZy1lbmRpYW4gbW9kZSBkdWUgdG8KPiA+IAo+ID4gIChhKSBp
bnRlcm5ldCBwcm90b2NvbHMgLSB3aGVyZSBieXRlIHN3YXBwaW5nIGlzIG5vdCBhbiBpc3N1ZQo+
ID4gCj4gPiAgKGIpIHVzaW5nICJzb21lIFJJU0MtViBpbXBsZW1lbnRhdGlvbnMgZG9uJ3QgZG8g
dGhlIGV4aXN0aW5nIFpiYgo+ID4gZXh0ZW5zaW9uIiBhcyBhbiBleGN1c2UKPiA+IAo+ID4gVGhp
cyBpcyBwbGFpbiBpbnNhbml0eS4gRmlyc3Qgb2ZmLCBldmVuIGlmIGJ5dGUgc3dhcHBpbmcgd2Fz
IGEgcmVhbAo+ID4gY29zdCBmb3IgbmV0d29ya2luZyAtIGl0J3Mgbm90LCB0aGUgcmVhbCBjb3N0
cyB0ZW5kIHRvIGJlIGFsbCBpbgo+ID4gbWVtb3J5IHN1YnN5c3RlbXMgLSBqdXN0IGltcGxlbWVu
dCB0aGUgZGFtbiBaYmIgZXh0ZW5zaW9uLgo+ID4gCj4gPiBEb24ndCBnbyAid2UncmUgdG9vIGlu
Y29tcGV0ZW50IHRvIGltcGxlbWVudCBaYmIsIHNvIHdlJ3JlIG5vdyBhc2tpbmcKPiA+IHRoYXQg
RVZFUllCT0RZIEVMU0UgZmVlbCB0aGUgcGFpbiBvZiBhIG11Y2ggKndvcnNlKiBleHRlbnNpb24g
YW5kCj4gPiBmcmFnbWVudGluZyBSSVNDLVYgZnVydGhlciIuCj4gPiAKPiA+IEknbSBob3Bpbmcg
dGhpcyBpcyBzb21lIEFwcmlsIGZvb2xzIGpva2UsIGJ1dCB0aGF0IHBhZ2UgaXMgZGF0ZWQKPiA+
ICJNYXJjaCAxMCwgMjAyNSIuIENsb3NlLCBidXQgbm90IGNsb3NlIGVub3VnaC4KPiA+IAo+ID4g
VGhpcyBpcyB0aGUga2luZCBvZiBzaWxseSBzdHVmZiB0aGF0IGp1c3QgbWFrZXMgUklTQy1WIGxv
b2sgYmFkLgo+ID4gCj4gPiBCZW4gLSBJJ20gYWZyYWlkIHRoYXQgdGhhdCBwYWdlIGhhcyAiZnVy
dGhlciByZWFkaW5nIiBwb2ludGluZyB0byBjb2RldGhpbmsuCj4gPiAKPiA+IEkgc2VlIHNvbWUg
Q09ORklHX0NQVV9CSUdfRU5ESUFOIGhhcyBhbHJlYWR5IG1hZGUgaXQgaW4sIGJ1dCB0aGlzCj4g
PiBuZWVkcyB0byBzdG9wLgo+ID4gCj4gPiBUaGUgbWFpbmxpbmUga2VybmVsIGlzIGZvciBtYWlu
bGluZSBkZXZlbG9wbWVudC4gTm90IGZvciByYW5kb20KPiA+IGV4cGVyaW1lbnRzIHRoYXQgbWFr
ZSB0aGUgd29ybGQgYSB3b3JzZSBwbGFjZS4KPiA+IAo+ID4gQW5kIHllcywgd2UncmUgb3BlbiBz
b3VyY2UsIGFuZCB0aGF0IHZlcnkgbXVjaCBtZWFucyB0aGF0IGFueWJvZHkgaXMKPiA+IG1vcmUg
dGhhbiB3ZWxjb21lIHRvIHRyeSB0byBwcm92ZSBtZSB3cm9uZy4KPiA+IAo+ID4gSWYgaXQgdHVy
bnMgb3V0IHRoYXQgQkUgUklTQy1WIGJlY29tZXMgYSByZWFsIHRoaW5nIHRoYXQgaXMgcmVsZXZh
bnQKPiA+IGFuZCBhY3R1YWxseSBmaW5kcyBhIHBsYWNlIGluIHRoZSBSSVNDLVYgZWNvc3lzdGVt
LCB0aGVuIF9vZl9jb3Vyc2VfCj4gPiB3ZSBzaG91bGQgc3VwcG9ydCBpdCBhdCB0aGF0IHBvaW50
IGluIHRoZSBtYWlubGluZSBrZXJuZWwuCj4gPiAKPiA+IEJ1dCBJIHJlYWxseSBkbyB0aGluayB0
aGF0IGl0IGFjdHVhbGx5IG1ha2VzIFJJU0MtViBvbmx5IHdvcnNlLCBhbmQKPiA+IHRoYXQgd2Ug
c2hvdWxkICpub3QqIGFjdGl2ZWx5IGhlbHAgdGhlIGZyYWdtZW50YXRpb24uCj4gCj4gKzEuICBQ
bGVhc2UsIGxldCdzIG5vdCBkbyBiaWcgZW5kaWFuIFJJU0MtViBrZXJuZWxzIDooCj4gCj4gVGhp
cyBtaXN0YWtlIHdhcyBtYWRlIGZvciBhcm02NCwgaXQncyBmaW5hbGx5IGdldHRpbmcgZml4ZWQu
Cj4gU2VlIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA5MTkxODQwMjUuMTU0MTYtMS13
aWxsQGtlcm5lbC5vcmcvCj4gTGV0J3Mgbm90IG1ha2UgdGhlIHNhbWUgbWlzdGFrZSBhZ2Fpbi4K
PiAKPiBBbmQgYXMgc29tZW9uZSB3aG8gd29ya3Mgb24gb3B0aW1pemVkIGNyeXB0byBhbmQgQ1JD
IGNvZGUsIHRoZSBhcm02NCBiaWcKPiBlbmRpYW4ga2VybmVsIHN1cHBvcnQgaGFzIGFsd2F5cyBi
ZWVuIHJlYWxseSBwcm9ibGVtYXRpYy4gIEl0J3MgcmFyZWx5Cj4gdGVzdGVkLCBhbmQgY29kZSB0
aGF0IHByb2R1Y2VzIGluY29ycmVjdCBvdXRwdXRzIG9uIGFybTY0IGJpZyBlbmRpYW4KPiByZWd1
bGFybHkgZ2V0cyBjb21taXR0ZWQgYW5kIHJlbGVhc2VkLiAgSXQgc29tZXRpbWVzIGdldHMgZml4
ZWQsIGJ1dCBub3QKPiBhbHdheXM7IGN1cnJlbnRseSB0aGUgYXJtNjQgU00zIGFuZCBTTTQgY29k
ZSBwcm9kdWNlcyBpbmNvcnJlY3Qgb3V0cHV0cwo+IG9uIGJpZyBlbmRpYW4gaW4gbWFpbmxpbmUu
ICAoSSBkb24ndCByZWFsbHkgY2FyZSBlbm91Z2ggdG8gZml4IGl0LCBUQkguKQo+IAo+IEkgcmVj
ZW50bHkgYWRkZWQgYXJtNjQgYmlnIGVuZGlhbiB0byBteSBvd24gdGVzdGluZyBtYXRyaXguICBC
dXQgSSBsb29rCj4gZm9yd2FyZCB0byBkcm9wcGluZyB0aGF0LCBhcyB3ZWxsIGFzICpub3QqIGhh
dmluZyB0byBzdGFydCB0ZXN0aW5nIG9uCj4gUklTQy1WIGJpZyBlbmRpYW4gdG9vLi4uCj4gCj4g
T2YgY291cnNlLCB0aGF0J3MganVzdCBvbmUgZXhhbXBsZSBmcm9tIG15IG93biBleHBlcmllbmNl
LiAgVGhlcmUncyBhCj4gbG90IG1vcmUgdGhhdCBDT05GSUdfQ1BVX0JJR19FTkRJQU4gY3JlYXRl
cyBwcm9ibGVtcyBmb3IuCgorMi4gSSBtYWludGFpbiBiaXRvcHMsIGFuZCBJIHJvdXRpbmVseSBo
YXZlIHRvIHRha2UgZW5kaWFuZXNzIGludG8KYWNjb3VudC4KCkkganVzdCByZWFsaXplZCB0aGF0
IEkgZGlkbid0IHJ1biBCRSBrZXJuZWxzIGZvciBhdCBsZWFzdCAzIHllYXJzLCBhbmQKZGlkbid0
IGFzayBteSBjb250cmlidXRvcnMgdG8gZG8gaXQgZm9yIGV2ZW4gbW9yZS4gVGhlIGxhc3QgQkUt
cmVsYXRlZApmaXggZm9yIGJpdG9wcyBJIGNhbiByZWNhbGwgaXMgZGF0ZWQgYmFjayB0byAyMDIw
OgoKODFjNGY0ZDkyNGQ1ZDAwOSAoImxpYjogZml4IGJpdG1hcF9wYXJzZSgpIG9uIDY0LWJpdCBi
aWcgZW5kaWFuIGFyY2hzIikuCgpOb2JvZHkgZXZlciByZXBvcnRlZCBCRSBidWdzIGZvciB0aGUg
bmV3IGNvZGUuCgpNYWludGVuYW5jZSBidXJkZW4gaXMgbm90IGp1c3QgYSB3b3JkLiBUaGluZ3Mg
YXJlIGdldHRpbmcgcmVhbGx5IHRyaWNreQp3aGVuIHlvdSBoYXZlIHRvIGtlZXAgQkUgY29tcGF0
aWJpbGl0eSBpbiBtaW5kLiBBbmQgaXQncyBhIHNwZWNpYWwKdG9ydHVyZSB0byBydW4gYW4gb2xk
IGFybSBvciBzcGFyYyBWTSBpbiBCRS0zMiBhZ2FpbnN0IG1vZGVybiBrZXJuZWxzLgoKQnV0IHdo
YXQgcmVhbGx5IGltcG9ydGFudCBpcyB0aGF0IGRyb3BwaW5nIEJFIHN1cHBvcnQgd2lsbCBtYWtl
IGNvZGViYXNlCm92ZXJhbGwgY2xlYW5lciBhbmQgYmV0dGVyLgoKVGhhbmtzLApZdXJ5CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
