Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41455EEF325
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 08:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ttf7DkDXH6k/Db6Bg2Hijv9yhL5qEK9dt0EnaZ3Mp5Q=; b=x7B3b2xIs6JORiMQBJtJjJhije
	6bBkGTVTgP4oO6OX/YWpYwYOjde1tYAEw+9wCTMhDq5XSKhJZ5HW5thH3owYQxByL40rPynvAC/8T
	PSz+1cCfxHN8sotcSeYIHkusQlOWSCz3n8PXGVQtR0d6x41JhI64I9l8KSCORxXre3aGWBIoYBUT6
	TdGPXyaGonJeYL3c4hr+pgETzuISU3F0EqqQDtTE0/FqHkKdwDTspA3Gvb+EGp4wwir8xlrqAtipW
	5rFXN3cAjKRAV5BtWheHUJvcfNPt61zirsn/9pHZvvh7NXAqUerNzAu9ZVKmvPerXRW+ex4m2MCeO
	5L9GLvpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4IY-00000001ECy-2abe;
	Thu, 05 Mar 2026 08:43:10 +0000
Received: from mail-wm1-f73.google.com ([209.85.128.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4IW-00000001ECb-05lS
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 08:43:09 +0000
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4837c597cd5so45296585e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 00:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772700185; x=1773304985; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImdwXMFzfOswNPEOQHnijbZ5BxVnmvmjujol0/tafME=;
        b=rYX7gD4H5G/PSAwQfKhbkBXaRWOWrFSjvwXyLOpm/nWyqEJrKJuZsESL/H/bwOjKWo
         o5wK82NjAvDLCxDBNoS8myjwhHWwkrTsnCFvt9LRMB5dEt0aZv2KFH48FyD47vsRz363
         oGrYLMwQj6MtCBX4PVz4SxotrSe2+j8G0eu33nJXPv2NCrYa3v+ocbCTIa8tp2PD7nPx
         o5aMzvI1qINC03Q1EKuMNspzBwpKNTh4s7HxyFaKju8HCvj2YzoXcjkHnLepS7QEixry
         v90nBrPrlF+fx1F8aZoxyVWdudD2b8odFFhoI7Knf2gpuomEBrR30BsQul6UqWgbwUor
         2vyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700185; x=1773304985;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ImdwXMFzfOswNPEOQHnijbZ5BxVnmvmjujol0/tafME=;
        b=VkQFBk8GtrIe2JZe6GbnHdwd6zvFxPt9zq4PrBL6qk4lNjR8TyV26r48w3yVyNJKwv
         vRSa6XRG6pN2pCnn9c8U1ob5GVk8lMS350suGRC5T4AqRbRw7vsjpGxkevyG5Nyi3TLF
         5PHnICB5YjmSeBqFUl0D60u5J3Og6QbTCLaZcVqTDv768omHDYvLdmKm6sgi49YC1DaF
         O+vODoHeBOqWUQt4Y8mcaVajGD7ojMEFbN0lvwKfWV7Wu3sWBvZEwhdbDQoH6IQ7uhJm
         jWxc+l4FtLAN71u9FZOgDZiEqZ72B/himxo/24aGa4bybnf4M+CY7N3dnDyPgFHOwsrn
         gTeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+E4TaN02XWh1iXvEoL5Dw8boZeNQI6eyGKwXmbuxEf/t8bU6035sjtN7nhohKYNyrpQO7H6siU64sZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlAjlOcTNrvliDQh0x9l7V5heIz18sdYtKft6tPVhexvwpJ+1W
	7pGNzvFPyd8uzUZnW9xioPz8+rrsO4cf/831/ukr5aiN0+zeW6OgLK5cDuu4gDOpjwf825nspRk
	GEeT8s5AuUm5lBHllAA==
X-Received: from wmj21.prod.google.com ([2002:a05:600c:255:b0:480:69c2:3949])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e8f:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-485198d8b81mr83642225e9.35.1772700184640;
 Thu, 05 Mar 2026 00:43:04 -0800 (PST)
Date: Thu, 5 Mar 2026 08:43:03 +0000
In-Reply-To: <aak9ZBJenK1DSCEt@monoceros>
Mime-Version: 1.0
References: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
 <CGME20260113151335eucas1p157cd966c5f0f4e477fb11272810a0ae8@eucas1p1.samsung.com>
 <20260113-clk-send-sync-v4-3-712bc7d94a79@google.com> <90657b83-1cff-4c7d-adde-9b560c2be7c2@samsung.com>
 <3cfeounnaphhezvjpz5igswml6iu3b6jhwhjn2g4ziimjdoefi@ge4ezxx6jxlr> <aak9ZBJenK1DSCEt@monoceros>
Message-ID: <aalCF0Egy6gWXdBK@google.com>
Subject: Re: [PATCH v4 3/3] pwm: th1520: remove impl Send/Sync for Th1520PwmDriverData
From: Alice Ryhl <aliceryhl@google.com>
To: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_004308_121391_793F19A5 
X-CRM114-Status: GOOD (  20.43  )
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

T24gVGh1LCBNYXIgMDUsIDIwMjYgYXQgMDk6MjQ6MzNBTSArMDEwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gT24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgMDk6NDg6NDhB
TSArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gPiBPbiBNb24sIEphbiAxOSwgMjAy
NiBhdCAxMDo0NTo1NlBNICswMTAwLCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToKPiA+ID4gT24g
MS8xMy8yNiAxNjoxMiwgQWxpY2UgUnlobCB3cm90ZToKPiA+ID4gPiBOb3cgdGhhdCBjbGsgaW1w
bGVtZW50cyBTZW5kIGFuZCBTeW5jLCB3ZSBubyBsb25nZXIgbmVlZCB0byBtYW51YWxseQo+ID4g
PiA+IGltcGxlbWVudCB0aGVzZSB0cmFpdHMgZm9yIFRoMTUyMFB3bURyaXZlckRhdGEuIFRodXMg
cmVtb3ZlIHRoZQo+ID4gPiA+IGltcGxlbWVudGF0aW9ucy4KPiA+ID4gCj4gPiA+IEkgdGhvdWdo
dCB0aGlzIHdhcyBhbHJlYWR5IG1lcmdlZCA6LSkuCj4gPiA+IAo+ID4gPiBSZXZpZXdlZC1ieTog
TWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPiA+IAo+ID4gSWYg
SSB1bmRlcnN0YW5kIGNvcnJlY3RseSB0aGlzIHBhdGNoIDMgZGVwZW5kcyBvbiB0aGUgZmlyc3Qg
cGF0Y2ggb2YKPiA+IHRoaXMgc2VyaWVzIHNvIEkgY2Fubm90IHBpY2sgaXQgdXAgdmlhIHRoZSBw
d20gdHJlZSAqbm93Ki4gVGhlcmUgaXMKPiA+IGFub3RoZXIgcGF0Y2ggcGVuZGluZyBmb3IgdGhl
IHRoMTUyMCBQV00gZHJpdmVyLCBidXQgYXMgb2Ygbm93IGdpdCBzZWVtcwo+ID4gdG8gY29wZSB3
ZWxsIHdoZW4gbWVyZ2luZyB0aGUgcHdtJ3MgdHJlZSBmb3ItbmV4dCB3aXRoIHRoaXMgcGF0Y2gu
ICBTbwo+ID4gaXQncyBmaW5lIGZvciBtZSBpZiB0aGUgc2VyaWVzIGlzIHBpY2tlZCB1cCBmb3Ig
Ni4yMC1yYzEgdmlhIHRoZSBjbG9jawo+ID4gdHJlZS4KPiAKPiBUaGF0IGRpZG4ndCBoYXBwZW4g
KHdpdGggcy82LjIwLzcuMC8pLCBzbyB0aGlzIHBhdGNoIGlzIHN0aWxsIG9wZW4gaW4gbXkKPiB0
b2RvIGxpc3QuIElzIHRoZSBmaXJzdCBwYXRjaCBzdGlsbCBjb25zaWRlcmVkIGZvciB0aGUgY2xr
IHN1YnN5c3RlbT8KPiBXaGF0IGlzIHRoZSBwbGFuIGZvciB0aGUgcHdtIHBhdGNoPwoKSXQncyBi
ZWVuIG9uIG15IHRvZG8gbGlzdCB0byB0cnkgYW5kIGNvbnRhY3QgU3RlcGhlbiB0byBzZWUgaWYg
aGUgY2FuCnRha2UgdGhlc2UgcGF0Y2hlcywgb3IgaWYgaGUgaXMgb2theSB3aXRoIHRoZW0gZ29p
bmcgdGhyb3VnaCBhbm90aGVyCnRyZWUsIGJ1dCBJIGhhdmUgbm90IGdvdHRlbiBhcm91bmQgdG8g
aXQuIEhlIGhhcyBub3QgcmVwbGllZCBvbiB0aGUgbGlzdAp0byBhbnkgdmVyc2lvbiBvZiB0aGlz
IHNlcmllcy4KCkFsaWNlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
