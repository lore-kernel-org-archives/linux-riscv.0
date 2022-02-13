Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE7BC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Feb 2022 03:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmyPJwe6nDVzrPH3Mj0rxH5QwfupYfi01B9xyxltihE=; b=v00NqHVT+qhxXh
	hgvVCoii/oGKNuBMfvqDoRlwHaCarqgJPstytA1mQAcNscwzX6zuzQMJRNqiHxD23RwshvVCjfzpR
	r1Hrw6KPd9sUvGnPA8bkebi+uLV410BM2lCfKX70aK6OcH0nyySy9j2lQ+iPKNLAIMhnbeZ1OY5dG
	YqPzYpGcSgy08HEACCtXZ3f2G2+Bd7F/3FPcrBaim0bJY4P7f2KH606ZawzI3T1R6cUjYHZfXUhLP
	hmDgqmgpkJtYKvD4rLi3pcqk5ug79ein4UefUzSBwQ8rvnF37MK2IAM82Y3iDCOxg7g44hkT+cjyw
	Fz5FrPB6O0eSLNaWKc9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJ5Mm-00ArjI-9A; Sun, 13 Feb 2022 03:16:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJ5Mi-00AriU-MO
 for linux-riscv@lists.infradead.org; Sun, 13 Feb 2022 03:15:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AFF1A60F4E;
 Sun, 13 Feb 2022 03:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F15C340ED;
 Sun, 13 Feb 2022 03:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644722155;
 bh=cfBWan6cCytJstd6/pWGmDyKPrlRMs3PhvFLZb9flIA=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=n6JbxKlqcL0RAOuXM/wB7PjxNSkOwDc3Mk5RwS+gAaCsG9+WtOvtx0ANA+x9xFJ5w
 mbXMBbPJydMkjNn3FLkYFKafzV8vihxga6fQD0iDOLO2yVmsjCgk/MvdqjoPKAPQz6
 moUjoQXuSLmC+ANubX4LzdHVEVmdRvZAWYJ3pRZMkZhSsk/ADJjfOtUffO6ea+L6vB
 9BT9kvv7671cLvTM6lWU/wj4+wxhJktllZJ+gMIikltRcu5F7JxkwCEv7UrGC8fgO1
 BY5P9IQyAXsSva1KrgyBvfSt5E+NDpbmKoZ+G262fdNB2d8RFvUGvsCwE2hVXPp4Jf
 hRCwPV49B1KYA==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailauth.nyi.internal (Postfix) with ESMTP id 1BF9027C0054;
 Sat, 12 Feb 2022 22:15:52 -0500 (EST)
Received: from imap48 ([10.202.2.98])
 by compute5.internal (MEProxy); Sat, 12 Feb 2022 22:15:53 -0500
X-ME-Sender: <xms:53cIYsWHCSBLT20UKSNUTMb5qweuMdG6OtrolriGuqewjZWZS1dtlw>
 <xme:53cIYgnpm3vUbdrGFAUQQSkkvpvKuUaaSwRCyJz73WAfHhyZxyuOMXUqPKKjs7ynQ
 JGCD5Ni84IuoaGqbOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrieekgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 hicunfhuthhomhhirhhskhhifdcuoehluhhtoheskhgvrhhnvghlrdhorhhgqeenucggtf
 frrghtthgvrhhnpedvleehjeejvefhuddtgeegffdtjedtffegveethedvgfejieevieeu
 feevuedvteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhguhidomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudduiedukeeh
 ieefvddqvdeifeduieeitdekqdhluhhtoheppehkvghrnhgvlhdrohhrgheslhhinhhugi
 drlhhuthhordhush
X-ME-Proxy: <xmx:53cIYganbE64N5FtxbXIhcvP5cEsBlcLyBW1qmXC6zPjhg2K9UldOQ>
 <xmx:53cIYrXtvXSgyojTVSs8d7oybism5nfG7LO6nh_CZPbzlAALvAhXiQ>
 <xmx:53cIYmmYjq0iVHPXlfReLn_yJanYCFq6QJyScKOL1uKgMZWSpTVD4g>
 <xmx:6HcIYldQHsQwB-Dv9w6_2nhXKOggZdLrPO6ylOa8HrDKqODCn_wNmh87cJ8>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8F97C21E006E; Sat, 12 Feb 2022 22:15:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4748-g31a5b5f50e-fm-cal2020-20220204.001-g31a5b5f5
Mime-Version: 1.0
Message-Id: <fbdd43e1-a305-48d1-8ccb-2deffcb715f7@www.fastmail.com>
In-Reply-To: <20220211210757.612595-1-Jason@zx2c4.com>
References: <20220211210757.612595-1-Jason@zx2c4.com>
Date: Sat, 12 Feb 2022 19:15:31 -0800
From: "Andy Lutomirski" <luto@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Linux Crypto Mailing List" <linux-crypto@vger.kernel.org>
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, "Geert Uytterhoeven" <geert@linux-m68k.org>, 
 linux-m68k@lists.linux-m68k.org,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, "Dominik Brodowski" <linux@dominikbrodowski.net>, 
 "Eric Biggers" <ebiggers@google.com>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Arnd Bergmann" <arnd@arndb.de>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Kees Cook" <keescook@chromium.org>,
 "Lennart Poettering" <mzxreary@0pointer.de>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Theodore Ts'o" <tytso@mit.edu>
Subject: Re: [PATCH RFC v0] random: block in /dev/urandom
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_191556_852030_D156812C 
X-CRM114-Status: GOOD (  14.77  )
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

CgpPbiBGcmksIEZlYiAxMSwgMjAyMiwgYXQgMTowNyBQTSwgSmFzb24gQS4gRG9uZW5mZWxkIHdy
b3RlOgo+IFRoaXMgaXMgdmVyeSBtdWNoIGFuIFJGQyBwYXRjaCwgb3IgbWF5YmUgZXZlbiBhbiBS
RkcgLS0gcmVxdWVzdCBmb3IKPiBncnVtYmxlcy4gVGhpcyB0b3BpYyBoYXMgY29tZSB1cCBhIG1p
bGxpb24gdGltZXMsIGFuZCB1c3VhbGx5IGRvZXNuJ3QgZ28KPiBhbnl3aGVyZS4gVGhpcyB0aW1l
IEkgdGhvdWdodCBJJ2QgYnJpbmcgaXQgdXAgd2l0aCBhIHNsaWdodGx5IG5hcnJvd2VyCj4gZm9j
dXMuIEJlZm9yZSB5b3UgcmVhZCBmdXJ0aGVyLCByZWFsaXplIHRoYXQgSSBkbyBub3QgaW50ZW5k
IHRvIG1lcmdlCj4gdGhpcyB3aXRob3V0IHRoZXJlIGJlaW5nIGFuIGFwcHJvcHJpYXRlIGFtb3Vu
dCBvZiBjb25zZW5zdXMgZm9yIGl0IGFuZAo+IGRpc2N1c3Npb24gYWJvdXQgaXQuCj4KPiBFdmVy
IHNpbmNlIExpbnVzJyA1MGVlNzUyOWVjNDUgKCJyYW5kb206IHRyeSB0byBhY3RpdmVseSBhZGQg
ZW50cm9weQo+IHJhdGhlciB0aGFuIHBhc3NpdmVseSB3YWl0IGZvciBpdCIpLCB0aGUgUk5HIGRv
ZXMgYSBoYXZlZ2VkLXN0eWxlIGppdHRlcgo+IGRhbmNlIGFyb3VuZCB0aGUgc2NoZWR1bGVyLCBp
biBvcmRlciB0byBwcm9kdWNlIGVudHJvcHkgKGFuZCBjcmVkaXQgaXQpCj4gZm9yIHRoZSBjYXNl
IHdoZW4gd2UncmUgc3R1Y2sgaW4gd2FpdF9mb3JfcmFuZG9tX2J5dGVzKCkuIEhvdyBldmVyIHlv
dQo+IGZlZWwgYWJvdXQgdGhlIExpbnVzIEppdHRlciBEYW5jZSBpcyBiZXNpZGUgdGhlIHBvaW50
OiBpdCdzIGJlZW4gdGhlcmUKPiBmb3IgdGhyZWUgeWVhcnMgYW5kIHVzdWFsbHkgZ2V0cyB0aGUg
Uk5HIGluaXRpYWxpemVkIGluIGEgc2Vjb25kIG9yIHNvLgoKSSBkaXNsaWtlIHRoaXMgcGF0Y2gg
Zm9yIGEgcmVhc29uIHRoYXQgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBzZWN1cml0eS4gU29tZXdo
ZXJlIHRoZXJl4oCZcyBhIExpbnV4IG1hY2hpbmUgdGhhdCBib290cyBzdHJhaWdodCB0byBOZXRo
YWNrIGluIGEgZ2xvcmlvdXMgNTBtcy4gIElmIE5ldGhhY2sgZ2V0cyAyNTYgYml0cyBvZiBhbWF6
aW5nIGVudHJvcHkgZnJvbSAvZGV2L3VyYW5kb20sIHRoZW4gdGhlIG1hY2hpbmXigJlzIG93bmVy
IGhhcyB0byBwbGF5IGZvciByZWFsLiBJZiBpdCByZXBlYXRzIHRoZSBzYW1lIGdhbWUgb24gb2Nj
YXNpb24sIHRoZSBvd25lciBjYW4gYmUgZGlzYXBwb2ludGVkIG9yIGFtdXNlZC4gSWYgaXQgZ2V0
cyBhIHdlYWsgc2VlZCB0aGF0IGNhbiBiZSBicnV0ZSBmb3JjZWQsIHRoZW4gdGhlIG93bmVyIGNh
biBoYXZlIGZ1biBicnV0ZSBmb3JjaW5nIGl0LgoKSWYsIG9uIHRoZSBvdGhlciBoYW5kLCBpdCB3
YWl0cyA3NTBtcyBmb3IgZW5vdWdoIGppdHRlciBlbnRyb3B5IHRvIGJlIHBlcmZlY3QsIGl04oCZ
cyBhIGNvbXBsZXRlIGZhaWwuICBObyBvbmUgd2FudHMgdG8gd2FpdCA3NTBtcyB0byBwbGF5IE5l
dGhhY2suCgpSZXBsYWNlIE5ldGhhY2sgd2l0aCBzb21ldGhpbmcgd2l0aCBhIGJhY2t1cCBjYW1l
cmEgb3IgYSBsaWdodGJ1bGIsIGJvdGggb2Ygd2hpY2ggaGF2ZSByZWd1bGF0aW9ucyByZWxhdGVk
IHRvIHN0YXJ0dXAgdGltZSwgYW5kIHRoZXJlIG1heSBiZSBhIHJlYWwgcHJvYmxlbS4gS2VlcCBp
biBtaW5kIHRoYXQgc29tZSBsYW5ndWFnZSBydW50aW1lcyByYW5kb21pemUgdGhlaXIgaGFzaCB0
YWJsZSBzZWVkcyBhdCBzdGFydHVwLCBwb3NzaWJseSB1c2luZyAvZGV2L3VyYW5kb20uIFRoaXMg
cGF0Y2ggbWF5IGJyZWFrIGFjdHVhbCwgY29ycmVjdCwgd29ya2luZyBjb2RlLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
