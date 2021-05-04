Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4CEC433ED
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 06:34:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DF326112D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 06:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DF326112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F6OxG4DwR1mNrv0IIOCBGDft7n1jXTg4XbRqcp+TO4s=; b=Ajvukw9odV93SVlhFx27t+rI2
	IQjw8zlzviwyKFHkdWZCC3/SSrADz+GcW9cEz1aBDjCJGVoRfL0UUfvIbUqh/sI+wDG8aw6pbEPQb
	IuUC2ys0SFySSbuO/gmj0RXfgwKEp50Wle43YdJmSTQjRuNoJKd9SFxNrpnGZ8DDUa4RzexaXLtTT
	hV+EorOtJfMH8SmQ8iJZ+el2BKTEDdIHq/EWnQTtTtoNSbebUDdLKCHWbnoWguceNlJy96E0lcAuD
	wS6yPXb0HQGfAGcAcv4npjPmL7UJHvN1j+q/IKUrbSOuDNJxZ6bUqM3eV3waBLoGlpg/spRh5GXCm
	2BH3+pQCg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldod6-00FY1d-EI; Tue, 04 May 2021 06:34:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldocs-00FY0t-Bv; Tue, 04 May 2021 06:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=Cr9bq3AeMTc0RLaOsYs4jb+G4EVFywv5aJOknoXcB9E=; b=398CFtOik12U41wXGjFO1M9A6O
 tTZXp74cp2mgTuPCFATYd3crhSpIzN7UTmQ59YXnEOmfLoPYWlugcLy6jvC4et+gfBE6Gu67qurEX
 j71ZYr475f4LKg4XPYYXgFqKnUWyxhdZH1R8PNj4lsBRsSuHVXLVMTIACQ7QYs9V1ctE/IO6ECzAs
 QZrGl18TELhWms0NORzLSWMVRmrrm9qUtj7GhqwKBuv6jVan1BojYcUuBIQLvb2n+UMNIZNka0siT
 8lX6fP/gTYK82TZfRCtXc8SAWEVD1sqgxQLWXVWNQNEOsuYVWIlgyhWnKLqhGF093E+ShrwrsCwe5
 F1P5hu8A==;
Received: from pegase2.c-s.fr ([93.17.235.10])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldoco-003jA9-E7; Tue, 04 May 2021 06:33:44 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FZ95j6mwJz9sVX;
 Tue,  4 May 2021 08:33:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGDPogYyxA6u; Tue,  4 May 2021 08:33:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FZ95j5hZJz9sVW;
 Tue,  4 May 2021 08:33:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8088B8B78D;
 Tue,  4 May 2021 08:33:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id keUR0x4FyadH; Tue,  4 May 2021 08:33:29 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C34068B763;
 Tue,  4 May 2021 08:33:27 +0200 (CEST)
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Arnd Bergmann <arnd@arndb.de>, Matthew Wilcox <willy@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Segher Boessenkool <segher@kernel.crashing.org>,
 Joe Perches <joe@perches.com>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>,
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
 <YJDb9uLQBgoy94Ub@ada-deb-carambola.ifak-system.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6615493a-252c-ee40-a9fa-27cf5ad8922b@csgroup.eu>
Date: Tue, 4 May 2021 08:33:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YJDb9uLQBgoy94Ub@ada-deb-carambola.ifak-system.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_233342_668992_9DBDCB46 
X-CRM114-Status: GOOD (  16.53  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAwNC8wNS8yMDIxIMOgIDA3OjMwLCBBbGV4YW5kZXIgRGFobCBhIMOpY3JpdMKgOgo+IEhl
bGxvIEFybmQsCj4gCj4gQW0gTW9uLCBNYXkgMDMsIDIwMjEgYXQgMTE6MjU6MjFBTSArMDIwMCBz
Y2hyaWViIEFybmQgQmVyZ21hbm46Cj4+IE9uIE1vbiwgTWF5IDMsIDIwMjEgYXQgOTozNSBBTSBB
bGV4YW5kZXIgRGFobCA8YWRhQHRob3JzaXMuY29tPiB3cm90ZToKPj4+Cj4+PiBEZXNrdG9wcyBh
bmQgc2VydmVycyBhcmUgYWxsIG5pY2UsIGhvd2V2ZXIgSSBqdXN0IHdhbnQgdG8gbWFrZSB5b3UK
Pj4+IGF3YXJlLCB0aGVyZSBhcmUgZW1iZWRkZWQgdXNlcnMgZm9yY2VkIHRvIHN0aWNrIHRvIG9s
ZGVyIGNyb3NzCj4+PiB0b29sY2hhaW5zIGZvciBkaWZmZXJlbnQgcmVhc29ucyBhcyB3ZWxsLCBl
LmcuIGluIGluZHVzdHJpYWwKPj4+IGVudmlyb25tZW50LiA6LSkKPj4+Cj4+PiBUaGlzIGlzIG5v
IHNob3cgc3RvcHBlciBmb3IgdXMsIEkganVzdCB3YW50ZWQgdG8gbGV0IHlvdSBiZSBhd2FyZS4K
Pj4KPj4gQ2FuIHlvdSBiZSBtb3JlIHNwZWNpZmljIGFib3V0IHdoYXQgc2NlbmFyaW9zIHlvdSBh
cmUgdGhpbmtpbmcgb2YsCj4+IHdoYXQgdGhlIG1vdGl2YXRpb25zIGFyZSBmb3IgdXNpbmcgYW4g
b2xkIGNvbXBpbGVyIHdpdGggYSBuZXcga2VybmVsCj4+IG9uIGVtYmVkZGVkIHN5c3RlbXMsIGFu
ZCB3aGF0IHlvdSB0aGluayBhIHJlYWxpc3RpYyBtYXhpbXVtCj4+IHRpbWUgd291bGQgYmUgYmV0
d2VlbiBjb21waWxlciB1cGRhdGVzPwo+IAo+IE9uZSByZWFzb24gbWlnaHQgYmUgY2VydGlmaWNh
dGlvbi4gRm9yIGNlcnRhaW4gaW5kdXN0cmlhbCBhcHBsaWNhdGlvbnMKPiBsaWtlIHN1cHBvcnQg
Zm9yIGNvbXBsZXggZmllbGQgYnVzIHByb3RvY29scywgeW91IG5lZWQgdG8gZ2V0IHlvdXIKPiBk
ZXZpY2VzIHRlc3RlZCBieSBhbiBleHRlcm5hbCBwYXJ0bmVyIHJ1bm5pbmcgZXh0ZW5zaXZlIHRl
c3Qgc3VpdGVzLgo+IFRoaXMgaXMgdGltZSBjb25zdW1pbmcgYW5kIGV4cGVuc2l2ZS4KPiAKPiBD
aGFuZ2luZyB0aGUgdG9vbGNoYWluIG9mIHlvdXIgc3lzdGVtIHRoZW4sIHdvdWxkIGJlIGEgbWFz
c2l2ZSBjaGFuZ2UKPiB3aGljaCB3b3VsZCByZXF1aXJlIHJlY2VydGlmaWNhdGlvbiwgd2hpbGUg
eW91IGNvdWxkIGFyZ3VlIGp1c3QKPiB1cGRhdGluZyBhIHNpbmdsZSBjb21wb25lbnQgbGlrZSB0
aGUga2VybmVsIGFuZCBidWlsZGluZyBldmVyeXRoaW5nCj4gYWdhaW4sIGRvZXMgbm90IHJlcXVp
cmUgdGhlIHdob2xlIHRlc3RpbmcgcHJvY2VzcyBhZ2Fpbi4KCk5vdCBzdXJlIHRvIGZvbGxvdyB5
b3UuCgpPdXIgY29tcGFueSBwcm92aWRlcyBzeXN0ZW1zIGZvciBBaXIgVHJhZmljIENvbnRyb2ws
IHNvIHdlIGhhdmUgdGhlIHNhbWUga2luZCBvZiBhc3N1cmFuY2UgcXVhbGl0eSAKcHJvY2Vzcywg
YnV0IHRoZW4gSSBjYW4ndCB1bmRlcnN0YW5kIHdoeSB5b3Ugd291bGQgbmVlZCB0byB1cGdyYWRl
IHlvdXIga2VybmVsIGF0IGFsbC4KClRvZGF5IG91ciBzeXN0ZW0gaXMgYmFzZWQgb24gR0NDIDUg
YW5kIEtlcm5lbCA0LjE0LiBBdCB0aGUgdGltZSBiZWluZyB3ZSBhcmUgdXNpbmcgR0NDIDUuNSAo
TGF0ZXN0IApHQ0MgNSkgYW5kIGtlcm5lbCA0LjE0LjIzMiAoTGF0ZXN0IDQuMTQueSkuIEtlcm5l
bCA0LjE0IGlzIG1haW50YWluZWQgdW50aWwgMjAyNC4KClRoZSBkYXkgd2UgZG8gYW4gdXBncmFk
ZSwgd2UgdXBncmFkZSBldmVyeXRoaW5nIGluY2x1ZGluZyB0aGUgdG9vbCBjaGFpbiB0aGVuIHdl
IGdvIGZvciBhbm90aGVyIDYgCnllYXJzIHdpdGhvdXQgbWFqb3IgY2hhbmdlcy9yZS1xdWFsaWZp
Y2F0aW9uLCBiZWNhdXNlIHdlIGNhbid0IGFmZm9yZCBhIG5ldyBxdWFsaXRpY2F0aW9uIGV2ZXJ5
IG5vdyAKYW5kIHRoZW4uCgoKU28gcmVhbGx5LCBJIGNhbid0IHNlZSB5b3VyIGFwcHJvYWNoLgoK
Q2hyaXN0b3BoZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
