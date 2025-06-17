Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4903C71157
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 07:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D/SlyQn/6aglV25sH0kzJ2SFHgrTh0PnEBZD8I2WEQI=; b=45WQg3r7kpW//s
	dXCJ22r0Rw12UY0SWPGyB6iHBhGzSgakVg6xiYUpaEkFykHzxe9p9mG3UcMAZgHpgaO2RG3wZPLEu
	1KkJrCSBFSr6TK2T2zs3G2mIbjBVnpiH7dopffs0s7ST+bw7RRUOE2kHDX5wyiy12O8QwKEiHYzDk
	OZIv6JIC/KgCfRUQZFvxMHAq4oaH8R+opP2GMqn7npWCXu+2fcP6lNpcVrMwyaq4I1IwufwOADk77
	eqSJRZFJJb4e7jt5RvVmE4BCHnAywLPe1xwoMNYi5cavqNBNSPVEKYDv5FTGktxlO2s+VVBO2y71E
	navKTuMwRby/fvr1B68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRR60-00000006VP2-0TnK;
	Tue, 17 Jun 2025 07:51:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRR5w-00000006VOh-3gi0
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 07:51:02 +0000
Date: Tue, 17 Jun 2025 09:50:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750146659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Jjhcx//IthYr9wU93G8syVel3LsyenN2WbCDiVNpHY=;
	b=pBHIXIA2nUIPMhiTRpILN2iiHLnKHbbNOTd5eK+f4jnkTY+5JJ+Pli9LRwvybuZ1QZG1A9
	cC+UAO4NUUvP56+oDc8fS6rJ2ph99eF4qymy3EvZsgZ1p3Ng8XXI9Rj5j/V9BIc7GFDgGs
	duA6fGScmpCs0+tI57iR2FcX/aKxnly843Fkpo327i3ERWN7/Rim0zmnJauu1JQz3ohnsu
	RYruqZ2USvkZYHksf1WvQU7oV2YQ2PHzeYj6c8k8pFvW3XVYpXyM0maj7YyUP9UxF06+9u
	YtpfrAP3/nIKC8l6cbCdMzKliKKXGUSrissi1upq4pYYDdmXpzAF5OuREbbchw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750146659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Jjhcx//IthYr9wU93G8syVel3LsyenN2WbCDiVNpHY=;
	b=xRnqx39lvyi7u9ydJO6RVHBz2TCIhyj7pF1uF1yldbEVwrjwDqsDwva3GHf7laAkyuCP4h
	ZO5ooLUM92HS36Dw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, workflows@vger.kernel.org
Subject: Re: [PATCH v3 07/16] kbuild: introduce blob framework
Message-ID: <20250617094327-373f046c-4010-4939-bd07-51365b665cdd@linutronix.de>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <20250611-kunit-kselftests-v3-7-55e3d148cbc6@linutronix.de>
 <CAK7LNARYXKq9KyCczcY_VjwQG3QWEufV1McayHDnavvuU+JEhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNARYXKq9KyCczcY_VjwQG3QWEufV1McayHDnavvuU+JEhQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_005101_066236_6A28C6B3 
X-CRM114-Status: GOOD (  20.41  )
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

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgMTI6Mzg6MjFBTSArMDkwMCwgTWFzYWhpcm8gWWFtYWRh
IHdyb3RlOgo+IE9uIFdlZCwgSnVuIDExLCAyMDI1IGF0IDQ6MzjigK9QTSBUaG9tYXMgV2Vpw59z
Y2h1aAo+IDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPiB3cm90ZToKPiA+Cj4gPiBW
YXJpb3VzIHN1YnN5c3RlbXMgZW1iZWQgbm9uLWNvZGUgYnVpbGQgYXJ0aWZhY3RzIGludG8gdGhl
IGtlcm5lbCwKPiA+IGZvciBleGFtcGxlIHRoZSBpbml0cmFtZnMsIC9wcm9jL2NvbmZpZy5neiwg
dkRTTyBpbWFnZSwgZXRjLgo+ID4gQ3VycmVudGx5IGVhY2ggdXNlciBoYXMgdGhlaXIgb3duIGlt
cGxlbWVudGF0aW9uIGZvciB0aGF0Lgo+ID4KPiA+IEFkZCBhIGNvbW1vbiAiYmxvYiIgZnJhbWV3
b3JrIHRvIHByb3ZpZGUgdGhpcyBmdW5jdGlvbmFsaXR5Lgo+ID4gSXQgcHJvdmlkZXMgc3RhbmRh
cmQga2J1aWxkIGFuZCBDIEFQSXMgdG8gZW1iZWQgYW5kIGxhdGVyIGFjY2VzcyBub24tY29kZQo+
ID4gYnVpbGQgYXJ0aWZhY3RzIGludG8gdGhlIGtlcm5lbCBpbWFnZSBvciBtb2R1bGVzLgo+ID4K
PiA+IFJldmlld2VkLWJ5OiBOaWNvbGFzIFNjaGllciA8bi5zY2hpZXJAYXZtLmRlPgo+ID4gU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9u
aXguZGU+Cj4gCj4gS2J1aWxkIHByb3ZpZGVzIG9ubHkgYSBzbWFsbCBzZXQgb2Ygc3ludGF4ZXMs
IHlldCBpdCdzIGZsZXhpYmxlIGVub3VnaAo+IHRvIGFsbG93IGVhY2ggTWFrZWZpbGUgdG8gaW1w
bGVtZW50IHdoYXQgaXQgbmVlZHMuCj4gSSBhaW0gdG8ga2VlcCBLYnVpbGQgc2NyaXB0cyBhcyBz
aW1wbGUgYXMgcG9zc2libGUgYW5kIGF2b2lkIG92ZXItZW5naW5lZXJpbmcuCj4gCj4gSW5zdGVh
ZCwgeW91IGNhbiBpbXBsZW1lbnQgdGhpcyBpbiBsaWIva3VuaXQvTWFrZWZpbGUua3VuaXQtdWFw
aSBvciBzb21ld2hlcmUuCj4gVGhhdCB3YXksIEkgZG8gbm90IGhhdmUgdG8gYmUgd29ycmllZCBh
Ym91dCB3aGF0IHlvdSBkby4KClRoZSBnb2FsIHdhcyB0byBoYXZlIGEgZnJhbWV3b3JrIHRoYXQg
Y2FuIGJlIHVzZWQgaW5kZXBlbmRlbnRseSBvZiBLVW5pdCwKZm9yIHRoZSB1c2VjYXNlcyBsaXN0
ZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIChhbmQgYSBmZXcgdW5saXN0ZWQgb25lcykuCkJ1dCBJ
IGNhbiBnbyB3aXRoIGEgbW9yZSBzcGVjaWZpYyBzb2x1dGlvbiwgdG9vLgoKPiBBbHNvLCB5b3Vy
IHNlcGFyYXRlIGJsb2IgYXBwcm9hY2ggbG9va3MgcXVlc3Rpb25hYmxlIHRvIG1lLgoKPiBJbiB5
b3VyIGFwcHJvYWNoLCB0aGUgYmxvYiAoa3VuaXQtZXhhbXBsZS11YXBpLmJsb2IubykKPiBhbmQg
dGhlIGVudHJ5IHBvaW50IChrdW5pdC1leGFtcGxlLXRlc3QubykgY2FuIGJlIHNlcGFyYXRlIG1v
ZHVsZXMuCgpJbmRlZWQsIGhvd2V2ZXIgSSBkb24ndCBzZWUgdGhlIGlzc3VlIGZvciB0aGlzIHNw
ZWNpZmljIHBvaW50LgoKPiBUaGUgZW50cnkgcG9pbnQgd291bGQgYmUgYSBzbWFsbCBhbW91bnQg
b2YgYm9pbGVycGxhdGUuCj4gSSB3b3VsZCBrZWVwIHRoZSB1c2VyLXByb2dyYW0gYmxvYiBhbmQg
aXRzIGVudHJ5IHBvaW50IGluIHRoZSBzYW1lIEMgZmlsZS4KCkEgTWFrZWZpbGUgZGVwZW5kZW5j
eSBiZXR3ZWVuIHRoZSBDIGZpbGUgYW5kIGJsb2IgcGF5bG9hZCBpcyBhbHNvIG5lY2Vzc2FyeS4K
Cj4gKGFuZCBJIG1heSBjb25zaWRlciB3cml0aW5nIGEgbWFjcm8gZm9yIHBvcHVsYXRpbmcgYSBi
bG9iICsga25pdCBlbnRyeSkKClRoYXQgaXMgd2hhdCBJIGhhZCBpbiBkdXJpbmcgbXkgZWFybHkg
ZGV2ZWxvcG1lbnQsCmFuZCBJIGd1ZXNzIEknbGwgZ28gd2l0aCBpdCBhZ2Fpbi4KCgpUaG9tYXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
