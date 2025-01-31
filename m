Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7727CC0218F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 19:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jK4HuFEAhT5pycvddZUQDTMCqH9lxTct/+2CPcbv3Lg=; b=cRh5057pl8Og4A
	JAQe7oJV5D+Z8SkTeKz546F9sB1UgQ2S74tGAWPg1itelChlunzF0BGHTTw8EgKrdCEYIbR9fd7hm
	fsqUUpMNBwSYLqJ6+a8cwMiFQhEt259TxrXGPujuaIN22iSmMD9hYkznZ6L3UP4LPWkJPT+m2/DeY
	3nJcDnoVddnRtnSW9zYvM2qf34ZXOHW4LmS2gVshM0zG4wGIvyWIE+6pWOA5F0eZJIqX3cesRpRW8
	xOrh3ZPolkoNyxLQBqNFz4Y4BdIWOED5goJVdeD+kR+jrX5SQopuTwn7fl8bvPErkZT92/tj1Ehkm
	9NhpwYV1ojwwcmuR7Zew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwg7-0000000BHe3-3M1w;
	Fri, 31 Jan 2025 19:27:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwg5-0000000BHdd-0cln
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 19:27:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F74AA42170
	for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 19:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA79EC4CEE3
	for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 19:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738351663;
	bh=8ZjHAEUnHwb/OxfM2C7tCwLOoq0d4EVrXFDpiPBwwaQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=txIOvCgkpu/lOG69LFDj5JBLEKhf69uclQlwLcLnC6J5VwmMQWh9lvQkCLvHllwvV
	 D54AbWA3FVsI/Le0gRBTbxL//OZ6mP/MoM8ZXDL86Pp2oC9hIM2iK1HOPYnhoPWNZ4
	 wh5Nb/gJrFUdVx51POAsFhSbnyTXpxOrQ8Pv86TBr4u3x85icGkSp8NPkhMoXMXFhO
	 xd07dTxVlyfxycXBFZqI/01gunv5N8e/zDO7Q7ORRwzlVQbOJ2MjkO+JyofW3PtMDM
	 DPWvCo7bTo9mddgmQ05l6TrV/DVrj+3J0Y5U04cAo8Q+jvPiBnANj+4LDmZpkVL39S
	 RaAjKx+qa0ovg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30225b2586cso31938671fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 11:27:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8j5JG2ncEnXA9IpbotPpq/UpH6DfbzSiXG0MlKBYEZ7Vd1OUickBgGzPm4cXxy85c9MnovGRWfiKsog==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj4AViUZEKi/uF3J69AlXhmOo9SeTg0M9YrCPvhOotbu2tQsMh
	RMYsodbdD4m1BVtKzckBDWhJK766BsgwqzgXDF+oB6ntlX/v1sCMDdifhoZVRGwufrb9nXoTguM
	kzRVbsClHEcUVX/qYTaCO0gbVa9k=
X-Google-Smtp-Source: AGHT+IG2RakmGGM1ifb4d35368XxTcUkemgdpicReeEmtk37Jf3VqXy4jG1UwPWDnmp44ziy6t68f/4RjUVGL78PYO0=
X-Received: by 2002:a05:651c:243:b0:300:182b:91a0 with SMTP id
 38308e7fff4ca-307a10d315fmr31677561fa.7.1738351662525; Fri, 31 Jan 2025
 11:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20250113155306.1922992-2-ardb+git@google.com> <CAK7LNARmPcM2RTBOfpep7puY8hSJ4rz6mOrw+5EuFHh6iQ0_iA@mail.gmail.com>
 <CAMj1kXHuyJ548mkPNcmU=+oj2mfeNk-4igTHXxo0oDbvz9f8wA@mail.gmail.com>
 <CAK7LNAQA+VhDf3ZGLmTjLm1JCEvKYPu2jnAUghxMKoCn+BEQ=Q@mail.gmail.com> <CAMj1kXHeSnGcWRs1=kvJrqrUxgfsFDKPTAqQne6Le7pmComtYA@mail.gmail.com>
In-Reply-To: <CAMj1kXHeSnGcWRs1=kvJrqrUxgfsFDKPTAqQne6Le7pmComtYA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 1 Feb 2025 04:27:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNATYYSQe5O0eWP0DZ_NJOd6Z+qUS99-QYEWnQhVJdBmyhA@mail.gmail.com>
X-Gm-Features: AWEUYZkme6hiFtxkMTL26YwECmBvllAYv8R14z3ZK-yBJQzRbAelQsPtQwz4I5I
Message-ID: <CAK7LNATYYSQe5O0eWP0DZ_NJOd6Z+qUS99-QYEWnQhVJdBmyhA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Ron Economos <re@w6rz.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_112745_316177_00E9B3DE 
X-CRM114-Status: GOOD (  14.70  )
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

T24gU2F0LCBGZWIgMSwgMjAyNSBhdCA0OjAy4oCvQU0gQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIDMxIEphbiAyMDI1IGF0IDE5OjU4LCBNYXNhaGly
byBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBTYXQsIEZl
YiAxLCAyMDI1IGF0IDM6NDDigK9BTSBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPiB3
cm90ZToKPiA+ID4KPiA+ID4gT24gRnJpLCAzMSBKYW4gMjAyNSBhdCAxOTozNSwgTWFzYWhpcm8g
WWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBU
dWUsIEphbiAxNCwgMjAyNSBhdCAxMjo1M+KAr0FNIEFyZCBCaWVzaGV1dmVsIDxhcmRiK2dpdEBn
b29nbGUuY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBGcm9tOiBBcmQgQmllc2hldXZl
bCA8YXJkYkBrZXJuZWwub3JnPgo+ID4gPiA+ID4KPiA+ID4gPiA+IER1ZSB0byB0aGUgZmFjdCB0
aGF0IHJ1bnRpbWUgY29uc3QgRUxGIHNlY3Rpb25zIGFyZSBuYW1lZCB3aXRob3V0IGEKPiA+ID4g
PiA+IGxlYWRpbmcgcGVyaW9kIG9yIGRvdWJsZSB1bmRlcnNjb3JlLCB0aGUgUlNUUklQIGxvZ2lj
IHRoYXQgcmVtb3ZlcyB0aGUKPiA+ID4gPiA+IHN0YXRpYyBSRUxBIHNlY3Rpb25zIGZyb20gdm1s
aW51eCBmYWlscyB0byBpZGVudGlmeSB0aGVtLgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBEdW1i
IHF1ZXN0aW9uIC0gd2h5IGNhbid0IHlvdSByZW5hbWUgdGhlIHNlY3Rpb24gJ3J1bnRpbWUqJyB0
byAnLnJ1bnRpbWUqJyA/Cj4gPiA+ID4KPiA+ID4gPiAucmVsKiBtYXRjaGVzIHRvIHNlY3Rpb25z
IHRoYXQganVzdCBoYXBwZW4gdG8gc3RhcnQgd2l0aCAnLnJlbCcsCj4gPiA+ID4gd2hpY2ggbWF5
IG5vdCBiZSBSRUwgb3IgUkVMQS4KPiA+ID4gPgo+ID4gPgo+ID4gPiBUaGF0IGlzIHdoYXQgSSBw
cm9wb3NlZCBvcmlnaW5hbGx5IFswXSBidXQgaXQgd2FzIHNob3QgZG93biBieSBMaW51cy4KPiA+
ID4KPiA+ID4gWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MTAxNDEyNTcwMy4y
Mjg3OTM2LTQtYXJkYitnaXRAZ29vZ2xlLmNvbS9ULyN1Cj4gPgo+ID4KPiA+IERvZXMgdGhpcyB3
b3JrID8KPiA+Cj4gPiAkKE9CSkNPUFkpIC0tcmVtb3ZlLXJlbG9jYXRpb25zPScqJyAkQAo+ID4K
Pgo+IE9ubHkgd2l0aCBiaW51dGlscywgbm90IHdpdGggbGx2bS1vYmpjb3B5CgoKQXBwbGllZCB0
byBsaW51eC1rYnVpbGQuClRoYW5rcy4KCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFk
YQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
