Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B33C04FF8
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 12:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=her/GCItoVnz7gRj0j5ANnSos69p8ws1CXXmR85cTNM=; b=EP4DsDpIbeeW/T
	vMZoPCgAVRDoKBB4GRWINvUy7g8+F44eRx8DPG9KvFmArTy3IYCZfOjQ+vBoSI3W4m/GGPIoIzvQb
	3/Q0iF9xBoaRlbbnNpmsjYoN5myTdMLgpYr0quApIIyU3Y+dqBU6gpLjxdIWF+RTlzJBHDLt0+HN9
	1MdGmaOkNFAPfUojzyhz2Y0O3qslBsjWYXsCQopkbLNVhJTBQ4Y3iKpdUfxdYmq7qPWeWk4OsYyqQ
	IoalL46CQFy4bkbP2GZbX/GGkD/uN0t8Kt4SFIufT4Sm9/IozpHTiKhfyUPuG5MEPozKgsoSpc452
	o9ob9tk9/FBZV9gRfsgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR5K-00000002C9I-1Paf;
	Thu, 18 Apr 2024 12:41:50 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR5F-00000002C6d-1U1b
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 12:41:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 910C5CE14E7;
	Thu, 18 Apr 2024 12:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F318C113CC;
	Thu, 18 Apr 2024 12:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713444101;
	bh=5Gg1cGKKy8xUY1IPDW6LNh+LEVolae4Ho+4aUJeL+nE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BtC7KXLlU2MWKMuknCac4v0q0WkuRC0gLCVBTgCsJvlKLj0Q1BcuZPTIrz/vGSb6t
	 Ya/T3ZkMMJYdY0GVTm0WxUZ0pVNKW9Wu689lsPx7voDaaT1OsHF5xAvu7F/LS27XkG
	 h9bLsT36smOCiRuXbWqlsw2sdS/xPxU75bdG3xfcHp2hP+0m5qWpQuJqksXq+TeS0U
	 Wdwb2T8r/Y8/7EaWiJCU2ESE1WIVb5YWurFDwZ8az/hmSaPmgIRf3HJMRwKJeEl7xr
	 Tq8bH12Zr+B0O1zxoe4UG9dCavvht3yNO8Hm9QQIG/OlHLYJu7UsCv9eNM3ordhePo
	 yVAiYovW2QLhw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Nam Cao <namcao@linutronix.de>, Mike Rapoport <rppt@kernel.org>, Andreas
 Dilger <adilger@dilger.ca>, linux-riscv@lists.infradead.org, Thomas
 Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>,
 "ndesaulniers @ google . com" <ndesaulniers@google.com>, Luis Chamberlain
 <mcgrof@kernel.org>, Ingo
 Molnar <mingo@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Tejun Heo <tj@kernel.org>, Krister Johansen <kjlx@templeofstupid.com>,
 Changbin Du <changbin.du@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH] init: fix allocated page overlapping with PTR_ERR
In-Reply-To: <20240418131238.636bee2c@namcao>
References: <20240418102943.180510-1-namcao@linutronix.de>
 <20240418131238.636bee2c@namcao>
Date: Thu, 18 Apr 2024 14:41:38 +0200
Message-ID: <87edb2sv0d.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_054145_811952_DF50BF44 
X-CRM114-Status: GOOD (  20.61  )
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

TmFtIENhbyA8bmFtY2FvQGxpbnV0cm9uaXguZGU+IHdyaXRlczoKCj4gT24gMjAyNC0wNC0xOCBO
YW0gQ2FvIHdyb3RlOgo+PiBUaGVyZSBpcyBub3RoaW5nIHByZXZlbnRpbmcga2VybmVsIG1lbW9y
eSBhbGxvY2F0b3JzIGZyb20gYWxsb2NhdGluZyBhCj4+IHBhZ2UgdGhhdCBvdmVybGFwcyB3aXRo
IFBUUl9FUlIoKSwgZXhjZXB0IGZvciBhcmNoaXRlY3R1cmUtc3BlY2lmaWMKPj4gY29kZSB0aGF0
IHNldHVwIG1lbWJsb2NrLgo+PiAKPj4gSXQgd2FzIGRpc2NvdmVyZWQgdGhhdCBSSVNDViBhcmNo
aXRlY3R1cmUgZG9lc24ndCBzZXR1cCBtZW1ibG9jawo+PiBjb3JlY3RseSwgbGVhZGluZyB0byBh
IHBhZ2Ugb3ZlcmxhcHBpbmcgd2l0aCBQVFJfRVJSKCkgYmVpbmcgYWxsb2NhdGVkLAo+PiBhbmQg
c3Vic2VxdWVudGx5IGNyYXNoaW5nIHRoZSBrZXJuZWwgKGxpbmsgaW4gQ2xvc2U6ICkKPj4gCj4+
IFRoZSByZXBvcnRlZCBjcmFzaCBoYXMgbm90aGluZyB0byBkbyB3aXRoIFBUUl9FUlIoKTogdGhl
IGxhc3QgcGFnZQo+PiAoYXQgYWRkcmVzcyAweGZmZmZmMDAwKSBiZWluZyBhbGxvY2F0ZWQgbGVh
ZHMgdG8gYW4gdW5leHBlY3RlZAo+PiBhcml0aG1ldGljIG92ZXJmbG93IGluIGV4dDQ7IGJ1dCBz
dGlsbCwgdGhpcyBwYWdlIHNob3VsZG4ndCBiZQo+PiBhbGxvY2F0ZWQgaW4gdGhlIGZpcnN0IHBs
YWNlLgo+PiAKPj4gQmVjYXVzZSBQVFJfRVJSKCkgaXMgYW4gYXJjaGl0ZWN0dXJlLWluZGVwZW5k
ZW50IHRoaW5nLCB3ZSBzaG91bGRuJ3QKPj4gYXNrIGV2ZXJ5IHNpbmdsZSBhcmNoaXRlY3R1cmUg
dG8gc2V0IHRoaXMgdXAuIFRoZXJlIG1heSBiZSBvdGhlcgo+PiBhcmNoaXRlY3R1cmVzIGJlc2lk
ZSBSSVNDViB0aGF0IGhhdmUgdGhlIHNhbWUgcHJvYmxlbS4KPj4gCj4+IEZpeCB0aGlzIG9uZSBh
bmQgZm9yIGFsbCBieSByZXNlcnZpbmcgdGhlIHBoeXNpY2FsIG1lbW9yeSBwYWdlIHRoYXQKPj4g
bWF5IGJlIG1hcHBlZCB0byB0aGUgbGFzdCB2aXJ0dWFsIG1lbW9yeSBwYWdlIGFzIHBhcnQgb2Yg
bG93IG1lbW9yeS4KPj4gCj4+IFVuZm9ydHVuYXRlbHksIHRoaXMgbWVhbnMgaWYgdGhlcmUgaXMg
YWN0dWFsIG1lbW9yeSBhdCB0aGlzIHJlc2VydmVkCj4+IGxvY2F0aW9uLCB0aGF0IG1lbW9yeSB3
aWxsIGJlY29tZSBpbmFjY2Vzc2libGUuIEhvd2V2ZXIsIGlmIHRoaXMgcGFnZQo+PiBpcyBub3Qg
cmVzZXJ2ZWQsIGl0IGNhbiBvbmx5IGJlIGFjY2Vzc2VkIGFzIGhpZ2ggbWVtb3J5LCBzbyB0aGlz
Cj4+IGRvZXNuJ3QgbWF0dGVyIGlmIGhpZ2ggbWVtb3J5IGlzIG5vdCBzdXBwb3J0ZWQuIEV2ZW4g
aWYgaGlnaCBtZW1vcnkgaXMKPj4gc3VwcG9ydGVkLCBpdCBpcyBzdGlsbCBvbmx5IG9uZSBwYWdl
Lgo+PiAKPj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi84Nzhy
MWlicGRuLmZzZkBhbGwueW91ci5iYXNlLmFyZS5iZWxvbmcudG8udXMKPj4gU2lnbmVkLW9mZi1i
eTogTmFtIENhbyA8bmFtY2FvQGxpbnV0cm9uaXguZGU+Cj4+IENjOiA8c3RhYmxlQHZnZXIua2Vy
bmVsLm9yZz4gIyBhbGwgdmVyc2lvbnMKPgo+IFNvcnJ5LCBmb3Jnb3QgdG8gYWRkOgo+IFJlcG9y
dGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoKSG1tLCBjYW4ndCB3ZSBn
ZXQgcmlkIG9mIHRoZSB3aG9sZSBjaGVjayBpbiBhcmNoL3Jpc2N2L21tL2luaXQuYyBmb3IKMzJi
PwoKLS04PC0tCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3Yv
bW0vaW5pdC5jCmluZGV4IGZlOGUxNTkzOTRkOC4uMWU5MWQ1NzI4ODg3IDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L21tL2luaXQuYworKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwpAQCAtMTk2LDcg
KzE5Niw2IEBAIGVhcmx5X3BhcmFtKCJtZW0iLCBlYXJseV9tZW0pOwogc3RhdGljIHZvaWQgX19p
bml0IHNldHVwX2Jvb3RtZW0odm9pZCkKIHsKIAlwaHlzX2FkZHJfdCB2bWxpbnV4X2VuZCA9IF9f
cGFfc3ltYm9sKCZfZW5kKTsKLQlwaHlzX2FkZHJfdCBtYXhfbWFwcGVkX2FkZHI7CiAJcGh5c19h
ZGRyX3QgcGh5c19yYW1fZW5kLCB2bWxpbnV4X3N0YXJ0OwogCiAJaWYgKElTX0VOQUJMRUQoQ09O
RklHX1hJUF9LRVJORUwpKQpAQCAtMjM0LDIxICsyMzMsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQg
c2V0dXBfYm9vdG1lbSh2b2lkKQogCWlmIChJU19FTkFCTEVEKENPTkZJR182NEJJVCkpCiAJCWtl
cm5lbF9tYXAudmFfcGFfb2Zmc2V0ID0gUEFHRV9PRkZTRVQgLSBwaHlzX3JhbV9iYXNlOwogCi0J
LyoKLQkgKiBtZW1ibG9jayBhbGxvY2F0b3IgaXMgbm90IGF3YXJlIG9mIHRoZSBmYWN0IHRoYXQg
bGFzdCA0SyBieXRlcyBvZgotCSAqIHRoZSBhZGRyZXNzYWJsZSBtZW1vcnkgY2FuIG5vdCBiZSBt
YXBwZWQgYmVjYXVzZSBvZiBJU19FUlJfVkFMVUUKLQkgKiBtYWNyby4gTWFrZSBzdXJlIHRoYXQg
bGFzdCA0ayBieXRlcyBhcmUgbm90IHVzYWJsZSBieSBtZW1ibG9jawotCSAqIGlmIGVuZCBvZiBk
cmFtIGlzIGVxdWFsIHRvIG1heGltdW0gYWRkcmVzc2FibGUgbWVtb3J5LiAgRm9yIDY0LWJpdAot
CSAqIGtlcm5lbCwgdGhpcyBwcm9ibGVtIGNhbid0IGhhcHBlbiBoZXJlIGFzIHRoZSBlbmQgb2Yg
dGhlIHZpcnR1YWwKLQkgKiBhZGRyZXNzIHNwYWNlIGlzIG9jY3VwaWVkIGJ5IHRoZSBrZXJuZWwg
bWFwcGluZyB0aGVuIHRoaXMgY2hlY2sgbXVzdAotCSAqIGJlIGRvbmUgYXMgc29vbiBhcyB0aGUg
a2VybmVsIG1hcHBpbmcgYmFzZSBhZGRyZXNzIGlzIGRldGVybWluZWQuCi0JICovCi0JaWYgKCFJ
U19FTkFCTEVEKENPTkZJR182NEJJVCkpIHsKLQkJbWF4X21hcHBlZF9hZGRyID0gX19wYSh+KHVs
b25nKTApOwotCQlpZiAobWF4X21hcHBlZF9hZGRyID09IChwaHlzX3JhbV9lbmQgLSAxKSkKLQkJ
CW1lbWJsb2NrX3NldF9jdXJyZW50X2xpbWl0KG1heF9tYXBwZWRfYWRkciAtIDQwOTYpOwotCX0K
LQogCW1pbl9sb3dfcGZuID0gUEZOX1VQKHBoeXNfcmFtX2Jhc2UpOwogCW1heF9sb3dfcGZuID0g
bWF4X3BmbiA9IFBGTl9ET1dOKHBoeXNfcmFtX2VuZCk7CiAJaGlnaF9tZW1vcnkgPSAodm9pZCAq
KShfX3ZhKFBGTl9QSFlTKG1heF9sb3dfcGZuKSkpOwotLTg8LS0KCk1pa2UgaGludHMgdGhhdCdz
ICpub3QqIHRoZSBjYXNlCihodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9aaUFr
Uk1VZmlQRFVHUGRMQGtlcm5lbC5vcmcvKS4KbWVtYmxvY2tfcmVzZXJ2ZSgpIHNob3VsZCBkaXNh
bGxvdyBhbGxvY2F0aW9uIGFzIHdlbGwsIG5vPwoKVGhhbmtzLCBhbmQgRldJVzoKClRlc3RlZC1i
eTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
