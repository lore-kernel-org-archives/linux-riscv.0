Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3DCCD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 13:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGVSinACnGCjDPJeAh+qwd/hTa1n1UjkIxhF3+YFj04=; b=q1ppesKakZTTBT
	EDROcuNjeYuL6iH1nvos0ffVhfBItLEhKVPJSfRpLQ7giiZ/0nAisWClSEf+20YFnjnDmg6pWFCsG
	WESwp23Nfq+PG4486O3DDByifBR2URDcmVe6KFb5UDpsG5Ds37/eHVA2XbP/NzXTWYf32J3MmPDP4
	WYvEety/CMBSRQewa/MpyWz/iJjHEoX9P8yGJYgAOrxmJ/n2/zt6toR5WOItvjT8Id26CVi7Nt+h/
	fjowINfbI3P3QrxzwC4L+9Aj/Mh1t+Bu64tqStQnh5qZpnCqLwK33xCfnq+67hhI3fFCYVbIYHpLn
	8ssJSbVu/GqVu9MBT3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rre2S-0000000BKEy-2mfz;
	Tue, 02 Apr 2024 13:18:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rre2P-0000000BKD7-0EFE
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 13:18:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 48CF360FE4;
	Tue,  2 Apr 2024 13:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD3AC433C7;
	Tue,  2 Apr 2024 13:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712063931;
	bh=jY5//6Du2pTQZWVH0jCz+G3qgjlZ0vRTRA6F/N21xAM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D08TMqDUO1xmdZLn0nLYMEK8EgL9/rQL8jEl4BTnp/+gVup8uwgXxf/ETYwvAgI+Q
	 etNe0s3f89IhcfIKmeMWRzp6/2abfxbPl/FaJleloRAKL7T+JglpnfBKU73niCkGTD
	 Ihbs9OYCfoeuiQw/Ax+4u5v2ZEZbwS2u9uQSrtwaBBNo+s7vEKV+feON4LMc1q+bc/
	 A0daqzNqniOz4/W9n9XRIwPbOKoY+3/BgUyJmIg8oqqMZ9oKLrbEK+jhE+KgoVg/k5
	 9EWrkV1EltuC/tWXdH5gJd+E5kLa5VGUbk+AtART1SdurDWUQFt7hTvN/YLEZJYN0Y
	 raHLfffNDDuoA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>
Cc: puranjay12@gmail.com
Subject: Re: [PATCH 0/2] riscv: ftrace: make stack walk more robust.
In-Reply-To: <20240328184020.34278-1-puranjay12@gmail.com>
References: <20240328184020.34278-1-puranjay12@gmail.com>
Date: Tue, 02 Apr 2024 15:18:48 +0200
Message-ID: <8734s3sy13.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_061853_221133_E884B056 
X-CRM114-Status: GOOD (  14.61  )
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

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPiB3cml0ZXM6Cgo+IFRoZSBjdXJy
ZW50IHN0YWNrIHdhbGtlciBpbiByaXNjdiBpbXBsZW1lbnRlZCBpbiB3YWxrX3N0YWNrZnJhbWUo
KSBwcm92aWRlcwo+IHRoZSBQQyB0byBhIGNhbGxiYWNrIGZ1bmN0aW9uIHdoZW4gaXQgdW53aW5k
cyB0aGUgc3RhY2tzLiBUaGlzIGRvZXNuJ3QKPiBhbGxvdyBpbXBsZW1lbnRpbmcgc3RhY2sgd2Fs
a2VycyB0aGF0IG5lZWQgYWNjZXNzIHRvIG1vcmUgaW5mb3JtYXRpb24gbGlrZQo+IHRoZSBmcmFt
ZSBwb2ludGVyLCBldGMuCj4KPiBUaGlzIHNlcmllcyBtYWtlcyB3YWxrX3N0YWNrZnJhbWUoKSBw
cm92aWRlIGEgdW53aW5kZV9zdGF0ZSBzdHJ1Y3R1cmUgdG8KPiBjYWxsYmFjayBmdW5jdGlvbnMu
IFRoaXMgc3RydWN0dXJlIGhhcyBhbGwgdGhlIGluZm9ybWF0aW9uIHRoYXQKPiB3YWxrX3N0YWNr
ZnJhbWUoKSBjYW4gcHJvdmlkZS4KPgo+IEN1cnJlbnRseSwgdGhlcmUgYXJlIGZvdXIgdXNlcnMg
b2Ygd2Fsa19zdGFja2ZyYW1lKCk6IHJldHVybl9hZGRyZXNzKCksCj4gcGVyZl9jYWxsY2hhaW5f
a2VybmVsKCksIGR1bXBfYmFja3RyYWNlKCksIGFuZCBfX2dldF93Y2hhbigpLiBBbGwgb2YgdGhl
c2UKPiBoYXZlIGJlZW4gY29udmVydGVkIHRvIHVzZSBhcmNoX3N0YWNrX3dhbGsoKSByYXRoZXIg
dGhhbiBjYWxsaW5nCj4gd2Fsa19zdGFja2ZyYW1lKCkgZGlyZWN0bHkuCj4KPiBXZSBuZWVkIHRo
aXMgdG8gaW1wbGVtZW50IGFyY2hfYnBmX3N0YWNrX3dhbGsoKSB0aGF0IHByb3ZpZGVzIGEgY2Fs
bGJhY2sKPiB0aGF0IG5lZWRzIHRoZSBGUCwgU1AsIGFuZCBQQy4gVGhpcyB3aWxsIGJlIG5lZWRl
ZCBmb3IgaW1wbGVtZW50aW5nIEJGUAo+IGV4Y2VwdGlvbnMgZm9yIFJJU0NWLgoKSG1tLCBJIHdv
bmRlciBpZiBpdCdzIGVhc2llciB0byBoYXZlIHRoZXNlIHR3byBwYXRjaGVzIGFzIHBhcnQgb2Yg
dGhlCkJQRiBleGNlcHRpb24gc2VyaWVzLCBpbnN0ZWFkIG9mIGhhdmluZyB0aGUgZGVwZW5kZW5j
aWVzIGJlIGNyb3NzLXRyZWU/Cgo+IFRoZXJlIGFyZSBubyBmdW5jdGlvbmFsIGNoYW5nZXMgaW4g
dGhpcyBzZXJpZXMuCj4KPiBJIGhhdmUgdGVzdGVkIHRoaXMgYnkgY3Jhc2hpbmcgdGhlIGtlcm5l
bCBhbmQgbG9va2luZyBhdCB0aGUgc3RhY2sgdHJhY2UKPiB3aXRoIGFuZCB3aXRob3V0IENPTkZJ
R19GUkFNRV9QT0lOVEVSCgpJIGhhdmUgdHdvIHJlYWxseSBtaW5vciBzdHlsZSBuaXRzLCBidXQg
cmVnYXJkbGVzcyBpZiB0aGV5J3JlIGZpeGVkIG9yCm5vdDoKClJldmlld2VkLWJ5OiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
