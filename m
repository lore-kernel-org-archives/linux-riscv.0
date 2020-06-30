Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032D7C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:34:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1968206C0
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:34:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zJE/d0N5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1968206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EkB4xMyWm9wHeLsUMMuTdR/e9+9YwqvboVsXi5dNnfc=; b=zJE/d0N5qS7gGTETh+o+ArLFN
	LFlVZGPuPJ8vxnlYswU4lBPK15vNf2nyqclqHt0HRwE/PSgnRjCGGdiveogUGA33y6Dxc21rIgk12
	MRiYc9AgGMDRPIBXYV0f0R5KLbMdJ4J4TLkE/BwIl9mkKPJ9vXmaywC0GvKn1NtqyvNDAbzSTG+Rh
	++paYrtGIJY6b5cTstuwTERkkSgu+jI1krCXku/MLiDl5HYkDuWknuq2I1cPAHd/eDsur7tDi5EHq
	RpE45ynCnTYdqnDboVLWi7QdvcD+h+rTdGaE4+Ju6uQQVGVgDniyVAB/pjsYumN4BaquDPZpLsE/L
	NRZyV5tFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqGOl-0004HN-T6; Tue, 30 Jun 2020 13:34:07 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqGOX-0004DR-FZ
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 13:33:54 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 62890ACA0;
 Tue, 30 Jun 2020 13:33:52 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: syzkaller on risc-v
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmtuysn227.fsf@suse.de>
 <CACT4Y+Y8=0m+Xku_+kQYuiiABgFUDzHBEqUK_FNGs8=f9NGZng@mail.gmail.com>
X-Yow: Look DEEP into the OPENINGS!!  Do you see any ELVES or EDSELS...
 or a HIGHBALL??...
Date: Tue, 30 Jun 2020 15:33:52 +0200
In-Reply-To: <CACT4Y+Y8=0m+Xku_+kQYuiiABgFUDzHBEqUK_FNGs8=f9NGZng@mail.gmail.com>
 (Dmitry Vyukov's message of "Tue, 30 Jun 2020 15:26:50 +0200")
Message-ID: <mvm4kqsn0e7.fsf@suse.de>
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
MDIwIGF0IDM6MTQgUE0gQW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBzdXNlLmRlPiB3cm90ZToKPj4K
Pj4gT24gSnVuIDMwIDIwMjAsIERtaXRyeSBWeXVrb3Ygd3JvdGU6Cj4+Cj4+ID4gS0FTQU4gd291
bGQgYmUgYSBwcmVyZXF1aXNpdGUgZm9yIHRlc3RpbmcgcmlzYy12IG9uIHN5emJvdC4KPj4KPj4g
WW91IG5lZWQgdG8gaW1wbGVtZW50IHRoZSBHQ0Mgc3VwcG9ydCBmaXJzdC4KPgo+IEludGVyZXN0
aW5nLiBCasO2cm4gY2xhaW1lZCBLQVNBTiB3b3JrcyBhbHJlYWR5LiAgQW5kIHRoZXJlIGlzOgo+
Cj4gY29tbWl0IDhhZDhiNzI3MjFkMGYwN2ZhMDJkYmU3MWY5MDE3NDNmOWM3MWM4ZTYKPiBBdXRo
b3I6IE5pY2sgSHUKPiBEYXRlOiAgIE1vbiBKYW4gNiAxMDozODozMiAyMDIwIC0wODAwCj4gICAg
IHJpc2N2OiBBZGQgS0FTQU4gc3VwcG9ydAo+Cj4gSXMgdGhlcmUgYW55IGtub3duIGlzc3VlIHdp
dGggZ2NjPwoKaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9OTE0
NDEKCiQgZ2NjIC1mc2FuaXRpemU9a2VybmVsLWFkZHJlc3MgLXhjIC0gPC9kZXYvbnVsbApjYzE6
IHdhcm5pbmc6IOKAmC1mc2FuaXRpemU9YWRkcmVzc+KAmSBhbmQg4oCYLWZzYW5pdGl6ZT1rZXJu
ZWwtYWRkcmVzc+KAmSBhcmUgbm90IHN1cHBvcnRlZCBmb3IgdGhpcyB0YXJnZXQKCkFuZHJlYXMu
CgotLSAKQW5kcmVhcyBTY2h3YWIsIFNVU0UgTGFicywgc2Nod2FiQHN1c2UuZGUKR1BHIEtleSBm
aW5nZXJwcmludCA9IDAxOTYgQkFEOCAxQ0U5IDE5NzAgRjRCRSAgMTc0OCBFNEQ0IDg4RTMgMEVF
QSBCOUQ3CiJBbmQgbm93IGZvciBzb21ldGhpbmcgY29tcGxldGVseSBkaWZmZXJlbnQuIgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
