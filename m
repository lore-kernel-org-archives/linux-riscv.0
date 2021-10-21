Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1507FC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 10:51:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C54A661037
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 10:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C54A661037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bluespec.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5CIe5Pgp45OwbvcUkzSq21V4ahh4Kmg90fnLYy2RJM=; b=ZHvMub2uTuhK51
	QB0W1IJChLg+nDa8ZCT5DHJpTUlJpOOPh2Fyve5xDrse8RyJP5PswcLBxrY0Ueucw4wl02im9AKqM
	B3X3d0hDRokSzXBPPEu/2QpMDCQOM82l1nxJR0TwFWUEK7uP6nHEhsu0/dPASVXYbhnx5JnUZDUv1
	ovi/VXVX7ABaH8fYUthUZKpk7rxeFiAI0K+6o2iTzCyg3oPsYJF1UECzev13ICVZ2xAGKxeHOdhlp
	h5BvFvdIiE24mk8cxWAV10acp6ysODiBEWESxDBjI7y/Oov8mD9DHx+gFrWPpB3TXqPQwNUxfdOCa
	NPoth+mbGSs844KkS1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdVeu-007Hue-IB; Thu, 21 Oct 2021 10:50:52 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdVeo-007Hqv-Ds
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 10:50:50 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id j12so132393qvk.12
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 03:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bluespec-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=bqX9x6YQncATiAls6ExqHqgaKBd6ejlt9Ox6O0pKsds=;
 b=GnJdYMoPQBtPdVKg4E2m6psjbP+1RCogmKs0+tMbRlcxxsm7DA+Jz2d85FuKmD/wyj
 Qm2q2KC1a8SvL53VfIEEzfOfz6fI6IZlJ1k2FfqGF8Au1OGUT90/WaeZeIGZDmMYP+OE
 o/JTsXouY1yhbVKDvELifUmFd22OBC5Q8I0ms5q90VkXUz9wZyY+rrDnfBpG9o7jrfMy
 0j5mnGh0KIZiueLowVvBDysTplvJ1VCi/4tvgyL9xTi6b1PZHifcLEyySNI5eiBhhW1c
 W531viMMseW7NNogYJqrGTmFVrCCwcPQ3HTtE49XJLKQLqXRSOUmiZuw8QRolOuZzpkD
 NyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=bqX9x6YQncATiAls6ExqHqgaKBd6ejlt9Ox6O0pKsds=;
 b=V+jMDdQMBcmbg5LS31INdRIgmZIYzjbqajXHryhqUauJBnUESvUQXn+6lnS2H9FNu8
 +24Y21z0BiLPE+3AOjnYRhsDqZsJ9NAis6zVUHYOurVLSPxGD1Ei++Vkf2uAm5oyrujs
 XM3q7vzm6azvW2tAixL6TnQdbeoFmd+YC0pKTIc7yoLUZ6o88lQ3dejr5Y2R5yWSwnhh
 1S16suC6swyjb/zuQmef1d9geulkfkldPG2tLy2CaCcNTZIVlomJlqRih/sLrLLRamjq
 UTmZpU12e+isOm78dTPtVxpjaflViUHVnZrDaD25IhV9JYjuKd1r8fNZJk7g2ax8+xZE
 UThw==
X-Gm-Message-State: AOAM533tMu+xOO5VFCWw4yllbw0FxAvHRwzSAi67x4ak0bng2tR8gh9k
 8Zeyf8S6GCHmKe7gbG4bwvxy
X-Google-Smtp-Source: ABdhPJzCU4os3ExM2GTlJZOkb84xZLSjZvt9t/NGs0SpXdy7OvNPM+9mOPhpY51fidDHPL38uxxJfQ==
X-Received: by 2002:a05:6214:c26:: with SMTP id
 a6mr4439051qvd.40.1634813444820; 
 Thu, 21 Oct 2021 03:50:44 -0700 (PDT)
Received: from bruce.bluespec.com ([154.3.44.94])
 by smtp.gmail.com with ESMTPSA id b19sm2233319qto.46.2021.10.21.03.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 03:50:44 -0700 (PDT)
Date: Thu, 21 Oct 2021 06:50:42 -0400
From: Darius Rad <darius@bluespec.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [RFC PATCH v8 09/21] riscv: Add task switch support for vector
Message-ID: <YXFGAqTzHMeQA+R+@bruce.bluespec.com>
Mail-Followup-To: Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Vincent Chen <vincent.chen@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
 <0e65c165e3d54a38cbba01603f325dca727274de.1631121222.git.greentime.hu@sifive.com>
 <c81267bc-4c91-3978-8c1f-78925c46c78b@bluespec.com>
 <CAHCEehJ1uuSFqFWreS1kh+fR5GFfnEycdLMe+4FHXpFsHrRUvA@mail.gmail.com>
 <YVRp5uWFGQrwBpgf@bruce.bluespec.com>
 <CAHCEeh+dA9243=PwNtYvyU1Myu_E8YO2g4UNACxRogQ=6UavLQ@mail.gmail.com>
 <YVxZspMO7rAvtMBS@bruce.bluespec.com>
 <3c9797f6-2fd3-5530-ba34-6e4c4deec984@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c9797f6-2fd3-5530-ba34-6e4c4deec984@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_035046_564169_9A69ACC5 
X-CRM114-Status: GOOD (  35.41  )
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

T24gV2VkLCBPY3QgMjAsIDIwMjEgYXQgMDY6MDE6MzFQTSAtMDcwMCwgUGF1bCBXYWxtc2xleSB3
cm90ZToKPiBIZWxsbyBEYXJpdXMsCj4gCj4gT24gVHVlLCA1IE9jdCAyMDIxLCBEYXJpdXMgUmFk
IHdyb3RlOgo+IAo+ID4gT24gTW9uLCBPY3QgMDQsIDIwMjEgYXQgMDg6MzY6MzBQTSArMDgwMCwg
R3JlZW50aW1lIEh1IHdyb3RlOgo+ID4gPiBEYXJpdXMgUmFkIDxkYXJpdXNAYmx1ZXNwZWMuY29t
PiDmlrwgMjAyMeW5tDnmnIgyOeaXpSDpgLHkuIkg5LiL5Y2IOToyOOWvq+mBk++8mgo+ID4gPiA+
Cj4gPiA+ID4gT24gVHVlLCBTZXAgMjgsIDIwMjEgYXQgMTA6NTY6NTJQTSArMDgwMCwgR3JlZW50
aW1lIEh1IHdyb3RlOgo+ID4gPiA+ID4gRGFyaXVzIFJhZCA8ZGFyaXVzQGJsdWVzcGVjLmNvbT4g
5pa8IDIwMjHlubQ55pyIMTPml6Ug6YCx5LiAIOS4i+WNiDg6MjHlr6vpgZPvvJoKPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gT24gOS84LzIxIDE6NDUgUE0sIEdyZWVudGltZSBIdSB3cm90ZToKPiA+
ID4gPiA+ID4gPiBUaGlzIHBhdGNoIGFkZHMgdGFzayBzd2l0Y2ggc3VwcG9ydCBmb3IgdmVjdG9y
LiBJdCBzdXBwb3J0cyBwYXJ0aWFsIGxhenkKPiA+ID4gPiA+ID4gPiBzYXZlIGFuZCByZXN0b3Jl
IG1lY2hhbmlzbS4gSXQgYWxzbyBzdXBwb3J0cyBhbGwgbGVuZ3RocyBvZiB2bGVuLgo+IAo+IFsg
Li4uIF0KPiAKPiA+ID4gPiA+ID4gU28gdGhpcyB3aWxsIHVuY29uZGl0aW9uYWxseSBlbmFibGUg
dmVjdG9yIGluc3RydWN0aW9ucywgYW5kIGFsbG9jYXRlCj4gPiA+ID4gPiA+IG1lbW9yeSBmb3Ig
dmVjdG9yIHN0YXRlLCBmb3IgYWxsIHByb2Nlc3NlcywgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHZl
Y3Rvcgo+ID4gPiA+ID4gPiBpbnN0cnVjdGlvbnMgYXJlIHVzZWQ/Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gWWVzLCBpdCB3aWxsIGVuYWJsZSB2ZWN0b3IgaWYgaGFzX3ZlY3RvcigpIGlzIHRydWUuIFRo
ZSByZWFzb24gdGhhdCB3ZQo+ID4gPiA+ID4gY2hvb3NlIHRvIGVuYWJsZSBhbmQgYWxsb2NhdGUg
bWVtb3J5IGZvciB1c2VyIHNwYWNlIHByb2dyYW0gaXMgYmVjYXVzZQo+ID4gPiA+ID4gd2UgYWxz
byBpbXBsZW1lbnQgc29tZSBjb21tb24gZnVuY3Rpb25zIGluIHRoZSBnbGliYyBzdWNoIGFzIG1l
bWNweQo+ID4gPiA+ID4gdmVjdG9yIHZlcnNpb24gYW5kIGl0IGlzIGNhbGxlZCB2ZXJ5IG9mdGVu
IGJ5IGV2ZXJ5IHByb2Nlc3MuIFNvIHRoYXQKPiA+ID4gPiA+IHdlIGFzc3VtZSBpZiB0aGUgdXNl
ciBwcm9ncmFtIGlzIHJ1bm5pbmcgaW4gYSBDUFUgd2l0aCB2ZWN0b3IgSVNBCj4gPiA+ID4gPiB3
b3VsZCBsaWtlIHRvIHVzZSB2ZWN0b3IgYnkgZGVmYXVsdC4gSWYgd2UgZGlzYWJsZSBpdCBieSBk
ZWZhdWx0IGFuZAo+ID4gPiA+ID4gbWFrZSBpdCB0cmlnZ2VyIHRoZSBpbGxlZ2FsIGluc3RydWN0
aW9uLCB0aGF0IG1pZ2h0IGJlIGEgYnVyZGVuIHNpbmNlCj4gPiA+ID4gPiBhbG1vc3QgZXZlcnkg
cHJvY2VzcyB3aWxsIHVzZSB2ZWN0b3IgZ2xpYmMgbWVtY3B5IG9yIHNvbWV0aGluZyBsaWtlCj4g
PiA+ID4gPiB0aGF0Lgo+ID4gPiA+Cj4gPiA+ID4gRG8geW91IGhhdmUgYW55IGV2aWRlbmNlIHRv
IHN1cHBvcnQgdGhlIGFzc2VydGlvbiB0aGF0IGFsbW9zdCBldmVyeSBwcm9jZXNzCj4gPiA+ID4g
d291bGQgdXNlIHZlY3RvciBvcGVyYXRpb25zPyAgT25lIGNvdWxkIGVhc2lseSBhcmd1ZSB0aGF0
IHRoZSBjb252ZXJzZSBpcwo+ID4gPiA+IHRydWU6IG5vIGV4aXN0aW5nIHNvZnR3YXJlIHVzZXMg
dGhlIHZlY3RvciBleHRlbnNpb24gbm93LCBzbyBtb3N0IGxpa2VseSBhCj4gPiA+ID4gcHJvY2Vz
cyB3aWxsIG5vdCBiZSB1c2luZyBpdC4KPiA+ID4gCj4gPiA+IEdsaWJjIHVzdHJlYW1pbmcgaXMg
anVzdCBzdGFydGluZyBzbyB5b3UgZGlkbid0IHNlZSBzb2Z0d2FyZSB1c2luZyB0aGUgCj4gPiA+
IHZlY3RvciBleHRlbnNpb24gbm93IGFuZCB0aGlzIHBhdGNoc2V0IGlzIHRlc3RpbmcgYmFzZWQg
b24gdGhvc2UgCj4gPiA+IG9wdGltaXplZCBnbGliYyB0b28uIFZpbmNlbnQgQ2hlbiBpcyB3b3Jr
aW5nIG9uIHRoZSBnbGliYyB2ZWN0b3IgCj4gPiA+IHN1cHBvcnQgdXBzdHJlYW1pbmcgYW5kIHdl
IHdpbGwgYWxzbyB1cHN0cmVhbSB0aGUgdmVjdG9yIHZlcnNpb24gZ2xpYmMgCj4gPiA+IG1lbWNw
eSwgbWVtY21wLCBtZW1jaHIsIG1lbW1vdmUsIG1lbXNldCwgc3RyY21wLCBzdHJsZW4uIFRoZW4g
d2Ugd2lsbCAKPiA+ID4gc2VlIHBsYXRmb3JtIHdpdGggdmVjdG9yIHN1cHBvcnQgY2FuIHVzZSB2
ZWN0b3IgdmVyc2lvbiBtZW0qIGFuZCBzdHIqIAo+ID4gPiBmdW5jdGlvbnMgYXV0b21hdGljYWxs
eSBiYXNlZCBvbiBpZnVuYyBhbmQgcGxhdGZvcm0gd2l0aG91dCB2ZWN0b3IgCj4gPiA+IHdpbGwg
dXNlIHRoZSBvcmlnaW5hbCBvbmUgYXV0b21hdGljYWxseS4gVGhlc2UgY291bGQgYmUgZG9uZSB0
byBzZWxlY3QgCj4gPiA+IHRoZSBjb3JyZWN0IG9wdGltaXplZCBnbGliYyBmdW5jdGlvbnMgYnkg
aWZ1bmMgbWVjaGFuaXNtLgo+IAo+IEluIHlvdXIgcmVwbHksIEkgbm90aWNlZCB0aGF0IHlvdSBk
aWRuJ3QgYWRkcmVzcyBHcmVlbnRpbWUncyByZXNwb25zZSAKPiBoZXJlLiAgQnV0IHRoaXMgbG9v
a3MgbGlrZSB0aGUga2V5IGlzc3VlLiAgSWYgY29tbW9uIGxpYnJhcnkgZnVuY3Rpb25zIGFyZSAK
PiB2ZWN0b3ItYWNjZWxlcmF0ZWQsIHdvdWxkbid0IGl0IG1ha2Ugc2Vuc2UgdGhhdCBhbG1vc3Qg
ZXZlcnkgcHJvY2VzcyB3b3VsZCAKPiB3aW5kIHVwIHVzaW5nIHZlY3RvciBpbnN0cnVjdGlvbnM/
ICBBbmQgdGh1cyB0aGVyZSB3b3VsZG4ndCBiZSBtdWNoIHBvaW50IAo+IHRvIHNraXBwaW5nIHRo
ZSB2ZWN0b3IgY29udGV4dCBtZW1vcnkgYWxsb2NhdGlvbj8KPiAKClRoaXMgaXNzdWUgd2FzIGFk
ZHJlc3NlZCBpbiB0aGUgdGhyZWFkIHJlZ2FyZGluZyBJbnRlbCBBTVggSSBsaW5rZWQgdG8gaW4g
YQpwcmV2aW91cyBtZXNzYWdlLiAgSSBkb24ndCBhZ3JlZSB0aGF0IHRoaXMgaXMgdGhlIGtleSBp
c3N1ZTsgaXQgaXMgb25lIG9mIGEKbnVtYmVyIG9mIGlzc3Vlcy4gIFdoYXQgaWYgSSBkb24ndCB3
YW50IHRvIHRha2UgdGhlIHBvdGVudGlhbApwb3dlci9mcmVxdWVuY3kgaGl0IGZvciB0aGUgdmVj
dG9yIHVuaXQgZm9yIGEgd29ya2xvYWQgdGhhdCwgYXQgYmVzdCwgdXNlcwppdCBmb3IgdGhlIG9j
Y2FzaW9uYWwgbWVtY3B5PyAgV2hhdCBpZiB0aGUgYWxsb2NhdGlvbiBmYWlscywgaG93IHdpbGwg
dGhhdApnZXQgcmVwb3J0ZWQgdG8gdXNlciBzcGFjZSAoaGludDogbm90IHdlbGwpPyAgQWNjb3Jk
aW5nIHRvIEdyZWVudGltZSwKUklTQy1WIHZlY3RvciBpcyBzaW1pbGFyIHRvIEFSTSBTVkUsIHdo
aWNoIGFsbG9jYXRlcyBtZW1vcnkgZm9yIGNvbnRleHQKc3RhdGUgb24gZmlyc3QgdXNlIGFuZCBu
b3QgdW5jb25kaXRpb25hbGx5IGZvciBhbGwgcHJvY2Vzc2VzLgoKLy8gZGFyaXVzCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
