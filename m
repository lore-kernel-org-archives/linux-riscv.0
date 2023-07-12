Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F11EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 12:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2HO02kIbiskZ5Sqg0Gm6MILkQVi3evWaKEzs2DP3qxo=; b=N5G8us5oNvLiez
	m8DqZN1uU/44zmF1jbiGImPwPDoFulcUFneO3Uj3eiOYajOcG2ZHj3pK6fxdXd8mwEw/oxb7UUABu
	wXFkzQ6mw5bEVFKsG7CVwagsi5872d/c6q9CpuZnXP9q7oWQBmqDrYt+HqG8GPDuETLM3TMh98/0X
	NV7m+Pm4+d4JpKCwMUgIHbGvMPc/+ITRGPURI5Pe7vKRZnJ5FKkx6D0XIkg8fprGBWfb/vG7FmQm3
	aQhKNJyVSC/iz0ahnxZ9nrWluG+nsye2TX4ZLHOMqBqYjpk0jMXtvtkUJw8p/p9ONs6xbJWBZ9f72
	5mbq/xBBEwdegHv2HMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYwj-00HWuS-06;
	Wed, 12 Jul 2023 12:27:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYwh-00HWu1-1D
	for linux-riscv@bombadil.infradead.org;
	Wed, 12 Jul 2023 12:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZXR+7zHmkWbyYVaIYilEixXpel3+ET8rhBNIy+I7sKc=; b=burEIjw7Ax9oR6XyYXgzDOhcuF
	Xhtc5KYLObU41T0IENhk9G9qohZmC0Yvpb0wRw7l1oWGurx+n06gfe89pV9j1He1PowmLd8jJyW8G
	6zVp1GF2gkOuSfQqmnXwyuzEsSHJpzBzRoDcraZR5u1o/H5XlxRZYWJLxZ3Q2LE0UHn9fNAfiTk55
	AwKLj1j/r+rbJ4LHiTTJZlao2GGhqWJsjFEZodtwqDNEFYvFkQ0yagZeMU8KXrBVYKFvCwlCCX60H
	AgkXU1Hco0bnyVOotp2bryNT8o+jpABaFGlsKFzTpw66wm7t7tRLyXKz9AmKG+OeMgsd4mE9EXCCa
	pxRUvSiw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYwd-003e8q-0G;
	Wed, 12 Jul 2023 12:27:47 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AB77B30036B;
	Wed, 12 Jul 2023 14:27:45 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8E54B243429D2; Wed, 12 Jul 2023 14:27:45 +0200 (CEST)
Date: Wed, 12 Jul 2023 14:27:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	kernel-team@meta.com, Linux PM list <linux-pm@vger.kernel.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	linux-rtc@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	netdev <netdev@vger.kernel.org>,
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	Linux MMC List <linux-mmc@vger.kernel.org>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
 mechanism)
Message-ID: <20230712122745.GH3100107@hirez.programming.kicks-ass.net>
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
 <20230712080504.GA3100107@hirez.programming.kicks-ass.net>
 <CAMuHMdUMRS9_nJXp3rrWQrODRQcBQggze0k=0GjSScCknFmmgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUMRS9_nJXp3rrWQrODRQcBQggze0k=0GjSScCknFmmgQ@mail.gmail.com>
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

T24gV2VkLCBKdWwgMTIsIDIwMjMgYXQgMTE6MDQ6MTZBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhvaSBQZXRlciwKPiAKPiBPbiBXZWQsIEp1bCAxMiwgMjAyMyBhdCAxMDow
NeKAr0FNIFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiBP
biBUdWUsIEp1bCAxMSwgMjAyMyBhdCAxMTozOToxN0FNIC0xMDAwLCBUZWp1biBIZW8gd3JvdGU6
Cj4gPiA+IEkgd29uZGVyIHdoZXRoZXIgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGhlcmUgaXMgc29t
ZWhvdyBzY2FsaW5nIHRoZSB0aHJlc2hvbGQKPiA+ID4gYWNjb3JkaW5nIHRvIHRoZSByZWxhdGl2
ZSBwcm9jZXNzaW5nIHBvd2VyLiBJdCdzIGRpZmZpY3VsdCB0byBjb21lIHVwIHdpdGggYQo+ID4g
PiB0aHJlc2hvbGQgd2hpY2ggd29ya3Mgd2VsbCBhY3Jvc3MgdGhlIGxhdGVzdCAmIGZhc3Rlc3Qg
YW5kIHJlYWxseSB0aW55IENQVXMuCj4gPiA+IEknbGwgdGhpbmsgYWJvdXQgaXQgc29tZSBtb3Jl
IGJ1dCBpZiB5b3UgaGF2ZSBzb21lIGlkZWFzLCBwbGVhc2UgZmVlbCBmcmVlCj4gPiA+IHRvIHN1
Z2dlc3QuCj4gPgo+ID4gV2UgY291bGQgc2NhbGUgYnkgQm9nb01JUFMgSSBzdXBwb3NlLCBpdCdz
IGEgYm9ndXMgbWVhc3VyZW1lbnQsIGFzIHBlcgo+ID4gdGhlIG5hbWUsIGJ1dCBpdCBkb2VzIGhh
dmUgc29tZSByZWxhdGlvbiB0byBob3cgZmFzdCB0aGUgbWFjaGluZSBpcy4KPiAKPiBUaGF0J3Mg
Z29ubmEgZmFpbCBtaXNlcmFibHkgb24gZS5nLiBBUk0gYW5kIFJJU0MtViwgd2hlcmUgQm9nb01J
UFMKPiBkZXBlbmRzIG9uIHNvbWUgdGltZXIgZnJlcXVlbmN5Lgo+IAo+IFItQ2FyIE0yLVcgd2l0
aCAxLjUgR0h6IENvcnRleC1BMTU6IDQwLjAwIEJvZ29NSVBTCj4gUi1DYXIgVjRIIHdpdGggMS44
IEdIeiBDb3J0ZXgtQTc2OiAzMy4zMyBCb2dvTUlQUwo+IAo+IHdoaWxlIHRoZSByZWFsIHNsb3cg
NDggTUh6IFZleFJpc2NWIGdldHMgMTI4IEJvZ29NSVBTLgoKSGVoZSwgT0ssIHJlYWxseSBib2d1
cyB0aGVuLiBMZXRzIGZpbGUgdGhpcyBpZGVhIGluIHRoZSBiaXQtYnVja2V0IHRoZW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
