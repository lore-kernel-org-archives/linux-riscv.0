Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23081C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 04:44:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C97A9604DC
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 04:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C97A9604DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=u4iMe6sr1NspJh3j7YRwy7WvzDp3w6u6gGz5q5GsRYI=; b=lEKfk17DdueiSAOZAwTv2bzInS
	1n4/LYomkT8el8RbS8JsM1b0EdUOpkaby9xwb7OHHP83qHRIfeQcYaVZR0GHuSGTZ7M7VBfAdA3ua
	mZxOW9G8px9TT3LeK6DhOkXeuxE+S4/hIwFoESYqfkOkPZ6R9AaT0TL5C3xLuGADyA2FaGyYtaiHX
	mZI4ah0ypHxVVEOdbGxwOryi+H8i+lo+pj2RuFpdkRfs+YrEZrLdHoWoXe7wtxztZXmF79QKguatN
	eBrBP3rL0vPyo/rP9/5dQ4xjTpov47eabjvxz6ixJxzZ4aezbJhacPIF/4mUaIqXcMr83UOagaj0b
	ciEaGcxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfEKM-000dQZ-Pt; Tue, 26 Oct 2021 04:44:46 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfEKK-000dPn-A1
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 04:44:46 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id u25so449059qve.2
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 21:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=MNji5ahy4ZJGV0BX3SfNctlXhA6hshHAxWuWdfCnyuM=;
 b=lSGCPIFe9CLClmpv6PmhdoiPw0jJlA1Y7TbWgVoEDB6sgCIW+f7e/UtDb+u0x2DwlQ
 u+et0I8SJcHaiCQr+BRju7q8BJs/V17zodovMbHU74SYALgwqwJnKpvWzfiRt83bphvX
 vVGl+FNjEmd038kIIV1tzJB6gF9/lUQWdnUqpiAlW639ZfXSTGiJW72VqT8k6bGxFxyS
 UnWV/hTs0aYeJn9lCa+jyPwqtXjwbpYi67uKGMFLK4oPm4GanBw0h0kV1sNp6ogtzTMT
 vKHy8gDYUhhsywhxwja0QzznHqcLVFGZpN2YqIjSCJa7vLjPLy+AdWXeH0uul/COcqej
 caFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=MNji5ahy4ZJGV0BX3SfNctlXhA6hshHAxWuWdfCnyuM=;
 b=B+uQZY0i4n8GXvxUKqi2O09VS3/h1NypPAmBjs26OC6u3BrJbBWjkf4UJg82u4UCaA
 lRFR43MTKZWop5KbTcLiUdTbC7snb7qUjPFY65IA0fA/cp6vhBC7DWXV+HyWK18k4QmL
 lqeImWlZYkOLi9OIeic+6aSH7UCLGPwN7JFegukS3jYpI50eWWuICf2VOnCUY3nbKr7s
 Ele2+MB64Tsq1oMnOjd3t9BXXXyVuovU8B6f58L2E3jYcpKM9S55LfAnYrIxmrCTDowH
 Z3Uh7zqsq7qNeR8El7ZnwPNcf9F91JJzr/yEIuM65jNeVHQTtcP4e5VFy+Dx87j9clJs
 e0kw==
X-Gm-Message-State: AOAM5302UzLrP4N/H+AGl1fyYefy0d1fjhvp3J3Qg4lNgKRc0XCWLidT
 mG7Cfq2MWCh39QDUhpW6Vp9s68iksI94bN/FFydR7A==
X-Google-Smtp-Source: ABdhPJzhFIVGE/9JVvzTkU10Vh4qqk2Dcd8BD2ZQgfV2wv0uEl0MR6r6A3waRPVxyjeuxGNTnk/8aoIz4V3Do2PXAiU=
X-Received: by 2002:a05:6214:29c9:: with SMTP id
 gh9mr20451134qvb.50.1635223482667; 
 Mon, 25 Oct 2021 21:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <c81267bc-4c91-3978-8c1f-78925c46c78b@bluespec.com>
 <CAHCEehJ1uuSFqFWreS1kh+fR5GFfnEycdLMe+4FHXpFsHrRUvA@mail.gmail.com>
 <YVRp5uWFGQrwBpgf@bruce.bluespec.com>
 <CAHCEeh+dA9243=PwNtYvyU1Myu_E8YO2g4UNACxRogQ=6UavLQ@mail.gmail.com>
 <YVxZspMO7rAvtMBS@bruce.bluespec.com>
 <3c9797f6-2fd3-5530-ba34-6e4c4deec984@sifive.com>
 <YXFGAqTzHMeQA+R+@bruce.bluespec.com>
 <CABvJ_xjMyZ3HDLinMvY88HtKywb=cwhQNOOCZYTEeL407Gyz2A@mail.gmail.com>
 <YXKVLtT2U2g3JDrm@bruce.bluespec.com>
 <CAHCEehKpA=d1phuAM1tdeyrp-CYQRmFxGTpvuJqWNMjRCMpWfw@mail.gmail.com>
 <YXbZtTR7TBHvdqck@bruce.bluespec.com>
In-Reply-To: <YXbZtTR7TBHvdqck@bruce.bluespec.com>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Tue, 26 Oct 2021 12:44:31 +0800
Message-ID: <CAHCEeh++tAWVkhg7uEeWGdwp6UDWqShxn8ACWMvApCkiGfgZgQ@mail.gmail.com>
Subject: Re: [RFC PATCH v8 09/21] riscv: Add task switch support for vector
To: Greentime Hu <greentime.hu@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_214444_406664_87816E3F 
X-CRM114-Status: GOOD (  51.80  )
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

RGFyaXVzIFJhZCA8ZGFyaXVzQGJsdWVzcGVjLmNvbT4g5pa8IDIwMjHlubQxMOaciDI25pelIOmA
seS6jCDkuIrljYgxMjoyMuWvq+mBk++8mgo+Cj4gT24gTW9uLCBPY3QgMjUsIDIwMjEgYXQgMTI6
NDc6NDlQTSArMDgwMCwgR3JlZW50aW1lIEh1IHdyb3RlOgo+ID4gRGFyaXVzIFJhZCA8ZGFyaXVz
QGJsdWVzcGVjLmNvbT4g5pa8IDIwMjHlubQxMOaciDIy5pelIOmAseS6lCDkuIvljYg2OjQw5a+r
6YGT77yaCj4gPiA+Cj4gPiA+IE9uIEZyaSwgT2N0IDIyLCAyMDIxIGF0IDExOjUyOjAxQU0gKzA4
MDAsIFZpbmNlbnQgQ2hlbiB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIE9jdCAyMSwgMjAyMSBhdCA2
OjUwIFBNIERhcml1cyBSYWQgPGRhcml1c0BibHVlc3BlYy5jb20+IHdyb3RlOgo+ID4gPiA+ID4K
PiA+ID4gPiA+IE9uIFdlZCwgT2N0IDIwLCAyMDIxIGF0IDA2OjAxOjMxUE0gLTA3MDAsIFBhdWwg
V2FsbXNsZXkgd3JvdGU6Cj4gPiA+ID4gPiA+IEhlbGxvIERhcml1cywKPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gT24gVHVlLCA1IE9jdCAyMDIxLCBEYXJpdXMgUmFkIHdyb3RlOgo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+IE9uIE1vbiwgT2N0IDA0LCAyMDIxIGF0IDA4OjM2OjMwUE0gKzA4MDAs
IEdyZWVudGltZSBIdSB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IERhcml1cyBSYWQgPGRhcml1c0Bi
bHVlc3BlYy5jb20+IOaWvCAyMDIx5bm0OeaciDI55pelIOmAseS4iSDkuIvljYg5OjI45a+r6YGT
77yaCj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IE9uIFR1ZSwgU2VwIDI4LCAy
MDIxIGF0IDEwOjU2OjUyUE0gKzA4MDAsIEdyZWVudGltZSBIdSB3cm90ZToKPiA+ID4gPiA+ID4g
PiA+ID4gPiBEYXJpdXMgUmFkIDxkYXJpdXNAYmx1ZXNwZWMuY29tPiDmlrwgMjAyMeW5tDnmnIgx
M+aXpSDpgLHkuIAg5LiL5Y2IODoyMeWvq+mBk++8mgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiA+ID4gPiA+IE9uIDkvOC8yMSAxOjQ1IFBNLCBHcmVlbnRpbWUgSHUgd3JvdGU6
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFRoaXMgcGF0Y2ggYWRkcyB0YXNrIHN3aXRjaCBzdXBw
b3J0IGZvciB2ZWN0b3IuIEl0IHN1cHBvcnRzIHBhcnRpYWwgbGF6eQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiBzYXZlIGFuZCByZXN0b3JlIG1lY2hhbmlzbS4gSXQgYWxzbyBzdXBwb3J0cyBhbGwg
bGVuZ3RocyBvZiB2bGVuLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBbIC4uLiBdCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBTbyB0aGlzIHdpbGwgdW5jb25kaXRpb25hbGx5IGVu
YWJsZSB2ZWN0b3IgaW5zdHJ1Y3Rpb25zLCBhbmQgYWxsb2NhdGUKPiA+ID4gPiA+ID4gPiA+ID4g
PiA+IG1lbW9yeSBmb3IgdmVjdG9yIHN0YXRlLCBmb3IgYWxsIHByb2Nlc3NlcywgcmVnYXJkbGVz
cyBvZiB3aGV0aGVyIHZlY3Rvcgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gaW5zdHJ1Y3Rpb25zIGFy
ZSB1c2VkPwo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gWWVzLCBpdCB3
aWxsIGVuYWJsZSB2ZWN0b3IgaWYgaGFzX3ZlY3RvcigpIGlzIHRydWUuIFRoZSByZWFzb24gdGhh
dCB3ZQo+ID4gPiA+ID4gPiA+ID4gPiA+IGNob29zZSB0byBlbmFibGUgYW5kIGFsbG9jYXRlIG1l
bW9yeSBmb3IgdXNlciBzcGFjZSBwcm9ncmFtIGlzIGJlY2F1c2UKPiA+ID4gPiA+ID4gPiA+ID4g
PiB3ZSBhbHNvIGltcGxlbWVudCBzb21lIGNvbW1vbiBmdW5jdGlvbnMgaW4gdGhlIGdsaWJjIHN1
Y2ggYXMgbWVtY3B5Cj4gPiA+ID4gPiA+ID4gPiA+ID4gdmVjdG9yIHZlcnNpb24gYW5kIGl0IGlz
IGNhbGxlZCB2ZXJ5IG9mdGVuIGJ5IGV2ZXJ5IHByb2Nlc3MuIFNvIHRoYXQKPiA+ID4gPiA+ID4g
PiA+ID4gPiB3ZSBhc3N1bWUgaWYgdGhlIHVzZXIgcHJvZ3JhbSBpcyBydW5uaW5nIGluIGEgQ1BV
IHdpdGggdmVjdG9yIElTQQo+ID4gPiA+ID4gPiA+ID4gPiA+IHdvdWxkIGxpa2UgdG8gdXNlIHZl
Y3RvciBieSBkZWZhdWx0LiBJZiB3ZSBkaXNhYmxlIGl0IGJ5IGRlZmF1bHQgYW5kCj4gPiA+ID4g
PiA+ID4gPiA+ID4gbWFrZSBpdCB0cmlnZ2VyIHRoZSBpbGxlZ2FsIGluc3RydWN0aW9uLCB0aGF0
IG1pZ2h0IGJlIGEgYnVyZGVuIHNpbmNlCj4gPiA+ID4gPiA+ID4gPiA+ID4gYWxtb3N0IGV2ZXJ5
IHByb2Nlc3Mgd2lsbCB1c2UgdmVjdG9yIGdsaWJjIG1lbWNweSBvciBzb21ldGhpbmcgbGlrZQo+
ID4gPiA+ID4gPiA+ID4gPiA+IHRoYXQuCj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
PiA+IERvIHlvdSBoYXZlIGFueSBldmlkZW5jZSB0byBzdXBwb3J0IHRoZSBhc3NlcnRpb24gdGhh
dCBhbG1vc3QgZXZlcnkgcHJvY2Vzcwo+ID4gPiA+ID4gPiA+ID4gPiB3b3VsZCB1c2UgdmVjdG9y
IG9wZXJhdGlvbnM/ICBPbmUgY291bGQgZWFzaWx5IGFyZ3VlIHRoYXQgdGhlIGNvbnZlcnNlIGlz
Cj4gPiA+ID4gPiA+ID4gPiA+IHRydWU6IG5vIGV4aXN0aW5nIHNvZnR3YXJlIHVzZXMgdGhlIHZl
Y3RvciBleHRlbnNpb24gbm93LCBzbyBtb3N0IGxpa2VseSBhCj4gPiA+ID4gPiA+ID4gPiA+IHBy
b2Nlc3Mgd2lsbCBub3QgYmUgdXNpbmcgaXQuCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ID4gR2xpYmMgdXN0cmVhbWluZyBpcyBqdXN0IHN0YXJ0aW5nIHNvIHlvdSBkaWRuJ3Qgc2VlIHNv
ZnR3YXJlIHVzaW5nIHRoZQo+ID4gPiA+ID4gPiA+ID4gdmVjdG9yIGV4dGVuc2lvbiBub3cgYW5k
IHRoaXMgcGF0Y2hzZXQgaXMgdGVzdGluZyBiYXNlZCBvbiB0aG9zZQo+ID4gPiA+ID4gPiA+ID4g
b3B0aW1pemVkIGdsaWJjIHRvby4gVmluY2VudCBDaGVuIGlzIHdvcmtpbmcgb24gdGhlIGdsaWJj
IHZlY3Rvcgo+ID4gPiA+ID4gPiA+ID4gc3VwcG9ydCB1cHN0cmVhbWluZyBhbmQgd2Ugd2lsbCBh
bHNvIHVwc3RyZWFtIHRoZSB2ZWN0b3IgdmVyc2lvbiBnbGliYwo+ID4gPiA+ID4gPiA+ID4gbWVt
Y3B5LCBtZW1jbXAsIG1lbWNociwgbWVtbW92ZSwgbWVtc2V0LCBzdHJjbXAsIHN0cmxlbi4gVGhl
biB3ZSB3aWxsCj4gPiA+ID4gPiA+ID4gPiBzZWUgcGxhdGZvcm0gd2l0aCB2ZWN0b3Igc3VwcG9y
dCBjYW4gdXNlIHZlY3RvciB2ZXJzaW9uIG1lbSogYW5kIHN0cioKPiA+ID4gPiA+ID4gPiA+IGZ1
bmN0aW9ucyBhdXRvbWF0aWNhbGx5IGJhc2VkIG9uIGlmdW5jIGFuZCBwbGF0Zm9ybSB3aXRob3V0
IHZlY3Rvcgo+ID4gPiA+ID4gPiA+ID4gd2lsbCB1c2UgdGhlIG9yaWdpbmFsIG9uZSBhdXRvbWF0
aWNhbGx5LiBUaGVzZSBjb3VsZCBiZSBkb25lIHRvIHNlbGVjdAo+ID4gPiA+ID4gPiA+ID4gdGhl
IGNvcnJlY3Qgb3B0aW1pemVkIGdsaWJjIGZ1bmN0aW9ucyBieSBpZnVuYyBtZWNoYW5pc20uCj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEluIHlvdXIgcmVwbHksIEkgbm90aWNlZCB0aGF0IHlvdSBk
aWRuJ3QgYWRkcmVzcyBHcmVlbnRpbWUncyByZXNwb25zZQo+ID4gPiA+ID4gPiBoZXJlLiAgQnV0
IHRoaXMgbG9va3MgbGlrZSB0aGUga2V5IGlzc3VlLiAgSWYgY29tbW9uIGxpYnJhcnkgZnVuY3Rp
b25zIGFyZQo+ID4gPiA+ID4gPiB2ZWN0b3ItYWNjZWxlcmF0ZWQsIHdvdWxkbid0IGl0IG1ha2Ug
c2Vuc2UgdGhhdCBhbG1vc3QgZXZlcnkgcHJvY2VzcyB3b3VsZAo+ID4gPiA+ID4gPiB3aW5kIHVw
IHVzaW5nIHZlY3RvciBpbnN0cnVjdGlvbnM/ICBBbmQgdGh1cyB0aGVyZSB3b3VsZG4ndCBiZSBt
dWNoIHBvaW50Cj4gPiA+ID4gPiA+IHRvIHNraXBwaW5nIHRoZSB2ZWN0b3IgY29udGV4dCBtZW1v
cnkgYWxsb2NhdGlvbj8KPiA+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIGlzc3Vl
IHdhcyBhZGRyZXNzZWQgaW4gdGhlIHRocmVhZCByZWdhcmRpbmcgSW50ZWwgQU1YIEkgbGlua2Vk
IHRvIGluIGEKPiA+ID4gPiA+IHByZXZpb3VzIG1lc3NhZ2UuICBJIGRvbid0IGFncmVlIHRoYXQg
dGhpcyBpcyB0aGUga2V5IGlzc3VlOyBpdCBpcyBvbmUgb2YgYQo+ID4gPiA+ID4gbnVtYmVyIG9m
IGlzc3Vlcy4gIFdoYXQgaWYgSSBkb24ndCB3YW50IHRvIHRha2UgdGhlIHBvdGVudGlhbAo+ID4g
PiA+ID4gcG93ZXIvZnJlcXVlbmN5IGhpdCBmb3IgdGhlIHZlY3RvciB1bml0IGZvciBhIHdvcmts
b2FkIHRoYXQsIGF0IGJlc3QsIHVzZXMKPiA+ID4gPiA+IGl0IGZvciB0aGUgb2NjYXNpb25hbCBt
ZW1jcHk/ICBXaGF0IGlmIHRoZSBhbGxvY2F0aW9uIGZhaWxzLCBob3cgd2lsbCB0aGF0Cj4gPiA+
ID4KPiA+ID4gPiBIaSBEYXJpdXMsCj4gPiA+ID4gVGhlIG1lbWNweSBmdW5jdGlvbiBzZWVtcyBu
b3QgdG8gYmUgb2NjYXNpb25hbGx5IHVzZWQgaW4gdGhlIHByb2dyYW1zCj4gPiA+ID4gYmVjYXVz
ZSBtYW55IGZ1bmN0aW9ucyBpbiBHbGliYyB1c2UgbWVtY3B5KCkgdG8gY29tcGxldGUgdGhlIG1l
bW9yeQo+ID4gPiA+IGNvcHkuIEkgdXNlIHRoZSBmb2xsb3dpbmcgc2ltcGxlIGNhc2UgYXMgYW4g
ZXhhbXBsZS4KPiA+ID4gPiB0ZXN0LmMKPiA+ID4gPiB2b2lkIG1haW4odm9pZCkgewo+ID4gPiA+
ICAgICByZXR1cm47Cj4gPiA+ID4gfQo+ID4gPiA+IFRoZW4sIHdlIGNvbXBpbGUgaXQgYnkgImdj
YyB0ZXN0LmMgLW8gYS5vdXQiIGFuZCBleGVjdXRlIGl0LiBJbiB0aGUKPiA+ID4gPiBleGVjdXRp
b24sIHRoZSBtZW1jcHkoKSBoYXMgYmVlbiBjYWxsZWQgdW5leHBlY3RlZGx5LiBJdCBpcyBiZWNh
dXNlCj4gPiA+ID4gbWFueSBsaWJjIGluaXRpYWxpemVkIGZ1bmN0aW9ucyB3aWxsIGJlIGV4ZWN1
dGVkIGJlZm9yZSBlbnRlcmluZyB0aGUKPiA+ID4gPiB1c2VyLWRlZmluZWQgbWFpbiBmdW5jdGlv
bi4gT25lIG9mIHRoZSBleGFtcGxlIGlzIF9fbGliY19zZXR1cF90bHMoKSwKPiA+ID4gPiB3aGlj
aCBpcyBjYWxsZWQgYnkgX19saWJjX3N0YXJ0X21haW4oKS4gVGhlIF9fbGliY19zZXR1cF90bHMo
KSB3aWxsCj4gPiA+ID4gdXNlIG1lbWNweSgpIGR1cmluZyB0aGUgcHJvY2VzcyBvZiBjcmVhdGlu
ZyB0aGUgRHluYW1pYyBUaHJlYWQgVmVjdG9yCj4gPiA+ID4gKERUVikuCj4gPiA+ID4KPiA+ID4g
PiBUaGVyZWZvcmUsIEkgdGhpbmsgdGhlIG1lbWNweSgpIGlzIHdpZGVseSB1c2VkIGluIG1vc3Qg
cHJvZ3JhbXMuCj4gPiA+ID4KPiA+ID4KPiA+ID4gWW91J3JlIG1pc3NpbmcgbXkgcG9pbnQuICBO
b3QgZXZlcnkgKGFueT8pIHByb2dyYW0gc3BlbmRzIGEgbWFqb3JpdHkgb2YgdGhlCj4gPiA+IHRp
bWUgZG9pbmcgbWVtY3B5KCksIGFuZCBldmVuIGlmIGEgcHJvZ3JhbSBkaWQsIGFsbCBvZiBteSBw
b2ludHMgYXJlIHN0aWxsCj4gPiA+IHZhbGlkLgo+ID4gPgo+ID4gPiBQbGVhc2UgcmVhZCB0aGUg
ZGlzY3Vzc2lvbiBpbiB0aGUgdGhyZWFkIEkgcmVmZXJlbmNlZCBhbmQgdGhlIHF1ZXN0aW9ucyBp
bgo+ID4gPiBteSBwcmlvciBtZXNzYWdlLgo+ID4gPgo+ID4KPiA+IEhpIERhcml1cywKPiA+Cj4g
PiBBcyBJIG1lbnRpb25lZCBiZWZvcmUsIHdlIHdhbnQgdG8gdHJlYXQgdmVjdG9yIElTQSBsaWtl
IGEgZ2VuZXJhbCBJU0EKPiA+IGluc3RlYWQgb2YgYSBzcGVjaWZpYyBJUC4gVXNlciBwcm9ncmFt
IHNob3VsZCBiZSBhYmxlIHRvIHVzZSBpdAo+ID4gdHJhbnNwYXJlbnRseSBqdXN0IGxpa2UgRlBV
Lgo+ID4gSXQgc2VlbXMgdGhhdCB0aGUgdXNlIGNhc2UgeW91IHdhbnQgaXMgYXNraW5nIHVzZXIg
dG8gdXNlIHZlY3RvciBsaWtlCj4gPiBhIHNwZWNpZmljIElQLCB1c2VyIHByb2dyYW0gc2hvdWxk
IGFzayBrZXJuZWwgYmVmb3JlIHRoZXkgdXNlIGl0IGFuZAo+ID4gdGhhdCBpcyBub3Qgd2hhdCB3
ZSB3YW50IHRvIGRvIGluIHRoaXMgcGF0Y2hzZXQuCj4gPgo+Cj4gSGkgR3JlZW50aW1lLAo+Cj4g
UmlnaHQuCj4KPiBCdXQgYmV5b25kIHdoYXQgSSB3YW50IHRvIGRvIG9yIHdoYXQgeW91IHdhbnQg
dG8gZG8sIGlzIHdoYXQgKnNob3VsZCogTGludXgKPiBkbz8gIEkgaGF2ZSBhdHRlbXB0ZWQgdG8g
cHJvdmlkZSBldmlkZW5jZSB0byBzdXBwb3J0IG15IHBvc2l0aW9uLiAgWW91IGhhdmUKPiBub3Qg
cmVzcG9uZGVkIHRvIG9yIGFkZHJlc3NlZCB0aGUgbWFqb3JpdHkgb2YgbXkgcXVlc3Rpb25zLCB3
aGljaCBpcwo+IGNvbmNlcm5pbmcgdG8gbWUuCgpIaSBEYXJpdXMsCgpXaGF0IGlzIHlvdXIgbWFq
b3JpdHkgcXVlc3Rpb25zPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
