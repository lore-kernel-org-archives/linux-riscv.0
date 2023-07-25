Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D70C001DE
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 14:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPIBLjXwfQFY2w5B7pLqb31WLQkJbp4Ek0dJ//93564=; b=4Men8qwboMjisE
	sneSq+JwfTlBRkZproGisKkOFFPtf0rqr3Q5Q1amGDw2PYb7ICRhwb+I3ewFPnjPIAVmL7xD2k8nL
	Oam24By8vn6Owzdfj41hf7RMhtZpHbBQjlKwTQItfDzmIoIhPmu+u3pDuhdCeSZYPS0T+qpegm7up
	vLlrfmfDu4R//j++MeK0JSqtclYAaVty6Q9XesnN4tDIN1huPJgsfNJQF9Lout9kyVXEPBXj8QHAb
	wdzzOGzzMZ4tqngDLZjkKMWDYz8rWWXTxixH9ZWKYaalb5ooMBfJH+ELdzpmkkJpd54BnatU+pEn6
	oU0vRmMX3Pnwt4nGnSyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOJJU-007oKq-2T;
	Tue, 25 Jul 2023 14:47:00 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOJJR-007oIS-1b
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 14:46:59 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-579de633419so63744107b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 07:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690296413; x=1690901213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kxOdPyZyaJv5gxG+QtuGeWvPDhLsU0ZIVKhTdMmlNw=;
        b=fo7CVq6RdDZGlc+2SozjsmfVsOC4AJ1qMZ/GJK3DQthYMPgddLHSMOOBjubiMo4mdM
         Xc5deeE3yA7RJ7TXCQot3UIGjwX4zLxAhudH0I/0khHT5fiFGTjwtFSAqaNR+G8NEPrr
         50W2gW+cR1tIUjTiEmiwXKENje3oH6PHiLgqL5B9DlQvigIGSXpAfcfFEGh5hIL2i0Dp
         sYb7tpzeq44LS83swKajxld0JbdswM0iSnoGkKpO3Lpnv1Gumk2sd0rYQCcnSlplcjMD
         66Qtgy9++5hCHyAZxA7h+pU2dhOVJRbAYs5bDx83zDZkUDvO3Wjhp4ZOGCd2aFqeLEAr
         HR9w==
X-Gm-Message-State: ABy/qLZC4s43pWybStlfLo/epQPf2G2o5C9hkM+fTE/JUmh1g03mvMhB
	FeTpLshjNq8ltep2D2NAHKoXCbzAo2Egfw==
X-Google-Smtp-Source: APBJJlHheh1737Uip9NZwbBxD6EfXZWFUJx2v3pknFJ9RCpjHpfIWrmS9ODxJSFf4BeZIIFV400cRA==
X-Received: by 2002:a0d:cccb:0:b0:56d:3b1a:8641 with SMTP id o194-20020a0dcccb000000b0056d3b1a8641mr8050973ywd.23.1690296412718;
        Tue, 25 Jul 2023 07:46:52 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id r11-20020a81c30b000000b0057a57a9a932sm3497788ywk.107.2023.07.25.07.46.51
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 07:46:51 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-bcb6dbc477eso4818192276.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 07:46:51 -0700 (PDT)
X-Received: by 2002:a05:6902:1350:b0:c83:27d4:c0d6 with SMTP id
 g16-20020a056902135000b00c8327d4c0d6mr8607825ybu.37.1690296411349; Tue, 25
 Jul 2023 07:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230511181931.869812-1-tj@kernel.org> <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org> <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org> <ZK30CR196rs-OWLq@slm.duckdns.org>
 <CAMuHMdUCXPi+aS-7bR3qRetKF9T3W9jk_HKjvaXmfHv5SEeuFg@mail.gmail.com>
 <ZLXIvXBvhsnL-ik_@slm.duckdns.org> <CAMuHMdU8CGhsU-1PZNdWH1xjbWcWSg2s2RFAegXi+vs=d-0t8Q@mail.gmail.com>
 <ZLcLnoAoJmQ9WTuM@slm.duckdns.org>
In-Reply-To: <ZLcLnoAoJmQ9WTuM@slm.duckdns.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jul 2023 16:46:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUo=17kYsNEYr=qyVceRpJ4D3jMFrMOiqaH--OOhJOM4w@mail.gmail.com>
Message-ID: <CAMuHMdUo=17kYsNEYr=qyVceRpJ4D3jMFrMOiqaH--OOhJOM4w@mail.gmail.com>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE mechanism)
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, 
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-team@meta.com, 
	Linux PM list <linux-pm@vger.kernel.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, linux-rtc@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, netdev <netdev@vger.kernel.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>, 
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_074657_540113_90B2094D 
X-CRM114-Status: GOOD (  30.74  )
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

SGkgVGVqdW4sCgpPbiBXZWQsIEp1bCAxOSwgMjAyMyBhdCAxMjowMeKAr0FNIFRlanVuIEhlbyA8
dGpAa2VybmVsLm9yZz4gd3JvdGU6Cj4gT24gVHVlLCBKdWwgMTgsIDIwMjMgYXQgMTE6NTQ6NThB
TSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gSSBnYXZlIGl0IGEgdHJ5IG9u
IGEgc3lzdGVtIHdpdGggYW4gODAwIE1IeiBDb3J0ZXggQTksIG9ubHkgdG8gZGlzY292ZXIKPiA+
IGl0IG1ha2VzIG5vIGRpZmZlcmVuY2UsIGFzIHRoYXQgbWFjaGluZSBoYXMgMTYwMCBCb2dvTUlQ
UzoKPgo+IE9vcHMuCj4KPiA+IHdvcmtxdWV1ZTogYmxrX21xX3J1bl93b3JrX2ZuIGhvZ2dlZCBD
UFUgZm9yID4xMDAwMHVzIDQgdGltZXMsCj4gPiBjb25zaWRlciBzd2l0Y2hpbmcgdG8gV1FfVU5C
T1VORAo+Cj4gSXQgY291bGQgYmUgdGhhdCB3ZSBhY3R1YWxseSB3YW50IHRvIHN3aXRjaCB0byBV
TkJPVU5EIGZvciBzb21lIHJlcG9ydHMgYnV0Cj4gdGhlIGFib3ZlIHRyaWdnZXJpbmcgbW9zdCBs
aWtlbHkgaW5kaWNhdGVzIHRoYXQgdGhlIHRocmVzaG9sZCBpcyB0b28KPiBhZ2dyZXNzaXZlLgo+
Cj4gPiBBcnRpZmljaWFsbHkgbG93IEJvZ29NSVBTIG51bWJlcnMgb25seSBoYXBwZW4gb24gc3lz
dGVtcyB0aGF0IGhhdmUKPiA+IHRoZSByZWxhdGVkIHRpbWVycyAoQ29ydGV4IEE3L0ExNSBhbmQg
bGF0ZXIsIENvcnRleCBBOSBNUENvcmUsCj4gPiBhbmQgYXJtNjQpLgo+Cj4gQWgsIEkgc2VlLiBU
aGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4KPgo+ID4gSSB3aWxsIHRlc3Qgb24gbW9yZSBzeXN0
ZW1zLCBidXQgdGhhdCB3aWxsIHByb2JhYmx5IG5vdCBoYXBwZW4gdW50aWwKPiA+IG5leHQgd2Vl
ay4uLgo+Cj4gVGhhbmtzLCByZWFsbHkgYXBwcmVjaWF0ZSBpdC4gQ2FuIHlvdSB0cnkgdGhlIGZv
bGxvd2luZyBpbnN0ZWFkIHdoZW4geW91Cj4gaGF2ZSB0aW1lPyBJIGp1c3QgcHVzaGVkIHVwIHRo
ZSBsb3dlciBib3VuZGFyeSB0byA0MDAwIE1JUFMuIFRoZSBzY2FsaW5nIGlzCj4gc3RpbGwgY2Fw
cGVkIGF0IDFzLgoKVGhhbmtzLCB3aXRoIHRoZSBiZWxvdywgSSBzZWUgbm8gbW9yZSBXUV9VTkJP
VU5EIG1lc3NhZ2VzLgoKPiBGcm9tIDg1NTVjYmQ0YjIyZTVmODVlYjJiZGNiODRmZDFkMWY1MTlh
MGEwZDMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gRnJvbTogVGVqdW4gSGVvIDx0akBrZXJu
ZWwub3JnPgo+IERhdGU6IE1vbiwgMTcgSnVsIDIwMjMgMTI6NTA6MDIgLTEwMDAKPiBTdWJqZWN0
OiBbUEFUQ0hdIHdvcmtxdWV1ZTogU2NhbGUgdXAgd3FfY3B1X2ludGVuc2l2ZV90aHJlc2hfdXMg
aWYgQm9nb01JUFMgaXMKPiAgYmVsb3cgNDAwMAoKPiAtLS0gYS9rZXJuZWwvd29ya3F1ZXVlLmMK
PiArKysgYi9rZXJuZWwvd29ya3F1ZXVlLmMKCj4gQEAgLTY1MTMsNiArNjUxNiw0MiBAQCB2b2lk
IF9faW5pdCB3b3JrcXVldWVfaW5pdF9lYXJseSh2b2lkKQo+ICAgICAgICAgICAgICAgICFzeXN0
ZW1fZnJlZXphYmxlX3Bvd2VyX2VmZmljaWVudF93cSk7Cj4gIH0KPgo+ICtzdGF0aWMgdm9pZCBf
X2luaXQgd3FfY3B1X2ludGVuc2l2ZV90aHJlc2hfaW5pdCh2b2lkKQo+ICt7Cj4gKyAgICAgICB1
bnNpZ25lZCBsb25nIHRocmVzaDsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgbWlwczsKClRoaXMg
ZmFpbHMgdG8gYnVpbGQgb24gbWlwcy4KQXBwYXJlbnRseSBtaXBzIGlzIGEgcHJlZGVmaW5lZCBw
cmVwcm9jZXNzb3IgbWFjcm86CgokIGVjaG8gfCBtaXBzZWwtbGludXgtZ251LWdjYyAtZE0gLUUg
LSB8IGdyZXAgLXcgbWlwcwojZGVmaW5lIG1pcHMgMQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAg
ICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVy
ZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCklu
IHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlz
ZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
