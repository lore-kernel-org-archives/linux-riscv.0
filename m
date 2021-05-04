Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446D7C433ED
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 05:31:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B868E611EE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 05:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B868E611EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5TJPfPriSE/VDYtgXEGw747RUOSmadVSuP64Ud/n3Q=; b=aINVZ4LkX2supUheqrqNmqbBOz
	oRTFvRYzPGNEsYaGsdA/0B0qmmHXp/rlu7HKZVuoafq9jlYIhU42+Si3CNc7vA6IuYxm40ebYkll1
	8bFn8TZ+vCAQiD3Bv9tRSxDBQyZlvcyk7qlobq+lDoxJFQRDtuS3IUv1gM2+NacQ7x9L45+qOe+eJ
	UZR1UE0/my0sILhYZyVQM6VpWkFN5YA9EmecP9lyiO7I1A4R0+8OZX2raWcDBWlRBMKoLAHUHaU8j
	96fzwiC9DFWKpie3qRG++FeWkEGhDcice2JowAfRqISTlpFqwiezjssHa5K7e2OnzM//zkXR4Nej8
	qmgBzkag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldneM-00FTeL-A0; Tue, 04 May 2021 05:31:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldne5-00FTdA-Fl; Tue, 04 May 2021 05:30:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 MIME-Version:Content-ID:Content-Description;
 bh=JIb5joLaAZtZoBF2aVfUoFjvHChYmvO72pgWOlsF0Ag=; b=FS8Wav25+K39ja3VM2SpWehffB
 eu4l1W52o0fku91YnuxH61k4M9aAbEKhWtiVReCaoUcaBedtboEjoKpvMoorT0Wu/ZB3P80cy0oRI
 vU6y5eDZOTFBYMkVkXIG73xTA3wMFJb69qVBuMD2c0Wjs+SPXHvBZkfY4cbnZV+68chraqflbLFAj
 4X0g6cPEifJC3ZYtcK/CXQ9QhHX/3ykipxGtgcP6x+xmfKKimvu5667Ks/FTPg1i4LJDuFr4/6IYh
 CTSSz2Ez4N4cmLHraAcuBX8t73kf+bKfPpllw2/pJDNw/0mj2OiIazwqTGMfCBqFuFxEiQLxqOKd5
 G6ZuC8sg==;
Received: from mail.thorsis.com ([92.198.35.195])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldne2-003heQ-8O; Tue, 04 May 2021 05:30:56 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 044C41B3D;
 Tue,  4 May 2021 07:30:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xew6O0H1a2uJ; Tue,  4 May 2021 07:30:49 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 766AC10B4; Tue,  4 May 2021 07:30:48 +0200 (CEST)
Date: Tue, 4 May 2021 07:30:30 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Matthew Wilcox <willy@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Segher Boessenkool <segher@kernel.crashing.org>,
 Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <YJDb9uLQBgoy94Ub@ada-deb-carambola.ifak-system.com>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>,
 Matthew Wilcox <willy@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Segher Boessenkool <segher@kernel.crashing.org>,
 Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
 <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
 <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_223054_646790_FBCAD44C 
X-CRM114-Status: GOOD (  34.28  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8gQXJuZCwKCkFtIE1vbiwgTWF5IDAzLCAyMDIxIGF0IDExOjI1OjIxQU0gKzAyMDAgc2No
cmllYiBBcm5kIEJlcmdtYW5uOgo+IE9uIE1vbiwgTWF5IDMsIDIwMjEgYXQgOTozNSBBTSBBbGV4
YW5kZXIgRGFobCA8YWRhQHRob3JzaXMuY29tPiB3cm90ZToKPiA+Cj4gPiBEZXNrdG9wcyBhbmQg
c2VydmVycyBhcmUgYWxsIG5pY2UsIGhvd2V2ZXIgSSBqdXN0IHdhbnQgdG8gbWFrZSB5b3UKPiA+
IGF3YXJlLCB0aGVyZSBhcmUgZW1iZWRkZWQgdXNlcnMgZm9yY2VkIHRvIHN0aWNrIHRvIG9sZGVy
IGNyb3NzCj4gPiB0b29sY2hhaW5zIGZvciBkaWZmZXJlbnQgcmVhc29ucyBhcyB3ZWxsLCBlLmcu
IGluIGluZHVzdHJpYWwKPiA+IGVudmlyb25tZW50LiA6LSkKPiA+Cj4gPiBUaGlzIGlzIG5vIHNo
b3cgc3RvcHBlciBmb3IgdXMsIEkganVzdCB3YW50ZWQgdG8gbGV0IHlvdSBiZSBhd2FyZS4KPiAK
PiBDYW4geW91IGJlIG1vcmUgc3BlY2lmaWMgYWJvdXQgd2hhdCBzY2VuYXJpb3MgeW91IGFyZSB0
aGlua2luZyBvZiwKPiB3aGF0IHRoZSBtb3RpdmF0aW9ucyBhcmUgZm9yIHVzaW5nIGFuIG9sZCBj
b21waWxlciB3aXRoIGEgbmV3IGtlcm5lbAo+IG9uIGVtYmVkZGVkIHN5c3RlbXMsIGFuZCB3aGF0
IHlvdSB0aGluayBhIHJlYWxpc3RpYyBtYXhpbXVtCj4gdGltZSB3b3VsZCBiZSBiZXR3ZWVuIGNv
bXBpbGVyIHVwZGF0ZXM/CgpPbmUgcmVhc29uIG1pZ2h0IGJlIGNlcnRpZmljYXRpb24uIEZvciBj
ZXJ0YWluIGluZHVzdHJpYWwgYXBwbGljYXRpb25zCmxpa2Ugc3VwcG9ydCBmb3IgY29tcGxleCBm
aWVsZCBidXMgcHJvdG9jb2xzLCB5b3UgbmVlZCB0byBnZXQgeW91cgpkZXZpY2VzIHRlc3RlZCBi
eSBhbiBleHRlcm5hbCBwYXJ0bmVyIHJ1bm5pbmcgZXh0ZW5zaXZlIHRlc3Qgc3VpdGVzLgpUaGlz
IGlzIHRpbWUgY29uc3VtaW5nIGFuZCBleHBlbnNpdmUuIAoKQ2hhbmdpbmcgdGhlIHRvb2xjaGFp
biBvZiB5b3VyIHN5c3RlbSB0aGVuLCB3b3VsZCBiZSBhIG1hc3NpdmUgY2hhbmdlCndoaWNoIHdv
dWxkIHJlcXVpcmUgcmVjZXJ0aWZpY2F0aW9uLCB3aGlsZSB5b3UgY291bGQgYXJndWUganVzdAp1
cGRhdGluZyBhIHNpbmdsZSBjb21wb25lbnQgbGlrZSB0aGUga2VybmVsIGFuZCBidWlsZGluZyBl
dmVyeXRoaW5nCmFnYWluLCBkb2VzIG5vdCByZXF1aXJlIHRoZSB3aG9sZSB0ZXN0aW5nIHByb2Nl
c3MgYWdhaW4uIAoKVGhpbiBpY2UsIEkga25vdy4KCj4gT25lIHNjZW5hcmlvIHRoYXQgSSd2ZSBz
ZWVuIHByZXZpb3VzbHkgaXMgd2hlcmUgdXNlciBzcGFjZSBhbmQKPiBrZXJuZWwgYXJlIGJ1aWx0
IHRvZ2V0aGVyIGFzIGEgc291cmNlIGJhc2VkIGRpc3RyaWJ1dGlvbiAoT0UsIGJ1aWxkcm9vdCwK
PiBvcGVud3J0LCAuLi4pLCBhbmQgdGhlIGNvbXBpbGVyIGlzIHBpY2tlZCB0byBtYXRjaCB0aGUg
b3JpZ2luYWwgc291cmNlcwo+IG9mIHRoZSB1c2VyIHNwYWNlIGJlY2F1c2UgdGhhdCBpcyBiZXN0
IHRlc3RlZCwgYnV0IHRoZSBzYW1lIGNvbXBpbGVyCj4gdGhlbiBnZXRzIHVzZWQgdG8gYnVpbGQg
dGhlIGtlcm5lbCBhcyB3ZWxsIGJlY2F1c2UgdGhhdCBpcyB0aGUgZGVmYXVsdAo+IGluIHRoZSBi
dWlsZCBlbnZpcm9ubWVudC4KCk9uZSBwcm9ibGVtIHdlIGFjdHVhbGx5IHJhbiBpbnRvIGluIEJT
UHMgbGlrZSB0aGF0ICh3ZSBidWlsZCB3aXRoCnB0eGRpc3QsIGhvd2V2ZXIgYnVpbGQgc3lzdGVt
IGRvZXNuJ3QgbWF0dGVyIGhlcmUsIGl0IGNvdWxkIGFzIHdlbGwKaGF2ZSBiZWVuIGJ1aWxkcm9v
dCBldGMuKSB3YXMgdGhpbmdzKiBmYWlsaW5nIHRvIGJ1aWxkIHdpdGggbmV3ZXIKY29tcGlsZXJz
LCB0aGluZ3Mgd2UgY291bGQgbm90IG9yIGRpZCBub3Qgd2FudCB0byBmaXgsIHNvIHN0YXlpbmcg
d2l0aAphbiBvbGRlciB0b29sY2hhaW4gd2FzIHRoZSBvYnZpb3VzIGNob2ljZS4gCgoqVGhpbmdz
IGFzIGluIGJvb3Rsb2FkZXJzIGZvciBhbiBhcm12NSBwbGF0Zm9ybS4KCj4gVGhlcmUgYXJlIHR3
byBwcm9ibGVtcyBJIHNlZSB3aXRoIHRoaXMgbG9naWM6Cj4gCj4gLSBSdW5uaW5nIHRoZSBsYXRl
c3Qga2VybmVsIHRvIGF2b2lkIHNlY3VyaXR5IHByb2JsZW1zIGlzIG9mIGNvdXJzZQo+ICAgYSBn
b29kIGlkZWEsIGJ1dCBpZiBvbmUgcnVucyB0aGF0IHdpdGggdGVuIHllYXIgb2xkIHVzZXIgc3Bh
Y2UgdGhhdAo+ICAgaXMgbmV2ZXIgdXBkYXRlZCwgdGhlIHN5c3RlbSBpcyBsaWtlbHkgdG8gZW5k
IHVwIGp1c3QgYXMgaW5zZWN1cmUuCj4gICBOb3QgYWxsIGJ1Z3MgYXJlIGluIHRoZSBrZXJuZWwu
CgpBZ3JlZWQuCgo+IC0gVGhlIHNhbWUgbG9naWMgdGhhdCBhcHBsaWVzIHRvIGFuY2llbnQgdXNl
ciBzcGFjZSBzdGF5aW5nIHdpdGgKPiAgIGFuIGFuY2llbnQgY29tcGlsZXIgKGl0J3MgYmV0dGVy
IHRlc3RlZCBpbiB0aGlzIGNvbWJpbmF0aW9uKSBhbHNvCj4gICBhcHBsaWVzIHRvIHRoZSBrZXJu
ZWw6IHJ1bm5pbmcgdGhlIGxhdGVzdCBrZXJuZWwgb24gYW4gb2xkIGNvbXBpbGVyCj4gICBpcyBz
b21ldGhpbmcgdGhhdCBmZXcgcGVvcGxlIHRlc3QsIGFuZCB0ZW5kcyB0byBydW4gaW50byBtb3Jl
IGJ1Z3MKPiAgIHRoYW4gdXNpbmcgdGhlIGNvbXBpbGVyIHRoYXQgb3RoZXIgZGV2ZWxvcGVycyB1
c2VkIHRvIHRlc3QgdGhhdAo+ICAga2VybmVsLgoKV2hhdCB3ZSBhY3R1YWxseSBkaWQ6IGJ1aWxk
aW5nIHJlY2VudCB1c2Vyc3BhY2UgYW5kIGtlcm5lbCB3aXRoIG9sZGVyCnRvb2xjaGFpbnMsIGJl
Y2F1c2UgYm9vdGxvYWRlci4gSSBrbm93LCB0aGVyZSBhcmUgc2V2ZXJhbApwb3NzaWJpbGl0aWVz
IHRvIHNvbHZlIHRoaXMga2luZCBvZiBsb2NrOgoKLSBidWlsdCBib290bG9hZGVyIHdpdGggZGlm
ZmVyZW50IGNvbXBpbGVyCi0gdXBkYXRlIGJvb3Rsb2FkZXIKLSDigKYKCkFzIHNhaWQgYmVmb3Jl
LCB0aGlzIGlzIG5vIHByb2JsZW0gZm9yIG1lIG5vdywgSSBjYW4gd29yayBhcm91bmQgaXQsCmJ1
dCB0byBnaXZlIGFuIGlkZWEgd2hhdCBjb3VsZCBrZWVwIHBlb3BsZSBvbiBvbGRlciB0b29sY2hh
aW5zLgoKR3JlZXRzCkFsZXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
