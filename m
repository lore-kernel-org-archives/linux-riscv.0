Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17FCC6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 03:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6jpVT8cwnqLM/c0abTtUNd6XqpA/JabmuAsPdTGJ6fU=; b=KoFNH/27LlQQ1w
	vBs5dW/90bUV34EDxWxTIy0xLIMnaNEbJqPRzS6/mPJTfyyjP4xvfw0kHw93yuEq72/K0+W6y4CUA
	N6BCtkHWHCPUa5cjJLFMetDSUjXTq7f3nVLZLINiaQIP3FyovQucSROHgo1xJXgPlt0zc+z46QxwN
	sEoNgD8AFnZy9Qt2ik6w1TXIaRyJMkRQIP6h+pcf2JBi/a2yR2VemJtoT8KkLmXoySbFnlvtOkxtH
	tG0n6y2fFFgxVKZxA81N45AHQdXdAMs/7PTHUot82EpgOjcs/wS4yZjYsyAoVIBtycJxJLy9YJHIl
	D8TU5JNMoVnQn/jIFCtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pr9Sa-0006Ui-1z;
	Tue, 25 Apr 2023 03:35:20 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pr9SX-0006UI-1d
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 03:35:18 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2a8eb8db083so50134141fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Apr 2023 20:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1682393712; x=1684985712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZajOeItRbGyDHmeNa1jl0j4Yjv3SZop9mHii5ZgaCSk=;
        b=bQpdajeHeUAIcnjB4oZi++8FeA1HVp6KUYQbcAGAbpWZzwWyqCk+LthAPm+ya7fbNP
         rMNsm5xRvx5ekSlYXjg2sGLcI49Dn3NiZIhsbpF/LrJnPFKkpxtapJK2Epcr8Mi0AwiB
         rvKioNogfPhuMIag0de9z+6u5gx2VWskJTH2i7BAyUJuliKboSK7AdPNrtT9QCxNsBze
         hbnLHG5ukaG0pDIdIYWJzjMRFKyBAkxzmGSfi6PPvPidtMMpnjFWygl9LzSjHCGNBXKm
         I3Vjwh+5lFnXkbMzi2a4ZiAskynQrBPMgUz8NsHCCnCugy1WNwj2OWk2KfVGcYFJzh10
         8wJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682393712; x=1684985712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZajOeItRbGyDHmeNa1jl0j4Yjv3SZop9mHii5ZgaCSk=;
        b=kJue8sFB9yYmaNGr7KVO4Tr/Kk70TVCM59tNowyQ7cOR+5QDXW7OAbi+4ACrwgS0iC
         YJJlyCNwKwM/M82LT3lA6+1C0uJlO5ZPBG+PLj6KNSyMLbpggBahKUepItS8GsPfyaQs
         veD2qYuloZKjmPMwcPHDNWb1YNgLdZecBnll2iecVHLH3h6zBWjJIGogM1eg8zBUBVwp
         EhuCaG20Zcv6L3tOHCxw4mzyJoIPqOI8/XCyTg56PG80AU+55lXDFJmL9glOYyp/Huq3
         hg06/ubibuGmdBUFkFfiY5/af7YfrQrjWnFl9AD1ZIVZHu6gHFwU00PTbScIY2PanRqu
         B5Zg==
X-Gm-Message-State: AAQBX9cfC4N3ZUJXoPYt5JKSxjmZQWOC4igQZlr2ZKHAlS99Nk1CJ7UU
	0qX9nEob4/G5q2VpTnoW3kfPGnZskWhxLSMykC+k
X-Google-Smtp-Source: AKy350bYJNf9gosZPhKQjBKy98SDh3qbBrboyomn9Zg8gwLV8ph8Z0A4zVKI5dC8b74IFeU5t3zbquhpFmcAK0lM6YU=
X-Received: by 2002:a2e:9245:0:b0:2a8:c75c:96cb with SMTP id
 v5-20020a2e9245000000b002a8c75c96cbmr3141917ljg.1.1682393712621; Mon, 24 Apr
 2023 20:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230421075111.1391952-1-woodrow.shen@sifive.com> <CAHVXubhW2=TQKYgaBFWeLKPcG4mgk08zk3kceK-53BdobE=Eeg@mail.gmail.com>
In-Reply-To: <CAHVXubhW2=TQKYgaBFWeLKPcG4mgk08zk3kceK-53BdobE=Eeg@mail.gmail.com>
From: Woodrow Shen <woodrow.shen@sifive.com>
Date: Tue, 25 Apr 2023 11:35:01 +0800
Message-ID: <CABquHAQfL6stadEA6jUwOYLm9PDvpNw6V5fVLwVS43DsQL4kUw@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: mm: Ensure prot of VM_WRITE and VM_EXEC must
 be readable
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, 
	linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, 
	greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_203517_605001_A0A5AC38 
X-CRM114-Status: GOOD (  23.06  )
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

SGkgQWxleGFuZHJlLAoKT24gTW9uLCBBcHIgMjQsIDIwMjMgYXQgMzo0N+KAr1BNIEFsZXhhbmRy
ZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBIaSBXb29kcm93LAo+
Cj4gT24gRnJpLCBBcHIgMjEsIDIwMjMgYXQgOTo1MeKAr0FNIFdvb2Ryb3cgU2hlbiA8d29vZHJv
dy5zaGVuQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206IEhzaWVoLVRzZW5nIFNoZW4g
PHdvb2Ryb3cuc2hlbkBzaWZpdmUuY29tPgo+ID4KPiA+IFRoZSBjb21taXQgOGFlYjdiMTdmMDRl
ICgiUklTQy1WOiBNYWtlIG1tYXAoKSB3aXRoIFBST1RfV1JJVEUgaW1wbHkgUFJPVF9SRUFEIikK
PiA+IGFsbG93cyByaXNjdiB0byB1c2UgbW1hcCB3aXRoIFBST1RfV1JJVEUgb25seSwgYW5kIG1l
YW53aGlsZSBtbWFwIHdpdGggdyt4IGlzCj4gPiBhbHNvIHBlcm1pdHRlZC4gSG93ZXZlciwgd2hl
biB1c2Vyc3BhY2UgdHJpZXMgdG8gYWNjZXNzIHRoaXMgcGFnZSB3aXRoCj4gPiBQUk9UX1dSSVRF
fFBST1RfRVhFQywgd2hpY2ggY2F1c2VzIGluZmluaXRlIGxvb3AgYXQgbG9hZCBwYWdlIGZhdWx0
IGFzIHdlbGwgYXMKPiA+IGl0IHRyaWdnZXJzIHNvZnQgbG9ja3VwLiBBY2NvcmRpbmcgdG8gcmlz
Y3YgcHJpdmlsZWdlZCBzcGVjLAo+ID4gIldyaXRhYmxlIHBhZ2VzIG11c3QgYWxzbyBiZSBtYXJr
ZWQgcmVhZGFibGUiLiBUaGUgZml4IHRvIGRyb3AgdGhlCj4gPiBgUEFHRV9DT1BZX0VYRUNgIGFu
ZCB0aGVuIGBQQUdFX0NPUFlfUkVBRF9FWEVDYCBzaG91bGQgYmUganVzdCB1c2VkIGluc3RlYWQu
Cj4gPiBUaGlzIGFsaWducyB0aGUgb3RoZXIgYXJjaGVzIChpLmUgYXJtNjQpIGZvciBwcm90ZWN0
aW9uX21hcC4KPiA+Cj4gPiBGaXhlczogOGFlYjdiMTdmMDRlICgiUklTQy1WOiBNYWtlIG1tYXAo
KSB3aXRoIFBST1RfV1JJVEUgaW1wbHkgUFJPVF9SRUFEIikKPiA+IFNpZ25lZC1vZmYtYnk6IEhz
aWVoLVRzZW5nIFNoZW4gPHdvb2Ryb3cuc2hlbkBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAxIC0KPiA+ICBhcmNoL3Jpc2N2L21tL2lu
aXQuYyAgICAgICAgICAgICB8IDIgKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiBp
bmRleCBmNjQxODM3Y2NmMzEuLmJiMWUwNTM2NzczOSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BndGFibGUuaAo+ID4gQEAgLTE2NSw3ICsxNjUsNiBAQCBleHRlcm4gc3RydWN0IHB0X2FsbG9j
X29wcyBwdF9vcHMgX19pbml0ZGF0YTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgX1BBR0VfRVhFQyB8IF9QQUdFX1dSSVRFKQo+ID4KPiA+ICAjZGVmaW5lIFBB
R0VfQ09QWSAgICAgICAgICAgICAgUEFHRV9SRUFECj4gPiAtI2RlZmluZSBQQUdFX0NPUFlfRVhF
QyAgICAgICAgIFBBR0VfRVhFQwo+ID4gICNkZWZpbmUgUEFHRV9DT1BZX1JFQURfRVhFQyAgICBQ
QUdFX1JFQURfRVhFQwo+ID4gICNkZWZpbmUgUEFHRV9TSEFSRUQgICAgICAgICAgICBQQUdFX1dS
SVRFCj4gPiAgI2RlZmluZSBQQUdFX1NIQVJFRF9FWEVDICAgICAgIFBBR0VfV1JJVEVfRVhFQwo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0
LmMKPiA+IGluZGV4IDBmMTRmNGE4ZDE3OS4uOGI4YzZhZDg1ZmRiIDEwMDY0NAo+ID4gLS0tIGEv
YXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiBA
QCAtMjg1LDcgKzI4NSw3IEBAIHN0YXRpYyBjb25zdCBwZ3Byb3RfdCBwcm90ZWN0aW9uX21hcFsx
Nl0gPSB7Cj4gPiAgICAgICAgIFtWTV9XUklURSB8IFZNX1JFQURdICAgICAgICAgICAgICAgICAg
ICAgICAgICAgID0gUEFHRV9DT1BZLAo+ID4gICAgICAgICBbVk1fRVhFQ10gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA9IFBBR0VfRVhFQywKPiA+ICAgICAgICAgW1ZNX0VY
RUMgfCBWTV9SRUFEXSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSBQQUdFX1JFQURfRVhF
QywKPiA+IC0gICAgICAgW1ZNX0VYRUMgfCBWTV9XUklURV0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgPSBQQUdFX0NPUFlfRVhFQywKPiA+ICsgICAgICAgW1ZNX0VYRUMgfCBWTV9XUklURV0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPSBQQUdFX0NPUFlfUkVBRF9FWEVDLAo+ID4gICAg
ICAgICBbVk1fRVhFQyB8IFZNX1dSSVRFIHwgVk1fUkVBRF0gICAgICAgICAgICAgICAgICA9IFBB
R0VfQ09QWV9SRUFEX0VYRUMsCj4gPiAgICAgICAgIFtWTV9TSEFSRURdICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgID0gUEFHRV9OT05FLAo+ID4gICAgICAgICBbVk1fU0hBUkVE
IHwgVk1fUkVBRF0gICAgICAgICAgICAgICAgICAgICAgICAgICA9IFBBR0VfUkVBRCwKPiA+IC0t
Cj4gPiAyLjM0LjEKPiA+Cj4KPiBUaGlzIGxvb2tzIHNhbmUsIGFuZCBpdCBhbGlnbnMgdGhlIGJl
aGF2aW91ciB3aXRoIFZNX1NIQVJFRCB8IFZNX0VYRUMKPiB8IFZNX1dSSVRFIHdoaWNoIGltcGxp
ZXMgcmVhZC4gT25lIG5pdCB0aG91Z2g6IHNpbmNlIFBBR0VfQ09QWV9FWEVDIGlzCj4gbm90IHVz
ZWQgYW55bW9yZSwgSSB3b3VsZCByZW5hbWUgUEFHRV9DT1BZX1JFQURfRVhFQyBpbnRvCj4gUEFH
RV9DT1BZX0VYRUMgYW5kIHJlbW92ZSBQQUdFX0NPUFlfUkVBRF9FWEVDIChzbyB0aGF0IFBBR0Vf
Q09QWV9FWEVDCj4gaXMgdGhlIGVxdWl2YWxlbnQgb2YgUEFHRV9TSEFSRURfRVhFQykuCj4KPiBT
byB5b3UgY2FuIGFkZCBpbiB5b3VyIG5leHQgdmVyc2lvbjoKClRoYW5rcyBmb3IgdGhlIGFkdmlj
ZSwgSSdsbCB1cGRhdGUgdGhlIG5leHQgdmVyc2lvbiBzb29uLgpXb29kcm93Cgo+Cj4KPiBSZXZp
ZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+Cj4gVGhh
bmtzIQo+Cj4gQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
