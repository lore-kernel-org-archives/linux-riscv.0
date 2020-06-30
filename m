Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC629C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 14:01:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DDCC206E9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 14:01:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1nzystm0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DDCC206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IzGIlVN/mpWd+YjvR6DbIzdMp/WWmpTlVr4x3gI1VS0=; b=1nzystm0+X8AhI8lvI20PDdDy
	icCXYgU7Tb1/bvUqIIrB9ymz25d9u0PnCYwMObxCPiYlRtX+aEt68qdeDdEQkVgJOigXS+ybmm5RV
	4Yxw93WUA9LhwUTt1mjIspJj9N1EbwFghNkmDC8vaTHDJZNEnusnWVCETGJ2NT4Zoj7M8Gof60cfC
	uTymwionIhnQk2CDcaYY5VXcD0Lj8hR3Ejhnf0Rv46B6I4YwMEGi3MWefuQWTajcR+M9FkLxOTGUM
	WgnreOz6BqAtMCiMsgrEm4Urg3xRVnf+5laSaB9WWOJbgD0tjHlAzV3hLqQ/yiAH0EGbBc0rTJeGG
	TZMx7Ymng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqGpP-0006gQ-K8; Tue, 30 Jun 2020 14:01:39 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqGg6-0001Pj-6I
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 13:52:03 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E759DB5FA;
 Tue, 30 Jun 2020 13:52:00 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: syzkaller on risc-v
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmtuysn227.fsf@suse.de>
 <CACT4Y+Y8=0m+Xku_+kQYuiiABgFUDzHBEqUK_FNGs8=f9NGZng@mail.gmail.com>
 <mvm4kqsn0e7.fsf@suse.de>
 <CACT4Y+askdjyUjw=D6yqnOHy8n7N3h7QFs8KjvkU5DOHGY66Zg@mail.gmail.com>
 <mvmv9j8llai.fsf@suse.de>
 <CACT4Y+Z3hMtE0+BZVijxoBWrQDYiZBzM9gW6L7UAR74hsft4RQ@mail.gmail.com>
X-Yow: TAPPING?  You POLITICIANS!  Don't you realize that the END of the
 ``Wash Cycle'' is a TREASURED MOMENT for most people?!
Date: Tue, 30 Jun 2020 15:52:00 +0200
In-Reply-To: <CACT4Y+Z3hMtE0+BZVijxoBWrQDYiZBzM9gW6L7UAR74hsft4RQ@mail.gmail.com>
 (Dmitry Vyukov's message of "Tue, 30 Jun 2020 15:49:18 +0200")
Message-ID: <mvmr1twlkzj.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gSnVuIDMwIDIwMjAsIERtaXRyeSBWeXVrb3Ygd3JvdGU6Cgo+IE9uIFR1ZSwgSnVuIDMwLCAy
MDIwIGF0IDM6NDUgUE0gQW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBzdXNlLmRlPiB3cm90ZToKPj4g
Pj4gPj4gT24gSnVuIDMwIDIwMjAsIERtaXRyeSBWeXVrb3Ygd3JvdGU6Cj4+ID4+ID4+Cj4+ID4+
ID4+ID4gS0FTQU4gd291bGQgYmUgYSBwcmVyZXF1aXNpdGUgZm9yIHRlc3RpbmcgcmlzYy12IG9u
IHN5emJvdC4KPj4gPj4gPj4KPj4gPj4gPj4gWW91IG5lZWQgdG8gaW1wbGVtZW50IHRoZSBHQ0Mg
c3VwcG9ydCBmaXJzdC4KPj4gPj4gPgo+PiA+PiA+IEludGVyZXN0aW5nLiBCasO2cm4gY2xhaW1l
ZCBLQVNBTiB3b3JrcyBhbHJlYWR5LiAgQW5kIHRoZXJlIGlzOgo+PiA+PiA+Cj4+ID4+ID4gY29t
bWl0IDhhZDhiNzI3MjFkMGYwN2ZhMDJkYmU3MWY5MDE3NDNmOWM3MWM4ZTYKPj4gPj4gPiBBdXRo
b3I6IE5pY2sgSHUKPj4gPj4gPiBEYXRlOiAgIE1vbiBKYW4gNiAxMDozODozMiAyMDIwIC0wODAw
Cj4+ID4+ID4gICAgIHJpc2N2OiBBZGQgS0FTQU4gc3VwcG9ydAo+PiA+PiA+Cj4+ID4+ID4gSXMg
dGhlcmUgYW55IGtub3duIGlzc3VlIHdpdGggZ2NjPwo+PiA+Pgo+PiA+PiBodHRwczovL2djYy5n
bnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD05MTQ0MQo+PiA+Pgo+PiA+PiAkIGdjYyAt
ZnNhbml0aXplPWtlcm5lbC1hZGRyZXNzIC14YyAtIDwvZGV2L251bGwKPj4gPj4gY2MxOiB3YXJu
aW5nOiDigJgtZnNhbml0aXplPWFkZHJlc3PigJkgYW5kIOKAmC1mc2FuaXRpemU9a2VybmVsLWFk
ZHJlc3PigJkgYXJlIG5vdCBzdXBwb3J0ZWQgZm9yIHRoaXMgdGFyZ2V0Cj4+ID4KPj4gPiBodHRw
czovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD05MTQ0MSNjMwo+PiA+IEZp
eGVkIDspCj4+Cj4+IFllcy4gIFdoYXQncyB5b3VyIHBvaW50Pwo+Cj4gTXkgcG9pbnQgaXMgdGhh
dCB0aGUgR0NDIHBhcnQgc2VlbXMgdG8gYmUgaW1wbGVtZW50ZWQgYWxyZWFkeQoKPz8/IE5vLCBv
ZiBjb3Vyc2Ugbm90LgoKQW5kcmVhcy4KCi0tIApBbmRyZWFzIFNjaHdhYiwgU1VTRSBMYWJzLCBz
Y2h3YWJAc3VzZS5kZQpHUEcgS2V5IGZpbmdlcnByaW50ID0gMDE5NiBCQUQ4IDFDRTkgMTk3MCBG
NEJFICAxNzQ4IEU0RDQgODhFMyAwRUVBIEI5RDcKIkFuZCBub3cgZm9yIHNvbWV0aGluZyBjb21w
bGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
