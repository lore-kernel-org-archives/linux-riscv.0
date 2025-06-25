Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018AAC7EE30
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pG/dhIopc9+kgS5WucRUhHQc3FAhQqlcbhLgCsF51g=; b=AHGSZ529hFwKHK
	btwnP4GBQTbW7Yiuhkz9mDBoDrnRgF+XzUHwKG6tEnAWWy+hSBwFvu0vhFcLWuYTknm+MAW4t2s0A
	ITkiRyrVoFoHOG7ihDpWy8MRU/vZaCbl3SJm82S9Tai1GDLw3X0FYJu/7iqzQcpCNQuWwCmSxMubo
	7thHRPZmkHW/H6FQZ8UhQz7iHQTnNXrQWZYsy2ixxsB4PWFD2fvrOBUbCCinSMAYk/AdMnWj6/34D
	T1Jd9/pnbGkDBAbArbYi3KJ9QFZOmuSztG22o4XDR6EkkUZj3bN4kv9xWOtfeNzAWJzxNm4R9tCw3
	p27bDVDKjSwpzu4KYHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUT0g-00000009Hsr-2vrW;
	Wed, 25 Jun 2025 16:30:06 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOWf-00000008WOh-2hiY;
	Wed, 25 Jun 2025 11:42:50 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-4e9b26a5e45so558561137.1;
        Wed, 25 Jun 2025 04:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750851768; x=1751456568; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1E0eHLYsSqj8V6/6/0gwkH/3TSH/eRM7xqdNUicbSQ=;
        b=ONe2dgdRwmcYs4Ymsv32eHhUyPK7wGwR5Layadpc29UY6ie8VF18a/qcQmRPW4ZuqA
         0SWyyN0EnmRKwxz3Ns+J2ayQgkZHm6GMNAIAAsVpL9LNRTTKe2u+1ecyjrsin6Q29fi6
         ZEA1yeDdOlPyf7ck9FBluHr0TWK8Fcud8rVgT8MuwamW/qv6iUiIWZTpsa29kddc7/no
         P2optVizKcoDOOYhSGqENVwYY/YJNX1Bk6tTBHvJgarbqkdIx0iWif407rdXor8Hm4+v
         qsa5oyKPkY0APEa5XaoG8SWQmIALyk+BAaqzxqwbObOkmgUKccNbuZWHSTBqfdTdO94J
         fMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851768; x=1751456568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1E0eHLYsSqj8V6/6/0gwkH/3TSH/eRM7xqdNUicbSQ=;
        b=TLfwc8oxVCQKpnfSZgNNP9D2qornNssko8P6cP6Uo4Ig8Un8M4vZlvupwSi7IPFsjX
         gcLcH1tv6UbzzmOctGLI03d5vJvZ1lM4PtK8KBmVtmq9Il8A8Vj2gvlAvO21IT7SpCUH
         RFqmU89BIRurv4pYriIaVEPMOyz/ot9hnKourP+0Lg8YeW/hKQrtEB/YWouKCXrWlCra
         qEhwh4HAig/MObZzDNra+UNLZXPWUbseUYNszLQ03Cgpz+IKgQeSonKySPoVdgiSzJhg
         QUpCi6tzJg4lCsq8qgvj+B/hUqmikcg42GCV0JT4JU3a2vOwxxDXOpZH3mroZse3bnDQ
         TCrA==
X-Forwarded-Encrypted: i=1; AJvYcCVI85u4JKsWXuYqGtzoBTCAEDhAJXGDx+PE0bF1MqcO+EU8aXcZt7dVX+xMZQbfQdwU29c2qtOQ9w6xkNE=@lists.infradead.org, AJvYcCXmzCY2TQbuavL9bAGw4Xc8xsp/PQZtYoVwoky3Bimz4lfGM9dLWwwbv23zs6i/P0HcjG3jy4kM7qGK+foggF+o@lists.infradead.org
X-Gm-Message-State: AOJu0YyUR8s6dpgWh2fh/hov8MP2sBjXrPlNPvz5OpV0MTjJ4TapUnoH
	RhDKj5lrHw2m6Z18R4CVhk7AI1qLSjik8FesSk26RsdJJxkestTdkpUUFs870Y0/EJ8AQwe1rqT
	aHBLAwqGIygKnlMHqJRtGIU1mkWTDfas=
X-Gm-Gg: ASbGncttmpiF7VLXLa92mzWhR8rT5WQrlqidQu8R8Wt6C1BakMRazw/imgmM0SeZNLd
	H1nar+qWgmHx5yqvCyNJInEohHrbnjCy5aJFEp7TXGgFs8oQYKvDNPHhYqjtxFcEwK5iWznghfT
	rtpDV7/y2UftMc0lSb3XD2ikECakiYLouJ1oQWrePEq7Ng/EyogyRG3Q==
X-Google-Smtp-Source: AGHT+IGsSxCfiBHYZxf4zTJngUXVXeIOT0PdP8VNFGZYgDUlzbW2AoPZQk3j5HWq3IA1WM6a9fvGa9ZMm28LZKzgbU4=
X-Received: by 2002:a05:6102:689a:b0:4e6:a33d:9925 with SMTP id
 ada2fe7eead31-4ecc6a67b6emr1171422137.5.1750851768456; Wed, 25 Jun 2025
 04:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com> <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev> <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
 <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com> <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
 <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com>
In-Reply-To: <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 23:42:36 +1200
X-Gm-Features: Ac12FXwHQ4LRq0KMwLDA3cdKc56s07Bk3-vMKyiAdfGW1BevfTrz5ebfq42hUs0
Message-ID: <CAGsJ_4yTH5ngM++e=c+P7g0fXs-QQsOk2oxd1RWa3Qww97Knrw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com, 
	Lance Yang <ioworker0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_044249_701325_46AFCBEB 
X-CRM114-Status: GOOD (  29.50  )
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

T24gV2VkLCBKdW4gMjUsIDIwMjUgYXQgMTE6MjfigK9QTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2
aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiAyNS4wNi4yNSAxMzoxNSwgQmFycnkgU29uZyB3
cm90ZToKPiA+IE9uIFdlZCwgSnVuIDI1LCAyMDI1IGF0IDExOjAx4oCvUE0gRGF2aWQgSGlsZGVu
YnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMjUuMDYuMjUgMTI6
NTcsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gPj4+Pj4KPiA+Pj4+PiBOb3RlIHRoYXQgSSBkb24ndCBx
dWl0ZSB1bmRlcnN0YW5kIHdoeSB3ZSBoYXZlIHRvIGJhdGNoIHRoZSB3aG9sZSB0aGluZwo+ID4+
Pj4+IG9yIGZhbGxiYWNrIHRvCj4gPj4+Pj4gaW5kaXZpZHVhbCBwYWdlcy4gV2h5IGNhbid0IHdl
IHBlcmZvcm0gb3RoZXIgYmF0Y2hlcyB0aGF0IHNwYW4gb25seSBzb21lCj4gPj4+Pj4gUFRFcz8g
V2hhdCdzIHNwZWNpYWwKPiA+Pj4+PiBhYm91dCAxIFBURSB2cy4gMiBQVEVzIHZzLiBhbGwgUFRF
cz8KPiA+Pj4+Cj4gPj4+PiBUaGF0J3MgYSBnb29kIHBvaW50IGFib3V0IHRoZSAiYWxsLW9yLW5v
dGhpbmciIGJhdGNoaW5nIGxvZ2ljIDspCj4gPj4+Pgo+ID4+Pj4gSXQgc2VlbXMgdGhlICJhbGwt
b3Itbm90aGluZyIgYXBwcm9hY2ggaXMgc3BlY2lmaWMgdG8gdGhlIGxhenlmcmVlIHVzZQo+ID4+
Pj4gY2FzZSwgd2hpY2ggbmVlZHMgdG8gdW5tYXAgdGhlIGVudGlyZSBmb2xpbyBmb3IgcmVjbGFt
YXRpb24uIElmIHRoYXQncwo+ID4+Pj4gbm90IHBvc3NpYmxlLCBpdCBmYWxscyBiYWNrIHRvIHRo
ZSBzaW5nbGUtcGFnZSBzbG93IHBhdGguCj4gPj4+Cj4gPj4+IE90aGVyIGNhc2VzIGFkdmFuY2Ug
dGhlIFBURSB0aGVtc2VsdmVzLCB3aGlsZSB0cnlfdG9fdW5tYXBfb25lKCkgcmVsaWVzCj4gPj4+
IG9uIHBhZ2Vfdm1hX21hcHBlZF93YWxrKCkgdG8gYWR2YW5jZSB0aGUgUFRFLiBVbmxlc3Mgd2Ug
d2FudCB0byBtYW51YWxseQo+ID4+PiBtb2RpZnkgcHZtdy5wdGUgYW5kIHB2bXcuYWRkcmVzcyBv
dXRzaWRlIG9mIHBhZ2Vfdm1hX21hcHBlZF93YWxrKCksIHdoaWNoCj4gPj4+IHRvIG1lIHNlZW1z
IGxpa2UgYSB2aW9sYXRpb24gb2YgbGF5ZXJzLiA6LSkKPiA+Pgo+ID4+IFBsZWFzZSBleHBsYWlu
IHRvIG1lIHdoeSB0aGUgZm9sbG93aW5nIGlzIG5vdCBjbGVhcmVyIGFuZCBiZXR0ZXI6Cj4gPgo+
ID4gVGhpcyBwYXJ0IGlzIG11Y2ggY2xlYXJlciwgYnV0IHRoYXQgZG9lc27igJl0IG5lY2Vzc2Fy
aWx5IGltcHJvdmUgdGhlIG92ZXJhbGwKPiA+IHBpY3R1cmUuIFRoZSBtYWluIGNoYWxsZW5nZSBp
cyBob3cgdG8gZXhpdCB0aGUgaXRlcmF0aW9uIG9mCj4gPiB3aGlsZSAocGFnZV92bWFfbWFwcGVk
X3dhbGsoJnB2bXcpKS4KPgo+IE9rYXksIEkgZ2V0IHdoYXQgeW91IG1lYW4gbm93Lgo+Cj4gPgo+
ID4gUmlnaHQgbm93LCB3ZSBoYXZlIGl0IGxhaWQgb3V0IHF1aXRlIHN0cmFpZ2h0Zm9yd2FyZGx5
Ogo+ID4gICAgICAgICAgICAgICAgICAvKiBXZSBoYXZlIGFscmVhZHkgYmF0Y2hlZCB0aGUgZW50
aXJlIGZvbGlvICovCj4gPiAgICAgICAgICAgICAgICAgIGlmIChucl9wYWdlcyA+IDEpCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgZ290byB3YWxrX2RvbmU7Cj4KPgo+IEdpdmVuIHRoYXQg
dGhlIGNvbW1lbnQgaXMgY29tcGxldGVseSBjb25mdXNpbmcgd2hlbnMgc2VlaW5nIHRoZSBjaGVj
ayAuLi4gOikKPgo+IC8qCj4gICAqIElmIHdlIGFyZSBzdXJlIHRoYXQgd2UgYmF0Y2hlZCB0aGUg
ZW50aXJlIGZvbGlvIGFuZCBjbGVhcmVkIGFsbCBQVEVzLAo+ICAgKiB3ZSBjYW4ganVzdCBvcHRp
bWl6ZSBhbmQgc3RvcCByaWdodCBoZXJlLgo+ICAgKi8KPiBpZiAobnJfcGFnZXMgPT0gZm9saW9f
bnJfcGFnZXMoZm9saW8pKQo+ICAgICAgICAgZ290byB3YWxrX2RvbmU7Cj4KPiB3b3VsZCBtYWtl
IHRoZSBjb21tZW50IG1hdGNoLgoKWWVzLCB0aGF0IGNsYXJpZmllcyBpdC4KCj4KPiA+Cj4gPiB3
aXRoIGFueSBuciBiZXR3ZWVuIDEgYW5kIGZvbGlvX25yX3BhZ2VzKCksIHdlIGhhdmUgdG8gY29u
c2lkZXIgdHdvIGlzc3VlczoKPiA+IDEuIEhvdyB0byBza2lwIFBURSBjaGVja3MgaW5zaWRlIHBh
Z2Vfdm1hX21hcHBlZF93YWxrIGZvciBlbnRyaWVzIHRoYXQKPiA+IHdlcmUgYWxyZWFkeSBoYW5k
bGVkIGluIHRoZSBwcmV2aW91cyBiYXRjaDsKPgo+IFRoZXkgYXJlIGNsZWFyZWQgaWYgd2UgcmVh
Y2ggdGhhdCBwb2ludC4gU28gdGhlIHB0ZV9ub25lKCkgY2hlY2tzIHdpbGwKPiBzaW1wbHkgc2tp
cCB0aGVtPwo+Cj4gPiAyLiBIb3cgdG8gYnJlYWsgdGhlIGl0ZXJhdGlvbiB3aGVuIHRoaXMgYmF0
Y2ggaGFzIGFycml2ZWQgYXQgdGhlIGVuZC4KPgo+IHBhZ2Vfdm1hX21hcHBlZF93YWxrKCkgc2hv
dWxkIGJlIGRvaW5nIHRoYXQ/CgpJdCBzZWVtcyB5b3UgbWlnaHQgaGF2ZSBtaXNzZWQgdGhlIHBh
cnQgaW4gbXkgcmVwbHkgdGhhdCBzYXlzOgoiT2YgY291cnNlLCB3ZSBjb3VsZCBhdm9pZCBib3Ro
LCBidXQgdGhhdCB3b3VsZCBtZWFuIHBlcmZvcm1pbmcgdW5uZWNlc3NhcnkKY2hlY2tzIGluc2lk
ZSBwYWdlX3ZtYV9tYXBwZWRfd2FsaygpLiIKClRoYXTigJlzIHRydWUgZm9yIGJvdGguIEJ1dCBJ
4oCZbSB3b25kZXJpbmcgd2h5IHdl4oCZcmUgc3RpbGwgZG9pbmcgdGhlIGNoZWNrLApldmVuIHdo
ZW4gd2XigJlyZSBmYWlybHkgc3VyZSB0aGV54oCZdmUgYWxyZWFkeSBiZWVuIGNsZWFyZWQgb3Ig
d2XigJl2ZSByZWFjaGVkCnRoZSBlbmQgOi0pCgpTb21laG93LCBJIGZlZWwgd2UgY291bGQgY29t
YmluZSB5b3VyIGNsZWFudXAgY29kZeKAlHdoaWNoIGhhbmRsZXMgYSBiYXRjaApzaXplIG9mICJu
ciIgYmV0d2VlbiAxIGFuZCBucl9wYWdlc+KAlHdpdGggdGhlCiJpZiAobnJfcGFnZXMgPT0gZm9s
aW9fbnJfcGFnZXMoZm9saW8pKSBnb3RvIHdhbGtfZG9uZSIgY2hlY2suCkluIHByYWN0aWNlLCB0
aGlzIHdvdWxkIGxldCB1cyBza2lwIGFsbW9zdCBhbGwgdW5uZWNlc3NhcnkgY2hlY2tzLApleGNl
cHQgZm9yIGEgZmV3IHJhcmUgY29ybmVyIGNhc2VzLgoKRm9yIHRob3NlIGNvcm5lciBjYXNlcyB3
aGVyZSAibnIiIHRydWx5IGZhbGxzIGJldHdlZW4gMSBhbmQgbnJfcGFnZXMsCndlIGNhbiBqdXN0
IGxlYXZlIHRoZW0gYXMtaXPigJRwZXJmb3JtaW5nIHRoZSByZWR1bmRhbnQgY2hlY2sgaW5zaWRl
CnBhZ2Vfdm1hX21hcHBlZF93YWxrKCkuCgo+Cj4gLS0KPiBDaGVlcnMsCj4KPiBEYXZpZCAvIGRo
aWxkZW5iCj4KClRoYW5rcwpCYXJyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
