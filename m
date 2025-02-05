Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A24C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 23:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+2TaO3L0iqYvqkQOYuGudC1Y8/iMUeWBjFFR7nwBmHY=; b=DLTZpws7MZ3TFq
	S5M/e42I7i+ou+PmCN7ArVSxaK/0gA4mtzm2+9az3/jqq9ZIqRsKiZ1q40CB6gITfd+ZIe0xVbT+e
	MLgxauu/Y4X/nvJH19lW/AFpydpkdIn1N4wALC7G77qKZHV6omCSVWjtgz9OgUrBfvj7KGfhleD51
	q9jHzIJWcr7X6LlD2OwYjJ4DFhypzRC6mawr9IIqgj0iQhIH9UW59vqCPaOSo3QaMMo25jQ0xhyp8
	XjSyN1MdDEwLPmfXAaNiBO+1g2hOKzmQ4TEDqShUfYB0yM42o8UE2fSURzlN8UdUu8Yp8qXi5FBPm
	TB3XAy5jegboiyAKSvaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfp19-00000004r9U-0W38;
	Wed, 05 Feb 2025 23:41:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfp16-00000004r8h-479p;
	Wed, 05 Feb 2025 23:41:14 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43622267b2eso3170095e9.0;
        Wed, 05 Feb 2025 15:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738798871; x=1739403671; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKEgMyHfPWTlLLqqrmnwtvQK3GmysT72SpoyvC2gz8E=;
        b=ReKljV3JJ1O3CfqUzfrc6yGfDy0aUle8AbfT2zdSn0pS++/sFiBD6PD8NhlXDvjziM
         mpypmm0iLkM2ZrLdQsMgjiOw5i4/lUzAdAq3gKrYJG2Gho/lF6QDGnpqyEhWnnF9q0IF
         xuQV4uuBP+tM/vi4igyx3QiTNuSRu2W5EY1WKyIE8Qrs31vFQ8CLu811Tc5ulZ2iJbjP
         IDG+MRK15kZvz8zIzQnlyJnEAP1NeU+aBonyoYAYJhrwyXuxQeIPRQAoqCAVUtKFxe/9
         0NxwPs2IZsSUVQdIHPgFXnABpq/5GFZWIHrJT+9SEfIATYlZYBxYxvSfkeC5xjGgWAey
         syYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738798871; x=1739403671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKEgMyHfPWTlLLqqrmnwtvQK3GmysT72SpoyvC2gz8E=;
        b=s4TdZvo4T6FNEwhX6/YIsRwSkst5Ndkg88LSyWuyBL8EO8DLqH2M4ty559DZY/S+qj
         f7K8riyV/+ScfkrIuI6o7/TZjENQEk+Akm8MW3z85LOCTf8FAMnVyHgfe84M1hsym6Ye
         3bd38cLREUrXKwl42XXcQXwcmFoKwrN1NM/DFel8rcmO7B1shT/hdWLJN5aAfAM3kHZd
         VMJGkxG+0mSMvagMjhIxcStcKq213KlwMC3lMIM/bPlUFWNOrdC6VDb+EjBtJJrQjOGu
         FcvPd8WLSKz90zGMFQUowYHjhAZPTvlzhN5IBF9Jv5G9GX6MNKEfgyZC38gAL8YN2cce
         yDZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTPeZo25x/kEYDe7zjn/InwB3gyUGkk0KIlD8/8JDyZ6GWZtnjx65UbcqIF3qtx4xtTgY5mVaz/PoyfynKOMb0@lists.infradead.org, AJvYcCXo0yODIF1k3EEDRWxn60RQkC7A1eMxg/rxtIcog163557GhW//GnYa0PsrlE7K9pvbXb8fM/fNjQjaa8w=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWZONelHP6usCCq+EEW+33XaWL5g/dJDsEg61q9a9b8DcoOjS8
	PXUUKJkD5t98qLJbfj8rDumbWIisKM/YJzxlKqKqRp7ob+oygONab+7o4gxv5xsTsxl55QFY4Eb
	SYZ8Naa4wKUhk+X8X7D5w23mc3oo=
X-Gm-Gg: ASbGncu2Zcgl7IDKv1wz1lh3mkEHtMbDzXSwfnNn0S8QqlLRoHhj/uddIfeIjBoishh
	EZ/lzJ4MAiDk0ANUMOBCqUOqVM+L1XMpoNp8O6kkkcojwaqJ4mOU79R4lrqXQ6LzaiWyzBCbgJg
	==
X-Google-Smtp-Source: AGHT+IFLTv0TDNnJU+yADljvGxMSoZCkyg9G4XwmiEyfBnbRTqPG2jvE/eed1EqqR6nVWHsb9vVYgVGcI2mkW+jV4yw=
X-Received: by 2002:adf:f1d2:0:b0:38a:8906:6b66 with SMTP id
 ffacd0b85a97d-38db492abc4mr3094863f8f.38.1738798870580; Wed, 05 Feb 2025
 15:41:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 00:40:59 +0100
X-Gm-Features: AWEUYZlz3dbMNs5uaCuCxvHCPA1V_UbROZFgxVVkwngTO-akZcC0zg4IFPaM-WQ
Message-ID: <CA+fCnZd1dpqv+rM2jD1fNGvhU_0+6c8MjzsgEsi2V-RkHVteJg@mail.gmail.com>
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for x86
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, 
	palmer@dabbelt.com, tj@kernel.org, brgerst@gmail.com, ardb@kernel.org, 
	dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
	akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, dvyukov@google.com, 
	richard.weiyang@gmail.com, ytcoode@gmail.com, tglx@linutronix.de, 
	hpa@zytor.com, seanjc@google.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, justinstitt@google.com, jason.andryuk@amd.com, 
	glider@google.com, ubizjak@gmail.com, jannh@google.com, bhe@redhat.com, 
	vincenzo.frascino@arm.com, rafael.j.wysocki@intel.com, 
	ndesaulniers@google.com, mingo@redhat.com, catalin.marinas@arm.com, 
	junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com, 
	dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com, 
	dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, 
	peterz@infradead.org, cl@linux.com, kees@kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_154113_024252_2226D04A 
X-CRM114-Status: GOOD (  13.98  )
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

T24gVHVlLCBGZWIgNCwgMjAyNSBhdCA2OjM04oCvUE0gTWFjaWVqIFdpZWN6b3ItUmV0bWFuCjxt
YWNpZWoud2llY3pvci1yZXRtYW5AaW50ZWwuY29tPiB3cm90ZToKPgo+ID09PT09PT0gSW50cm9k
dWN0aW9uCj4gVGhlIHBhdGNoc2V0IGFpbXMgdG8gYWRkIGEgS0FTQU4gdGFnLWJhc2VkIG1vZGUg
Zm9yIHRoZSB4ODYgYXJjaGl0ZWN0dXJlCj4gd2l0aCB0aGUgaGVscCBvZiB0aGUgbmV3IENQVSBm
ZWF0dXJlIGNhbGxlZCBMaW5lYXIgQWRkcmVzcyBNYXNraW5nCj4gKExBTSkuIE1haW4gaW1wcm92
ZW1lbnQgaW50cm9kdWNlZCBieSB0aGUgc2VyaWVzIGlzIDR4IGxvd2VyIG1lbW9yeQo+IHVzYWdl
IGNvbXBhcmVkIHRvIEtBU0FOJ3MgZ2VuZXJpYyBtb2RlLCB0aGUgb25seSBjdXJyZW50bHkgYXZh
aWxhYmxlCj4gbW9kZSBvbiB4ODYuCj4KPiBUaGVyZSBhcmUgdHdvIGxvZ2ljYWwgcGFydHMgdG8g
dGhpcyBzZXJpZXMuIFRoZSBmaXJzdCBvbmUgYXR0ZW1wdHMgdG8KPiBhZGQgYSBuZXcgbWVtb3J5
IHNhdmluZyBtZWNoYW5pc20gY2FsbGVkICJkZW5zZSBtb2RlIiB0byB0aGUgZ2VuZXJpYwo+IHBh
cnQgb2YgdGhlIHRhZy1iYXNlZCBLQVNBTiBjb2RlLiBUaGUgc2Vjb25kIG9uZSBmb2N1c2VzIG9u
IGltcGxlbWVudGluZwo+IGFuZCBlbmFibGluZyB0aGUgdGFnLWJhc2VkIG1vZGUgZm9yIHRoZSB4
ODYgYXJjaGl0ZWN0dXJlIGJ5IHVzaW5nIExBTS4KCkhpIE1hY2llaiwKCkF3ZXNvbWUgd29yayEg
R3JlYXQgdG8gc2VlIFNXX1RBR1MgbW9kZSBzdXBwb3J0ZWQgb24geDg2IQoKSSBzdGFydGVkIHJl
dmlld2luZyB0aGUgcGF0Y2hlcywgYnV0IHRoaXMgaXMgc29tZXdoYXQgY29tcGxpY2F0ZWQsIGFz
CnRoZSBkZW5zZSBtb2RlIGNoYW5nZXMgYXJlIHNxdWFzaGVkIHRvZ2V0aGVyIHdpdGggdGhlIGdl
bmVyaWMgb25lcyBmb3IKeDg2IHN1cHBvcnQuIENvdWxkIHlvdSBwbGVhc2Ugc3BsaXQgdGhpcyBz
ZXJpZXMgaW50byAyPyBPciBhdCBsZWFzdApyZW9yZGVyIHRoZSBwYXRjaGVzIHNvIHRoYXQgZXZl
cnl0aGluZyBuZWVkZWQgZm9yIGJhc2ljIHg4NiBzdXBwb3J0CmNvbWVzIGZpcnN0IGFuZCBjYW4g
YmUgcmV2aWV3ZWQgYW5kIHRlc3RlZCBzZXBhcmF0ZWx5LgoKSSB3aWxsIHBvc3QgdGhlIGNvbW1l
bnRzIGZvciB0aGluZ3MgSSBub3RlZCBzbyBmYXIsIGluY2x1ZGluZyBmb3IgdGhlCmRlbnNlIG1v
ZGUgY2hhbmdlcywgYnV0IEknbGwgdGFrZSBhIGNsb3NlciBsb29rIGFmdGVyIHRoZSBzcGxpdC4K
CkFsc28gZmVlbCBmcmVlIHRvIGRyb3AgdGhlIGRlcGVuZGVuY3kgb24gdGhhdCByaXNjLXYgc2Vy
aWVzLCBhcyBpdApkb2Vzbid0IGdldCB1cGRhdGVkIHZlcnkgb2Z0ZW4uIEJ1dCB1cCB0byB5b3Uu
CgpBbmQgcGxlYXNlIGFsc28gdXBkYXRlIGFsbCBhZmZlY3RlZCBwYXJ0cyBvZiBEb2N1bWVudGF0
aW9uL2Rldi10b29scy9rYXNhbi5yc3QuCgpUaGFuayB5b3UhCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
