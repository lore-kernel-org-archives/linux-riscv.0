Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6A0CA5FA5
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 04:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1YDTbi1IuoVMxDQDOjDQ/VzxQXVv9kYdHhw+y4hQ2U=; b=ge1BDHObIt0dxZ
	/B3hYjZLTwHWJxweGaYD9DFmrFsnmOPJoZEky0QEA0e8/ZAJgJTEux/iIL6m3zeWI0ywUNQ2DYvG7
	SrBm4B8vh8+mYiMgedmmvrP+xdGLHanE1xPdl6RCde4lP+fdMWfgHewfCA2v9tJmNJSjF5jHFoL1c
	vsd8+pC74LvacvNM9Lrxa1/Rh1w5ftxAeW6GSfb5AQgn1NahN6FsRWY2m7scOh+IWa7alY/X+HaCm
	mcejCk1BIMxsdKQk1eh1FznxhLQAP++03TPEOBKvJzZXpyI8FHP31klWzE1MYr+5GUCD3vzdf+rGq
	FAtfpP/WsBa9Rf3RIGGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8bu-00000007k4K-0Xij;
	Thu, 01 Oct 2026 04:41:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8bs-00000007k3u-0ugD;
	Thu, 01 Oct 2026 04:41:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E188407B2;
	Thu,  1 Oct 2026 04:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96EF1F000FF;
	Thu,  1 Oct 2026 04:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790829691;
	bh=tVU5xB7+vpzEDdoS9i3GNs5XYI1dWTYZUYdxVIutOtM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Bq0nZkKWMqWIxU4tIv4zapeOdCpnHz5b/zR/btuwhOI6yqWhkNa16ZLAdV0XAonaE
	 LT/7g8b0EEn8q6WkaYSXcge2H8Yc3IFapoddC+KtKRElzzzS2tCykxpi6k5aZA9kay
	 7Bx2fP9pScRcEmAWGN5VHfJ7AF5BwdkPUQT7ytyICmEnBPU0xblgkviAuLC9gCD0Mc
	 1wW64Qj4Bi6OFUgghHfnyrW6ZOr1ms95vNMMwVa/6E/AhGbiTu69p6opZ+oOc4sLrS
	 iIWKzWRMviz1dpodiBtpGvwGIBrsrPpmtw65JP7qKlykYyEAPSVgsAOV08268AC+o8
	 rWTxHJHwYW1TQ==
Message-ID: <ede392d7-3104-4a0f-9fa1-99b22552dcd6@kernel.org>
Date: Thu, 1 Oct 2026 06:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 llvm@lists.linux.dev
References: <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
 <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
 <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
 <areYMjNcaqe86ds4@zx2c4.com>
 <9d1c338b-368f-4ea2-a12e-c28d49adff5e@kernel.org>
 <are6s5e6On3hpD3M@zx2c4.com>
 <CAKwvOd=BrMfFT88jsvBPhh383qqk5G+J07CsofNu0MVkziyhCg@mail.gmail.com>
 <20260930133813.GA3142230@ax162> <ar0a4b9CjL2YHCkY@zx2c4.com>
 <ar0gTS71qxnx9AkW@zx2c4.com> <20260930151337.GD3142230@ax162>
 <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
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

SGksCgpMZSAzMC8wOS8yMDI2IMOgIDE3OjE2LCBKYXNvbiBBLiBEb25lbmZlbGQgYSDDqWNyaXTC
oDoKPiBPbiBXZWQsIFNlcCAzMCwgMjAyNiBhdCA1OjEz4oCvUE0gTmF0aGFuIENoYW5jZWxsb3Ig
PG5hdGhhbkBrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gT24gV2VkLCBTZXAgMzAsIDIwMjYgYXQg
MDQ6NDQ6MjlQTSArMDIwMCwgSmFzb24gQS4gRG9uZW5mZWxkIHdyb3RlOgo+Pj4gTmF0aGFuLCB3
b3VsZCB0aGlzIGJlIG9rYXkgd2l0aCB5b3U/Cj4+PiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5w
cm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXQuengyYzQuY29tJTJG
bGludXgtcm5nJTJGY29tbWl0JTJGJTNGaWQlM0RkMjE2NzAxNzI0YjdkODIwOWZmNDIxNTA2NThh
ZDVjNzEyYmRiNTAzJmRhdGE9MDUlN0MwMiU3Q2NocmlzdG9waGUubGVyb3kyJTQwY3Mtc29wcmFz
dGVyaWEuY29tJTdDOGY2OTkzNWJmZmIzNDRiZjBkZGMwOGRmMWYwNWUzNTglN0M4Yjg3YWY3ZDg2
NDc0ZGM3OGRmNDVmNjlhMjAxMWJiNSU3QzAlN0MwJTdDNjM5MjYzNzgyMzI0MDgwODM3JTdDVW5r
bm93biU3Q1RXRnBiR1pzYjNkOGV5SkZiWEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1E
QXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdD
MCU3QyU3QyU3QyZzZGF0YT1CQTdGeXIwJTJGeW5nZ3ZCblIlMkZwaUN2TkNRSHROQmFncXZTYjBp
MTFBdm9MVSUzRCZyZXNlcnZlZD0wCj4+Cj4+IENhbiB5b3Ugc3RpY2sKPj4KPj4gICAgQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyB2Ni4xMisKPj4gICAgQ2xvc2VzOiBodHRwczovL2V1cjAx
LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRo
dWIuY29tJTJGQ2xhbmdCdWlsdExpbnV4JTJGbGludXglMkZpc3N1ZXMlMkYyMTgzJmRhdGE9MDUl
N0MwMiU3Q2NocmlzdG9waGUubGVyb3kyJTQwY3Mtc29wcmFzdGVyaWEuY29tJTdDOGY2OTkzNWJm
ZmIzNDRiZjBkZGMwOGRmMWYwNWUzNTglN0M4Yjg3YWY3ZDg2NDc0ZGM3OGRmNDVmNjlhMjAxMWJi
NSU3QzAlN0MwJTdDNjM5MjYzNzgyMzI0MTEwNjc5JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5
SkZiWEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJ
c0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZzZGF0YT02Qzgl
MkZBRVFvaCUyQjhwZmdmWVFrTDdxZjVVZSUyRjVzQUd0ZnFScHR6c1NHMENNJTNEJnJlc2VydmVk
PTAKPj4KPj4gb24gdGhhdD8gT3RoZXJ3aXNlLCBsb29rcyBnb29kIHRvIG1lLCB0aGF0J3MgYmFz
aWNhbGx5IHdoYXQgSSBoYWQgZm9yIG15Cj4+IHYzIGxvY2FsbHkuCj4gCj4gU3VyZSwgZG9uZS4g
QWxzbyByZW1vdmVkIHRoZSBub3ctdW51c2VkIGFycmF5X3NpemUuaCBpbmNsdWRlLgoKSSdtIHN0
aWxsIHZlcnkgc2NlcHRpYyB3aXRoIHRoaXMgcGF0Y2guIFlvdSBhcmUgZGVncmFkaW5nIHRoZSBi
ZWhhdmlvdXIgCndpdGggR0NDIGZvciBhIHByb2JsZW0gd2l0aCBDTEFORy4gV2h5ID8KCkJlZm9y
ZSB0aGUgcGF0Y2gsIHdpdGggYm90aCBHQ0MgMTMgYW5kIEdDQyAxNiBvbiBwb3dlcnBjMzIgSSBn
ZXQgYSAKcHJldHR5IHN0YW5kYXJkIG9wdGltaXNlZCBsb29wIHRoYXQgY2xlYXJzIHdvcmRzIDQg
YnkgNCAod2l0aCBhdXRvIAppbmNyZW1lbnQgb2YgcG9pbnRlcikgd2hpY2ggaXMgdGhlIG1vc3Qg
b3B0aW1hbCBvbiBwb3dlcnBjOgoKICAzZjA6CTM5IDAwIDAwIDBjIAlsaSAgICAgIHI4LDEyCiAg
M2Y0OgkzNSAwOCBmZiBmYyAJYWRkaWMuICByOCxyOCwtNAogIDNmODoJOTEgNDkgMDAgMDQgCXN0
dyAgICAgcjEwLDQocjkpCiAgM2ZjOgk5MSA0OSAwMCAwOCAJc3R3ICAgICByMTAsOChyOSkKICA0
MDA6CTkxIDQ5IDAwIDBjIAlzdHcgICAgIHIxMCwxMihyOSkKICA0MDQ6CTk1IDQ5IDAwIDEwIAlz
dHd1ICAgIHIxMCwxNihyOSkKICA0MDg6CTQwIDgyIGZmIGVjIAlibmUgICAgIDNmNCA8X19jX2tl
cm5lbF9nZXRyYW5kb20rMHgzZjQ+CgpXaXRoIHRoZSBwYXRjaCwKCldpdGggR0NDIDEzIEkgZ2V0
IGEgdmVyeSBzdWJvcHRpbWFsIGxvb3AgY29weWluZyBieXRlcyBvbmUgYnkgb25lCgogIDNkODoJ
MzkgNDAgMDAgMzQgCWxpICAgICAgcjEwLDUyCi4uLgogIDNlNDoJMzkgMjAgMDAgMDAgCWxpICAg
ICAgcjksMAogIDNlODoJN2QgNDkgMDMgYTYgCW10Y3RyICAgcjEwCiAgM2VjOgk5ZCAzZSAwMCAw
MSAJc3RidSAgICByOSwxKHIzMCkKICAzZjA6CTQyIDAwIGZmIGZjIAliZG56ICAgIDNlYyA8X19j
X2tlcm5lbF9nZXRyYW5kb20rMHgzZWM+CgpXaXRoIEdDQyAxNiBJIGdldCBzb21ldGhpbmcgYSBi
aXQgYmV0dGVyIGJ1dCBub3QgYXMgZ29vZCBhcyBiZWZvcmUsIGl0IAppcyBhIGxvb3AgY2xlYXJp
bmcgd29yZHMgb25seSBvbmUgYnkgb25lIGFuZCBpbmNyZW1lbnRpbmcgcG9pbnRlciB3aXRoIAph
biBhZGRpdGlvbmFsIGluc24gaW5zdGVhZCBvZiB1c2luZyBhdXRvLWluY3JlbWVudCBpbnN0cnVj
dGlvbiBzdHd1LgoKICAzZTA6CTM5IDQwIDAwIDBkIAlsaSAgICAgIHIxMCwxMwouLi4KICAzZjA6
CTdkIDQ5IDAzIGE2IAltdGN0ciAgIHIxMAogIDNmNDoJOTEgM2YgMDAgMDAgCXN0dyAgICAgcjks
MChyMzEpCiAgM2Y4OgkzYiBmZiAwMCAwNCAJYWRkaSAgICByMzEscjMxLDQKICAzZmM6CTQyIDAw
IGZmIGY4IAliZG56ICAgIDNmNCA8X19jX2tlcm5lbF9nZXRyYW5kb20rMHgzZjQ+CgpQbGVhc2Ug
cmVzdHJpY3QgdGhlIHBhdGNoIHRvIGNsYW5nIGJ1aWxkcy4KCkNocmlzdG9waGUKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
