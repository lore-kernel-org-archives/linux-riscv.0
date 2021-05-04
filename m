Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A029CC43461
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 12:26:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E970C613BC
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 12:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E970C613BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jA531wrKCR9Ggyuqw9hJUHHs+wRRJoD5E45VIu1V2mc=; b=aNsBA/wOniBjsGPaA455VS67q
	OIH8LZcPj+hstZPG/ND5TnJrkwyLXikGeGvlb6HpYeTcVPig+vM0+KLqH9kep65ScQzoyjL8iExfO
	vO2ZKxvM0KohiM7H4VhXFqvn6Ao5zDe9oUj3GSf75PSACsp3ugS5sHuyjIdsbVZlrv9IE5d8XOEPQ
	uVxUUUH7WDLvTZcrC9AbeMnXdpcr3Ez5dZk3ZD3HC7Xk+07ki9rNZMgZvHd67sfNbTjcG9pnWCMgf
	tj7sZjIO3myg1DssIJtaBXJ+nbh2nFMupsHfAmP0MkNRJb2xRQzHAAaUQc1ihgs6T5N0aslZkLiyR
	MKxBlH4hA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldu8P-00GBFg-Vi; Tue, 04 May 2021 12:26:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldu8D-00GBEy-M7; Tue, 04 May 2021 12:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=0knHo+9DvhYCzeCdJfMoSMfrf82ODtrVp05DO5ZDPrQ=; b=42BdZEDVJpfurS8FbRRjYbKYAz
 8BR+9FrF1VuSeztfRrfANhCD5INePwZKaNEmMZOEZxg7zQxL0sykfDFsqNlFnX2nvF/VxKYEexi/9
 P5bQeeFrQWlkEoFF+BJ7qwU43V6OSLHJnvQo2tJe+nCopNfSi3cBCO+5Ko1OSJxQF7rPeTDcMiQJq
 +jYYZGOfp7Q5QeuZ7zqehlaBitsKrdBtCRKgENfsyINgQul6djXULbeICxSbYUuvT+LjtEoaX2OpA
 NHy/aCFMpwf1uIZ8J3l6KzLxmwHgQUN1eV5w90PXsrotB074sSxKvtXmE7GhPq4nXj1+55TvprpK5
 J0b5Y1eg==;
Received: from pegase2.c-s.fr ([93.17.235.10])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldu8A-003xwL-2J; Tue, 04 May 2021 12:26:28 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FZJwv0lN3z9sVw;
 Tue,  4 May 2021 14:26:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W02um0mNf2a2; Tue,  4 May 2021 14:26:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FZJwt6jHxz9sVv;
 Tue,  4 May 2021 14:26:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BCB318B78D;
 Tue,  4 May 2021 14:26:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oT_wBGJrwVnn; Tue,  4 May 2021 14:26:22 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7B7628B7A8;
 Tue,  4 May 2021 14:26:21 +0200 (CEST)
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Joe Perches
 <joe@perches.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Miguel Ojeda <ojeda@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk>
 <CANiq72mk84uay--BWOLT4zF12-rat9erohKazB8SpTPoVCTX1A@mail.gmail.com>
 <20210504092225.GS6564@kitsune.suse.cz>
 <CANiq72kHwAeQ+vhFqg9tiQA-QHEK_xvP_Sro-_c5LJ2XDzjzxQ@mail.gmail.com>
 <20210504121713.GT6564@kitsune.suse.cz>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <529aef7c-30b1-f6c5-4610-34bd869e4ad4@csgroup.eu>
Date: Tue, 4 May 2021 14:26:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210504121713.GT6564@kitsune.suse.cz>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_052626_299903_DE3E7E3B 
X-CRM114-Status: GOOD (  20.54  )
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

CgpMZSAwNC8wNS8yMDIxIMOgIDE0OjE3LCBNaWNoYWwgU3VjaMOhbmVrIGEgw6ljcml0wqA6Cj4g
T24gVHVlLCBNYXkgMDQsIDIwMjEgYXQgMDI6MDk6MjRQTSArMDIwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+PiBPbiBUdWUsIE1heSA0LCAyMDIxIGF0IDExOjIyIEFNIE1pY2hhbCBTdWNow6FuZWsg
PG1zdWNoYW5la0BzdXNlLmRlPiB3cm90ZToKPj4+Cj4+PiBFeGNlcHQgaXQgbWFrZXMgYW5zd2Vy
aW5nIHRoZSBxdWVzdGlvbiAiSXMgdGhpcyBidWcgd2Ugc2VlIG9uIHRoaXMKPj4+IGFuY2llbnQg
c3lzdGVtIHN0aWxsIHByZXNlbnQgaW4gdXBzdHJlYW0/IiBuZWVkbGVzc2x5IG1vcmUgZGlmZmlj
dWx0IHRvCj4+PiBhbnN3ZXIuCj4+Cj4+IENhbiB5b3UgcGxlYXNlIHByb3ZpZGUgc29tZSBkZXRh
aWxzPyBJZiB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgdGVzdGluZwo+PiBhIG5ldyBrZXJuZWwgaW1h
Z2UgaW4gdGhlIGFuY2llbnQgc3lzdGVtICJhcy1pcyIsIHdoeSB3b3VsZG4ndCB5b3UKPj4gYnVp
bGQgaXQgaW4gYSBuZXdlciBzeXN0ZW0/IElmIHlvdSBhcmUgdGFsa2luZyBhYm91dCAgcGFydGlj
dWxhcgo+PiBwcm9ibGVtcyBhYm91dCBiaXNlY3RpbmcgKGtlcm5lbCwgY29tcGlsZXIpIHBhaXJz
IGV0Yy4sIGRldGFpbHMgd291bGQKPj4gYWxzbyBiZSB3ZWxjb21lLgo+IAo+IFllcywgYmlzZWN0
aW5nIGNvbWVzIHRvIG1pbmQuIElmIHlvdSBuZWVkIHRvIHN3aXRjaCB0aGUgdXNlcnNwYWNlIGFz
Cj4gd2VsbCB0aGUgYmlzZWN0aW9uIHJlc3VsdHMgYXJlIG5vdCB0aGF0IHNvbGlkLiBZb3UgbWF5
IG5vdCBiZSBldmVuIGFibGUKPiB0byBiaXNlY3QgYmVjYXVzZSB0aGUgd29ya2xvYWQgZG9lcyBu
b3QgZXhpc3Qgb24gYSBuZXcgc3lzdGVtIGF0IGFsbC4KPiBDcmFmdGluZyBhIG1pbmltYWwgdGVz
dCBjYXNlIHRoYXQgY2FuIGJlIGZvcndhcmQtcG9ydGVkIHRvIGEgbmV3IHN5c3RlbQo+IGlzIG5v
dCBhbHdheXMgdHJpdmlhbCAtIGlmIHlvdSB1bmRlcnN0b29kIHRoZSBwcm9ibGVtIHRvIHRoYXQg
ZXh0ZW50IHlvdQo+IG1pZ2h0IG5vdCBldmVuIG5lZWQgdG8gYmlzZWN0IGl0IGluIHRoZSBmaXJz
dCBwbGFjZS4KPiAKCkJ1dCB5b3UgZG9uJ3QgbmVlZCB0byBzd2l0Y2ggdGhlIHVzZXJzcGFjZSBv
ciB0aGUgY29tcGxldGUgYnVpbGQgdG9vbHMgdG8gYnVpbGQgYSBrZXJuZWwgd2l0aCBhIApuZXdl
ciB0b29sY2hhaW4uCgpBbGwgeW91IGhhdmUgdG8gZG8gaXMgdGFrZSBvbmUgZnJvbSBodHRwczov
L21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi90b29scy9jcm9zc3Rvb2wvCgpJJ20gZG9pbmcg
ZXZlcnl0aGluZyB1bmRlciBDZW50T1MgNiwgYW5kIHVzaW5nIG9uZSBvZiB0aG9zZSB0b29scyBh
bGxvd3MgbWUgdG8gYnVpbGQgbGF0ZXN0IGtlcm5lbCAKd2l0aG91dCBicmVha2luZyBhbnl0aGlu
ZyBlbHNlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
