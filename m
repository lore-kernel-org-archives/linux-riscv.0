Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25419C4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 09:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ei7G7IRVgLR4jQk6TPTiYJ6f7vQ4LlSwyRCU+tp1AeA=; b=fmxGUixxF3VsAT
	3kiAyyuvunko9SuquzeA9R2edpPsfjlVdwD4c16BEnWkjFdjj5wp7lh0H1qk51HLFYX8Zwnae9QAj
	hILWLuO8tfcN+ptW5m7xD5fmRBbo839oMxIeGzBVv2/8HjmUUD3+Mh/ZMciQmksi62XcD6s7L9sHV
	nKcVv6nRAIoh0im0NXcmOA3J0vAIp8FHDEIK81AuZA0GmeLFJI3y1fkI8/Uh35SoEFHJJmdrjh457
	dZ/jMwIb1m/kXfoONBaAPxguehIe5KH/wgDEZ2pbv6uAOg7ZNkuuti2t/v8iNo8mGKjsOTM2o8VIp
	MCx/dmaGBQNyaPX35oXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2841-00HQWJ-Cs; Mon, 05 Dec 2022 09:47:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p283w-00HQKy-6w
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 09:47:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8982B60FF2;
	Mon,  5 Dec 2022 09:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F628C433C1;
	Mon,  5 Dec 2022 09:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670233618;
	bh=ATIjD4eir5XBkS5wpUUkHOY7bfI0wqvtDyCyhmJDvJU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fMmdYErt1K0gAmnAgiPHlIRvDzToBywyrW/wS50HU9jcAzg3IMoocz1TabriHd4v1
	 GF5OMO9+IHu9/hBRTQ96a1by65RAMZVKmcVQnDYU31EFRrH6JDPF0l2J9J7R8OTsWI
	 bn3S4S4AU2u9n4YSfSl6boVpF5g/TdD+bE9EH4LCS0S3CmxHcGvTlgCUrdIqtBYwRJ
	 J9YIx7yAdyYtU0AUrhbvtSRpr7lOIyiM0n354wkfUqljeWST5OVMtkVFLHOk+Gb4Ah
	 0DI5pIZGWRSHbtwipF8qVvGPF+gda6Cf+PL0iSgpMAoFtT10YwuQZiYlbtW0MFQ2RH
	 ONcsIfI9zBqyQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, arnd@arndb.de, guoren@kernel.org,
 palmer@rivosinc.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, conor.dooley@microchip.com, heiko@sntech.de,
 jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org,
 chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com,
 zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com,
 chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH -next V8 00/14] riscv: Add GENERIC_ENTRY support and
 related features
In-Reply-To: <20221103075047.1634923-1-guoren@kernel.org>
References: <20221103075047.1634923-1-guoren@kernel.org>
Date: Mon, 05 Dec 2022 10:46:56 +0100
Message-ID: <877cz69o8f.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_014700_343101_DE20B264 
X-CRM114-Status: GOOD (  10.82  )
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

Z3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgoKPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXgu
YWxpYmFiYS5jb20+Cj4KPiBUaGUgcGF0Y2hlcyBjb252ZXJ0IHJpc2N2IHRvIHVzZSB0aGUgZ2Vu
ZXJpYyBlbnRyeSBpbmZyYXN0cnVjdHVyZSBmcm9tCj4ga2VybmVsL2VudHJ5LyouIEFkZGl0aW9u
YWxseSwgYWRkIGluZGVwZW5kZW50IGlycSBzdGFja3MgKElSUV9TVEFDS1MpCj4gZm9yIHBlcmNw
dSB0byBwcmV2ZW50IGtlcm5lbCBzdGFjayBvdmVyZmxvd3MuIEFkZCBnZW5lcmljX2VudHJ5IGJh
c2VkCj4gU1RBQ0tMRUFLIHN1cHBvcnQuIFNvbWUgb3B0aW1pemF0aW9uIGZvciBlbnRyeS5TIHdp
dGggbmV3IC5tYWNybyBhbmQKPiBtZXJnZSByZXRfZnJvbV9rZXJuZWxfdGhyZWFkIGludG8gcmV0
X2Zyb21fZm9yay4KPgo+IFdlIGhhdmUgdGVzdGVkIGl0IHdpdGggcnY2NCwgcnYzMiwgcnY2NCAr
IDMycm9vdGZzLCBhbGwgYXJlIHBhc3NlZC4KPgo+IFlvdSBjYW4gZGlyZWN0bHkgdHJ5IGl0IHdp
dGg6Cj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9ndW9yZW44My9saW51eC90cmVlL2dlbmVyaWNf
ZW50cnlfdjgKCkd1bywgdGhpcyBpcyBhIHJlYWxseSBuaWNlIHdvcmssIGFuZCBJJ20gbG9va2lu
ZyBmb3J3YXJkIGhhdmluZyBnZW5lcmljCmVudHJ5IHN1cHBvcnQgZm9yIFJWLiBIb3dldmVyLCB0
aGVyZSBhcmUgbWFueSBwYXRjaGVzIGluIHRoaXMgc2VyaWVzCnRoYXQgcmVhbGx5IHNob3VsZG4n
dCBiZSBwYXJ0IG9mIHRoZSBzZXJpZXMuCgpQYXRjaCAyLCAzLCA0LCBhbmQgMTAgc2hvdWxkIGRl
ZmludGVseSBiZSBwdWxsZWQgb3V0LgoKSSdtIG5vdCBzdXJlIDcsIDgsIGFuZCA5IGJlbG9uZyB0
byBzZXJpZXMsIGFzIGl0J3MgcmVhbGx5IGEgc2VwYXJhdGUKZmVhdHVyZS4KCkRpdG8gZm9yIHBh
dGNoIDExLCBpdCBqdXN0IG1ha2VzIHRoZSBzZXJpZXMgaGFyZGVyIHRvIHJldmlldy4KCkZvciBH
RU5FUklDX0VOVFJZIHN1cHBvcnQgb25seSBwYXRjaCAxLCA1LCA2LCAxMiwgMTMsIGFuZCAxNCwg
cmVhbGx5CnJlcXVpcmVkLiBUaGUgb3RoZXJzIGFyZSB1bnJlbGF0ZWQuCgoKVGhhbmtzLApCasO2
cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
