Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03B4C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDFIRq+QpE3vJvqa8Hz7yVXuj37GVasGbg3IImY9e7c=; b=uHu8wMUhYAidHg
	B5KW7vh2IYYQDNXsFMT4TqFCRQif//52uTvZ3dFiuv8meIhSU7k5Bw2TCE1RfNk6LlECQESoR5ttt
	qU8rS5VLRfZFRf+RI/NR+HnQx/QM1fEdIM7t2VMuzuuJOIVzEp6LvTU4nOageYcBTYlLWpclP0s6F
	VCCvZHhEdyISDN5uC/jMKEdHsRK9iRkSfIw6hpFrM3cvwH5egKJ/8g8AZLtnKebhU2d4lqgGQTTpn
	5ooODvRHPbsdZjo/VWYVygK/wkEMn6UNW9HMB4rcy5MHTgV3C7Ukhn/AqHw5O1t9ZZqNRw5llIJRk
	TAj5tdiT0KIuDIhI3wBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQAci-002Ypz-La; Thu, 09 Feb 2023 17:22:16 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQAcg-002Yon-5o
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 17:22:16 +0000
Received: by mail-wr1-x42e.google.com with SMTP id o18so2518455wrj.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 09:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAFkfNbHiEr8HwllJiz8cfs+MhJWHOf8ZZUUPVU/5ao=;
        b=YIsyNnM7IEL0PBzA+DW56tRnpXI97JX8dmpOEDgFX4aBvm2xrtL8yUwCl2bLdkTRNp
         L1xe87XzKjHOnIR8dyVn4lDW81ATvYVC6tsPWmKOyfG/VbEYx20QjI9UlrN/PlTWD5hs
         5smBqcX1wYxIch4uJimFGTByjlVOId7FGguVvdw5YZFgNIzJFCnhm9e4ydnH2ajnFu5v
         WMmCUcE8zpUnTqOCrm8eCyLt4Cq1SXCiVuBUh7vDJxI7pIEcJsVwE5zfp5+zQt+e0E4O
         CHSXd1vB3/Taa/CgifJGSLQNhX8u3EvVHu0bCZHkFxy7oJChS+y4Bgqr8b/UqfM2ML8a
         x6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAFkfNbHiEr8HwllJiz8cfs+MhJWHOf8ZZUUPVU/5ao=;
        b=wloKXJGDGvN9UNfZWBF9qeSfM6dG4DdxbGI1OOihyQMXTe2BS1uQM5CgibzQAODCvD
         EaVhCMAEPVwh4/I/sx2BbKhrvBrT3Cik2OBcXqDEcYUe811KYhl9/Qzvl3g3RACCgoNd
         oQi+43qu66rkaSoi0vkWBmHFM6MEq4qR+Ze92IqI4lIKwhJUT8sK2y4FMoj8V32urBH1
         wN1Kkxt94AqSP/8WZ0Qi9YQxcHOIrGUlWiQiJe1ji3q01fMxdGHFra2yRTH9a9E4GeCk
         4q0K5vgoR4tQoDIFmsbYlNHWC5q9Q3mi3tNCAy7r+YrPFS+fzjC1orK46tKty3YoLpR3
         OcMw==
X-Gm-Message-State: AO0yUKXQsAp0Qnd/8oa/jtfvJG/Wd9Fz4b7X3SuxytwavSG/KgPMWpNh
	MmQLzZcSUR09UetsCyQPHnJwjA==
X-Google-Smtp-Source: AK7set8V+ghH5F2VLXDSfjNTPZ+GSq8/0Ptcc3LLJJGbooMrIkILqpG3+jEjkwFIwVG1hV+FHSu5Aw==
X-Received: by 2002:adf:f708:0:b0:2c5:3cd6:4fdf with SMTP id r8-20020adff708000000b002c53cd64fdfmr2440362wrp.39.1675963330574;
        Thu, 09 Feb 2023 09:22:10 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id x1-20020adfffc1000000b002425be3c9e2sm1700768wrs.60.2023.02.09.09.22.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Feb 2023 09:22:10 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <Y+UpqHstcMahbadE@kroah.com>
Date: Thu, 9 Feb 2023 17:22:09 +0000
Cc: Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Vineet Gupta <vineetg@rivosinc.com>,
 Heiko Stuebner <heiko@sntech.de>,
 slewis@rivosinc.com,
 Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Bresticker <abrestic@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Atish Patra <atishp@rivosinc.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Celeste Liu <coelacanthus@outlook.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Dao Lu <daolu@rivosinc.com>,
 Guo Ren <guoren@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Ruizhe Pan <c141028@gmail.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Tobias Klauser <tklauser@distanz.ch>,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Message-Id: <F4C20D57-912B-489F-A262-51EAEE79F41D@jrtc27.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-3-evan@rivosinc.com> <Y+HsE397cY4HF+5K@kroah.com>
 <C3C21677-5250-4120-9A4F-24945C1EE51B@kernel.org>
 <CALs-HsvuX-Uj5g9c6vvUp=MaUpdcPdpwwQCsxzjoXpqS+3LEsA@mail.gmail.com>
 <Y+UpqHstcMahbadE@kroah.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_092214_222988_61756185 
X-CRM114-Status: GOOD (  31.73  )
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

T24gOSBGZWIgMjAyMywgYXQgMTc6MTMsIEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPiB3cm90ZToKPiBPbiBUaHUsIEZlYiAwOSwgMjAyMyBhdCAwOTowOToxNkFNIC0wODAwLCBF
dmFuIEdyZWVuIHdyb3RlOgo+PiBPbiBNb24sIEZlYiA2LCAyMDIzIGF0IDEwOjMyIFBNIENvbm9y
IERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+PiAKPj4+IEhleSBFdmFuLCBHcmVn
LAo+Pj4gCj4+PiAKPj4+IE9uIDcgRmVicnVhcnkgMjAyMyAwNjoxMzozOSBHTVQsIEdyZWcgS0gg
PGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPj4+PiBPbiBNb24sIEZlYiAwNiwg
MjAyMyBhdCAxMjoxNDo1MVBNIC0wODAwLCBFdmFuIEdyZWVuIHdyb3RlOgo+Pj4+PiBXZSBkb24n
dCBoYXZlIGVub3VnaCBzcGFjZSBmb3IgdGhlc2UgYWxsIGluIEVMRl9IV0NBUHssMn0gYW5kIHRo
ZXJlJ3Mgbm8KPj4+Pj4gc3lzdGVtIGNhbGwgdGhhdCBxdWl0ZSBkb2VzIHRoaXMsIHNvIGxldCdz
IGp1c3QgcHJvdmlkZSBhbiBhcmNoLXNwZWNpZmljCj4+Pj4+IG9uZSB0byBwcm9iZSBmb3IgaGFy
ZHdhcmUgY2FwYWJpbGl0aWVzLiAgVGhpcyBjdXJyZW50bHkganVzdCBwcm92aWRlcwo+Pj4+PiBt
e2FyY2gsaW1wLHZlbmRvcn1pZCwgYnV0IHdpdGggdGhlIGtleS12YWx1ZSBwYWlycyB3ZSBjYW4g
cGFzcyBtb3JlIGluCj4+Pj4+IHRoZSBmdXR1cmUuCj4+Pj4gCj4+Pj4gSWNrLCB0aGlzIGlzIGV4
YWN0bHkgd2hhdCBzeXNmcyBpcyBkZXNpZ25lZCB0byBleHBvcnQgaW4gYSBzYW5lIHdheS4KPj4+
PiBXaHkgbm90IGp1c3QgdXNlIHRoYXQgaW5zdGVhZD8gIFRoZSAia2V5IiB3b3VsZCBiZSB0aGUg
ZmlsZW5hbWUsIGFuZCB0aGUKPj4+PiB2YWx1ZSB0aGUgdmFsdWUgcmVhZCBmcm9tIHRoZSBmaWxl
bmFtZS4gIElmIHRoZSBrZXkgaXMgbm90IHByZXNlbnQsIHRoZQo+Pj4+IGZpbGUgaXMgbm90IHBy
ZXNlbnQgYW5kIGl0J3Mgb2J2aW91cyB3aGF0IGlzIGhhcHBlbmluZywgbm8gZmFuY3kgcGFyc2lu
Zwo+Pj4+IGFuZCBBQkkgaXNzdWVzIGF0IGFsbC4KPj4+IAo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcmlzY3YvMjAyMjEyMDExNjA2MTQueHBvbWxxcTJmenB6Zm1jbUBrYW16aWsv
Cj4+PiAKPj4+IFRoaXMgaXMgdGhlIHN5c2ZzIGludGVyZmFjZSB0aGF0IEkgbWVudGlvbmVkIGRy
ZXcKPj4+IHN1Z2dlc3RlZCBvbiB0aGUgdjEuCj4+PiBJIHRoaW5rIGl0IGZpdHMgfnBlcmZlY3Rs
eSB3aXRoIHdoYXQgR3JlZyBpcyBzdWdnZXN0aW5nIHRvby4KPj4gCj4+IFdob29wcywgSSdsbCBh
ZG1pdCBJIG1pc3NlZCB0aGF0IGNvbW1lbnQgd2hlbiBJIHJldmlld2VkIHRoZSBmZWVkYmFjawo+
PiBmcm9tIHYxLiBJIHNwZW50IHNvbWUgdGltZSB0aGlua2luZyBhYm91dCBzeXNmcy4gVGhlIHBy
b2JsZW0gaXMgdGhpcwo+PiBpbnRlcmZhY2Ugd2lsbCBiZSBuZWVkZWQgaW4gcGxhY2VzIGxpa2Ug
dmVyeSBlYXJseSBwcm9ncmFtIHN0YXJ0dXAuIElmCj4+IHdlJ3JlIHRyeWluZyB0byB1c2UgdGhp
cyBpbiBwbGFjZXMgbGlrZSB0aGUgaWZ1bmMgc2VsZWN0b3IgdG8gZGVjaWRlCj4+IHdoaWNoIG1l
bWNweSB0byB1c2UsIGhhdmluZyB0byBnbyBvcGVuIGFuZCByZWFkIGEgZmlzdGZ1bCBvZiBmaWxl
cyBpcwo+PiBnb2luZyB0byBiZSBjb21wbGV4IHRoYXQgZWFybHksIGFuZCByb3VnaCBvbiBwZXJm
b3JtYW5jZS4KPiAKPiBIb3cgaXMgaXQgZ29pbmcgdG8gYmUgYW55IGRpZmZlcmVudCBvbiAicGVy
Zm9ybWFuY2UiIHRoYW4gYSBzeXNjYWxsPyAgT3IKPiBjb21wbGV4PyAgSXQgc2hvdWxkIGJlIGFs
bW9zdCBpZGVudGljYWwgb3ZlcmFsbCBhcyB0aGlzIGlzIGFsbCBpbi1yYW0KPiBhbmQgbm90IGFu
eSByZWFsIEkvbyBpcyBoYXBwZW5pbmcuICBZb3UgYXJlIGxpbWl0ZWQgb25seSBieSB0aGUgc3Bl
ZWQgb2YKPiB5b3VyIGNwdS4KPiAKPj4gUmVhbGx5IHRoaXMgaXMgZGF0YSB0aGF0IHdvdWxkIGdv
IGdyZWF0IGluIHRoZSBhdXggdmVjdG9yLCBleGNlcHQKPj4gdGhlcmUncyBwcm9iYWJseSB0b28g
bXVjaCBvZiBpdCB0byBqdXN0aWZ5IHByZXBhcmluZyBhbmQgY29weWluZyBpbnRvCj4+IGV2ZXJ5
IG5ldyBwcm9jZXNzLiBZb3UgY291bGQgcG9pbnQgdGhlIGF1eCB2ZWN0b3IgaW50byBhIHZEU08g
ZGF0YQo+PiBhcmVhLiBUaGlzIGhhcyB0aGUgYWR2YW50YWdlIG9mIGdyZWF0IHBlcmZvcm1hbmNl
IGFuZCBubyBzeXNjYWxsLCBidXQKPj4gaGFzIHRoZSBkaXNhZHZhbnRhZ2VzIG9mIG1ha2luZyB0
aGF0IGRhdGEgQUJJLCBhbmQgcmVxdWlyaW5nIGl0IGFsbCB0bwo+PiBiZSBrbm93biB1cCBmcm9u
dCAoZWcgdGhlIGtlcm5lbCBjYW4ndCBjb21wdXRlIGFueSBhbnN3ZXJzIG9uIHRoZQo+PiBmbHkp
Lgo+PiAKPj4gQWZ0ZXIgZGlzY3Vzc2lvbnMgd2l0aCBQYWxtZXIsIG15IHBsYW4gZm9yIHRoZSBu
ZXh0IHZlcnNpb24gaXMgdG8gbW92ZQo+PiB0aGlzIGludG8gYSB2RFNPIGZ1bmN0aW9uIHBsdXMg
YSBzeXNjYWxsLiBQcml2YXRlIHZEU08gZGF0YSB3aWxsIGJlCj4+IHByZXBwZWQgd2l0aCBjb21t
b24gYW5zd2VycyBmb3IgdGhlICJhbGwgQ1BVcyIgY2FzZSwgYXZvaWRpbmcgdGhlIG5lZWQKPj4g
Zm9yIGEgc3lzY2FsbCBpbiBtb3N0IGNhc2VzIGFuZCBtYWtpbmcgdGhpcyBmYXN0LiBTaW5jZSB0
aGUgZGF0YSBpcwo+PiBoaWRkZW4gYmVoaW5kIHRoZSB2ZHNvIGZ1bmN0aW9uLCBpdCdzIG5vdCBB
QkksIHdoaWNoIGlzIGEgcGx1cy4gVGhlbgo+PiB0aGUgdmRzbyBmdW5jdGlvbiBjYW4gZmFsbCBi
YWNrIHRvIHRoZSBzeXNjYWxsIGZvciBjYXNlcyB3aXRoIGV4b3RpYwo+PiBDUFUgbWFza3Mgb3Ig
a2V5cyB0aGF0IGFyZSB1bmtub3duL2V4cGVuc2l2ZSB0byBjb21wdXRlIGF0IHJ1bnRpbWUuCj4g
Cj4gSSBzdGlsbCB0aGluayB0aGF0J3Mgd3JvbmcsIGFzIHlvdSBhcmUgd2FudGluZyBhIHNldCBv
ZiBrZXkvdmFsdWVzIGhlcmUsCj4gd2hpY2ggaXMgZXhhY3RseSB3aGF0IHN5c2ZzIGlzIGRlc2ln
bmVkIGZvci4KCkJ1dCB0aGlzIG5lZWRzIHRvIGJlIGEgUklTQy1WIHN0YW5kYXJkIGludGVyZmFj
ZSB0aGF0IGNhbiBiZSBwcm9ncmFtbWVkCmFnYWluc3QsIG5vdCBzb21ldGhpbmcgdGllZCB0byBo
aWdobHkgTGludXgtc3BlY2lmaWMgdGhpbmdzIGxpa2Ugc3lzZnMuCllvdeKAmXJlIGZyZWUgdG8g
aW1wbGVtZW50IHRoYXQgaW50ZXJmYWNlIHdpdGggc3lzZnMsIGJ1dCBleHBvc2luZyB0aGF0CmFz
ICp0aGUqIGludGVyZmFjZSB0byB1c2Ugd291bGQgYmUgdGVycmlibGUgZm9yIHBvcnRhYmlsaXR5
LgoKSmVzcwoKPiBQbGVhc2UgYmVuY2htYXJrIHRoaXMgZmlyc3QuICBIZWNrLCBpZiB5b3UgZG9u
J3QgbGlrZSB0aGUKPiBvcGVuL3JlYWQvY2xvc2Ugc3lzY2FsbCBvdmVyaGVhZCwgdXNlIG15IHJl
YWRmaWxlKCkgc3lzY2FsbCBwYXRjaCB0aGF0IEkKPiBrZWVwIHByb3Bvc2luZyBldmVyeSA2IG1v
bnRocyBvciBzbyB0byByZW1vdmUgdGhhdCBvdmVyaGVhZC4gIFRoYXQgd291bGQKPiBiZSBhIGdv
b2QgcmVhc29uIHRvIGdldCB0aGF0IGNvZGUgYWNjZXB0ZWQgZmluYWxseSA6KQo+IAo+IHRoYW5r
cywKPiAKPiBncmVnIGstaAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
