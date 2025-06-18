Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF56C71136
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 01:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aNj6tsQ3o9q4h/zPLMcdw98tnWtkZdtj711RYdEiV9M=; b=HlGpE2YQt2zHFL
	wg4wgAlKv9z0R9DepV2hFQ78fmo+2hO3WX94U+pH1b0V3sjyKYMCCK9/MnlTZZHlfEf98+xmFUu4R
	CopUFoCf5eaWSId/e5t6Bc+mcizsKTX/vsZy0dUtNv1kZ/HrtobqjGlSpZl1HpGjV+YSp84+5hUA3
	0tJEAKiItVAYAiYv02GBFPXK/aA53aBB41qDMxFF1THUJ+XQy2kIkPdRlJqYX82pCEz8+qN0+l8oF
	6x1s8RTsSjtrxS2AmWpCGEH26WvqkVKqVjyOYLVsXdn5XwOWXwGda3A9PycpuACvc1GvHGVzTNYeQ
	aseIHJm3vV9MdwE1mZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhPp-00000008jQD-3MDz;
	Wed, 18 Jun 2025 01:16:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRhPo-00000008jPd-28P9
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 01:16:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E829629FD
	for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 01:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B42C4CEFA
	for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 01:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750209395;
	bh=SBDJcf09SwcwG06z/rkKrsCcFxSZMbyKPtB+DVPGYhA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wf4hpB4tJy8O25elPcp4jElL23bQfdMwbL9Fk3DmQrcmWBKK9JoS1aGKpV/gSEWpy
	 8yTAdqLARCWZNz18qgoio2PISfKsdbaB0z1DzTfJkSQKLCdEBuhnBIga8kmBrXGIg+
	 Ojl3wCJ/C9gfzhG0hnj2cdWK1YZ7r/cgmv5CGqOyTd15Wl6nyPwCcc7dduhxtcZGYa
	 GjaphDhlBvxuPa9vOFq7auClfHBnSr+lcZANi574+eM4D169J9HwYr9/diRwKWoVvx
	 C7wl8SyebWKZMYO62StGWDp4t+LWunxvD0TZUYU9qL5AwwNhC+5+ppZqPYvsdVEFGj
	 QEDF42xpUloGg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5534edc6493so6915888e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 18:16:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBC2ZFgVeHxbMYRWjZzNsr3iAlafduKHT+Zcv8QW4/43yHpFagRQh8NoCux2nvI//YKQGeUaxjeNJ8xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZZg0IQUSf8khqyUQ4MZhY3L24MQ9ytJWFLqTFf5hwRNXVaezq
	W2tGBINUO/8nJT3PWVRV5KlXFM4YU+r30yyEN6qalRiU7LYgYY8dR3vlGNaCaYHF9m3FQhUsXL8
	7Z9dkoynq/q+vNS+r2W5ah3FPxcDFSWc=
X-Google-Smtp-Source: AGHT+IFiIfr5F6VDkk3G3Oh9AbB4n2HtzYAJy/s+BIZll9kvq4oJWZgFM8XLjVs97si6LTR33fQZ3chGvUAjn7TxohA=
X-Received: by 2002:a05:6512:39d3:b0:553:3073:c38b with SMTP id
 2adb3069b0e04-553b6e734c9mr3786666e87.1.1750209393856; Tue, 17 Jun 2025
 18:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <20250611-kunit-kselftests-v3-4-55e3d148cbc6@linutronix.de>
 <CAK7LNAQUN3hWYh_1=LMzVp1Ddbq3W=yGHZ5__LbcfBajfuhscg@mail.gmail.com> <20250617095102-d3df1c46-3d51-4f77-af0a-8299f5e71ad9@linutronix.de>
In-Reply-To: <20250617095102-d3df1c46-3d51-4f77-af0a-8299f5e71ad9@linutronix.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 18 Jun 2025 10:15:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNASe0aQdO1m6sUQXEkYxgXT+_2xOVnX4x4f4V4adpaeZ0w@mail.gmail.com>
X-Gm-Features: AX0GCFvJl9wi9pNxHMzc9efbA-PWAwWgE5oc_vBzkXhWJDp4BubPAbGKLKZ0oL4
Message-ID: <CAK7LNASe0aQdO1m6sUQXEkYxgXT+_2xOVnX4x4f4V4adpaeZ0w@mail.gmail.com>
Subject: Re: [PATCH v3 04/16] kbuild: userprogs: add nolibc support
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

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgNDo1OeKAr1BNIFRob21hcyBXZWnDn3NjaHVoCjx0aG9t
YXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDE3LCAy
MDI1IGF0IDEyOjM1OjA3QU0gKzA5MDAsIE1hc2FoaXJvIFlhbWFkYSB3cm90ZToKPiA+IE9uIFdl
ZCwgSnVuIDExLCAyMDI1IGF0IDQ6MzjigK9QTSBUaG9tYXMgV2Vpw59zY2h1aAo+ID4gPHRob21h
cy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+IHdyb3RlOgo+ID4gPgo+ID4gPiBVc2VycHJvZ3Mg
YXJlIGJ1aWx0IHdpdGggdGhlIHJlZ3VsYXIga2VybmVsIGNvbXBpbGVyICRDQy4KPiA+ID4gQSBr
ZXJuZWwgY29tcGlsZXIgZG9lcyBub3QgbmVjZXNzYXJpbHkgY29udGFpbiBhIGxpYmMgd2hpY2gg
aXMgcmVxdWlyZWQKPiA+ID4gZm9yIGEgbm9ybWFsIHVzZXJzcGFjZSBhcHBsaWNhdGlvbi4KPiA+
ID4gSG93ZXZlciB0aGUga2VybmVsIHRyZWUgZG9lcyBjb250YWluIGEgbWluaW1hbCBsaWJjIGlt
cGxlbWVudGF0aW9uCj4gPiA+ICJub2xpYmMiIHdoaWNoIGNhbiBiZSB1c2VkIHRvIGJ1aWxkIHVz
ZXJzcGFjZSBhcHBsaWNhdGlvbnMuCj4gPiA+Cj4gPiA+IEludHJvZHVjZSBzdXBwb3J0IHRvIGJ1
aWxkIHVzZXJwcm9ncyBhZ2FpbnN0IG5vbGliYyBpbnN0ZWFkIG9mIHRoZQo+ID4gPiBkZWZhdWx0
IGxpYmMgb2YgdGhlIGNvbXBpbGVyLCB3aGljaCBtYXkgbm90IGV4aXN0Lgo+ID4gPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRy
b25peC5kZT4KPiA+ID4KPiA+ID4gLS0tCj4gPiA+IFRoaXMgY291bGQgcHJvYmFibHkgYmUgbW92
ZWQgb3V0IG9mIHRoZSBnZW5lcmljIGtidWlsZCBtYWtlZmlsZXMuCj4gPiA+IEkgdGhpbmsgdGhl
IGVyZ29uaW1pY3Mgd291bGQgc3VmZmVyIGFuZCB0aGlzIGZ1bmN0aW9uYWxpdHkgY291bGQgYmUK
PiA+ID4gdXNlZCBieSBvdGhlciB1c2VycyBvZiB1c2VycHJvZ3MuCj4gPiA+Cj4gPiA+IEFsc28g
dGhpcyBkb2VzIGN1cnJlbnRseSBub3Qgc3VwcG9ydCBvdXQtb2YtdHJlZSBidWlsZHMuCj4gPiA+
IEZvciB0aGF0IHRvb2xzL2luY2x1ZGUvbm9saWJjLyouaCBhbmQgdXNyL2luY2x1ZGUvKi5oIHdv
dWxkIG5lZWQgdG8gYmUKPiA+ID4gaW5zdGFsbGVkIGludG8gdGhlIGJ1aWxkIGRpcmVjdG9yeS4K
Pgo+IDxzbmlwPgo+Cj4gPiA+IC0tLSBhL3NjcmlwdHMvTWFrZWZpbGUudXNlcnByb2dzCj4gPiA+
ICsrKyBiL3NjcmlwdHMvTWFrZWZpbGUudXNlcnByb2dzCj4gPiA+IEBAIC0xNiwxMCArMTYsMTcg
QEAgdXNlci1jc2luZ2xlICAgICAgICA6PSAkKGFkZHByZWZpeCAkKG9iaikvLCAkKHVzZXItY3Np
bmdsZSkpCj4gPiA+ICB1c2VyLWNtdWx0aSAgICA6PSAkKGFkZHByZWZpeCAkKG9iaikvLCAkKHVz
ZXItY211bHRpKSkKPiA+ID4gIHVzZXItY29ianMgICAgIDo9ICQoYWRkcHJlZml4ICQob2JqKS8s
ICQodXNlci1jb2JqcykpCj4gPiA+Cj4gPiA+ICt1c2VyX25vbGliY19jY2ZsYWdzIDo9IC1ub3N0
ZGxpYiAtbm9zdGRpbmMgLXN0YXRpYyAtZm5vLWlkZW50IC1mbm8tYXN5bmNocm9ub3VzLXVud2lu
ZC10YWJsZXMgXAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgLWZmcmVlc3RhbmRpbmcgLWZu
by1zdGFjay1wcm90ZWN0b3IgXAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgLWlzeXN0ZW0g
JChvYmp0cmVlKS91c3IvaW5jbHVkZSAtaW5jbHVkZSAkKHNyY3RyZWUpL3Rvb2xzL2luY2x1ZGUv
bm9saWJjL25vbGliYy5oIC1pc3lzdGVtICQoc3JjdHJlZSkvdG9vbHMvaW5jbHVkZS9ub2xpYmMv
Cj4gPgo+ID4gVGhlIHRvb2xzLyBkaXJlY3RvcnkgaXMgYSBkaWZmZXJlbnQgd29ybGQsIGFuZCBL
YnVpbGQgc2NyaXB0cyBkbyBub3Qga25vdwo+ID4gYW55dGhpbmcgYWJvdXQgaXQuCj4KPiBBY2su
Cj4KPiBIb3cgZG9lcyB0aGlzIHN0YXRlbWVudCBhZmZlY3QgdGhlIG5leHQgcGF0Y2ggd2hpY2gg
Y3JlYXRlcwo+IHRvb2xzL2luY2x1ZGUvbm9saWJjL0tjb25maWcubm9saWJjID8KPiBJcyBpdCBm
aW5lIHRvIGNyZWF0ZSB0aGUgS2NvbmZpZyBmaWxlIGluIHRvb2xzLyBvciBzaG91bGQgSSBtb3Zl
IGl0Pwo+IEkgZG8gd2FudCB0byBtYWludGFpbiB0aGlzIGZpbGUgYXMgcGFydCBvZiBub2xpYmMg
YW5kIG5vdCBLVW5pdC4KPiBUaGUgcG9zc2liaWxpdGllcyBJIHNlZSBhcmUgaW5pdC9LY29uZmln
Lm5vbGliYyBvciBsaWIvS2NvbmZpZy5ub2xpYmMuCgpQZXJzb25hbGx5IEkgbGlrZSBpbml0L0tj
b25maWcubm9saWJjLgooSSBhbSBldmVuIGZpbmUgd2l0aCBhZGRpbmcgdGhpcyBuZXcgZW50cnkg
dG8gaW5pdC9LY29uZmlnKQpCdXQsIHRoaXMgZmlsZSBpcyBub3Qgd2hhdCBJIG1haW50YWluLiBJ
dCBpcyB1cCB0byB5b3UgYWZ0ZXIgYWxsLgoKCgo+ID4gQW5kLCB5b3UgZG8gbm90IG5lZWQgdG8g
aW1wbGVtZW50IHRoaXMgaW4gc2NyaXB0cy9NYWtlZmlsZS51c2VycHJvZ3MKPiA+IGJlY2F1c2Ug
eW91IGNhbiBtb3ZlIHRoaXMgdG8gbGliL2t1bml0L01ha2VmaWxlLmt1bml0LXVhcGkgb3Igc29t
ZXdoZXJlLgo+Cj4gVW5kZXJzdG9vZC4gVGhpcyBpcyBub3QgdW5leHBlY3RlZCwgYXMgaGludGVk
IGluIHRoZSBjb21taXQgbWVzc2FnZS4KCk9uZSBleGlzdGluZyBleGFtcGxlIGlzIGxpYi92ZHNv
L01ha2VmaWxlLmluY2x1ZGUsIHdoaWNoIGlzIGluY2x1ZGVkCmZyb20gbXVsdGlwbGUgTWFrZWZp
bGVzLgoKCgoKCj4gPiA+ICt1c2VyX25vbGliY19sZGZsYWdzIDo9IC1ub3N0ZGxpYiAtbm9zdGRp
bmMgLXN0YXRpYwo+ID4gPiArCj4gPiA+ICB1c2VyX2NjZmxhZ3MgICA9IC1XcCwtTU1ELCQoZGVw
ZmlsZSkgJChLQlVJTERfVVNFUkNGTEFHUykgJCh1c2VyY2NmbGFncykgXAo+ID4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICAkKCQodGFyZ2V0LXN0ZW0pLXVzZXJjY2ZsYWdzKQo+ID4gPiAtdXNl
cl9sZGZsYWdzICAgPSAkKEtCVUlMRF9VU0VSTERGTEFHUykgJCh1c2VybGRmbGFncykgJCgkKHRh
cmdldC1zdGVtKS11c2VybGRmbGFncykKPiA+ID4gLXVzZXJfbGRsaWJzICAgID0gJCh1c2VybGRs
aWJzKSAkKCQodGFyZ2V0LXN0ZW0pLXVzZXJsZGxpYnMpCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICQoJCh0YXJnZXQtc3RlbSktdXNlcmNjZmxhZ3MpICQoaWYgJCgkKHRhcmdldC1zdGVt
KS1ub2xpYmMpLCQodXNlcl9ub2xpYmNfY2NmbGFncykpCj4gPiA+ICt1c2VyX2xkZmxhZ3MgICA9
ICQoS0JVSUxEX1VTRVJMREZMQUdTKSAkKHVzZXJsZGZsYWdzKSAkKCQodGFyZ2V0LXN0ZW0pLXVz
ZXJsZGZsYWdzKSBcCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICQoaWYgJCgkKHRhcmdl
dC1zdGVtKS1ub2xpYmMpLCQodXNlcl9ub2xpYmNfbGRmbGFncykpCj4gPiA+ICt1c2VyX2xkbGli
cyAgICA9ICQodXNlcmxkbGlicykgJCgkKHRhcmdldC1zdGVtKS11c2VybGRsaWJzKSBcCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICQoaWYgJCgkKHRhcmdldC1zdGVtKS1ub2xpYmMpLCQo
dXNlcl9ub2xpYmNfbGRsaWJzKSkKPiA+ID4KPiA+ID4gICMgQ3JlYXRlIGFuIGV4ZWN1dGFibGUg
ZnJvbSBhIHNpbmdsZSAuYyBmaWxlCj4gPiA+ICBxdWlldF9jbWRfdXNlcl9jY19jID0gQ0MgW1Vd
ICAkQAo+Cj4KPiBUaG9tYXMKCgotLQpCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
