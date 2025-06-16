Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82437C71136
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFLmsLd3mWMghZbPQYRoe77fDnd/h1ev1EwvxfJtAe0=; b=4AZsdVLkOn2iTL
	y1ouV9XoKykdfb/2c5X2Eyhb7BJlcxY9iwjIyksxpoHs+1qMwTi+oPTySrwa4UYRTw5rXlOq4MfSO
	aeWUIDBjh3DF2oO4QPxLl1ojr+iofnHYl9+fphsy8zkTMnDBWy7BqmQncwizhc2s5TEePj5L1BPZ5
	kvapGvvznIYipyjMTgspQpypqrWX2WzmvnBk9j92y5XRGopHyoRBtap3v/f4/Gr1+9LaifdhjUXV5
	zHkXf98R5Iv0eAoxKVKl3HWEsJ0TShj6wEgkwoT7hQeBqibrWObnm5tf3KjFujKI/mG39Jd6l5J0t
	TM1kJj8rAR27IgnJ0GlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREZw-00000005DbS-2gwB;
	Mon, 16 Jun 2025 18:29:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBvH-00000004uUO-3wmK
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 15:39:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E7E84AB52
	for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 15:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDA1C4CEF6
	for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 15:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750088339;
	bh=F8BcwaM+WtE8oZEsemH+lZITn+Dw3YFdoAc5CYBdnNE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GY6g8jwgBkalDRzhuY6Q7GoyO/bK8noe5AsFFZJQ7QZTjKrP3+zAxpbGtx+e+A93c
	 fL8cH0GciSbiWBveHx8K0E23kBGiRZcUQyFIImWyNTgKZ8okKyIEtIVvX8H5UPP1mF
	 7f24hRRGWkgmGqAhBdPXEp4l1zpssO9s1XHbrxk1Vqk7zRxMZ4S3/qdw6uUHryhysD
	 g3da3XEQ9egt6qr/Ept1i6nYSPu4t49uN90tTirtRnju6S1a8aIgUM9xHsuETT5H+F
	 iWvcxexMypYWygOAqXEYNoeNmlLLjXgQHrLDQoEILQIUNMR/z8rW9tQDh3lrfyVdH+
	 OJY9hp5tW9OqQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55220699ba8so5728957e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 08:38:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNFt8+TkbNG74XzBpMFhOilisY1zBDWZcgOHuh5aI6LsjMwZRWeff1qoRp42nMdmETJsnJcc5cvq8+YA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyi9VJwWy9vuX+Y6KjZA6DaFKBazRvj/qP6HPvzkMMfZH5gFS2
	bezn8+CYqRGbk0Y1422wSPlLqzb8A+sKXprFYOFQ++vKF+0bY0XUkJQLuF1VN5SWHOc3HZHSaAi
	vbs/5WMyZCqXiOFwzjgVB4/BcaeW/tsQ=
X-Google-Smtp-Source: AGHT+IEi914yNdf7ItDxIuKSAhzqs66BT0pQ2P1yp+Fi9zjJkYGAgGwLeuM43Lf6chAvKr1xpfz1JcNzMuKSRXlMjL4=
X-Received: by 2002:a05:6512:b9e:b0:553:28f1:66ec with SMTP id
 2adb3069b0e04-553b6f2a05fmr2377754e87.31.1750088338110; Mon, 16 Jun 2025
 08:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de> <20250611-kunit-kselftests-v3-7-55e3d148cbc6@linutronix.de>
In-Reply-To: <20250611-kunit-kselftests-v3-7-55e3d148cbc6@linutronix.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 17 Jun 2025 00:38:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNARYXKq9KyCczcY_VjwQG3QWEufV1McayHDnavvuU+JEhQ@mail.gmail.com>
X-Gm-Features: AX0GCFuUsGD9ADF5sHGYl1AePploex53t0fNoReQCDpmZEypT0Ao3cb2BMm8rbs
Message-ID: <CAK7LNARYXKq9KyCczcY_VjwQG3QWEufV1McayHDnavvuU+JEhQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/16] kbuild: introduce blob framework
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Willy Tarreau <w@1wt.eu>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	workflows@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_083900_019617_1B1C3DF8 
X-CRM114-Status: GOOD (  14.33  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgNDozOOKAr1BNIFRob21hcyBXZWnDn3NjaHVoCjx0aG9t
YXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPiB3cm90ZToKPgo+IFZhcmlvdXMgc3Vic3lzdGVt
cyBlbWJlZCBub24tY29kZSBidWlsZCBhcnRpZmFjdHMgaW50byB0aGUga2VybmVsLAo+IGZvciBl
eGFtcGxlIHRoZSBpbml0cmFtZnMsIC9wcm9jL2NvbmZpZy5neiwgdkRTTyBpbWFnZSwgZXRjLgo+
IEN1cnJlbnRseSBlYWNoIHVzZXIgaGFzIHRoZWlyIG93biBpbXBsZW1lbnRhdGlvbiBmb3IgdGhh
dC4KPgo+IEFkZCBhIGNvbW1vbiAiYmxvYiIgZnJhbWV3b3JrIHRvIHByb3ZpZGUgdGhpcyBmdW5j
dGlvbmFsaXR5Lgo+IEl0IHByb3ZpZGVzIHN0YW5kYXJkIGtidWlsZCBhbmQgQyBBUElzIHRvIGVt
YmVkIGFuZCBsYXRlciBhY2Nlc3Mgbm9uLWNvZGUKPiBidWlsZCBhcnRpZmFjdHMgaW50byB0aGUg
a2VybmVsIGltYWdlIG9yIG1vZHVsZXMuCj4KPiBSZXZpZXdlZC1ieTogTmljb2xhcyBTY2hpZXIg
PG4uc2NoaWVyQGF2bS5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhv
bWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KCktidWlsZCBwcm92aWRlcyBvbmx5IGEgc21h
bGwgc2V0IG9mIHN5bnRheGVzLCB5ZXQgaXQncyBmbGV4aWJsZSBlbm91Z2gKdG8gYWxsb3cgZWFj
aCBNYWtlZmlsZSB0byBpbXBsZW1lbnQgd2hhdCBpdCBuZWVkcy4KSSBhaW0gdG8ga2VlcCBLYnVp
bGQgc2NyaXB0cyBhcyBzaW1wbGUgYXMgcG9zc2libGUgYW5kIGF2b2lkIG92ZXItZW5naW5lZXJp
bmcuCgpJbnN0ZWFkLCB5b3UgY2FuIGltcGxlbWVudCB0aGlzIGluIGxpYi9rdW5pdC9NYWtlZmls
ZS5rdW5pdC11YXBpIG9yIHNvbWV3aGVyZS4KVGhhdCB3YXksIEkgZG8gbm90IGhhdmUgdG8gYmUg
d29ycmllZCBhYm91dCB3aGF0IHlvdSBkby4KCkFsc28sIHlvdXIgc2VwYXJhdGUgYmxvYiBhcHBy
b2FjaCBsb29rcyBxdWVzdGlvbmFibGUgdG8gbWUuCkluIHlvdXIgYXBwcm9hY2gsIHRoZSBibG9i
IChrdW5pdC1leGFtcGxlLXVhcGkuYmxvYi5vKQphbmQgdGhlIGVudHJ5IHBvaW50IChrdW5pdC1l
eGFtcGxlLXRlc3QubykgY2FuIGJlIHNlcGFyYXRlIG1vZHVsZXMuClRoZSBlbnRyeSBwb2ludCB3
b3VsZCBiZSBhIHNtYWxsIGFtb3VudCBvZiBib2lsZXJwbGF0ZS4KSSB3b3VsZCBrZWVwIHRoZSB1
c2VyLXByb2dyYW0gYmxvYiBhbmQgaXRzIGVudHJ5IHBvaW50IGluIHRoZSBzYW1lIEMgZmlsZS4K
KGFuZCBJIG1heSBjb25zaWRlciB3cml0aW5nIGEgbWFjcm8gZm9yIHBvcHVsYXRpbmcgYSBibG9i
ICsga25pdCBlbnRyeSkKCgoKPiAtLS0KPiBEdWUgdG8gaXRzIGNsb3NlbmVzcyB0byBrYnVpbGQg
dGhpcyBpcyBjdXJyZW50bHkgYWRkZWQgdG8gaXRzIE1BSU5UQUlORVIgZW50cnkuCj4gQnV0IEkg
Y2FuIGFsc28gbWFpbnRhaW4gaXQgb24gaXRzIG93bi4KCk9yLCBtYXliZSBkbyBub3QgYWRkIHRo
aXMuCgoKCgoKCi0tIApCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
